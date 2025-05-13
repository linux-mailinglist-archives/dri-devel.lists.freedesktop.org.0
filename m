Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBACAB5B76
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 19:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19EC810E263;
	Tue, 13 May 2025 17:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="TtItrhKk";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AVbinG0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DC310E263;
 Tue, 13 May 2025 17:41:25 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHRAi026944;
 Tue, 13 May 2025 17:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=1vc8HMpqXLYYKZoIPu
 1vQYcj2WVgf9f1QLDCxcXJj4Y=; b=TtItrhKkKJQeiCK6Sw19Cz+IaH4t66DC3t
 XjL5G8HGfGBYc5H2LEsA9BR45uNVGwDqJ49R9kRX0D0Q+eAX+y0xLt6vkEFFpwJL
 G5+PuSb4rmyR6LsLIUbU5ToVMZCn3PEEAoy9r88vjQaruRcVyXEhAcaRIQjgrlSe
 +kTsz1aQoiYEjQjGFlV4lwKeXJHusT+mTyqa7saj94kqnM51aLKRHL7Y/lEkg/qF
 BSYUCkHpZjIrmvdfSYPwjvoRECyK2me/4NrMH1NE5s0uu12NZsBpiHoiAcSB+DoU
 h2wsIxUUu1IXf6YDwlnTiJhPYXtPZLBhm8xmcGkm+clJ4HJLLaOg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j13r5dpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:40:54 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54DGQKdk004251; Tue, 13 May 2025 17:40:52 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com
 (mail-eastus2azlp17011029.outbound.protection.outlook.com [40.93.12.29])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 46m7d92rh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:40:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FMgtVbbO2c+/63gJ1fXcY9SjIk0p2WLuliWGGDlNS4yW4GF85tLLDW2abaemLcIW/OiRgPwFW/m/4lx4rQCo2NmQTdZVy2AVQhPaydLg7135qpVI9XC2yYbXY9EZxeaP7ROcAVN9kIGJpswE5nBDZBEDBxqSoptNOu1pqb2To9z+uRgeJ8kc+LVZ04JWNPWpA5OqE4sFUVhVLcWLS4kFgvOr0Hid8m2FJsf6dDk/GGJKu7BlCwJSkqfy3xCFw1QWlHmza3vseHAOPcN7RCaI+Tk3fRqk6JedRBdQmg5GGsUEKsKp45nEa+glXcbowh8HjHodH6wLIFJW0aoqGN2Lnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vc8HMpqXLYYKZoIPu1vQYcj2WVgf9f1QLDCxcXJj4Y=;
 b=G+TNwTOlKW+2Vzh3NgQFE3WJQR7f4S0Fr3OcIWa6ulI7KwQC/zGEaIKrYgydQBukr6tp8OyZn6UiARjbwp1hsafd/eOVorcrHJikQuPkmlO6//Kgoca5Hq5v+NqelubuE13TQkVCHObZw8v+fmorRMKY5GTACWyBCw8Ejex0jTzkPkwEpP8U47GU3rowzSYpq7SMhVkIm0ooD/0tYGSoVUqhkMNNJf3XB4AB8rIlCduNRGRuoJwdCh+VYaIESRRbuobRq7c/pp032mJn26pcFwW3dBOHTiUUx5r7oDX9BxnsPg2t7mg3hGAW4mLz9O14znkorcxjEs2pr5M2Y/8FwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vc8HMpqXLYYKZoIPu1vQYcj2WVgf9f1QLDCxcXJj4Y=;
 b=AVbinG0jUbeE/7EBdzgwSeJdNfaLbED3sa7hwrNOMOuKi9FgH84nUYblt3nX+yUVqJn0CoDaqR532GB3M5VfGcyTpaB7amc/ACJl3lro/UW2JZVySafPy+MqQjAtXpIxRAcigddSgJaV08jGm/PeakYOmyf71Q8u1kP6siSUe1I=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA3PR10MB7069.namprd10.prod.outlook.com (2603:10b6:806:315::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 17:40:49 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:40:49 +0000
Date: Tue, 13 May 2025 13:40:42 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
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
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>,
 Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 03/11] mm: introduce pfnmap_track() and
 pfnmap_untrack() and use them for memremap
Message-ID: <beqj5nkucukfi7nq7cptzqwksugo5dkljzjg2opzlize7ixfvc@q27zsivgbcow>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-trace-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 "H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>, 
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, 
 Peter Xu <peterx@redhat.com>, Ingo Molnar <mingo@kernel.org>
References: <20250512123424.637989-1-david@redhat.com>
 <20250512123424.637989-4-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512123424.637989-4-david@redhat.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0140.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::11) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA3PR10MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 36234ae5-a730-42bf-0848-08dd92454bca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ioPWHQYDq31LRQV0XfPexOAV+xHKhhHziGQ3X381fdLMZbLX4jMPDhfqSO2n?=
 =?us-ascii?Q?io8iEMVY2olCsOuRnjVEO6+GsnvZNmbY/YQo+cGjGtGZ3CdB3wdojUtnJ/v+?=
 =?us-ascii?Q?/LH8cARy+I2A+Sb2TSYsq9cc01DCm1Xz094DG3e3v/+ETOtbz+4FRDIvhBTa?=
 =?us-ascii?Q?LU5EG1srIK+wuE513XtdJVYykXZRErfxgauMJXahjM5q+qP32bxXgd2fFasn?=
 =?us-ascii?Q?BxXqGzCTy6onHN+rk52T83ADS32TbeLF+pd8SxmtE++2ekz5MIPMGfMIIsRX?=
 =?us-ascii?Q?VcX2Xzw5U39MbnpZPGap99qLTd6Zsz9OQGbCooGLJZDA/Glxg/Z0ore3D/iU?=
 =?us-ascii?Q?Orhe/QbYWrJUxnkvOK5W48VKPLdeR7RvZAuvJgM5FgIlFyFbujdh8wl8abxC?=
 =?us-ascii?Q?VdSWJD2PTSJ/qOEF3mTSSLZPq/UXVoyFlQDBmISx8Up5NUX5QNxU1qrBi6ZT?=
 =?us-ascii?Q?0RN2zIGX/xFAAcCEvey7NS9LjhDilh4oXhFMuI5DjIdNS7C2G7NfPVskp24b?=
 =?us-ascii?Q?peGGChbs3Z2ndPrWOEqtwszfVh3i1Dgz8jLjWpe1KVsszQo4c4FN/JwgNGAm?=
 =?us-ascii?Q?RPVYVNPcJb2/rdCfwodoxrx/4HcFiUPnhTzclxrkfq4M+BtyG4AATapC/5rm?=
 =?us-ascii?Q?A7ALIW0Ph1LON/SJRJbbWCDfJfBUvKHz28c03B2kFg4Kn+UqPi0QGSZ1j94h?=
 =?us-ascii?Q?70aVqtosXpu3TF5EUsq1iQw+kLcnoxpHSgzIYdd+DQ4h6Mjq/E0P/L1MzV0M?=
 =?us-ascii?Q?d1c21roVHDZZEU9qsyx9bDGKQTJDJPsJXyJ5ROX2oIGMezonkpCFz0jgYz+Z?=
 =?us-ascii?Q?xw3sGYuP0EhpFprSFepT7OFb6x6PmYWswau3lwxAQ3FRwvmLslNCFtHv9KOX?=
 =?us-ascii?Q?Fc8g/JgXPx4a81s4HAv5eXzK74JcllaW5hVMUxzMUfxrcAOq9kNUnQwSmMnY?=
 =?us-ascii?Q?rEF8pdil4G8stXWOpo4X4EWN9E2yfX3K4P29v6hFQ0srABso32SkqLBJQE3z?=
 =?us-ascii?Q?+8at4MoVk63Zi3lGAs06UKGasyRDB6jVmeYp492MwD5tUWDy+nNXOrnTwh+p?=
 =?us-ascii?Q?PA8FZTwrDEr5zRVrhzt4jzx52TFhbK5MwVwha0ifEeLfjfj+CRBwaj0pw7Qe?=
 =?us-ascii?Q?5DNmhO7wh39tQbL6OIt8X6NWDvUkeh78RP9g5aeqIOM+ZMeSkwueDj0F905/?=
 =?us-ascii?Q?AUa7vDex5/FklBKXMxkyGR53AjRaPjqrnX9lOsWCWBflyHMT0lnOWIPoMteR?=
 =?us-ascii?Q?qO02HbyCPJyDXZ2ORlEHtXsRCyyQpVFp14qsui+Q5QaKLc5SPomRZhIuQ2Bf?=
 =?us-ascii?Q?f01JdkMBYi+8GtXh88+NYyxzl8cGac+qTwNDvrtf3djd6wcvvfWAsinAhQR7?=
 =?us-ascii?Q?GhLDYvOaBYsyq9ff6K2qg2CvNKu+mEaXIAVeODqGeHctw0Vj+2p29L1d8k7u?=
 =?us-ascii?Q?SCxtJ4MQYmU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5777.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OHyTD5q9qZ8oIdinMb/AxfRWHEQWDpiGGMwSInEEBarkx6WpX4hspGTZImej?=
 =?us-ascii?Q?XDVjdCg4Xo+NY673fp/R96RmIcVscwKcqlZ+sq+T0hDkdzZ3URZYmmhle+AZ?=
 =?us-ascii?Q?xN75keb7X+RUpCO26aLS8i9OgjM8wyKwJahWnWki1tC9pg1ensr6KzokEl8A?=
 =?us-ascii?Q?XUFgubtMGtEdivVxFj0MJmzrvhlrx9i1eWvmxQAshPtBE7rdlGbIdIHBw9wr?=
 =?us-ascii?Q?uHUjQWYuJ1bYvEbN1+We1vRPVYYbm6LheoGaYiAHyOXHAh0+gdym7pXNEV41?=
 =?us-ascii?Q?2jm8jYazV3hs7N9jg0xkM+WkMRMzw5/fOxP1vLOmrgxapcI+1X59L++mvIML?=
 =?us-ascii?Q?QwZ1HUeEZXvNT1i+ObtryUPR/qLa12t99RYUzEAhzEqZDeLx4hHZb37m7oiM?=
 =?us-ascii?Q?npXcF+3eTB6Rd+jSu0rBrUKpIuIslT97IIjzy5+s/u0S14WfEgz15dxADO4/?=
 =?us-ascii?Q?sfT6tVYA4sQiOo/j2JK6kYEqhAiHEJDiyu0KFrNLnkAPNXUT7xekXtGwCZB6?=
 =?us-ascii?Q?rewnHmcxzTqqBQ2XB87pEoeliAOmSfJ/i4QAtBYqwlgG65RnD4/JyRxiEXAi?=
 =?us-ascii?Q?ae7F76uEj0K7fpRGFmMhgrf1R4IBCSbO2PhFx/epO4KpM1ib1Q/Xopsz+i4J?=
 =?us-ascii?Q?5Dag1Br4tyVeKKLHZuUbMvMEkrtI6PbmPGrvnkvu/pO91aNRC7W/NwP+/8FR?=
 =?us-ascii?Q?lqAkAKjOJV07EZlrHekDTuK/wv9dM5w5WmsiB0qnPWGP+gQAZ7UPBcyaahOh?=
 =?us-ascii?Q?dm4cPp+jj14Yo0oiK90lBOqCQdeOXc1lrWgsQiC7uNhYgAqks/FqMqv93kDz?=
 =?us-ascii?Q?k8RL2niKWa09j8VnHu9NBarQdOwzJenr69bRyLGWimoL9JHfI16jUrUxhLuH?=
 =?us-ascii?Q?CASngAr9GL7m4LlBFY2udX+/dI8mqo+HA2IhZBx/ZjL93zJGWs4BjtR1HmVc?=
 =?us-ascii?Q?4cflsE22gPL+EF+jmlL7cAgDGWytDmPxGGywSk6UcgJzQq/ViJkNHVUjuzv1?=
 =?us-ascii?Q?mIY+1+lEZAC7VJ0mQcli2pHaHwfKnDHvZiBeaq4LK+4CrN2VKwgTicWSQnz2?=
 =?us-ascii?Q?ONPTYdltismZhzZGGfXsl9M+ENW0C81Liug8kZDgovj/E0G71+B4eqpKdWub?=
 =?us-ascii?Q?my3Br5fU5Eqy9eCH1ivqNdTdeuPYCBVrm42XVSO/8H2cpLOMgoaaB8dSV9Tr?=
 =?us-ascii?Q?l1SE1Bi+0zHKct2jVFeSTH1DBSj8nXYLfA9qmDfogkjmJiQvUwQ37Suo0CaC?=
 =?us-ascii?Q?/cnrbepa4HT2wWynZ0K2Qph/r7PX/1DmrIhqrChvBGspPiW6468lZI/HsomU?=
 =?us-ascii?Q?wE4swAUPlczULV/QI1RxGDe1QVII5yjysD2bfUacm6DS80k85gnn2kwiFH95?=
 =?us-ascii?Q?3iUOH/rfcpa1/NivmVhksHAnORP7ZguUgDoNh9aWJxqsJO3MSqbdfKAr+iVv?=
 =?us-ascii?Q?L9hnguBZOoxJ+BHA7Sg0hzlLsYpfvn644SZMj/A3pEh/g/2BTGa7En02uVq6?=
 =?us-ascii?Q?eTEznEGVOoxAtPJDMHWUFyPb663SCuVVc/6SSpJsulLr4cMHG+aYuGQ3uhZd?=
 =?us-ascii?Q?LUtIUTmu3uEa+4yKaKhWsJUTiqnWTA8dAzxZ0Yjm?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /4bEK0esHMT6Pn3aRQ6cqdCLw95G+++zZHKzqDVSzSbADEPcjGrAnG5pUgi6zzHMvgPQwb8xzeChKCvgyqST7IzdFHP/0gI/GNWZamPqu/wc4OAlgZR6Xg0k8/HesIBITjTC++xLCWNPccO8eP3mPH34RkIdhYng38AsAdOpuLy1s1uFkKnredeHnUs8Sy9+wzTjbQVco3wW0zU4T32Tyr+DU27F6HMVYQbizQOcmIqR36x4xDz4jq2LSVbMBbPMNsfjQ8duR/rHJTcLSdH0cP2TiyWV/vwK/OTmfpD7Qg6gxfWMnp8iVvOF1WLPW74nroa7FIkxhnpFrlIMO1lOqP63/owdPCY3VH+MoOFiIX5DzLDw7xlhTskJsmZEpB9Mus8tFkUnvlXU48URjXzHmy6JCmR/4XjWGtArE8D0AiFcXNa/qAf4ohau1cNr4mpdlmMMUYmnrYJqohK/9cMWWe/176guqvV4Je5zlN+mz3mEzi05rUz3xfkILbmECgDIc2/VFxLUk0arkTqy0y4tXBI+7s+VzRn4VazX4lidNkxiM3gDpR2ef8nSFSXaZo20bLPWnd7V8ylP1I2RTQCpkXGRdz8yHVTiunIpRPUSS/E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36234ae5-a730-42bf-0848-08dd92454bca
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:40:48.7992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IaBpU6c3Ils/xDqQp5wBcErMMKEWgfJWOgQHrGqUUH50EKR8m+K71lEXYWz/tkholBrTgwKsT5VPrJFlHVCKRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7069
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505130168
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE2NyBTYWx0ZWRfX1rQHMskI+hH9
 Gon+cXBaqhHeKhrIVWbbJX5rqKFzQqLPW4E864p+3qyxFsP0WkbZwN4MrpbhnYRtendF0sPo6yo
 9BDndcWMaN0HmdxLwMcQVm63lir5tRmPyHG9AkTdDKXmfZ+Kpv2koeT4D2Pmz37zOsGFkAt70IY
 AGf/bBQ8DQZsvcIs2EbwGtsoip/wPkg7c3mm/gmcLyxKCIO+gUrxBNKTbdn53at7C3/nYPAEeNq
 HgFJa5BISu9Q5cbHeWOcI9CuQfvSd70i/d7hHrECu1lgDwlipDT1Bo1i4d2fJ0OmfPA2OdWw99+
 HHsA9dnU2JjuJY9I8ByAnjznJNbxWWp3EIGBklxdpGnqYCBSQO9oG1CK1/Lvro4q3UlOXnrprXS
 mwJOoYj3dcGoeXLQETg0jpZezbifRJ83C1g9vrFFyVw7Mn6uAR75hd5OkxMCFn4xMUlwl/2C
X-Proofpoint-GUID: yJxh6hPO5uUc9jmgxEdGVI4SVWhNc6F8
X-Proofpoint-ORIG-GUID: yJxh6hPO5uUc9jmgxEdGVI4SVWhNc6F8
X-Authority-Analysis: v=2.4 cv=M6hNKzws c=1 sm=1 tr=0 ts=68238426 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10
 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=R5-5BJAFUp0Ld9mZSgMA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13185
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

* David Hildenbrand <david@redhat.com> [250512 08:34]:
> Let's provide variants of track_pfn_remap() and untrack_pfn() that won't
> mess with VMAs, and replace the usage in mm/memremap.c.
> 
> Add some documentation.
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
> Signed-off-by: David Hildenbrand <david@redhat.com>

Small nit with this one, but either way:

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  arch/x86/mm/pat/memtype.c | 14 ++++++++++++++
>  include/linux/pgtable.h   | 39 +++++++++++++++++++++++++++++++++++++++
>  mm/memremap.c             |  8 ++++----
>  3 files changed, 57 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> index fa78facc6f633..1ec8af6cad6bf 100644
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -1068,6 +1068,20 @@ int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size, pgprot_t *prot
>  	return 0;
>  }
>  
> +int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot)
> +{
> +	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;

Here, the << PAGE_SHIFT isn't really needed, because..

> +
> +	return reserve_pfn_range(paddr, size, prot, 0);
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
> index be1745839871c..90f72cd358390 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1502,6 +1502,16 @@ static inline int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
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
> @@ -1575,6 +1585,35 @@ extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>   */
>  int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
>  		pgprot_t *prot);
> +
> +/**
> + * pfnmap_track - track a pfn range
> + * @pfn: the start of the pfn range
> + * @size: the size of the pfn range in bytes
> + * @prot: the pgprot to track
> + *
> + * Requested the pfn range to be 'tracked' by a hardware implementation and
> + * setup the cachemode in @prot similar to pfnmap_setup_cachemode().
> + *
> + * This allows for fine-grained control of memory cache behaviour at page
> + * level granularity. Tracking memory this way is persisted across VMA splits
> + * (VMA merging does not apply for VM_PFNMAP).
> + *
> + * Currently, there is only one implementation for this - x86 Page Attribute
> + * Table (PAT). See Documentation/arch/x86/pat.rst for more details.
> + *
> + * Returns 0 on success and -EINVAL on error.
> + */
> +int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot);
> +
> +/**
> + * pfnmap_untrack - untrack a pfn range
> + * @pfn: the start of the pfn range
> + * @size: the size of the pfn range in bytes
> + *
> + * Untrack a pfn range previously tracked through pfnmap_track().
> + */
> +void pfnmap_untrack(unsigned long pfn, unsigned long size);
>  extern int track_pfn_copy(struct vm_area_struct *dst_vma,
>  		struct vm_area_struct *src_vma, unsigned long *pfn);
>  extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 2aebc1b192da9..c417c843e9b1f 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -130,7 +130,7 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
>  	}
>  	mem_hotplug_done();
>  
> -	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
> +	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
>  	pgmap_array_delete(range);
>  }
>  
> @@ -211,8 +211,8 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
>  	if (nid < 0)
>  		nid = numa_mem_id();
>  
> -	error = track_pfn_remap(NULL, &params->pgprot, PHYS_PFN(range->start), 0,
> -			range_len(range));
> +	error = pfnmap_track(PHYS_PFN(range->start), range_len(range),

This user (of two) converts the range->start to the pfn.

The other user is pfnmap_track_ctx_alloc() in mm/memory.c which is
called from remap_pfn_range(), which also has addr.

Couldn't we just use the address directly?

I think the same holds for untrack as well.

> +			     &params->pgprot);
>  	if (error)
>  		goto err_pfn_remap;
>  
> @@ -277,7 +277,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
>  	if (!is_private)
>  		kasan_remove_zero_shadow(__va(range->start), range_len(range));
>  err_kasan:
> -	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
> +	pfnmap_untrack(PHYS_PFN(range->start), range_len(range));
>  err_pfn_remap:
>  	pgmap_array_delete(range);
>  	return error;
> -- 
> 2.49.0
> 
