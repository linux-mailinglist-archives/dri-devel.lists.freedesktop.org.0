Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08389AEE90
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 19:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4980010E993;
	Thu, 24 Oct 2024 17:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VvSSZSmm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC6F010E98A;
 Thu, 24 Oct 2024 17:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729792143; x=1761328143;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DZz8gT7zcThIeTKDyonU8dEIUpSgh7Bx4/W6rprE8fc=;
 b=VvSSZSmmK9jxwmgestXkJJnTLBroims+WHEYflIzVlafodIieK6WmFCr
 fnrkkEKl2fcTmCeYDoiX9P50r2525lrg0ljnawUeepOX/D1I9wGslvh1K
 XydC7uyZsHfAjjTyG6nwSATEmSfSe71nX1jAXoSK0lA4NP07/ua35O1yr
 YtPVnckJ9dGXw8kgdZlu3QI9HJcwR/fANeIGSHbUFdUxhOWVAcQFHOKck
 G/QU6hSV7eB0H1WQLo4MqNbIEmUap699qufjKHNfLoQEGjOB0WVftlIQw
 NpT4++W4T9BH7X3zQJrtn26lSClH7hVHi+F84NpDZI+dsa51chJod8u1L g==;
X-CSE-ConnectionGUID: MDC+HCPXSlSIrTQqQNhs4g==
X-CSE-MsgGUID: Q00S7MqeS2ayfOoOzLMivw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="17072436"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="17072436"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 10:49:01 -0700
X-CSE-ConnectionGUID: a5raLgt1QaKS5a0GlYXd+Q==
X-CSE-MsgGUID: 2MxJQ4LnTBiWv7554CXz3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="80659111"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 10:49:01 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 10:49:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 10:49:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 10:49:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iooWVn6ggvZV+wNa2DYQy5XovIEFVfq2BtjnWOU704m/UuMXgYxURAm3/CCDHua1lf+7Uo+bc/abkRxOufbkmb57LJZ7gsLXIpafxBNzQbps2vbATf1x98aczbq90LQ/yKkatxoYsBoVIragNdFgEiHCizxCYHiyTdWBegdJr5r6Z60TL/TM9chdbyoD2rdPZ8RQTCVaRR5Dp9B2VUV18a2pN4P+2tGc0nz1tatqyGWUZQx2dMQ2TkrSSbQ4gWC7KilrT6qA4iizBlPM9QrX1ye2sOaQctCjPZHXZpSheqihQmgbEzepKeEpox4mEuXH1OvudTLVALTLwRyZQCF/jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nj4b3HuucI+ubN7dWgEnoV3yHaz+Kf21ikMe7jqzwNs=;
 b=Nb6RYnuKcDqkdAlw8NRVJJWezVt//D8egIUFyZENd485NjHkWDTNc0eqYhdXWS9hQX1mtZ723i0gxBMoFO3Qy3i/JfxQhneWXEn+kQSUnBu68ptdwlKHxwuzpfqN7DFTsMrPUk9HKHlle+4tZCaEINJgmhAq6pvqHOJapT2lRLB9ZqBWRJB8ioGasb4Fj4OdXDJpG7uElnI3c0xUQ8q8uGNW/tWPCVx8KOMXxs6fnhGYfBBhgWbBwULDS+ALFOX21lbP9aa9KZ1YwjOBM6WyHu66tZKFi0yL+f/VDvz4ngM8xHN9HAvtyIaalUt52+6f5SuE0j6fSocXsy5M7dBPLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 17:48:57 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 17:48:56 +0000
Date: Thu, 24 Oct 2024 13:48:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
CC: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>, Raag Jadav
 <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 <thomas.hellstrom@linux.intel.com>, <simona@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <joonas.lahtinen@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <lucas.demarchi@intel.com>, <tursulin@ursulin.net>,
 <francois.dugast@intel.com>, <jani.nikula@linux.intel.com>,
 <airlied@gmail.com>, <aravind.iddamsetty@linux.intel.com>,
 <anshuman.gupta@intel.com>, <andi.shyti@linux.intel.com>,
 <matthew.d.roper@intel.com>, <andriy.shevchenko@linux.intel.com>,
 <lina@asahilina.net>, <kernel-dev@igalia.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
Message-ID: <ZxqIgODaguPVxJvD@intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <ed8cb1e9-df05-44a7-9088-90b3ee8dce85@igalia.com>
 <ZxJ3DJWY9Lsc9Mn4@intel.com>
 <CADnq5_M62YZRvBT7sQwrZTiHrUsifaqqgrWOD_z+YY=EiBtEcA@mail.gmail.com>
 <3fac9971-8d26-4d52-badb-2b14b3f84263@igalia.com>
 <CADnq5_PmHnYDvQpGNCF_3xP0a84EKsEuMqrj0MuUC=TyKTTrDg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_PmHnYDvQpGNCF_3xP0a84EKsEuMqrj0MuUC=TyKTTrDg@mail.gmail.com>
X-ClientProxiedBy: MW4PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:303:b9::24) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e13c17-382a-4d51-ad9b-08dcf45421e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wk9ONjZxUDRCMmVwZEZYK2wvSUpEN2M5L1NwaGFqeEJIQmFiU1JQdDU5UXlO?=
 =?utf-8?B?MEN0ZXp2VWxiTVQ3bG5pdC9TY2w2cjVjZEUvVDRGTEV5cE5mMmk4VmVSODl6?=
 =?utf-8?B?Slo2bFU2OVY2MUl5blZRSnUyRktHanNzdU15UEE5MlNDczJBcnVCaStqVVJz?=
 =?utf-8?B?UnVwZlRrczRERzRYcXQ1bnNXTlB0OTdZRTRSREJRY0NhTDBrWW5FZTIvcTVM?=
 =?utf-8?B?N05kVUlzQzRsMDJkSU1rM2VnS0FlajdadTE1OXcwNWVyT1dSRmhvYXVyaHUx?=
 =?utf-8?B?ZjFmR29iUnFXN3RPUEFtazUzYzFJMkRLcTA0cGxPNjhmd0hjOWE2eURyWXhh?=
 =?utf-8?B?M2tsb1pLR0ROYVRIQUY3ZmZNN21xeEEzVlVNRHk4bDhmaWFIZ29iM3ExVjMr?=
 =?utf-8?B?T1ZsekFoa1FUMFZKTkswT2RMQ1JlalRjNU1WNU9ocks4c2pWWE1CWm1WOWtz?=
 =?utf-8?B?a2Fmbk5NNThIcDIvY3AybmREMldrVFA1S2puMWV2UklENVZBbFluQnZZWTN0?=
 =?utf-8?B?S0QwZ1FZQUdaOTMra2ZKblhSOFVRMHFqRDNCL3NLNEFRVjRybjVmMWNwTlNW?=
 =?utf-8?B?L093MFhTdmhmRjRKdXQ5cVpuWHBqQ3dIZXVWYkhJSmVsRHJOdTVrNC9ERzNN?=
 =?utf-8?B?eFlnUzRyMjhTRk04N0MwTFpqVVlQMFpwUEhLYUZHbVFBRXBGcC85WGJnTHJ3?=
 =?utf-8?B?dU8wNjlKdFE5Q20xT3phcDVGd0FERGV3czUybXg3RjRpZFdFb2VHMWQ5WGNw?=
 =?utf-8?B?aFVhcmhveWhIQnRzbnFRY0p0d1lOTDZSdnVSc3RHbkFnNW1nWUZyb000Ni9E?=
 =?utf-8?B?a0FvUm8zTWVXTEprdW1IdHRPeHMrV0FhSXhEang3RFJNbVlBRFVpd3NtZEE4?=
 =?utf-8?B?dk5oOHhMelhnamdTdldVVnlSQTRhSFYrc2pJVXhnZVlwWUJ1YUZBWG1GbnJp?=
 =?utf-8?B?NWNhNnpKb0dDL2RvWUVmaURDS0xxMTRqZjN6M1lFMTVMd2p0QXFYYWNJcy9w?=
 =?utf-8?B?b09ueGVCZW5YR2h0aHNLRWgwdTFkVDJYZ2pkQjFTSVpsT21YbEpxODd2Ly9R?=
 =?utf-8?B?NGVvaWJQbldOMzN3VXJvR3dZRmxRMnFnc2EveHhwMGd4aHlFcVBqQUlaRkpD?=
 =?utf-8?B?UVpGek1mL1RhR2NFclBKenJtaTZHNFkxQ2wzQmd5NXVuaFlIMFlaSXhYSU1z?=
 =?utf-8?B?dGVmMXI2WHlkSlJnc1RmYnBha055dW56bG9PVVRYWEFHaVcrNThmdmtQVFh1?=
 =?utf-8?B?UytIUU9tUkhZWENWQlRwSUlDaWQydm1MemhyYmNzQ3RYc0QzR1RobC92eDRR?=
 =?utf-8?B?MytSdU0rS09SZHVrSjk0czBvYW5sN3RRbk1LanAvRkt0LzNFZ1ozTDVKT1Er?=
 =?utf-8?B?WmZnTDVnbmpyM2g0WEE3Y0xDalFDNXhZMkhDR2RJQnFMTXRuNnN2YlpwVGRs?=
 =?utf-8?B?NlhBUTh0RkZUMmR5d0lrYXRlNDVDY0VSM1BmcVNuTmExd3BGb2JhN3JvL2hL?=
 =?utf-8?B?MGtqREY1czJpN01Pay8wRkI2SDczT3dRc0lwZEFoTDIxZTBTT1hmallhR3Fv?=
 =?utf-8?B?WThIRXNCUFYzSHpZYXlvbXQzTHYwam5HdUI3bEUxSXhHVFRrVy8rUjRmQkw5?=
 =?utf-8?B?eUZ4NkZQc2M5cDlwT0VtY21vUllORFNGUTF6NlJTMjFtZ3pHNjFFazdmZ1c1?=
 =?utf-8?B?emU4ajJnaGx2UXpLNk9mR3J1NExiSzFLMng0YVY4MGVRcHhhaS9zV2lhaDl0?=
 =?utf-8?Q?9r9kwHtLJ3nZ8/1xXOrnCqZ87niEPJiAepON4NU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWdHczlKMjRPbjhyTitZZUcyUjIyOWZLcm9IM3RZaUprWlorbkJmeXRzSE5q?=
 =?utf-8?B?NjJhcHd3bmI4SEE2dUJoU01WNnBPeUZIVEgxMmowbnhxSm5meW1Ld0g5clZn?=
 =?utf-8?B?N2Jlajk0NllHRUZCejRrQjV0ZjNRRjNYQ1VJV2x4SHJWaGgxVjQ0Y1Q2eUtn?=
 =?utf-8?B?S3p5OHV4cVRoVXE0ZG9wdGY5eUhnbUs2cTFSQzZBTXh5OVk0K3BXMUhTRldP?=
 =?utf-8?B?UzFqMzVLTS9TYVJvUFVGbklWanlMYXVLUjY4RVkxaEpsN2hDL1BOWjZvRjUr?=
 =?utf-8?B?UEtwUEF4MDVFMDN6Smd3NEU2Y3hvakQzei9aKzN5QXZ2NjZBMUszM01VNmVi?=
 =?utf-8?B?MlRZSm4yYmVFR1d4bmtuYVdtOEhEUlpyVlBIKzNQcFN3bFlMV1paa0pVWGtC?=
 =?utf-8?B?Y3BHbzc0dlhHSUswUFRxVTdCUllNeC9OcXhtbzlPRC9HZTIrUWZPU1JxeGxT?=
 =?utf-8?B?YlVwandxMXVCMmlqeXl3U2t3TVVLNnlNYUQ1eUtKQ25DSlM1b3laNEpGU0N0?=
 =?utf-8?B?UjE4UjlsUGdXWFlVZWJsYlRHQ2FIRjdPRTlwZzRhWmh4UVFxV0FxUTVWWTRF?=
 =?utf-8?B?M1RGUkRPbytJKzBGTG4xTTZrN1N2dTNXZTVjaUZRRUxwRGhwcEdJNnA1Qk0r?=
 =?utf-8?B?QUkzY2xkb2pvME1tcVRIS1c5S2R5a0RjUk1TS1BWLzZMUUVVYVROTVJBMGV2?=
 =?utf-8?B?clNOenAwYVpjemlmckRXVUhwMWw3RVJIQnNEcmpXY25WTFE5Q25TMlkraENH?=
 =?utf-8?B?eUl4RDZ4S0paZGU2Mjg4S2RFeGc2aUlmbzhGT2N6WUJJWElzSFplbTQyYVBi?=
 =?utf-8?B?UDFTNFZwTTNTMVB3UFBiVHRnOWhXSHRkY0p3QVBYYjRkN1BwenNpbFovQ0NC?=
 =?utf-8?B?dTdYenNKUHpXbXp0UU5kZHVYRGhCTHRWRUNZMmhDdGQxVThmeURXVjdxVlRT?=
 =?utf-8?B?S0ZZUFNMTkJ0TndWZEJxTGJqSGdJVXNDVVV3dFJiSGM0TzdDZmtVT0M0N05U?=
 =?utf-8?B?bUhjdytBRE5xNWl6czRoRVZqYkJsYVNUZGcrekJSdkhScG9aY1Vnb2Fvcm5n?=
 =?utf-8?B?U2xTNDJ5bklOQWFYUEl4a1oxeDFRZmlBeld6Tmc1NEs5Ly9LNUV2S3plTDNt?=
 =?utf-8?B?RllZY3JkOVVVNDhzRTg5SlR3dkpBQ0R2MlIxS3ZzVjBqOEJHU2x2eldEV1Er?=
 =?utf-8?B?RHcyNDc0eGRaYlB2by9CNzE1R3psSURyNmJIZ2xRV2djVTBKQWFiZXNMYjJK?=
 =?utf-8?B?eGl5MHJIR3c3SElBalg4TW8rYzZVSzdwcW9xc1ZHaUlGTWttZ1ZCK29WZkxy?=
 =?utf-8?B?Q3Vad2xzQ244ZDdmclVuOXc5MVUwaUlmbDJTMWtlTUFJMmFxS1MrTk40aGtz?=
 =?utf-8?B?cjFQSXEyL1IzRW9VZzlkYzV2YXgrMlI5bHpvRHBFWmdHajFydkhWMUo4Lys0?=
 =?utf-8?B?ZEJaU0RXK1VzTWRuTStTdHdFeGZwR0NHOXBrZC9Sd1UxQzEvU3lpZWNrV3VJ?=
 =?utf-8?B?VnpXM3NTMW9zMWswZUU4MnVFeURxek00VVdaMlNuWllsajlZeWh2TnkyQUNw?=
 =?utf-8?B?d2Yrc1JuYnV1MWIrb041MEFUejZEVUJrVzhkWG1pcU9NdW9Cajc4QkdOMHdJ?=
 =?utf-8?B?S21GdmJjVjRmQ0o4aDFRMWtta2Y1QWllQmdIV3E2cmVIY2FVZ0tEWjY2TFRx?=
 =?utf-8?B?YUdiMm91OGlkKzYveWYyN3JTM3NMQXBqSE5ETnRKSWtoQmI2NElDcjlOWmll?=
 =?utf-8?B?QThpQVNkSUNGT01ZeTZBeCs3MDBUeGdmQllUM1VDSWcrNVBXN3ptVzVuQjdj?=
 =?utf-8?B?UHJLVG41NlI3d0l5ZDVpcE5yUVhYUVgxVmJwSSsrOU9EQ3liSWZPWUg4RVVi?=
 =?utf-8?B?V09YSlNtYWsybXFEdmFKUWVwNnY4RkVYMFhacmtGcDluckFLdWFraHpqOHhM?=
 =?utf-8?B?N01rQWcvdlRSd1JHcDZ1dUg0MS9VdmovdUd0SEQwcUtZZlJNTFdObFdzaHk5?=
 =?utf-8?B?N25sQmtQd25yd3RkRXVZbVo2S01vN0xaVUlXRGZ0cUc3NTF0Snl1dnlpaGQ4?=
 =?utf-8?B?bjdIanVYSCtDdUtHYW8yYmpXOFpLWXpjVVBPMlduMEI1bU5zT2N1cTdKeDJq?=
 =?utf-8?B?RXFCVTZIeXRucXpzUnpwZU00UFFRcXROTnEzd1BIK09PYVhuVDN3QlJxZVJM?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e13c17-382a-4d51-ad9b-08dcf45421e9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 17:48:56.7299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LzXzf6Ulw2VkqTRDQ7WHobIFQz49GenPCcJomC43NPvdVA3R+GAxAkt+ZZX2Et9U6cqknROkTQrhNnqdmBd3WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6445
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

On Fri, Oct 18, 2024 at 05:07:22PM -0400, Alex Deucher wrote:
> On Fri, Oct 18, 2024 at 1:56 PM André Almeida <andrealmeid@igalia.com> wrote:
> >
> > Em 18/10/2024 12:31, Alex Deucher escreveu:
> > > On Fri, Oct 18, 2024 at 11:23 AM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > >>
> > >> On Thu, Oct 17, 2024 at 04:16:09PM -0300, André Almeida wrote:
> > >>> Hi Raag,
> > >>>
> > >>> Em 30/09/2024 04:38, Raag Jadav escreveu:
> > >>>> Introduce device wedged event, which will notify userspace of wedged
> > >>>> (hanged/unusable) state of the DRM device through a uevent. This is
> > >>>> useful especially in cases where the device is no longer operating as
> > >>>> expected even after a hardware reset and has become unrecoverable from
> > >>>> driver context.
> > >>>>
> > >>>> Purpose of this implementation is to provide drivers a generic way to
> > >>>> recover with the help of userspace intervention. Different drivers may
> > >>>> have different ideas of a "wedged device" depending on their hardware
> > >>>> implementation, and hence the vendor agnostic nature of the event.
> > >>>> It is up to the drivers to decide when they see the need for recovery
> > >>>> and how they want to recover from the available methods.
> > >>>>
> > >>>> Current implementation defines three recovery methods, out of which,
> > >>>> drivers can choose to support any one or multiple of them. Preferred
> > >>>> recovery method will be sent in the uevent environment as WEDGED=<method>.
> > >>>> Userspace consumers (sysadmin) can define udev rules to parse this event
> > >>>> and take respective action to recover the device.
> > >>>>
> > >>>>       =============== ==================================
> > >>>>       Recovery method Consumer expectations
> > >>>>       =============== ==================================
> > >>>>       rebind          unbind + rebind driver
> > >>>>       bus-reset       unbind + reset bus device + rebind
> > >>>>       reboot          reboot system
> > >>>>       =============== ==================================
> > >>>>
> > >>>>
> > >>>
> > >>> I proposed something similar in the past: https://lore.kernel.org/dri-devel/20221125175203.52481-1-andrealmeid@igalia.com/
> > >>>
> > >>> The motivation was that amdgpu was getting stuck after every GPU reset, and
> > >>> there was just a black screen. The uevent would then trigger a daemon to
> > >>> reset the compositor and getting things back together. As you can see in my
> > >>> thread, the feature was blocked in favor of getting better overall GPU reset
> > >>> from the kernel side.
> > >>>
> > >>> Which kind of scenarios are making i915/xe the need to have userspace
> > >>> involvement? I tested a bunch of resets in i915 but never managed to get the
> > >>> driver stuck.
> > >>
> > >> 2 scenarios:
> > >>
> > >> 1. Multiple levels of reset has failed and device was declared wedged. This is
> > >> rare indeed as the resets improved a lot.
> > >> 2. Debug case. We can boot the driver with option to declare device wedged at
> > >> any timeout, so the device can be debugged.
> > >>
> > >>>
> > >>> For the bus-reset, amdgpu does that too, but it doesn't require userspace
> > >>> intervention.
> > >>
> > >> How do you trigger that?
> > >
> > > What do you mean by bus reset?  I think Chrisitian is just referring
> > > to a full adapter reset (as opposed to a queue reset or something more
> > > fine grained).  Driver can reset the device via MMIO or firmware,
> > > depending on the device.  I think there are also PCI helpers for
> > > things like PCI FLR.
> > >
> >
> > I was referring to AMD_RESET_PCI:
> >
> > "Does a full bus reset using core Linux subsystem PCI reset and does a
> > secondary bus reset or FLR, depending on what the underlying hardware
> > supports."
> >
> > And that can be triggered by using `amdgpu_reset_method=5` as the module
> > option.
> >
> 
> That option doesn't actually do anything useful on most AMD GPUs.  We
> don't support FLR on most boards and SBR doesn't work once the driver
> has been loaded except for really old chips.  That said, internally
> these all end up being mode1 or mode2 resets which the driver can
> trigger directly and which are the defaults.

okay, this is the same for us then.
And this is the main reason that we have this option:
- unbind + reset bus device + rebind

unbind by itself needs to be a supported and working case regardless
the reset state. Then this sequence should be fine.

Afaik there's no way that the driver itself could call for the bus
reset.

> 
> Alex
