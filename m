Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A32D0C11C
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 20:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F2810E944;
	Fri,  9 Jan 2026 19:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="sI7W3GEO";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lQTEmXD/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D467010E943;
 Fri,  9 Jan 2026 19:27:51 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 609JMkDO3674752; Fri, 9 Jan 2026 19:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=etn6BwXGZvjwatnjrG
 d0Fde0TLWzOjNXEu0ZHp5M7Zw=; b=sI7W3GEOsSu1IJeIIgrWIWzVzKSGo/iBzK
 tgLSmsR4Utx95e8cYy/6pNyg4yQ2z/79u+76XlqFISkZuOiOt3MPmNVJ7FLZ3c4u
 DH2dEUCqMh0M/0gFIMHod2QdkZlcOVxbg2KtvwpfoVYQd+/WWqS6I/PH7q9FtZuI
 XN2iYKtGnFLpVPcA00CYaLbW2tVF+h6MBMpQAxv7l53lG6LL0H2KavLNzfCgLBOQ
 lByPO7Drorw68XhxXdNPIKcJ+7C6Ng5NL59ijJ0IQ5lozkvlc2YX8UyE8t6KE92a
 sLo0TCW8icnConulrASMpntjQi8JdwEZnCeHOavRKUKGs8d4peQQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bk7sc8048-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Jan 2026 19:26:28 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 609HWSp9030764; Fri, 9 Jan 2026 19:26:28 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012056.outbound.protection.outlook.com [52.101.48.56])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4besjgsaac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Jan 2026 19:26:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDg0oS4bPQ7iMykT/6oP6amObAZdN0oCx4b4TXDty/2U6OV3dNdunARQ7iyua351Mnpc7QOkuAt0CA79njJdX+vVMiVAtFS65Bbcw/CFkwhyGawaEhFUPDk9l3JPQ0I1eBoyFwhdFWkPH7f7mae5rXD7aj3HjvnEXc8J+r4nKwEce3Se6xfV45483TZp5nsEm1dqTMNSwzGoQL0iM/cmoT1gzWkZ2aqbl9ZMrNrTDtckkKeUwVFTSJxM4pLXwMKrNnDEbBC4lDu38Z13McXhhZGrP1JOSBKzCECwlexoSBA+CNEYTBDuL06QB269M4fMEysWJ7wJ42wDiCyw7qQc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etn6BwXGZvjwatnjrGd0Fde0TLWzOjNXEu0ZHp5M7Zw=;
 b=fAwKoi5acXregSFsD6zWxDNyYOCL0ZVHx/gKpdCSg0I7zLOY35jekDE6/dVJmKyTOkzoVs8uNOIHld6VsDhCCalIB6SGaGh2g0x8NF55y4E1sR2LFUNX34TWDeDSnhOMTaTN6m933MwYR62Cg79PAoH7FkxlMYbx0+V8EAx17UIuNlkz9v+i2HlfJn5i/zlXMrbAnJiL4/yL8sOiSh3RzHtzrn+27xnyI1mvsXr3NbHQna+kpOZZPEHdlbQ4p/UTPZCLVb/4bkAdtDV2xBPc3I8xQxqlJHXsg8NGg/qQ64VDGy7W2N6EpgXDifG+y0Wx4b9IMTLoEGsrGnsW24sGLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etn6BwXGZvjwatnjrGd0Fde0TLWzOjNXEu0ZHp5M7Zw=;
 b=lQTEmXD/rwM7Rt6bdTiUgJ8xt/RpBtgTQaGPnaFEbo7dPp/cojCYiyK02hnvw0fEpX2B3p227M+bW6o/CS6UkBZzcBJHexh0cRN0UeHW2IVGPb1BPNR8s5/OYLQ01elO387VAkVFoZJNJvrHEyxJbLb9S7TDtKFKWu3TmCV+EE8=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by MW5PR10MB5716.namprd10.prod.outlook.com (2603:10b6:303:1a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 19:26:22 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 19:26:22 +0000
Date: Fri, 9 Jan 2026 14:26:18 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Francois Dugast <francois.dugast@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 1/7] mm: Add folio_split_unref helper
Message-ID: <zp7wcqqr7cxodjjdc3mbifvah5xnsmvex7riynjnand2htcpab@2iojqhksin4d>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Brost <matthew.brost@intel.com>, 
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Francois Dugast <francois.dugast@intel.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Balbir Singh <balbirs@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Alistair Popple <apopple@nvidia.com>
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-2-francois.dugast@intel.com>
 <59fb1669-2908-4cab-b3c0-b97479da3fb9@kernel.org>
 <20260109103741.533c1b807f3ccf9a6f0264de@linux-foundation.org>
 <aWFMOvGldokHHgIn@lstrano-desk.jf.intel.com>
 <20260109112254.3d831aff9f27ebe986536a4d@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109112254.3d831aff9f27ebe986536a4d@linux-foundation.org>
User-Agent: NeoMutt/20250905
X-ClientProxiedBy: YT4PR01CA0254.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::9) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|MW5PR10MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: df4dc086-e3f2-43f4-ce8d-08de4fb4f8f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AdsQJ2iOk4PQJZTArytznPcacCKCF9iuIyFsEE58fD0V4R9jI0eUIlc7SxCM?=
 =?us-ascii?Q?I0WlPLgL7tVSHjQd9Z/HJF0RoJBYnpxsgbjB35BQJ8n3d4KSSIKXPBpYDY7g?=
 =?us-ascii?Q?nZdgh/OqpufXb4WQFSZ8o+FzthhC2inG5wdh8FUKBh4Owa/F4Vijw1bkq4sM?=
 =?us-ascii?Q?4PFUmdJDQ7lSTdV+Q6yhvkTYhr8MWJkqS1MFvCcUzdCEnLJdXZmCaX0x7Fcr?=
 =?us-ascii?Q?iDcmIjg5Hny8U5g9PcHX/PKFsDyK2j1EANoA8JC9EOb4ABcZ4V9HHkrIhQnZ?=
 =?us-ascii?Q?EwsXLHE6pLWE9EsdlFmULBqaKnLTMXJT0HAyJ78Gt+t9HQcZgrMLU0n4Ig6k?=
 =?us-ascii?Q?V1v2v301a8fTOI9bLrVwagkHoVDcK0lU86tVyOpWJ0n38zcAypgnvYfvWwaP?=
 =?us-ascii?Q?gRyYwW6FYFTT+iy4NUr7Ljszpi7cysG5Ft10sac4UEY2VH/wx1jHvachrfrf?=
 =?us-ascii?Q?RcQxXZatGlNUyJX43TzCP8N1A6jSRH8xP7F1Ei6RA9mRAd8wp6AvWjxTaJlD?=
 =?us-ascii?Q?vCL5Xq+AnhcmntT4cgrrGuYeSKwTOIt32cljvJA6ZMpxDq3x8xmpNEmWKSA9?=
 =?us-ascii?Q?C/Pr1yeJABbeaK5Nh15+Z/8INuvXD1zMh//UH7HSeWWEeqp39F09UglBoU2D?=
 =?us-ascii?Q?315IuiOMxumWr8psyth9tLMdXHHHbT/NcRWx6slW/Dc8jB+LvmUvF1TpEqbT?=
 =?us-ascii?Q?AxWD6OBQ6l9eKB5eudyLkG4lZ9DJvM+rR2jB80qURvmYi37GG93x9ma0ELPa?=
 =?us-ascii?Q?CEVx74Cbk984qXLPHOoXYXZ6fGZENbeg0R9aOoTiKpx2iFEboyPe8gMVILrZ?=
 =?us-ascii?Q?5TRxzpkV66h2c7hk7xQXn3cy3ItdM3KwN9gV9t2dOxx722fHWBcF4+JEDnhE?=
 =?us-ascii?Q?YXBgeTJcZ+K61DaD1iVYe2UyIkFbdbTunQVkb4hrWE1s2uL02U9ZcxdunLVg?=
 =?us-ascii?Q?8r+c1tZRN0lYZkzdPepMVPBwfzSjV84xPIzdzyC6GPGLgtg2/KpzZ4l3LJn8?=
 =?us-ascii?Q?yNBDmWLGk8B62AS1iYV2B5bT9SfSMVARwjwEa3vAqkQCeXwpV0xIy1vWV8wh?=
 =?us-ascii?Q?7/JhkbA+S+aDvEp31wm+JtEskbSmorlFx84r8HRYOhDh640r1+ygCV8uto8D?=
 =?us-ascii?Q?eq2tuoGhCyBE/q6/f1g/HKPFUVpjcszGSsUDBtSh06DefT324Gp9YyrPvvQA?=
 =?us-ascii?Q?QXJ75tBLXduxauliLeM+nDpurqqYYDSA1QJOM9R/yYSq8A6UPscuPVoO0V/8?=
 =?us-ascii?Q?D7N4+evlDjkEUD1GMye71RdPqUva0aagMEBrYsyM+ZdUjpjGzFBlpWr61UYD?=
 =?us-ascii?Q?lgmbTV/9WNMdfM3M3dcGEs6ZXR36uNC4qogpMd8woTqLdRypX2mvvr30Pfk2?=
 =?us-ascii?Q?ZBRZ8YNyFJDJfYfiXRbmxlv9B7iiwcnBZsz5VrpAzWgSV7biMS7hp/1lZqul?=
 =?us-ascii?Q?nPaUMkLkHbIEUf0hy2+vjhYFQHxhgVPP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5777.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CaVdLv3u9Q5CTPz9ujjwf5PNDlD2yQGfGJhzYQPa7xqpuTUCsRaNAvLrbmhV?=
 =?us-ascii?Q?H7xo4PQ5zt8raimqFIGzlM4d1K6l2x7xs+OkYAUmO6KDOzmmWYaOTQVrHJe5?=
 =?us-ascii?Q?JB3Ep/eu1O8aYKZ0aywzfDipG2CMlu+3wcXMGvm7QaT9Cir4C1JzlcXBnqiD?=
 =?us-ascii?Q?i8CE+0rkNgI4t89pLGixE8NC3IYA5U6bw71LLj22UF7CF3icNgRmg/bwPpHD?=
 =?us-ascii?Q?sRRG6yNCF2EJcC+eVchTFYtsZr/Tt9AtYsF5/YSs50n50Y4YKSziZM78XEjj?=
 =?us-ascii?Q?CEGtTVQcxUGyHEGo4o6gV0B6IYiRVfrG5BrGGqx5im8a2ITFlmTOmibdL76w?=
 =?us-ascii?Q?gUEqkF3Zi7tKUk4RvuCufM5ZCc5Wqk8aJt25d/jfuHOVQeRfMPUUQclyuFyL?=
 =?us-ascii?Q?37+ARUa95hqH6O0YIm5d/c1avao4QdGI6x3xEirMhc5ebXNIcHJHog3nvTcA?=
 =?us-ascii?Q?7Dio/ir+SJIjbLs2QQkTD0E+qlP0/XUBG7ExepvLtGIQEL8RMIQshDsF9mrt?=
 =?us-ascii?Q?5+RwloUtq+iDIs3a8icA1JupEhPQA/r2o0avTwyHL3r7eWt3sYlGW4ylvfn6?=
 =?us-ascii?Q?VEFY4q2J00CBQJm9V4CEyC+TEoyQ5X5PGvdjVnBlp7j3sU9nUqOrjU8Pfa0r?=
 =?us-ascii?Q?gQnmeKazZ8yiLaa+V8IgOVmzQwmqdEZ/f5Q8rxWwpZVvF1sc1c6dk37CqRIL?=
 =?us-ascii?Q?ThvNZ0yDi9XlN6YjeYlWiXBUyQuvIRVupGq83REQD3lQWN5hVfIIyZMIX7Lm?=
 =?us-ascii?Q?NUxSV1O8Kdx1ExMlxIDEd1sCkZaD/wI0Z167GEv3dmU4bEhJAEXCkWNt2u3E?=
 =?us-ascii?Q?KdHvq2aImvVeZW9xMbHAZlGJATKanyYlPL3H7bNVPElhBGWiaJhQs3xAFJnJ?=
 =?us-ascii?Q?defVKo5jd5fmsNM8JaDLiLHvZ4nymCnXD06S8Iup7KMklCnpZvPnpJpfgaiv?=
 =?us-ascii?Q?V+Xr8YTzVWb3sSI5Gz/vc9ttx851y+qGlQ/q5ZknseUurAUzh5rvHpta5RaY?=
 =?us-ascii?Q?wNhi/tBb/lYX85nhvaxRH2DzicLMt1KvxhhAK1n5u4AiGB3n25R6QnB1dicq?=
 =?us-ascii?Q?Q+W24qensU9owYps6Yp4MWgO2xQsenpabGXDd8SGx3pvsq3Udjdgv2KiMcYa?=
 =?us-ascii?Q?Cpmfx74SPgMFPxaW717ghVDTP7NDPT6jIFn/wH80s/yMkcBWXFcauEmz3VGN?=
 =?us-ascii?Q?nF4B5Cc73YS7XXyivhpegBhtD8NdMKQ8ng/5fOBOD4bA30hvl+1W4fkrHyld?=
 =?us-ascii?Q?G7rsof4jL3pyIkEA4s1jDqh8oe+JUANjwsS4l85AiAqsjgL3trA2NG44eP6U?=
 =?us-ascii?Q?itLOlKWA7YDO8RybyphT47ovp/tDKw5heEZNFU7zZly02Anb994GVQxjvYJe?=
 =?us-ascii?Q?/a3useuLhQsh5EFRo1HmEo378EsnYfZ+xQtlpvPfDveUSjQClKJoMCYw2sh2?=
 =?us-ascii?Q?BTbdqeihz5o0giuBTeh5a/DmLes8WHGUNvjH6bHKAihJWIpUXk4DCEwclVkg?=
 =?us-ascii?Q?p+ive+V/nqtBzJ9BbkKOaiu6EkIEuEEAycxXs3GEc0dxVwBN1xD34l6ZuAgN?=
 =?us-ascii?Q?yjWFjY8um1IEk048Iq26pHFLTGyj162YJR9+4JxkPt9gXBuLascnkHx7OxDj?=
 =?us-ascii?Q?bxctdkbFCwwckOOIQdnJ/RzlivaPWEzuoG2XS3oFrRYvXWAo6aibXwW/njAL?=
 =?us-ascii?Q?ylkIY69WRFbbsyODdVHIaz2/MfDeZ5Dz+hZtRs6zHUsIQoyFN9+o+p6pcEV8?=
 =?us-ascii?Q?tgfqG5gkww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: aeRghMBZ+n6Dx2E8yHTU6MZrPNDL3VoNfWzYukrfryWuAjatZwuzndXGYWb+estmOviANohRZTDRKfZrycjv5uyKpIY7atmTjCqT/ngp//kSkX+OHGY3rPreVXrnh01UC7dPDj3VdR9L5DkPFxFgd+yN+umZHlmqVyLl/UBLKSVpWw/fuWfDdnFLFiOIbFRANWVZhkDQJJ268cgwmASifuamCiSO6X8w7a2G+dA0Jgv4NfDh1CiaSNZCOidHevCWZ9AI8gl9fuavCIm+LD4+XyA6l4TcfV0tVh+1blrLOGhI7K0FZl+wyetBe2vGEDbND6NFiexjauDdj6dAS4z+p5+BEV8Gbp1485xuuyBX8v3p/ef+wJ6kwy+lp/K1KdNN5VnKRfL+IFoSLierHWuaCYOhcy2DqlpC+qHATsx17hkD8ZYAtMMs5++eW4hdGjhSCQOLjmuzZOf4htNHIajxPak9qT1ZQrY3px5lP8Jh5HqyrXYp2G/83zxFgTvO7c0yDGY547scOUKeYFbxe6FINnakBsSKGwzNOfRRhZAc0XHuy8oIAKz/E7iLZ0KBxQrl0Zu1gXOF+ro8NKCEflonUQGZRyS3XXO0sby97DWxyiQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4dc086-e3f2-43f4-ce8d-08de4fb4f8f1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 19:26:22.3565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ifp6Oel62JThsvE1FiPCeFyU/R8wc85ULF6jSor54HZjacEZcaSAS7UWEBmzsMUb2Usif0anmhMl6yYud6SQaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5716
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_05,2026-01-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601090150
X-Proofpoint-GUID: 39LIhfBxp0moDajVl-BhqKrSOjbPNJIq
X-Authority-Analysis: v=2.4 cv=c42mgB9l c=1 sm=1 tr=0 ts=69615665 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117
 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z4Rwk6OoAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=Zg2C7qS5fK5O5tQBKdcA:9
 a=CjuIK1q_8ugA:10 a=HkZW87K1Qel5hWWM3VKY:22 cc=ntf awl=host:13654
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDE1MCBTYWx0ZWRfX9aDDDDIy4AwC
 MkuxWRYDz0YrA67mMUZj1LTb0d1ZSqeP8jHiwCXIfLxr8WaJ2hpVb86MHbIvID0aip6akMNdxIX
 dZG73k/bPaXzPaf1ZBvfXF3pF6EAaFSQGR96fnIaldIB/doa3yHAvlCCxK0SZCn9j/Fu9NPz5hC
 gQwUGyA6zoEDUGq6CSQSsujdqQQZBuuoEQvsR/UkCZ3Mx95nBYxnnJc5wxl1im7S7umBCzddpCk
 aIzO6XNiqvX8WTYTJ+Sie7YA1NGcc7OxNdj+BJTHzEXCPA+DIxTLMhU8AMZv5B2QNIAxrZb+upT
 TKYV17RcppTDOwrCzOPygKXCRh/0hLUMkXLLJ5Zk8umxXH1dwU3zvw3zem7u/R9D5FXpkMSP+ex
 M9q8uUVO5KYLwqIfPfs3xi9P3G6a0KHtVxnTCOQhplv/2kfOzFz0UZi7V0nn7EIS9a1GhoJEWxX
 fjoKoBelDecF7L/Po3ntwCSkbXEddyOlLJBDSp3E=
X-Proofpoint-ORIG-GUID: 39LIhfBxp0moDajVl-BhqKrSOjbPNJIq
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

* Andrew Morton <akpm@linux-foundation.org> [260109 14:23]:
> On Fri, 9 Jan 2026 10:43:06 -0800 Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > On Fri, Jan 09, 2026 at 10:37:41AM -0800, Andrew Morton wrote:
> > > On Fri, 9 Jan 2026 14:19:16 +0100 "David Hildenbrand (Red Hat)" <david@kernel.org> wrote:
> > > 
> > > > I'm not CCed on the other patches in the series or the cover letter, so 
> > > > I don't see the context.
> > > 
> > > Both linux-mm and I received a random subset of this series.  Something
> > > went wrong.
> > 
> > Apologies for the list workflow issues. Here is the link to the entire
> > series [1].
> 
> Cool.  It might be best to spray it all out again, after any IT issues
> are fixed.
> 
> > For future reference, when we submit core MM patches in a series, should
> > we CC linux-mm plus MM maintainers on all patches in the series, even
> > those that do not touch core MM?
> 
> I think that's best.  I personally don't like seeing just a subset,
> although it's trivial to go find the rest on the list.  I've heard
> others state that preference, I don't know where the consensus lies.

If you include the cover letter to everyone, then b4 can get the full
set with minimal effort.  It's probably worth telling people the overall
goal, if any of the patches are going to them.
