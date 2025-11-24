Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF6AC827FB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 22:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3A810E260;
	Mon, 24 Nov 2025 21:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NuQVuxUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B7410E260;
 Mon, 24 Nov 2025 21:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764019082; x=1795555082;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=acgKfOSHaUJ/ML9NpkY1dUVDfmyM1HgM6qI8Vwpi0tQ=;
 b=NuQVuxUevTjADDaUxaY3KiHLPzRmE72QyuaiRyfNS2ycFM5CYU6/ekEa
 4aygX2w/Fbylusx9HMzRkwY30sxPHxOCQpIfyCPVAJxkATPprBLfZxbKi
 Q5d7IUttmZQDrBxolt/IfxIYOKKh59hoRm6yPWKwYbZpwRJlGmbwbxXAx
 1HdZiJw92BJw3ARed5NMCI/uMMYYe+5uEkef0o8T56pOMArN3DjQG96eY
 OFDnImCyu/INXBG+IW9xJdtoxRzge6MCWKsFxDvAvlPQbN/IlOZXdT+8p
 lQf0wcwKMdUYXHVm92JM4HEATkC1sC2+eGfOP/jhSFL/YeTZHaPLzQoJh Q==;
X-CSE-ConnectionGUID: aX1oWjFMRlSBhhG7jyN0/Q==
X-CSE-MsgGUID: You2zduTQuaR7OuODxMvrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66192004"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="66192004"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:17:49 -0800
X-CSE-ConnectionGUID: EAKQn6ENSJ6ZTD5bd5NINA==
X-CSE-MsgGUID: h+GQIE8NS5KYKWj6/T1AVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="229721920"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:17:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 13:17:48 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 13:17:48 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 13:17:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ai472PDTnYoOapmbKiNRvtGTGF9g0Mh4DZ42deahcDeYKRHKrmhryQHn4L51O7+4+9sPifx3Bk9IAzrF16uTcSXLdmPvT7M453SCm1L2xNFjeQ+M/ZzCaec99LHgNSXua/pVdOWJDZTeph43cPbhuY/pgS58khTgfZ6lXgi7dy9IHO+Hk3Za44zD6iYNjElRQIgT1tFRS04djud1aYNgT7/8eAdkRKOxHeUkZ9Jv0iqQsYBhdPa8y6Oh+tMbmB71Xnqa08eyc/FDY7a255SF7zgF6HgNngPBrXCTnMkBIlYqKAdVGof/BTTRKLAnPjrPLIfmKTaDa08ynMezvts1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6g6//2POfdHEiSP4VRKnLrBdJWOoovIbFTuh0QaxjF8=;
 b=LPQ5y43TxpUQBj0j3ZlKHq24peLFZsp6m2VER0BAjkXnS0A+cOJTBA1SVzUIYmH/Wj2ApFYkwDaeKD3hNKZ4dSIxARNCpQNtsAbtutzPeOBLmuyMfhdMxFfrgjLdrLN9JfAsxm+aRzok+mYTlkNBDY3Az0Nm0mFAHahOfL2MAlphdnYvReFTU9wgKwOYthONzuOoUtzdg1Y4dmiWJ+nb7TDvFVgkHf06X8zYfNJjsHA9Z8tDQDtx7dW2sNsrYdGrZ3XwIov+mg63G+VBTZbYHYn+ZIlASzsSJySZpRz+9wI4y18wXy8kUA6/VtYn/R9odYieqrjlCCW88sq7zMe8qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB5814.namprd11.prod.outlook.com (2603:10b6:a03:423::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 21:17:40 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 21:17:40 +0000
Date: Mon, 24 Nov 2025 22:17:36 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v5 25/28] drm/xe/pci: Introduce a helper to allow VF
 access to PF xe_device
Message-ID: <l43rg6fo4dwptioknyp75ml3dayobquk74wbxoqm6f5td2wzu4@57obqt4dmgbx>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
 <20251111010439.347045-26-michal.winiarski@intel.com>
 <582e26ce-4579-4c90-9fab-40f705e89cc9@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <582e26ce-4579-4c90-9fab-40f705e89cc9@intel.com>
X-ClientProxiedBy: VI1PR07CA0217.eurprd07.prod.outlook.com
 (2603:10a6:802:58::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 67018742-a991-4369-6f94-08de2b9ee67e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGlSb2YyVFZjSFRtR3hjQnNoVlNMRlRSVXJjU3liRm1IMmF3LzNoMlVIQklC?=
 =?utf-8?B?V25TeXBQOFRKcFlQU2JLYjlGSlpKcDFkWUFUbDE2SkM0Yy83UmVxZVZ6NTdp?=
 =?utf-8?B?TmlXZGpxMFRyZ3hzR1M2R3dyblVuUnlqTm9XSlk2UTJ0dktieGZnSWZKbVE0?=
 =?utf-8?B?eStxOHJVWVVOQTBxeHpZSDhjVlpPSEJ3Um5hS0djalpGUFpONDljVlRvR2cw?=
 =?utf-8?B?cUNpNGhwN3ptSkhPUDZoajlxVC9iSVRkaXZ6N3lIejRHYkJGS01saDkzYXIy?=
 =?utf-8?B?WnN4am1uU01sRDFHdEQ0ek5odnpCS3NXS0NzTW5nVXJrRDJabWxtVFBtbHYv?=
 =?utf-8?B?aDIyUlpzdUg1QWxHOFN6ZkU4cUFJTDhwNlRnUSs0K0YxRVRzNW9KT0krMWJh?=
 =?utf-8?B?YTBPWGdQUlFEcFRBNEw3WnZ0K09ya2tXaE1neE5vMWh0cjdhaWRvLzR0VGNw?=
 =?utf-8?B?aTRLMEc2M2dub0NUQnVxZnRPMjMrUEN3VzhCUFR1ekUxUjVENlJaMS9EU0ZL?=
 =?utf-8?B?OXVHNFlsQmM0WEJYTDdueDk3R2F1TEoxc1JaVmhsdXlSN3J1WU9PMW11bVNN?=
 =?utf-8?B?cXN2RFBpczZ0bmphQzYyY2pERm50OUxUNkMwdzJUM3BMUSszdXR5b2lQNmYw?=
 =?utf-8?B?bkZBeEhIK00xMFJqOWQ0aXBrUEhVVzkreW9HbXlZa3lRaldKSGVKd2NtQ050?=
 =?utf-8?B?RXFKeXA1S3M2aEtiZ1BQUUtOb2U5Mis2bTVhT0puSFhsbTcyQzJ3N3FPNlNK?=
 =?utf-8?B?MGVOcE9QTmxRQ2NoT2lmbk4zT1JyM001TnlHbE9DMU5CYTJKOU1FYWovcFdE?=
 =?utf-8?B?Q0hTM2wybU5KbklLM2RpQ2k3UFlFcnJmWjlFSGY2TWxhVXFvWW1XZzRMK2FQ?=
 =?utf-8?B?UGtDYUdDNmJhVkJkWUEvcWdvSTh5ZE1qemlESmJ6Y3FVbURoUWRRQ0FDNHAz?=
 =?utf-8?B?TFpEOVBVc1hzM25QVTNrMlNoMTNLNzd4THZFTE5RdjN4RmVUZ21zV0NVTGVT?=
 =?utf-8?B?cGd6NGR5Mk1QdFY4dVBqd2FicUVDQkcxbWFwL1NkV0NEMzJvS3hYbXF2cERy?=
 =?utf-8?B?dTBIK3BuaGMxVzB1U2tUcHdsbU1QVmtqdk56ZEVTMkN2TjhMOW1hVVRGTU0v?=
 =?utf-8?B?cHp1bmNsN1NYUVdhS2dBRExxL0pMRkJzVThKR1hEY01DN2ZpV1RxQ2Ruc3dF?=
 =?utf-8?B?b0tZdkMyRmtpejZ0RFZJU3NPTTA5YWtqQkhlV1dNQWtlcTNLN1M3NHVFN2Fh?=
 =?utf-8?B?MU5BVW1QdVZNYUI0SmtXYW1QQWFTbnBzUG9MRFh3cnZDTldnL2ZEaStNaFNy?=
 =?utf-8?B?WVRmOXdlQ0FLZW1WUWttU3V2eklPTnhsSVdKOEE0RFFmNlBjSSs3R0czbFZO?=
 =?utf-8?B?Q2xBdGg2bW0xQk1iMzEwdWdiM0p6RHdHSndVNjM1WjhkTk9BNjVBYVcyT0x4?=
 =?utf-8?B?VmtLbk1ic3YvSTRYaFVEK0o3c0ZVbmFWdkZCTG4rVFNtUC9LS0QwZTFKOGtU?=
 =?utf-8?B?SzZveGhjaHJML2hodXpHZm0zNS9NWGtzTWFlVXp2K3BTV1l4NVU3L2o1b0Rh?=
 =?utf-8?B?OVYvc014QXlrWkZCM09nU3B2ZzVTQW5MRkRDZDByNzZTMDd0bXZIbTFQOE55?=
 =?utf-8?B?RktBZFJxMWRTYlpJMUF4YzVLTVBudThLL0Q5b0g3TjR5OU1MRTlHUktCSnND?=
 =?utf-8?B?RUp4R3U4RHBCaTl1T1gzK0duN3ViQ0FMbm5GZ1pkZEdRZGZqbWl6aXZYZW0w?=
 =?utf-8?B?Q2hlVU83Z0svUHV2QzE3N05WeEZxSlFJRWtFcGRSdzN4MHU2Y05wWnNIamZC?=
 =?utf-8?B?dmVaaEx2L241RnhYNG1JWmY4Z2xFRjdLb2piS2orNzJTOCtSTitKeUNqcjVY?=
 =?utf-8?B?QU04aTBuempxWjNPaFdBMmFXWEFsS093eGlvOGtlc1dxQ0Z1QWVIQ3JDZFZ2?=
 =?utf-8?Q?bHQL1FYH+W5fQTxT+zgBkUJyTDLiSA2x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE92Rk9NaTNiM1E5b3RGeTk1WmpTZk13bHVYRXk5Y1J0QndiZ3dyWkJUcFBS?=
 =?utf-8?B?TFlhalAxY2RTS2tMa2VUaGZXbUZ5b3Q1WlNnWC9BV3h0em9HNUc2OEg5NlFJ?=
 =?utf-8?B?SVFmY0RQazJ5aFJmMENyNkw1Tmh6L1FodXo2VWlHcFY1NDAyd1d2RVdPYzAx?=
 =?utf-8?B?NlRRUHhhYXJ2a0xtcXNoMDRObnM5a21PVExOazZpSTlKd2NwbGllSDFDYlBK?=
 =?utf-8?B?WEtHUkNPdjkxdWZ1TXVPZk1SUGx0OHFiZk14UGRJZnFzVVBHQTNXTlYzZWZO?=
 =?utf-8?B?NitPOTNtS3JNYjdjNjljM3ZrN3hNN2xONGxhY1V6NG1zcW9JVTFHc0xRbmZa?=
 =?utf-8?B?dHM5cWVUZ1R6S2hiNFdVR2J1M2ZTV1I0bU1WbitvNVRWNDFMN3VqVm5hcTJH?=
 =?utf-8?B?WEdESlM4ZXFSVFIyM0E2TmVVZWVGRVk5NnZseWNRcm9ueGIwbzM0ck41OEU3?=
 =?utf-8?B?SDN6ZnBjaXkxbXJzNFJtTHEweDZURitEdFdMTUVtbUVLaFVQY3FnK1diOEVX?=
 =?utf-8?B?eXk2T3U2TXNEa2NUcGkwY1ZSaDI1eFNtK1FQcXBDb2lSamZIbG9LSnZ4OU5n?=
 =?utf-8?B?VWc0QUE4Zmg5dGorMDRDN3hTT01RUkF2YmRUVVhGekdJelcrcm1xRWtzRHFv?=
 =?utf-8?B?Z0xvZGF1V1ZhNkIvV21tR1NoQXlOWjA0UjZmLzcwWVlOKzJqUkkwTW1QSWZn?=
 =?utf-8?B?ZXhPVkRwT2taakdPN09tcVF4Q1IxUUZvWGRyRms2K2NDUDNFMVA0Q3I3Slpl?=
 =?utf-8?B?bmRXeWttelkwRU0rRzBRVmZvYzkwRVBUM2hCN1cxbWZXY3NGY1VxendETW9O?=
 =?utf-8?B?T0x0M3ErblpDalJBUFpGSXlDYTlFRHlCTElqZWs2SVVBVGliNFhSN2U1V0hp?=
 =?utf-8?B?NHBDa3E5Mk04ZTc0d3lJMERRcytDcXp1VHBmNjdTSStDdGl5cjh5UjlhY09h?=
 =?utf-8?B?ZjZwdFFsU2ZJU3k1V0l3NHlzY2RUWHhOR0FuMWVHTERBU0xhbzdJTVVucXZR?=
 =?utf-8?B?WUpJSXJEYUlPQVppc0FGczlKeXBOeDRkVENUaVVOUTMzOHlsaXdlVWhGS29K?=
 =?utf-8?B?WXh1MGJ3OUFUZnBKOG1PRXZFNXlnMFpQV0hBNlBwRHo1L2V1QWlGdzVBQmtD?=
 =?utf-8?B?eHlLVDMwbktpZHFXT0FONG5yR0Z0WGdvNHZJUUVIZitqVHdTM2YxeDBhUG9Q?=
 =?utf-8?B?eXdmV0kwNHdvTmtuK2ZoNndFSzdncWJxbkRncUU4aFJISm5BL09oSG5tUXVF?=
 =?utf-8?B?Q08xK3VXVUVuajNqSzJ4VGhVSEJoNnRDeHk3QmRKT2FMNCs0Mm1HNDB6UWEz?=
 =?utf-8?B?UkNBTXBIbjVIeWZQbGVyRHROVlpIajdHWC9LWkVFSHdsbFlwdGE5VCt0UXZY?=
 =?utf-8?B?b0s5VmhOcVM4ZzlvaEcyOGRmOFQ0S1ZZOVJUdWdQUzI3dXRHZTdGd3Y2cktx?=
 =?utf-8?B?N0VDV1VxaU5tcUFCa3lHd1NVdGNJVFhZazNGWjgwYzZIcE54RUVpZlhVOEQ5?=
 =?utf-8?B?eUxHU2xFNmVYTUJ3a1U0Qkphc2JTeEVkUXc1Zlh5NzhPcS9Pby8ybUNIaXhQ?=
 =?utf-8?B?MmFnV2J2dWFsZlhoMXBGdHFPV1IrQi9KMXQ3VTFreCtQWS9raDkrRjdtVTBP?=
 =?utf-8?B?TkpZeWttTFhBaWNodWE4OW05aml3YjJEWFhjWDFCYmw1WjRaV0t3WVpmNk95?=
 =?utf-8?B?cmRpRU1wZVptcndqN1p3Mll4VmQ2V1FQdnZpTy8wSVo1V3dGbENtYzBtRDFk?=
 =?utf-8?B?RFJzVmtUbm1IKzVIekFtZFk5MFNsVjBIREJVUk9kbnUrb3lZZTcwS1pyNi82?=
 =?utf-8?B?NC9DY0xrQlcyTDlUZ0gybHdQY1JIZ2NxNWkwOVBna0czVHVPeml5OXJlM2RJ?=
 =?utf-8?B?MWExa2JYaHdoZXpieUxWUDhuem8yb0JnVSt0Ukw3V3R6TzVlUHJmc3hJN0J6?=
 =?utf-8?B?NmFnc2FmdW4yZXBkOHJHZjBzUkduSkZBeGhMb1k0MHd4bi9CdHcydklBM05n?=
 =?utf-8?B?eXJ2T2ZmbGZ1eWhkV05mcFBiZXRpTklVNjlrTWFGaXo2M29pVGtNZW82K2pk?=
 =?utf-8?B?UjZScm5RQUs0dnBBRWRmM1FEYXJqN1J2a3VKT2JyelZUUk5RbHpQeDIvZ1dq?=
 =?utf-8?B?SG9oalJsMjVaVEc0NXZ6OEcvMXZ0VUl1b0hsYlExa0hrY1ZJQXJuOFJOK2lC?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67018742-a991-4369-6f94-08de2b9ee67e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 21:17:40.6928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udhOvoZL1o/3pQyrB00yyJrGKOBZPuWYdZLRj2CrAef7yqlO8gNjc0ZgR4I4JbjSSY9iMdLkrFZMNfU+UT8Ny20YaJVikU53RyP522211r4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5814
X-OriginatorOrg: intel.com
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

On Sat, Nov 22, 2025 at 07:38:38PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 11/11/2025 2:04 AM, Michał Winiarski wrote:
> > In certain scenarios (such as VF migration), VF driver needs to interact
> > with PF driver.
> > Add a helper to allow VF driver access to PF xe_device.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c | 17 +++++++++++++++++
> >  drivers/gpu/drm/xe/xe_pci.h |  3 +++
> >  2 files changed, 20 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index cd03b4b3ebdbd..5107a21679503 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -1224,6 +1224,23 @@ static struct pci_driver xe_pci_driver = {
> >  #endif
> >  };
> >  
> > +/**
> > + * xe_pci_get_pf() - Get PF &xe_device.
> 
> nit: xe_pci_to_pf_device() ?
> 
> as "get" is usually used in simple 'getter' functions
> while here we perform extra checks

Ok.

> 
> > + * @pdev: the VF &pci_dev device
> > + *
> > + * Return: pointer to PF &xe_device, NULL otherwise.
> > + */
> > +struct xe_device *xe_pci_get_pf(struct pci_dev *pdev)
> > +{
> > +	struct drm_device *drm;
> > +
> > +	drm = pci_iov_get_pf_drvdata(pdev, &xe_pci_driver);
> > +	if (IS_ERR(drm))
> > +		return NULL;
> > +
> > +	return to_xe_device(drm);
> > +}
> > +
> >  int xe_register_pci_driver(void)
> >  {
> >  	return pci_register_driver(&xe_pci_driver);
> > diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
> > index 611c1209b14cc..e97800d5c9dc3 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.h
> > +++ b/drivers/gpu/drm/xe/xe_pci.h
> > @@ -6,6 +6,9 @@
> >  #ifndef _XE_PCI_H_
> >  #define _XE_PCI_H_
> >  
> > +struct pci_dev;
> > +
> > +struct xe_device *xe_pci_get_pf(struct pci_dev *pdev);
> 
> nit: since this is just a helper, move its declaration below core
> functions register/unregister 

Sure.

> 
> >  int xe_register_pci_driver(void);
> >  void xe_unregister_pci_driver(void);
> >  
> 
> just nits, so
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 

Thanks,
-Michał
