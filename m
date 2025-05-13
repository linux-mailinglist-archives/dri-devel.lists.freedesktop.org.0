Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF76AAB51A3
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 12:17:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B1110E0C6;
	Tue, 13 May 2025 10:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="TtiYfdp5";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XVdleQyX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1B210E0C6;
 Tue, 13 May 2025 10:17:20 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D1C8tn003041;
 Tue, 13 May 2025 10:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=Tdue4lsGTxkmQqQ89f
 b9PkQhOtHaOjMHjZzHlJn+7Zk=; b=TtiYfdp5NBrW0Ym175mCJjgDPj6wy8WRdV
 n1kxNd3EoeyjMdKTNVowS/C8kBDN/SNR/u/j6ZDXYXsllU/2wyFrNUdNSlgxq9BP
 0h000PZEeYECSieNyiN+FHIDXKsi5AR9e1FTun+IQhgbk9qi47v+SpznFqc3WI9W
 1aNkBOTEs3JlwgSwQJuq8LZDIEMndD7z5ywRMPKnrIfnFFKJyYlz9slfAngAi0Bn
 bbLXDENaY3E+3rNWoGdEdf6Kjjp16zt/r5/XE+i0Nz/Njprv5BFHF/O7AKpS5NPl
 iDlGV07lunJEgczFWvBF5o6ext+SJKC1Imn1QyFIsB+MW5D+PIVw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j059vfye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 10:16:33 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54D97WOC002837; Tue, 13 May 2025 10:16:21 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazlp17013077.outbound.protection.outlook.com [40.93.6.77])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 46jwx444gf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 10:16:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bn8XJHfLezrBW7CTgzxJVs1Df0pxHjx0lnlzhDkMB5Dndt4K9yK9ju8UKPuA9ia2W0v6fM7A/pbwuuvuXsXmxZC97ndcpVQWqe4QJgJc7E7VCgQSULyDz66Cr7qq/IjZPShloT+SM/d+5T1BmWDCk2Q/JJDtAERjUQlW3TvfTrH16t/ENKFHs0lq+mCz0ruA7kdZJ2o+tf4tckXY7HL0/xal77rXscPxTEPiguYXfDxu94Y+fhiRXSJBhKdFbmd3EhTVLLhGhuqBf0BZ37MJl4p5RJ+h92tD/Xu2MCpseTQU1SPFlSbtiF4f0kwbTPLtt85SuTnVyzRTIn0BNAtkuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tdue4lsGTxkmQqQ89fb9PkQhOtHaOjMHjZzHlJn+7Zk=;
 b=O8JHPTDgE9GhQjZbn6gb+Lk1xVi3keKCCZrObOwLEtgxvIsRa8/QYlxKiLOjXRfQ0namB8ZtTg4jRiq24+uh2OKKGsJ4ULfwvWKYYsyWcF4PQfatxSQCwgza0EGmiJ2OxyADodeNaeynKuexuY8syj+kMPOyM+Qf4GyHHiV1+qEfzeFgtHTBkp0gVGnh89GjPWirPX8BcyMu+e3iAjTD0nRm9q8PFMneLVmNjHkwlrkLswDhYFjpoozYXTRJiE0TeYUkcEbfaLAJUFFtmH4YA4L1G+4ylLO3v+woeTHtUKlEBike+7VsQ9S1h0BCj3r1ltHNblZNXM3id61+YophDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tdue4lsGTxkmQqQ89fb9PkQhOtHaOjMHjZzHlJn+7Zk=;
 b=XVdleQyXeqvVVGupgvqZ+XmyQo22wVk4et921Z9oxq8LSYlbrtTYAiRrwf+/QA+DjYOHCVDhrjTgepoTQeGv6oaO81cBSidBxheYpxHcyaTtwpoZdqw94t00sibD8l0Ry1caJJUtLzcZrs8F5BPOfWGHOEdIQ22h3FX2zA69Rfg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8706.namprd10.prod.outlook.com (2603:10b6:208:580::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 10:16:18 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Tue, 13 May 2025
 10:16:18 +0000
Date: Tue, 13 May 2025 11:16:16 +0100
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
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 04/11] mm: convert VM_PFNMAP tracking to
 pfnmap_track() + pfnmap_untrack()
Message-ID: <8d96176d-f36b-4714-9780-6131c8470f50@lucifer.local>
References: <20250512123424.637989-1-david@redhat.com>
 <20250512123424.637989-5-david@redhat.com>
 <d180a8d2-87e2-4878-bca1-e6986b7fc110@lucifer.local>
 <c7a4d470-16a7-423f-b9a4-a73210596d8b@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7a4d470-16a7-423f-b9a4-a73210596d8b@redhat.com>
X-ClientProxiedBy: LO0P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a44450-faf7-499e-aa81-08dd9207337c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QYCWJXqI/Smk/bY7wWzWVLr9J+R4g7xs5aZbPLnOCMAHQI8R4Eut05hHuufE?=
 =?us-ascii?Q?oVC6Nw4D9Wxkux2RrAMmtJ/cpyKSHVXOmOORqsA+8Sf5e47rbgEAslSnNuC1?=
 =?us-ascii?Q?Lcj7V0SX9FF6sVtS1KoJ+wPMqmZHj28CuGe9Z4jZuJBdkBPeYHHXhGoHshoO?=
 =?us-ascii?Q?8HePjl6XodnFE+n/sOKcXwRWlIW8Rd8nmPuUHBB472qRAl9Ko5dGi4YU57o+?=
 =?us-ascii?Q?E2j5KIeTTMAb4H0kLKd91T1KNpvXYYi6XAMwnTusKEk7v8xfrCJdRbGdz8Vv?=
 =?us-ascii?Q?t22P34IKYbjkkKhJfy2TvbZlrikj9yRru3IxSb/saLwD9dRhQS2Zg6gPqzWa?=
 =?us-ascii?Q?po1aKQTYZNMhO1ARMD77xDa54xt0qjK3kMNBxCvQc2SUn5IgdsvXO94zscyI?=
 =?us-ascii?Q?vVvJ12VhFIcBrm6vhQYRCJU8tax89dd4fnTNjqlF+ARfx+SxlExBj0ww85MZ?=
 =?us-ascii?Q?3v0O2vK+rVTuiXKLztF/quIvEI7lzbXrnlAZizNICsuY92AcUwrz49IAP8D3?=
 =?us-ascii?Q?iKBQzAbbzqILfeqy80I3NL5pN9euJ0vWxe4nPpG9cYXqVdI6ecg1f8XIFlzL?=
 =?us-ascii?Q?R4DSEiHiRHOnAMlNFhvVHB7XHvM0fp+3rspX9igMVcgwuOV6ogpWvwTl9a02?=
 =?us-ascii?Q?/TlyJTM1FM/wapPw1eMsMfJYkvG8w055QXuyyEoTyYEBZWLc2mD5QDb8/z1a?=
 =?us-ascii?Q?Rr8NnzonE0wbl7VzD/bSVMQ8SGXNIRG7zlSONj2fRsNzWGJEAK6Yj1Jl8F4R?=
 =?us-ascii?Q?ptnVdTTajB96dTRdL3MCEWjCmKJxCQAMoBX1mh8HVrJsNcd8M72cB9x5uV00?=
 =?us-ascii?Q?IHkavjoXTVp4MZc1LzqUbLh1wEUwJx/Z5eeZj9Z+Tp/ESGG5whlqgI+8ttlE?=
 =?us-ascii?Q?Sq4OKBKP6mACeI+eLamoiwORt/qu+ImV/xmO6XoRNIaqq3QdNleBUl0DudBi?=
 =?us-ascii?Q?NDrloeVqPDpB38ZNZ5F/T95aEiuq5OLP4exWrDCIrOgPTTTW/m6uNo+IRDIJ?=
 =?us-ascii?Q?cmsmh8NqPFtOaRrMlgln/B6Hlnmjo026HN4YEHlw1PxZTd64wJ96Gvu92X9c?=
 =?us-ascii?Q?A4pzUWJEXPriqPSakHRK0IwkM3tqj97z8Eg0t2xqQYhAwpt4w8s7wPzWxvIV?=
 =?us-ascii?Q?RogW8zHutRC2cRCzB6bqWW/O5i3/gBiy6/OCnbh+WhxuZHzFTw8EdNnVf0k7?=
 =?us-ascii?Q?1M1lfBJfhJiE8jivt0Lc6SZraMb/Z3mSbv2w58enA3zwx/6NYuuLqnKQLo+a?=
 =?us-ascii?Q?5I+7nUYlOA8vzfeeSCCiLNK+Aal5Fp9yUzpsarMd1+CENB6LcJ/L0Kwn4mro?=
 =?us-ascii?Q?3uu76m0hURY2W2pzvoYnu//C9zQmjx8STjGI755KRuBRW9iI6i+6Rsr3EaJu?=
 =?us-ascii?Q?ZMVeTGPP2mOfi5/5FQeZAAFvpHP/XdjUH8vJP+yIdwtyqPSzogU9Dn5lxZXl?=
 =?us-ascii?Q?VIuLDMN25jM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5QHHqn+YinFXyr0J2uyjB27RKOSKhmF9onxyIKhdq8Fv3CMZyNFLsSfogR0y?=
 =?us-ascii?Q?r0EeuqfqJI7/Vk6n+TgVOx+xYsDsSleVdijcObO9cdnRPBP13GxfQg/3L55w?=
 =?us-ascii?Q?8ygoLuOApNN35Bm1I2rF0AqK/bhksUNqSmQCGLI+W3C1EVGmkqBjT/8PfWaP?=
 =?us-ascii?Q?Or1fYgZRdbGpBD3arS2lmMEzkIqzvS41zhUJWKG4gc2LX+2XfUCZibkLSQOr?=
 =?us-ascii?Q?WApR93FnwbhgaH3vqapIsBviDpjJ2+4fq+5NwqtWM3tIIP6+VJ2NGogUi52w?=
 =?us-ascii?Q?IYeN7Rtt3uSFXNQGmtvU3ejbrXVWRDw4TbmQd/5nzUtqk5aN6TRMPDwOQzlc?=
 =?us-ascii?Q?9V4xmrGO2iPf4IBUXIS7zD45vrx+uuh2pAeRk4i7WsEm+5C4071P9cBN4Qyp?=
 =?us-ascii?Q?5BzznOCmGuIcO+tAKjLD3KKg7UETZk41TyrXsER9b6QrNlSg0lbcelMI8I3x?=
 =?us-ascii?Q?D07CaJiupRqdpCAI8K+b19TMVkb3EGq1DcjDXIhY4jpgdDy3/T3vs1YqavlM?=
 =?us-ascii?Q?fmm0k3GcUIoHrqtr+k5awRaii5LkRbECCycNRi/KCnI4RMRd1gl/jAXljR5Z?=
 =?us-ascii?Q?kQ/zEIMZcCU4qG6ip7fhyB8gMrtcMTB1zokYRNCGJXHg1kz1NkRvG1LVf32K?=
 =?us-ascii?Q?N+enGVBa2fBFILFwFqJ+DlvVJrC10ptgfeezslF1WPQQ0TwgrprSCIVBRSgM?=
 =?us-ascii?Q?aWVyuJW4OiKdqw9ce8VC4ohKJxuc/QLZbcTUd0DUD9I9lVajjuL4TQSG1Gff?=
 =?us-ascii?Q?ZYtubt9neR0VMmNfwUUpuqKOIqco0qfyEOeyzqSRFtKPo09znppeYEOgZTRg?=
 =?us-ascii?Q?l8y8Uta0hhGzaTpfx7XgulYiYhgg75nio3jh5CYk0qj7AhqOFqPYDFqD2HUO?=
 =?us-ascii?Q?EJtRNvkneYC0VKCY7lEd0BvzjpqBDZ3X1B7heV74JI3JQ1lo20X1RQ2NPra/?=
 =?us-ascii?Q?Vwd0PHvDNLeScmkxI3cywHVqmVSd+rAJA97RP35vJpxhJQEPxW989G3dAvgf?=
 =?us-ascii?Q?zjJUO+2dnxIITeMME4W1TJBlBm2tf5cDa6ec0iX2fYoPP5zBthrai2JbtcxU?=
 =?us-ascii?Q?v132Y3WXv2GwAYH1e1/CHw15WnaW9tVCle4V7msJkW36jxX/oXu6Hf6xXU2z?=
 =?us-ascii?Q?uxuEn37RxQ8x2PO2wNXJDEltg+vRQVWZsRPZLqJwiTEhDkkgEp73P5e7b9n4?=
 =?us-ascii?Q?AkIrCGDnoy3D0jU2FxAg3zckaiKX9CmAJvr78GOUAXPOY99NWW4d0shS/Q9y?=
 =?us-ascii?Q?+Yf/uiySDLq0J/x3FURQEVBdFsQo9I8D3so6j3AtiV17Qc65whl67wytB8H4?=
 =?us-ascii?Q?gdsxWN+DPeOiatvGb9ISy3ChtwACpERhgcnU/8UNn7pJ8oCQp4D6UBXat3mw?=
 =?us-ascii?Q?tFSF3gmkbi+xgIdNqYVO8Nq4NrwFND6beAQ1Lr2cpIaRpEUhjaC6pHWWAJLI?=
 =?us-ascii?Q?7R31n5zeP7G/aNszMZKtMBhV9bBu/CZdSUiXFxBn16tN4wvzLsArpqwW39Du?=
 =?us-ascii?Q?Nj/M9/qCfLl/MaMrAWgqYEMqdhmLCVY9gs6xMzRctjAF9uKjBPvPx1lA8D5D?=
 =?us-ascii?Q?xHmzROf1AQx7fxu/kqWzEFY8or9B5OxFGljNR+g+C+KxenzybHG8Dc1Q/LqY?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: KuAV+mGZT+kEK008MqlhNPm8DUTUSfU1gsH5UGt12+pJLyw5WdAKeQdJTD+wCWI5ZfuHQ4v/7g2kUAyd23Q7Pl4BAeIHRdzVnR29KT4WsvBWjs9LURUTqQskPvZx9xk7qMTESSZjrOEMngkYh0SrQzWCeRkou0NfN8+DgekEj/kRInkKO0ecIZiWIiw+6DE+n9lPvHH91DBHnydqo1iTTUYYhtaLk05jf/EWT2qq/XuH6Rdi5l4oZWlt/y51rbVE/sBJeUqC4Y4NTCaxd1+v1llrMfDx+SUH/JYZuu5PIFxCahyTFIshxCUQa2pQYxfiyQ8IQCWDIkY3XN8rFP3AGajlTatwiKypPJ0VDxJWxiwqQolYatY6yHLORiNrCerVXuabbDjQ5KkL7PRFNg5MqKHLlGGixDbG6+Jh1Na82XtC4D1OKAizUYs62Qfqi/NGtHbiMA/uceoJ8ZcQCTFAasleD88nnyS+CA+hE0JXTT46SgHrlGoXFL6lQ4SQnz649h3U5Se3nSIO7VCRIP6K8HSwf/r9Z0Fm9gLOEGS55kTBZqEv2wuQwzo/+Edq+XeOP0SJH77x1LwROuZEzFYYRCwciWCwV9+vaKsAvXHMv8o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a44450-faf7-499e-aa81-08dd9207337c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 10:16:18.4695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXrGCLtWQCfxRKEsCwCf9YiNqWcxEEsGc+Yq6z7wFv8uu0spB5e8zKCMev99pkL947fqzckuz2a+Hb1gvcaRVIdEFtwdnw2HSTRuBlJy79A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8706
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505130097
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA5OCBTYWx0ZWRfX9d/bKIDu1y5J
 8VAZlrZMiCMUZbtp7bnxZYycHHwntykeJ6Sqo0Wp+M/ZDfON/J8qCcgx9jjl3S/7CWOKgyFLWtu
 1VZKovuktlhVnBRVVAn2/tjoYGxydkVtXtm7QQOOhWDZ7uwjVnD1VIv6UUPOfThO0ILoTLCipwS
 iGvvvW7e3Ac3P0vmSBnb8ZgaAppks6RTmPFk1fHDaTzzBoLiTS3VDEfpSdCf2OYloC9fKG9azx4
 4oMNmyKHm/hrku+HN5R6Z/519Ue2WFic+xT0hS/iPqWz8kHbzEruEOv6FavFf9C193dN3qSNYFp
 RJnSECSpEQF0ktinuKyQSG/M5ZyIk7zF7TewxqzHe2Pnd0bG/VsO2gXHu0zRB5vXnp4wQc26qo5
 63XP4+WhIPgQjOOCwzag7rhP7Ej/wLibf1qDcBtoekfrLmcUtZ0BhUaMYWEKT2lsYhXn5kGd
X-Authority-Analysis: v=2.4 cv=RPmzH5i+ c=1 sm=1 tr=0 ts=68231c01 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=zMLic4A7THCksA07HIcA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 3Mi0-y0Yshj1BAHEBtNVUgCg93T_uYzQ
X-Proofpoint-GUID: 3Mi0-y0Yshj1BAHEBtNVUgCg93T_uYzQ
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

On Tue, May 13, 2025 at 11:10:45AM +0200, David Hildenbrand wrote:
> On 12.05.25 18:42, Lorenzo Stoakes wrote:
> > On Mon, May 12, 2025 at 02:34:17PM +0200, David Hildenbrand wrote:
> > > Let's use our new interface. In remap_pfn_range(), we'll now decide
> > > whether we have to track (full VMA covered) or only lookup the
> > > cachemode (partial VMA covered).
> > >
> > > Remember what we have to untrack by linking it from the VMA. When
> > > duplicating VMAs (e.g., splitting, mremap, fork), we'll handle it similar
> > > to anon VMA names, and use a kref to share the tracking.
> > >
> > > Once the last VMA un-refs our tracking data, we'll do the untracking,
> > > which simplifies things a lot and should sort our various issues we saw
> > > recently, for example, when partially unmapping/zapping a tracked VMA.
> > >
> > > This change implies that we'll keep tracking the original PFN range even
> > > after splitting + partially unmapping it: not too bad, because it was
> > > not working reliably before. The only thing that kind-of worked before
> > > was shrinking such a mapping using mremap(): we managed to adjust the
> > > reservation in a hacky way, now we won't adjust the reservation but
> > > leave it around until all involved VMAs are gone.
> > >
> > > If that ever turns out to be an issue, we could hook into VM splitting
> > > code and split the tracking; however, that adds complexity that might
> > > not be required, so we'll keep it simple for now.
> > >
> > > Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> >
> > Other than small nit below,
> >
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >
> > > ---
> > >   include/linux/mm_inline.h |  2 +
> > >   include/linux/mm_types.h  | 11 ++++++
> > >   mm/memory.c               | 82 +++++++++++++++++++++++++++++++--------
> > >   mm/mmap.c                 |  5 ---
> > >   mm/mremap.c               |  4 --
> > >   mm/vma_init.c             | 50 ++++++++++++++++++++++++
> > >   6 files changed, 129 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> > > index f9157a0c42a5c..89b518ff097e6 100644
> > > --- a/include/linux/mm_inline.h
> > > +++ b/include/linux/mm_inline.h
> > > @@ -447,6 +447,8 @@ static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
> > >
> > >   #endif  /* CONFIG_ANON_VMA_NAME */
> > >
> > > +void pfnmap_track_ctx_release(struct kref *ref);
> > > +
> > >   static inline void init_tlb_flush_pending(struct mm_struct *mm)
> > >   {
> > >   	atomic_set(&mm->tlb_flush_pending, 0);
> > > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > > index 15808cad2bc1a..3e934dc6057c4 100644
> > > --- a/include/linux/mm_types.h
> > > +++ b/include/linux/mm_types.h
> > > @@ -763,6 +763,14 @@ struct vma_numab_state {
> > >   	int prev_scan_seq;
> > >   };
> > >
> > > +#ifdef __HAVE_PFNMAP_TRACKING
> > > +struct pfnmap_track_ctx {
> > > +	struct kref kref;
> > > +	unsigned long pfn;
> > > +	unsigned long size;	/* in bytes */
> > > +};
> > > +#endif
> > > +
> > >   /*
> > >    * Describes a VMA that is about to be mmap()'ed. Drivers may choose to
> > >    * manipulate mutable fields which will cause those fields to be updated in the
> > > @@ -900,6 +908,9 @@ struct vm_area_struct {
> > >   	struct anon_vma_name *anon_name;
> > >   #endif
> > >   	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
> > > +#ifdef __HAVE_PFNMAP_TRACKING
> > > +	struct pfnmap_track_ctx *pfnmap_track_ctx;
> > > +#endif
> > >   } __randomize_layout;
> > >
> > >   #ifdef CONFIG_NUMA
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 064fc55d8eab9..4cf4adb0de266 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -1371,7 +1371,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
> > >   	struct mm_struct *dst_mm = dst_vma->vm_mm;
> > >   	struct mm_struct *src_mm = src_vma->vm_mm;
> > >   	struct mmu_notifier_range range;
> > > -	unsigned long next, pfn = 0;
> > > +	unsigned long next;
> > >   	bool is_cow;
> > >   	int ret;
> > >
> > > @@ -1381,12 +1381,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
> > >   	if (is_vm_hugetlb_page(src_vma))
> > >   		return copy_hugetlb_page_range(dst_mm, src_mm, dst_vma, src_vma);
> > >
> > > -	if (unlikely(src_vma->vm_flags & VM_PFNMAP)) {
> > > -		ret = track_pfn_copy(dst_vma, src_vma, &pfn);
> > > -		if (ret)
> > > -			return ret;
> > > -	}
> > > -
> > >   	/*
> > >   	 * We need to invalidate the secondary MMU mappings only when
> > >   	 * there could be a permission downgrade on the ptes of the
> > > @@ -1428,8 +1422,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
> > >   		raw_write_seqcount_end(&src_mm->write_protect_seq);
> > >   		mmu_notifier_invalidate_range_end(&range);
> > >   	}
> > > -	if (ret && unlikely(src_vma->vm_flags & VM_PFNMAP))
> > > -		untrack_pfn_copy(dst_vma, pfn);
> > >   	return ret;
> > >   }
> > >
> > > @@ -1924,9 +1916,6 @@ static void unmap_single_vma(struct mmu_gather *tlb,
> > >   	if (vma->vm_file)
> > >   		uprobe_munmap(vma, start, end);
> > >
> > > -	if (unlikely(vma->vm_flags & VM_PFNMAP))
> > > -		untrack_pfn(vma, 0, 0, mm_wr_locked);
> > > -
> > >   	if (start != end) {
> > >   		if (unlikely(is_vm_hugetlb_page(vma))) {
> > >   			/*
> > > @@ -2872,6 +2861,36 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
> > >   	return error;
> > >   }
> > >
> > > +#ifdef __HAVE_PFNMAP_TRACKING
> > > +static inline struct pfnmap_track_ctx *pfnmap_track_ctx_alloc(unsigned long pfn,
> > > +		unsigned long size, pgprot_t *prot)
> > > +{
> > > +	struct pfnmap_track_ctx *ctx;
> > > +
> > > +	if (pfnmap_track(pfn, size, prot))
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
> > > +	if (unlikely(!ctx)) {
> > > +		pfnmap_untrack(pfn, size);
> > > +		return ERR_PTR(-ENOMEM);
> > > +	}
> > > +
> > > +	ctx->pfn = pfn;
> > > +	ctx->size = size;
> > > +	kref_init(&ctx->kref);
> > > +	return ctx;
> > > +}
> > > +
> > > +void pfnmap_track_ctx_release(struct kref *ref)
> > > +{
> > > +	struct pfnmap_track_ctx *ctx = container_of(ref, struct pfnmap_track_ctx, kref);
> > > +
> > > +	pfnmap_untrack(ctx->pfn, ctx->size);
> > > +	kfree(ctx);
> > > +}
> > > +#endif /* __HAVE_PFNMAP_TRACKING */
> > > +
> > >   /**
> > >    * remap_pfn_range - remap kernel memory to userspace
> > >    * @vma: user vma to map to
> > > @@ -2884,20 +2903,51 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
> > >    *
> > >    * Return: %0 on success, negative error code otherwise.
> > >    */
> > > +#ifdef __HAVE_PFNMAP_TRACKING
> > >   int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
> > >   		    unsigned long pfn, unsigned long size, pgprot_t prot)
> > >   {
> > > +	struct pfnmap_track_ctx *ctx = NULL;
> > >   	int err;
> > >
> > > -	err = track_pfn_remap(vma, &prot, pfn, addr, PAGE_ALIGN(size));
> > > -	if (err)
> > > +	size = PAGE_ALIGN(size);
> > > +
> > > +	/*
> > > +	 * If we cover the full VMA, we'll perform actual tracking, and
> > > +	 * remember to untrack when the last reference to our tracking
> > > +	 * context from a VMA goes away. We'll keep tracking the whole pfn
> > > +	 * range even during VMA splits and partial unmapping.
> > > +	 *
> > > +	 * If we only cover parts of the VMA, we'll only setup the cachemode
> > > +	 * in the pgprot for the pfn range.
> > > +	 */
> > > +	if (addr == vma->vm_start && addr + size == vma->vm_end) {
> > > +		if (vma->pfnmap_track_ctx)
> > > +			return -EINVAL;
> > > +		ctx = pfnmap_track_ctx_alloc(pfn, size, &prot);
> > > +		if (IS_ERR(ctx))
> > > +			return PTR_ERR(ctx);
> > > +	} else if (pfnmap_setup_cachemode(pfn, size, &prot)) {
> > >   		return -EINVAL;
> > > +	}
> > >
> > >   	err = remap_pfn_range_notrack(vma, addr, pfn, size, prot);
> > > -	if (err)
> > > -		untrack_pfn(vma, pfn, PAGE_ALIGN(size), true);
> > > +	if (ctx) {
> > > +		if (err)
> > > +			kref_put(&ctx->kref, pfnmap_track_ctx_release);
> > > +		else
> > > +			vma->pfnmap_track_ctx = ctx;
> > > +	}
> > >   	return err;
> > >   }
> > > +
> > > +#else
> > > +int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
> > > +		    unsigned long pfn, unsigned long size, pgprot_t prot)
> > > +{
> > > +	return remap_pfn_range_notrack(vma, addr, pfn, size, prot);
> > > +}
> > > +#endif
> > >   EXPORT_SYMBOL(remap_pfn_range);
> > >
> > >   /**
> > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > index 50f902c08341a..09c563c951123 100644
> > > --- a/mm/mmap.c
> > > +++ b/mm/mmap.c
> > > @@ -1784,11 +1784,6 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
> > >   		tmp = vm_area_dup(mpnt);
> > >   		if (!tmp)
> > >   			goto fail_nomem;
> > > -
> > > -		/* track_pfn_copy() will later take care of copying internal state. */
> > > -		if (unlikely(tmp->vm_flags & VM_PFNMAP))
> > > -			untrack_pfn_clear(tmp);
> > > -
> > >   		retval = vma_dup_policy(mpnt, tmp);
> > >   		if (retval)
> > >   			goto fail_nomem_policy;
> > > diff --git a/mm/mremap.c b/mm/mremap.c
> > > index 7db9da609c84f..6e78e02f74bd3 100644
> > > --- a/mm/mremap.c
> > > +++ b/mm/mremap.c
> > > @@ -1191,10 +1191,6 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
> > >   	if (is_vm_hugetlb_page(vma))
> > >   		clear_vma_resv_huge_pages(vma);
> > >
> > > -	/* Tell pfnmap has moved from this vma */
> > > -	if (unlikely(vma->vm_flags & VM_PFNMAP))
> > > -		untrack_pfn_clear(vma);
> > > -
> > >   	*new_vma_ptr = new_vma;
> > >   	return err;
> > >   }
> > > diff --git a/mm/vma_init.c b/mm/vma_init.c
> > > index 967ca85179864..8e53c7943561e 100644
> > > --- a/mm/vma_init.c
> > > +++ b/mm/vma_init.c
> > > @@ -71,7 +71,51 @@ static void vm_area_init_from(const struct vm_area_struct *src,
> > >   #ifdef CONFIG_NUMA
> > >   	dest->vm_policy = src->vm_policy;
> > >   #endif
> > > +#ifdef __HAVE_PFNMAP_TRACKING
> > > +	dest->pfnmap_track_ctx = NULL;
> > > +#endif
> > > +}
> > > +
> > > +#ifdef __HAVE_PFNMAP_TRACKING
> > > +static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig,
> > > +		struct vm_area_struct *new)
> > > +{
> > > +	struct pfnmap_track_ctx *ctx = orig->pfnmap_track_ctx;
> > > +
> > > +	if (likely(!ctx))
> > > +		return 0;
> > > +
> > > +	/*
> > > +	 * We don't expect to ever hit this. If ever required, we would have
> > > +	 * to duplicate the tracking.
> > > +	 */
> > > +	if (unlikely(kref_read(&ctx->kref) >= REFCOUNT_MAX))
> >
> > How not expected is this? :) maybe use WARN_ON_ONCE() if it really should
> > never happen?
> I guess if we mmap a large PFNMAP and then split it into individual
> PTE-sized chunks, we could get many VMAs per-process referencing that
> tracing.
>
> Combine that with fork() and I assume one could hit this -- when really
> trying hard to achieve it. (probably as privileged user to get a big
> VM_PFNMAP, though, but not sure)

Right ok, yeah I guess so. It'd be good to see if we could trigger it somehow :)

>
> In that case, a WARN_ON_ONCE() would be bad -- because it could be triggered
> by the user.

Ack

>
> We could do a pr_warn_once() instead, stating that this is not supported
> right now?

Hmm, if we truly think it might happen let's avoid printing anything for now.

Maybe just ++todo for experimenting with triggering?

It's not hugely important!

>
> --
> Cheers,
>
> David / dhildenb
>
