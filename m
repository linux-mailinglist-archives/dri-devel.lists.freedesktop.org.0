Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2486696222F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 10:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5812910E164;
	Wed, 28 Aug 2024 08:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHf2K8d4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363DC89F71;
 Wed, 28 Aug 2024 08:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724833188; x=1756369188;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hyt2KtsJoJfiNYNFSH3zfz233OBM1gqLy+L0ZwaXXiM=;
 b=gHf2K8d49KAilFSKrkI4CIn5HMtk5V9QucOsEmpxYyZwVm8eHPUbQPgb
 EvIX11jcf6xIVAf3a23kxRD67tcbbzJFjQ9qIScsfL1uPh0tbaZ/3Bg60
 P7CBIvzll8MBI2LIxsdDhYew8X/shcfRdsDZ/ATPQ9yMUWr61znhZPkLV
 4mVfnun3YhwVH6XwPPpk5r6yartM5VeP9dJv0le+7DoQwSfD2pXiYQwVS
 syvebPHv2eyXgdDxM9a+oGOvGoOI+DqD1RXX21VDjj5vT6SH/XyJhXthA
 0hGW0t1BsvhT2Vqu+BweHqecut1kNkyCB9nMu/UONZr1Qb8d4cxqKKoMB Q==;
X-CSE-ConnectionGUID: kQc/nAv4T3OWMIsNxq/GvQ==
X-CSE-MsgGUID: 54fPDRjwTcK1ytbaG8SnhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="27116427"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="27116427"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:19:47 -0700
X-CSE-ConnectionGUID: IKldkV+rTZqnp+Pe0gwsKg==
X-CSE-MsgGUID: yBDztFk3R6++94nsRUEgAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="63141525"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 01:19:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 01:19:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 01:19:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 01:19:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PxI4dxtZRw8099R2Se6ceID5brElntDVBfHzpM61/tQHaR2gDB5DKFDu2BKEpWu89G0tmq2In8WMgdyVU4r3yMlzQi8CWLgyRMVO1SkFjj0+XowuuE40VLJacJJ7Zn+aG47A5F5iFMvXH19htvs1M5nATyLiW46gxzogXQMQDuBmJwZeloreIwtUpuszwl3aJ3bIA2itDcINIg+bO/zHhlndG1DoEvqrCPRYuk1RMOWiAMnt8dUGc9var71c8h8IapQQwXh/afosQqIcNvM+QHXaaewX7+wgnDcvdmYiRaCj3q1Ww18f1cyb7aT+rVngfTGmKOfGXojScbIxp2g4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ndhd3Wov1hMNn+AW0eJWSTh3PId7VFT0KGuRU7xD85k=;
 b=DYYeMXS6a32NcNO3Njm/z8mywPOTILbvRrCQUiCLnQsmfNsQoFteE1Xm8jGGUzs11FnDr7kSuXdt3xoKu0xw1Dl8ZhEB5mcz/odHX77jgn6IYNmoctA48IeLl6+XoftnTwRZPyEA0ZRo+n5KDKTstURziQrWIZmMa8RPZ0ZcL4uT9b89o1EQI5qtfRqOnlQl0x0CX4hyFo5AgLEpNZdvFtNzepFR8IMcks4Sv5zTzgWGV8itOkdJmAJOKfsFTjtn876fcfIh//T7agsESDzgHr9o3wkyxeFH9+DdPBNakcrGlqNdAju2an2u+c1IBx1O8SrfDat2HwuYW0k3clJKNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CO1PR11MB4994.namprd11.prod.outlook.com (2603:10b6:303:91::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.25; Wed, 28 Aug 2024 08:19:44 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 08:19:44 +0000
Message-ID: <ceeb9f52-098f-4ec6-b9e2-687c3428d134@intel.com>
Date: Wed, 28 Aug 2024 10:19:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/lnl: Only do gpu sys page clear for non-pooled
 BOs
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240821095035.29083-1-nirmoy.das@intel.com>
 <0ce411f42af6e94514810825f3b4626c5d06fae9.camel@linux.intel.com>
 <1bcc95c37a431932bd2e641b23d41e7c8fd90524.camel@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <1bcc95c37a431932bd2e641b23d41e7c8fd90524.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::17) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CO1PR11MB4994:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c82cdfd-0274-4a28-b172-08dcc73a2bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUkzMFVHQXZhbjVDQnFKcThhNU5TamVnSVcrUTY3dmRpK2VleUd5UDYya1Zj?=
 =?utf-8?B?bGNLZjl5bHdGUEVkK2R3aVQ5U3VhUVIwQms4ZGJPQlY1TnkyelVTUURRT09j?=
 =?utf-8?B?LzRjOU1LRUFCbmxJU0xYaDY1WlNMZDFLZGw5RzAwWEVnVHI5cFBpOGFmMDUw?=
 =?utf-8?B?OC94SjZxRkFsMXFtVHVkWnZsMVBmUVRFd09tV00yNmZrZlNIdGpucGFuNE1w?=
 =?utf-8?B?OXNlVGJ0M1loZ1FINS9VUStkWUxTT3RXU1FmK010YTZEZ2pkdGZBaFR1SHNh?=
 =?utf-8?B?NkcvemdkY2JNbi90dFdiV0o0MjJWSzdMaWFHRWpSWE1HQ3hJZ2h1cHFJSDNR?=
 =?utf-8?B?NkhBODVmT0VQREtSbTJEZXNESU1xNzVnUGMwOFVoNFJLbk40Mk4xMUgyTFBx?=
 =?utf-8?B?Zmx5VC9IdlFvYVZkVjFFa0xYWjc5T2xXNTJ2emtSVlJLTVM0MGsvbHZwTHZH?=
 =?utf-8?B?TmJvb3pWTXd0bFlsRzJDMzJpa2FZcDVrT2swQVpYQ2txRVQrc1p5eWRUcnll?=
 =?utf-8?B?QVBvZGNpdnRycVBJZHJ3YmdPQ29Lbk0xQ1kyb0pCNnEwWGllb0NnT1NqbWlL?=
 =?utf-8?B?WTFhdmIyL0JheGpDNjFieEZZOXZkRVpvQjUxeVZ1Ylp4VytZbVcrcVdPajB2?=
 =?utf-8?B?V2t0YmdvSTVMVGExNjhTNmtackNrbHQxTDE5WUZVcDFNcmJQVmVIVDV6dXdq?=
 =?utf-8?B?Sk1XMGNFdldUM0g0eVdmMHBUNTd2RUM3eDljTmtaUWFjZGNHM0tMdUFvdWgv?=
 =?utf-8?B?aDJ1clVUbk1BMHRweHRsUXBCMSt2eTRBN0E0amptbWV5MzJMUkdHTUFucmVF?=
 =?utf-8?B?M05TenArVW9EdW5OVHBwVEp3NGsvQTAwd0VsRVJYT2VUMTIyTGxSMkRmMmd5?=
 =?utf-8?B?OThkWjM0UzlYSXZRR3dGRHNiMXNqZGFzdUUwbTByRW9XcVdtUmc2L1p2aVVU?=
 =?utf-8?B?RjJJc0dFdXU2QlZzUnNsYnhtWUZoaFZFZE81ODVaRlRkOVAwRkpBcXhCTEJu?=
 =?utf-8?B?QWEvWlJ6dno2UExSQ3hLZWpyejRmYSsrNUlsdHJOZmVNNk9OK3pUY2xKdm5E?=
 =?utf-8?B?OXFzZWxzcEQ1bEJEYVV5RGFYZmNNbk96MW1ZTHlRTXVOK1RxUDE4Mmp6eU9M?=
 =?utf-8?B?WksrRUFRRmY5NXkwbG1iTll0Mk5rQ1dFUmF6aXpNQUlDMFJLc3M0RS9kVnY4?=
 =?utf-8?B?SXRqS3NWVUVXZU5rVHdxSFNhbnY5UElBTC9seFkrSWo5TDkyZ3FFdXRaUGcx?=
 =?utf-8?B?Vit3TFRndzhpenZNVHh2Q3VsVWI4Ynl6T2F2akVPV3craVNiMkEyN0lrdTlr?=
 =?utf-8?B?QnZXaUwveGlvTFoyRjZyOXBBK2pTZG55cjdVczN4R01uRHgrMjVkZEgxeUtU?=
 =?utf-8?B?dERRRGt5bXZCQ0hsNndtU1dMd1hkU24yKy9jclZlQUJCZEVpVUQ1aS9vWXly?=
 =?utf-8?B?NzEyNG1DVk9FcDNPY0hQd2EzaGRVQ2NSTi9zNGhlYlBqeGRML0FySWlpaTh4?=
 =?utf-8?B?TGF0Ynh4a1JRK2ZLL1pLSGFrbWNpeGZyUUowRlFSRXJ0ZWVRYzZvWVMrY201?=
 =?utf-8?B?OWl5WVVxcjZEZFFyT2Y5Y2c1TWZEYm1ib0E0blNMUUp1M2NxOEZaQkV3aDN6?=
 =?utf-8?B?QXFnUTVHbkZEZHhIOHlhNU1Cb0FJNU5JR2k0WkJnSmI1Qy9yU3RKdnM2dFNt?=
 =?utf-8?B?SStlMjZrY2VsYmhnc0o3aEp6VmlWZGFTTDN0d0p2UEsvUmw0bjVIV1VROG4w?=
 =?utf-8?Q?otn0emhDqlSrBSXe5A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjEyOFpxS2FVa1lTck44N1hWVDJISUU5SWxBM2JrTTdUQXJiT3JjUGZYaklh?=
 =?utf-8?B?MlIrTjZYbHIvbUVtNHkyZXhSb2U2QWk0NTdCb2o5MDhKakdIMlRkRzBFYXYz?=
 =?utf-8?B?b092UzJvS25GRFV3RE9Hd0NSSm0wdFpyeVl2MGZEUUVLMCs0UGQ5Y3UyZTdF?=
 =?utf-8?B?QXk1TS9oQUE2WExUWW1JOHdxSXBiUVA1U3dNbW1PelY4QmlqN2UyWXNNNC9E?=
 =?utf-8?B?dUhPMGJkZjZnTEhIVUdmSEcxWUw2bjFDQ3F5R25henZOTlkwSmdBNWZ4dk1h?=
 =?utf-8?B?L1VYMnpvU2cvVG1SMlRQSVNOcUl5eVdlQXFLRUNWWmdRTjhCTm95ejBrcDND?=
 =?utf-8?B?UVlXM0g2RCs2YzcyTEVKU1NCRUlsSkRMUkY4MXM1V2xXeEsxc1JkRFJraE5P?=
 =?utf-8?B?UmE3TW1ZTUJUcWVVeUNBb2hqZU10TzBqaUJ4dFAyQTlrVnpST1ZVMVZPSzhU?=
 =?utf-8?B?UkxkMEl4dzFwYWtZQ2JWQm9XUGVmbXlkakJrcHl5K1BWclB2YXNxYzRWaHUx?=
 =?utf-8?B?ODc3SElEYnRCcURaOG1ZaHpSWXJsTmZFU2JSSGlQTVdueE9XcitXMlJ1TjNn?=
 =?utf-8?B?d09USWlOSTNhL0RQeFp6VVFWSVg2TXZsTXQwQWIyLzFheE42SG9LV25NcE8w?=
 =?utf-8?B?U3E2WE9VQzIzaG1hdVJoVnNYdWdPaHNPU0FiK2tUVVlvdTE2NEJEWFpENTNN?=
 =?utf-8?B?OUlrbnhWa1Q5d2pUQW94K1dHWit4bFk5ZUc5Ym1qb21DRGh5aitkazJWVG9G?=
 =?utf-8?B?TjRuN3hHV0RTZ3JtTkczYnJYU0VBOVgzL0w4R0h5TEVhRFQzOGNzdVg3ODNK?=
 =?utf-8?B?MlpMTFViK1k1TDBCYzl1bGZOV2toZU5Eb0I4Nkx1ZTVrMnIxd0pBbC9CSUdM?=
 =?utf-8?B?OHQwRzVxQU1rYjRpeTRldnpJcjlEWXBTL0hsZmt4M3lDdHZqcUk4VEhVTEhz?=
 =?utf-8?B?NTY3MmVubHFLVlpNWk1OUk93RzNTZlhFWDJlbnVpY0gwMS8valh3Qmw1eS9O?=
 =?utf-8?B?Ym1Cdy9GTktSQ3A5bExXaDlkQlE0dUhLQkFxNXRBeGVVN2hrNVdMdXd5OWxL?=
 =?utf-8?B?TVFzL0kyUmlpRnZZU1Nzb3FFMXE3dGllclFmMTJZcUluME42MlVuM1RPZERm?=
 =?utf-8?B?dkVBZHZ6TzlQM1VTZmhvQnRKRlBmWVY1TzhHRVY3Wmt6T3VsV3NqOVFGNkVL?=
 =?utf-8?B?TjNWaUJOeDBGeGR4YmRUcnVNUU1TVkRoTDlLZ1BSQnoyUGU3S1NQMEpaQ2Zq?=
 =?utf-8?B?TXF5MW03dTBCbkhSQitFQk04L09wQnRodFpqcFB5YXNBaVFJTHdmRllxZzZ5?=
 =?utf-8?B?ekowQVRLdFY5SmorT2RoZ1VkSnZHc3QxNjJadjI2ZlJPejFvaVh2L3RxOGk3?=
 =?utf-8?B?UHZ2TGQzOG5iZ3FwWmU3S0tZc3V4UjdiMXlhR0RJb3owVTcvTmtyb2ZPWDB3?=
 =?utf-8?B?V0RjZ0dma3VCelhQaW1weGhQTUYrUGRDOHkzZlU1K28vdThkT3M3ODQ5bDBq?=
 =?utf-8?B?WjNTTnhwQXJ0RlZBNG1uam9OT291UHFXTFpyMUhZOHVUbGduaXd1azVtTGZU?=
 =?utf-8?B?WFNXM0tRczRkcXh1b2toRGRmYWVxTTlBRkxvRTdlQ1ArbnU2bGIwaldnWHhH?=
 =?utf-8?B?akd5NllTeE1SMkVYa25FY1lXaUFlUTV5MFJua0Z5OGdFdFZ2aUF1b2wvaGd5?=
 =?utf-8?B?TFduYWcySWVOYTM3cEY5YytYb0NJRFh2UFY0b3U3S1N2eENKbWkyb2FtL3Q2?=
 =?utf-8?B?MFlGUjBDSmxxSXRwU2VEOFZHQmtDK0lGbkttUDFERituczl3UHEvY0IrTDFK?=
 =?utf-8?B?TDE5L1RIVUpvREllTHVVaFFsdW5CdnFoMVZSMSsvU3R4RzZYajZNUlVJUFFz?=
 =?utf-8?B?WWFLekRWbU16MEppbGEyV2N4OU9PVFh2VU5IUklIeXNLV0lBTy8rUjdDczVo?=
 =?utf-8?B?Z3NxWXE5UXN3cWNUMnN0aGlaSFFTTGo5RzFVL3FibUZYMHVGQlNRVFBTTnRZ?=
 =?utf-8?B?WlIrWGpkMC8vR0lZK1Ywak4wNmN5anhSRzh3bkl4OWNSZ0FzMHVoMlNOSjlM?=
 =?utf-8?B?RU0ySUN2UzlkNWR2WFB6QkpieVJ3Y1ZBSDhPeGdnL1JDYm5hVHdIZThkWEZk?=
 =?utf-8?Q?OILbwJEqE6CsHczBTrZ8BQdao?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c82cdfd-0274-4a28-b172-08dcc73a2bd0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 08:19:43.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAB9bAPqD2kPJXxG9pfkQgH0+wfcXIv+54kQT6skELkFCOlT9Tn2AJ6buQ3nKfw03VwSrbIpIy1z3alIwlA4jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4994
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


On 8/28/2024 10:12 AM, Thomas Hellström wrote:
> On Wed, 2024-08-28 at 10:09 +0200, Thomas Hellström wrote:
>> On Wed, 2024-08-21 at 11:50 +0200, Nirmoy Das wrote:
>>> Currently XE lacks clean-on-free implementation so using
>>> TTM_TT_FLAG_CLEARED_ON_FREE is invalid. Remove usage of
>>> TTM_TT_FLAG_CLEARED_ON_FREE and limit gpu system page clearing
>>> only for WB cached BOs which are not pooled so there is no need to
>>> return a zeroed pages to a pool.
>>>
>>> Without the patch:
>>> api_overhead_benchmark_l0 --testFilter=UsmMemoryAllocation:
>>> UsmMemoryAllocation(api=l0 type=Host size=4KB) 79.439 us
>>> UsmMemoryAllocation(api=l0 type=Host size=1GB) 98677.75 us
>>> Perf tool top 5 entries:
>>> 11.16%  api_overhead_be [kernel.kallsyms] [k]
>>> __pageblock_pfn_to_page
>>> 7.85%  api_overhead_be  [kernel.kallsyms] [k] cpa_flush
>>> 7.59%  api_overhead_be  [kernel.kallsyms] [k] find_next_iomem_res
>>> 7.24%  api_overhead_be  [kernel.kallsyms] [k] pages_are_mergeable
>>> 5.53%  api_overhead_be  [kernel.kallsyms] [k]
>>> lookup_address_in_pgd_attr
>>>
>>> With the patch:
>>> UsmMemoryAllocation(api=l0 type=Host size=4KB) 78.164 us
>>> UsmMemoryAllocation(api=l0 type=Host size=1GB) 98880.39 us
>>> Perf tool top 5 entries:
>>> 25.40% api_overhead_be  [kernel.kallsyms] [k] clear_page_erms
>>> 9.89%  api_overhead_be  [kernel.kallsyms] [k] pages_are_mergeable
>>> 4.64%  api_overhead_be  [kernel.kallsyms] [k] cpa_flush
>>> 4.04%  api_overhead_be  [kernel.kallsyms] [k] find_next_iomem_res
>>> 3.96%  api_overhead_be  [kernel.kallsyms] [k] mod_find
>>>
>>> This is still better than the base case where there was no
>>> page clearing offloading.
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Nirmoy, is it possible to split this up into a revert and then added
>> functionality so that we could quickly revert the security issue end
>> then add a separate patch that is an optimization?
> Wait, I see now on the list there's already a revert patch. Let me
> check what's actually pending review.


Yes, sent out https://patchwork.freedesktop.org/series/137855/ yesterday 
which should be easier

to review and merge. I will look into the page zero offload later on 
because for LNL we don't need to

clear CCS for WB and pool backed BOs doesn't have much alloc latency.


Regards,

Nirmoy

>
> /Thomas
>
>
>> /Thomas
>>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c | 27 +++++++++++++++++++--------
>>>   1 file changed, 19 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>> b/drivers/gpu/drm/xe/xe_bo.c
>>> index 6ed0e1955215..a18408d5d185 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -283,6 +283,7 @@ struct xe_ttm_tt {
>>>   	struct device *dev;
>>>   	struct sg_table sgt;
>>>   	struct sg_table *sg;
>>> +	bool clear_system_pages;
>>>   };
>>>   
>>>   static int xe_tt_map_sg(struct ttm_tt *tt)
>>> @@ -397,12 +398,17 @@ static struct ttm_tt *xe_ttm_tt_create(struct
>>> ttm_buffer_object *ttm_bo,
>>>   	}
>>>   
>>>   	/*
>>> -	 * If the device can support gpu clear system pages then
>>> set
>>> proper ttm
>>> +	 * If the device can support gpu clear system pages then
>>> set
>>> proper
>>>   	 * flag. Zeroed pages are only required for
>>> ttm_bo_type_device so
>>>   	 * unwanted data is not leaked to userspace.
>>> +	 *
>>> +	 * XE currently does clear-on-alloc so gpu clear will only
>>> work on
>>> +	 * non-pooled BO, DRM_XE_GEM_CPU_CACHING_WB otherwise
>>> global
>>> pool will
>>> +	 * get poisoned ono-zeroed pages.
>>>   	 */
>>> -	if (ttm_bo->type == ttm_bo_type_device && xe-
>>>> mem.gpu_page_clear_sys)
>>> -		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
>>> +	if (ttm_bo->type == ttm_bo_type_device && xe-
>>>> mem.gpu_page_clear_sys &&
>>> +	    bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)
>>> +		tt->clear_system_pages = true;
>>>   
>>>   	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching,
>>> extra_pages);
>>>   	if (err) {
>>> @@ -416,8 +422,11 @@ static struct ttm_tt *xe_ttm_tt_create(struct
>>> ttm_buffer_object *ttm_bo,
>>>   static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct
>>> ttm_tt *tt,
>>>   			      struct ttm_operation_ctx *ctx)
>>>   {
>>> +	struct xe_ttm_tt *xe_tt;
>>>   	int err;
>>>   
>>> +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>>> +
>>>   	/*
>>>   	 * dma-bufs are not populated with pages, and the dma-
>>>   	 * addresses are set up when moved to XE_PL_TT.
>>> @@ -426,7 +435,7 @@ static int xe_ttm_tt_populate(struct ttm_device
>>> *ttm_dev, struct ttm_tt *tt,
>>>   		return 0;
>>>   
>>>   	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear
>>> system pages */
>>> -	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
>>> +	if (xe_tt->clear_system_pages)
>>>   		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
>>>   
>>>   	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
>>> @@ -664,6 +673,7 @@ static int xe_bo_move(struct ttm_buffer_object
>>> *ttm_bo, bool evict,
>>>   	struct ttm_resource *old_mem = ttm_bo->resource;
>>>   	u32 old_mem_type = old_mem ? old_mem->mem_type :
>>> XE_PL_SYSTEM;
>>>   	struct ttm_tt *ttm = ttm_bo->ttm;
>>> +	struct xe_ttm_tt *xe_tt = container_of(ttm, struct
>>> xe_ttm_tt, ttm);
>>>   	struct xe_migrate *migrate = NULL;
>>>   	struct dma_fence *fence;
>>>   	bool move_lacks_source;
>>> @@ -671,15 +681,16 @@ static int xe_bo_move(struct
>>> ttm_buffer_object
>>> *ttm_bo, bool evict,
>>>   	bool needs_clear;
>>>   	bool handle_system_ccs = (!IS_DGFX(xe) &&
>>> xe_bo_needs_ccs_pages(bo) &&
>>>   				  ttm && ttm_tt_is_populated(ttm))
>>> ?
>>> true : false;
>>> -	bool clear_system_pages;
>>> +	bool clear_system_pages = false;
>>>   	int ret = 0;
>>>   
>>>   	/*
>>>   	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path
>>> when
>>>   	 * moving to system as the bo doesn't have dma_mapping.
>>>   	 */
>>> -	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
>>> -		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
>>> +	if (!old_mem && ttm && !ttm_tt_is_populated(ttm) &&
>>> +	    xe_tt->clear_system_pages)
>>> +		xe_tt->clear_system_pages = false;
>>>   
>>>   	/* Bo creation path, moving to system or TT. */
>>>   	if ((!old_mem && ttm) && !handle_system_ccs) {
>>> @@ -703,7 +714,7 @@ static int xe_bo_move(struct ttm_buffer_object
>>> *ttm_bo, bool evict,
>>>   	move_lacks_source = handle_system_ccs ? (!bo-
>>>> ccs_cleared)
>>> :
>>>   						(!mem_type_is_vram
>>> (o
>>> ld_mem_type) && !tt_has_data);
>>>   
>>> -	clear_system_pages = ttm && (ttm->page_flags &
>>> TTM_TT_FLAG_CLEARED_ON_FREE);
>>> +	clear_system_pages = ttm && xe_tt->clear_system_pages;
>>>   	needs_clear = (ttm && ttm->page_flags &
>>> TTM_TT_FLAG_ZERO_ALLOC) ||
>>>   		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
>>>   		clear_system_pages;
