Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD00D3A9A2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:57:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC22010E128;
	Mon, 19 Jan 2026 12:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="ZjrNGAua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO3P265CU004.outbound.protection.outlook.com
 (mail-uksouthazon11020136.outbound.protection.outlook.com [52.101.196.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9662D10E128
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:57:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zHUWIMhi0Lrtg5E+eotxnf0GHedCfeH11u5Xm90VswATWT6GhfkNAunWQKOJ8dWzd7dAFk81f8ML8LVwMFQlZdXLVILzGaCF1SxOxp5gubuQlSPrLQCUyUu7DkSyAb6xjRR9k+SoJevHvuF5mR7GpdRYr84U8EoVH9NwIkvCvdJwxa7WOmxevL6oK7T/KHGyXJO2mT3U8AwPYxL+o/FZ8ta8+uqKVsLVuaYh3oz/k6vlbTtFqqpHeFqkN+f5MQQXmFvP8RJ5bUbfJloCJb2jw9445MJ8/2KLvDNJSRDsQa6kY+9uo0WUvENvCNGXN2wtxIOxZoBm/NRmGM2nOwSj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvFRwoVvr0grXxd3hRdGcj7Dj1HtmdQ6CJ0HayQ7kK4=;
 b=sXoEqYLdFfnbfEyEFKm9GUAN2mgSbGiEViXz8mykje2G+eaKP4DoluGjOuNZksqKMSGv2ftscmXmrHnYBdl7Z+K9XLD79LK5qoSUEQNpB1iRXI0sdgNIwRea6k3iMH0rmxtNMzVUphRVgkGrPZ01Gxzos/PI32RdV6B2nxstEbA0rW5pm3gCnFUpMJZu7sprce+2kJRcLWampzI14h5i5nUZbB7wzKXQgpmNLleOhX4LoZMk08X/4OFe0CXD4vkxNNYxP71ZY7sGyUDXcfYZElaMnA+cdDOW+OOabrmcvL05XAYADHayBMfwPVId4syg23wdZqzno0+Zp/YOjHmusQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvFRwoVvr0grXxd3hRdGcj7Dj1HtmdQ6CJ0HayQ7kK4=;
 b=ZjrNGAuar1N3ddCFc2tPIRM0RXPWGwhxCdTULXkeaD+xkQjBXJa+rjdCUy2SGTLzgvZLsSm3IreS+lFvz8ZMjExD+JEJ6MwtDPNIHu6Uw3BtpyhPf4E5Qoe1AUFANhooYiKQJE/l+PVVpiZSn6iSxEu7RsJslgBvslhQPCIjfRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB5744.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:270::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 12:57:20 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 12:57:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 12:57:19 +0000
Message-Id: <DFSKZW10CRAW.1547Q71WU0B0U@garyguo.net>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Drew Fustini" <fustini@kernel.org>, "Guo Ren"
 <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Maxime Ripard" <mripard@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com>
 <20260119-thundering-tested-robin-4be817@houat>
 <aW4lCfUyumOKRRJm@google.com>
In-Reply-To: <aW4lCfUyumOKRRJm@google.com>
X-ClientProxiedBy: LO4P265CA0316.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB5744:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8c6cba-2724-4494-c0ca-08de575a486c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0JHdVppOVcwRWh1bmczcHpDdXlDMGFaN3Z6ZnZtYlR2L1kycTFWaVV6bkt0?=
 =?utf-8?B?d3BGZkIxNG1yKzg2U3ZxeWhkMkxJdUpMMVg3bXVzKzFleVlHTjlPeFFGcXA2?=
 =?utf-8?B?ZmNBM0dabUljUHVnNnhHUDMzRHc2eTErZFVmb3dicW5wdFZIbHRTbEVJNnZQ?=
 =?utf-8?B?NDN5TGpEQmhIR3o1OExmYjdoZ3BSY0tjdEZwOFA3TWxEQkMyL1VFRUQ2M1JV?=
 =?utf-8?B?YXBmK2JGRW8zdTI2dW8wb25Mbjc5UU1LbzVnL09XTlRUZFdqaVQ5SHBpSkZa?=
 =?utf-8?B?cndxUnlkK2pTL2RvMDNSNmFrNThpYnNnUEtYeTNWR3pDNzJJVHRyUWJ2bm1H?=
 =?utf-8?B?c2xkM3l3S0didCtoK2RBRzVPb1dRU0g2N3U1Q1R2SEJscDBCR1YzanY1cEZ4?=
 =?utf-8?B?WnczSnhTSHg3czVvZGNBSjJFdlgwU3lSRjVjVDFtTHFBWmpLL01Gd1V6YTl5?=
 =?utf-8?B?dGVTNlJwR0F3TVRpN3JUZm1iVUlYMzVPbGNTcHRIQ1ZPVVA0dWtORTNSMDlt?=
 =?utf-8?B?ZGZiMEYvNEN2blRWU3diYlNkMk9Idy9EVlIrRWZsTEE0eGdQK1hZRVpGYUZV?=
 =?utf-8?B?VzJoYlRRbXNtVy9oSDBZYjFQQVFyQTZnWEdJQlZXeVp5azlQenl5Sll4S2VJ?=
 =?utf-8?B?NWowenAyZHpQYWtvZE00Si9rMTI1Z1JuRWkvM1dRbG5OYlN1c0VJOXQ2YWpo?=
 =?utf-8?B?TTdmekFla3NZSGRJRWpSVVBCTXNNa3hrOTJEMURTQ3FwUmg0QjJGZkc5VS95?=
 =?utf-8?B?am1Pa2xsdE5GRVhOaTBGVExSNGhNeERhLzMrVGxqNFRINXN5d2R1TmlRYXZC?=
 =?utf-8?B?OWhzL2VJWEVPM3pFeWdRTkpMMkNlVVFXTHZMUzhOWERydU8wbXFKMTlTd25H?=
 =?utf-8?B?TlRFeVlCRVh1YW9Zb3NwYUhDb29BTHlZRlNkTFMzeXFkVWZBekVRMlBiYmxv?=
 =?utf-8?B?SGxuY1NpUWl6V3FKdFFkYm1CeXdrQk1HYXIwWW55Yzl4ZWRjMVgwMWdGWHhu?=
 =?utf-8?B?bFdKZGJ0YTJkR1J5UWMvbmsyYURCZmg2TkRaNmpaNzloQVVpSTFRZ2lGZ3Bl?=
 =?utf-8?B?RlVNbFlJSXZYWWt3K2JHVStISW5UUit2UDJBZkRSMi9PdHRoRDhqcXI4bG1k?=
 =?utf-8?B?bTVxaHJ6S1h1WkRBcStYZHYzcTJMMWFxUWJJSnZmRXFHeTMxMURicVlhRnpY?=
 =?utf-8?B?dHRWQWRrT3l1ZTB6bkF2MGxuZ3pWc2lxNXYzVmVRNmVGL21mNG9PTU1UR241?=
 =?utf-8?B?UU1yWGl0NHJ6akVtQzhFd09kNTA1MTI2RHZHZGhRTS81OTkrVkhtSmdlVlpU?=
 =?utf-8?B?SzFOTWIxYW1KL09CdFVYR2pUZWhrUFR3T0RtNlI2TjhXektMUW9zaGJFTjJI?=
 =?utf-8?B?ejlWMUxyREpyOWJ6UnZkZUEyalp3eXM1R3VhUTlCTHBoSUUxdXZLMTNBakdu?=
 =?utf-8?B?emJFQ0pncm1HZElHNFFhNUFhU0x6MUdFbncwTCtUa2FxTm11dEg5TUNJeVdW?=
 =?utf-8?B?SWpPRzlNRVhVWDBPVG9HRHlNTWxJRWd3NXVSMHNrNnpudWYvNVRRVUdyc2Rr?=
 =?utf-8?B?bHRpaHplWW81bFZxdThBeU9rVHlhNTFORVQ2R3J2QUxZZDljWkdNcUJLWHFG?=
 =?utf-8?B?dWFxN2Z2czl5eU9RbVZSRm01RFdFaW5VdjhWUkt0ellHS0tPZ3pZbU9zV3Fu?=
 =?utf-8?B?VmNqWm9SaXROdzdVWFA4bm9vTUl0MndVZ1hWS0V0OHF1R2NCNFhBZk8xMkRi?=
 =?utf-8?B?V3VDbTc2ODdVeVEyNHNYVmpTSEpsN1hjeE9ueUlkZElpcytnVGdxbkIxNGpy?=
 =?utf-8?B?MmFMcU1RRTZPa3lkVXREUTdURzArb3RvNVZqdXJKcjVSc1lLY1NteWplTFY0?=
 =?utf-8?B?SnVNamtidEpWRTNQam0ra3lDUDN0bEdxYmZlSHRmaUtJb0tTUlNndVFzNDV5?=
 =?utf-8?B?STRCblNSQXBTVldnc3FxTW8yMjdRRk8rUGp3SU5LU3ZCUkRKY1VNVFBTV0RF?=
 =?utf-8?B?RTNjTEtFNUNja3hTWCt2eGtyaHJFN29UZWlVekVpNktBdGpScWxOekwyZ2I0?=
 =?utf-8?B?TlRIVGlnYzRJQktYVFlFMWhyRWY4SkxGTERERG9MS2RDd2ZRakQvU08yQzZR?=
 =?utf-8?Q?2Taw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmRiVExxR2IvWTh4N0lHdDlibURKMzkxdEdHZElyVUh2ZkFWaDBaUFlOSFl1?=
 =?utf-8?B?bGkvRmtmcUZ1VXBjZXIwRnZUbDhvM2o1aXFwRXk4RzRGdWE3UStBNVVVLyto?=
 =?utf-8?B?V2NzNElyak9ENmllbldCUkVyZUREZHBVU2pqMDI2cFozYmNLb2tMVlZORlJa?=
 =?utf-8?B?ZUkwVWVZdFd3a0REa2EvaUVQTDZ1THNmVUt1RGhKenorMjJEa2tiM1o2QXZo?=
 =?utf-8?B?Yk4xdFgwc2dwaHVUZkFpb2NJZWFiYWlzYmlUbTAwUW10TDIzcU9ldEJvMEdV?=
 =?utf-8?B?ZDUrc1R4M3plR2x1d01vVlorZlgwaFJ3SkgwODNhaDJIeTkxN1l1aERRUVZQ?=
 =?utf-8?B?MUFTV2NqNkhJWUhBVW5RbmtVaWlrYzk3L2NGRkhsQkpTV0w5TGZyd0ZUdWFa?=
 =?utf-8?B?aU9hMG9yUDBWbjJxZnNLZ0oyVlEyeG54VmdhNXVMMVJXZVFvZlhKbGZDS0lx?=
 =?utf-8?B?MUNYSnhpaUhicHBSRWQzRlRqdzhWUVNSVjk0YmZtU3lnaGtuQ1VIanltUngr?=
 =?utf-8?B?VjBreEVGRjZ1L1lWdElZdlR5VytSY1NTVHZSWEpuTm5naDhZR0xPd1hJSlJm?=
 =?utf-8?B?eEdaYnovaFgrZkMyVU51OG9MVkl3U2dVeTNnZTFaSWhRQWxWdStSNGtZSDhN?=
 =?utf-8?B?MGZlNCs1eG1MczNVdksvcWpNRWNxYjBSTjQwU1VMcjlINHdvQUErOWZsdVlT?=
 =?utf-8?B?WEdSTjJmUWlKUzhSMThGZXRFb2cyYWNhRjRKNUNOaFhRd21aSUp2VS9QNFhj?=
 =?utf-8?B?ZkQ0TWt2Ti95MU82OWtWejJqckU5VGgvZlZjRzlwUFgrRnNCRTlRcWZMek00?=
 =?utf-8?B?UnhYVXhjVUhjdnhZVkFtSDJuRHk1OW05RjBCbTlWZFRmNW9Ka0I4dXFXdkJi?=
 =?utf-8?B?RFhuSUQyVVVxbitSY2x1S1U0ZG1yMWNxUjNTM01GMSt6V3BzVDJ0Y0RWMU9T?=
 =?utf-8?B?dGtQNk85ZHloU0RWd204T0tFVjJYV3hhM1VNRzN4bno2WjlxcHovUGpFWEFN?=
 =?utf-8?B?RzRpSjd1Tk1BVmk1dTRTeXlKTW5Uc3JHOGR1RlIxMFNGMkUvV2VGMmtaOXhT?=
 =?utf-8?B?VENoNEJEWjFBNnNLbWhxdlYwUldJVm52SGdnVmN4UXUzS2l0RG9qaW1MYzhK?=
 =?utf-8?B?SDdtaXVKY0dsSDIzUFhMQkNvcGRabms0OWpIeXRBUVFTUEc2YU93d0ltN2l4?=
 =?utf-8?B?Tm9OZ0w5ampxMmZqRUNiZ3ZsaUw2R1RRQTJDak5EQ3hZZHJ2bWc0YTdFaGJz?=
 =?utf-8?B?Y2pmMHIyZW12VUM3Wmdab3RxenphdW9wdWZEWXBMN0E4MjZzaW1SdEJ4NVBp?=
 =?utf-8?B?SWZKblNYc05sVzJOakI2b0RTUENzS2d2Wml5cE9sRWV5bjNHenNKNlM5b3dz?=
 =?utf-8?B?OUYxeVFDK2wyc3dxVDVUSm5QdkU3RzZHNE5kUlVvS3J5REpRMVFKbWVXTFY5?=
 =?utf-8?B?Mlhncm5YRVYvRjBLd0UyQllIY2IrVHA5dTZMY2dlYzJzSTdCMCtwTmZDcmVw?=
 =?utf-8?B?ZHdPcUg4WS8zM3pCZVFyOGJ2dzFjL2cxS0tRb1BwMG5FVFJHeGpqVHg5K3Q4?=
 =?utf-8?B?NDFhQ21HaUQ1ck1xOXRGV2NwOUxZM01kTVdZWjdVVlhPRU41aXpuMGdReEJJ?=
 =?utf-8?B?dW90L0kvemNiQUt1SnBvQ3JYSGwyTWQ0bXdocTlFNEJReE01UUZWR3g2TThl?=
 =?utf-8?B?SmJPelcwVVdnb0ZVZmxZbFNNRVZ2V3hIYVEvOVVDaVk3QzJML3I0c3RZWVdD?=
 =?utf-8?B?N3FhYnVoU2lWSEFCdFRsbmZ0YktzWEJUdTU0bm1xQlJwNmY5cXVKZjgva2ZD?=
 =?utf-8?B?S0tKL0FKQU1UT0YrVGtab09FZUJMWTA3bk1SeXNRS1pvWmx3eTJ1TWVaV21H?=
 =?utf-8?B?Z1lRZXJDREk0YWU1ZzAvblZvY2FERFFuUGhPRHloZVV2eHJKYVVhcGk2VTBx?=
 =?utf-8?B?cnNRdklTem9SeGdCcTZ4Um1LRHk3Snh6K25iL3hnQjdOa25PYk5qN1Rndjl2?=
 =?utf-8?B?YWh1OUVES2N0b3ZBNUZRamgxSlVyM1k5SVI4QWRnU2N0WUI5WjlxRUtIMkhY?=
 =?utf-8?B?QnB0aC9WM09ZckFBeEFoZjZFNHdzelJvVFBOeUg4QmhpRk02RTVlQUtPNUsy?=
 =?utf-8?B?TjlnUU9rU2hzQ1I4QVdybkIyWDJTRTBCTjVJSlYyTnVCWUk4RDl5NVE5L09H?=
 =?utf-8?B?T05YUlJuTjg0KzZ3Ymt0YkpWcHpKUDNtM2JRdW1JUFlNaHBrSTZjYWRXMGdp?=
 =?utf-8?B?NWtSbHhDdC82bTMrRGI3QnZRRTVVS3B4RzNaaW1wcm1Kb0dmRmNuYk1hcG8y?=
 =?utf-8?B?SzFNTWVqdFZKOE9ZbGkvbkt0Nno4K01HL3RnUG85bnRxLzNYSE9hQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8c6cba-2724-4494-c0ca-08de575a486c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:57:20.7695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxg1T0i2ArR1B+5rh6SbG0iPigXbP1k1KIaqwLupA6zy3iYyhbiSwXFZCGyIru9Z/F4t7N1jLIXDz1UyzqRWJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5744
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

On Mon Jan 19, 2026 at 12:35 PM GMT, Alice Ryhl wrote:
> On Mon, Jan 19, 2026 at 11:45:57AM +0100, Maxime Ripard wrote:
>> On Thu, Jan 08, 2026 at 11:14:37AM -0300, Daniel Almeida wrote:
>> > > For example, it's quite typical to have (at least) one clock for the=
 bus
>> > > interface that drives the register, and one that drives the main
>> > > component logic. The former needs to be enabled only when you're
>> > > accessing the registers (and can be abstracted with
>> > > regmap_mmio_attach_clk for example), and the latter needs to be enab=
led
>> > > only when the device actually starts operating.
>> > >=20
>> > > You have a similar thing for the prepare vs enable thing. The differ=
ence
>> > > between the two is that enable can be called into atomic context but
>> > > prepare can't.
>> > >=20
>> > > So for drivers that would care about this, you would create your dev=
ice
>> > > with an unprepared clock, and then at various times during the drive=
r
>> > > lifetime, you would mutate that state.
>
> The case where you're doing it only while accessing registers is
> interesting, because that means the Enable bit may be owned by a local
> variable. We may imagine an:
>
>     let enabled =3D self.prepared_clk.enable_scoped();
>     ... use registers
>     drop(enabled);
>
> Now ... this doesn't quite work with the current API - the current
> Enabled stated owns both a prepare and enable count, but the above keeps
> the prepare count in `self` and the enabled count in a local variable.
> But it could be done with a fourth state, or by a closure method:
>
>     self.prepared_clk.with_enabled(|| {
>         ... use registers
>     });
>
> All of this would work with an immutable variable of type Clk<Prepared>.
>
>> > > AFAIU, encoding the state of the clock into the Clk type (and thus
>> > > forcing the structure that holds it) prevents that mutation. If not,=
 we
>> > > should make it clearer (by expanding the doc maybe?) how such a patt=
ern
>> > > can be supported.
>> > >=20
>> > > Maxime
>> >=20
>> > IIUC, your main point seems to be about mutating the state at runtime?=
 This is
>> > possible with this code. You can just have an enum, for example:
>> >=20
>> > enum MyClocks {
>> >     Unprepared(Clk<Unprepared>),
>> >     Prepared(Clk<Prepared>),
>> >     Enabled(Clk<Enabled>),=20
>> > }
>
> I believe you need an extra state if the state is not bound to the scope
> of a function:
>
> enum MyClocks {
>     Unprepared(Clk<Unprepared>),
>     Prepared(Clk<Prepared>),
>     Enabled(Clk<Enabled>),=20
>     Transitioning,
> }
>
> since mem::replace() needs a new value before you can take ownership of
> the existing Clk value.

We can provide `replace_with` in the kernel, it's fine as we don't have
unwinding panics.

Best,
Gary
