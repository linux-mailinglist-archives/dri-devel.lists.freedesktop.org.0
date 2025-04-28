Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585D4A9F647
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 18:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D2E10E199;
	Mon, 28 Apr 2025 16:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="kPo9NlPS";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="E1t9GMiE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653FF10E199;
 Mon, 28 Apr 2025 16:53:53 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SGrNvp004327;
 Mon, 28 Apr 2025 16:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=RmdmhPzHKnDTizgn57
 avlmbgX5iGubdbvYo+jjZJoZk=; b=kPo9NlPSi5Nc+K39MZce4RawP2pZb3KxRL
 RhwpKBTkS2vaPqYqPzQTupRyyV8Exxh0babdcRNauALUu7ye7z/0WSdie9ApIi0i
 HZxyEu+sLfBO+P5SIrDp3eupis4hDNXTBVVj7n06zj1ZNQkBNiPR4Dcm5pc3Xy92
 5ILHMws83tkI+is0f8GqgnSJ6Pp0taeqESq/dsk8Kf8tFf7jgCRIBG9sgNpVx2fb
 lb+LstDR68JfgS59Dt7jz0GxOSzm7DEILscvOt8pU0nVK+TdloEx/MTDluFU7Bm9
 SYi0lSFQ93wNEBex4daXZ8QZn0Xep/M0kpTgMe6Nulb7y8s2vzsA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46adjv000w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 16:53:23 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53SGqGiZ011320; Mon, 28 Apr 2025 16:53:22 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 468nx96tua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 16:53:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfMjgDAEHQ8z3BUdSCytAH2A49JdXBIr1XrYvFGn0MSiW3rHe2az2MKrWAk8he0jwuy8vYZSr/NHVnIyaD3yWiLZO2AaOfLl3PAZKhDtLgHdUN6qe1jJEoSCiF3/sWeiuPOwhEcsJ11G37el9dDW51Qv4NPzqMAaeQ5O+Ivq8+Gc33HcaZtvl/Mj9U1c+kZlUa7xGYo9HGj7W/eHWPrK4Xe1vUiy4pMA4IlJYJHUDWLdkYHkuej6xGSwWW+iM6QZotGwLRz+56KoftfPiA0Mhk7yS85B8BT+6v67N9KeEiOlLqhe7PfEjcaRXW/hWSj85jGfK4qihOH8tS6hDjhauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmdmhPzHKnDTizgn57avlmbgX5iGubdbvYo+jjZJoZk=;
 b=KdrsvD6ffjb5miR7VLrlG5jAPGEphnqPYC2XxNDgCQmX7u1tZ8VGDh3MeIDiyoVUELvHT5v1pPgZtkCpJnt9/zqPIfBi1jwNkZUWBVSaGA3g8WMqds3D7D5Oi3qVM5RZ7NTny7cnjYm1AOtcuo+twKxlKlE/nINtxnLYr3tKdIPNG/zHB2smAPAHqHvwHmgIl94UxsCxgg2HViD53J4y4z480pmHxQs77OCg31eBrOfAb7o7NWS/fBYt/pTGKWI5GlOKe/CHH/j8hGirDWBAzNsI2bQ8m95y/Z8gl2j7jnVxzMtrDpgQ4JxhvqP9lhplJbUELi1tYAShWZ62zXFwzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmdmhPzHKnDTizgn57avlmbgX5iGubdbvYo+jjZJoZk=;
 b=E1t9GMiECl+z/LvdfJcy94Mm+tORYazCRPwI0OYWC9fAy8OeoyyyW4kUw3DVBMJRDjHByzx/ctcOFNe1t+LqjvmE6Q70S/wPeAtj6Qarq8Hjf/5mwjvdoiSIOdHGuLweEV0oWYw1xgyOOLNfYiJ9A4yICo4m30WHsocbMv5KIt4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB7156.namprd10.prod.outlook.com (2603:10b6:8:e0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.30; Mon, 28 Apr 2025 16:53:19 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 16:53:19 +0000
Date: Mon, 28 Apr 2025 17:53:16 +0100
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
Subject: Re: [PATCH v1 03/11] x86/mm/pat: introduce pfnmap_track() and
 pfnmap_untrack()
Message-ID: <554a6063-268c-49a7-883b-c39cf541c146@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-4-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425081715.1341199-4-david@redhat.com>
X-ClientProxiedBy: LO4P123CA0233.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: d78bf711-b417-4752-4057-08dd86752d9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iQZzItF23+Yvv4/22fZ7T0yZUgB40ESWPEWF5LXnth6KoTq8JabDGwKnY+b9?=
 =?us-ascii?Q?AMqsYuEyB/LoGyy+C71dCsP8tTHjt0ns+kCtijTHHBTKJvnvhFrwULHaNu63?=
 =?us-ascii?Q?rQHKnjDkJD4FZMBvb9yn6n6SWqG6iW8NR0PXnjkhosLvr5r8R4XjBk3WrAb+?=
 =?us-ascii?Q?lPEWOBkN8HuFFQMtc93SsE9gmkH2iJX5xBuPWh3oJWWWJMAPiFRqKOX9b4dM?=
 =?us-ascii?Q?GIZ7bPs3AEEcihJZF5HjVh/8G6qA0WfuhINEd74Dpc953p7qrU+0KMp5MLq3?=
 =?us-ascii?Q?SF6eNLudbsWFlLuUgtVnXyfLwETMnHTSdHKMJSEcvu+JmD4FEwXQphUZP/lm?=
 =?us-ascii?Q?3Q/SRlTmXfNh6ORtMlascbegzVl5peVrF0nqR03rJbrCiv94O4jLwW6iF+Xs?=
 =?us-ascii?Q?gzxTV8/EcRegE6IzgT64ZiA8XSLMg3AopgdLh5/qloGaEJLVSMlFfJtYlfzJ?=
 =?us-ascii?Q?3WJ9Ydh1oy4Z6mfwDrvWCe3OPGHjA+UR6q5lMBL4O4mE24LTQL6FnHWsIQx9?=
 =?us-ascii?Q?D6ISyBMaHJk/Xxrc0z5vlTkXoIyb1qNZ4Rb7WaOAI09bqcumKfDckTRPAKb8?=
 =?us-ascii?Q?iDBAO0zkDnr3iaLYqXuko0UYI45X6S908OsktzRAMn2TWMOgCm9q3FoZVv9w?=
 =?us-ascii?Q?JHV+3QukDIWjvt3Yp/2MXCheVxA4IWJ97PTLh3DPD/dQoW2z9GH2quhkcaGD?=
 =?us-ascii?Q?EQaV9ITb6btKbN2wGXEAShT5JhfdW/6BPFzAjZve606YcPzoGoJiOSawCT/T?=
 =?us-ascii?Q?Sk1ufbCeNiOKhlpzGx4KWmAO22xufA/4FYE14nNm5YBL4IWyxIlZYaYfQTIC?=
 =?us-ascii?Q?tKBHGOAP2aQ31ATIdQIdFe2kTd3fO8WvLrRHszwMafCNZSrRwos2NSpwVeKw?=
 =?us-ascii?Q?Qi62sHdHmC5xd9mFuJVKYhLiIyhousTGSKzh1wKto505WmB1Ywr7q5hl21i5?=
 =?us-ascii?Q?SGeztCGvBTMgQl10WeYRsO+vFfYMhYZhOgv3qhveBoqN7xaCFOGP8RSSjGmM?=
 =?us-ascii?Q?q1z1v9e6gFvIhzuzDXFoiD2y8vtw3fIFF/wq7X+xiuu1HUBpjukEyiYE+BGc?=
 =?us-ascii?Q?FHEhW51v2kIpG6t4A43I/IT9JBFIBj4TODqq90y5/OdGcDSGWsxHWGNK9r3I?=
 =?us-ascii?Q?Hq8fEk8k/nTRXiDfEu9qQut3b3yPb4dYMuOYTcJwlZYqw5nPXoxkTqyxzXCx?=
 =?us-ascii?Q?8xDaiEkWkYsPoxw1zlvgoV6yxwcvvbsr6VN6Um8PPRBKDpy/8OPecZ42eUEn?=
 =?us-ascii?Q?CPhDv8BUaESnhjremW1WH952oszU4Zgv+XZ4EHDhx91wNq6wRyfIxux7Eckl?=
 =?us-ascii?Q?aJxcgvpFXHDgvEtZ8IGSzx5V2EjF9N2MEl7ZbprkV0YOevbKe02ymHVZFNGs?=
 =?us-ascii?Q?Q9vn5/DoVL9aIJsEXA1S19iBh1Hk9vUsKeOaoNItXS6uy77H7BmuKnkftbfB?=
 =?us-ascii?Q?1L6CWFm/EgM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gSg37uT0u/DVL18+thBSKxUyPmilfNxk1etJLvGVnXEs55jwadG8roXy57rv?=
 =?us-ascii?Q?aTYqy+ZYHzyQ+OhCrhDv/PpqwzuztsdXm97eh4pH6f7cnrcx2DHrWYsuREeZ?=
 =?us-ascii?Q?7xJUzxUkxFp1rRGtHArhc9tiQajurCIsAUGFbAsnBNGh76DDTzKYAjVEEB2u?=
 =?us-ascii?Q?JV4ShGzdX4rxjr5LgXqIPz2GbfiTxIuppf3AwOdY+z8ZqxJ9/lbbKy/YIW+1?=
 =?us-ascii?Q?WTZRK5gfcHc8RxsDl/QTQpMiWA6iPCofvM5wRijwbjOcITdgsyd/VdNeZE8f?=
 =?us-ascii?Q?s87y1xbbXtjn1BJVGSXr/ub4Uu0z3/NuxcgGHLXdlTCK26cfAvDWto1RmW7+?=
 =?us-ascii?Q?/TMdg2Ta1RhfE4yYaQjawAi0hVyrJ7jA/ySGorGtdEqUPhuFBQwNpeQwNOr9?=
 =?us-ascii?Q?laQcAHqsBFI4eYYo6bmFbbiEVlpm9PCpXZP//uE9Oa1RvMCDXjS74nh1Ne41?=
 =?us-ascii?Q?Em/cUx5IgmQB0aKfRg5KtZZEXWG9b0Uumf4lOeG1toTMJnbVhrPe2u7JJT8v?=
 =?us-ascii?Q?pTamuUK5szZ0RCIWmy82wuYI7Pqdu+TLwnF89rOUL9FfZpw7DA/b3vOdDj7d?=
 =?us-ascii?Q?dxCxevASmZq181ECgxNoW76idT2PFvFmECmEp2DLuy5eEG5Hd/H4c3VQhCjJ?=
 =?us-ascii?Q?y9AWPimplSw4tiui64xaEELGsPDHtbwdv69KxmgeG6uvYRJ7Kjq3vymd1DfO?=
 =?us-ascii?Q?/yEK2kwPd1UHo4/cOwsfMzJGs6nE9EcgBlSv0UByF54x16yFO5ABgsoYV5VT?=
 =?us-ascii?Q?G+/wa2ZPT+a5tiNjh7m/5ltDnV8gD5WcIeqn80egXZ29RNzyycehvEIm581K?=
 =?us-ascii?Q?aQhtcxhw9GSWlpiU+zZNw36LbnF8iPmqNGMbkmVFb6LZmX3VznQWwlxkK2Cj?=
 =?us-ascii?Q?pKHgtvdE5rzKkDRIpUMLGmk0hvOsqPLVQsL/k3F7fn9oNWURoNa9rSo4eOSZ?=
 =?us-ascii?Q?g8MoNL7Kl0qfx4WfSQhQI4zo059l89ZLQEBO0yzy0cRhpIDqyviLEq7MtEci?=
 =?us-ascii?Q?vjm8f1rLnGwaPsd7ILbhDwalaPs0nZKz/bIhLMEp37cXxjla1TfT626jm9ly?=
 =?us-ascii?Q?5GRZAeJYu24wbYHMX2o4jlw+Gtjt3lkC2gsaOVC0P+FSF6IezQy8lBBxLp2S?=
 =?us-ascii?Q?LnMZbQDY6Jbihk5igyVwcdZPYwpWSpeqfuVgEOMtC5oFIqfxTttgWJlPy94+?=
 =?us-ascii?Q?3jtnHZxW+v5yYI+BQQ2a3yjxSKf0HLRNbKbvvSPEyFCFaIgMu5e9ViAMuD0B?=
 =?us-ascii?Q?39EeqVqs1nWZgvNqYj0kRbhLw4Dk0fZ6+AJx0WbmGstgVOpf/MGcEOgjHlwR?=
 =?us-ascii?Q?Iyl+rmkvN04nYvYZ/vkK/5UwsvDQhJOZ3P2PAHkdHL2qL4J3UOXR1ucrj5hw?=
 =?us-ascii?Q?lhgLKfXpTIMJfLLvuVM1ORqJQuytPIlxswieitgHgQqnKA1cJ1+cq/025Dc/?=
 =?us-ascii?Q?Le3Clro2+DinpEgsU72pnZeJ3CGv5hXsGnGUlKkqAWzJTDq3gPaKTdSpK+A5?=
 =?us-ascii?Q?8j7kOxGsqBZxX0x/L1uEf/oD4QzLNwtzCZGCIQTVGleJGyRUelL7AGZWuKmb?=
 =?us-ascii?Q?SRsD05xFa/P58FQQGP8g9MvteLC5NZiAlGwOEwbh52Ps1URQVQ3DQXgnq4mQ?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: oBmj5UWNZwAQqNT0QXe7GvGRmEvEeuHafRf/tByictiiX/CFFlpAHHhITLFMQGWqj2abnsiU7K6N0vdUn1O8195Br46YOnzVxBFNw44HVGQ912lk+0LiEQZvrsz8ztTL0SNbBYvbFn9u4RyCLMvXcrE0sIHxViEtDTiccMQf7f+hQErRwXuUAQQ1TXjogXSmNGJ+TlzhkHprx4XmC3a2RLFcdb8vHMhBHcaSIr7v146YNynmVmJdrD+XOpbIw2dcfrr2iG56OTs0qfro3J5Defo2MbQ0Ht0nRWP+CmBJw62M7K/VV2WKJ0m4vBZRfDc1uGU+jjVA4LaiZDHAqn4X9zZkxChFMfP1EijOI/MFdaQLPOmLHnBVFDPsV2EDZY3tFwZgEJdrpxTnPfgmF8QsZm8EZKNdMn8GCEiWgAM4T6RBgDpjtcAsUlRNUHxWKHzUbvR1ZJqzS844RFqq7Q8EFchuyjiUyAlxG1m1P5XCeAVLJAltdiIhIj+rreiUY6wvfIg98Xgufp9+MeOMBVCD4LjKloEQsnn+X/95xuTLUeSly9WTN0RpOYa+/K9g48L5WqHjp2dquULJHtsXwMq892LbIt6S8OxNXnP8dan0dj0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d78bf711-b417-4752-4057-08dd86752d9f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 16:53:19.2152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OxXmy7S15U53VA2OQ5hKEy/W/beDz5KAMBOu7XJgiKnAtMpd2/iRPE82MXIN6qddmNfwFss/xwefRwWt1b2NeJ7gP/UzD9NJiVFKheng6dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7156
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504280137
X-Proofpoint-GUID: kVdtcFKUmAPZfexXoDoEz8JL_WyEHYY7
X-Proofpoint-ORIG-GUID: kVdtcFKUmAPZfexXoDoEz8JL_WyEHYY7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzNyBTYWx0ZWRfXwWPFV+c3V+o3
 AONcRIQ/rx2DmVOboD85/UX5db+cnhKXQHSpr9whNeLMXF5u3Hxr4hNN4ge0KcNCeZ84ZnkLW7x
 7TmSGb1CucWpnVSjT/jQPoyS6bc2/YBMk2aJCReDt0bnubS01YaoXtmjasCKMPn5NzZWbMzNyB8
 V15iSuYJzg91hW7I57W8gFcJ9vAlGfKog90ej0f5ZvaYZ6ox2J3A2VBquZgZ2r3Df74ZH6+GZZ4
 /sOiocnwEhxwobPzRLZyyU9parWNu8gaY0f9JjXhB4GaQjwfboB+eS6GI/CTduoPGDl1qzudwBv
 zMgVxcaPwUz+a24jibfbdYnl82GpZ90pDgHMsUmpYg8ThF9ubOpESZAbvimU2xWhhZWF7LmAIPH
 M4k3oK0Q
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

On Fri, Apr 25, 2025 at 10:17:07AM +0200, David Hildenbrand wrote:
> Let's provide variants of track_pfn_remap() and untrack_pfn() that won't
> mess with VMAs, to replace the existing interface step-by-step.
>
> Add some documentation.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

There's some pedantry below, but this looks fine generally, so
notwithstanding that,

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  arch/x86/mm/pat/memtype.c | 14 ++++++++++++++
>  include/linux/pgtable.h   | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 47 insertions(+)
>
> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> index 193e33251b18f..c011d8dd8f441 100644
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -1068,6 +1068,20 @@ int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size, pgprot_t *prot
>  	return 0;
>  }
>
> +int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot)
> +{
> +	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
> +
> +	return reserve_pfn_range(paddr, size, prot, 0);

Nitty, but a pattern established by Liam which we've followed consistently
in VMA code is to prefix parameters that might be less than obvious,
especially boolean parameters, with a comment naming the parameter, e.g.:

	return reserve_pfn_range(paddr, size, prot, /*strict_prot=*/0);

> +}
> +
> +void pfnmap_untrack(unsigned long pfn, unsigned long size)
> +{
> +	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
> +
> +	free_pfn_range(paddr, size);
> +}
> +
>  /*
>   * untrack_pfn is called while unmapping a pfnmap for a region.
>   * untrack can be called for a specific region indicated by pfn and size or
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 91aadfe2515a5..898a3ab195578 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1506,6 +1506,16 @@ static inline int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size,
>  	return 0;
>  }
>
> +static inline int pfnmap_track(unsigned long pfn, unsigned long size,
> +		pgprot_t *prot)
> +{
> +	return 0;
> +}
> +
> +static inline void pfnmap_untrack(unsigned long pfn, unsigned long size)
> +{
> +}
> +
>  /*
>   * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
>   * tables copied during copy_page_range(). Will store the pfn to be
> @@ -1570,6 +1580,29 @@ extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>   */
>  int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size,
>  		pgprot_t *prot);
> +
> +/**
> + * pfnmap_track - track a pfn range

To risk sounding annoyingly pedantic and giving the kind of review that is
annoying, this really needs to be expanded, I think perhaps this
description is stating the obvious :)

To me the confusing thing is that the 'generic' sounding pfnmap_track() is
actually PAT-specific, so surely the description should give a brief
overview of PAT here, saying it's applicable on x86-64 etc. etc.

I'm not sure there's much use in keeping this generic when it clearly is
not at this point?

> + * @pfn: the start of the pfn range
> + * @size: the size of the pfn range

In what units? Given it's a pfn range it's a bit ambiguous as to whether it
should be expressed in pages/bytes.

> + * @prot: the pgprot to track
> + *
> + * Tracking a pfnmap range involves conditionally reserving a pfn range and
> + * sanitizing the pgprot -- see pfnmap_sanitize_pgprot().
> + *
> + * Returns 0 on success and -EINVAL on error.
> + */
> +int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot);
> +
> +/**
> + * pfnmap_untrack - untrack a pfn range
> + * @pfn: the start of the pfn range
> + * @size: the size of the pfn range

Same comment as above re: units.

> + *
> + * Untrack a pfn range previously tracked through pfnmap_track(), for example,
> + * un-doing any reservation.
> + */
> +void pfnmap_untrack(unsigned long pfn, unsigned long size);
>  extern int track_pfn_copy(struct vm_area_struct *dst_vma,
>  		struct vm_area_struct *src_vma, unsigned long *pfn);
>  extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
> --
> 2.49.0
>
