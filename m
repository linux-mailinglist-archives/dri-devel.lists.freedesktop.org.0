Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNpELQcoemlk3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:15:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7815A39B1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FAE10E6F1;
	Wed, 28 Jan 2026 15:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fE7gZTBz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4160F10E6ED;
 Wed, 28 Jan 2026 15:15:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCouSj7T90WGfm/9CLOJ+pcrGkp7AWRVVKm8g+hRx6ZCHFs/7YP4PnD0rdbb1YlVp/lqrqbT0yJDAWlECA91pCiWyzbkARZjh6+7QOZ6K3jN8AIj/CszrWRbr2VPbJSOzJQVphT9Vmv6tXynKVVg2t88omaddFiilr44yxDX1HY1F+99KmEZg/I8KVdrnRMatZiG8//rOMxKTnqnUqfNrOjcAEJ6yS7Me0Gotm4kZibmYQxm2AOERs0lrLFO1hm5XkXVbQ9helYkx9CKRimCFXigZDVvA/4FG5vYhrW79B84hLrc4yROEzP+fVHt30YwrISFhMkktzPfPIFB4OU+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1muDKAupe7uBUL8u6E2Rl6lRTud3RqVQunGYltypilc=;
 b=O9KovexD1B/8wBwVMH4GEwV7kfmQ2QfvcGMBoWE12+P6O3npm7JQ9KMPbqL95E9tPkLs3xALAufERSVn2DIx/jgPSEWQpgOoYFd2xW9DMQvft3mZGYVLhNp9T0y8vGl+FKrLhrhWQKmJDD6nK/4ZUGAOEfUmBz/sKngO+vjHWMCbCRwCVT6fVHn/9xyp3dG7cAkS4cElG77TLj6fLgKbAF86yeKpe1F8MJaewzILU2sAYbOphuOpXgRZRFNSz2qVZHoV5WOlHr6nRqESU5sxdAvLATBpHu6uplml96gK3oIl3uC/7iHcwIB7etxf567qflwt8OlUIvgTMM9xc48IJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1muDKAupe7uBUL8u6E2Rl6lRTud3RqVQunGYltypilc=;
 b=fE7gZTBzeCygsuVFEyVspsG2lYLSmWYyR5+HhOfaN1TvM5enoe4ghvLb2O2ZrmljmXYY2HknUiHqL3Y/gGvZjnbwhqqGrCD0wtwvDbtOQFL+zP8wvQB3BBDnYNfbgOvAJKyWoF2lEvdRMYjdJHBbnGGg714RTfrL7Z9kV5jgQa4NczCaNArSJhRMOFGnRthR649DFe7bm/QdyOxkd+v57Wr59p0N2ntInPsdzWab3c3L2MI2BlUwxpi0Z6MsRlgY3MGjw+96uOIfwNobkHyi6cIZJLPeK1EaFeChHfjWaDXcDOo67c76UhGFqBDuYqMMVQOJEG98gKt8SAWfTW6QuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS0PR12MB8199.namprd12.prod.outlook.com (2603:10b6:8:de::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Wed, 28 Jan 2026 15:15:03 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 15:15:02 +0000
Message-ID: <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>
Date: Wed, 28 Jan 2026 10:14:59 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Dirk Behme <dirk.behme@gmail.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
 <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR07CA0013.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::23) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DS0PR12MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: a212eb22-46d5-4a05-b1ab-08de5e800275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2RLY25ia1VyMFkxdElVODVmNTA4VlB5Q1pjT0ZaM1kxaFUzNzIvbkM4Qmx6?=
 =?utf-8?B?RFUxMWJ3dm1HdDVPdS9COEV4T3RGREhGWmZlckNtZjdBWmtLN3NZNHRZTmtQ?=
 =?utf-8?B?dnNIQzM2MlREeE00Z2RMcFQyQ2JmRDlYL0JVYmhFNTlYdDBIUU5vMi9DMW5q?=
 =?utf-8?B?Z3pkU3VaL2g4SDd0U2QydWRBM0lnamorUGlBbXVISm5yUS9WUXhRemt2aGo3?=
 =?utf-8?B?cC96SHV3ZlRwU0FFSFFlRVNxallzWHJ4YnZ2ampkQnU0R0tMUGhoUlFrNnlm?=
 =?utf-8?B?WHF4eW80a0diZ25vaVZlMjd3RFNqdExQQncvZS96cEdKQk5pTW14bUszYkUv?=
 =?utf-8?B?Rm8zQXVjaGFXczFQMERMbnZyZUwzZElWaW9FQkF5MEo1Lzcxa09sVk9tUlo0?=
 =?utf-8?B?U29PN1BGcW81eEF3aFpja1hBKysvNHNTaVZETlFOaENhejk0Zm9ISEFVek92?=
 =?utf-8?B?eGtMTTNiNlFwZ2pJRHZ4cExKN0E5d3F5Tm9NOUN4NjdoUTZaR05JZUVUNDYx?=
 =?utf-8?B?dDVuZE9ralk3eXdHL0Y1aEdSRkw5dUNqSDlTS2ZiWmRMNkRxeENJTDNWWFpk?=
 =?utf-8?B?UzdRdG9xZUxlOWJnaWNXSDVSbzhVUXphejFSOWVwSVlGR0xudW9FajBWd0pE?=
 =?utf-8?B?M3Rmbk5lelNHMnhVZGg2R2NQMGVldDZQUEd5aDl3bW0xTDZwQU80ZkZ5dXRk?=
 =?utf-8?B?bHdBV1NFbnFHSmJ1bktvQzFhaWFwNnNFZFNlMFYwV25LVEhuc2xJdGFQalow?=
 =?utf-8?B?OHZ1WVcxL1ZJQ1IxUnNrUHB5VWU5R1paUTZ0SnFmUE5Qa3liWDJacUpWaGRv?=
 =?utf-8?B?ZkZ4USs4M20rZUhkeTVIR0VLZ0s1bDhGYkhlMHZpMXVReWpXSEZocjNLV2Iz?=
 =?utf-8?B?QUprQWlBRVZMQXVvWktXS24vbE5rZTVpUW5OWUtHb1AwRFRleks5aUp2SXFG?=
 =?utf-8?B?VXRZTHVaOVFFd1FOeVFGSjFhaThad3RyUGZVeVZMME5BQmgrSndhazlXV0RF?=
 =?utf-8?B?MklUMjkydUxEanZwZS92QmxKb3EweVJ3bk1QVjl5cnhiaS9RNjNvaE1EZ2kr?=
 =?utf-8?B?aFhzbEdReEprYnRCSVVQcVorQnFObDk0L3c2QlUxN2szZURUeWNnN1ozMkRt?=
 =?utf-8?B?cjBHTHNOQzJTR1JjMEh3RmJLRVZSY2wyaXp2SElXWGNFZ0M3ZVd0Y2VWUDZH?=
 =?utf-8?B?Z0FKTkZya2YwTEVibm5DZkM1Uk9HczF0a3FyaWpXMUJ6ZjQ0Z282TE80UkV1?=
 =?utf-8?B?bDR1SHoycnJzMTR3Y1pmSFBsK09VNTgrc1E4OHdKUExQeWZLWVFmQzRSTE1x?=
 =?utf-8?B?SGtWVFlmMzNSQ3BmTlNEMit4VGU4YWdaVmpaV2p5dUVnYm1FRFdOSjhkZko3?=
 =?utf-8?B?SWRyMTl6Wjdzb2dEcndGUnd4Z3lxaTVudGIzajhWeWhmS2ppOGJZTXVRMURn?=
 =?utf-8?B?NnA2ekZtaXZVbGVqTHRyQm41SzFveGFIemZYNGRCOXFzTThEc1FsSEUydTBa?=
 =?utf-8?B?UktYOElhYVhuUUtiUy9uenRxYzRwWmJyU3FyaG92UEpDb1AyazR3ek9VS3hJ?=
 =?utf-8?B?YlRkY2FGd1k4eFFDYUEveGZRQ1N6eE9aQ3NjaXhldkNkVjZTSExOWlZvQjZL?=
 =?utf-8?B?VHl5WkpFcWFLa0JmakZ3OVJ4KzdLNlA5TDU2czFxbzFham13MFNUL1E5Y1l4?=
 =?utf-8?B?eEl1QVIrNEdoZlluVTZja1hGZWhwdTlkbkxnMUh3dkhJR3kxQmlPeCs4ZVo3?=
 =?utf-8?B?TXEzYWRIVUdmSk1OT0Q0djFzcGtneFpNbGtQTDV5UDBqeHM0VFQ0cjRtbmtW?=
 =?utf-8?B?amgzQ2wxU1c5b3JKOVgwUWs4eFI4MW5MLzVhcDRsV0YrdmJHSGRIeW4rYVVa?=
 =?utf-8?B?Q1Z3SjJMK21CR1Y4N1U1WTJTWUU3TFJEODBNSXovZy9wY0dweHZHMW1nVEdS?=
 =?utf-8?B?TzhlQVNRSmZoWmNlK2FKYUlHY3JwN0pLM2FYdXBENmFsNFRhZmR6N2pWVmdw?=
 =?utf-8?B?cmRJN0diVEkxY3lrVnlTck1wOUNtSG44MHhMUVFXSCttcnA5K2lLM0JWUlpx?=
 =?utf-8?B?K2I1UlFwVEFpKzI5WDRyU3c2ZjloKzRWYmZOOVpwaGU0NGFqbHlWZjhnckNv?=
 =?utf-8?Q?4k0c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TklhczlzbGlYUUo0YTlRQ3oyUVRjRkJOL1VMMFlva2FrOFVrNXZialBaaGo2?=
 =?utf-8?B?dkM4QmpOZFZFbk52MkRKb1VNenRxc2M3OEd4U2YvSDVabE1veXdPNnIreDh1?=
 =?utf-8?B?ZWlJNm5TczhwZVViN3RLc2E0MXBSSlhyOVhGMnRmQmRhZ013R1lVdU5jdEJp?=
 =?utf-8?B?ZkhzTHpIYU9ORXlETjMrK25odWJkaFVSbitBYkZOVy9qRHZZVEZpZDZMZEJE?=
 =?utf-8?B?SlAwc2ZwT3REMkRhR2tVM3lrVkE5ckNKTnJkYzlQb3B2Z091YkRPOXpONDVY?=
 =?utf-8?B?Y29DUzRSUmVBb0l5cWo4QmdibjFwMkNoVTJkeU51blpKMWdVUEFJU3VWMjFG?=
 =?utf-8?B?eGVEYmoxelBoc3pZVnJ5R2VYdUVYcXJBZ2xqa3k1QnFkS3dFMFVhWFVMR0oy?=
 =?utf-8?B?YWNQYUlkL2FLUXJPZVFVNlJheUpkOEMrSjUxVjYzZVZ2VC93R2NTekRUQ0dD?=
 =?utf-8?B?K2NpdklMTElwS2p2ODRjb1Bad2ZBeER1ZW1CbkNVem55Zi9zV1dTMnVDOGdr?=
 =?utf-8?B?SUd4aXpIVkFlbU12TlJidW9vYndEYkZLaGVhS2lLL2h3OCthWDROaVdJY0Zy?=
 =?utf-8?B?eXh2SHhBUkQzelBWSnVaeHN1UmdyamFJYjI0ZXRzU2VXbnE0Z1pMSDJqNCtM?=
 =?utf-8?B?Vzk0RWNka2ZtUnVrZFROdGpxVjR3UEpKNFAvMFBpc29PM2tibWFvL0VkNFBR?=
 =?utf-8?B?bGlaRlFUQ3ZXcE1Vc3lyNE45RnlqYjcrOVd3V0dYaEFkL2REbkxQejN4YTNG?=
 =?utf-8?B?MWhlNllUMDZvTWJJZVNoUVk1SEt6YlRkNWtCU1R0bGZPRTNMMmFmVlkwZ1F3?=
 =?utf-8?B?NWZVL2FUQmVRL1FNZnlnNkFQSnJkM2w5alBiaUZVVG5URlVYWTEyTkRybHZz?=
 =?utf-8?B?NmFtTENtRThyUjViYTUzNnZ2K0tPYlhQUkY0Z3NubEg2NG1MSkNQZ1V6NXhq?=
 =?utf-8?B?TitjYlBmWDdhNzZ4b1Iyb3pDaDdWMWtIcW4weDJiRUxMc0daY1VQS0xBT2g0?=
 =?utf-8?B?M3FlS2RIUXpTSEI5Q3lSZy9iUWp6V3A3OHFBeTh2eDk1T0o5dkFuSmdTc0sz?=
 =?utf-8?B?QUhYOXJvTlVkZ3k0VnZURVBsd09Ebjk5S1JOSmo0MjZGSGlnWTRYanY0bkRB?=
 =?utf-8?B?elRtZDhGZVNOTG9uaUU1QjJTNUpPemZFdnJ2WWwrNUtJV0F1N09VeE9acy8v?=
 =?utf-8?B?NGtoM2Znem1iWU4rSlpPN09iNlBBeDBSbkFGWEc3SlRwdk95MXY2RGh6NWpW?=
 =?utf-8?B?WWE2RXZHYktySUlKcllyRlV4L1VIL3J0dG1wcHdJQ1JHODMxVHlSL3VhT1Ji?=
 =?utf-8?B?NVNiVEhPY0FXR1BsWDFDTWJQS1loeDc0WWtKQjJZU0s3NSs3MFU1VElNN3hY?=
 =?utf-8?B?LzdpOTlBaXU1aUxwRDI0ZjZxRHdQcktUWjF4bXVCMkxzY0h1OTN2S0ZiK1lF?=
 =?utf-8?B?SUN2OFdPTmxzYTVsNFRGRTNERjFwOTlyNi9vWmlTcFhwUzA4UEpvcnFEVnlZ?=
 =?utf-8?B?SXdreUFXeTNRVE9PRU1VZ3RpNDhRSzFpQTM3TDlmcklkT0ZFMFJMcnhRNWpr?=
 =?utf-8?B?ZEpaQVFja0hMUWJPNlZtcnQ2NWl2WTFQYzN6b3MxdXRsdWRGV0xNaC8yMVBH?=
 =?utf-8?B?emFtU2J5eTFxTFQxbTJQMGxyclN0SndFN05xT3JWQzJmNmY2Vm1La3lwRzhw?=
 =?utf-8?B?K2JsejNuMHhtWFZoZjN3Sm5weVdIbVRmZ3dLZk1xQjZ2YU1VYWkrOVNqKyt6?=
 =?utf-8?B?Tis1Y2NwVXNQeDhLSjFXRGljOGVISWgxR0dCdnowVERyZmN6RUNEZ0w5VlpY?=
 =?utf-8?B?OS8yT20rdCtxV3FFSWpnNlpTTyt5cGlkL1lJeTMvQXpGUzNQM0R6ZUtFN1BK?=
 =?utf-8?B?S1RFNXhwZUdPT1U4bHNxSjhaSEhWQVpwWnBvMXVKMFVmRkhwRmhGTTFWTWhx?=
 =?utf-8?B?QnpKYXp6WWZsWnZlYUo2cUlDU1FERjhZd2xkWWl3YjR1dUg2UjdoR3UwSXZF?=
 =?utf-8?B?WUU4NDdDa2VQemliM3YyK29FNnZGelphMUVJT0laUUZVUEFRc1BLSis1VmJm?=
 =?utf-8?B?cnBETGhCcjhSaEo0eWpabUFOSUNMTUN1cnpwa09OSG5YdUxjS1ZSMFdXdXJ3?=
 =?utf-8?B?Y2VLYnpnTUtJVnJMUU9Dem5oVURUN0VWK04vMTBNbmZkZ1R2U1BLNUFxMk94?=
 =?utf-8?B?Vy9rTFpYTHF5aTk1U0pSQTF0dUllQThCSkZ2V0xzTWo0bGRDM2c0VThsc3J3?=
 =?utf-8?B?NFN0YS9MWW1uak5aY0xFUWNveWlJb01yN1RnenBkMjlDYUxvWVJvNzRmZHc3?=
 =?utf-8?B?RFM1TDB5NDdDS2lsUVpSQy8wT1AyNWtDYjZJNlNoMExuU0ZwMDRpQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a212eb22-46d5-4a05-b1ab-08de5e800275
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:15:02.6265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cb/yu6sYZNCay1Y8kOi6z9t7GCg/zsZaoStpnHWrcTJREZKjI2HSCGXRMaxY0wlRNgKKUBGFVQ+SgN4C8hWFmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8199
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN_FAIL(0.00)[177.210.252.131.asn.rspamd.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid]
X-Rspamd-Queue-Id: D7815A39B1
X-Rspamd-Action: no action



On 1/28/2026 5:53 AM, Danilo Krummrich wrote:
> On Mon Jan 26, 2026 at 9:23 PM CET, Joel Fernandes wrote:
>> @@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
>>           let ucode = bios.fwsec_image().ucode(&desc)?;
>>           let mut dma_object = DmaObject::from_data(dev, ucode)?;
>>   
>> -        let hdr_offset = usize::from_safe_cast(desc.imem_load_size() + desc.interface_offset());
>> +        // Compute hdr_offset = imem_load_size + interface_offset.
> 
> I do get the idea behind those comments, but are we sure that's really a good
> idea? How do we ensure to keep them up to date in case we have to change the
> code?
> 
> If we really want this, I'd at least chose a common syntax, e.g.
> 
> 	// CALC: `imem_load_size + interface_offset`
> 
> without the variable name the resulting value is assigned to.
> 
> But I'd rather prefer to just drop those comments.
The idea of adding these comments was to improve readability. However, I 
can drop them in the v3, that's fine with me.

Do you want me to wait for additional comments on this series, or should 
I make the update and repost it?  Thanks,

--
Joel Fernandes

