Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C889C6226
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 21:07:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB29610E644;
	Tue, 12 Nov 2024 20:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I2wA5IPZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8132D10E644;
 Tue, 12 Nov 2024 20:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731442056; x=1762978056;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0cunfod7Xe5yFyYxSIDjt1TEa5pTLpUKO122RwqNsIQ=;
 b=I2wA5IPZPWi4DWKNO2OsSvTdFbxIkAlSmUy37ARZBMqkoUiG9vhmd6o6
 kj6H7lsGtJiR7aWawwFRKV/Q+lby61ZcB2Uc+yIJs6GuA+RReP/9qSp4S
 OZ6V4yyv8v3FuuH/rt3bVdPvhHYVNxrU3UkE3d9FBubd3/2iBACAhF88F
 dTG76ciimVCYYUyF4mBCem414pj3kgkdj0gfazmAfcvTVuJdfda21g/NB
 xhymSxfSe90LEi12+4JkICy+pZkHveel4cNRnySj3N72L6DujXXVkxp+i
 /SCD3g5VCh5TeQu8occ3YeUu09bc/bUpw8IVQUEboOu77CneiWE6425VL g==;
X-CSE-ConnectionGUID: xg6vhr8vQkuyYT/GkPgZ+A==
X-CSE-MsgGUID: jHLUJGaqRL+KmpJ1mX2d/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31456982"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31456982"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 12:07:35 -0800
X-CSE-ConnectionGUID: 5K+o9/jORIa7DobItC6t5Q==
X-CSE-MsgGUID: u6P1RW0tTJ2X1RDyQtKqNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="88025878"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 12:07:35 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 12:07:34 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 12:07:34 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 12:07:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ve7Qw4r1EWZ1J/xB85nVY5B//dcXDYhjaqd2XQ1pHIt/EeSVYTYp0f0W5Md9nu5/nd/Yi5vQA0S+GJ0sRUPHGwOvytcpR66OHd3ift6zaWoj2ro+aCaDoei1Ulaw0wcyBP+yH2tv4hTS5u4woGLKuoMIzD5iDCjWSXwkO/+1yKP6LEoyswe6xgblX1Q0iFHEPxe3lKCmGqRddGoFajMS6w28VdmdStKRiD2L/HGLSscI5DRWqA/NGerVuSy1weDP82K545zIyrEXXxALWfK8iQ1WGzyHDa6MgW7zwFMlYWN26jhAx5HcMncolPyosP/z8hXkQTvTex1feyeT1KW99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6crD7yn5+hL9KeWoUYqaBmsoAMVl6U1fH60lIH5ceo=;
 b=L1xR6JPJuqesxT2K9PU6kFVEJfgD8itXGHt1FpLHRMyJzeNb3ToXVHFmKVzT44hdvxJU+lL77MY8Cxsqhr6hUPHKXJpW4/N0ZbHJEOU5QmZsWOGHZHqq7CvCoxj8DMUxV5s/DwJkHNO9ozgTj+DM+JspIKTQJsV7WwuEBD7R8ZthiPwMFBN6cW/1NW5VW0L7ud0GYyBAVjaee1pht59ImmSctVw2Vgt8cAkElbN8+QL5QL5q1nB0fiO0sPf3mwfiPkejW5ZHCCnQK9O2+/yijG2b0E61lti9JMdbiAq4tmO99TU5rocBl5HOvuvgnI60o8oKevYRklSp9fRde6tbaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Tue, 12 Nov
 2024 20:07:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 20:07:29 +0000
Date: Tue, 12 Nov 2024 12:08:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <simona.vetter@ffwll.ch>, <thomas.hellstrom@linux.intel.com>,
 <boris.brezillon@collabora.com>, <airlied@gmail.com>, <ltuikov89@gmail.com>,
 <dakr@kernel.org>, <christian.koenig@amd.com>, <mihail.atanassov@arm.com>,
 <steven.price@arm.com>, <shashank.sharma@amd.com>
Subject: Re: [RFC PATCH 2/6] drm/sched: Teach scheduler about
 DMA_RESV_USAGE_PREEMPT
Message-ID: <ZzO1oRTJpFWlaLXq@lstrano-desk.jf.intel.com>
References: <20241109172942.482630-1-matthew.brost@intel.com>
 <20241109172942.482630-3-matthew.brost@intel.com>
 <132fdacc1fdbca9bf05cbcbeee8727426675a55a.camel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <132fdacc1fdbca9bf05cbcbeee8727426675a55a.camel@redhat.com>
X-ClientProxiedBy: MW4PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:303:8c::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: 653fb932-c164-4aa1-6896-08dd0355a262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkFIVW04T1FpT212bGdnSjhTSTdRT0Znd0R5d1ZYb1JHamJYaFJyK0N3cHZ6?=
 =?utf-8?B?S3plYVkzZENkWTNCdjJ1SUhacWtKTWYyeERNSzhUQ1ZFU2FDVmNUMHFhMUhX?=
 =?utf-8?B?bTViWi8raWpmMmVhQmFyZzNubiszODdOM1BHQzAxSmxKNysxV0ZoeDJReWJS?=
 =?utf-8?B?Z2FzdXlVQWV2eHI2czNNK1o1SUpzWHo5NlVuVTczQk9aWTR3dnFVTVBva3Ew?=
 =?utf-8?B?c2owdGJXSzltYWsvaDlKVTdvZSs3M3FUbGxGLytvbExMMzh4bXZTZ1MyaXRm?=
 =?utf-8?B?VHM1anZhSGY4b0tWY2lpWUdNbm1XR1czZDNCQVVpa0xTaFdhcE43SFVDSW9t?=
 =?utf-8?B?Rk9nWTlMRTBBeEt0Z1hEb1lRNVUxNVA3VVppOGRtS1F3QnY0OEJiTmEzSExp?=
 =?utf-8?B?TnRaQTY5NUZYeWxIbGl1N1VSMVd3cEZ4TWJkOWgwVUtzV2dXUWJ4NnZjaVk2?=
 =?utf-8?B?WTRCVWRtbGRwbnpqdjhsZ1B2VVdmaURiRm8rR3NLMWMyaG9JbUZVYm9NVnlx?=
 =?utf-8?B?cEdwRFNWM0FPYjB2bTBqR1hDSS9tZi9ZK1BTM29zUGhTalNuWHMyclErTzZl?=
 =?utf-8?B?YklidXJ5bjBJSm45c1haMHl6eXk0UG9MdnRTbjVXMnFFTUx5Zmc5UHBmNmdQ?=
 =?utf-8?B?L1owUDlPakRpSmd3WStwUlRjTWM2WTNxams1QW4xa1hORHdiZk8weER4Zkhh?=
 =?utf-8?B?S09BQk1hWmI4ZzlPTzVNWnkrV2FHK2htMXBGR3hNd0dWYWJuTTlLeHNCY1My?=
 =?utf-8?B?U1NaMmZuMThudlFWQnpscGR4OEFselM5Tkx2UE5DZldFRU5iVmx6bVZXL3cy?=
 =?utf-8?B?Q0hRTFN3U01iWWpsWjJsc1R5WWs3dkMxM2FRMUN0S3d2dUFIUFZaN252d3Q1?=
 =?utf-8?B?YnBublYvN3ltOVdMRnJRSkUzRkNXTE15cC9qUFpRNEt4K2w2N05nenhoeG5i?=
 =?utf-8?B?YWEzQVUxaEdVMi9Vb2xuY2NCZ1JjYWdIZFY0Rm4zZUlBMlc5emhpWVp3R3JM?=
 =?utf-8?B?cnZVSWlwL1o3bmxUOTE0RFRyeGIxSjFtbGg3djJENGZ1cUVWd3d1aFU1cmVn?=
 =?utf-8?B?WVR5K0VVOUU2K3hKN0RWQ2piQjVrYmF2bHV0am9HQXZ1dWhoTmg3dFV4RTky?=
 =?utf-8?B?aHcvdThHWW8yWmpib2hHUjljSXdHbG13Yk8xMkpDeWw4RmRpYVJJRDNrT2dZ?=
 =?utf-8?B?ZlNxalRaTk9JK1VOUDdOY094VmpBZDFWbXdhK1VRNEdBNWpZSXA5MURrTi9L?=
 =?utf-8?B?SjJIZGhiRCtSaWZTUitJOXdTaWliTDZHTWQyR1hHSTFONHU3Z1NuWlppSnNE?=
 =?utf-8?B?SCtFU1VUYzkzQkx2NlhpRjhVVWI3Y2l1dFRtMHZNUTBoTnMwNVltTW5UeFY4?=
 =?utf-8?B?bDdRbkgwY3YwNFNoNmJKWUNLVnZXOWJEYVd5bFp1MlVJRndBY2VYdG04Ynpi?=
 =?utf-8?B?Uk9La2oxYXkySWJJem1ZZDd0SUdQQlNyVm9oT3FzbFBYZ2lCdkxZSlRHRkQz?=
 =?utf-8?B?STNLa25hakRIYXIwZ3NLVlBaK2M3b0ExZWExN09HOVh2NnR0N1dlWmN6WlVm?=
 =?utf-8?B?M3JUVjVXeE4zQVFIKzlsdkNsVjQxRnJKZnJyL2pzOHhhWFBMUW1QTUM0cUg1?=
 =?utf-8?B?S21CTXJ4V2UxNXNZZWRKRkcxb1dLTlpGV2xySm5hQUVRenZnWVdJNUdkS1V6?=
 =?utf-8?B?emtYS0VaZHNDYzZWaEVVdjhNeFFLbXBwQ2JZbEtpNU8zUVJ4N0NjNGZsSU1w?=
 =?utf-8?Q?CT+sPRKTKwXYbkJWB2BDifNStDTUadQ5C3+4JCa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejc2b0g0YWtrdHF1SmQ1Qno4V1BiSG5uL1pXengwejBsaW1JMHRrNUNtMlBG?=
 =?utf-8?B?OE9COStoblpMengxQTNvU21ucjRnS1h3VHI1OXZNMDBjTHl4N1Voc0RuUG41?=
 =?utf-8?B?QTg1bHltOFFqU3puTkNKMkxVVWhzRzNHRmxTVVdkSlBLMUNCRldZZGVkT3B2?=
 =?utf-8?B?eVduWnlLUEdjajNGbEVnMEJYS3hhekYrcmdMVWp5VzdtSVhGS3dMZEl6dDRu?=
 =?utf-8?B?TDlUNElkRDhGS2tXNDJkdkYzOTBqYkR3eWFpcnpuVy85Q2RKL051K1d1Mi9P?=
 =?utf-8?B?TXFtb0k2ZHBKTWRsVEdOQ0tYTUVDSjVBS05YMHpic05NbkpJZWlPa29JeXJz?=
 =?utf-8?B?MTVZOFBQTkNTckl3SDRzRTVhY0VmYkkzZnE1ZWIyODdRNllyZGVlYVJOcW1M?=
 =?utf-8?B?clUzK3dPR1B1TXNPUFNGYUZvSVZTSmVTVTlsZmE3YjFyK0RyRGNCZlZxbEFF?=
 =?utf-8?B?ckFrZURhbFhuMDhjb3VTRXdxUXV4Z0RSMlZ0cU9jK0U0U2g2QXVjNmlrekda?=
 =?utf-8?B?WW9vR1MrZC80RjB5U3A4eUZxbTQ4NWo1N2xZY2hFL2h3cS92Wk5nSHdRd3c1?=
 =?utf-8?B?TkVtYllIaHZxWWNCR0JrYTN3S2J5WTQ1OHZwb2tLVjRqUFhFS1dnTDRtRjh4?=
 =?utf-8?B?RzZGWUVYUEIydWdDbGxySXpidGlXb3p6MVNUY1F3UEZnaG4vMU5RcVZLRTEx?=
 =?utf-8?B?amdMTmpmbFNhc1JsY0NEZ3piUkhWa2t4bmlKajZqZXI3SENSN2ViU3BacWFP?=
 =?utf-8?B?cG0rNjNCYWNJY2tsQVZQZlNEZWVnc1JIM3VqaUVkZ3pzNkEwS1ZpcVlxbDBD?=
 =?utf-8?B?MnA4OGpJOGMyM0M5d3RzMVkydjMzajhRcGJ3Z0kxaURtL3U1b3YrWUhvZkZQ?=
 =?utf-8?B?UHNNcjhpSS9RVWlQczJEZzljZGRQaDIvQm1rUHRsMHVBYjU0L2dmdWZzY0hV?=
 =?utf-8?B?WTZTbTMvdlBBM244YjhsSkNaODQ3NlJkSzhOZk5kaWM2L2Ezc2EyWkpqeXNE?=
 =?utf-8?B?T0hwYnZ6RFpOaFoza1o1M0pRa0NBT0VoUTlnZDA4VzkyOTE2RzdVZG9GUjNr?=
 =?utf-8?B?VFg4Y0tYVFFOQVZsRTNzNE1CQWhSOXJiR1NyY1ZWWHZsSzRrK1B0MUVEa1hw?=
 =?utf-8?B?MFVPTHZrUlB2WC9EaFRDc0FxYUtxM3V2Q2RmSW10WnF2OFZuNm5FeTV5SXhY?=
 =?utf-8?B?K3p3VEtvbkpoeDhocjlONW4vNzE2ODl1ZVpDUVZWcnprYkRDcHdTR0R1NHFX?=
 =?utf-8?B?ZzEyUktXN2pobUNMc3ZaazBZblQ3QVBoc0xvVXJHaWFBdTVrNTF4K3RsdVIz?=
 =?utf-8?B?YUxpQWIzb2pLZzQzN2xMWXhDd2w0OHNzM1BLV0M1a1lnR2J0NGk3cFA1Ykxa?=
 =?utf-8?B?eFpCRUZiTzBLdCtLRENwOGxwd3VIdWovRlk4Y2puK0pBRGNwWDdoVzRWZWVH?=
 =?utf-8?B?a1RsSVNNaHpqMTBDT1ZwdmlhOUdVN3VlZWZFZUxyaXNSSk9JTmFDMVo0b3FO?=
 =?utf-8?B?WGN2bWlIb3JjQUpwcTNXWEpEL1Y4OTAxelFVVXRlZFlhQnN2M2NFMFIrQWRQ?=
 =?utf-8?B?clBUQ0w2Y0drMEF4bCtlOHduTDJuanJnanc0eXp1RnpEU0llVzMwK2dGcTdh?=
 =?utf-8?B?NUJKMGF4QWhWWEl5VGF0OGZNczhMa2Z3UWJBTmlPK2RrVks3R0NyeTQ3Q1dI?=
 =?utf-8?B?YmV4eWh6aEVLZlpGNkV0cEVQQ2VtajNsMXNtSlNXVjYvMVNhNDdjTldxVDN3?=
 =?utf-8?B?Sm5DZEFhN3ZvdlNYcWlPNVIrUjJSRFlEdzllR0lFbCtaQ2tvMHk0R2FlOGtq?=
 =?utf-8?B?aVJ1TVJTd3F5QmJ4dTVQdHV6a2RoRy9JVHYweTU3eUZmc2tkNCt0V3B2UGU0?=
 =?utf-8?B?em5FNW9NNktsZWlrVUNhcmtYOUY2SjJ2QTVNdGZFYmpLTjd3RHVvZkZtVVpt?=
 =?utf-8?B?NmNvS0liSUxzUS8vY0R4MnJMY1NPcTBHbHlDcnh1Z2hTQUJZbHpSVktnMkpV?=
 =?utf-8?B?ZjFSaDhkYi94RHdQc1R2NTFnR0t4NVVqNWVPMXNtNi91Q01ENkUzbTVQbVZQ?=
 =?utf-8?B?cTlJNG01Rk90R1FtTjZOb1R0eVlxSi9NRnA1THJiTkpHR2FEenE2QkFMU2M4?=
 =?utf-8?B?NWRHYTVLY3l3YjJpZVMzcXBkcWNtWmZYRzFUZEc4MU5WL0RYYjJMRTREb1lD?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 653fb932-c164-4aa1-6896-08dd0355a262
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 20:07:28.9679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K4dyRmTrssh5ioEyO/qNb6VwLhG1bp3cL2QAw4JYDjG7v0LCSs1FPieldVpcoxLZtNzG+rK8pq2HfsE8KqX57A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6064
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

On Tue, Nov 12, 2024 at 10:06:21AM +0100, Philipp Stanner wrote:
> Hi Matt,
> 
> On Sat, 2024-11-09 at 09:29 -0800, Matthew Brost wrote:
> > Follow the semantics of DMA_RESV_USAGE_PREEMPT in the DRM scheduler
> > by
> > storing preemptive fences in a dedicated xarray, which is waited on
> > after all other fences are signaled. In addition to following these
> > semantics, pipeline preemptive fences by enabling signaling on all
> > preemptive fences before waiting on any of them.
> 
> the commit message lacks the *motivation*. Why is the current state a
> problem, why is that feature needed etc.
> 

Yes, I do this in the cover letter but this is missing here. Will add in
next rev.

> > 
> > Cc: Philipp Stanner <pstanner@redhat.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 29 ++++++++++++--
> >  drivers/gpu/drm/scheduler/sched_main.c   | 48 ++++++++++++++++------
> > --
> >  include/drm/gpu_scheduler.h              | 15 ++++++++
> >  3 files changed, 73 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > b/drivers/gpu/drm/scheduler/sched_entity.c
> > index 69bcf0e99d57..c6c4978aa65a 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -201,11 +201,13 @@ static void
> > drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> >  	struct drm_sched_job *job = container_of(cb, struct
> > drm_sched_job,
> >  						 finish_cb);
> >  	unsigned long index;
> > +	struct xarray *dependencies = &job->dependencies;
> >  
> >  	dma_fence_put(f);
> >  
> > +again:
> >  	/* Wait for all dependencies to avoid data corruptions */
> > -	xa_for_each(&job->dependencies, index, f) {
> > +	xa_for_each(dependencies, index, f) {
> >  		struct drm_sched_fence *s_fence =
> > to_drm_sched_fence(f);
> >  
> >  		if (s_fence && f == &s_fence->scheduled) {
> > @@ -223,7 +225,7 @@ static void drm_sched_entity_kill_jobs_cb(struct
> > dma_fence *f,
> >  			dma_fence_put(&s_fence->scheduled);
> >  		}
> >  
> > -		xa_erase(&job->dependencies, index);
> > +		xa_erase(dependencies, index);
> >  		if (f && !dma_fence_add_callback(f, &job->finish_cb,
> >  						
> > drm_sched_entity_kill_jobs_cb))
> >  			return;
> > @@ -231,6 +233,11 @@ static void drm_sched_entity_kill_jobs_cb(struct
> > dma_fence *f,
> >  		dma_fence_put(f);
> >  	}
> >  
> > +	if (dependencies != &job->preempt_dependencies) {
> > +		dependencies = &job->preempt_dependencies;
> > +		goto again;
> > +	}
> > +
> 
> I think this should have a comment. It can only trigger once, right? So
> I guess that's why it doesn't make sense considering making it a loop
> instead of goto upwards?
> 

Yes, can only trigger once. I personally don't mind goto while others
find them offensive.

> >  	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
> >  	schedule_work(&job->work);
> >  }
> > @@ -456,17 +463,33 @@ drm_sched_job_dependency(struct drm_sched_job
> > *job,
> >  			 struct drm_sched_entity *entity)
> >  {
> >  	struct dma_fence *f;
> > +	struct xarray *dependencies;
> > +
> > +again:
> > +	dependencies = job->resolve_preempt_dependencies ?
> > +		&job->preempt_dependencies : &job->dependencies;
> 
> I don't think it's good to use the ternary operator for such long
> statements.
> 
> if-else is more readable.
>

Sure.
 
> >  
> >  	/* We keep the fence around, so we can iterate over all
> > dependencies
> >  	 * in drm_sched_entity_kill_jobs_cb() to ensure all deps are
> > signaled
> >  	 * before killing the job.
> >  	 */
> > -	f = xa_load(&job->dependencies, job->last_dependency);
> > +	f = xa_load(dependencies, job->last_dependency);
> >  	if (f) {
> >  		job->last_dependency++;
> >  		return dma_fence_get(f);
> >  	}
> >  
> > +	/* Switch resolving preempt dependencies pipelining
> > signaling */
> 
> I don't understand this comment. I guess you want to say that this section resolves preemption dependencies for the (fence) pipeline signaling?
> 

'Switch to resolving preempt dependencies. Enabling signaling on all
preempt dependencies to pipeline the hardware preemption'

Is that better more / clear?

> > +	if (!job->resolve_preempt_dependencies) {
> > +		unsigned long index;
> > +
> > +		xa_for_each(&job->preempt_dependencies, index, f)
> > +			dma_fence_enable_sw_signaling(f);
> > +
> > +		job->resolve_preempt_dependencies = true;
> 
> Hm, is this set to false ever again? It seems it doesn't need to? So
> the goto again is only ever triggered once?
> 

resolve_preempt_dependencies can only go from 0 - > 1 exactly one time.

> > +		goto again;
> > +	}
> > +
> >  	if (job->sched->ops->prepare_job)
> >  		return job->sched->ops->prepare_job(job, entity);
> >  
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 7ce25281c74c..eceb9b8c6f5f 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -829,6 +829,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >  	INIT_LIST_HEAD(&job->list);
> >  
> >  	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
> > +	xa_init_flags(&job->preempt_dependencies, XA_FLAGS_ALLOC);
> >  
> >  	return 0;
> >  }
> > @@ -864,21 +865,14 @@ void drm_sched_job_arm(struct drm_sched_job
> > *job)
> >  }
> >  EXPORT_SYMBOL(drm_sched_job_arm);
> >  
> > -/**
> > - * drm_sched_job_add_dependency - adds the fence as a job dependency
> > - * @job: scheduler job to add the dependencies to
> > - * @fence: the dma_fence to add to the list of dependencies.
> > - *
> > - * Note that @fence is consumed in both the success and error cases.
> > - *
> > - * Returns:
> > - * 0 on success, or an error on failing to expand the array.
> > - */
> > -int drm_sched_job_add_dependency(struct drm_sched_job *job,
> > -				 struct dma_fence *fence)
> > +static int __drm_sched_job_add_dependency(struct drm_sched_job *job,
> > +					  struct dma_fence *fence,
> > +					  bool is_preempt)
> >  {
> >  	struct dma_fence *entry;
> >  	unsigned long index;
> > +	struct xarray *dependencies = is_preempt ? &job-
> > >preempt_dependencies :
> > +		&job->dependencies;
> 
> Same – is better as an if-else below
> 

Sure.

> >  	u32 id = 0;
> >  	int ret;
> >  
> > @@ -889,25 +883,41 @@ int drm_sched_job_add_dependency(struct
> > drm_sched_job *job,
> >  	 * This lets the size of the array of deps scale with the
> > number of
> >  	 * engines involved, rather than the number of BOs.
> >  	 */
> > -	xa_for_each(&job->dependencies, index, entry) {
> > +	xa_for_each(dependencies, index, entry) {
> >  		if (entry->context != fence->context)
> >  			continue;
> >  
> >  		if (dma_fence_is_later(fence, entry)) {
> >  			dma_fence_put(entry);
> > -			xa_store(&job->dependencies, index, fence,
> > GFP_KERNEL);
> > +			xa_store(dependencies, index, fence,
> > GFP_KERNEL);
> >  		} else {
> >  			dma_fence_put(fence);
> >  		}
> >  		return 0;
> >  	}
> >  
> > -	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b,
> > GFP_KERNEL);
> > +	ret = xa_alloc(dependencies, &id, fence, xa_limit_32b,
> > GFP_KERNEL);
> >  	if (ret != 0)
> >  		dma_fence_put(fence);
> >  
> >  	return ret;
> >  }
> > +
> > +/**
> > + * drm_sched_job_add_dependency - adds the fence as a job dependency
> > + * @job: scheduler job to add the dependencies to
> > + * @fence: the dma_fence to add to the list of dependencies.
> > + *
> > + * Note that @fence is consumed in both the success and error cases.
> > + *
> > + * Returns:
> > + * 0 on success, or an error on failing to expand the array.
> > + */
> > +int drm_sched_job_add_dependency(struct drm_sched_job *job,
> > +				 struct dma_fence *fence)
> > +{
> > +	return __drm_sched_job_add_dependency(job, fence, false);
> > +}
> >  EXPORT_SYMBOL(drm_sched_job_add_dependency);
> >  
> >  /**
> > @@ -963,7 +973,9 @@ int drm_sched_job_add_resv_dependencies(struct
> > drm_sched_job *job,
> >  	dma_resv_for_each_fence(&cursor, resv, usage, fence) {
> >  		/* Make sure to grab an additional ref on the added
> > fence */
> >  		dma_fence_get(fence);
> > -		ret = drm_sched_job_add_dependency(job, fence);
> > +		ret = __drm_sched_job_add_dependency(job, fence,
> > +						    
> > cursor.fence_usage ==
> > +						    
> > DMA_RESV_USAGE_PREEMPT);
> >  		if (ret) {
> >  			dma_fence_put(fence);
> >  			return ret;
> > @@ -1030,6 +1042,10 @@ void drm_sched_job_cleanup(struct
> > drm_sched_job *job)
> >  	}
> >  	xa_destroy(&job->dependencies);
> >  
> > +	xa_for_each(&job->preempt_dependencies, index, fence) {
> > +		dma_fence_put(fence);
> > +	}
> > +	xa_destroy(&job->preempt_dependencies);
> >  }
> >  EXPORT_SYMBOL(drm_sched_job_cleanup);
> >  
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index 95e17504e46a..de16cf6b1869 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -353,6 +353,13 @@ struct drm_sched_job {
> >  
> >  	u32				credits;
> >  
> > +	/**
> > +	 * @resolve_preempt_dependencies:
> > +	 *
> > +	 * Job is currently resolving preempt dependencies.
> > +	 */
> > +	bool				resolve_preempt_dependencies
> > ;
> 
> I think this should be called "resolving_preempt_dependencies". Just 2
> letters more and it emphasizes that this is happening "currently".
> 

That is more clear. Will rename.

Matt

> 
> P.
> 
> > +
> >  	/*
> >  	 * work is used only after finish_cb has been used and will
> > not be
> >  	 * accessed anymore.
> > @@ -376,6 +383,14 @@ struct drm_sched_job {
> >  	 */
> >  	struct xarray			dependencies;
> >  
> > +	/**
> > +	 * @preempt_dependencies:
> > +	 *
> > +	 * Contains the dependencies as struct dma_fence for this
> > job which are
> > +	 * preempt fences.
> > +	 */
> > +	struct xarray			preempt_dependencies;
> > +
> >  	/** @last_dependency: tracks @dependencies as they signal */
> >  	unsigned long			last_dependency;
> >  
> 
