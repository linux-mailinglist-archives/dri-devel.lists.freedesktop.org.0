Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 518EBAB5B7F
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 19:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0E410E281;
	Tue, 13 May 2025 17:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="au7ffSL1";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nCohHlsn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DEF10E1FA;
 Tue, 13 May 2025 17:43:18 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHa6R019511;
 Tue, 13 May 2025 17:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=LU5W9mBMg7IWot2II0
 lqlyFn+krai0EzKa3fP4jMKck=; b=au7ffSL1Ciac2zLFXpogIxiXxlt/9hK808
 AhogxSCjnz3pHhqyZCQ7nRrgSNhAfRXFWkaF2dSCQp3QyBSTX3D7JGQCamtt6omH
 xxetQtBlqX/lChhmNI2n1TuHJER9EBR4pMgbM/12zXURWzC9N7KSlV2WY91nk3hr
 g4+bMNIVmirwImvyp7si3oo4bGs9+Ad1XRUC0D2kSM5aeolv6K2uXdtx563b4bwu
 /v6DsHCJdB8nbmgsaPliC2VU6grseX1tRXK9JKwUSFFQ6LbMaktPjb4ZEvKiadEo
 K2Vw80KnL/gUHrM5ug9onF7SsXJMN0RZcKo3W9DkpHI8PY9GlXCA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j11c5a87-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:42:51 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54DH59KG015500; Tue, 13 May 2025 17:42:50 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com
 (mail-northcentralusazlp17012054.outbound.protection.outlook.com
 [40.93.20.54])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 46hw891bwh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:42:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGzKrSF8gj73QQy/L3KpxzFkUnMW6D9ZdMes9RRxdP8Q9Uo+H7KzBhHjkvzZaeBQ4TowBEUNoho7vWCbxDd8YlmV2Ij9aeDqx/aa+FpKZvZW6tYVq1R89sD7dc8OIVF/6E9J21QIZZJ+S8hjf6Bxcyz7UFTFp9mFgHW5Y9EINNwD1ovdkR1yGlhe9CSau+99AkMS1vlSq9NE8hiCtPyeF0o9sHYC1sht/u6iwTNgp54IaU1FVfMaY04rMTQITosPG9kllTfBNKp27zeTIay7Ilc4jRbnuEzNQd2XdswrPrHTosO0eQ0L+quCixpcz8NBZgBc7gNlK8GicECpERTWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LU5W9mBMg7IWot2II0lqlyFn+krai0EzKa3fP4jMKck=;
 b=JsmDtdDR1b+bo3jAGLAFKSzSnZA7zDkyGTR4PwdVfIM6tpyPbg9ORLmRl9nRQbslS4WUz46CvGewc55HK6/Z7q2jJbD6YXLSV5CpcGWlaD6hqZs269STXKTKDdakENieG2BY6vNmQMTaojGe62kOc7N0meh7t+ozaMYog3yBH+TcGEzk4PV6zWvonU2SxFUpvRLVOSOlbG8U0vQ6NwDWJXASxP1Fq5IckZlhK0Ss3IeOkBRmvdwYZZdL0dwC6Dj43l5iIMIZmV57TTSn3XygiAgrg936nXUlRV37ydhflnzzGVI6BUfJspZMGcePbAfO9ictC9DnmyrRqQMV8UEvKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LU5W9mBMg7IWot2II0lqlyFn+krai0EzKa3fP4jMKck=;
 b=nCohHlsnt4B8FPM9Ws4Sd3xWF1ebvZszb5a3SORXYg3Umdl7Qb3qlGMofzEoi3CLd8wXDcOEdSXsPeRATE5zsdnLmtWp+2E38iSaNJFxACEpL0SCJOmPRdBAfDZwgw4aoLneFHKjTxWhIbCeXo/S/UoSTeGLlQ3iolsJPSQ9HDY=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DM3PPF9E376D9DC.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 17:42:46 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:42:46 +0000
Date: Tue, 13 May 2025 13:42:40 -0400
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
Subject: Re: [PATCH v2 05/11] x86/mm/pat: remove old pfnmap tracking interface
Message-ID: <3vfsriwsr675s2eqnytyntsdlmopczimdyxr3sm3nohebebdzi@wgrp3xtsr3o5>
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
 <20250512123424.637989-6-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512123424.637989-6-david@redhat.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YQBPR0101CA0285.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::21) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DM3PPF9E376D9DC:EE_
X-MS-Office365-Filtering-Correlation-Id: 05282ebc-2a35-4d0c-289f-08dd9245922b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HuigWTPltzB126FUzXjzb8PE7RgYmMqon+AbL2X4FYvSuT54ukKJVpklBaGt?=
 =?us-ascii?Q?VkrVLSN2vPEkQtW6oYizpyezq3BfVgMFBJg1YYsMCSr3//09s/jCL3b5Ly1X?=
 =?us-ascii?Q?hY6dh6oUfC6HHd9XZmsx65om04GbuSCrKLnfLmKRShJOqnlS8OHoEp+Gt6NX?=
 =?us-ascii?Q?KfFnNMcMqO48wVKiQSse2Jc1zwhCWc0PYPAiI7JVOlGI7firTDu3fqqIvM+/?=
 =?us-ascii?Q?sjibohBVi/YD0ZKQ+/+gtNnK9xg4ZmfVP5MJTbiV/ToGDN1g8W8/73l/Xy5t?=
 =?us-ascii?Q?rU+O9kJwujFdY+TcnZpOUccNcTJmJUyI3U9LhpwWVBFocP/yCXPyGRIC0RWi?=
 =?us-ascii?Q?f8L++I47eWkz2Rb41tWkY/p71Ye39TgcgVPxwql825tvtVe3sxYKmrFSZ5BT?=
 =?us-ascii?Q?dWTgYzwGNH2m0LWV/Rr9R6gacdeDxnIB9oKQhNphnu7S63E65MeEhMw8yaGT?=
 =?us-ascii?Q?BgdBLUUUIZNCfaGyVaC6pRAIDz0oxYE1RPwhNrUyYI0nzyZ601QMlHN9RUvG?=
 =?us-ascii?Q?Y1NFsVhrjEWVM2hZc5dOaJdwxHMFsRft7R9JLkpIT7ixu87D3q5n5FGpgZqr?=
 =?us-ascii?Q?NWuGrUze8kqN8triwOzxC0IHLFR/NA8yazhTGWUFn12j/YTx9fj8Y4f+ca0l?=
 =?us-ascii?Q?0LMULSrFqZ/YnaKrfbIJj96gfqkVFAxoan4B1FbsgNrqFJ9Uvtij0aUxA0/7?=
 =?us-ascii?Q?AgJHmnn1QLQwtkh/H/zn2qA8jnTfVLBZMv0jH+JKX7KoZCQKt3o7MMc1EnjR?=
 =?us-ascii?Q?KnnwNIk8dpe8J7/8h9YESzSmmybYMt1/umBXV/xc0D1WThn4yCkn0YBuLvZz?=
 =?us-ascii?Q?u/8pdkuZVxRZ/cc9mSswelVrEKhvTjqmT0HIP6uHByOx8aQDxB99lH+Oy1po?=
 =?us-ascii?Q?OVYgJZvXEFlLRNTIHFHv/6s9A6fxgDF2k6rFbOl/Vu1lZuwIKczH1Eu/0pts?=
 =?us-ascii?Q?BjtfN1gpmR7ULA81y9MNrZ02Al2nq6EVJ36/deY0abS0L+WbsgXSrf/PfdNQ?=
 =?us-ascii?Q?fjMuqHUwhwyAuAdqMelGZqFTGl+tx9KjGx6fxjOh+Itmz5XYhuRZ1RRPJ3M8?=
 =?us-ascii?Q?dLx+6CnMb7lVm2SsExKIA9yVBAI1EKOMlZZNk0PpgYbqzTDEAp5/nuI+1ml+?=
 =?us-ascii?Q?TIzkXLmozyXK4UWzeVKqtHKU2Yf5IGT+Ed4IGixvizHCFBsrPpqZE6jmtFRl?=
 =?us-ascii?Q?Zu0pu0ISf+KyS9KOzfJjmnEPlYGvVTsufXG0LLPgnJukdIovKP45zbhuDnw5?=
 =?us-ascii?Q?KAnnqn2LUp+muUFrl9QXfYhobFDaDQ/CnQJ2CXGM1p9hxM60cCooFS2l8J4Y?=
 =?us-ascii?Q?POPxLBAzcmt5yJR2+4AS0576dUhmkNy71YPZUhUI0cJVpVyNO5ZuwAOCI2qC?=
 =?us-ascii?Q?wniRL09hgV9cny1cSu9UDNJ2KkNbMUkE5kqRgweeP+bu52+Rj696ZcEOUhsT?=
 =?us-ascii?Q?yrTP6w3h8z4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5777.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oDiy6fOERECV3HsD5ggNtq3qQ0jtv6X0TRh1UVSbVmbtEbg6SA8CbJIBNhjf?=
 =?us-ascii?Q?URHPEi6hjQ1NLRlJZdriNwBZbfSO+IcJ/yNrmoB6OBUEcCzHwdKThKEXaWhc?=
 =?us-ascii?Q?Y0SVJZTRRDPuAT46IMmPQycuP6cbcK5VEafgno69zn7qTtsfhNkNzQJVszEW?=
 =?us-ascii?Q?Nm5N6J+ZVqgdN7eWgJLTMUQCXMvnTJZ6qbp5j4NfY0kTQEjaliYbFInfvjrV?=
 =?us-ascii?Q?wEPE03x1QF7GctyMBlVsgGTmqacZ8lO5JBU9+cQTpaPjKUNAakC6RobOPUyd?=
 =?us-ascii?Q?wk7oC0uCKN/UmNAwOjrwaHDwsTyBNX4xUlgDSyPwf/G+939NDE+j9ogZsLjq?=
 =?us-ascii?Q?8D0+Mk1R3FW45n9gbwar8V5AliqnbfC2PuDoeqRa2w15jR44nh3rtDGiuTY0?=
 =?us-ascii?Q?cAyrleGWhMnp99P2s8zsiGGNAKH/5wFfDhwyUvD2lM1jYRh9L/uxN774+OTs?=
 =?us-ascii?Q?+EE6xQMYyklc8pAQgvOnaJukQ6PFgElSbmDQ0AjQBF5NPJZ0YyObxbxiqUGr?=
 =?us-ascii?Q?inygGvmg6iITl8J5S+nZakC79wEf6/B8bGEC0cm++CauMEy7hr7GDgwfQPid?=
 =?us-ascii?Q?YU0fPiFH7aUURk6SixtXyDNEXDT3gd4wIo3kuVtp4FiiOTzXI+4xpLF3KsWT?=
 =?us-ascii?Q?w9aax6p4ijcG5dD+SVTLCwrnaVFH8zn9s5DatrxaSP55lhV6pT9pQ6sJ0qc1?=
 =?us-ascii?Q?XYHoDyX/kSmnH8ztit2ANDNKNScXwVgfaZgab/Dx6Ybib+EcLXbmnx2lIz8L?=
 =?us-ascii?Q?vxvWcMOIXZWPBrGg6diJFBmIfsL0XCj/GrStY16ByMQu72RrnR2Nb6xvmPBg?=
 =?us-ascii?Q?K1ROekj0TIo27HvRv5A20EgrmTaHhx33kD4sPy+7Rl17ZfG0zS4s5WGv2NIO?=
 =?us-ascii?Q?zmLqZhFymvral0ocgPXETk/yUwB6dELYxQNO/kBxkzY4G7oW6zyzz0QEB2gE?=
 =?us-ascii?Q?Eh1U7iml7ITo2p9guc8nCZ6F+P9Hv5JDEQF0UUYuFP6g2dzleuOs0+L4kTiw?=
 =?us-ascii?Q?bwt70c+++A1US9l1Ec/GUwrT2WAa5/Y3iajh162+XVMEOxtWrNJ6HAzMndDx?=
 =?us-ascii?Q?NtxW7d0R8dV7RN+9lCiKZb3OKpY6w5AYbFwyp27ia7oI15mEWEdzZXXjSq5G?=
 =?us-ascii?Q?0b/uyOLfv56lzHPgCWEC1ozYDvQklicXkYTsD+I+DiwUcAuLfUuU9Lqlrj2K?=
 =?us-ascii?Q?JepTPK+/uNnlbROraY3oWJCAxM6GLOMOwrkwjPPwbc4AlIoxlEEkFAk18q+M?=
 =?us-ascii?Q?qwxVMKX7eXzv0/+5zWuCTuISTQ7+21WtHXfL78+wuIxzkh95Z4bdMS9IZUo9?=
 =?us-ascii?Q?EEuDjr0S3XHYcMUCj84umg2A+oEim6tmP9anCppYnvZCqq/i6xFX8p1hK+Fn?=
 =?us-ascii?Q?Lw27UgwU9iBGAPJj9eV5jdy/4664K0ANpuwzMXqVMjoerqZfVAqR47tJDrnN?=
 =?us-ascii?Q?ebnKM0c1gEQKPitvSZTeHjc4XoNOa/4/xLDK6Fc0XJTMz8xJtx/cxCpB3JoB?=
 =?us-ascii?Q?3svAOBfe5qWN/9Tw0XwU7yv+RCkyeoT7UsFDml7pIdfhU6l0yhTk+/tIQm31?=
 =?us-ascii?Q?Hvmmt1uKfC1tPNfIWD3zk9oPGn+rI7Q7sRAZ1+tb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IMHMkyoNauthxO7ACFCtJtS1OQ2j7SUd7NFd3qe0OKehnLqd4EA7IPWNg6BhDbVJJRTgj03Rvxmens6lCEN49PtNYS0LTC65WuXiiM+5AgHAlU7cu3LB9akB/f6Y7obVqXnWRIZEpewHc0hfIxlVo8uVAwB6AIp965Rt6M82v+bgcJ2fUqOoVPgFH7RvUMSjCgaEQWWXEDeYtt8oJT30QLeETsc4mWJU774MAgF7mki5CtZrXPEpoZYBvcub6Nvh6jrEUEWpj/BiiODBZMtQJaIVfbVGymGUxVaG0rSRDZEarH32MflK3e1amNEFlj9MukYQHWKOJr4+h8yQB2VEwK7bDHj3+R89yvtAYOPPS9oqMWaNX4UEWVGeUqQm9QGHIbirMBxLOTLTHQV8dH+ktiltu0KMO/uClFwcCl5xQPv4MafCZyaR2WKfV7sdfD2TZKoq+pE/ZFJWzS519vQH54vf3gRn5KUYcytvxVGgAlD0J9NaqfVZMsliWjb0mieKLRZVP3OCmCtmAq3N/k4NzpXGgTtjKRhs0163pnLvA1IChLlq3fQmOvW37woutaXXkQ70JYfEtdSQFHHtRDXN06kSCesYvcyZzgjBSr+Qs0M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05282ebc-2a35-4d0c-289f-08dd9245922b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:42:46.1603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hiCa6fboAKpoG6gGMDgWDC036AeZBfWh905Nc68DY5fCUb6q1sWiZfUYMdSdnISdwQ0Pes5Ph+NXSRRPrV6xcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9E376D9DC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505130168
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE2OCBTYWx0ZWRfX/ms/nedy8ldd
 4tcoqy+8mHQehpmiet7oQ72Mltc1C5Ysn5kiy3Z28vTn/I2SGcjTDGngjzEkAAIRGvTSnn2yHVe
 BBqe48sKM8bnKvvDoXcBvHJ1S9hG7VnlySdDmVdCC94UT3Yf2xco94VDfJ+oBn9iPn4o0sH2zyx
 AGCOGJeRBJ8Gf+7i7LLnii/w4Ydn74lwJ+sfnFsWRGBhJjdwcoGnNYl+PVv1vLIkNfjg6Kaik3J
 WZbxpDRGfzT6LbAo7VSGr7AX6w0dMXF6X3+D28i/VlTFEZ8yBF3ZmY1pqV5hgSTcZzaEjKE6Mfx
 QdznKFgBwg59+mR4d7iAHdERO8HEMugtIV163SlqdNGKSzlX2JzkSdMzecg/LopF2KVBy1unhHe
 oHHGAv06wp/CacdIGbmY7cRVebEKCzyqd4gL3hQTQ01gKfJjQGiflaqqVqXPKi49Swew8FNj
X-Authority-Analysis: v=2.4 cv=YJ2fyQGx c=1 sm=1 tr=0 ts=6823849b cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8
 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=EK3Ru9J8Ouez1dTj0SoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: plAS3X5Z2gd26-FlB7NX_J42SN4M1HqJ
X-Proofpoint-ORIG-GUID: plAS3X5Z2gd26-FlB7NX_J42SN4M1HqJ
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
> We can now get rid of the old interface along with get_pat_info() and
> follow_phys().
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  arch/x86/mm/pat/memtype.c | 147 --------------------------------------
>  include/linux/pgtable.h   |  66 -----------------
>  2 files changed, 213 deletions(-)
> 
> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> index 1ec8af6cad6bf..c88d1cbdc1de1 100644
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -933,119 +933,6 @@ static void free_pfn_range(u64 paddr, unsigned long size)
>  		memtype_free(paddr, paddr + size);
>  }
>  
> -static int follow_phys(struct vm_area_struct *vma, unsigned long *prot,
> -		resource_size_t *phys)
> -{
> -	struct follow_pfnmap_args args = { .vma = vma, .address = vma->vm_start };
> -
> -	if (follow_pfnmap_start(&args))
> -		return -EINVAL;
> -
> -	/* Never return PFNs of anon folios in COW mappings. */
> -	if (!args.special) {
> -		follow_pfnmap_end(&args);
> -		return -EINVAL;
> -	}
> -
> -	*prot = pgprot_val(args.pgprot);
> -	*phys = (resource_size_t)args.pfn << PAGE_SHIFT;
> -	follow_pfnmap_end(&args);
> -	return 0;
> -}
> -
> -static int get_pat_info(struct vm_area_struct *vma, resource_size_t *paddr,
> -		pgprot_t *pgprot)
> -{
> -	unsigned long prot;
> -
> -	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_PAT));
> -
> -	/*
> -	 * We need the starting PFN and cachemode used for track_pfn_remap()
> -	 * that covered the whole VMA. For most mappings, we can obtain that
> -	 * information from the page tables. For COW mappings, we might now
> -	 * suddenly have anon folios mapped and follow_phys() will fail.
> -	 *
> -	 * Fallback to using vma->vm_pgoff, see remap_pfn_range_notrack(), to
> -	 * detect the PFN. If we need the cachemode as well, we're out of luck
> -	 * for now and have to fail fork().
> -	 */
> -	if (!follow_phys(vma, &prot, paddr)) {
> -		if (pgprot)
> -			*pgprot = __pgprot(prot);
> -		return 0;
> -	}
> -	if (is_cow_mapping(vma->vm_flags)) {
> -		if (pgprot)
> -			return -EINVAL;
> -		*paddr = (resource_size_t)vma->vm_pgoff << PAGE_SHIFT;
> -		return 0;
> -	}
> -	WARN_ON_ONCE(1);
> -	return -EINVAL;
> -}
> -
> -int track_pfn_copy(struct vm_area_struct *dst_vma,
> -		struct vm_area_struct *src_vma, unsigned long *pfn)
> -{
> -	const unsigned long vma_size = src_vma->vm_end - src_vma->vm_start;
> -	resource_size_t paddr;
> -	pgprot_t pgprot;
> -	int rc;
> -
> -	if (!(src_vma->vm_flags & VM_PAT))
> -		return 0;
> -
> -	/*
> -	 * Duplicate the PAT information for the dst VMA based on the src
> -	 * VMA.
> -	 */
> -	if (get_pat_info(src_vma, &paddr, &pgprot))
> -		return -EINVAL;
> -	rc = reserve_pfn_range(paddr, vma_size, &pgprot, 1);
> -	if (rc)
> -		return rc;
> -
> -	/* Reservation for the destination VMA succeeded. */
> -	vm_flags_set(dst_vma, VM_PAT);
> -	*pfn = PHYS_PFN(paddr);
> -	return 0;
> -}
> -
> -void untrack_pfn_copy(struct vm_area_struct *dst_vma, unsigned long pfn)
> -{
> -	untrack_pfn(dst_vma, pfn, dst_vma->vm_end - dst_vma->vm_start, true);
> -	/*
> -	 * Reservation was freed, any copied page tables will get cleaned
> -	 * up later, but without getting PAT involved again.
> -	 */
> -}
> -
> -/*
> - * prot is passed in as a parameter for the new mapping. If the vma has
> - * a linear pfn mapping for the entire range, or no vma is provided,
> - * reserve the entire pfn + size range with single reserve_pfn_range
> - * call.
> - */
> -int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
> -		    unsigned long pfn, unsigned long addr, unsigned long size)
> -{
> -	resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
> -
> -	/* reserve the whole chunk starting from paddr */
> -	if (!vma || (addr == vma->vm_start
> -				&& size == (vma->vm_end - vma->vm_start))) {
> -		int ret;
> -
> -		ret = reserve_pfn_range(paddr, size, prot, 0);
> -		if (ret == 0 && vma)
> -			vm_flags_set(vma, VM_PAT);
> -		return ret;
> -	}
> -
> -	return pfnmap_setup_cachemode(pfn, size, prot);
> -}
> -
>  int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size, pgprot_t *prot)
>  {
>  	resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
> @@ -1082,40 +969,6 @@ void pfnmap_untrack(unsigned long pfn, unsigned long size)
>  	free_pfn_range(paddr, size);
>  }
>  
> -/*
> - * untrack_pfn is called while unmapping a pfnmap for a region.
> - * untrack can be called for a specific region indicated by pfn and size or
> - * can be for the entire vma (in which case pfn, size are zero).
> - */
> -void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
> -		 unsigned long size, bool mm_wr_locked)
> -{
> -	resource_size_t paddr;
> -
> -	if (vma && !(vma->vm_flags & VM_PAT))
> -		return;
> -
> -	/* free the chunk starting from pfn or the whole chunk */
> -	paddr = (resource_size_t)pfn << PAGE_SHIFT;
> -	if (!paddr && !size) {
> -		if (get_pat_info(vma, &paddr, NULL))
> -			return;
> -		size = vma->vm_end - vma->vm_start;
> -	}
> -	free_pfn_range(paddr, size);
> -	if (vma) {
> -		if (mm_wr_locked)
> -			vm_flags_clear(vma, VM_PAT);
> -		else
> -			__vm_flags_mod(vma, 0, VM_PAT);
> -	}
> -}
> -
> -void untrack_pfn_clear(struct vm_area_struct *vma)
> -{
> -	vm_flags_clear(vma, VM_PAT);
> -}
> -
>  pgprot_t pgprot_writecombine(pgprot_t prot)
>  {
>  	pgprot_set_cachemode(&prot, _PAGE_CACHE_MODE_WC);
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 90f72cd358390..0b6e1f781d86d 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1485,17 +1485,6 @@ static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
>   * vmf_insert_pfn.
>   */
>  
> -/*
> - * track_pfn_remap is called when a _new_ pfn mapping is being established
> - * by remap_pfn_range() for physical range indicated by pfn and size.
> - */
> -static inline int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
> -				  unsigned long pfn, unsigned long addr,
> -				  unsigned long size)
> -{
> -	return 0;
> -}
> -
>  static inline int pfnmap_setup_cachemode(unsigned long pfn, unsigned long size,
>  		pgprot_t *prot)
>  {
> @@ -1511,55 +1500,7 @@ static inline int pfnmap_track(unsigned long pfn, unsigned long size,
>  static inline void pfnmap_untrack(unsigned long pfn, unsigned long size)
>  {
>  }
> -
> -/*
> - * track_pfn_copy is called when a VM_PFNMAP VMA is about to get the page
> - * tables copied during copy_page_range(). Will store the pfn to be
> - * passed to untrack_pfn_copy() only if there is something to be untracked.
> - * Callers should initialize the pfn to 0.
> - */
> -static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
> -		struct vm_area_struct *src_vma, unsigned long *pfn)
> -{
> -	return 0;
> -}
> -
> -/*
> - * untrack_pfn_copy is called when a VM_PFNMAP VMA failed to copy during
> - * copy_page_range(), but after track_pfn_copy() was already called. Can
> - * be called even if track_pfn_copy() did not actually track anything:
> - * handled internally.
> - */
> -static inline void untrack_pfn_copy(struct vm_area_struct *dst_vma,
> -		unsigned long pfn)
> -{
> -}
> -
> -/*
> - * untrack_pfn is called while unmapping a pfnmap for a region.
> - * untrack can be called for a specific region indicated by pfn and size or
> - * can be for the entire vma (in which case pfn, size are zero).
> - */
> -static inline void untrack_pfn(struct vm_area_struct *vma,
> -			       unsigned long pfn, unsigned long size,
> -			       bool mm_wr_locked)
> -{
> -}
> -
> -/*
> - * untrack_pfn_clear is called in the following cases on a VM_PFNMAP VMA:
> - *
> - * 1) During mremap() on the src VMA after the page tables were moved.
> - * 2) During fork() on the dst VMA, immediately after duplicating the src VMA.
> - */
> -static inline void untrack_pfn_clear(struct vm_area_struct *vma)
> -{
> -}
>  #else
> -extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
> -			   unsigned long pfn, unsigned long addr,
> -			   unsigned long size);
> -
>  /**
>   * pfnmap_setup_cachemode - setup the cachemode in the pgprot for a pfn range
>   * @pfn: the start of the pfn range
> @@ -1614,13 +1555,6 @@ int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot);
>   * Untrack a pfn range previously tracked through pfnmap_track().
>   */
>  void pfnmap_untrack(unsigned long pfn, unsigned long size);
> -extern int track_pfn_copy(struct vm_area_struct *dst_vma,
> -		struct vm_area_struct *src_vma, unsigned long *pfn);
> -extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
> -		unsigned long pfn);
> -extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
> -			unsigned long size, bool mm_wr_locked);
> -extern void untrack_pfn_clear(struct vm_area_struct *vma);
>  #endif
>  
>  /**
> -- 
> 2.49.0
> 
