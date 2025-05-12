Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993F5AB3C92
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 17:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC7D10E1C8;
	Mon, 12 May 2025 15:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="BUObKzBM";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="V/WpT1cf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F5F10E1C8;
 Mon, 12 May 2025 15:44:06 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CC9spF004037;
 Mon, 12 May 2025 15:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=A3qsoTVBmlmDiup/lD
 YX6I4BIKG9TKE+XyPynM4cFnc=; b=BUObKzBMhKpi5Su/SwzANGtlp+IIkUx3MN
 J8dqaE4gIQ9Oeoc4FSe1gAHcv1RQeFzjJ5D8dLkWqtAPlXD1qlCIVTlpP6MvJAJ3
 uuy9Dm1KILpV6N+HmRphqAGWwTwLIn+wN7IP384CTEiEijdLHude85E6lbeWUmuU
 j2txVijr8Ps7JXJC6cy7walOOb4lYa/kkcjqrBQjwL3EFp2kKE3e4U29YZwQL0SB
 W1mQNl7fXxiOivryKtWi2+1tDP1dAfb39AHPxAiUsvzZAga8dbgc2D/jPm7wlOIe
 WBkRdkO+XmytDjbeqA4+9883f245KzqyvXFCRMgWiP5bOYlPszkA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j0epjt6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 May 2025 15:43:37 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54CFRCRr033163; Mon, 12 May 2025 15:43:36 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 46hw8dhtsw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 May 2025 15:43:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFK7xb0Ozst1Lo+VS3swXxNKaNCeagWS/a06+kFdpXXPW83P3DpKZ97g2Y5CNSrQDF3Uu2/x85xysXMWsFUiBDXPEDZTOSQf2gE5xyCKm2KF2QIbuIzQoboJBCULgWNciY+W+ZfqNAKE/FG7pA8HA/VoXrpaE1Tre4jP1q8xXincocfeKSCchiEAajedh5A0RdxSIzgAu6KoeDys3akT6C9knp7dJufwwlWO4wJEjpOQ5K0d2rCA0k+3+pffhavwVRKul5CthWQNia6LtLQkR0dMdWvtcs9XS5d3cQ2mQb9KoHsv7B1XL18iBCa7aQh5b+eJqhZDvDYZ4LGRmbuGWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3qsoTVBmlmDiup/lDYX6I4BIKG9TKE+XyPynM4cFnc=;
 b=C0hngW8Qwnl1UhiZzmQVWHGzk+6xSp3gJCiNO1WZ/4/DBPO1HCisuYwbJvEcmFPYGQrKzglIjiE20d8oltYrLPuNDhP/jWb+ZQ0OuNTYY90IvyViqLposFwFRh8uKfoZ250Dz6es2yZCcvxDqXJMk/8W+hC6egy7TCGG4Ns6OQJvkGQ+MheEq8vMW0z0RcAaHc2mb3lCn+r4zObyUlKJfdFip8TQDquJEdSJDhLBu6Be0L/+zWRCJoS+CbSEXMSmmBL11Qp7Xo0tLKGK6GRHXxos+Qif75xTek26kDWbuscaLG0HINmev9BWp/Ao3+NMEwdtkI5+6iCLdVUiaU+lqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3qsoTVBmlmDiup/lDYX6I4BIKG9TKE+XyPynM4cFnc=;
 b=V/WpT1cfNov2j95NpYRRsCviaJyCq7udpB3S3teD/6Z9V4WYai8O3kZqoJw8bClKG+WJnyGi6TommdCtjx4qNgVMN00ogmTdcj0QiL9Ces+D5JPYMlOgFWz2XUPEjPmvCuaP4TqzfH4tBHMS8YvwpDSW7LOKdT5eHkKDxW5eaYU=
Received: from CH3PR10MB8215.namprd10.prod.outlook.com (2603:10b6:610:1f5::7)
 by PH7PR10MB6507.namprd10.prod.outlook.com (2603:10b6:510:202::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 15:43:32 +0000
Received: from CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90]) by CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 15:43:32 +0000
Date: Mon, 12 May 2025 16:43:30 +0100
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
Subject: Re: [PATCH v2 02/11] mm: convert track_pfn_insert() to
 pfnmap_setup_cachemode*()
Message-ID: <b8b9c0ec-3654-4231-aad9-fec702bcebda@lucifer.local>
References: <20250512123424.637989-1-david@redhat.com>
 <20250512123424.637989-3-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512123424.637989-3-david@redhat.com>
X-ClientProxiedBy: LO4P123CA0120.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::17) To CH3PR10MB8215.namprd10.prod.outlook.com
 (2603:10b6:610:1f5::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB8215:EE_|PH7PR10MB6507:EE_
X-MS-Office365-Filtering-Correlation-Id: 12d2e903-3864-4746-1795-08dd916bc01c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k0ZDgotjcBdOljkiNa7Ki9zPWYy2YyT1mc1pdyZthX5l8XzgljK0EGrl++AA?=
 =?us-ascii?Q?TJTfy598FqgLB9aVatCBy1Xm9ASxzN1uTV7oS7Ovo6X71/pyOBRGNy5VUDdq?=
 =?us-ascii?Q?NzbVisJluoj0uAnfnm5S4V/fzVL9FPzQNK7VXp3oTsDRJCzdVSaLR6bMwNwe?=
 =?us-ascii?Q?6hRaCnz6BQvoNRXu26RBF9VT42ruWU70FsqwtKeSq7/ahRgnp8F5lTFnu0mu?=
 =?us-ascii?Q?yZi1fdCrXxrYIj4jhkM9Rf32unLnsOCKGmWrIIFEqRAzMNQol1sOTyTmCYyK?=
 =?us-ascii?Q?zQeZ+116ltcgPp51oKuCpGc2SKt0Td8QRgebj7IqpKCLpKibSpNAyJByu6CY?=
 =?us-ascii?Q?HgptBpk75E3FHi8puRjEPBXNPEH+B4q0qBotrBcTO29Dqj4/AmiKZizWmU0f?=
 =?us-ascii?Q?lJtGLrQuQwCoIP2KcI8HywiYP3BqeBV2zyOjkLkOBv7iQ57nhmA9OiUUdGsq?=
 =?us-ascii?Q?gzHrj94kRLY8d52v0TP4gLmX9B/hiy8sAx/+LOhY9Ovm0sBeSlkWb7vtMhz3?=
 =?us-ascii?Q?17CzGrsc2IbYmYXxBVQiDkx8VUE684w1AUno+ZNj/TPrdM9v3gws8jMP+r9Y?=
 =?us-ascii?Q?+wW3yjqd9GZDlEcyxOhBsik8f1DVifSdsidOKd5YZbP/9HJOIhdUh3lx4Djp?=
 =?us-ascii?Q?aRMhP/x0UnRw3I5tXrf6FqQvDd2N17ZjtyKu4fs4c5pIYKujGZ6gHR5vwatM?=
 =?us-ascii?Q?fi+4txWrXYTXjQ7WQpJf6bHeJjsABZPY0MF3DwUnj15rIcfX239tzITvBd5n?=
 =?us-ascii?Q?7U787VfQJpVLuZyu9S4VztC+UbEcW6Z2ffeHqFoXv8/TPmECrw39ZQCQJ+vj?=
 =?us-ascii?Q?M7sC/w/5oXEVE6PLFnP7DU3utDI6p5Ry87XbtV/hNLiPtZL1btbKfSEKAkQC?=
 =?us-ascii?Q?wyY+Tvx3NNYVuFgD0Nmu0ZFei4+CMJgODb6iRUlUfBf3tF7nM+D7Y8Xm/tdE?=
 =?us-ascii?Q?MjR6mfgcaf4IktVL/rkUBEsMS9voWu8xWOgAHx0TIt545fb5ZfGHZ8dJHeGo?=
 =?us-ascii?Q?fSsf2U+yFCQ0kkepJhNQQKHmEdb2Jkc7Ru3tdH/x9dHQFLJX10j/GJauuGoT?=
 =?us-ascii?Q?DyidK9xbPY6rvrrlLvELgGG1uxaCfnv8X+fnp7R0xo1p2DMNXT9aAiVKjt7X?=
 =?us-ascii?Q?YPA17x8/Au+zM55gKOKM9Ijux0E5TkGNeE7+PYQEJ5bOcs2rhnQFKZIuAQxX?=
 =?us-ascii?Q?fCsp+/hLvZyjUHQ/1tdoj+CiTKTNc8wTMYu7WZWE6zHdoKFD51MYF4JdM6Lc?=
 =?us-ascii?Q?U7RduodtmjaCXYsTc4WFRoRmWH+SgoOAQLpJZZjIGXLNgiucfeoVf63odZDG?=
 =?us-ascii?Q?GJ7JogiASG1d0ICITDl57gcX6gGJJk2S/4Yujf3S/FWFRRSS4EymDO1eF9+J?=
 =?us-ascii?Q?D+bNCzrJBBig0CIJ3Aa91gcJL9pU8YS4LgVEtoEhsCg28cpk8H+VpN1oVat2?=
 =?us-ascii?Q?JRM6+OPfLH0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR10MB8215.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TM4tRA4L2gUqdApUEaUxD7cv1m32zg7R08aZFhasSA26dbPTHFAEccqh5fMW?=
 =?us-ascii?Q?N/a0aPhkWIolfrWU17ZYdn29xAJ997cg0sOLPKgh8vZ5sGadop2QUEKrKGx0?=
 =?us-ascii?Q?OiRPE6SIR6SmKobYnyom9cxs2MHYsAnKSEijWY4lHQu/j4Uw8AOC2BUKdkmC?=
 =?us-ascii?Q?xKMFWVdsjpDJyiW3JMiO6iJygz+pSK7Dja2Dbrw+B2ZcfvhfKj/AEZRzo6oF?=
 =?us-ascii?Q?z30rhPc4bLy2ScNWTiEY7yCSFEQzZB1AOrGYQeehylawVXCxI7RQpjeQRRYy?=
 =?us-ascii?Q?qoRfq0OYS2BhyL0BAX7OZZAEho24mvkgQk3kR4NI7+L8IsJ3Cfo2WBhXB+Je?=
 =?us-ascii?Q?9BgNVjyiFRfBa+DV1LS315aDYMTAyCOUFtVH625TbOdgs4KRrYJ1WRKXYVbH?=
 =?us-ascii?Q?qcybGJkc0Rx6VbvOvlMfpOFey7i46Zg6emleA7B+/ScvaaU+bEUweK6Aj1iK?=
 =?us-ascii?Q?UXwazaexHb4xzPsJsGpQdWJ6ptLls+SdK9GGReEr7LQzqwFYjZXTswoV6/bv?=
 =?us-ascii?Q?yU+gkm47RdmIuwMfCWQKaw7nCFQxA0hIA+F24PeB5cVB8BfvveuzHqAW18vA?=
 =?us-ascii?Q?eKdZM83g+rSsJXm5NalExdIBwfCNW/FpEH7nwXWogNzZjFM5q12T3eBMFRWU?=
 =?us-ascii?Q?u95YEkdJFp4duJXQ+yBy00ohx92oAnSeJuw0GbjcsW5aMQLXkGUlF1pUdP/O?=
 =?us-ascii?Q?+lhE5ElQ7wHXsQW5o7FVEt6oMYuU5JMNqyMLgDMN66xfal592f+2mu26t4TT?=
 =?us-ascii?Q?HIktzsmn14VDL8bgL7aWLWSo3sPqBp3Sty4c5o75Slp3itHNyGHOoaTdtFRV?=
 =?us-ascii?Q?0EpYLc1DsUytTJSyg6QAVma1JiCQJnKCepihNER25XiP92/Hit5ohC72hCCG?=
 =?us-ascii?Q?Iql7W6mNXF42D7hQzUl1kmt4EQRS9hsnUNUeM5sC9Mwk8e7ftNTZ73+tD8m1?=
 =?us-ascii?Q?sv1tGWjNhzc9D9ZTuMXdF/IKni+W9c82JFkzO6G4XyR12GYAEuPYsWNTtqmX?=
 =?us-ascii?Q?cI4Is4kP3yG4Wvn4A8jkFeGLebQxD64KRpn17pZ9d29qXqLQXptUageArxEV?=
 =?us-ascii?Q?IMuc4Oe3w6zNlBWFHZ7Tn6Kr/RNMlwmF5dbaebiqPIYGqnbMyh/XRhmQte0+?=
 =?us-ascii?Q?ut80yHFe413E1FBG/H7tGlN+F/7M0S9yOdt6p2f+/La6/kr1NMS/luKZJjDv?=
 =?us-ascii?Q?2KRzKG2ziEW2L5gv8aFmEo25U7G6UIQe08ZHljcyNv1MOP9pW+/cX4lwIIri?=
 =?us-ascii?Q?ZFeN2Mq0k6jc6P963Ryg9nvvNi7XuZ7qmoQt5REBk/AJkVS285fhaNsnlykq?=
 =?us-ascii?Q?GrEB8sOnAFuZpeWJ6T+euwayDsGwK4U8pOiE5VtPR5bTCLp/l+FPqps8GNQ0?=
 =?us-ascii?Q?bfkExhOPwH439QahLIheOsV6b+w8kWIXUrIsFyL9hJYq86pIo9j+G2tVWhs/?=
 =?us-ascii?Q?vGywAEy3DnOJSDTNB9LSn3NIeIUFMV1xAFlslsIDY6BT/2hU09RBxSxKlslp?=
 =?us-ascii?Q?zJ8VBe1mXv5cK7KAxUSabRCaktC80Y5WfCs7Pmo7Qtl3nZGRabhrjMiOEwnC?=
 =?us-ascii?Q?WeTzxLrpAkA7G1BnMciVdtsBSXfuSyANBGZpwSFIHuNWdr36A/4BuvZT8KE5?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: qGhiFafj3y/NaBts6751ySjCaAdBB49G+HnPznJItB/UvsVyeBDtHK6fYCQUYCzFKw+uTNZ8ynFGfIe6s9tPIEwwMXSFKGS36uY2UqfrIkYxLDH6AQKlviBjwMLVdgpvQbFYoxGBcEoVaDGFi2cMPPfxeYlGG6WxKOq3nWdFEPETQB6MKHiwL28ZtmPju/LXCQHBwfbEBoh7c0eW/MQ6VamFGNOZWGNPj4xsGbmowFrtmyb3n2mIOjCkwQnfjkA38a1K9S1jlCsu6dzkpI58zjQR/old7vdxjbcfWY41L6Snhry9Z6HO4J0HHIu2HiOEJnHHUWBciSWbjfQoZusNypX1Tb391bqgqw1rVZvHb+AHv/Bh2KbktiTH9R01o85C7f9WU1P+XGuTIjGCn4rS+GpilY7OkHSa66hDIcpkQgu4AxkNwlBHr+lyVTuNNWQ7R2bVbifsuO4CivhOoFHkUGcse7v0kB3VXpV3MCrQG8PH1/pxx1Tov8X0WpHZYKFmyvIlf3OdxXGdFs0HVYuGBQMNTnWSUWVM8BQUBERFgSDwh0b7jlqyUPOrgZbZoMnyhycfPTnMVa8PasCcadd1aCKmXBh0Kz6bFeunPaEHROk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d2e903-3864-4746-1795-08dd916bc01c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB8215.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 15:43:32.8144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+H05wATqNg0YRAwaXw5CAuoyPHC/BToWQ0M+/oCtpukSQA1vKGnRlcGI6qKQUv9VQbD3/1kBblfmeHocrs4hnoDsjOu5jmtO1o1TOT+lpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6507
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505120162
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE2MiBTYWx0ZWRfX1houyvQNevmw
 aSeHWgXGBGjCtG9V9JVcFLLv4/GrkUE6RlOl67BmwRgdjRlnik83eoV6TuH1NRycaJMfmOsetMy
 wIKVoFacOoZRhgIvnBH/uUejGm6c+O5ruE9MOgm3CfDPOVQr/MVxpLJmwh4k9lxRHhKrjxWYvys
 uuPrq3UaOa3TZ4aBtD5/kYxr/7pRWkIML9WMZJVXjikEBlGJOIy8VLKhh6fkn1nwnfzpXJXGk5/
 JFS930dH2HAbJzYjwBhIWIAFTK2aVEUDXEM83SxB7nfFX12fsRkbVS9Hdkf4i4z6dtlM5TfMUCJ
 l8KrtOGEr8cnYTXIMkncPiVtpBXojfyb+vUr2OdItqHc6Gw9sAcZFoJK1dlcn1kl8uDTFsACnd3
 FKkdY1FnfQFnwzbDXOQHmDxmyXbEBw0cnFe7lS4XXyd0K84qGEL8yUtOXTXRjRxlpzZnZxm9
X-Authority-Analysis: v=2.4 cv=DO6P4zNb c=1 sm=1 tr=0 ts=68221729 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=dohQ5Pe4HFVHix1OcWsA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14694
X-Proofpoint-ORIG-GUID: -jPkpoIjVjINaCvZ7C4cOSzKQ1-7eRs3
X-Proofpoint-GUID: -jPkpoIjVjINaCvZ7C4cOSzKQ1-7eRs3
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

On Mon, May 12, 2025 at 02:34:15PM +0200, David Hildenbrand wrote:
> ... by factoring it out from track_pfn_remap() into
> pfnmap_setup_cachemode() and provide pfnmap_setup_cachemode_pfn() as
> a replacement for track_pfn_insert().
>
> For PMDs/PUDs, we keep checking a single pfn only. Add some documentation,
> and also document why it is valid to not check the whole pfn range.
>
> We'll reuse pfnmap_setup_cachemode() from core MM next.
>
> Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
> Signed-off-by: David Hildenbrand <david@redhat.com>

I've gone through carefully and checked and this looks good to me :)

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  arch/x86/mm/pat/memtype.c | 24 ++++++------------
>  include/linux/pgtable.h   | 52 +++++++++++++++++++++++++++++++++------
>  mm/huge_memory.c          |  5 ++--
>  mm/memory.c               |  4 +--
>  4 files changed, 57 insertions(+), 28 deletions(-)
>
> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> index edec5859651d6..fa78facc6f633 100644
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -1031,7 +1031,6 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>  		    unsigned long pfn, unsigned long addr, unsigned long size)
>  {
>  	resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
> -	enum page_cache_mode pcm;
>
>  	/* reserve the whole chunk starting from paddr */
>  	if (!vma || (addr == vma->vm_start
> @@ -1044,13 +1043,17 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>  		return ret;
>  	}
>
> +	return pfnmap_setup_cachemode(pfn, size, prot);
> +}
> +
> +int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size, pgprot_t *prot)
> +{
> +	resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
> +	enum page_cache_mode pcm;
> +
>  	if (!pat_enabled())
>  		return 0;
>
> -	/*
> -	 * For anything smaller than the vma size we set prot based on the
> -	 * lookup.
> -	 */
>  	pcm = lookup_memtype(paddr);
>
>  	/* Check memtype for the remaining pages */
> @@ -1065,17 +1068,6 @@ int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>  	return 0;
>  }
>
> -void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot, pfn_t pfn)
> -{
> -	enum page_cache_mode pcm;
> -
> -	if (!pat_enabled())
> -		return;
> -
> -	pcm = lookup_memtype(pfn_t_to_phys(pfn));
> -	pgprot_set_cachemode(prot, pcm);
> -}
> -
>  /*
>   * untrack_pfn is called while unmapping a pfnmap for a region.
>   * untrack can be called for a specific region indicated by pfn and size or
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index f1e890b604609..be1745839871c 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1496,13 +1496,10 @@ static inline int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>  	return 0;
>  }
>
> -/*
> - * track_pfn_insert is called when a _new_ single pfn is established
> - * by vmf_insert_pfn().
> - */
> -static inline void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
> -				    pfn_t pfn)
> +static inline int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
> +		pgprot_t *prot)
>  {
> +	return 0;
>  }
>
>  /*
> @@ -1552,8 +1549,32 @@ static inline void untrack_pfn_clear(struct vm_area_struct *vma)
>  extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>  			   unsigned long pfn, unsigned long addr,
>  			   unsigned long size);
> -extern void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
> -			     pfn_t pfn);
> +
> +/**
> + * pfnmap_setup_cachemode - setup the cachemode in the pgprot for a pfn range
> + * @pfn: the start of the pfn range
> + * @size: the size of the pfn range in bytes
> + * @prot: the pgprot to modify
> + *
> + * Lookup the cachemode for the pfn range starting at @pfn with the size
> + * @size and store it in @prot, leaving other data in @prot unchanged.
> + *
> + * This allows for a hardware implementation to have fine-grained control of
> + * memory cache behavior at page level granularity. Without a hardware
> + * implementation, this function does nothing.
> + *
> + * Currently there is only one implementation for this - x86 Page Attribute
> + * Table (PAT). See Documentation/arch/x86/pat.rst for more details.
> + *
> + * This function can fail if the pfn range spans pfns that require differing
> + * cachemodes. If the pfn range was previously verified to have a single
> + * cachemode, it is sufficient to query only a single pfn. The assumption is
> + * that this is the case for drivers using the vmf_insert_pfn*() interface.
> + *
> + * Returns 0 on success and -EINVAL on error.
> + */
> +int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
> +		pgprot_t *prot);
>  extern int track_pfn_copy(struct vm_area_struct *dst_vma,
>  		struct vm_area_struct *src_vma, unsigned long *pfn);
>  extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
> @@ -1563,6 +1584,21 @@ extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
>  extern void untrack_pfn_clear(struct vm_area_struct *vma);
>  #endif
>
> +/**
> + * pfnmap_setup_cachemode_pfn - setup the cachemode in the pgprot for a pfn
> + * @pfn: the pfn
> + * @prot: the pgprot to modify
> + *
> + * Lookup the cachemode for @pfn and store it in @prot, leaving other
> + * data in @prot unchanged.
> + *
> + * See pfnmap_setup_cachemode() for details.
> + */
> +static inline void pfnmap_setup_cachemode_pfn(unsigned long pfn, pgprot_t *prot)
> +{
> +	pfnmap_setup_cachemode(pfn, PAGE_SIZE, prot);
> +}
> +
>  #ifdef CONFIG_MMU
>  #ifdef __HAVE_COLOR_ZERO_PAGE
>  static inline int is_zero_pfn(unsigned long pfn)
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2780a12b25f01..d3e66136e41a3 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1455,7 +1455,8 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
>  			return VM_FAULT_OOM;
>  	}
>
> -	track_pfn_insert(vma, &pgprot, pfn);
> +	pfnmap_setup_cachemode_pfn(pfn_t_to_pfn(pfn), &pgprot);
> +
>  	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
>  	error = insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write,
>  			pgtable);
> @@ -1577,7 +1578,7 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
>  	if (addr < vma->vm_start || addr >= vma->vm_end)
>  		return VM_FAULT_SIGBUS;
>
> -	track_pfn_insert(vma, &pgprot, pfn);
> +	pfnmap_setup_cachemode_pfn(pfn_t_to_pfn(pfn), &pgprot);
>
>  	ptl = pud_lock(vma->vm_mm, vmf->pud);
>  	insert_pfn_pud(vma, addr, vmf->pud, pfn, write);
> diff --git a/mm/memory.c b/mm/memory.c
> index 99af83434e7c5..064fc55d8eab9 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2564,7 +2564,7 @@ vm_fault_t vmf_insert_pfn_prot(struct vm_area_struct *vma, unsigned long addr,
>  	if (!pfn_modify_allowed(pfn, pgprot))
>  		return VM_FAULT_SIGBUS;
>
> -	track_pfn_insert(vma, &pgprot, __pfn_to_pfn_t(pfn, PFN_DEV));
> +	pfnmap_setup_cachemode_pfn(pfn, &pgprot);
>
>  	return insert_pfn(vma, addr, __pfn_to_pfn_t(pfn, PFN_DEV), pgprot,
>  			false);
> @@ -2627,7 +2627,7 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
>  	if (addr < vma->vm_start || addr >= vma->vm_end)
>  		return VM_FAULT_SIGBUS;
>
> -	track_pfn_insert(vma, &pgprot, pfn);
> +	pfnmap_setup_cachemode_pfn(pfn_t_to_pfn(pfn), &pgprot);
>
>  	if (!pfn_modify_allowed(pfn_t_to_pfn(pfn), pgprot))
>  		return VM_FAULT_SIGBUS;
> --
> 2.49.0
>
