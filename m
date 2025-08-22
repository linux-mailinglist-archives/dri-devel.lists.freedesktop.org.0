Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E854CB310D4
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 09:52:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A5F310EA81;
	Fri, 22 Aug 2025 07:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RqpFvtC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBAD10E0C7;
 Fri, 22 Aug 2025 07:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755849155; x=1787385155;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q/mi32rPVgKl46qdS8AUO+UbfUcO4Uuxc82diw6W0Ps=;
 b=RqpFvtC1nZjC/7+Ljgo9B8LFqC/Iuj2Znpqjjf/46+0h6PCP+7EWQfSl
 QMxStvvanvL9gvfJqHCEq4zVXzkTeODUmaLQmPAMeTCNcQXYnlllFDiW6
 ZCLnt7v9TzZunJ+KZSJgcsZDnqj2zsj6jwOkj6Wot+Tr1u8F/SgNt7BVe
 gHTdlOh5gKKYELgB4tF/ia1XjoYTruTKFUrX4IVGnNBcM9Q17vCOaVpRc
 KKMQbPfHEt0yOHu1Sd06OQ8CjnUAwVpwB+IYP6TCSRCjWtROj8ntcZlU4
 BXIUjdSDitU2BN+jvzKab4VdHU63ynGO/xQwbJKOWzU6hv3rrUIonuJQb A==;
X-CSE-ConnectionGUID: iHWyDja0SRWmOs5rxUSZ/w==
X-CSE-MsgGUID: 1jmdTCmUTeO+3UQrGc4Blw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69591431"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="69591431"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 00:52:34 -0700
X-CSE-ConnectionGUID: aIjIA4h7TbO6rposjPlCUg==
X-CSE-MsgGUID: 9HHCTAg5R8aAIganoGlGpA==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 00:52:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 00:52:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 00:52:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.83)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 00:52:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HPCHrkV2ZzcMRGdxCv+ymo0YDbyuDCmKWyiRx3EZ+X7EIgG2gnzUbtdVp7/hMgbtVJk276fWSBKa2LrtgL52raED4p7XYhmSdjXsfMMQ8yM3ANHaHxIj3CF9/ZK+Bh/K3gtVc3kAIbwNHJIX/ohFl+H6ffOa8KekM8EifK/o3AmfXWDF0DQSNwrsVNyo/rwiAqsNbo3OiYHyl1kjtv5ugvs52FhjdeH4I8xhzzhH0f/bDPbtHyRAsn19Yel2FDUmAYCOCLcf+3wP61Yx9kn2WN7yjBLDCF87RDhvOlkdi30snFyi9WDhGbKYvby2tn2WaRsMQ4ZttfrQJvjiJjwldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5mlz6YwDJhsktvR0HTUcoZB29Fh9CMRXU0iE0LKGAs=;
 b=Hct4Nw8GPWIaGaUmpTstPhRHcE8RSEfKdAbViUyZAX0fljLs0v1r9IebeL1xKn5eJPkKQGyPn4p0vT61ORpELNmZfob+KhMgbkbSh76cNko+1B+VbmkGhnG65Y1ygoV6Es6o0KZRiQ/dUB/5pL9Zc59pGHMEjUs758Oua6ltGBEx1Hq4SlYhDIYAhyW05OHcXtaSvxsRxJG1VhjYOLMR2JLZ7/K4JFsJbFkOvSugEeIX3Hcf0/uCWISb9akUS/PVS2hqWB+P63txsyPk3m6uRMkyCJ+DncusHUNGPejUQOU8h7C3TZdS4o/fG1X4BWSANJBHe6tNUZn0zH0o4kDmZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SJ0PR11MB8271.namprd11.prod.outlook.com
 (2603:10b6:a03:47a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 07:52:25 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 07:52:25 +0000
Message-ID: <6c3c8ae9-d5d7-4596-b9d8-2a53b3cc5e52@intel.com>
Date: Fri, 22 Aug 2025 13:22:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gpuvm: Rename 'map' to 'op' in drm_gpuvm_map_req
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: Danilo Krummrich <dakr@kernel.org>, <intel-xe@lists.freedesktop.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Matt Coster
 <matt.coster@imgtec.com>, Rob Clark <robin.clark@oss.qualcomm.com>, "Matthew
 Brost" <matthew.brost@intel.com>, <dri-devel@lists.freedesktop.org>
References: <20250820152335.2899501-1-himal.prasad.ghimiray@intel.com>
 <20250820180742.20623521@fedora> <20250821130146.471cd653@fedora>
 <20250821132535.0424d0b4@fedora> <DC84DX5YA27J.2UNA0LDKUMUB9@kernel.org>
 <20250821150124.30c387da@fedora> <DC858O8WDXVQ.2KJJTV9020XHJ@kernel.org>
 <0475e7d2-c8eb-4f69-b68b-2b0b86c62e9f@intel.com>
 <20250822093508.6e474480@fedora>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250822093508.6e474480@fedora>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::11) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SJ0PR11MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c67dd15-fc00-4130-38ae-08dde150d52a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGVkRDFTOE1PcmM4SXJHTlFuN3BYU1l0UWM5ZXl4WTU0dDZYckFsOGRzSFNa?=
 =?utf-8?B?NElOREFqUnBEYURxaklTWEZOYlhwNGNvT1ZiYUdaQnBuRDdkZ2t1M09Ham5u?=
 =?utf-8?B?L1dJZC9MOWc4WjFXNnZmMVZNLzBPeTRIRThIVVJTWnQ0WDk2a0Z0VE1SM29Y?=
 =?utf-8?B?dTFBeStTamQzNDAxeDQvSGFrNUlyRExSVW5aTnVCNXk4dHFpSGFDamY2SGlG?=
 =?utf-8?B?bmJ3RVdubUJaZm4zT0pLam4ya0NPSXdPdlp1Vk4wNVM5RS9BM3NKY1hwaEJR?=
 =?utf-8?B?dXV4UXRlcW5CY20vdGVDdDZIL0JyUFo1RVk1Q1dJRnI5WDdrbS8vemFMblVJ?=
 =?utf-8?B?ZldmNFZBay9Rb2JEYmNNWHhVMnp5MU5LT1M2VVZnaUNSNmFpb2VyM2RENlpm?=
 =?utf-8?B?eWdxK2ZUQ1hibHM2aEZQQTk4RnlPRENQVEZrMTVkYVozZitub25RRFZZMmU3?=
 =?utf-8?B?dEliMTRRMlpxVzlEZC83dHczQ1JZekdZRWVIZHVEams4bmxXUG9hTkFFSUxR?=
 =?utf-8?B?WWRycGlIbHpZUksvalM3QmdxOTZUSkt4VTVXbEU4MDJKWUNGRUYxMkV2WXg1?=
 =?utf-8?B?bTl4WXRQb0NWaFRHbk9tejdPSldPS0Jtd2dXd29KamErS3VQTGJKcGRBdDBs?=
 =?utf-8?B?Qm5oalVPTFEwaHc1QmZ3bk52VG1vRGtsMVM4UXl1ZUVaQklrbHhQdHlkb0pi?=
 =?utf-8?B?RDhtdUZJQytkS1VmbTBCL0oxcHpWNGZjNWFoVW1FSzRGRFM0OUVEUzNrS3Ux?=
 =?utf-8?B?WjJZWUQrYnJ4TmtKa04wWXNUY3VpeWNnVXR0YkhqNEU2SGszNGpBT3BjcUhM?=
 =?utf-8?B?THcwUWpBRmRuQ1NTL2NqcG04YS80bEZaaFRuNFE1TWNKZG5mb1BUczZySGxy?=
 =?utf-8?B?bDV1Nk5wVVhEM1BFYTRvUHVZVzVXRFFIM1g4RERXVXpXaEI4N3ZWUXEzOXZ6?=
 =?utf-8?B?aGxSdlN1SjRNZzFvN245TXZFUzhEQjNIdjFDbWQ3MkVVVUM1akNWT3FqMU1n?=
 =?utf-8?B?aFFXamVFZENJdDg1RlFraHFPQXQ0UUhCTnorWEtrOGlwU2RuNXlnWndXQWx2?=
 =?utf-8?B?VVpOODlqREtwa0VJMGVabGl2ZklPQ0JSL0RyV0xSMHZkRWJFSVl0TVk4WnhO?=
 =?utf-8?B?UXM3bSs5VUpsUm5mNitLSlhiTWxrRU0ycitvSUVlR1RESWROSHR6NXBpRytF?=
 =?utf-8?B?NTZwNzhqMzNhdnNtYzZjOE5CTWV3L2loRkphZmJTL05RNm5zYWZpcTlzbmFJ?=
 =?utf-8?B?Wmp5NXFnbEdNRDBKVVM0eUxVY1ZhTnJndTRuYzFlSkZJZEpRYXlNV243ZmFj?=
 =?utf-8?B?TSs5aDJGSk5aSHRGUG54S0xybXpJMUhNSWlBT1Z4MjhHQ09BUktIeWczTzk1?=
 =?utf-8?B?aUNqam0xVno3Wjg3TGZRQnpHUWNwa0JIWWJlSHRoR1NTWk9QOXRzR2NLejZk?=
 =?utf-8?B?dGUwaVA3dGhCaGlraGZ4NnpaeUdXSXU5bkVaZGRPUnIySnQ5dnlnRHcxY3F2?=
 =?utf-8?B?eFRFNVNCcmJmT1hEekVDV0kwMnIxOXJtQ3ovZGQrcVM1ZXFHZmtnam5uUFFN?=
 =?utf-8?B?VkMxbzNYUEtvZmxjWC9vTWxkdTNRU2p0aVJDRkF2SW9MSWIzVVB3Qi9oc3lz?=
 =?utf-8?B?WkljeHRFcWhZREUrWU5xdlFiSjBraXE0WXpJbkIva2E1V055aEZqYW55aEt6?=
 =?utf-8?B?MTluVzVjTWFBOS9HRkdpUm52cTBJV2g4ZHk2SDJIUlVGM3dTelhSeEsrSTQ2?=
 =?utf-8?B?U3loT0lNUGFUdnJNV2FrenZWZkl2NE1SbzIzckMvREkrKzBWbHRoYU9za3FM?=
 =?utf-8?B?R2lQRXFibXdVSWlUSjRiYWo4NlpVbzhTRmVHeXp2R3ZVT2FORks5SUIvMUZM?=
 =?utf-8?B?bjFLL2hIdEZjUzJSaFd2REEwVkkxbFpuR1NJR25oaEt6eWFRanhtQTQyYTJK?=
 =?utf-8?Q?QDpxas49NKQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG0xV3lqMTB5cS84dWxmZW90enh2TGZ2VmlDR1diN2tXSlV1dVJXRFVsWWFU?=
 =?utf-8?B?R1NjY05DT09KZ2RsVlRZK0JPL3JSOTE2ZjRmajBhUnBSS1JuSDNVQ0s5aC9Q?=
 =?utf-8?B?R0JENEExcGRnMTFpT2JLNWI2ajI1ZldWNlRnSmpBR1E3Q3BjVmRKWkhmVzY3?=
 =?utf-8?B?aWt2VmFrbTFtZE1UeWlLeTBYeTcvS3VPaVo3eXFxbU5mT05PM0VIaVhONjR5?=
 =?utf-8?B?TVJuSzlKc2o5bkZCOFhUUnlxcnZhaDBUOFFHc1lqVkpjUXdsemhBbFdIVjVv?=
 =?utf-8?B?ZStYRTdWV3krcHN4cTVEMGJEcVlETDI0bG1XK1hUSDhTV1l3SzFrYkF6NTE4?=
 =?utf-8?B?d1lPNEMzd05wYlZpOWtvaWpkRG1QNXByemFUdnZOa0gyNm03eTU5R3NRNk1w?=
 =?utf-8?B?UmxweVFBeCszSFJ6ZkdWUEY1U3pQc244UmtUdWt5R25zZUlZbUNzOHR6QjVZ?=
 =?utf-8?B?WEZCMmVnc2VTTnFvdXVhMDh6NHp0RVVQVWVCeGpwMHZpVFdYa1NKb0dsR01E?=
 =?utf-8?B?NnBMLytQQitZRDFLR0dCU0srcWVmdXhiSFFMbS9GclRSbERxNUo2bkt3T0g5?=
 =?utf-8?B?LzRTM1R2b2EyajF3VlhRK3lCWlFmUm8wNHhncS9obUlMeWlZRkliajFWd1Vi?=
 =?utf-8?B?YS9rZG9ZUCs3UUUrS2k0cUJ4aGRaM3FNcE10Vmd5cCtGb2F0WThvNERHVFg0?=
 =?utf-8?B?a3l6N2tFTmJObDliZnI3aVFyQ2NPbGxxU3pyZm1wcFZkN21sek5HWlNTWUtW?=
 =?utf-8?B?bG1kZzM1Qnh4U3BWb1puU2hiL1gwaENnMk1DbUliZzVMNmM3OFgyZHRXQlhG?=
 =?utf-8?B?a2p0MlhvUlY4OUNjUjRLWllOeHVteGpEYXZ3K1djT3o1VjhvWlZvdkVaOGds?=
 =?utf-8?B?b2NUVmxneVpTdHRNcC9NNVJUbW5nYXV0SE52eVNwR0RzWkZqVzI5NkJkc1cz?=
 =?utf-8?B?Q2VZTi83Mk5yQ29pSDd4TmlsUlppRklWaFQxSm52UW1weXV3OHIyaTRBVmxE?=
 =?utf-8?B?bWptbURXK3Z0WFRONHFSeW5hUnlvaTcyaUZpQVY2SkNFOGJ4cWpKd2tybVJK?=
 =?utf-8?B?V0hBeDl3dGszeUFWdGdiMVdlTU5lTVBYVG5DajhOZWlYV3p1TkZDVHBaQTZO?=
 =?utf-8?B?akJKK0NyWTQ5Ni9ZWU5LWFBYaUwzTVA4UXFnRUc0MHNON003b2c5T1dtMlZa?=
 =?utf-8?B?U2dBa1YwcFR6N1RDU1puVnFQb1M1QklOQXdudVFUb2hJM2FJMFJCRnd1L09K?=
 =?utf-8?B?NkVVdThzVzlhclAwQVloSmRWS1A1L3NoRDJQUWxFZUdaenNqTTBESmNXbldk?=
 =?utf-8?B?ZUdOMVpIcEtFOENWOGlnUVBXa1k2dVlOM0R1TW9JUWNEenZrUjBYbmJnbHIx?=
 =?utf-8?B?d2VrN2x4elhyU0xrUnhQYTRQenJKekg3YldBRSt0eHY4OHdPYjlFd21Tb0VB?=
 =?utf-8?B?M0JXM2tHakZzWUU3UTdocWJuendoMEwvNTEzOHZHeE9POUdCRGtOaHV2NEo3?=
 =?utf-8?B?YlJzL0ZEYVl2QTZMd0RrVGdRMFdJRFVHWndSaVM2Z1RHU2daUDB1NHFMK1Va?=
 =?utf-8?B?dWFESWh1dzFqZ1MzWDMzc1M5MWoyakRjdk9GU3FDYXB6QTZmMUwzMkY1b0dB?=
 =?utf-8?B?WHQ2WGUyWE1paG96NGU2TFpsMDRmcm13V0krM2xpSGQ2VG03NGtCNUxBcVJK?=
 =?utf-8?B?c0lGdWNXUENYMGVlYWM3eE56RG1zWkU2d0JXQzhVd1crUkNxaVdrbnN5c0x6?=
 =?utf-8?B?bUcyZlVsanUvRVp4QVVPdG5yT0dTSUZmWVpWdHRNK3dNN21uQjl3MkV5MVMz?=
 =?utf-8?B?S0NjcCtxclJsaXdmTGIwcFAyeS9xbFQvRVZhdTR0VVJkcDVJRmRZNTNMTzlm?=
 =?utf-8?B?a3ZBRlhwSDFCRUYzOHBRVUtxSmVrbDNGc3ZYVWdHV3IwTWxrd3hCUzFmaURC?=
 =?utf-8?B?MC8xT1RpZHBBdU56SG9iMk4vTVU5R0s2R1J3L29ZOWFjbUVlUlREYlEwc1kx?=
 =?utf-8?B?RnhOdVY4ZGJaeUNvMW1xOWI0eGMvNUp4NnVOa3BJSHVWbVo2eStncGhqdW1w?=
 =?utf-8?B?c2ErOVRKNW0rMHFyc2xYWUd3RklrWFIzYUY0MjgzYVJvUS9FSG52b0NObC9s?=
 =?utf-8?B?cWVGUS9UQ2xta0VZOW5XcGRISnJnSEl6WThXeHFOSCttTUlmQXVMR2lRc0dq?=
 =?utf-8?Q?bm0OEMEQOkeKVnB0/F2dmYg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c67dd15-fc00-4130-38ae-08dde150d52a
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 07:52:25.0409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYDfPHzPxfECSFh8RUv8fAKgGlQL1pV2KIbtH6rqLtkcU6Q2EeydNrbFPpKdbXkBhx+ehIX8YDXZruFTfs1Pa84HUvU3uBeLWzL2Oc/UZ6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8271
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



On 22-08-2025 13:05, Boris Brezillon wrote:
> On Thu, 21 Aug 2025 22:25:06 +0530
> "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com> wrote:
> 
>> On 21-08-2025 19:05, Danilo Krummrich wrote:
>>> On Thu Aug 21, 2025 at 3:01 PM CEST, Boris Brezillon wrote:
>>>> On Thu, 21 Aug 2025 14:55:06 +0200
>>>> "Danilo Krummrich" <dakr@kernel.org> wrote:
>>>>   
>>>>> On Thu Aug 21, 2025 at 1:25 PM CEST, Boris Brezillon wrote:
>>>>>> On Thu, 21 Aug 2025 13:01:46 +0200
>>>>>> Boris Brezillon <boris.brezillon@collabora.com> wrote:
>>>>>>> On a second thought, I'm now wondering why we need drm_gpuvm_map_req in
>>>>>>> the first place. It would kinda make sense if it was containing an
>>>>>>>
>>>>>>> 	bool madvise;
>>>>>>>
>>>>>>> field, so you don't have to pass it around, but even then, I'm
>>>>>>> wondering if we wouldn't be better off adding this field to
>>>>>>> drm_gpuva_op_map instead and passing an drm_gpuva_op_map object to
>>>>>>> the various map helpers (like Danilo suggested in his review of the
>>>>>>> REPEATED mode series Caterina sent).
>>>>>>
>>>>>> More on that: the very reason I introduced drm_gpuvm_map_req in the
>>>>>> first place is so we have a clear differentiation between an overall
>>>>>> map request and the sub-operations that are created to fulfill it.
>>>>>> Looks like this was not a concern for Danilo and he was happy with us
>>>>>> using _op_map for this.
>>>>>>
>>>>>> The other reason we might want to add drm_gpuvm_map_req is so that
>>>>>> information we only need while splitting a req don't pollute
>>>>>> drm_gpuva_op_map. Given I was going to pass the flags to the driver's
>>>>>> callback anyway (meaning it's needed at the op_map level), and given
>>>>>> you're passing madvise as a separate bool argument to various helpers
>>>>>> (_map_req just contains the op, not the madvise bool), I don't think
>>>>>> this aspect matters.
>>>>>
>>>>> Good catch! Indeed, when Himal picked up your struct drm_gpuvm_map_req patch,
>>>>> there were additional flags included in the structure. Now that it is
>>>>> essentially a transparent wrapper, I prefer to use struct drm_gpuva_op_map
>>>>> directly.
>>>>>
>>>>> However, given that you still have patches in flight that will add a flags field
>>>>> to struct drm_gpuvm_map_req I think it's probably fine to introduce it right
>>>>> away. Or did you drop this plan of adding those flags?
>>>>
>>>> I need the flags field in the op_map too (so I can propagate it to the
>>>> drm_gpuva object), so I'd rather go with an op_map object directly and
>>>> kill drm_gpuvm_map_req now.
>>>
>>> In this case I agree, let's use struct drm_gpuva_op_map directly.
>>
>> According to the kernel documentation for the drm_gpuva_op_map
>> structure, it is intended to represent a single map operation generated
>> as the output of ops_create or the GPU VA manager. Using it as a direct
>> input to ops_create contradicts this definition.
>>
>> For drm_gpuvm_sm_map_ops_create, the values align with those in
>> drm_gpuvm_map_req. However, this is not the case for
>> drm_gpuvm_madvise_ops_create.
>>
>> If we plan to proceed with deprecating drm_gpuvm_map_req, we need to
>> clarify the fundamental definition of drm_gpuva_op_map:
>> Should it represent a user-requested map, or an operation generated by
>> the GPU VA manager?
> 
> I would say, update the doc to reflect it can be used to pass a user
> map request too, but I'll let Danilo make the final call. BTW,
> embedding an op in _map_req is equivalent to saying the _op_map object
> can describe a user map request to me :P.
True :P

