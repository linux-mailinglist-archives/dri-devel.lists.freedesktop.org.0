Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424A9AB5B7B
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 19:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A84210E26C;
	Tue, 13 May 2025 17:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="L4upVK7e";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Upmtj0J7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E262410E26C;
 Tue, 13 May 2025 17:42:52 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHLIV030373;
 Tue, 13 May 2025 17:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=UW2Nw0fOunmhtm8ToY
 pWEMVw7fQqi7yRXrWKb7L4/tA=; b=L4upVK7eQylLs522SYw5CRPlQN+VXUHOdZ
 /JcZfLpuGfypAnpnLBKWDD3Em7//cgcQyYYQAExdmZP7vBdiu7kguhQ4q9GWP6Gr
 NTq6UgIIapnaH2SsDTGRfywN0Ahz4qICrkd8XfElOjhB++R9t7QFuup8CiAsYKII
 X1+AqCnUbQqkqfHSL6UQSm3bQITPNMSEJOxe0dReFyw5XWa+UGEs/gd6sqToMP+k
 OnpQQXnqF2lJszuWhiVUGCTgl/qqxgI280SqLTLm8EBNWgg0NKWejA4rjUKKbfFO
 KobCRxtzIMq5LBHs4yga+dGVBRwGiigJtUG9Z75bHoGrNABKrZlA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j1d2dbgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:42:24 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54DHXUAr004507; Tue, 13 May 2025 17:42:23 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazlp17010001.outbound.protection.outlook.com [40.93.6.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 46m8an7s21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 May 2025 17:42:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlnKr+3/d+YaiI3F6dU7y4NIvle5W4MTOIMfbqnAnJgiBUXYZ/a2xLyATvELixuGt/0GzJhQRld4UrBY82v6fe1cinCXZpSdbXsOmXRmn2JImusL1gfcwtWuScT+UJXI+C9UxZJ1HqVLLWfeJ06Dq5B1+6qDHpIUaDlfMUFDF4a+HVps6G0/wPJVlGqrlPKnEeKJWz/sO5tsABb7zYhk/k87OHpyz2fokafyUMRx6M/KrUDBrMafK9QP3B0NInxscvCkJ5im/kecSchJch0bhMs6aY9wawKFcRfgOfXW19MyUVi6Tzzo2g6CM1waL5wm3jH6c0O9W+DM06/8dvL1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UW2Nw0fOunmhtm8ToYpWEMVw7fQqi7yRXrWKb7L4/tA=;
 b=CvaK7+aDe5Mt2cYctSAyYzAsXnrkjY5N68n25tYjYdN0pKLmBaxU4DzmpuiMTu/4Yqaxiv8Y4LR4jTEsaw5+kIhsUnsSZjk34AmMbDzYtodj67ixDMFBsgOmv091BvYn+z8aLohDftJpRRYkMxW1IOaosRN3TTuAFEN4BSXP1Sgv3xmtorytReP4PdukCKfg+zA54oRytr4StwALqbP55VUXaL8hm+pTuHLOx7w2xkNsOu/0uMuJk68BBxdVu42Ij5zqCUde5TccGQcqKSCDOz7YuRVF4SRgfTIMdRK3lMOKjMRuAhES8N1+hdNIyo01L4SCQsK16+VX1Ba8xcfoGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UW2Nw0fOunmhtm8ToYpWEMVw7fQqi7yRXrWKb7L4/tA=;
 b=Upmtj0J7ZM6wDv8ggWbQ2SvwZau3e2Be7Nu0h4u3fVy+04uShmaUlf9CsHrgQ/MhMZWd0/Yk8xuHhDV+33XkVEdafK91iUMMLDWqH78DCYmKXYPx3lf05W6AKhw+UEb+GOQzUd3wor8P+HPw5FFgV6NIYkKE4oOJiJpeilyvlXw=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA3PR10MB7069.namprd10.prod.outlook.com (2603:10b6:806:315::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 17:42:20 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:42:20 +0000
Date: Tue, 13 May 2025 13:42:14 -0400
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
Subject: Re: [PATCH v2 04/11] mm: convert VM_PFNMAP tracking to
 pfnmap_track() + pfnmap_untrack()
Message-ID: <mqmavklaetpnbmxw65y5rtl4v7npobiaphwn4eklvw3kz2dj7n@kcmyncuajtal>
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
 <20250512123424.637989-5-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512123424.637989-5-david@redhat.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: QB1P288CA0032.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::45) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA3PR10MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c490386-a2b3-45bb-16eb-08dd924582cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8mPFE6WWyaWPkDUdfGVsinqIZno8cWR3uVMrK7VnoAQ5i6VJrGxrExOdf//m?=
 =?us-ascii?Q?MCyoc3mzyaN2zaYWNj4ZNdGoUOCEXNfpocBZfO2ZdwILvm2XkZ8O1Ozzj3IB?=
 =?us-ascii?Q?51zkfp7gqVuGF0V/vQOwhmbtm1ynv3Ld4AcUMNV5Pi1yba5rGa2Yvcp09dxx?=
 =?us-ascii?Q?5E7Bot93Fr7CBibG+hA3/Uv4Q1vIZ9JcWxHf0YFcyV0gi0X/BjeodnfiIr9y?=
 =?us-ascii?Q?AsHuEicyEM5sQT9eFMv5Hl8Co2zD6Yd/rE+LA0UAjFYcmZ9FKnrhnsIY0eqG?=
 =?us-ascii?Q?in4hKDB//Wy0vaKsNjh+B6sSHoyIWd3Tddve71TFPz/ppBe0jMw4xdViTGiF?=
 =?us-ascii?Q?gOmfYLanqheWX9gtHZjDdTj+lGYwlIcYhKAZPaONIV3i/nn6x4S5vsxSRDhe?=
 =?us-ascii?Q?+NbXJ+9xTDo+hl3Q9qo3oVemV4+X43f2Nk3YBVlC7RhXpHo2yYRnVOyf0s2M?=
 =?us-ascii?Q?WZQstkHioYu1BZCMB/Sp5LNFne0RNvfNEmHIvIQ+eibFfBB9ouFwqDOMHsE5?=
 =?us-ascii?Q?jE7CWjZ7MPo/aH1CqvwDaa2o6QqT1BFW5XfmSaa+XEpjg4NlYueRCQzad8q4?=
 =?us-ascii?Q?1EWXBqXwtvlNKoIXqhIMZQx7GUjzWrcEGL8prLV53ye6z1Lkuw0gTnLA5f/Q?=
 =?us-ascii?Q?zbU18lHjQ06ymtDj1IZomEPbKQGuovrwAhce9I20VD36r2wgn/kM3TJEVb5m?=
 =?us-ascii?Q?eGviTHpzr6uMSJM4+6GXPEh6mhLjyBdZCCw3o4u189NiLjAYUKLDP5h3tqSF?=
 =?us-ascii?Q?SpevB8mmwUow25Tm3r8TYcxCKSuhbII6YlNqtyCWDg91aNgdomeNNr+V30FV?=
 =?us-ascii?Q?l7fFxJekuSMe5he43hWZpsUoHhuCfjzydiNXtuovIY+IYl96p2kLMwsDq+Dt?=
 =?us-ascii?Q?8D69qvuILeCa2O+0+FM60RlDvkuDmiTtbODgt0d+nfHUFX7XvCQ/zBMg6gtz?=
 =?us-ascii?Q?jmgzKpt6ifGiz+oOhy/cXHUZubRHLIwoDuT61wW/TkMZnQ2s9/WtAusnflp2?=
 =?us-ascii?Q?TU8RzkF5OVZn1zDSNN6VjEVQUNxaoHBEBCzIfvaGy6VU/v3Wuoy87ojTo/ez?=
 =?us-ascii?Q?WJPCEV3dFB5xAtSvDSrNtM4NHCsysC/SqB5Sql0S0UdSp1DpFstesM1u/9Hl?=
 =?us-ascii?Q?mhQx/rqZbmx60I/+1Mkaox/pJuC/7j4uGI03TYX13riFNwzk2LRvTNjwDZp5?=
 =?us-ascii?Q?qQxlwaw67uaWy844bsKGwymYcHg06jPV711WTJQeTDoBpgCXdnk7HZSLKrbX?=
 =?us-ascii?Q?6ehjiy71zN4qYuYC6/zeoGVbxg6K/oV0/PjfNDYVktDAUa+rN6xaqlf2wX1F?=
 =?us-ascii?Q?P6mPmsgqoIaL1nhVaVqGTFG4nrGvw03rEuMiIItYhMmvvYpPAY703UCm1GC3?=
 =?us-ascii?Q?R/YVRlGP9FgELtovcAegXfth7VGZD1FO/VgDZmYM4nRdssw0/EwDTBC4a055?=
 =?us-ascii?Q?1gMoDPCiTMR+KsIpp4gp0sS8/i+Ie+w4pSjewSJLwqeJcyVBwDr6LQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5777.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(27256017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fsre3FW0khyXDtPgaj1mWV5/KLRcTwsmgPwsla+y5XkWUeUzC/XSLkXyxMp9?=
 =?us-ascii?Q?aoXFnxOSpzxdf+LHHl6CcDj+1fe1r60MlpShlxfZerJZhO4ROuuS26HucAoj?=
 =?us-ascii?Q?Y1/5HqFhCvwFQIp/g57BxlxDcrEzNgRUXcP9eD4fRoSeEIDA45Ty3PHiz9L8?=
 =?us-ascii?Q?KP93h3H4yd/M+as/TvBDepJGIiE4IVGsZDJIF6bUDLpd3l7asIYz1xrQnu2X?=
 =?us-ascii?Q?Izxh3ldzbBdg1sw9ZsTjjbqd0rIuiUu7qgiRdbxox4K/yuflwVsBCV0G8v5N?=
 =?us-ascii?Q?/TBVA4BVZO9lMk7oaMlxV+NF72Xj126m+MG4IE4T4H/P44Hk2cC9ZdXqGmpN?=
 =?us-ascii?Q?q+l7qyNdDAkwR7N4U5z6JFbAug3v/i7/3gfPE06/Dl0TdfcXl61B6h8BkBhc?=
 =?us-ascii?Q?mL1PWDKTia4k9MAPtJUwkMqm1QylmLbXcqY534MCYYaIUcPMkXEEHtvYa0Mx?=
 =?us-ascii?Q?LGKa6ghLzcu5oHNBXtvAevrJ1yHEK6anCUORVyi9uk3wY/z0LaIozRHZt2xd?=
 =?us-ascii?Q?O/Wc9Rbe8MqQyNr/efp7WNGLLZ8UPNmvTP8td2MO0dirPMPjPfRSwvtbFMY7?=
 =?us-ascii?Q?hRrAK9/TZlVrFcEQ0H9puWU11E7LqreEPRS6pV/1k6QwSoK7snBb/nvfKxOu?=
 =?us-ascii?Q?HztvxBAGgAGjHkIx4hFO6BMtrwR4dwrEiRy1Y+dN1iE8GVrYHzSd9slrhT4v?=
 =?us-ascii?Q?RAb/KKsF0cwOGGzLe3H+u0hJPK9tpGq8bA6HltStZSKQ29kKShv915tFsH2N?=
 =?us-ascii?Q?FRXeK9Ds5iw1pFKPWGQwKTg1/8RgRL1KI2tmsEEok5zaOTENr7heLROLYuLA?=
 =?us-ascii?Q?vx5gLjD1rKFh8BzkbVn1vfgBWfbPU6whFl53NJOwOK+lVIMQ3ilcrRABenER?=
 =?us-ascii?Q?ijmuAxcDGvQ+8tyPPBOZmn158UGAjWr+dliWbGyX2G+q27onB/FxqYJM/+t0?=
 =?us-ascii?Q?TDph1U/2PPOeZdHUZ41JH3HFIb1pIIDbKK1E9gAEfkcQB+IQyqiDedeKmbXr?=
 =?us-ascii?Q?wjkMPCZm/YFSWZRMBkJmIcvbEuEf2gRkalNcuIQTT+WJaLVaYoYm5LN5UoGQ?=
 =?us-ascii?Q?fZ1YJLsJGFgx4wZoJL9KSFezuqCwG5ATbZO+ciWB1mFPiIoJp0+XTpO1jEcY?=
 =?us-ascii?Q?Ou74fsLAJ0T/VIeidPSKgt31SsySHvl5KvniL5jV8bCw8aGMtTIh4PhjfQcw?=
 =?us-ascii?Q?n6RWccBHuXv47cNlUP+xNNOPkBJAB376NcK8zpnKD7kHi3UJh7YnmVW5Sefl?=
 =?us-ascii?Q?QJdCqZ64ClOlDLvy8eRfud9q+/Vrdla8D0rIOAVNA3i9l4aiGkSyFKkE+zdA?=
 =?us-ascii?Q?DvHKawrVNal8x3DC7TZ+cwYcq3xyDVeIFWcRTuNffghPU/ULszxAmvA4HN6k?=
 =?us-ascii?Q?wCdAnFvQVoPw5Z2UPwQXvIQNc0NQaf2nOW1N5aTX9Ox6Qvnk+a0NrdAcn4pq?=
 =?us-ascii?Q?XyS+S0+28VEXef00WnI74SUNhBvw7Acwp098H8WWBBKWFeXrofXwiGC0z3b3?=
 =?us-ascii?Q?vlucYBvmmyceRGo4CEUsHbycu9PuiUkQEBRsveuxZSZ2hf2zZR+XiM8bqfr8?=
 =?us-ascii?Q?vcYj2Lb8w6zxqekmrealRuT/i2FzXhFPOVz70PGM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: OAdhSifrx3LJnmrg9azdsHssqfvZfHTLdeF+JB2sTRNlthhOPry8Y2zASIAlt4v/JPzab8laRnk18Fg3I/vKQWa/RDz4FD/BGLIws3kZAji7O081KsMOzHRwPyXVhfhS1dDLtMyQOqtxTnIRpwpd80Y5uMKk5+DfGz46RVTw47xJXRbSh0bqP+wxvOsQet5L6VJf7XiAlmVZTotjuVz1bnvBQ+0Kt4WklO+EbxevNY61iz3OznpA+640gjuDlDoDFhDA/q0EtL+IeZDBcosOdmK6ktRBsdveBfuADbajZBDZoBCKAzXHzPUMAngEHb07rbn2E30drpKgfLwScqcw1adgYxIpt/m81E5j7APbc2R4JGfbM7XOgKZWvR+DjhELNWQM5K6eKy9T20AsUwSsDC1NjVWGv69mi/Tb4IfAf179EZUS1cG3te/Qu2NZ7kE9lZA/tEF9cmwOM/ytGxgRfuzLEFp7fI0G1VGLITO9GKQINExjKxCoTbVWENxIcf+y+/V0fy1D/NLExj2kJFBITLLU3CmeTZlJDuR2oVOLBXjiJ5zIXDbkMWvINn3HFameWofLC4p+7IkPWhihwRLkvug6Jh3zu1fVeRI5CX6FakA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c490386-a2b3-45bb-16eb-08dd924582cd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:42:20.4023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEZ8/ZNsnotrpPlCHytOiN7SslBMFlKbUBXo+dt9Uj4DmpefZf0oOMa1qHz0OO+6mIZwGmveb/T5XVSqyvbRLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7069
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505130168
X-Proofpoint-ORIG-GUID: txdqNST6YOj_7RC3-hWCNdiwpzZb3xjp
X-Proofpoint-GUID: txdqNST6YOj_7RC3-hWCNdiwpzZb3xjp
X-Authority-Analysis: v=2.4 cv=XNcwSRhE c=1 sm=1 tr=0 ts=68238480 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10
 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=-AGrq7NKdQ4Cxdmug6IA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14694
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE2NyBTYWx0ZWRfX330R8l0BWGUJ
 PIE4drto64hfmGbr0El2K+2fMEUJsjMQdBX5AvtuEtBX5KkiJdJ0GsqtC9nSTjIjitJ3aOTPaFk
 UXLqYKxTOrjzB6DppBUClpGx4yKJ798nDBQi17Zj03vO9s824pstWFiHKSPamjNvN5LA/BcTw9V
 DAlB0RRZuDPeErTHk3hELceTbKzjQdd8BQdCt6TbZmriLla6z1yZRpaoIBdM13jVByHbSN687HC
 snY6H/1MOjnw5AItogf9NBhfA1+OclvMWKU8VfJj2b3IuWeXkjV/o9jRDOE2bB2ozq1yE/GFu8U
 V+jdpVYPlCWZBiqy8KXaWFL1JaJ9BbNiEaI23tzOj5Lp/oFQ6KKhN90KG93mNeJZ28JvbRcW6Nw
 IZ3KnXNrgRbyc5Ahz3C2wPSLvU7Vx0POLhGzD/AY8oTrAzYE17Q4DFDEL0ZInwUc4a2lwBa8
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
> Let's use our new interface. In remap_pfn_range(), we'll now decide
> whether we have to track (full VMA covered) or only lookup the
> cachemode (partial VMA covered).
> 
> Remember what we have to untrack by linking it from the VMA. When
> duplicating VMAs (e.g., splitting, mremap, fork), we'll handle it similar
> to anon VMA names, and use a kref to share the tracking.
> 
> Once the last VMA un-refs our tracking data, we'll do the untracking,
> which simplifies things a lot and should sort our various issues we saw
> recently, for example, when partially unmapping/zapping a tracked VMA.
> 
> This change implies that we'll keep tracking the original PFN range even
> after splitting + partially unmapping it: not too bad, because it was
> not working reliably before. The only thing that kind-of worked before
> was shrinking such a mapping using mremap(): we managed to adjust the
> reservation in a hacky way, now we won't adjust the reservation but
> leave it around until all involved VMAs are gone.
> 
> If that ever turns out to be an issue, we could hook into VM splitting
> code and split the tracking; however, that adds complexity that might
> not be required, so we'll keep it simple for now.
> 
> Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  include/linux/mm_inline.h |  2 +
>  include/linux/mm_types.h  | 11 ++++++
>  mm/memory.c               | 82 +++++++++++++++++++++++++++++++--------
>  mm/mmap.c                 |  5 ---
>  mm/mremap.c               |  4 --
>  mm/vma_init.c             | 50 ++++++++++++++++++++++++
>  6 files changed, 129 insertions(+), 25 deletions(-)
> 
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index f9157a0c42a5c..89b518ff097e6 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -447,6 +447,8 @@ static inline bool anon_vma_name_eq(struct anon_vma_name *anon_name1,
>  
>  #endif  /* CONFIG_ANON_VMA_NAME */
>  
> +void pfnmap_track_ctx_release(struct kref *ref);
> +
>  static inline void init_tlb_flush_pending(struct mm_struct *mm)
>  {
>  	atomic_set(&mm->tlb_flush_pending, 0);
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 15808cad2bc1a..3e934dc6057c4 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -763,6 +763,14 @@ struct vma_numab_state {
>  	int prev_scan_seq;
>  };
>  
> +#ifdef __HAVE_PFNMAP_TRACKING
> +struct pfnmap_track_ctx {
> +	struct kref kref;
> +	unsigned long pfn;
> +	unsigned long size;	/* in bytes */
> +};
> +#endif
> +
>  /*
>   * Describes a VMA that is about to be mmap()'ed. Drivers may choose to
>   * manipulate mutable fields which will cause those fields to be updated in the
> @@ -900,6 +908,9 @@ struct vm_area_struct {
>  	struct anon_vma_name *anon_name;
>  #endif
>  	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
> +#ifdef __HAVE_PFNMAP_TRACKING
> +	struct pfnmap_track_ctx *pfnmap_track_ctx;
> +#endif
>  } __randomize_layout;
>  
>  #ifdef CONFIG_NUMA
> diff --git a/mm/memory.c b/mm/memory.c
> index 064fc55d8eab9..4cf4adb0de266 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1371,7 +1371,7 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  	struct mm_struct *dst_mm = dst_vma->vm_mm;
>  	struct mm_struct *src_mm = src_vma->vm_mm;
>  	struct mmu_notifier_range range;
> -	unsigned long next, pfn = 0;
> +	unsigned long next;
>  	bool is_cow;
>  	int ret;
>  
> @@ -1381,12 +1381,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  	if (is_vm_hugetlb_page(src_vma))
>  		return copy_hugetlb_page_range(dst_mm, src_mm, dst_vma, src_vma);
>  
> -	if (unlikely(src_vma->vm_flags & VM_PFNMAP)) {
> -		ret = track_pfn_copy(dst_vma, src_vma, &pfn);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	/*
>  	 * We need to invalidate the secondary MMU mappings only when
>  	 * there could be a permission downgrade on the ptes of the
> @@ -1428,8 +1422,6 @@ copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
>  		raw_write_seqcount_end(&src_mm->write_protect_seq);
>  		mmu_notifier_invalidate_range_end(&range);
>  	}
> -	if (ret && unlikely(src_vma->vm_flags & VM_PFNMAP))
> -		untrack_pfn_copy(dst_vma, pfn);
>  	return ret;
>  }
>  
> @@ -1924,9 +1916,6 @@ static void unmap_single_vma(struct mmu_gather *tlb,
>  	if (vma->vm_file)
>  		uprobe_munmap(vma, start, end);
>  
> -	if (unlikely(vma->vm_flags & VM_PFNMAP))
> -		untrack_pfn(vma, 0, 0, mm_wr_locked);
> -
>  	if (start != end) {
>  		if (unlikely(is_vm_hugetlb_page(vma))) {
>  			/*
> @@ -2872,6 +2861,36 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
>  	return error;
>  }
>  
> +#ifdef __HAVE_PFNMAP_TRACKING
> +static inline struct pfnmap_track_ctx *pfnmap_track_ctx_alloc(unsigned long pfn,
> +		unsigned long size, pgprot_t *prot)
> +{
> +	struct pfnmap_track_ctx *ctx;
> +
> +	if (pfnmap_track(pfn, size, prot))
> +		return ERR_PTR(-EINVAL);
> +
> +	ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (unlikely(!ctx)) {
> +		pfnmap_untrack(pfn, size);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	ctx->pfn = pfn;
> +	ctx->size = size;
> +	kref_init(&ctx->kref);
> +	return ctx;
> +}
> +
> +void pfnmap_track_ctx_release(struct kref *ref)
> +{
> +	struct pfnmap_track_ctx *ctx = container_of(ref, struct pfnmap_track_ctx, kref);
> +
> +	pfnmap_untrack(ctx->pfn, ctx->size);
> +	kfree(ctx);
> +}
> +#endif /* __HAVE_PFNMAP_TRACKING */
> +
>  /**
>   * remap_pfn_range - remap kernel memory to userspace
>   * @vma: user vma to map to
> @@ -2884,20 +2903,51 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
>   *
>   * Return: %0 on success, negative error code otherwise.
>   */
> +#ifdef __HAVE_PFNMAP_TRACKING
>  int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
>  		    unsigned long pfn, unsigned long size, pgprot_t prot)
>  {
> +	struct pfnmap_track_ctx *ctx = NULL;
>  	int err;
>  
> -	err = track_pfn_remap(vma, &prot, pfn, addr, PAGE_ALIGN(size));
> -	if (err)
> +	size = PAGE_ALIGN(size);
> +
> +	/*
> +	 * If we cover the full VMA, we'll perform actual tracking, and
> +	 * remember to untrack when the last reference to our tracking
> +	 * context from a VMA goes away. We'll keep tracking the whole pfn
> +	 * range even during VMA splits and partial unmapping.
> +	 *
> +	 * If we only cover parts of the VMA, we'll only setup the cachemode
> +	 * in the pgprot for the pfn range.
> +	 */
> +	if (addr == vma->vm_start && addr + size == vma->vm_end) {
> +		if (vma->pfnmap_track_ctx)
> +			return -EINVAL;
> +		ctx = pfnmap_track_ctx_alloc(pfn, size, &prot);
> +		if (IS_ERR(ctx))
> +			return PTR_ERR(ctx);
> +	} else if (pfnmap_setup_cachemode(pfn, size, &prot)) {
>  		return -EINVAL;
> +	}
>  
>  	err = remap_pfn_range_notrack(vma, addr, pfn, size, prot);
> -	if (err)
> -		untrack_pfn(vma, pfn, PAGE_ALIGN(size), true);
> +	if (ctx) {
> +		if (err)
> +			kref_put(&ctx->kref, pfnmap_track_ctx_release);
> +		else
> +			vma->pfnmap_track_ctx = ctx;
> +	}
>  	return err;
>  }
> +
> +#else
> +int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
> +		    unsigned long pfn, unsigned long size, pgprot_t prot)
> +{
> +	return remap_pfn_range_notrack(vma, addr, pfn, size, prot);
> +}
> +#endif
>  EXPORT_SYMBOL(remap_pfn_range);
>  
>  /**
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 50f902c08341a..09c563c951123 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1784,11 +1784,6 @@ __latent_entropy int dup_mmap(struct mm_struct *mm, struct mm_struct *oldmm)
>  		tmp = vm_area_dup(mpnt);
>  		if (!tmp)
>  			goto fail_nomem;
> -
> -		/* track_pfn_copy() will later take care of copying internal state. */
> -		if (unlikely(tmp->vm_flags & VM_PFNMAP))
> -			untrack_pfn_clear(tmp);
> -
>  		retval = vma_dup_policy(mpnt, tmp);
>  		if (retval)
>  			goto fail_nomem_policy;
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 7db9da609c84f..6e78e02f74bd3 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -1191,10 +1191,6 @@ static int copy_vma_and_data(struct vma_remap_struct *vrm,
>  	if (is_vm_hugetlb_page(vma))
>  		clear_vma_resv_huge_pages(vma);
>  
> -	/* Tell pfnmap has moved from this vma */
> -	if (unlikely(vma->vm_flags & VM_PFNMAP))
> -		untrack_pfn_clear(vma);
> -
>  	*new_vma_ptr = new_vma;
>  	return err;
>  }
> diff --git a/mm/vma_init.c b/mm/vma_init.c
> index 967ca85179864..8e53c7943561e 100644
> --- a/mm/vma_init.c
> +++ b/mm/vma_init.c
> @@ -71,7 +71,51 @@ static void vm_area_init_from(const struct vm_area_struct *src,
>  #ifdef CONFIG_NUMA
>  	dest->vm_policy = src->vm_policy;
>  #endif
> +#ifdef __HAVE_PFNMAP_TRACKING
> +	dest->pfnmap_track_ctx = NULL;
> +#endif
> +}
> +
> +#ifdef __HAVE_PFNMAP_TRACKING
> +static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig,
> +		struct vm_area_struct *new)
> +{
> +	struct pfnmap_track_ctx *ctx = orig->pfnmap_track_ctx;
> +
> +	if (likely(!ctx))
> +		return 0;
> +
> +	/*
> +	 * We don't expect to ever hit this. If ever required, we would have
> +	 * to duplicate the tracking.
> +	 */
> +	if (unlikely(kref_read(&ctx->kref) >= REFCOUNT_MAX))
> +		return -ENOMEM;
> +	kref_get(&ctx->kref);
> +	new->pfnmap_track_ctx = ctx;
> +	return 0;
> +}
> +
> +static inline void vma_pfnmap_track_ctx_release(struct vm_area_struct *vma)
> +{
> +	struct pfnmap_track_ctx *ctx = vma->pfnmap_track_ctx;
> +
> +	if (likely(!ctx))
> +		return;
> +
> +	kref_put(&ctx->kref, pfnmap_track_ctx_release);
> +	vma->pfnmap_track_ctx = NULL;
> +}
> +#else
> +static inline int vma_pfnmap_track_ctx_dup(struct vm_area_struct *orig,
> +		struct vm_area_struct *new)
> +{
> +	return 0;
>  }
> +static inline void vma_pfnmap_track_ctx_release(struct vm_area_struct *vma)
> +{
> +}
> +#endif
>  
>  struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  {
> @@ -83,6 +127,11 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  	ASSERT_EXCLUSIVE_WRITER(orig->vm_flags);
>  	ASSERT_EXCLUSIVE_WRITER(orig->vm_file);
>  	vm_area_init_from(orig, new);
> +
> +	if (vma_pfnmap_track_ctx_dup(orig, new)) {
> +		kmem_cache_free(vm_area_cachep, new);
> +		return NULL;
> +	}
>  	vma_lock_init(new, true);
>  	INIT_LIST_HEAD(&new->anon_vma_chain);
>  	vma_numab_state_init(new);
> @@ -97,5 +146,6 @@ void vm_area_free(struct vm_area_struct *vma)
>  	vma_assert_detached(vma);
>  	vma_numab_state_free(vma);
>  	free_anon_vma_name(vma);
> +	vma_pfnmap_track_ctx_release(vma);
>  	kmem_cache_free(vm_area_cachep, vma);
>  }
> -- 
> 2.49.0
> 
