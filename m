Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBduKnwfqGlQoQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:03:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3621FF730
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 13:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC3610E9D5;
	Wed,  4 Mar 2026 12:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bfqkkNzp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F6510E9D5;
 Wed,  4 Mar 2026 12:03:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atk6PIZRRg5IABGrtZXEzmDWs8T0B0EAY8nCd1yaqlSShl2f4D6OsiOBfRjybYxkhvrlEN614NgUi0uK6TAjb8ztHms3X7rcH3d1iZ5I+1IpDjP7l1YfenESLGrNTLF3H9JlfUwobFiDq9JWLA/+aldK1HdU59NB1LxZlBFTRekCunfv81uSC5evV0RIG13kGvaV/TCYvSiAGl50GGEjNC83UFUpUlHRSEKflJKnTi9leRlNE7LB0uy4wE55tW6AP5oFFB7iSoaziVyGi8pbH1FANo/N2jy7m3+JL0VlICEJ22luTy7vwY5RzHI8IObvYJZkCE+p/jGxe9vQUkyD7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyqAcTUTpgzYd7tdXeRkaPWfYJOiN1Fc+hFiCJ47WIo=;
 b=Q9Z7n20ELEPENCpuH+dG7v2uaW4/kOkQPKpamfa6SOz2BwzJG2ayOIaKGI8yS7hTkCeBlqk7Gx/h+npaN/VsBCZ+gZnld2x6KKyTNvsRfrl0t2GTqNk6R1ugjYbn4hxqbPkAMl8+iYNw9xp6wx5g6zcbZ6f+jgx2zqmNL4n9e2EEdoMry3D27xpshKN2Yz6HGIuuUvnfjyhqYuA3VB2W8cVzmVMchiRHhNB8uRw2A8gKQFqFprayDLIRj18/vZaPGcAETUiMn/cwyr+Bdst/NRvx3bUpPysBRBr1994xKdKkbBFA0Lb4seQb/882mW9tu5rcJhDv+UDliQmcupHnDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wyqAcTUTpgzYd7tdXeRkaPWfYJOiN1Fc+hFiCJ47WIo=;
 b=bfqkkNzp7eoeI+y7xCso/z6HJqw6AWmArgnOpIgSN3qDOdKG+g1dA0j7jOjKeCIcg/0dqzV6tXQBPT1rr2lQPyt49KRsLjKoZUNN3WL7xieIZLQ3dH4nC9TWRXE0wKMxomuw3rv5okCBXF0q2Vnl1CHJG0qTlj+d9D71/kbBaB0UF7NvN5LPZ8UtlKUa8OXrzDq1HUonwCImB5zJ06Fk5Habm2sW5guGX/NY8ypcGeR166BvWut0XDIXlulZKbfKpuUv2tXBfqKlDmrZSJUS4rk8g4JU2pG4709xxYSoZw2Uiw3AeGHwzSZKJ4eTKPS5gulUdx2fHWs9FgC0dFqX4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6389.namprd12.prod.outlook.com (2603:10b6:8:cf::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Wed, 4 Mar 2026 12:02:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 12:02:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 21:02:54 +0900
Message-Id: <DGTZE6RCQVIY.3ASBJKVTF1SNM@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v3 5/5] gpu: nova-core: gsp: add mutex locking to Cmdq
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-5-a6314b708850@nvidia.com>
In-Reply-To: <20260304-cmdq-locking-v3-5-a6314b708850@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:1::26) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 9080d2bb-57df-419a-d0cb-08de79e5fa0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: J8tpzK7DxMe8q3Z3OJCAHf/qSSWxkE9sNj3SM7/dB7ucMibzrTspMPVDa9aPdo6YDnquiSk1UfRHuBoYno1Ap4PuSPVBrdM14dnUhqAV9OejaZHNbou2nv9E3fvs2/GjItinoq54hBFwXIDuG+EHqRjzeV/AnW8AKBWooYs7XrkEdpej9pLX92+NdB23PCw2PcLkzA3ytjjzspDzt0gI4TnBIEdh4dQduAyh6zfPLkMWra75w9kEJNxUv6PETnm7QYXkUcVRoq21fgkwV7g0fBgWQ1bKUWUiZfpObXSjxTEURlfj3HA432vB2OWnnXKya6ZS2b8uM3jxS3rT/oBO3RP0Gsy6VFbnrtLi5JLU2JKZlvijUJ5vbE8OMMEJ0adfKrfZqpj+YglnpxT43z6rsToxGYp0v//ChLobgSSQL/jLg65cWQiAQQgYfV/lwTv7d0G/l2jKKctMSnrXBJCYNqsS2bfh8hQeej3y9Fmt33VfZeVKNQZqDlY9JcJ2CMFcEg5w0240e0YcOtih69mpimXM8WahbwQUBkfJNtJfq56MMUtCCXsKaWhAd7nM2j/Lc3Qqf93g2YYFGKQut+Mxor05ZAN/IzDpaorT01wLgR9Tlc+aQnL9ZoZU7fkvflOgkkMmLNSf6WxG/KYjq5+4bd/uK5xCCDoL3Rp4ABSfJ3+219oi70XjxahZFa0vYcIwZYOuh3Y1R1akEsB5p71S43PhgSK48cY/XytOL+kzgwQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWZFUkoyVDJnV1gxVjVac1YzU3NNYjJ3Vk9vN0tnczYreGUvOS8xVS9HUUhW?=
 =?utf-8?B?UkVSanFUakNjNjdXWnZ2RHNrZitmL2Z2RGh0cjBpTzNOcVhpd2JhaWthM1VC?=
 =?utf-8?B?Y2w2UGk5aGx6amZQbW5yVUpJVExBN2c3MmlMLzNxS1J6Q1J4Nkl4blJicEU3?=
 =?utf-8?B?aVA0RE54S1k3RS9IM3o5c1JMWHhRMTFrdnFCbGlPaHltZGlSdEc0a3BGdnNC?=
 =?utf-8?B?NTlTZ2tlRm91czhoWENWQW9EL0FCLzBvTkZ4aU56V0s1NGdXM2k3bmpPcTVK?=
 =?utf-8?B?SXVjd1RiUzBrY2c2ck9VcXl2T1huWkJEUzUydCt4NHpYREZKckpTYnFsdjBS?=
 =?utf-8?B?ZXR1OWpGUWwxVklLL3NySTJFR2tlODRpRURsV0JBc2Q0bVZhM1ozM0R5bEQ2?=
 =?utf-8?B?Vm9KTXZ0VEc1MWRncWhhK2hHUy9STGxyU2JiamNNa0pqb3RITjJZZ3Z1U252?=
 =?utf-8?B?cXBMTWlKM2NMcU93OXJsbjcwMzB5Lzh4MnEwSmUzR1Y5RnRDbXdXV0RSQ1pt?=
 =?utf-8?B?YUorVmlZV2tVak43RjZvcFQ0eGovZXFBNkxzaS9lcjN6VEUwRVVCelFyekVP?=
 =?utf-8?B?QTBkckJ2c3ZwSGFtd2c1WFBMOWVXbXFDVGNLb0k4VmRRVlBKd1o5bUtGMjJt?=
 =?utf-8?B?S2x1aWpmRnR6b0kwekZsbGdjUVpaYjdFVnMzdFRRcm5rOW0wSGp5SHdmM0VH?=
 =?utf-8?B?elRIVGpxakxlV3M3d2xxWmF2aTlxT3A0cXhBa2dNbkNjQWI0UWx0L2FaSk9w?=
 =?utf-8?B?YjhDUFdVZ0dhUGVSeVl6eEkxN3ViaEpaa1FxdDlqSG9RQzdPcVVOUUtmdUxl?=
 =?utf-8?B?M0ZwcWUrd3UvSzYvL1Qwd0hMNzZ6cWhLckQ3MDZ1Q3VFbUdrZkdBTHdXK2Ro?=
 =?utf-8?B?Si9NR0EwNmJodlVBSldYTTZ3T2U2TGI4T0twSjM5dG5YSmdjbENYM3ZFVm9i?=
 =?utf-8?B?WHBzNTRaRDU1V0dpdGRMdXBtV2ppWUxaOEc1SWV2UjZzaVhRVTB3ZGxzV2Np?=
 =?utf-8?B?U3hnQUJUbU42S25jOU1wVkZWRU03WGcxdldJNDlvQllsVWhab0hvbHRtL2ph?=
 =?utf-8?B?QjRremRQTmZkZUpXdUF2WWVOY0U5VjJSaTBWdFNRallUWml2QTNXZi82enFR?=
 =?utf-8?B?Y3NZWFhhRVlYWkpYNFJOdzB1K2FnMGRtN0tlV0RETkcvYVFtNWg5bmdOaU9I?=
 =?utf-8?B?bHArbm5xbWJWSTdrejVkb05vcmVaTzV4LzFweHRpTmxtY0g2aWczeDBsZUdH?=
 =?utf-8?B?aUdBSjFIcUtuYklPN3N4NnhuSUlyOThQS3A1RlZxelgxTk9NSkptNld6WlZY?=
 =?utf-8?B?NXp2Q3l3alBRelZ0Rk03aVNaTFBJVHoxQkpTNmluSGZueW1Ta1pHOTVJTkE5?=
 =?utf-8?B?UitCaEV0N3loSWdSVG44bFIxTDNNMHF4TkpZeVRIWUF3T0VicU9KZWZkYngy?=
 =?utf-8?B?WU1VZDZFaVp5TFB3ekxOdHhRaEc0blYwL1oxbFVNNTFydXFtRlJISUpTN0Jj?=
 =?utf-8?B?T0ZuSmdYS2NReUtPQ0RDanZ1bm9Qd3Y3alliSi92ZVljTDJNeDhCYkwzcU0w?=
 =?utf-8?B?WnhXVWJTZG1JVHliS3lJbndjOE9VS2NuNWxyQ0dJMXB4VXMrbmhpajNoT1M1?=
 =?utf-8?B?YkppSE1mVkd0T0t6RUhJOVJNWEhmRkpGMmdsbFBZM2pPTFJ5WjdzTVpZOUxt?=
 =?utf-8?B?VjA4d1ZIRHdIL0lwSjNLMjFaSWVZNmtuaGNzV0JxTVBqa2JTRFdHK0pENEpj?=
 =?utf-8?B?ZndWL0ZUejZhTkJYZzhxMFhPKzdFNEFjRFVGa1lydk5JLzlYSnlOQnMvbHl4?=
 =?utf-8?B?a2JXVW5XUW80YUlWZ01NeW5TZ0drTlQ2dkRPNy9YMGlvaGNwWnZwUVZjTnFB?=
 =?utf-8?B?RU56MHY4UGxvVDJ5NGViakN3ZzQrL2hxRzE2eEtDV3BUTDdWNVBDdnJDQnBa?=
 =?utf-8?B?WE1WS1FlTDNEZmFVTFp3TlJCY0o1MUsra1pJVDhHNWxFaXRFRUNOT1p4Rk40?=
 =?utf-8?B?Q3VTSkxJdnYzWGNjTXZ1aHhta0RrbVd5MlBROWpYMjY0ZVZoc2NLWHJHcmll?=
 =?utf-8?B?Zi9JSWo3SWhrZXl5Mm5lYUxMcmtzTnFyU3BQQnNrREpiUUNFNWVKTmRyelZ0?=
 =?utf-8?B?YnYwMno5bzZ1RU9OU21tYTlTcW5QNTA3TGwzdkE2bTdpQmIvcklIdTJTaExu?=
 =?utf-8?B?VUp2d0ZhT252R2x6cWw2OEtaaTBPSlhUaDE3V0NwRGw5OXkzbzM2V0cybXk1?=
 =?utf-8?B?dzJDVlpRUmc1a2V0aTBVTU9GQTNGOS9LbjZsOUZWRUV6VzdENmhOQWh4UUww?=
 =?utf-8?B?cXNVdk5EVk1PcDgyc1BRK0dQK0xxdW5XeEZmKzhRNkdoY0VXd0V2ZnZnN1ha?=
 =?utf-8?Q?97dNZrPC3xlohTABRJxZTseB41WE/Hp59hc9pNXn3+qFJ?=
X-MS-Exchange-AntiSpam-MessageData-1: IXCsWSGvdvkICQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9080d2bb-57df-419a-d0cb-08de79e5fa0c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 12:02:58.7440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1z3EoDkb/Bqh+u777O8AiopSQWCdOTEK1oTjQ53ZWg3DYrG2McC0rmWvBNnjbp14ETE298s/SKtYMJ/BZJuu8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6389
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
X-Rspamd-Queue-Id: 1F3621FF730
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Wed Mar 4, 2026 at 11:46 AM JST, Eliot Courtney wrote:
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index de84a298909f..94cb2aa6568d 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -18,8 +18,12 @@
>      },
>      dma_write,
>      io::poll::read_poll_timeout,
> +    new_mutex,
>      prelude::*,
> -    sync::aref::ARef,
> +    sync::{
> +        aref::ARef,
> +        Mutex, //
> +    },
>      time::Delta,
>      transmute::{
>          AsBytes,
> @@ -57,8 +61,8 @@
> =20
>  /// Trait implemented by types representing a command to send to the GSP=
.
>  ///
> -/// The main purpose of this trait is to provide [`Cmdq::send_command`] =
with the information it
> -/// needs to send a given command.
> +/// The main purpose of this trait is to provide [`Cmdq`] with the infor=
mation it needs to send
> +/// a given command.

This looks unrelated - should this chunk be merged with the reply/no_reply =
patch?
