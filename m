Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F01D32229
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 14:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556E610E8A4;
	Fri, 16 Jan 2026 13:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="rF6ADrav";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU008.outbound.protection.outlook.com
 (mail-ukwestazon11020089.outbound.protection.outlook.com [52.101.195.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD8210E8A6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 13:53:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdeZdkqERTuhrZ8bEF00KxgdA5yzRopujpIptSPX3DfI7lTLMz0IhOfjH/mrPj8KwHD+Ska7fy+iN77nFtcX8NBFItMlyKxOe6Wdbnk+ANvYlbXk8Bha4XRQJkK3fW/2dzfbyrXHlNy0c+CD9nCNzSWiWUdGcRSIWX/bkannWvKVpISDjHSfTnynjUD13m71NE77gUzTkQW68AUhAD31XRxCFJ2mAf7H88URva7X3Z8zKnA9EETvnPUOyhn9Y/TCrKydyQ21VgbLwMBnXpx+pTPcHZf8lHYDlMntRqZfgd1iQfw9njLoUyVJuullJZTxkInD2pFBGPf2DbdgZ7XmeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rYjiJb8TZBwCZ3DioqZDO/AB5eMdSNWJueRCyjqDGo=;
 b=FPIJ6Od0shrSNZJv5Ds+Gzdg24o61NysnRQyUJXnDv8nQhYhFNnt+17jW64RuHu/DzgHfSGmQkyO3SQDLLqL6cxGzb63OGuYEKXy9t8dINvDCyNcEd7aPGYRtNAamsa4BadF/sT4sU7a2fcHDtiZZpI6WFiECKaelQ9i+zHKGj79oKHuV8UYbyF2dSf2nudWarhYl7eggler0fP5OeRJ7+SJVf1RwWg0iRlfLfUsnuDsEN2lt6vt2/dyAYVazd5HPB4ntAsAd/c0XWzcjCHNQ7hmi4MTgEGtD2x2ROvKcN9XdTsaJP2YCp8nm+7y2SXe0swLmI5/N0oUsztCJRDibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rYjiJb8TZBwCZ3DioqZDO/AB5eMdSNWJueRCyjqDGo=;
 b=rF6ADravmVECXRby1DzGBsLP+lv74SYumeLX6IV374qMTWVXFvRUGRCEivkmiJUqAThTBbEbmpcZ0Ug7Jg0/JNeHxY5KPoT3GvWLvb0kxInOcd/OhsSPHab9w4T76PkVtTTXed4Onj1XjbJP+qg/uPEYLqkvfe2CPBrm2vJhT2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB3631.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1bf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 13:53:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 13:53:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Jan 2026 13:53:10 +0000
Message-Id: <DFQ2B06J0U0T.M8K7D98WCZYI@garyguo.net>
Cc: "Dirk Behme" <dirk.behme@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Steven Price" <steven.price@arm.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
From: "Gary Guo" <gary@garyguo.net>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
 <A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com>
 <DFQ16QS1RAEL.1Z0ESXE0MBA7G@garyguo.net>
 <25EE982E-B03D-4C50-B973-34AC4FFA96B6@collabora.com>
In-Reply-To: <25EE982E-B03D-4C50-B973-34AC4FFA96B6@collabora.com>
X-ClientProxiedBy: LO4P302CA0009.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB3631:EE_
X-MS-Office365-Filtering-Correlation-Id: ccb8a65d-214d-4ef5-4eef-08de550695cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWU1MFpDTVQwaHMweUpSWWJaVnhIUFZzY0NkV2thYWxWWTlrVHRqVWhqRFhU?=
 =?utf-8?B?elVSVHV2a1piUnlpSjlrR0hCOVM5S0RtaXpqbnl0dm13cCtwcDhFY2s3Nmlu?=
 =?utf-8?B?SDE0L3IvdkkrZkM2emh3eVZNS0hQMzQ2d3hUeDVhSmFhNjBGWHRIbGVqN0lY?=
 =?utf-8?B?c3k5S0JGMlN3NmdXaHlxUk1aNHZyOUIzSkg4VVQ2cnA4enBsOVlXa1hIakg4?=
 =?utf-8?B?OVFPSStPQWljZDJVb01EV2ZxV1VCbEZuZXJ4MW5JMTVnQlNYZ0FBbDg1bDRS?=
 =?utf-8?B?NWk2ZEZoTytZRXpTd2ZpdGJLVDNLUzBneGkvbTYwNG5xaXJ3YnZJWGVUNUVE?=
 =?utf-8?B?bkV5YUJiZlk1VGtaWm9CdU5YbVp6MVJUQ2ZvcjA4STVoNVZ5SGxHV2NWZ2NI?=
 =?utf-8?B?ckl2Yi9RNlE3OGxFWTI5bFNvV1cxQzVVclZmdTFTVm9WdTJuR3RLMy9udWlH?=
 =?utf-8?B?ZS9tTjhIVy9SdGJBeEozaktkSGdFbDBwaG5vK3RDS0puQVl3QU44b2hNWE9h?=
 =?utf-8?B?MnA5OWVrejFESUc3NGg5UE9DMURheFdIVksrMk1ySmNEQkd0c0RCM09DbVhy?=
 =?utf-8?B?K2lGUmtTMmFnb2VaZnlpSmVtMG85MDdFL3hWTWNUWGhOd3hvdTJGR3R5WDlr?=
 =?utf-8?B?RG11Qjg2ZGJMZVBxVnB1QXJOaU9UOG1VS1MzNkhUUUhwSzE2eUtoUlFaSGVi?=
 =?utf-8?B?NUNYNXpLUVZUZk0zRk12TDJTWFJkbk8rRWdMWExIQnhsN1NBQkxYMHo5TmlJ?=
 =?utf-8?B?SXRvT0dTN1AzR1dkdlFucWhqQVBTcjlSZ2laWjNvS1pGZnJYYmNiTzcyUkZx?=
 =?utf-8?B?S1c0cUdrekhUSVF4MG1WeXVGRkloR2JoKzM3ZzdENEpaeUdQdk9XQ0Z2czY2?=
 =?utf-8?B?aFFnN0lxYW1ZRVJ2bUJwclBHc3FWT2ZFaDc0NnFPSkN4aHJLZDJEMlRwSnFO?=
 =?utf-8?B?MVg1TCtEeFNzNnZ2N2VMa0lHbDROTHhrbXFWZzZtcC90QUQwSGtqbWVMRTRK?=
 =?utf-8?B?ZXJGajZKYXpEeml2M2ZpSk5kV3BNeHpXNGxiS2J0QWhXQjJEamJrS2ltN1N2?=
 =?utf-8?B?WVMrOGwrVEE0alZkUGZ0SzhEMjIvTXVYcTlGbmt3cys5bCtrVnhsN08rdU5w?=
 =?utf-8?B?L1pVdndqY2krcjRraXZZK2QrVis1VFBnZkR0NitiK2NINTNKaWwrMk5aOCs1?=
 =?utf-8?B?Q3JtUHBwU1BFTFB4VjVXa1l6ekpPMEtxRklacHg2d2cvOFZtMG1lVXRSY2dD?=
 =?utf-8?B?blJCSUFDdTExNUx3akZGQU8yRHRDVGJVVElRbXYwWURvc2xOK3IwNnFYa1Rh?=
 =?utf-8?B?Z3RkdGZQOWI1VXlVUmsvam4vR01ZMlpOUmpHWjZDS25kZEFaU3ZTbzlQVWhS?=
 =?utf-8?B?RXF5blJHM3U3KzdqKzBzZlM3SVRDYWFkT3NtUitaRGlGenkzeGc3TFplWkFP?=
 =?utf-8?B?L09FdVVtd2FhdXh4MDJCT05ZNkN0dE0xZ3QrYnhPbWxBK0lUd1Ixd3dUWlRZ?=
 =?utf-8?B?aDlMUHBwN1pGd1daQzZZNmswYnh2NC9Wd3RIVE1oUUNvT2F6OUJSTzZrMkdp?=
 =?utf-8?B?czNRZ2VwdDliV3NPY09aRkE2dXFJNFJGV05uRXowQlpxeDZxQlcxRyt2V2Fs?=
 =?utf-8?B?U2RuNzFrY1Q1RnZKa0o3MDRyb0wrT2VVRVlEUXh2VGdZK2xibDZqc0FLb2Jq?=
 =?utf-8?B?ZjhHWXltZXBoWHRUOWF1WmtPZE0xbnlKTTJscXpZVnZ4bThZUkZBbENkZTBm?=
 =?utf-8?B?eVhYc2JYMWRvOGs1NTFtcWE3OGk4aTVCNW5xRTdEOHhxeDdhMGFsSUtDcHlN?=
 =?utf-8?B?cTRLYmxrbUtEY3ZUUGwxQmZCU1MxWjZBN0ErYXpSMTBVT1ZsV1N1QmdxV0FW?=
 =?utf-8?B?cmptdkZudmJOcytqZCtQcmtJQUVtUFZsZVhNYjdkcFp6cXBpb2FWbnNSclZh?=
 =?utf-8?B?cGhLYlBsckZ5TkFXQjdDODR4OTNyWTBxK3J6d3NCM2hEbG1uSnNJZ1JHL0w0?=
 =?utf-8?B?WkFNbjRtaEtUc2xOR2QrSzlPRlJyc2ppL3JiQm5KNGo2UVYwQXpQVnQ0ZElN?=
 =?utf-8?B?cGdFQm5wK1AwS2htUTU4RUpqOUlTRmxTS2I5ZWtZUCtHMVFic1B2YWZvMmsr?=
 =?utf-8?Q?fnKM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTV4MW5QQlFLM0h6ZUVMWlVFQklUT0V6NnM0TjVrQkxHdDYrUDFhZy9EUkR3?=
 =?utf-8?B?RFJqeDgzRVlQT3dlMk5UK0NGV0Vmajc3T0JIZlNLZkN0bkxERFV3WHR2Rmpr?=
 =?utf-8?B?Q2czSDg0VERTUGU0Wk5GcWg3VHplWWo3MkUxSVNrZ3VKWVNRa0k2L2lBZlFX?=
 =?utf-8?B?SFJOUUVaSCtnb0hlUzVEczA4ZDZobGVrb1pRVHk5bEhZejVWZFpjWXlMQWxF?=
 =?utf-8?B?SHRZTC9wYit4NThXTjZ3VDZZV0pkZkNhL0c1eTRjSmZRVjBlZ21oRkdvcWlp?=
 =?utf-8?B?ZnFaSDVvUXJyNng0dGo0ZCtlcmVqZURzVU9FbFViYjJmaFpjMmhIN1hzSDBh?=
 =?utf-8?B?Qk93emNOdklvM2g4NjA3MmVRTElUSXQ0SWRORitxMHdqTzVZdVVsQVJzWnc5?=
 =?utf-8?B?YmdqZGI4Y3dweTdoaW1rQi9hSW45bm0wVlNpZldJelRJT3JPTEw2R08xTVhJ?=
 =?utf-8?B?KzV0M3lVYWRnWElkWDd2VVVrOUw1MUZXZW4veXBTRE5TVVZ3RWkvNFhxcWpI?=
 =?utf-8?B?RzVhT0Fiek1tLzQ4WERRS05VT25ZM1VzZmhQY0xvalNINjJ0U3hQUWhsZW5s?=
 =?utf-8?B?UVVyT284SmJhTE5iWllpTXF0bjgwQms5QzBsN2VqY3lPOGhjK1Z4dzNGWjk0?=
 =?utf-8?B?cDJyQ3Y2SlFESkJpTjd1dXpVZ1VuVVlVSi9XU1d2a2h3N2NUVmtnOUllNDBm?=
 =?utf-8?B?TEp2bE5EMkNsVEs4SFBFRUJ4dnhrOWFCemwrVENzK1M2ZjNZU2lVS256cVhr?=
 =?utf-8?B?T0V0eWx6Z09sb1psZ1hQRjk4U2J0d2E0bC8zbk1jZ1lKUVpFZGxUWURNWXB1?=
 =?utf-8?B?bFU3UWdoWWJsNTc3VncwcVl4ZE5LeXhRWWhNSkREYXpoNHdPVVYvS1l4YkVr?=
 =?utf-8?B?Vjk4N05IYXp6eUFPVVRXSVZzTGt1Y1Q4TVd2MC8wQjVCUjNsVVVXSjNmS2w2?=
 =?utf-8?B?MTBsRXpJRDhYL0hmZEJXU3d2VFVONFFkUEJhajdXVVhyWmJGNHB3MWtlazRI?=
 =?utf-8?B?Vzk1MGtPTmNPaVQwU3lrK2tuWC8vRVlMTFdMYUNRR0RxeGxBdTk3dkZwU0k3?=
 =?utf-8?B?ZnliOUw5bWtCb3JWR2EwbWdTUUlRbzRCenhNdDRRbDNMdkJsTHRIT3I5YldP?=
 =?utf-8?B?NSt5MFJNV3VwRzFqRDlZYjU0NVA1d20ySnVUUHlyT3dRUmY1ZGt5VzZpZy9L?=
 =?utf-8?B?OFIzczc5eU5nMHFGRnVEN0p6OVpZYXV0NC9zYTUrQ0J4ZHN4WFhpK1RQbmw5?=
 =?utf-8?B?S0diTnd6Z0hBS3RTOS9yOVhqTlRjTTgzZGdnZlkvK21DVnZCVkk1bnpoaExY?=
 =?utf-8?B?ei9ENlcwWW9BaGpCMGNZeUd2bWMvMk5JMDA3bnprclk4Q1RoZFZzbmgrVGUv?=
 =?utf-8?B?N0xONWFXSWJsUHo1MzFNWXB4SC8xQ2R0QitBS1hiaWZiWTZ2dmZyS2pjWE1t?=
 =?utf-8?B?THlPUGVib2d4SXJMaDY3M05QMWdic0l5L1RUWnloZlZKcG95OWNta1JTd1hT?=
 =?utf-8?B?VnlBM1pYcVQxSDZyZHlVOW1UQUJOOGdJWXZNaGg0Y2VITGpWSll2Q0g0Ly9p?=
 =?utf-8?B?NU02alh0MWVYM0xOc3BaWjNaR29KRmJjN2hXTmZMWjdhNEw5eVNrOUUzMzNy?=
 =?utf-8?B?RnAzT3hmb3YzMEFvR1pHSlI5d0hsaTEybUtGT1J5MzRoZzNCck9mWGFZVUQ3?=
 =?utf-8?B?aEt4Z3A2dWlpWUNFTTZ0OS93ek1lNk5Od1plZFM3a0Faa0pYazZKSUlmaEYw?=
 =?utf-8?B?Z2dWdXY0TUViMGdtUHBmK2VHMTUxRzRJMDZuTU55a3huVzFtMUZQUC8raFB0?=
 =?utf-8?B?K3lEcWhXVEdsMXNmeGNaWi9XUURtZ1JDYXhMVTg4c1NPMHJIM1F0RU15Ykpr?=
 =?utf-8?B?Y2dsWW03NG1LaFZlVzlkblhIOWxKc3JUZUhHTmNpQjlQME1QMkkrVXFBVTJq?=
 =?utf-8?B?WWR6MmwwRzdTWkRhaXdtUkJIMHltUDUrSHY1S0lRUkZXZ0wyZWxvRDhLd28x?=
 =?utf-8?B?YzJsVi90elJhTjF6OG5IZmd2dHZUL0hYbnpjUy9uMldIcHBZRExzdTNDTDJ2?=
 =?utf-8?B?OXMyUVdoOUVnVHlFbWtwTDgyZWg5SXcrNzErRktOeU9UVncySVZZdWNuRGc1?=
 =?utf-8?B?QU1YT1JNbXgxVHBzQnZ5V0U2MCswWnlNUndrY2hQU1laL0pyVTk5NEExUnpm?=
 =?utf-8?B?K1UybW5uOWFrWWxYVzZsdjVHL2FoelU0NEFHRUFYbHlVenkxbVY3dGNHa25C?=
 =?utf-8?B?UHlpZGFVR3d0OHlwKzZNU3NBSzI5N3lzQ1RuaXpjcUhqRnVsZVBZYU04bUox?=
 =?utf-8?B?QVRrMzhqYjJCV2ZXemFzWEZFaDFYdjNLY1NTZ25CQjdScFBZQytMQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb8a65d-214d-4ef5-4eef-08de550695cb
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 13:53:10.5418 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVWWS+N38XAP7pCkeiIBxj0ydBuZij8RO6w4R1ZtZjqp6sjWMsLCfJEs1m18Lwmc51oAMocZr0gSMQhTbj/Bqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB3631
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

On Fri Jan 16, 2026 at 1:38 PM GMT, Daniel Almeida wrote:
>
>>>>=20
>>>> Is there any reason why you replace the UPPERCASE register names with
>>>> CamelCase ones?
>>>>=20
>>>> I was under the impression that we want to use UPPERCASE for register
>>>> names. Like in nova
>>>>=20
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/drivers/gpu/nova-core/regs.rs
>>>=20
>>> Not really. UPPERCASE for non-const items will trigger the linter. The =
Nova
>>> people chose to #[allow] this to align with OpenRM and, IIRC from the L=
PC
>>> discussions, their registers are automatically generated from some inte=
rnal
>>> docs.
>>>=20
>>> We have only a few, we can simply convert them to CamelCase.
>>=20
>> Frankly, register names do look nicer in UPPER_CASE, especially that the=
y're in
>> many cases, packed with acronyms.
>>=20
>> Best,
>> Gary
>>=20
>
> I don=E2=80=99t have an opinion here, to be honest. I think CamelCase doe=
s make it
> easier on the eyes since our register names look quite simple,

You're on the lucky side! Most hardware don't enjoy that, especially if
you want to match register names with the ones documented on the datasheet.

> specially when
> compared to Nova. However, I can switch to UPPER_CASE and add an
> #![allow(non_camel_case_types)] if more people chime in.

I wonder if we should just such allow `non_camel_case_types` to the registe=
r
macro? I don't have an opinion on whether we want to enforce using UPPER_CA=
SE,
but at least I think we should allow it.

Best,
Gary
