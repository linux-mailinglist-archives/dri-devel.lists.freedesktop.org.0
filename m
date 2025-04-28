Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6869FA9FA6C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21EE10EA0D;
	Mon, 28 Apr 2025 20:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="bQWr14p7";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hH48V515";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B4510EA0D;
 Mon, 28 Apr 2025 20:24:04 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SKG2Uk018912;
 Mon, 28 Apr 2025 20:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=GvNaaKH63lRsPeHAuQ
 sEhn/sGg0xeSLIAzW0W9EMbdw=; b=bQWr14p7mQKlGqjS4UR8MY+0u7LEKicIZ5
 JhkZApx5yMLUAFXzmmx39zFcDVawU0STkmGRAK0jCC90NHwsZKRDRqJbrM7mJUqH
 CTXhmOLt8xo+K7Kf3ca2jq0i2YMDWmzHzXcGJkwsLYPuZ6EsjnadPP3URLzO3854
 c/VGQrd4xjEbFVWxHEvl7zvX6XfZNJi5VXght+yMjC4o8CGR3ROYuhTIxhODzcbt
 /wwpsdyTgBdzV0Jc12xza1VQhO3pwwVmq/15FTDDOPCZs3HE5AQhQmropaelrIYj
 6llhvSW8deORZb4hZXwsFA5fIFrellGyd3utjzzlAEZeKwZbGQyg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46aenug8a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 20:23:40 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53SK0x9F033456; Mon, 28 Apr 2025 20:23:39 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azlp17010022.outbound.protection.outlook.com [40.93.12.22])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 468nx8x76f-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 20:23:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgeM5jJ07DDAyyDs4aENq+uSwKZw/Ykps4+CpaymmgZ4K6bFBJkukThSLrh3/9JsNx6AlhOnp3bDVgCpmtMGtDjGtgybVCln1u2GTuNR/TFIg1gcBEcA+Dp9CTQouciSQfKtKoevkVfrvsDdcEbQdWYZt2YughYPPpAY29z7RUZLixzqqMdByqKMRzioXWEbAbjGV3QPOUPSff/4duXIKhPvbvb5kinIxUDDD8u5Hf/EI7TMz4evttg1uQYQRo3MBNA22t18Orlsus+8jXsntBvesx2DGxfaJICZpiIGXRqLnA/pGDk0o0Aubi0xBlgEpWjwhRAgHPkAXuTSVakJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvNaaKH63lRsPeHAuQsEhn/sGg0xeSLIAzW0W9EMbdw=;
 b=K1QP0D2AgggmqSHUCdlWdUgKK3LHeci72Th9KtORMg1AdVW+KUiqlT66EscFDH1b66Myic06a967p/Sm5G3weJjL9mHKUWX5qsMCbHiS2xZhlsNXXA4tpxzaN57ZT5tzqxUunWt0ql5Z79+5t+xZNONw3DSCwII7fLeypNaqtvraZ5mvHMTwvKG3Gr8w5ACw1BTL8OuUivi8N+5PX+PGLtZ352U0OvWAQrmGTw3fWQypi9RwJFcIthHkaBfCR7L6t/uMUB1C5Eu4uymFHz9Y3QaSTEqUs5HcuL7JhYgcc9Alx0VBGzhepNdGOr+3C5wt8rhfUYV5eLatDuLK9shAuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvNaaKH63lRsPeHAuQsEhn/sGg0xeSLIAzW0W9EMbdw=;
 b=hH48V515+ho1kSoDvn9wjIbpN+GuMxnjLbL9NXAu0XceioeZNimRinkkZmx7BCHSOheLgyx2m299TyPzK74fvqb/EXsBWQ8/+FzywlwcVW8n2xnWiLWByExeCepUKW4+CDvoH9U5An3SjqWyC+svpaa3ecNhAn2qGV0KEJadn+M=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB5549.namprd10.prod.outlook.com (2603:10b6:a03:3d8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 20:23:30 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 20:23:30 +0000
Date: Mon, 28 Apr 2025 21:23:28 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1 10/11] drm/i915: track_pfn() -> "pfnmap tracking"
Message-ID: <cff35573-53cd-4df0-84f5-84b96abe5135@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-11-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425081715.1341199-11-david@redhat.com>
X-ClientProxiedBy: LO4P265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB5549:EE_
X-MS-Office365-Filtering-Correlation-Id: f07d39c3-0309-43ae-1350-08dd86928a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MNmuYlZQAHY3Nlm1GmyheyCuYO6kSZQcu0w24jnaEMIO92C1vXG7XVqqfqWY?=
 =?us-ascii?Q?na9nU3tLtV2upAiFWdwFZUwT/+gNJsosWVLYCw248twZRp6cEV+4PfnI5eO6?=
 =?us-ascii?Q?UGderWN12udCx5BfsFHNQZNG6KRoFKHcACeQbAl4SIp6SfVZhwv+FpeyNADG?=
 =?us-ascii?Q?V7Fr8V9Yz0Go0y/uIebRPpbRLjFR4egGWGrFSPQ6xwoBqDe/Ey7Q6LE1wz6e?=
 =?us-ascii?Q?CNA1Z5sSKSdeqlcV+LaIKW5wrqvFU7CdlTholcYJ0io+wvqGZUEUnRwtwKNO?=
 =?us-ascii?Q?zeOyyjpboZJOE08mxF7go3LeS6PaansS+rjewUYgfITwCeSb4FGZqf3sLNfg?=
 =?us-ascii?Q?kfr9ofKKliRe1sSRIZbTS8Euylz4pM/4lRogV79Af9BJFllnFuijdDkJi11B?=
 =?us-ascii?Q?GtLaacp9awrlBvLsIQ9/01F4SqkihZlWUr56wf64jOeKHn1gm9Sf15pkm1f6?=
 =?us-ascii?Q?vJUP/1Ug26MAoxkjIPtaQ1nFnFPa0Iu4JuOM6VKEUW8knNJ1/15UwaYfXnnz?=
 =?us-ascii?Q?C/rRWUvDS7riNBmQUzQomeRO5c1SjVLLaTEVcTQux/8UNTiSlFUAeSO/BiXS?=
 =?us-ascii?Q?vvLAXDLFuut8zFDGP9Z7hUWYqR4ZcovycUxyu8XEV7KJB8NRNxPuM1eaIN4o?=
 =?us-ascii?Q?Tn70GstFKMrKlDXIYUEfyLT4gsvlAe3UJrDZ3aDEJ35WwnVhRLxQue8eYdah?=
 =?us-ascii?Q?fsiqcKWBaFgQGooYZBvgDVsyydVMYKjWkmQ+IQjO1WqqlELyr5XsrZn02rGJ?=
 =?us-ascii?Q?5mMdBbHlp8jMCb0squXOJS3oM5njYxrR557kiVNsyu5yDIP0YRC7+7iUJ1YR?=
 =?us-ascii?Q?Rereo/UMtXVuHm+eu47WVAOV9gpp45/RLww1adimMD2i30NatHLWoWLR0EkY?=
 =?us-ascii?Q?hx/cPxdgFxzWuGPNY4JSXB1Uf9yEyuCyplIdC30bRYpplRhNGDydgVecGW6N?=
 =?us-ascii?Q?AA5TlINiwRiEnLtszBxs4nWV8/ozcIp+++IX4FKNmejbZNzq8zwuzNcOGyQB?=
 =?us-ascii?Q?blHJBk4ynWtAVJYLAKzNkhfZEfno4upfijHZ+9yJiDpqATaK4ROUZJvANG4Q?=
 =?us-ascii?Q?Wp2EG/86FWOsXjzJeBTzNv8W42rrAiM+HxNWF3sOrVpcNWDPS/Bhe6LDpSkm?=
 =?us-ascii?Q?vBl2tQpnsSI98y2o8kv2DaUBJW3engkJcSN+/ji6u2UVveWJsqTYZS89D0Cc?=
 =?us-ascii?Q?CmPDnfNqqBOaVEpUMobqUP/SZqIyk6CD3dyi37MejkAyPqikmoGSpnjcW1hr?=
 =?us-ascii?Q?qsn3bnYiSUiZP7jlcLzLh44xdGIJfiTHEpdCXX35l5fQy/dGfRPtFJzKgP+9?=
 =?us-ascii?Q?D4d/yFNR1PJflgaWUnA7QOqTtODue7bReHlNoxSGMtTMxLT68QBt/OYvOKsW?=
 =?us-ascii?Q?c5D9GH0jdHm2/b9ynINtVBQI/xWQ+8M1ld8OrJ+bS0ckyp3WiNuP16kKrgij?=
 =?us-ascii?Q?YaoholUDUEM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?63NXFf+guX0n+4RZS4pm0imPtoCdjcq9tQ7Juraj9F0PYSfWvgKhsrLtuOTL?=
 =?us-ascii?Q?gsEjdHJ1glNdMlIvQ0JsQSlH1K5iu/nIfAuSK5dtGv640g1882nMhG3M/T2O?=
 =?us-ascii?Q?AV4HVKXinoDP1+lJXmXT+dUasstRWo3CSaAsQnNQnlPV1AP8tJedcutfzTGo?=
 =?us-ascii?Q?jhfP8SgWh+pE58GXlJUqsJqHjBQ5Ai6m+ICR62Y4lV1HEpGF6ToPEgw0tD+9?=
 =?us-ascii?Q?mAMQ4PTUc2zSN28MRQLmI/0GvvyEWo8tyi40zbXLIm1MQL1R+S3TWzRF7RdK?=
 =?us-ascii?Q?EHkR4QGZE4cNjPTKeZg6baxhDiERC7l48vvFeIS8EucpyhIySJ3HItrNor+w?=
 =?us-ascii?Q?cfRNkTzpP2ULw3YBOU/mmsemrXfUtsBtL7CW3wmukYKIOXZtZgkmIkZTTJi9?=
 =?us-ascii?Q?h0lVnmmyAjlfOpVYwrWZqsLlGMfJt67OQW61PTdnPD6zFpEFsHft9dG8/uGJ?=
 =?us-ascii?Q?mykpLPMgVWfUBtGSwHz5nkq63fK6MxFqyvN8BcoUx4RAVsGo0IVHb1FFk1wT?=
 =?us-ascii?Q?gwXeYoiIfExHZqSLmUk50ca/bbnDZM4FZSXHHPyLXdkQv1R5ACFsGzGY0X89?=
 =?us-ascii?Q?KVWQP02bnagjIvcFrMi9hL6T7kzX+W2L1Bm7CdsUGUYlbugHTh/Q7xdPvosi?=
 =?us-ascii?Q?lg6OMeagwk1sZCRT8uPgRiozKvNfu2i+aCU8ASPNTyBPlmYCc8Qg2Py96q7R?=
 =?us-ascii?Q?Fsc2A40vGCHZDgvPwhNrPFgVE5oAuoKQdOtrNl8kBpCwrZBOz7suKsXhniOo?=
 =?us-ascii?Q?JpmUnGmDQBSYIP3g1rdnBxXVH5/+fqpxeVm92pPwJb8xAsL4mdt0tTd/Zl8w?=
 =?us-ascii?Q?W+fq6XNj3won6dRF9hYD9ytQTuyXaDp9hUl13KoJj/djTO+FxxK11Awgdceo?=
 =?us-ascii?Q?s/Cpy1h70md6PkeQLUn+rEMCaxNPso5hCZ1FKSbLKVqBSnmKCVDJ4lWHohJF?=
 =?us-ascii?Q?+vbl7ZEYJPQrtERuY+ltfyWqjcy7qDZANbcrXCoTgBRqtH9/n+VktUiHE5g/?=
 =?us-ascii?Q?4YdYcmNiL9m+x6au2lUw0SoVeHdptWtp8YDy3tR8RDt3JhS55X/mz0/RNj47?=
 =?us-ascii?Q?QGNW36olJ2BJEOmTNkAGjQ4twj6lmonp2Id9VRcRFMrakKX1yx7JwR7/ZMxh?=
 =?us-ascii?Q?IwgjIaZW9wqv/VOGY3aQlMsTT/vNpehwd1yRlBHHA74vIbAWS094O7wXh5h/?=
 =?us-ascii?Q?HjNWtoC++MpjRSyiaWbDHIDjj8WYxni9omuMys/VozY/19lGVKl1V2TV8u1q?=
 =?us-ascii?Q?8vtb/ppM/SS6WNWHmx2UbVs9g4deoK4y2OXacowWNf/ZUH5fUygjbSq67OZH?=
 =?us-ascii?Q?9Vk5qCTgvsdJ/1OPfcFyckct1wU6rV4g3UXuxVNbtAaPVyeiiWLs86lm7lRH?=
 =?us-ascii?Q?0Z+NhooyotUrYwIVwigydxva+XQ6U/g/uW9XEcvZbnHYTJ0Xle63RTr3jSsA?=
 =?us-ascii?Q?+9+Ox5V1TlpnwFEQUbe07kKSHr55MErJNerqXSbzsILbYH0rDrGe2Cls08Si?=
 =?us-ascii?Q?dMfB6Abd0SOko3bmXXcItr5FMcLP3Gh536iCA3bagSGs8VV9IKujXhUsX8c3?=
 =?us-ascii?Q?+1WTxrXhJJcxHWTH2WrctUfPiP/P7Y8tTim9o143VUbJ80hm35mJ7+fM5eGj?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fct+fsBWvYqUugAT2ecd7wXsWpwVgsNfxSMoKPFvdQi+sz4qfLynO0ijUTC2AErSte+64GFTwcp33caCrgkumi4Mf072SUn8eEruewttr6rC9iVrzmYO+i7j/v3lvt39UvId5w6Dw/RAuHT81h6OkBZK8AkE0ZXtbs3A3RaZpFqIFmTwU+QHb6tU6xCddqOQZBHs1Gs9B+HzmnKkXswMFvszmlmXk5oFw0um9+csYFsZCpQUruUk2bq3WSsz3U4kXHZ0ImtXI7qZOpnYxdiCaEOlQbc0uvpvdu2EAIqJd5H/ij6OMSo58zV0ckF4DAziYvdfSAv9UYjJwJr/HMDfhb8lFaE6n0TfHle2hFHdNdhzGYeC6gb8bvob16MUnOcNZf7+ZmJSU5uL5blnBePukzZATw3J+TA82gs7qmrp3ugcfQRNcWLpim385fzH0VjmTwcH2WIoz/EnrAq1svCdbY2c0qYGXW+Siqv/JgRx2jFZjR+m1u5wMXwTyCQav9YMZxONelR1VcXU9OfHKnYEMxV1sqTpbyJJvKhz+3KnBVru9pyJZ/HShyzGc5ldM9eV/BhZPRH1sfGzlbpezNY3gO9t7qbLEE831VWhThmdm7s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f07d39c3-0309-43ae-1350-08dd86928a96
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 20:23:30.5934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ieAItb3WtVEiEBQxgFoGcEbm7+ibor615YzU4G/nQRubntUDo1Mr1wHtTi5cy0HfyFsvo9MH+zzwTVsHvDxR0dKH3BwgaL0T9rCZcICmN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5549
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504280164
X-Proofpoint-ORIG-GUID: s8l26xH73nzk3IJpIaWvCpAwPZ2TEHsQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE2NCBTYWx0ZWRfX8BV2kfpSIoHo
 LVBPtuA59JKtC+WBkRiFd6jUpy0zkvSNmKvX6HVWddcVjf2qocFPavN6H7G4L3pOUQcjLoJXNyV
 09m3xcPBgGIDCpjt9LtAOrlYwCrtqigaNnwdFsya0xIon5Q/QiuBmFo0HVMPneAmvUBKYUx3qGm
 s9tNgyzcudLUkrvhWLDYS8XtQOEsHsdH50VSWOCqSpMIRw1OqyT6hYSjO2QZrKzwkBIx3km6Mr0
 529lWIYjKyAVU7vkYjAZ2f0Y00Oh/mOqq/oCQsg5xciu2DRkfUlmBnH59Aqnkufjod83P/KjCTT
 TFWPwILQVGpihcYf9znmWyLJcPt8xdARI1HcVj5qgQfVVuS/4sVNzpB0oK2+/uJNhAwPxQN9GKf
 gdfHNj2L
X-Proofpoint-GUID: s8l26xH73nzk3IJpIaWvCpAwPZ2TEHsQ
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

On Fri, Apr 25, 2025 at 10:17:14AM +0200, David Hildenbrand wrote:
> track_pfn() does not exist, let's simply refer to it as "pfnmap
> tracking".
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  drivers/gpu/drm/i915/i915_mm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_mm.c b/drivers/gpu/drm/i915/i915_mm.c
> index 76e2801619f09..c33bd3d830699 100644
> --- a/drivers/gpu/drm/i915/i915_mm.c
> +++ b/drivers/gpu/drm/i915/i915_mm.c
> @@ -100,7 +100,7 @@ int remap_io_mapping(struct vm_area_struct *vma,
>
>  	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
>
> -	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
> +	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
>  	r.mm = vma->vm_mm;
>  	r.pfn = pfn;
>  	r.prot = __pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
> @@ -140,7 +140,7 @@ int remap_io_sg(struct vm_area_struct *vma,
>  	};
>  	int err;
>
> -	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
> +	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
>  	GEM_BUG_ON((vma->vm_flags & EXPECTED_FLAGS) != EXPECTED_FLAGS);
>
>  	while (offset >= r.sgt.max >> PAGE_SHIFT) {
> --
> 2.49.0
>
