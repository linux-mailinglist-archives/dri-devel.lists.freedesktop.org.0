Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A704AB3DE3
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 18:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDC310E45C;
	Mon, 12 May 2025 16:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="JweLYo1p";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RL0DHR81";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7425910E458;
 Mon, 12 May 2025 16:42:57 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CGY09L021717;
 Mon, 12 May 2025 16:42:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=07cUbDRqzGq8jXdttI
 SqQy/piwoXwjGVS4LIptYbShI=; b=JweLYo1pReP2VzZj6oNIR+6mF0O+2jqKsV
 02WyOGUFaY2EC0XB4KqJjc9R17oCBX9u1obg12YtsFfpnfvSv1ZvmzcRobkFGcLt
 fgardWIljDOGCB0oexJ9ur4DCBfXfzr9XU59q2J/TmdSSeRPJKqtqUu/mw2Q41VF
 2u8CQ+ylZECcIM1ZA4NK2K/nQzzAf1GDBnu/xK/SmlNgWtMoRynhumlMk2tuKuM7
 fte0RsdvvQt7/VdwpwjXq2q+k1sl3E9hy0KZbHYzB68oozNj9p2Ldi7awfCcYqh6
 C9eV4OhG+o5gp759ObsbyiLvqzMFN6yl5KaDeQ1lCfh05P9nvuHg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j0gwk0gn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 May 2025 16:42:23 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54CFVCd8002004; Mon, 12 May 2025 16:42:22 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com
 (mail-northcentralusazlp17013058.outbound.protection.outlook.com
 [40.93.20.58])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 46hw8e4689-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 May 2025 16:42:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXmEa+mzSljn8i0YvKSh/Zr73cxSXNRLgTy/KrC9XV/CWAQeNu14Fl9Zwmt+5xDfJb0Pyiw7DGcQIySBzev7iEX6bxGSMojhbCZ95sXFUPqcVHZoDvmAvoGhRDTf0SC9bTeT319rgNp8Y8C/2WHKX/N0cw+uKtpTO1oFHOZ5M378P/NXoxxm7kfPT/CE3pA13Ma+eoE+ekGeqvBro/G6RtJEiAViIIYJMWz5qSZiC1QeJhf/dUlnBrakGWkVw2y6Yh+EqK0Sf0SP3QIShbV5932+o8+qfzcXB9OHttACnuzJuSU1L/vektxOb9isIYUGH9/VzOSTsyhObgUO5McdFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07cUbDRqzGq8jXdttISqQy/piwoXwjGVS4LIptYbShI=;
 b=b0RLt7cvXbResxzhx84LVwYOryny7I6fcDqmazV6ohZWWyEy9G32zfRGZ0bJCQb8UxiKpO4a5Rkcu3sTlzo3Ddbdh37aP3axrs6e40kBEyJ52pBrFzSTKPb67VX45zbJaccMOHgjIUGLFW2HT34/PNCTfw953jpcoDVaXJWK3S8TI2GFKFjEnqBa8TqUVDRcY6GlgsH36eaOyCpIKwt6qKN4fNr495sz4neZx/m5v24zOZtKWWGECIwpizb60E8iIgofZRb+q61RpZe3Rq+SEInFJTFzqUbwJNmEvJW4VW7y/uyqlmo81KxJzg5BfhI0JXVFu/ZN5q01K76CdEPaCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07cUbDRqzGq8jXdttISqQy/piwoXwjGVS4LIptYbShI=;
 b=RL0DHR81cWUa5bSTsLCnYokEO7W/lPdX7ceEg3uFtMwtTvcrgMrsAOlgyRrp2IfZNCY5V3//pCCvMt7+RaU5gVYcOoR9lRuinu5uR5xENsKlwypgSKVN1pHLx9INHM9jBYa9Getk97mI7rgEmX5ny9Qk7CiXFRephykex1tTjNY=
Received: from CH3PR10MB8215.namprd10.prod.outlook.com (2603:10b6:610:1f5::7)
 by IA3PR10MB8442.namprd10.prod.outlook.com (2603:10b6:208:57d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 16:42:19 +0000
Received: from CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90]) by CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 16:42:19 +0000
Date: Mon, 12 May 2025 17:42:17 +0100
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
Message-ID: <d180a8d2-87e2-4878-bca1-e6986b7fc110@lucifer.local>
References: <20250512123424.637989-1-david@redhat.com>
 <20250512123424.637989-5-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512123424.637989-5-david@redhat.com>
X-ClientProxiedBy: LO4P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::18) To CH3PR10MB8215.namprd10.prod.outlook.com
 (2603:10b6:610:1f5::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB8215:EE_|IA3PR10MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4bc935-d6f2-4346-4c44-08dd9173f64a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y765/Nw9rv3G0vxZhn7q29q6ZXMhRfCB88L3yDH0rhMp2q9e0mVfvlUHgcoN?=
 =?us-ascii?Q?SD/cHv3Iytsl2opZAfauxuCwK7zM6RCPK1tAuxpkPDtkIiMNx6sT5ViGBzVF?=
 =?us-ascii?Q?NGeVGkpfZdC8f4QjrhzdsvYVTzBacHyBqHv396Y2KYmF54QlBxWvIrkesH8U?=
 =?us-ascii?Q?Q/pEdPdCV24Qx/9Wz7dlEBnZZGc33wcRD1ByMiosu0voNFdhbpTYlA0/e/W7?=
 =?us-ascii?Q?wn0Qp+NGs+4lvHuE7CJB05tjMP6RdshxgWk+Xzs2D8519lTD+OQzAHBI+9el?=
 =?us-ascii?Q?eH4Eyrholq78YzndETROqG3hi83ah+64Ndg5Jpvm223+jRAin/76bEo9Vq/r?=
 =?us-ascii?Q?cUdvuJaOOJerciKY1qFr2aCNkVcQs6tG8IuPzwm9yKviL+49OgIJW4h0gOg2?=
 =?us-ascii?Q?3mOTDSnTeeDb6Umf1PAMaZmseMGbGw+l4lxn5ITRm/X7Y+I8E4vnnxpqV6xN?=
 =?us-ascii?Q?CLY3ACPfyUBW3zyDPMYfHjdncWquQoKIiGmzb/KOu1SZiHFa7AJOuAqQ4Nkz?=
 =?us-ascii?Q?rp/KvVrR4JVlOr0nr8nfNqUA085t03+Zzvix5R9OkRqmY4ZCb7pYtoDvHhMX?=
 =?us-ascii?Q?HmjbBhjiH/eUBJkpAwgKkXqvVsnw0rCoBy6cHo2/FBSmPi6OdPBy4hzqL7GT?=
 =?us-ascii?Q?x/wqXo4TJYC35Q9C8P48bA2kRtz0+V+7yg6V4VyPCCFoO8Y0jvueCrZGvlS5?=
 =?us-ascii?Q?80LmhLWVflNvYvyPcBMW/HKwZ3TIxxKFF8ygm/Xd8PmLQmwqUfVvvYNc9yPg?=
 =?us-ascii?Q?bns6ZR8U9cohNuL+Xsx13XS2qiDk9I3FVkilRjV6X1whndVp1ulHWWRJzxfC?=
 =?us-ascii?Q?QOXytqxIty7Dq2z3Y+75NypjaRydR3+jL1cl9Pi29OkNjtpJTPW2UZvqbQOA?=
 =?us-ascii?Q?rbf49wiBHBm/C2oO3zvG3vQBB+pTjRJ3V/sIS2LF56Z5i2lQ6zIatlPvjeu3?=
 =?us-ascii?Q?c4NziC3OU555A36HMKb6SXz+sMcS/DioWPITlUDTi6RoTpzGd1WTFxBFts4Z?=
 =?us-ascii?Q?ne+HhTpPerPX6czdJUD89ryO+i/ujNcLnGYdMYFPj7yIQpWskU1ROKzKhRwQ?=
 =?us-ascii?Q?oZzAVieAxfdW6EpWKAdb9+4LwvkomsGzInVtnUntok6frchOTeD9bL4AfIUj?=
 =?us-ascii?Q?hcef2eNKuWd8wnEg6fio6rtRN9YBtjWlzT41KrNFF7NInQNWxPYyLO1zJIyX?=
 =?us-ascii?Q?a0t3JM2hDgmQIoGMrRPw62Kp+hWXFiRcGsmKrUjYURCdAHataab2yQ3jrHkf?=
 =?us-ascii?Q?PyxdMKHammUM7eT8+XVm2HD4oCUS0kO4HuIuThWAvotwgoqOLmsFgcp6lVdg?=
 =?us-ascii?Q?GwqZBrxOJQwN6Ocm0Gjk6Ve8Lt1Hc31qVyeDuwvwRUkt/1aaF8xnVPTbws7N?=
 =?us-ascii?Q?WrZ5GByK+IswQheR3XHzo4rCII3mQoHZhk23ppbcNXn+KlsHi6fBZr50JYJB?=
 =?us-ascii?Q?5vwxfE2MuOM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR10MB8215.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pc4+OsHISIsl5c6+D6DWHx4kFNqk3sCK15DAMa86IGyJCyZA2GQnRz6r/Ed2?=
 =?us-ascii?Q?MKxbC7GVtKcLDRMeTDlc3lFVJn6Tc30dij7DwxQdoJGwQRF+sRsvrwJhmb4x?=
 =?us-ascii?Q?oyXTJ0nwTotIatfWcAGldvAi3+BTY1yqVr5Awn+iySNIKy5vItXkGZ5iUAmH?=
 =?us-ascii?Q?SsMeuN4wkKEci+bW0ovYGIdaC1HYcTG3+gaIANxxHnC2EzqSqWM0OVnN+oLD?=
 =?us-ascii?Q?2yC3Q0HYpnf0IOtfNpFZPAZzMhSHKRu56vwJUAI+p2o+JO5LdecxSXet3oOX?=
 =?us-ascii?Q?nIjXcbNc7MUTv6IQTzY75Ppvo7wquOF7BNaVIA83dQhCAvbk0DhnHPMafGqD?=
 =?us-ascii?Q?U/iP7LpUpx56Q54gyzMspPKXGtIx4Q9fTlJNSP8us13Atj1xGMBrnie0WuxO?=
 =?us-ascii?Q?AvCOayzt4SlpInIjH8/eSh3tzg4YrimEsX60ILhReZwHzRmVTOtNVFxUZ/X7?=
 =?us-ascii?Q?CpvYYZDZej+I+oXj4mXUliVpmRXdGhuSjDr+/w7I2VMwqM+4g8ZjAy6C+G+7?=
 =?us-ascii?Q?+fnLSSCoM8j6m6Ud+Dhk6jwgjW+xqQ61lLpPys6ci/eBqVDUvn/IbNk9mQXO?=
 =?us-ascii?Q?Yxo2TYAhNiIgICMXpvtRKeiJzARFMz+/SzsEoGE1s4GNdoFGwcYU6eGMMsb5?=
 =?us-ascii?Q?JXaeqIleLf2HT6PX/YWZHgzd5Opx6hZ+/GQ9uZvHq7eRBtK8KaQ0ctL6pbR/?=
 =?us-ascii?Q?EXB9peIWHynPaeD2zA19jMOr/As5X3NFi0XvD0fh90rMUDyZNIGclzfWOEhP?=
 =?us-ascii?Q?9zFhD+KFMANE09o8R61C8E96LC2jvZJ6EF+REbha0ZXhu5ECnM4qnrZW4Kkg?=
 =?us-ascii?Q?fMkju6f/so6fd0XPe/HhMphffWbaWaE5cgKcvKTeosjRaDG8SUUAqlcFHsXR?=
 =?us-ascii?Q?0JyjpGGRIFRpLEObhOk/So/lrcDHpH93Ij1CrDP75mkw9NSsQArwetxT3jc6?=
 =?us-ascii?Q?tXoW+dkFIy7fENod79gM5Ur/yxnf6U9bivpnp6xb76NFtPWoLSum4hAcYwz/?=
 =?us-ascii?Q?FiszkngDFPsgPG2aswuPWVAzX6xGG5y6kL7S6W61+hsvII6nR7pFiyOFXA4/?=
 =?us-ascii?Q?VQvRjCF2OJ/521VPOVXntHXs1J6wg3NLsjDd690a76NzkMzELY/rmb0HdXps?=
 =?us-ascii?Q?gsneBFQql4UmKHXpFS/uptNvRPEYqPUSB7L/lJsXUUbZWgfm82DkmjUFIK8k?=
 =?us-ascii?Q?Regq9effaJsQHnjIvHeZdS2it8XEhnD4SI164StBRAShxqf0lh79onQVwDmo?=
 =?us-ascii?Q?sk6LTNrCR2eAuxdpRkHEbCpJQwdCbkGe8SBF8aEuNU5CogaSVODWeFiHRtsW?=
 =?us-ascii?Q?vbm4qwNk8fpGqf5TE8ZfyTwtj1O5Hub0BZJlzKMaGMcY/3KWRgcE60LUpNq4?=
 =?us-ascii?Q?zEQOVBXZ89nypdaGqH7MLy4byR/ffinhLsovv3g0iQaoXVBMgPY01cDesTOM?=
 =?us-ascii?Q?hkc7LhJXEMXcMIeH+vQpn7SjsqI7ppa1UO+K6Kkcjk2mldllue1h/1EduDoO?=
 =?us-ascii?Q?n9cUejbNIWzFswmFLP/K0bYMoKOCOZshC8vTGkiZSLPzwIi/YAZCdqfdeJVM?=
 =?us-ascii?Q?k7f04aKFxK9mUv3z2ZF6lLUZB6aj5/9YcDX2qOT1eEPxPL/V8a9PTTLnhkss?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: y6SxxImmpCLdVTkSrse0339fK6Rd6zFYuHTT+wscfd9T2h5fh2LGqEU5sAQR0FxbHsDHkVFp2WxQ0oWKoaaWCOTVU7YYKWeXlaE74u2xyox54LgYAukx+bc+AQC1ob1tL1U3ov150ihOd15eT+NMdT8azSij2SfwvpYBcDRt0ER6JOq2Hnk3AHOhemRwpPDwduzuy5PHA0GgIX2TtjlMiCsmgJIBIeXqKXrNQqU6H0uTvYrbCq5kYoeFqLOrHX4xMpw+cz6TIcRpY2aXwPeBjoYpFlBDdqkipBUrsISO4c/gkdhziBfX28QOlQBCOOzMA38o30qU5NdEI6A65nQV/IZ/NB4Wp/P0E5c48BAjpPuhRqWoRO4S4JVMNHayYMSfCC9h8tl7t5xPNbixclkCdqMdX2btq5wlQ491cr6I6e2jxBmFyD03kk1fFrxZGPgK7bNvYAsXqBHsgNw2UbMP6BfBvogXgtIESRel1TrfvoD0zHqa1ZoU/ggedvBh6cQ2g2U9EHi1GxFo3Jd7VaaCpMOJzvip3RsoMdHMqkqXGV/c/m0rdwp1vH9J2U17r4vG1oI2LCXU/9GZmjym82X6eRgMsEPmFOHJfxl05qjeRaY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4bc935-d6f2-4346-4c44-08dd9173f64a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB8215.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 16:42:19.7654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3+N97uwWflINJLyZpjKMatgFhfPZLrapKXLEEmS3j4CxG4i8YnNSCgG2mUxm8MYoGWEXp1YJET1m3CY7Hesmst5y548pMlU7bmTK0vC1V0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8442
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505120172
X-Authority-Analysis: v=2.4 cv=M8hNKzws c=1 sm=1 tr=0 ts=682224ef b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10
 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=-AGrq7NKdQ4Cxdmug6IA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13185
X-Proofpoint-GUID: 8TuKKLurFbA550CzXw1PLhM-cVyvcGae
X-Proofpoint-ORIG-GUID: 8TuKKLurFbA550CzXw1PLhM-cVyvcGae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE3MiBTYWx0ZWRfXxvwBuF97XCMi
 9/VIu6Pw3K8B5G85n7S+YfG+ardyNTeB1wO8IQInhW97kFAEDJ5JuFG8vafJsPIcnuj1I6iui9O
 vWqDy5BcNNKcpf7cStDEaipm3tZFT0tCEgofn6vkmkB8ZX5r7XD3kNuyB1xSUdTc05w6orZl7d5
 N6MUdCUxyv7CSGZqazcsiiR60Tmp0b62etfTCXQiAuibqUHYAc6eu9xQxDtdaCvwF3R5F3Z/UCN
 W8+KGKDQkumxZ9cb/v4kpzKEiBPXAH0gPs/QxjLXjbPq7sibNgETYh/PhQHkuC6d20ylUH8i3RE
 HkH0Nucl57IbS0X1MS+BJ4WqgFpuoCWqYpuFnjz0Xoj9A04YgJdKMJ2qltrZowN7qu168lQB9Vt
 NsmyvzladKiHD+Nhgyfn5J25uhmBRwqRMMy5xnUAB5NOv81dwX4bsXz8gXcHBMvYwg5G8k7H
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

On Mon, May 12, 2025 at 02:34:17PM +0200, David Hildenbrand wrote:
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

Other than small nit below,

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

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

How not expected is this? :) maybe use WARN_ON_ONCE() if it really should
never happen?

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
