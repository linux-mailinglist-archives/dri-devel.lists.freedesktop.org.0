Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOSkNnZRl2nswwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 19:07:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440E216179C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 19:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307CD10E72F;
	Thu, 19 Feb 2026 18:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="i0dD31bL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011063.outbound.protection.outlook.com
 [40.93.194.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5876710E72F;
 Thu, 19 Feb 2026 18:07:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+qDqB39A2b1YjCvdu/svW8oX6gdzA6ptXXCvLjx6ibNgdI+gWOpvsNeNgMcNFcR6611RUgWxcSd0C1/m5C+fEKD7WlZQ3Ng1NKhLLo9qOxPw/W0i3u3uO8nj6I9uwFhtA00ZNYrG3AJVj3mvB7fntHPB9Er9se+Xcso367oNb/1XU6VRVA/PqZ8kmAuwamPBGGIILGlUeYXcdkQsGYZUxCRkSPE4OpyypQgJV5ztO5TvZBPN9+k9PZpktloiXCW57Ttrp54SvrbvyiQMKY1ckJgCtR5aGyWgn/Ct19UNCNKgiehrKUqQQ2/h6N4WS2xZFJgO6IbLnfqB6rT/q+NOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMmd9RG+1Q4C9q/2bJ8J0qDER/sqP8XUnrMQyltwNhs=;
 b=NFaO784P9k78icJXT7+bvwvZ9yxv8oDpDqfON0kVxF+e8e+OWx9xvKikqnpJRNexOTDovwe1EBgIOuSn5TDBfeqc7IO90QOGhj+oSK2j7bo23MJ3dMjLOUvJZBjqNiw+TKOvtIgeVKIHCimy+v+0CC5zq5BVxAQWVwUOT2sqpix1G53XHgczIKSapXrSP1GXz1sG23Lbpxdq5Hm8hA9gQhucGCy0rytIh2QsyvC9ju5XFhNSzmyroKgjIZbM4Bkc0XxSf7wy6rBxOOv7TGT/ExOFtkoF5SQAw4WyMc2yXNX30SgDuWappMUDFyTu3oLq4B2mQRm9BILpb6AYTvpgfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMmd9RG+1Q4C9q/2bJ8J0qDER/sqP8XUnrMQyltwNhs=;
 b=i0dD31bLMDervYGHHVntRMPGyaSBuERcv6uO4J04XueJDH5Kt4fcCQPFulNCduFoI0BwIZUxtL2spXDtPXGG9PUfe5uPSF6hL1Auc5A74xRKCnRO7ndkNbYIsL3S3PjtraH0B3FQ+hEnH53bnNTxNo0FOZERerFUUmzcQiwBKr2qOXrb5oFBYG4ydoP81RxG+hgZj6AWjLwr81IrZrkc9xv17rtMPWQlBl9OkEUXdVFE28urksXvfbI9h2DECsi1qp9I0HBZFVNDZVQbMG08/PFMKuitwvzLlTPv1xxJFy+LDP9CN0Imocz3oEp95Bfz93d+cdTPsuNNXzzJHMMvkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB7871.namprd12.prod.outlook.com (2603:10b6:510:27d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 18:07:42 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 18:07:42 +0000
Message-ID: <6a2b1bbe-7a36-4162-9110-a00eed69f156@nvidia.com>
Date: Thu, 19 Feb 2026 13:07:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:208:160::29) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: 95fee5e2-2113-43f7-7dfc-08de6fe1c695
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVE1a0pKS0Y1KzJuNUJ1R3NTbUtOejlBYVErYmQ1bElUQkpYTlJNZ3dXV1Ey?=
 =?utf-8?B?YzFSSDBXSndBbC90QVVTM051UHRVYzZKZXNKZU9wNkdBcDhxSTNHRVJQWXlJ?=
 =?utf-8?B?djNDK3JkbjdocTVDNm41ckEycjBWNTNKdm1LUXRiQkRURGNTTC81T0xlQ3Y2?=
 =?utf-8?B?ZDNzNk92MDZJMFI2QkdrOWFqajMvR0ZlaDczSUlwemk2Um5nVllHV0ZraXJW?=
 =?utf-8?B?ZWxLTjJlRGM0L0RoT2hEdjF3UnhwdmxxTlJhajVtYnBZYTk3eGJLOHhXYVFI?=
 =?utf-8?B?ODlUNFFJWUNTTUhzNjdYYkxaaFk2TnR1TUxpZFhQc2ZuWHM2RUN3N1Zqb0p4?=
 =?utf-8?B?UUZmVW1MZUR2eGZmbGg4TEEvdURseEZFZTQ0NFRtS1FsbFRSZDEvUWJkT29w?=
 =?utf-8?B?dGp5UVZ6RHZzNlY1UXd6Yk9zMzlNZEkyZXpQTlVxMDNCK2RPRXlQVzlXVDY3?=
 =?utf-8?B?SUlIL01JT05CV0NqK2twWVFFTlNrSWV3eVdGTDFyL0xyZ2pYVXlMNCs4Ynl1?=
 =?utf-8?B?VjJqTm9mRitwQndpVGZ6VitmblNFRjVHaDBsZ0YzU3VMY1ZOc1JYTm1OREpC?=
 =?utf-8?B?dWhyYXd1TG5ZQkdBUnorMjl2cHdUU0N5TmdBamE2TXpuUFRJVXgxN09DMDVy?=
 =?utf-8?B?dEYxU0Q0akxLd2kxZ0NGYkxNQ2FKMGlmclRNeG8xanIxc1R6RndPaENIcklH?=
 =?utf-8?B?azR5RnhXMkRZRktIUU1GeFNPWTJiNlJVNHBSY1o3QXdPUDVYM1NpYXZ1enh3?=
 =?utf-8?B?OE5vZ1NvdUJBY3FMM01iNlA5UmNhc1lqdm12cURhYXZQVFNLK01EaEJvSlpl?=
 =?utf-8?B?cDhkRllrblZmREkzVk1Ncnh6b3lvTWdmdFdBZWpCR2MrNkdHancyL2VOVTRo?=
 =?utf-8?B?b1p0Y0MwUC9YWFQxaWxYK3dpV1dCbGREYklhcHphYUsyTHdCTFdVa245SGZK?=
 =?utf-8?B?ci9md1pRTGJVVVg0UGNoRDhySUd6TUhRQ1lIZjFrYUJleHU4bWRuM0M3ZWFw?=
 =?utf-8?B?S1lva1N6VFdSRTZLZlNEckxzSURRZE1ZUlJ3MmRzRmVseVJoT21pRlN5UlJS?=
 =?utf-8?B?T3VTSTJITHA0dEYxN0pZQWpuaWFxV3I0dkNvT3FYTUhlUG5rNzkxbFJZNlIw?=
 =?utf-8?B?STI1M29MSlU2RUp2VE42N2pwUFFQSDBtOG9rSTgwSTl0WUpTYVhEbS9rR1Nm?=
 =?utf-8?B?a2dGcDlIMFBFMXdRVUxPUUZpQktnTjZmd3Y5UVRVMzJ1UlljZ1k5RWFDMVlq?=
 =?utf-8?B?b3llbE1VSEdpaXZ2RWZFTnR4UHZpOGVzMWZrTXJCdElFMXJmL25FTVd5dExp?=
 =?utf-8?B?Z1pseWZSK2VoZFhXR2FnZGlRazFRMThQT2xQWEVTWXdvS2lxY1FRZWpObTV4?=
 =?utf-8?B?dTYzRHZSWkF3T3Bjd2xaRGhYVENnVTl5cWhpcko5amhUOGd2SE16NXJXUXRl?=
 =?utf-8?B?bVFDWDNYUzZ0V1RGWUc5c1dQSDQ4cFVHQlJ0WHNza2swS1lEdTM2Ly9yQWZ5?=
 =?utf-8?B?QlNjVUptUzFJbzJjeGg4WXFiOUkrTUdiNXlqL29ISGovTzd2TEtNQWpwSTRF?=
 =?utf-8?B?dTNVYnlkM3gwOElPL1piMjJ0dndpQVhETnZRdjBRSG44OXZmN0wyRnFxdlZD?=
 =?utf-8?B?UDI2bmlQemRKWGdGL21ob2laSW1oekNwM2ZIVDFxQTcvMEVBT0l0MTdZUDNW?=
 =?utf-8?B?VDgyMUs2TjM4MWxKZFlhcEJ6ZkR6V0FaekVOa3FhZVBnRWx1UktlL281SXJB?=
 =?utf-8?B?UVZ3RGtYUjlDd2cyTE1Ed0NtTzNRbmtacWZBNE5td0tvMVh6QVlkQi9TVHpZ?=
 =?utf-8?B?eGRyNzFkMUdoTnJjNGFyZ0pDOWcrdU1KNTdOYkFYdXE4UmYvYi82djVYci96?=
 =?utf-8?B?N3VSRm8wQ1Q0RVBmdFZGMDlpR0svbC9JUzdVcWF3UDV2bU1EaW1CWlgxdERB?=
 =?utf-8?B?U01zcEVZRGlERWsxU0NPcnZuV2xscVJISEkyRW4xTGJuUm9FWVpiNFZwZVhx?=
 =?utf-8?B?NXcxb1pIOVRUSkFpcDRFOFF2RzlmZGUxVHpIOG1WRVg4N1UyTmFWWGtISlRY?=
 =?utf-8?B?K012cjdSbUV4TUlRVmxBWHlkdmJ6enRYeElRaFQxRllwVkxQK25lNm9qMlRZ?=
 =?utf-8?Q?TGKU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnkzUVV1enluQ1grSE1xeXpOMFA2VXhLUGpwL0tBSGVCakhZdGNvK1ZPMk51?=
 =?utf-8?B?a2M5UG83UXJUaHliNS9Ody9DTnIvZXZGNnJsVnpLalArWnBJcXlxWFl0alY1?=
 =?utf-8?B?VW54V3RUSE1QNmhlejBRelhMZlYwRmpoR3dlY1J6Zm9yU0FTTHBZTU9WL3dD?=
 =?utf-8?B?MzU0Q1N0dk1KUW5RVjVQTW1DUFE4ZVAxdXYyVktZRUFRRjRja1ZOblE4MDJN?=
 =?utf-8?B?NzFzWk5RMjFPQ1hnSnc0TUtBamJlNUlPOG1meFM3MGlLeTA3T3IycTVyUktn?=
 =?utf-8?B?ZTl5MSsxNHpTWWJvMjRxdm1XeDhpeFF5cytydkgwTVFaTWJrdHlrcnRKYU5q?=
 =?utf-8?B?d1NmaHd1T2tYbE1EYjgxOTVxVDhPMWV4MDNEYUdRNVcyNHFxUW1BYjB4OXdq?=
 =?utf-8?B?TFdEbGk1MlFiMUxlR0VzQnlMd1diclVVNkw3SXNodndRZmpQaTFpb1lDZlV4?=
 =?utf-8?B?UTAxbndVenVNd3NWSHZpVGpUSEZlcVdLMWJHMHpncDVoaysxbVc1Q21maFRm?=
 =?utf-8?B?OW5ncVRSenF3elprc3NMclMrcXpuMFk0OFVJbWM5Y01tb0tkakJDQzdBQ3Rv?=
 =?utf-8?B?WmFmWGxPeGZxODBrd2JVNGpNbnBMN3B2akIrZkc5VURKNnVDQTQwYm9lK3Qw?=
 =?utf-8?B?L083d3dCemlqYWxrT2pDQzBrb1p4aDhQbXBmNHJZY1JQUTQrVDJ5Qi83T0Vt?=
 =?utf-8?B?TWdCYWxwaU5rYjVRREFLRDI4MnEwWmx6cHhuUCtnNWpsd3V2R2ZhNzFCQ25D?=
 =?utf-8?B?a1ZVbjExYVQ1ZUF4Y3ZmOVkrMTJGRncrcVBwN1RvL0hFdmtVSXNHM1U1c09W?=
 =?utf-8?B?R2o1Z3J0cFVMYzFaTzBiZkVIdnkvU0thd2FEUTFrNk1hY2Q4VE9zODl4czJ3?=
 =?utf-8?B?U3c3UGY5NFFVQWdtSjJMbXNFU0t6aGU2b2g5ZkxBUWZwVkxybG9RQ2FMaXMz?=
 =?utf-8?B?eVQzVjBGZTE0dlFaNElKaitTOUJhVUdFQjRjeUJ1dEp2WmlWbVhKaTZ0MFcy?=
 =?utf-8?B?RVNsamsxQjZYNlA2WUxDb3B1c3ZEc1JzUnVnVHRMWWJTTkNpWU9jdnV6WTJ6?=
 =?utf-8?B?QzYrVzR0K0cyNEt0YkU4NmE1bGN1enMwU1o5VzMxYUVlSFp2alhJMnU5SkRu?=
 =?utf-8?B?QUxuWG1PWDQ2SnlyczhVek9NWit2UWRkc05CbVZPaHU1UHJKOFBVQzdEaGE4?=
 =?utf-8?B?UjVYS1pnMk9BbXVoOUtTck4vcDN5R0ZtT3VFMXdHMFAwOGRjcGhxM252QTJO?=
 =?utf-8?B?VmJ1K1o0WmkzclVkdGxjbG5Uc0RFcjllVXE5SW9FM3MxM2hManlyem8zbGwz?=
 =?utf-8?B?MUUwQXIvTUUxcUg1YTRLa3pMZVYyQU5aN0pNcVRrb1lqd3JBdG5jakFtWkhz?=
 =?utf-8?B?WXN4cTZwSTBFSW5kaXloK2xSWVEveVpES0NlMXJ6aXR5NHNUWHQwQnIvMk5L?=
 =?utf-8?B?ckJkU1lXKzFaNXpLKzVobXZ3QWZBMFk0YVpuc2xFc3hIUzZPb0tDd0drNHVK?=
 =?utf-8?B?bmdqSEM4cWFZdUF1WE4vUFMvV2w5b1NDN0xOK3JmbFBJSXhGVUtGUE9NbEJQ?=
 =?utf-8?B?VzFRbFNnSkdpd25PNnhtSkowTXRmVWo3WmhPNjRDaWZhWkVMdnhJTU1xN05Q?=
 =?utf-8?B?NXVLM0pGZ2JiRjRnOHRvV29YL2ozQ0VSSHhIUG1rS3d1NitIdzIzRCs5Qmx2?=
 =?utf-8?B?VStDRGlqN0V5Z0hydmJpZ3ZmbHNpdHBzaHFKZ2ExM25FS3hOQ2VXTWJSVE9P?=
 =?utf-8?B?MGY1RTFFaW5HMm9yZ3RmLzNpT2sxOC9UTXB4TVhFOFBlL3BBTGV6SUgwK3li?=
 =?utf-8?B?YWRESTlyd3BLYmhma3JPZ3lzbEZOYW5KMDZ2ZS96NmZyN2JPMndBZE53MWpq?=
 =?utf-8?B?SWE3UUVja2xCejVyNTdHcjBXYitUQkZFVzRtRzJJOFNERndnYlcxc0pUbTZk?=
 =?utf-8?B?djJISkhwS2FwRUhRY1BBNzhXVVhvaytITVl3cExPQjhpQkNrRlc0MEVsNTgw?=
 =?utf-8?B?UDhsOGNpaHB4VjltdDlCeERKSGUybDdqMXBsYlJ4UmEwOFlQdUp4MWRzeTJa?=
 =?utf-8?B?eEVJY0ZiQ3Y5YTZGVUQwUTZmU0pjNUZGc2dEWlQveUZWT2VuQ21uNld2Q3ZF?=
 =?utf-8?B?ZDNTdFF4QW9LNXpBS0Z2S2lORFFRSitRWnowV2YzWWJLMXhUTDZ5L1BXTis5?=
 =?utf-8?B?bnB2WXp6WEdBMm5FSEk1MkJpN09BUTkrNXExZ0hYdE1vNWlEWndaNERwc2RX?=
 =?utf-8?B?TzZFVjdhLzRvQWs1dGlTa1NRWWtRMDE1RExOVWtldTY2S2NEUjhhQXVNSVVT?=
 =?utf-8?B?L3h6d1BlTzYxOTBlSjRlcFVTenUrLy9jV3RzRWN0ZlBPakFwb0lSZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95fee5e2-2113-43f7-7dfc-08de6fe1c695
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:07:42.5216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBuvvTVuRDuD0B1boMwJKlkBWsES7Eovj2hqUUD9BBgS7Q5Mfs7rvVm3L6x8igDU3Hl9l9NwJC8K9SQ7Kuk9Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7871
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
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 440E216179C
X-Rspamd-Action: no action



On 2/19/2026 11:24 AM, Danilo Krummrich wrote:
> On Thu Feb 19, 2026 at 4:44 PM CET, Joel Fernandes wrote:
>>
>>
>> On 2/19/2026 10:27 AM, Joel Fernandes wrote:
>>> On Thu, Feb 19, 2026 at 12:21:56PM +0100, Danilo Krummrich wrote:
>>>> On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
>>>>> +RUST TO C LIST INTERFACES
>>>> Maybe this should just be "RUST [FFI]" instead (in case Alex and you want to
>>>> sign up for looking after FFI helper infrastructure in general)?
>>>
>>> Good idea, done.
>>
>> Actually, I am not sure we want to commit to entire RUST FFI infra though its
>> pretty tiny right now. Most of this infra right now is clist, let us start with
>> keeping it as is "RUST TO C LIST INTERFACES" ? Or we could make it "C LIST
>> INTERFACES [RUST]" sections.
> 
> I feel like it makes a bit more sense to have an entry for the entire class of
> "RUST [FFI]" infrastructure.
> 
> I could imagine that we will find quite some more cases where an FFI abstraction
> layer makes sense; at some point it might even go the other way around.
> 
> Once that happens, I think it would be good to have people looking after
> intermediate FFI layers in general. But it does not have to be you of course.
> 
> Maybe we can create the "RUST [FFI]" entry already with the following
> constraint:
> 
> 	RUST [FFI]
> 	M:	Joel Fernandes <joelagnelf@nvidia.com> (CLIST)
> 	M:	Alexandre Courbot <acourbot@nvidia.com> (CLIST)
> 	L:	rust-for-linux@vger.kernel.org
> 	S:	Maintained
> 	F:	rust/kernel/ffi/

Yeah, this is a good idea. I am Ok with that. Alex/Miguel, you're Ok with this too?

If all in agreement, I can make this change for next revision.

Thanks,

--
Joel Fernandes

