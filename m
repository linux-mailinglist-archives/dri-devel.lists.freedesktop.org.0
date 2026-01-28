Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDNCLKn5eWkE1QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:57:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C91A0ED9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B56210E00D;
	Wed, 28 Jan 2026 11:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cOtSW5ew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012008.outbound.protection.outlook.com [52.101.43.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DF810E6A3;
 Wed, 28 Jan 2026 11:57:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pV+I5HJki5+7WkzLeaM4zONsPucPFHhRegESmmdEmQyRvK1wQOTXF7dHTnOw671o8lA26h/OB3HB7lkWmAuw4SQSmIGgfE+ROx2Aba6z3XR0YBQadxEBUvdetx55ntPUPm/GbQ+duO10fycpIm/II7uXhN4QuktU5W5XG8tJCWOm+eWRdUO2Fneez5SgiWRQ2Pkxzx6Q5tRuSB2+BGxJyFAg0poeV7lil+LDyXGwyMwz3oYRg3rwKtsvjaAyFPjjZMXrBhv6WCs51mq9t2avY0IHCgjrZYjpTiLsvPoYp8gC689j4fBpkKYRX6SL+yUIYWP54r8yGpL7vBgApwPkDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCwkLuHH9NvoR0ilJBdoe3InBewjywgNfXlOoWDFmLA=;
 b=jA6bRR8/wu3tjoyCEeg0dPXkjGanBZw0VaA+a3VGo1nbsKfnvbJu4G3C1Ny21c4FiR6xv0HNHENYBjdktztZoUX4t5ZkS/Rrjwko97T5xNljRoQs8Y9eLTH9WOqPyH2mumMOo/FR6j/Pb7v7n/5yiwbrVkhYRl0BGqAY+7dBdFoIJTp8rI6AV/cS9PQdExvRZ0I0/iFOhn+pnZ7zkAuV8p2df2dSigsc+cTgqIYdY8bUIHXAfXTrtoR0H6GMu7zdi87pfUhC61t9wP3OLanVgCmzV+pbEFTMixQT1h7AOss3EA/bCaa9xoLWBumSUgRo/Qp6+ukMJXhMtVML8tpPXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCwkLuHH9NvoR0ilJBdoe3InBewjywgNfXlOoWDFmLA=;
 b=cOtSW5ew/B+Jzmdx3B4i1NZtEb2PNlztnSPKfmJsw/JKlQiXtwo+JtCPbzt9mLi5B7NeOL6v7T2s6UiD3sLFmEimw7opZlB7sZANfJwbJMNkEEMjDzevNdmdNlFjtmswmO8j8zcH2Wgc+XsJkNF+AX9lvv8KzNE+QN0rwEsqNAT7GZF2LfbaQz33/RHuHqfVr3sBuyBag89FtONnARXrx2lK9gVQffEAMJCCL1/0uG3i4dA9VJfuxgM9r1VPJyfCidvEUHevO/FpJFMq3K7P6ADIF6u8P6vbioqNUv0c957X2ToaxrFRB1OKCgxbRI5X8IB5oVdS1tSzYlKA3z2L7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 11:57:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 11:57:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 20:57:16 +0900
Message-Id: <DG07CT51EYWN.2ENZ61XNALL0C@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] gpu: nova-core: gsp: fix improper indexing in
 driver_read_area
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
 <20260123-nova-core-cmdq1-v2-4-e797ec1b714c@nvidia.com>
In-Reply-To: <20260123-nova-core-cmdq1-v2-4-e797ec1b714c@nvidia.com>
X-ClientProxiedBy: TY4P301CA0058.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 234f91d0-f6f6-48ef-056e-08de5e6463c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1gyM3k3S1hOdkxKMXg0ODlrN2JDT2F5MU1pZEkwZUVnc3JFdlBSbDZRTjRi?=
 =?utf-8?B?WWJMK2lVQndreTlQZ2pLQW9MeDdOR2Rwd3FzRERnS1lGajI0OFFoZ3JhMEZj?=
 =?utf-8?B?L3YyQmU1TVlxQnp3dXdGdDI3MjBxUnljL1pFeFlWSjNrRFdBYUgrQ1ByUXkw?=
 =?utf-8?B?SmJDVTROTVhjbi94SVI3Vk9iVWxNblVUbE1ZNGEydE9jYXNnWkF3TkpmUDdS?=
 =?utf-8?B?VEVTMUJPY0RsK21kOGsxN1g2czl3ajM5SE5UUC93MEl4SzhDVDhxRUJGYjY1?=
 =?utf-8?B?MGlablF3U09OS2xQNVhFVG1LZ3o2RnR2cEdKWGhRRzU1eTNIU3kyTFAyeW8x?=
 =?utf-8?B?VTRZRDVPL1A5L0c4UVRaWnI2ZWlHNUR6bmViZkdQVFdZRGxiL1Zsa3V0SnRy?=
 =?utf-8?B?SkZiWlc0bDcyVVl4dFhTQStJTkdXVEN4WHBCZG5oZ055Y2ExQ1ZIUW1kNGJu?=
 =?utf-8?B?OHpMWi9FWWFCd2hjZFMzTGZDamg2c3pvYjdLSWUwdFVtMGg3RCtvWHFOUGor?=
 =?utf-8?B?QnZDN3ZXU3RNcUlkU2RvN0hhcFZRN2tUN0crMnU0MFBRNHQvQW9TREM4ak1H?=
 =?utf-8?B?cExmazFlY3FINyt6TFZlQ0VENG42bWoyUXg0ZDMxdUlIMmNnWlBoNkcvY0pF?=
 =?utf-8?B?NnNibHJ5aUE0VWpzVUdHaDZLZ2hvRUorU0VWenVuTzd4UXRxQldzZGtoUytG?=
 =?utf-8?B?dUhXcjZoM0lNZS9TTUdHck56ZWFFMmdCR3FZVkh3K0ZYZUFpNzBQZ0xEWWV2?=
 =?utf-8?B?YWh1SWVxNm9XaVY4OVY1d0dTWlJ0cEIzaC9hUS9kaithNGNFOStTWkdBQWxo?=
 =?utf-8?B?VjM4M1FDTFhQS3VXeU1VVCtqbEp5V2RKdUhzOUVPWGkvR2o1YVNIL1NrVUZK?=
 =?utf-8?B?WFRacTl2WHdSS1lSM2hRVHJuTXBTZE1rS1dvZXMrTVNWZ2E0d29aS1lkZFdC?=
 =?utf-8?B?Tlh3MEljeG9USHpVdk40cTdMN3BKbFEyRFRMS1hzWHJiQjczUEdsVnEwc2Ev?=
 =?utf-8?B?UmdtZ2FSR3gxQzlTKzQvNXRlU0JpQ2Rsc3pjdkRDQ2FlbVF5MXhKZVRTSVcw?=
 =?utf-8?B?V2I1YkVpQ2NKZ1Y5M2gxRTlMMzZMVkwxL3JTdDJ1TEtNVU42Q2tDaDZZbzln?=
 =?utf-8?B?T1hWdDdDRXZsQ0pyNWlBMk5SWHVaTG5iMHdNSEF1T0dlOWZoU0FSWllEVzc5?=
 =?utf-8?B?Sjk4cDJvY3M5TlQyaFBHOTVNVFc3STc5U29FVERBMmQrZ3JqRFljR3QyNDhu?=
 =?utf-8?B?Wk5Wc1d0U2JEb2Uya0JZaGtkWm84V29hZ2RjNzR4cVZ1VzlPaDZiVkN0ZUNM?=
 =?utf-8?B?V2svbFd1c3g1VG91dG9pd3JlTFdyekNXQ0VBVHBJOTVkWlNuVVQ3ZVFZZys0?=
 =?utf-8?B?Rm5yaDNRRERQU1AvdDZiS1FmSXMxMXY4RG12amh3UldOdmxNbkpwclBnZ3R6?=
 =?utf-8?B?c2svSGU4UDRhSVJPY3pHM1hwS0ZHRmxkNlZPbkNNbDZBbnpYeG9EdmVIVjBI?=
 =?utf-8?B?UHE0N2Vla2wyUyt1TkxKN3lkU2VDTVUzTHkyMVB0eitKdnErTm9aMWo1R0VH?=
 =?utf-8?B?d292cXdqQk1naHRpL25yaUFjWlBkVGhzQjUzMXEycXNIVUhRUjZxU1o3dXF3?=
 =?utf-8?B?VGw2L0w0ZXdnL25KeE1SYy9SZkgyNG1GOUd4RkhtTENQYitIRjlyRVd6dERD?=
 =?utf-8?B?UFZjU25mSVlQOUFMU1BjblFtc0NhK0J2MmNJcjNNN1BkRXhLQ2JEUmV5ekJZ?=
 =?utf-8?B?Wk5yeDFZdlRteVRMKzU3S1dwbmhaSmNFQkdWd3k5NnpSTU5xazBsd3FMSW42?=
 =?utf-8?B?TXJsenhlNnpUSXFJNUZZak5SZXZlMTNyVjNwZW5nUmVPUlhtbXVBY2RpWWZ2?=
 =?utf-8?B?V2kwWmNYN3ZMaEFibmFkZXFKcFdodlJGWkxNWkZNdlZNUHYxdHJETGJkblZn?=
 =?utf-8?B?bndSMzJVeDBOZ1ljb1JjblZERjg1OUdsMmNrUlBzMkVwRXV3UHhBYVlQQllq?=
 =?utf-8?B?ZGVXUGdzMnRzcC83N3ovaGNFMTArYUpUU3MwV2lyM0RmOVZMc0dIV2dERnll?=
 =?utf-8?B?b0ZMT1liV1BuTTlsaThTSGtLclV6ZDhTUzNyMmgrdHRLWHBSajNrR2NoTjNs?=
 =?utf-8?Q?ZV5g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUJ2VmZsdUdqc3phbzh6M3ZxSWQxamRGNHVydVlWenFpSEo4d28xTGtTTEl5?=
 =?utf-8?B?T1BCWE14cW14VEJUSHpTT1FYdURqK0VGNzBmTjVGaHpvTy8zOEVYTmdqcE8x?=
 =?utf-8?B?RjRqT2ppbHp2dnVzRG5QYm85ZUlkVnF1S1pQR3VqVGRmZ3E1RVpteUJhMlRx?=
 =?utf-8?B?Q2wwNjVnTml4NjNwRmkvNnUzUFR3eG9xTCtOMXBtMGl1amF4M21pWWV5Rnhm?=
 =?utf-8?B?bExDVllRUy93UjhiMGFGMENCQXJCN3ZXc1hoYW1pRjlqTTJ6K1JEdmw0blho?=
 =?utf-8?B?VGFGai9LMkNQN2hiR2tSUXNmcFNtdzVXdVF3eDlDdmNrejdYc2xLSVFTZExV?=
 =?utf-8?B?UUZoc2R4WTlYdm1UbHBaN2ZJb3VWMVRTQVFPR1dHOHhzZHpyQVN2b2FYaVRt?=
 =?utf-8?B?VHZaSlV4WjJDZUJ0dmYzK2hoZS9zaC9Ta3ZwdXZaTk5DZklTcDZQSmNxNG1w?=
 =?utf-8?B?dXdVa3BKZzgrai9yVERydjRUazMwUmN4SmFZTTdFb1REb1JFaytCRndjbWN0?=
 =?utf-8?B?M2JGOG55N2Q0M2RBUTMwdngvMkRHeDVUY2lUNGlCWitmRjYvR1RPTkFwem5t?=
 =?utf-8?B?SFBCRkd2T2NGTVRjYUFZNmNrdy9VMk5qTjhFdHRYN1N2SG9xMUlPU2lzSURP?=
 =?utf-8?B?MzVla05EODl6b3NpUWtEYTJVc1Vwejg0TFdHbXl6bDdBNG9QV1RPNHdla29F?=
 =?utf-8?B?aDl0LzdHZ3JHdi80a2VpeVZKdFlEc2poNmxBU29kT3dzNnY2c0lpZjBaMlJM?=
 =?utf-8?B?WGNHOERFck5VVzd2dHJ3bjJ6OG51cklkWGxEaFVoSDk4R01QRmVQOHVYWndL?=
 =?utf-8?B?SWtMU0s3bGswcXdaWHRvU0h2blQwSnBKd0FLUW90ajRGb0FpY0thNnZJRW5n?=
 =?utf-8?B?V0F0MmxjY2ZtOXFKMXYrdzRsNTd5ZDBMYzY4eExtMmxEdGRyMTg1cjFCTi8w?=
 =?utf-8?B?NFZGdzdZS241YnRwcmZ4N0JoZTd4Z3dRU0tpSjFUdk9ZNFBqZ2FXMGNCcG42?=
 =?utf-8?B?dGVBaHVXT3R0VVhzckZGaCtLVkhpWXQvRVlFR2xyM25VcUdDdVcwbzdwVkxF?=
 =?utf-8?B?RHhnN3MyZkZMNGNlM0UvbkhtKzRQdEtVOHNDSTlGUW9mT0VEdHpydzJvMHNz?=
 =?utf-8?B?akRKWFZOUmhJS2hzZUM2bVJHR2hiQW9PVnFmVnllUWlqczN2M2pYOGNlZUNC?=
 =?utf-8?B?QlpseTlsNldVcGZiMHBsV3lFZ0VTWXViNHV6U2NzdC94NzJMelp4eUNMSVJn?=
 =?utf-8?B?ZFJsY2l5dE9vZFJWbURIWXBzYXhkL1RKV0t6MVp1bUdXd3NqSmNjdFRZdWRE?=
 =?utf-8?B?WmdhbEY5N1ptOTBOeDY2Z1Bsb1ROQmxKWllDRFhIK0g1MXR6Mm5MNHdqL05u?=
 =?utf-8?B?aTM3K1p3Q2xybzBTOXI1NkpVTGNTKzVHTWllTzVONGd6cnBjdDBZQXpEbEpB?=
 =?utf-8?B?bkg1VEs4dVhCaFd4ZnFxb3gvNFcrdGxab0UwRjRtL1FRRlFGSDArNWl4VTJU?=
 =?utf-8?B?Q0hBMTRYVGtVaTNsMmxXcXpjTThDS1h6cXlDRzNnSnRZZWZCUm0yM3FhVzZq?=
 =?utf-8?B?M2d5d293K3YwODZoYnhFblIreXd1UTVQUklrSUFlMjRxM1dtVE51ODR2VVBz?=
 =?utf-8?B?WWFtV0xRQ0RGS0FXUncwdlVXMTZFZzlDTUxXSjVSeTYxc0JzU2RzbkNVQjFP?=
 =?utf-8?B?bkxyR250VjRrOHhuakJDdjV4YzVNeGQrS2RESlNCblJ0SUljaU9CZTRMMllu?=
 =?utf-8?B?MFhVZ2R1UWRDVHo3ak55YW5WL2lUd2ltZmZGQmE5N0lUdkJ0aDVmZnBlZlpC?=
 =?utf-8?B?VWlYOHpkRnRHNHBhY3ZNeTVQZi9HOUU3a3M5Vk41RlFmdFViYTJ5bS8xa0FS?=
 =?utf-8?B?UUt1SmYxS0grazljbmN4QW9yQ25qbUMySDkzZ0RXUHh1SzRPY1FQbmg0WkMx?=
 =?utf-8?B?aWVOZVBxNE16VDdXbzNyYWQxb21IYVE0SDhEVDRsSmp1dFRTT1dsWm1iRUND?=
 =?utf-8?B?WjN5dUFsMDc3SGs4bDVlL01ENnlVSlBQdHI2QnBPaGNwVmtiN0lnT3ROOXI2?=
 =?utf-8?B?dk9RdXAwWlhCV3YrakZSUjdIeE95b25ET3B2S3VnUExLN3pVeXJnQlJsK0J2?=
 =?utf-8?B?QW4xb2oyY2dvaTh2ZjhzeGtqQTlPTURNYVZwMXJZdDlDaG5mbFJjdStsLys5?=
 =?utf-8?B?SlA4SDJSRnNXZmhsK3dZK3Z3dFM2SXVnNUtucHcybXNBcXduQnJiNUlXcERC?=
 =?utf-8?B?dit2RVN1MmdockxDSlpsRmNRajhyUFVTWXJQeVgyQTA1NHFTWXVnWndDc1Ji?=
 =?utf-8?B?K1ZaUDM4aHo1UmRYeTg1SHE0OXlzWkdOYk9qWkF3RWpkT3pmcmNVZ04rWTBx?=
 =?utf-8?Q?4r87TcQMchYI3mxCDZSfUzufcxLA/gIH+1/YUenTfnYHv?=
X-MS-Exchange-AntiSpam-MessageData-1: 1401MJVPFRCKmg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 234f91d0-f6f6-48ef-056e-08de5e6463c2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:57:19.9990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBMdoPnil4f1ZwuCd/t0WGXZZoRp/CO/0drfRSkl7V5L03jcdQkbucPFSvf6Sk+t7FSjfwEfgGyAJYsIE6Hicw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[131.252.210.177:from];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[dri-devel];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[52.101.43.8:received,2603:10b6:610:28::18:received];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 15C91A0ED9
X-Rspamd-Action: no action

On Fri Jan 23, 2026 at 9:12 PM JST, Eliot Courtney wrote:
> The current code indexes into `after_rx` using `tx` which is an index
> for the whole buffer, not the split buffer `after_rx`.

Another dangerous one! Well found.

>
> Also add more rigorous no-panic proofs.
>
> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings=
 and handling")
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index aa8758fc7723..c26396fda29c 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -1,7 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
>  use core::{
> -    cmp,
>      mem,
>      sync::atomic::{
>          fence,
> @@ -267,10 +266,20 @@ fn new(dev: &device::Device<device::Bound>) -> Resu=
lt<Self> {
>          // PANIC: per the invariant of `cpu_read_ptr`, `rx` is `< MSGQ_N=
UM_PAGES`.
>          let (before_rx, after_rx) =3D gsp_mem.gspq.msgq.data.split_at(rx=
);
> =20
> -        match tx.cmp(&rx) {
> -            cmp::Ordering::Equal =3D> (&after_rx[0..0], &after_rx[0..0])=
,
> -            cmp::Ordering::Greater =3D> (&after_rx[..tx], &before_rx[0..=
0]),
> -            cmp::Ordering::Less =3D> (after_rx, &before_rx[..tx]),
> +        // The area starting at `rx` and ending at `tx - 1` modulo MSGQ_=
NUM_PAGES, inclusive,
> +        // belongs to the driver for reading.
> +        if rx <=3D tx {
> +            // The area is contiguous.
> +            // PANIC:
> +            // - The index `tx - rx` is non-negative because `rx <=3D tx=
` in this branch.
> +            // - The index does not exceed `after_rx.len()` (which is `M=
SGQ_NUM_PAGES - rx`)
> +            //   because `tx < MSGQ_NUM_PAGES` by the `gsp_write_ptr` in=
variant.
> +            (&after_rx[..(tx - rx)], &after_rx[0..0])

I guess we can also use `&[]` here (maybe convert the whole file in the
same patch).
