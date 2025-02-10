Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DFBA2F851
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FFC10E5F8;
	Mon, 10 Feb 2025 19:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ASiKZ9YS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F0B10E382;
 Mon, 10 Feb 2025 19:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739214858; x=1770750858;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OVK+H0uHqbyVodfQ/XuA0Eal3aQdFmyFj8peL/uZwrE=;
 b=ASiKZ9YSYn0CabSCJ3aBqqd/WMZo1ZR3SZW3kIkGyWcfoFGU+Zk39sBe
 V6XQTxRzOMzG72HIsquX0/qmqsOqnJHavmZpY4NiclEDgjGtKWNhKaqsm
 4bCM1QI1neifYWL3tcXNFaO3p1OALRJ11tFOmcWwVZnJrc3Jbw+8yJ56O
 tQAhmzkkyz3+Co6BrFHjHjJztxxbsAOF+Li8tmStpL3iPxDfzKJjouOXC
 tUuRT1DUZOeVIhctp3BzDzb1qF6rA5/uMuyBcRU8yWBXugB+hGINKspCO
 N+oW7zAljhTyGHPdBgn1KH7Ts5G5RZUiFcotwSUUnNfVl5vk3hhqedQAZ w==;
X-CSE-ConnectionGUID: q9uFn+RiSrWY+wsHq0F/WA==
X-CSE-MsgGUID: zPB10ovVSDyew4cbl1SBcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39927061"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39927061"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 11:14:17 -0800
X-CSE-ConnectionGUID: fdwSRc7kQoWyp3FAS/zxQQ==
X-CSE-MsgGUID: 4ATPklz9T2qnE2SBKpfQ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="117300139"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 11:14:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 11:14:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 11:14:15 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 11:14:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHszp/OQ+qSyg4/fKQSKmWEonMmOZXpHarbwuaHbi8EbB5sr7NgFu20JXGwRbfyCRhxDz3ndHeOfjo5rRvGzaFkGeEJKWzD3mBzK5SsbDJsqBRc35/zqmNX6PL0DoERdmwVTT0saRjk3iNeNLNjUdV7QBoXb8osnpsXkYmNDUGg4/1N9KsYf9t2SJ3hO3N/Az46yEqVM/3lC1MeXx46wguYHdfFu0PMjxQK3Yjb39GjDEzXi35f/1rguvu/i2p/5w8OuMmDINjjljLeziHze0ajobESUY9S8yr0DhVREJBR1dAMxfPlF9Wp5jUpI6+W4Xr3BwctcdxgumXFoLdPXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOQGYVjwaFAGyae4scEsZY9m9ltQe8hzq9Dm1si1Gk0=;
 b=WrVzMo4iHFyaX5vw5sARdVbn8vBfs1Ssn2qTDu6bJmyWLQ6jetHOy1QTxkgtMZJj+BvXnN+A+UZLRAwUbbytSvh3YU33U9Ru+2ZV7BNFXvaOtfT+5I+9/IhIolAipLws44E2GxrCruDr4mQkSKq0JM4JUcrGFXY1GfCRXGeKXslV2vBPYjmCwnYKbLN3JYawWZdIPKs3JXcpW3vzxOSqiHHH3Aix+7M1nRVNYe2Dzh2pQ2ZbuFWWnPk9UxV5OnMRTdJ0RpLYhnMnUNbh/qPSBnOlLDb18xT25XfjrqfO37/GCp1ZbYFG0pxPK3EusVOkx9ofNyNNGDN0NXVEiCrdZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4943.namprd11.prod.outlook.com (2603:10b6:a03:2ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 19:14:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 19:14:12 +0000
Date: Mon, 10 Feb 2025 11:15:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "apopple@nvidia.com" <apopple@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>,
 "felix.kuehling@amd.com" <felix.kuehling@amd.com>, "dakr@kernel.org"
 <dakr@kernel.org>
Subject: Re: [PATCH v4 19/33] drm/xe/uapi: Add
 DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
Message-ID: <Z6pQP/D4ccdR4RVD@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-20-matthew.brost@intel.com>
 <59bb51deb61f3fbc54656b189fa2aef1de9806da.camel@linux.intel.com>
 <SJ1PR11MB620444FAF69535A6993ED48081F12@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ1PR11MB620444FAF69535A6993ED48081F12@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0319.namprd04.prod.outlook.com
 (2603:10b6:303:82::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4943:EE_
X-MS-Office365-Filtering-Correlation-Id: 9239c1e5-3838-47df-eeb2-08dd4a071a5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RW9hd2JnZ2V0RnBTUTIrMTk0MlArdUlrcDREUXZVeWVtK0pRamI0eGJ5TUlj?=
 =?utf-8?B?cVRRKzV6UUUrM1JYUW0xZUtKOTltdnlxei85VVFrVitlQkhod2dCbmhZeXI2?=
 =?utf-8?B?M0g3aXl4Q2crUVpIbHN2NTlkaE9YS2JNVU8vTk9kc3p0NkpYbno2UTRkTEJW?=
 =?utf-8?B?SWY1QmVjbnNSbkxtYXdZbGVqYlNBWS9Xc1ZFNFJIOFBTZjd2T3B4eUdzVFNs?=
 =?utf-8?B?TmRUYVZ6RG44VDU5d05vMUpCWEZmTzc1dW5Hc2REM0dyd0hlVEh4UnUvdmxP?=
 =?utf-8?B?TXFlQzNQZUM0VEVQWWdJNDdxZ0F1TTFqdFloTzZiTTAwZW4vVGFtWjRyYzFq?=
 =?utf-8?B?S1NSbnV5L2JNNy9RUFU2Q2lkMUN4WkFtYWpybDBRSEErV2ZWR1hPK1F1NXln?=
 =?utf-8?B?NzBxZWxUUVZ4WWU2UWhFU1czWDgyM2hyWkQ5NXNpY25TSmwzaUlMemd1bkMz?=
 =?utf-8?B?cWcrb0JUOHE2cGJhWnRtd3V4TDVCU0ZkRlovZkJydHFJVjc2aElxNnlid00z?=
 =?utf-8?B?OWlBcjg2NkJIZkUvdjlsaDBYM1V5R3VEdVltdnRiZ254UFp4eURvQlZJcXJy?=
 =?utf-8?B?VzA4eEU5dy9mRkNkVTJLckNwSlM3bmY4RzY1WGF1YXIrVzkycGxIUGV3T3c0?=
 =?utf-8?B?dTBvZmRYdzdEekNMQVVMb3RONTJ0VnJhUzJtNk5SeU1aaHcxSEtkMXJjbXRJ?=
 =?utf-8?B?bUNXK0NnV3JWd3c5TmJoMGN2cUk5YXhaRis5WjljY1pzRGVlaXhCUmsrN0ll?=
 =?utf-8?B?U0hnWE1ZUWh0UWhwc1gxczk5YTVybnNwb3RBdGdVL1g1WEJ5L1g1Z25keGRs?=
 =?utf-8?B?Ty8wZWNjKzQzV1VGbi9qL0JUVndLTzk4aVBuOVJ0SGhzODNlOVU1TkVRTWhi?=
 =?utf-8?B?ZzRXczE1RmdmMWpNck8xdDVTa2t0NzJRVWg0YTFWZHhsaVpHTndtQzhOdFQ2?=
 =?utf-8?B?SGFZUUQybWFNcUR4b3lhTEE4bEc4VWlwQm1GYXNkRHpCRGU5V0RWQ1VCL1ho?=
 =?utf-8?B?WXh5RCtkY2dadmVCWTFLcVZ0TGlXd3BsWXdpb1hyTXMxeXUzZVNoUFBuQ1Jl?=
 =?utf-8?B?Q0NMdHYxK1V5T2pITkpPVmFCTUVXR0hDUnZ6SXQ0TksvQkVDV2FLaGNHUTZP?=
 =?utf-8?B?TGhzRzY1OFJqUWcwZ254bmF0RTdtdU1PMlVWeERCQ2pNUEgvaUFseStYVzFm?=
 =?utf-8?B?aitFS1Q3OU5DL0dvUDBrMXFrUzFvNjV2aXJ6YlpOb0xrS0FrZ0VZMFl4Vyt3?=
 =?utf-8?B?Q2JLSDZUVy9LK2NvQVNVSGVIQzRXL3gxelJwTXl5cHFhLzZlTEM0QzYremJF?=
 =?utf-8?B?L1dCVnpWM1JOdUIvUTJsRXpNa0U0WGJ4ay9XdnRuM1FCZDcxb2hDV2FpSkFT?=
 =?utf-8?B?a1JmWWFsUzMwVlJaY2JSVkpQYkVzWEtSdXNvWXQzUUZBNXdIQ1JyL0ZMeGxY?=
 =?utf-8?B?MkVRcmkvNzg0MU9wUW5CSjZEVStnZUVWd0lSUU1HNXcydkgwZEhMVmpKbWl4?=
 =?utf-8?B?dGxPUUlPYjcrTm9BS0ZacU14OWRyR04xcE9YZnlXL0ViK2t1d1pDVUNtVEtC?=
 =?utf-8?B?eXJOalpkYUdPazdXa3NSeWF1ZmdGK0EwQ2ZuTFk5aHMyR29SVzQ1NHdYYjAy?=
 =?utf-8?B?TUVrN25XSlc0VjMrWko5cll5V2w2Ulc4Q2JtWTdoeUFBT1d5RW5oOUloUk9J?=
 =?utf-8?B?RmJ2WUY3UGo1dGhuTWczMVpINGQ4MnF1S3ptelVHK3d1OHM5bzZiRnJrUFln?=
 =?utf-8?B?UmwwRUFQb0x1VlBka2NER3prWmVldjZqZjR5aWNacG40a1BmR2lrWVpSbWR6?=
 =?utf-8?B?U1hJTFFrSVI1ZlZiYUdJdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU8wODZGK3dIcnh3WGhHMjl5aEoyS0dmRlE5NnoyalZBNExub1l1WHZlSTBK?=
 =?utf-8?B?MTU1ZWJwbTZlQnZGMHJzdlVxamZGTi81N2diaElEaXJocHIrZ0I4SVFSOXpr?=
 =?utf-8?B?MHhhY0lxTmdiVnFDa1pNa1VySkJCZ2RadTJHS2N0T0tuZG9QcEV6Q3ZSWEwx?=
 =?utf-8?B?UmJXTDI3a0tNU0xVcDNndVdlcjZTS1kwcnlabUNHdTBHMUJBWTdlbGN2cXQr?=
 =?utf-8?B?OHNpSmkvVkF1K0dwV2REM3pzVGVuRlRKTTB0YjN3aU1iQVNrQTBsd0lPK0ZN?=
 =?utf-8?B?dGJscGJ4YklScE5uZ2o3dktmZE1vRVV2anZ0M2tqUDJGQUxPZE5xc1ZSMmRE?=
 =?utf-8?B?ZTRIbGYzbTcxaitVNmpPWEZpOTAvVllDMjVTSmFtK0c0RG4zNVNTYUZnY29U?=
 =?utf-8?B?cldoR29Hcm1COGdTTGszaHMrbnE5NUlaTk5rckp6ZHZvS2l5cm1iQ2p2bXdn?=
 =?utf-8?B?WnZtNGhBcFYwdS8xMnZFczd2eHhwWG9YYnZyc3h6OTZCalJleFpEUkc1RytS?=
 =?utf-8?B?N1g3QjBWdmNpUElsK3JyWUxob2t1K1R0R01RNEhJTjRtK3ZUaEpsOXlqc1FD?=
 =?utf-8?B?amZtWjlmaVFWM2ZFdTExQnZZWVN6bklEbklsNHJhdDJpaWI4TFVFTWNhYXlE?=
 =?utf-8?B?NjlWNlhvc1Q1NmpndS9mSnZ3ZVEzdWVNTmM2TytuNFZ1SWJNM3k0WFlCbjFE?=
 =?utf-8?B?RkI4UDVDNWduTVdRZjZsUGFZUGNxQkJLQzZpVFY2eUpsNDJ4blF5ZldDUGd6?=
 =?utf-8?B?MWZrQ3RaMGlKWUVVQkl1U25VTE4zVWlsNlRkWmMweFo5L21mbHFEbitFRnhl?=
 =?utf-8?B?V0QzeGx1TmRiNFVSYWtQSXhYalg0c280cS9mMCtVNjVWV1NieUpzZHZLUnBG?=
 =?utf-8?B?R1B4YXhydnZVeFZZd25YUDcyNU5VWHk1dWZaY0dsWkVoSFBkRGRjUWRQazdF?=
 =?utf-8?B?bGRxY2VoU0hOK2JKQlhFQk91ajljT2E0enNjL2F5cDRseXhzM3RHa1NiL29X?=
 =?utf-8?B?bFlnN0lZMUNvMmkreG9zVkh2SnRrVDB3NDV4bW5pa2VoVC9XbTlOd2oybkht?=
 =?utf-8?B?SkhQakVMc2RWTXluSDZLb0FBdEdYU2RGVUorRklrZm5GUk05eW5Cd21HUnlR?=
 =?utf-8?B?MHNnd3AwanpNN0NjU05weDcyQWhzdkpaN2NEWHFOS1ozLytZQ3BsTGU5Q0dI?=
 =?utf-8?B?dFZBZkxqd3dEYmpvV24zNEc3dkp2QjB1Vnh1N1MzUEFLbm84QTZ4WjY0MDNz?=
 =?utf-8?B?Q1VyTi9JTXowVnk1V2Z5WnlGYVo3NFVNV3FZdUFIUkN1Z3E0cFBFaTFocUtE?=
 =?utf-8?B?dENTK3BIQzhGNkVEUjZrMXR2QVBPWFdnT254RkV0SVJkajRVdjIzRHNNRDZT?=
 =?utf-8?B?ZFBpajNHUWRvK2I4MldyZW5qdGVKSWJYa2V1eG5WZkE0RGxLc0xBaS9PTUU1?=
 =?utf-8?B?WUpUM1VKZmxITzIwbUtIMHBmOVJQS2NyKzJrVFZUY255TkpSNWhQQVU4NEg2?=
 =?utf-8?B?SXFpL3VYaVo5WTlRMTlPMEFvNjZSTWxJY0VGK1g0YUk2aTd1RVFUNnBMYTNX?=
 =?utf-8?B?MVZyOFdZSjhVVXBKZm1mYUc0bGhpNEk3WFpkZ2hST1hpSFpFZFdqdCtLMm9m?=
 =?utf-8?B?QVU0QVdiWnZ4MFNNTitQdlVvRnNERXh3emE3dFFtNzFvMzU0V3lOeklQUUVk?=
 =?utf-8?B?cHE3c3REb292RG1JUVdTa0lGaFJ0NzJvWnlVdElGakc0MEJYbEhudzN4cGdK?=
 =?utf-8?B?M2pLMFA5RnRzeG00VFVwcUNRcEt1Tk9QbXh5SFQzN1g1UXVidXRON1FaMkxN?=
 =?utf-8?B?NVE2aStITDM1OWN0R2UrdXEzR1ZrUjR1L1RGbHYyZDJNeGNXczhnbVpxZFgx?=
 =?utf-8?B?Vnk3RUhLRVZyc3dMbHoyNldsUnhGYlJmaHpndGsrWVNuRmx2VnZLMVBKOTc0?=
 =?utf-8?B?M2ZiMTRGbWNWSmxaMW14NGJqVnJ2Z2s3MEIxQU04T1RwY3RKT2JpS2lzYnhL?=
 =?utf-8?B?azdvVWZONXRWbkdySlRCU01ia202UXBZQlgycXB6blBBVGJKUUR5NnRrMkNa?=
 =?utf-8?B?cS9JYzhYMnc1dVpvUm9lZzZUZmhENlRyWUxpZ2VTVFQ4SzM5aHJ1aFE0RkxV?=
 =?utf-8?B?TFg3VWR2Vk1jUUZTN1Q5ZW5wdXdPSHoxSFZYM2Y0Uy81Zzd0MXFjRHdFeiti?=
 =?utf-8?B?N2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9239c1e5-3838-47df-eeb2-08dd4a071a5c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:14:12.7009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WG/SIr+/ewnDfAI9kG/vlKGYeeCOjbyDXkGTpLSyQ1TNJjjN2R/8xppn6lH8aAF292sVschknlJbpuNdYOfTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4943
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

On Fri, Feb 07, 2025 at 06:43:11AM -0700, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Thomas
> > Hellström
> > Sent: Friday, February 7, 2025 6:35 PM
> > To: Brost, Matthew <matthew.brost@intel.com>; intel-
> > xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
> > apopple@nvidia.com; airlied@gmail.com; simona.vetter@ffwll.ch;
> > felix.kuehling@amd.com; dakr@kernel.org
> > Subject: Re: [PATCH v4 19/33] drm/xe/uapi: Add
> > DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
> > 
> > On Wed, 2025-01-29 at 11:51 -0800, Matthew Brost wrote:
> > > Add the DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR device
> > query
> > > flag, which indicates whether the device supports CPU address
> > > mirroring.
> > > The
> > > intent is for UMDs to use this query to determine if a VM can be set
> > > up with CPU address mirroring. This flag is implemented by checking if
> > > the device supports GPU faults.
> > >
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > 
> > > ---
> > >  drivers/gpu/drm/xe/xe_query.c | 5 ++++-
> > >  include/uapi/drm/xe_drm.h     | 3 +++
> > >  2 files changed, 7 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_query.c
> > > b/drivers/gpu/drm/xe/xe_query.c index c059639613f7..40f56eaf98fa
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_query.c
> > > +++ b/drivers/gpu/drm/xe/xe_query.c
> > > @@ -333,8 +333,11 @@ static int query_config(struct xe_device *xe,
> > > struct drm_xe_device_query *query)
> > >  	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
> > >  		xe->info.devid | (xe->info.revid << 16);
> > >  	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
> > > -		config->info[DRM_XE_QUERY_CONFIG_FLAGS] =
> > > +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > >  			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
> > > +	if (xe->info.has_usm)
> > > +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> > > +
> > 	DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
> > > ;
> > >  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
> > >  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K
> > > : SZ_4K;
> > >  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe-
> > > >info.va_bits;
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index b86dc1b4c2fe..37e54ca6ffe9 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -393,6 +393,8 @@ struct drm_xe_query_mem_regions {
> > >   *
> > >   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM - Flag is set if the
> > > device
> > >   *      has usable VRAM
> > > + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is
> > set
> > > if the
> > > + *      device has CPU address mirroring support
> > >   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory
> > alignment
> > >   *    required by this device, typically SZ_4K or SZ_64K
> > >   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual
> > > address @@ -409,6 +411,7 @@ struct drm_xe_query_config {
> > >  #define DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
> > >  #define DRM_XE_QUERY_CONFIG_FLAGS			1
> > >  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
> > > +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR
> > 	(1
> > > << 1)
> 
> I don’t know how we handle this, but https://patchwork.freedesktop.org/patch/635834/ is getting merged soon, will conflict with (1 << 1). If its like whoever merges first then it should be ok to keep it this way and you can add my r-o-b. Or else if we should adjust now!

Thanks for the heads up.

I think whoever gets in first gets the lowest bit and fixup the later
series in the following post or at merge time.

Matt

> 
> Anyways,
> Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> 
> > >  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
> > >  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
> > >  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> 
