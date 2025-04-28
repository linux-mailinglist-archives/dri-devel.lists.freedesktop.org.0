Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E336CA9F6DD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 19:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBD910E205;
	Mon, 28 Apr 2025 17:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Q9a988j8";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bXl2nM6/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451E410E205;
 Mon, 28 Apr 2025 17:09:04 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SGfw67020206;
 Mon, 28 Apr 2025 17:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=HPgPuZIaXydV/Ez72g
 PWL8nl5OkKCxYiX1C1JJjaC94=; b=Q9a988j8hY/jQ3L87dsuld0pxqBg77/t2B
 3dJsLjRKH6GxsSfvGdGvvpw9FQiIVUu5+vuv9m07VS3N0UAAGg6Uk5wA3EY3miPt
 6T9Sz1EN2h/KVbMMgpHzG/3S7UidwTZcoSe6P6ukI2azKmtOE/mXYg9EpNkSFLMq
 KPrumIl5xtlWFMmDBZgKmNpbmQ7pRgAAkE4VBLNvF8etM2UL8GXTf3iS460hCzcV
 xjp7pqd+Kz2OuZ1BQy3TWhaalHSznv6YIQUY8Z06LqkLY4jBQnePMTXo3Iztr/P0
 OImi513iIJNh0C/4K/jtrXekCXAfqnugIc8MYMx8zj0kIK2IrqJg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46adbkg3m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 17:08:35 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53SGqHmF023986; Mon, 28 Apr 2025 17:08:35 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com
 (mail-centralusazlp17010003.outbound.protection.outlook.com [40.93.13.3])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 468nxexx5n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Apr 2025 17:08:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pioMQ9Fm8vZVFYi1OU84bD5WNY2QCm/bxyh6NK0gqBYqgdeUBMgBRYmOaL+T/JjbTNyjU7KTU59gk/lZh4cAkx2qoDZuRGZc02wWHIetRUvKvDYsbevGE+S0UrDqSUpqJTgLBLkdj8TH8RKPE6uCB8ozW9c5cSCBcKVo3R2TIFIJwHRhzV/MqzEgnVyNXl7dPFDw1lmWYjZokcWbHwwnFU9J42xlNmKmnlYwgix9Smaj0lDMMx/axJ6rPWN6g3Ezs4wlNwrOZgOFhkMHnrtkmJiYxG1sRYuxxLK5f4LaZG/7fGxmIc2z16nyPUQbNpntFdOzV6Sx0BSXjrOXBgHLdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPgPuZIaXydV/Ez72gPWL8nl5OkKCxYiX1C1JJjaC94=;
 b=PxDj8L+LwuIF+LR5ew7UGBMXMADpFwuO9voKYoUqfq5IEzOSKBWICOQ3KtNyAN+HWBSoOpqOoSKRTi4UdhqtRfrNJIQ1SAIxRRwbdHmb3EPxIzfXJKyt/Es9e4IEzA/8jTnCmDC5nZqb6D6EH1+c0fISjlLA1nYwdq+teCt2Fg1p+U5GQU5wdLzyw/eyTn7rBPiQ40EiD90Al2QYbLN5k+gWMxfslbXOgHpBOC/KMg9tY5/3yDIRdWy4SjOlXKDfev98FMCESL05C1u4Z0OJPuAVcfMVUprnaMH4qeILk8fkLH5eNwi9V8MqTsh3HeKoTTp/tW9yAYPru7SyGMNtQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPgPuZIaXydV/Ez72gPWL8nl5OkKCxYiX1C1JJjaC94=;
 b=bXl2nM6/NpsZOb5b51y0peCCdgRbDLaeRhDSfi7vQys5AxLyEod7o7HeMI47LuVmAXLfnBj7U+U91dmdCDv0EQf8AdFyoQGpwJTtbO3BcXTyk6xRaAsOcoAKcZR8TNGmtxwy/P1+14drCY8b+Wf9EP2eDFVDNb3gWBAJOsf9RXI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BLAPR10MB5041.namprd10.prod.outlook.com (2603:10b6:208:30e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 17:08:00 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 17:08:00 +0000
Date: Mon, 28 Apr 2025 18:07:58 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Peter Xu <peterx@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
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
 Pedro Falcato <pfalcato@suse.de>
Subject: Re: [PATCH v1 04/11] mm/memremap: convert to pfnmap_track() +
 pfnmap_untrack()
Message-ID: <f72185c7-7c16-4988-9715-c5eaf75e9f24@lucifer.local>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-5-david@redhat.com>
 <aAvp6umyw1AF2DbN@x1.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAvp6umyw1AF2DbN@x1.local>
X-ClientProxiedBy: LO4P265CA0125.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BLAPR10MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: abe158bf-44ae-4723-bee3-08dd86773b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kDqQDgq1Z/7gKlgl/cz+D6QyczTSegh1eQM+eScQMu4LgNBrx82O8oLXz7Gd?=
 =?us-ascii?Q?HSN5TW/G4TIcZNbpsd5J/sZDMiFTXyItHPNRvOr8VpF+lgLI+UXANDUWXpll?=
 =?us-ascii?Q?4jyyEaXy2BkM26UgEbwaizlCtRt5stvtVyH3uwQWDLmTl2lJffnMQMoEOKRe?=
 =?us-ascii?Q?OqpxWGCjKetReyutgPKSvksZruDmRYL6O/3EdZgYWb9IFW0mcrT8E4wm6vuz?=
 =?us-ascii?Q?390A4EJQVHJki3DxjCQICm+Pp6vH1oW5pBEXl5qOeW5/Ur58nUHiou7/3+3Y?=
 =?us-ascii?Q?QwbTGYYbO7Z45Jl/ZXJnzFW4xlJDgllTIvpiD2y81TO0H3pIDy2+GnZks8fn?=
 =?us-ascii?Q?RE64wEpYcIsmR2nzVtTWdvbzz31PHTb4Bw98eEozidf1R2vHjLEnGpk/sdmy?=
 =?us-ascii?Q?UFqCeaOr6Bp70enXKLgy0PwbuwiEWIuNazJghfB3l/ZLFkoxoye9W9UTyVec?=
 =?us-ascii?Q?5sgVro3eByVk69v+iBkS3/58vhN0jusO08d1JcH7xkyLGH+UrMQIuWN3C02f?=
 =?us-ascii?Q?xwGL40bdCnblTk9I15Wa4Pr2r5d38fllfiFyGNVGfYPo2Cs8YPRzD8VpAm30?=
 =?us-ascii?Q?NsdMEZWzVGiwO+RJWRKpVJGDF2rh5Yw2lc9+PujS3pi55JttK2YEReP4htQw?=
 =?us-ascii?Q?skwql4rwDKexjb9wmUoAh6k0/gQsLnfdRSGVcFkMhT056ICMqzPKcVBWeEHm?=
 =?us-ascii?Q?IZ1LOOs+67oYPeXjv1BgJjvLmdtSDzX5BStvz9+s4lnBfdxUcC1dKUa6IQat?=
 =?us-ascii?Q?faOSe4HjK5CL/z1XCnEpbjd+x5UE1YJfJV0tXokWafMKOCUKHnVarNDFL5Fi?=
 =?us-ascii?Q?SfjZgt2xFIJUBXuGX5fsWCMlq+JfGa35o9QxayTkEP5+PiNIycOp9u9kOcVi?=
 =?us-ascii?Q?YZp8IaZwCCOenQ1WoB53uUNsWwokn24EVq5VnbuSCLC4iSyZUdr2OPHU/CfE?=
 =?us-ascii?Q?trSUfDyUv/D5YgFbcv+oP5v8VFUK+tvpw/l/NJHtyea21TJjHPM+D8HIcixs?=
 =?us-ascii?Q?ue/tqx9w5thmQ0dQcBI1zTDZbqcXx+ebRllMzhVwijTkb3PSt5GnuQ8shT+u?=
 =?us-ascii?Q?uTSZvYj5Vnogct3fMeYqWoyBce5xJmFgjG4p6dVYvvFWm0XwiswVYbiic+67?=
 =?us-ascii?Q?DeD2iz5gYanlwKvdYUn1cdMZtMVepx0Q2Q+AM6Or0gcMv98Vm50JA631CdY6?=
 =?us-ascii?Q?kR1OrWKEebl2Dh3lUh2pxwpyo6bxqmaYntfSkXw7E1WfSd3HAfsYYWF4AsLt?=
 =?us-ascii?Q?QpPtVY79/KjeBzH6NtaBU3DI08tMmr9ixTtlaOYOeM/5L4khQCANGm9vlGPq?=
 =?us-ascii?Q?nvVzcvjg6Qioa0X1IsyaE7QMLxSK4GWMwy25FrqjkuRLqwbg0GlQ05P0r/7Q?=
 =?us-ascii?Q?/YOaT3Aa3rzjjtGPu9hnP2fSNchTz26QvKn4UTnNY/2mHvbqV37IogLtgK3Q?=
 =?us-ascii?Q?VWxdd8tZW3c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VxARSPYPHDd/Fn0lovVB5x7Rygtq0+bSkNJ9/b8XYc8wDhWerEnVsNiZXdju?=
 =?us-ascii?Q?4ym+nLSAKcX1+MjFqNtGSOiDYP1oW7nXON16KFwi1BKsupOV7JUbuOh4Z5wQ?=
 =?us-ascii?Q?6sFgxsNz0w43Pj9ybQyQA2pGQF1VuOjXvZWa87sywUpOxJrllG+DiqEp39n7?=
 =?us-ascii?Q?nbjThgfftivR/iqUCViqPfeLafv+cWWTycTv/gSNXeq0kTQVcC4iXZ4cwJn/?=
 =?us-ascii?Q?c4pUREM7fllZhzIBFGnbn5k2Md4H5mX8PlNnEIjjpMo+PS4SY494SnmWmpy0?=
 =?us-ascii?Q?yyImRbg0ibuGCUvCY9pXNYjVxyWG8tYQkxrERln9me1AWaan0QWVEjAhyAYz?=
 =?us-ascii?Q?wl2q2WeIzXIOOwIi3N64obFwHvmq9XWLrERZIhRp3Gm+MQw9qRGH4Q+y/pRc?=
 =?us-ascii?Q?hMjmkJO69E8KXNzrMeIIG4QE9zBxDyTvwLnuS68Rb2egmMAWX/AMbxnPlDTb?=
 =?us-ascii?Q?fWqObiJjMqASVP/KtkILXueuBW13NzcMgvwTM+rqRYAs79iFWp3tcnLEA51L?=
 =?us-ascii?Q?PzRHP2ezI2klAY1EDy69GHjAFEvo7xMVAopA6OS0LrzS96kDxV2lB4b/ZL/5?=
 =?us-ascii?Q?Glqu9zAMd0ePyaIm4lquRsofnxlVIdXqporfUqyZV2sNW/2DapSUbsQu4QKR?=
 =?us-ascii?Q?eXGptVB9KAAJBVIbzkEik12BTkOO2P+cPgIfhonXvM1P3tZeTxWL/uarMKXv?=
 =?us-ascii?Q?mGJbL9j7SzDnGyOnRB6r0fW/kiXnLhb+YEVXKFqy8cOpQ13shg9RwR6tj0hM?=
 =?us-ascii?Q?8TuX6/oxSuLV3O1M/sIpO+R58rRzc9kRvazVEGGUEbNx+mr9/RwMN2tqRTjr?=
 =?us-ascii?Q?sR8z5pdr/TwvIB+uWROHtKDf44mzbHt5kBTEspcc0eBP3TwJfIFA6q3XflPu?=
 =?us-ascii?Q?dcsa6+xHfMpXQ3hBaofzJ1RrdknOtmgUxnQrfIs+HVmcDT/qhEUS+kR0tkRL?=
 =?us-ascii?Q?WnLMm/EC3naU4G/2Otwo/FPTYGvDDiHxa3IQr7XXyi3XWqIdLNLVYPHCyAlC?=
 =?us-ascii?Q?qMf5fkXAfPQ13s253gHBSqLnFcu6JkS3CacnuWJjjVgFfPlNl8jd2FlJhy4V?=
 =?us-ascii?Q?YJbcY8LAEtFDU5BsE2n/+n4V6GWZAf6lWtA4I4BKPhQJYtw/7IFX9TWsCrKa?=
 =?us-ascii?Q?y9qMtr0OfWYopVls6eJj7TpOHuS3bBwT6sg/oRTKhiCbGzUldi5sVBZhcLA+?=
 =?us-ascii?Q?iMOlOsZh3ot0UHxeP/k/tr1lSSaX0iBWvMJiROYGdPtH2yPs1BvKibojr6ke?=
 =?us-ascii?Q?WuHa00h95eOf9SqNnrTFf/7r9MZrwEpBsIVdQ8W2J4piNbj8/HQTccI4Q6aM?=
 =?us-ascii?Q?ovhIkiSc22dIedxvm0MKYLDgyfC7c8PEbke+rSXLJWinn3ESelgpGswyD8iz?=
 =?us-ascii?Q?vBkD9fl01R0+SOFwDIQf44/7NxwoQGibLCpWCLxTnYNrav7GGehv0fDARiHd?=
 =?us-ascii?Q?6sRbHi+1WyMvzUyOMTcdqOQm2Bbb5P4SD8klx7q583NbIx6Nfz8r7PBnFFCl?=
 =?us-ascii?Q?b3mfoROLoxH8Mw1k7GU2gYyvlhrXvG3Dz/5fQILVz5vH71NLdQCfAPb3VO90?=
 =?us-ascii?Q?P3rGgz6pieAXI2btWhOnyKC4xJuHc+RkcYzdg+xmofCWZOKlw6ZsXE6z7VX0?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ciF1osizMxVD/VJbV7Z3TmgjUmKqh6KpY4SIgS7D4jVPefIayWZTLsJXayurfTKdSKAf2Cw3U0ewBGTkRMlD5X4e05PXl+2vIYKH7hyj0WmkuLPpdoMtLHfGFCbuhHzgldeIFqtWT6c1c5uTtW3KsEn7Dg+zEU6D+luSafjWqkDFHbEclsEhxq56tiPl7Yl1H2ZL55Q9cL95Q2U5tVvgifis7L5xLOr7YraXvlgYXGdjlonaP9hJhVfVjg/z5b/sWxi3NYomlPzeG6mF+acdmoutobakbjNTOgF7fcLQdkgQcQq507c+1VPg5UHIAL/0cmvbFP4RuTmiW7PML6yUNhVa2zUC63ThrLBCTW5DYr4Tae02oUULDK9KdxO3T3v4oCTGzrMYRUOn4LcL7WGPnM8EghyxUAoT92aVXXgbTVTNDXFakH6pHCpoFQHnnzaG+NubRaHkD7O5L80B7QOcIeXGBT8JciusYjwcAkYV7izWGBNN/LGsHm38nEM/byw3TbWvm8GUQ4st8PRAhL7So/jsP6MmCvlBno3hKKDqGmd2Ag6gPd3Osqye2G5XNwy86+LJFyFkczWyooE34rhKUHs2OloO9ZhmHCEbLTDdwgY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe158bf-44ae-4723-bee3-08dd86773b0f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 17:08:00.7768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hTH/SW9RxqoqeWA56zYDIgnlmnV0RNOeACMmXn7eZf9bcrMbYkLNSF5NA2bLqWAjtKcWGeAl6YBQzMO7ui4NZwaSJDBPV9ZgmXvonAv6h3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5041
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504280139
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzOCBTYWx0ZWRfX0cQdXGn5gfkD
 1TR7HL3tIi3oxUjKTUAf5npCUTIAkIqWgdfRgmsA+bESC3rQl7EPnmS2VNLU+JjPDGqFIqxeKSD
 mwgvtGqcG+4Mxcmbek8SRuF5sxhjOVAiPQJruriK9rw8xmH4fAYF6QZlBvH3yo6dTOkKsjz/ekM
 9D1ZTNF2jhthpBXrFJ+vvdhvUTxCzr6QWUotcmEwnHn54SX3S4DwYYrzi02ucTh+xEnZLQDXrJ7
 shqkG28PcA7PUCKdSShZ50dkjwZ//hi0oXYae25GcPOyb8ub8GnZyzHyklYP8tQaEOBqf6bFrFr
 90kch6/EReDG4PXmjLWnv/c6WDDIUHqPzfHimmKd77WCF6U+Mxf8NUOxmna0k5DkNZKvdyD3PGI
 DR03p8rk
X-Proofpoint-GUID: CYmQHYMCobsM27Wvfx-tk2g2NxhJoFW2
X-Proofpoint-ORIG-GUID: CYmQHYMCobsM27Wvfx-tk2g2NxhJoFW2
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

On Fri, Apr 25, 2025 at 04:00:42PM -0400, Peter Xu wrote:
> On Fri, Apr 25, 2025 at 10:17:08AM +0200, David Hildenbrand wrote:
> > Let's use the new, cleaner interface.
> >
> > Signed-off-by: David Hildenbrand <david@redhat.com>

LGTM, albeit though, as discussed elsewhere in thread, this should be
merged with prior patch, though FWIW:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> > ---
> >  mm/memremap.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/memremap.c b/mm/memremap.c
> > index 2aebc1b192da9..c417c843e9b1f 100644
> > --- a/mm/memremap.c
> > +++ b/mm/memremap.c
> > @@ -130,7 +130,7 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
> >  	}
> >  	mem_hotplug_done();
> >
> > -	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
> > +	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
> >  	pgmap_array_delete(range);
> >  }
> >
> > @@ -211,8 +211,8 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
> >  	if (nid < 0)
> >  		nid = numa_mem_id();
> >
> > -	error = track_pfn_remap(NULL, &params->pgprot, PHYS_PFN(range->start), 0,
> > -			range_len(range));
> > +	error = pfnmap_track(PHYS_PFN(range->start), range_len(range),
> > +			     &params->pgprot);
> >  	if (error)
> >  		goto err_pfn_remap;
> >
> > @@ -277,7 +277,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
> >  	if (!is_private)
> >  		kasan_remove_zero_shadow(__va(range->start), range_len(range));
> >  err_kasan:
> > -	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
> > +	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
>
> Not a huge deal, but maybe we could merge this and previous patch?  It
> might be easier to reference the impl when reading the call site changes.
>
> >  err_pfn_remap:
> >  	pgmap_array_delete(range);
> >  	return error;
> > --
> > 2.49.0
> >
>
> --
> Peter Xu
>
