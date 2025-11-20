Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FE7C74015
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 13:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB9610E294;
	Thu, 20 Nov 2025 12:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUS0M4Jt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E163E10E173;
 Thu, 20 Nov 2025 12:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763642428; x=1795178428;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=y62bSidFLj4fqSMO33+xEJA7nerP/KmH4nx3r3ne2C8=;
 b=dUS0M4JtBHSQrItIbzuC4QYbq+fP8/OPw8XetYa7iMRguabF4/EsdsLn
 S9f4iHfpql1RKPwAzAvLLKVamYDBlCB9aeN49cvpygPc8bTgX4csTJJuT
 +19x75btms+/60Bady45jA20d+Uar4dOQWOlNzcaLUxfAtUTnsU7rl8vS
 jADJiSU64mzmJhUDxR2Wer5KOPOTyN2Tf1kPgwjW/oYDfk0XVGDpTiGt0
 LGvW4sfuLEXQuDsxQj8n7ocjHDfNdBZ8duvljtW9jaMQ4rIvAMU0wNpVg
 lq5eLSIq6flppLsQGF0ScxjyAz02e2VTbtCHyjFkk7GuHMF5cAYOFMkUl g==;
X-CSE-ConnectionGUID: OMAbgGX9SFiD3ISmoflKGw==
X-CSE-MsgGUID: d6dfhVgoQPiXAzHmReaPxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69565499"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="69565499"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 04:40:27 -0800
X-CSE-ConnectionGUID: l5eN4PA3RuyLAFKa+Ufo3g==
X-CSE-MsgGUID: T/7gPNK8RoiQ5mzOLKLW3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="196325732"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 04:40:27 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 04:40:26 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 04:40:26 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 04:40:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6rs7m18jGRicq48CoSZlVEH0HuTMsbTYcs6ELLFe9dlGCa/MyrRpmnV42INJ6ulTu90W6EuJpDPjk7F/9va+P92JadlB3IlxZfzqSx9abszqZiT8NEIt/mc6+WBI37Otlan+fED86/ID6H5HcAM/MWhkmthc5eHkX+MrWKUKPhotCzxwpqivOAJvH+zG+4237b79YjI6Xi/7Ga1dg5h4Yyq6Fj3a9mbEoaZsu1gDXhamS5BEf+oNINGuW/eXeMiveipH8cCgBawP21ntX+kmoKgGWLp7aaklvX442sinOhWlVrkAd4jZAN3fqNJXahl5xNHpWm3w64DXkane7hZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o87SLbhKg/14Zo1HKjdWR2O6gFz+ni0tPfvH6uOHpTc=;
 b=WFQyo+Zc//w7Q0KDU6pciytvZxTupa2vpaCtjGY5DoaYL3XM4igiskmgSKkKpIVqbMLEtb9/BUnA0hZKl/HHn/3Cx+LGMP9jZTaWu7+E+ip3uS/ipLbcDzCIdTnUG8G/zArZUpIXZUiFnznu9hWnJ37dsjX2G5sFJDODglZH6yL4JyYFVvsEV7I7E6oLisVCcvFlx9bZdPDPOVR5WxcggbQw0cx2v9Olo/BYs+mq46kMIem7eTp+OCAkyO0EIo+cuTdgDOHPa3Q25fKKYZIioTfzrosiwLHMqS2//OnI6PvtsLeWoHYbByxwIg7kcLn13V8kKqxm2sG8IvRXkZ0AMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6031.namprd11.prod.outlook.com (2603:10b6:510:1d2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 12:40:18 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 12:40:18 +0000
Date: Thu, 20 Nov 2025 13:40:14 +0100
From: "Winiarski, Michal" <michal.winiarski@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: "Tian, Kevin" <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, 
 "De Marchi, Lucas" <lucas.demarchi@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 "Shameer Kolothum" <skolothumtho@nvidia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Laguna,
 Lukasz" <lukasz.laguna@intel.com>, "Christoph Hellwig" <hch@infradead.org>
Subject: Re: [PATCH v5 28/28] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Message-ID: <5idiblmgmuervob3inen2abfkwmru7aqrqmzjmg3jyjqfhdsig@cokyf522niow>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
 <20251111010439.347045-29-michal.winiarski@intel.com>
 <BN9PR11MB527638018267BA3AF8CD49678CCFA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <7ig24norebemzdih64rcpvdj22xee23ha7bndiltkgjlpmoau2@25usxq7teedz>
 <DM4PR11MB52784CBB6C5AF6F19E373A278CCFA@DM4PR11MB5278.namprd11.prod.outlook.com>
 <ndd4kt4elbm7ixzyouhorgatjwv73ldyjo6bmrbipxvaqzccjs@ssavf6b5ric3>
 <20251117174117.GD17968@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117174117.GD17968@ziepe.ca>
X-ClientProxiedBy: BE1P281CA0439.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa44755-f7f9-4a1c-f941-08de2831f583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm1pcktYcjlGM1lGd3FkY2dsSXdOWk4wdUxpbVd0K2s1SG1KckNTSktady91?=
 =?utf-8?B?Z0U2MXRzbEliRXpBdHRmcGxsZXZnSlh5d25aUDFIdElzWE5LRnFCNFhvQ1Jh?=
 =?utf-8?B?VlBKbklLQWlqVkZWbG9ITnBjVE5heUM2Rmx5ei9ia0Y0M04xOGdOMjN1ZHZV?=
 =?utf-8?B?eFdYV2N5bUVzSmpVcXQxZEQ4MzBoR3NzRWJOazY0MnQzL29XS0ZhVVJyU1Zw?=
 =?utf-8?B?MEhzZEVETUFORXJRWXRoTTduYzI0THhJZGtQbHA5WXgrQ1VRakRiK09RVEtm?=
 =?utf-8?B?NVNYTm8wQVdjSEdrem1JdSs3d1NzakthUjhQNVIrV3dDZysvV2plNXJCejlY?=
 =?utf-8?B?UHlod1VjUlY0VWtweVBFU29DTVVQeEhzcFhVczlacXI4bUNsQW8xYnNmL2ZU?=
 =?utf-8?B?UGd2a0JZRndCbmVXaStWQ2VmdVNiUFliWjljYkpPNElKMWorLyt2cU5IYjN5?=
 =?utf-8?B?QzNjRlU5ZDBmaHNqNFF4SUVDR25lRGRLd2lwVGt5OEZpN1lyRUkyMWRuMndF?=
 =?utf-8?B?MldjT2ZZTGVpK3JsV3czcEZIUHRQcFBtU2dYdnNkeDlKNVhuaXI0dEhXMXk0?=
 =?utf-8?B?VGVoaGhxbVo1bU1NRDRSaXZRVFBwTVc4dEpJWWRPU3dTVDBxMmYvY2lnZWFD?=
 =?utf-8?B?Vk5ad0tERmtIS2lYbm51c0VkYUo1Rm1VR0s1Vk9jMFVwMDB5MDVCcGtoMklJ?=
 =?utf-8?B?WWhQNjhGaUUrb3pPc0xQaWJXdmYrM2RiaGdWcnMyOFhET0RCNWp1QlBnTHBT?=
 =?utf-8?B?UWdkbmFsSmRTdjFLVHB6eGp2Q2xLcjQ0ZW9kbGN4K29sNmRkVFZETWRvckF0?=
 =?utf-8?B?dmJhYjBpOE9ZMnFoSE4xd1R5NnVYY1NOTEFRT25hS2s0QWU5RlczRjN1Rlpw?=
 =?utf-8?B?SHQ3a0tHOCtIMXZ1WmkzVElPWUREby9uSXpFK3hqM1dhK2RlenR0dmlkN2g0?=
 =?utf-8?B?RXpYRFdKdFhiVDlTRE1mWUxseW1ENmZtMnR2MktydGdhaTh6UUdYQ1l4NnVT?=
 =?utf-8?B?b3pVSGdwdnNPY0Z5aXNrSUFKOXE5NmVXUmI1OThWTURKUkliRzU2Y0dIZFpa?=
 =?utf-8?B?eUtIM01uNHA3SVN6bnJyYkRtUXAwdDJCN3JscGFic0xZdFpXMVhmaEh6MTUr?=
 =?utf-8?B?YVAwVll0Z0ExY1F4bDV0U3pNem4rZG5TZlI2RWJqbjNNQ21BdkFUK016LzZm?=
 =?utf-8?B?cHJneWlQZDJUWllXUFR4V1B3eEwzK09sU1dmUHk4Unh5cVowbnFtNmQvbFRG?=
 =?utf-8?B?MlgrSFd4SW1SRy9ndWJ2ZFNMTnZVcUR1SWU4VGxxUnJPVmczb29WSWk0T3RB?=
 =?utf-8?B?SmtoWlB0SnlRRjdGTUdTT2t2Ri90R0NOTUN6a1BoWHhHdk1uU251WTJRQmZh?=
 =?utf-8?B?WlJreUhieHhuZURaUFhQdTlsZ2FVL0JIdXluRWlWOXlxcWpKY1p3OHN5NnZh?=
 =?utf-8?B?VlFEa09xWFp5NzdTUGgzblRhTENaeWVpTGNXeFBoeUFwVjh3d09mN056Mm11?=
 =?utf-8?B?TTFUSWZFd2hIby9zaHdXTThYd0drdVpCQmdFSjk0a280VDRSejIxYjRRZ2Ny?=
 =?utf-8?B?TUs1Zlh4ZnBKbUk3cFdKSFNQOHdrYmpvYlB5eTBLK1JhTmJoOFptc3E5cWV1?=
 =?utf-8?B?WnJmVEFJWjZ2alNCcFp6UmVFMEFFRi9kdGxxeVdhTHJaY1N1UHpDZVdJTm5S?=
 =?utf-8?B?T0VPWUFuM21aUFQwS05wUEJBU0NUZUJBMXgyOFFQQm43aEhHMVZIaFNBRzh2?=
 =?utf-8?B?aHA4QkpVMGQzdW5zWGk3UUE5Umd2V3M0ZmxMUUpWWEVrc2toMk41OGkyNkZv?=
 =?utf-8?B?Uk1OZWFCTkY0clhxM2NnODg1NmN1ZGI3MGdoVlRxZVp5Y0E4N0FFWE1mUXVw?=
 =?utf-8?B?ZWpjbS9FZGVCL1lIbThPaWxNd1JZeVNBOEI0S2paSlFGQjZMT2xWY1FWNW9n?=
 =?utf-8?B?MTNVa0NxZDNNUHBBclkxTStHQUdpOVNCeUl1QldFNkZIUEpoNHh0WmpoV0Iy?=
 =?utf-8?B?SGJzalMrMWNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVB5TTdjYzExM040UnlwaWw3cXpBQ201NWFTMTRndm05YmlBTDQxZE42NnYz?=
 =?utf-8?B?Nlh4MzZwblIyamJkY3VkVU42aU0yQzhCa2NicVlzdXl0R01DT2phcTBaZEdK?=
 =?utf-8?B?RUlXWlZ1SUpNSHJQOUpuL3RhNUJneUxhc2duV2hpVnF6Z0Eyc2Z0aXhLdW1L?=
 =?utf-8?B?NjBRdktWT0tRTzBSNE9aRnZXQ0ZNSXhkaVBWa3NLZUJqcitZOGVZT3lYeXVC?=
 =?utf-8?B?OFhYSEZXR3JzTXBhNGtrVVVkMGdLQk8vbXlWc1RyOElGYWErbFBBTllmQzhT?=
 =?utf-8?B?UjJmZjRJK0dzSFFWcm5UVm0raVdkdmt4cERDRFBFcG9zQThqV3hrc0wxa0ty?=
 =?utf-8?B?eEZlZHJCbEMrV2M4ck1tN1JmaFBkRjZ2alRJWlhOaFZUbmRnQVRUY0w5MGJs?=
 =?utf-8?B?QWlVVW02RU9xNFZpNnl3ZGw3NDdaNGVwY3luM1cyL1MySEJJK0p5anpTUDZJ?=
 =?utf-8?B?TzNVS0RCQXdWQklZd2FWQmFxclJsOVFiNGNzazhqN3JkSHNkdVZaVUltUktM?=
 =?utf-8?B?b096ekR2emlLcFlWNzFzaDcwYWtsWHgwYmZCaTQ1YWhYVlVhZHBqbnJ2Tkc4?=
 =?utf-8?B?SWZQdGJoUXBNWjVLdllPSTJoekhoK213dW5yOG5mZVZETVRQL1p4MUJCeHlx?=
 =?utf-8?B?VEJ1UGdTdVUyYTE1L0dWbEtKZ054WnpZenpyM01iN01laE4wbnc3UlEyT2ZB?=
 =?utf-8?B?N0N5ektmS09xZmVGWFh5ZkJDN0ZuVHUva1BES2ZKZXFVT0g2bVJMb0phc0ZR?=
 =?utf-8?B?RjAwZjBDeGNRSWRnczBENEl2aFhTVHIwb0d5bDRNRWR6dVlkZWJrVG9NZzJr?=
 =?utf-8?B?cFFhM0UrQ3Q1bjZQN0oyMmtDRUxodWY1S0JxRlQ3TXVpMmxPTmR0YWIrVFU1?=
 =?utf-8?B?c0FOcnVYNm01NFAxU3RHeEYwMmFMbnkwZ3VjL3c4Mjl6cWxSb0xqMjE2b0Fs?=
 =?utf-8?B?KzVJRk1ENmRvTUR1NDk1dStBOGduUUMya0o0Ulk3U0NPYWc2QnZlcDFnZ1Z4?=
 =?utf-8?B?cW40MmtyWVZrRTM0NmpVYjBSRklYV2h0Mmk3MG9LN2llaC9PcDlKR3JFdVdj?=
 =?utf-8?B?ZEs0QzN6SHM3MTgxMS9wTFhXTnV2d05BNm94K0NWd25GNi9YeElsemhzQmZK?=
 =?utf-8?B?Q2p2Wjd3M1lpS2JZOHVEV29GdVhVbnd0RGoxOUZIenEwNnVsQ01lWnZIRVpX?=
 =?utf-8?B?KzducVN3R2g4b1dkUE1UaUhTTVFNaXJ1U3IxWk8zUzBRVjhVUGJHb2RqeDdz?=
 =?utf-8?B?TmZDWWNHbXlqWTZLY0dJSXBMQ2JucDNFK3hqdGNxamxwWkpPcDdrUUx1K1V6?=
 =?utf-8?B?R2JHeU5mWjVTdTFpcjA0amNsZTJvelU2WVQ5WTFJVHFtU1JyYkd1TUg3WWNP?=
 =?utf-8?B?cldhVFU0MmN6Q3hDeGluTklhZTFadW5TcnZNUndzOExkYmJ5dEsxUU5YQU90?=
 =?utf-8?B?Z3UxZEM3eEJTNmtiRlBHdkpaRzVUR1hGMEhtbDJFRmh2UGlPUnlCeHE1ZC9j?=
 =?utf-8?B?UlI4KzZTMDdjY3pSNld3SFRDN3dHdW5FdjFuUkx4U05zZ0p0NEJkT1MvTmlT?=
 =?utf-8?B?N1gwNksraFhUMUc4VG4zNStSVDM3ZXFVVGNTbDNLNjV4MEwvcXUyWDIwM2RK?=
 =?utf-8?B?MHVPQXNoeWRrZDMzTFhTYWJtNERxY0NHcHRuZXUvdUZIZExkd3o3STNEbHI2?=
 =?utf-8?B?VXRJOUtobkVEcGZ3VkczaEdxYmcxak1jN1JrZ05CYTlSa0V2cVZFTWlxOXZV?=
 =?utf-8?B?YUJxQnl2aW1hcUdZelF5TDQyNHpuVG84WTRvM09PRHpNWmlDcTRjMVZnbG53?=
 =?utf-8?B?NEtHNEt5ZmNXZ3BzdzVhamZKWTBPR2twaXVWUDRvbjNacjVEN2FrK0JsWEJI?=
 =?utf-8?B?STFzOUF4emVqYk5XUTBTOFBWc3E2SDhYMnA0RjNheDNGeUNSWEYyTlcvTW9Y?=
 =?utf-8?B?Q3RJUmN1bi9rRTRqVEN1MG4zWU9qSGNnWndlVkNmb3Z2dFRUZ0JGTjlIYjZY?=
 =?utf-8?B?ZXdhRUdBbmQzNGFhWGxtQWMwVDRGTzYrT3dXM3N0aG1yU2YwaGsrTzE0NEo0?=
 =?utf-8?B?d3FtRXpqc2JzNGFTVWFWbzFJdUYzSGZMUXRYRURBWVJ4QzVLTEdzL1YxSzlC?=
 =?utf-8?B?U1RQckRSd1NJNlpnT1NJMWc3UFBIZHR4dVd3eHBDMFQ0WXRWRTh4MC91SWRS?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa44755-f7f9-4a1c-f941-08de2831f583
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 12:40:17.9907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApoaX53qn2tasI6b2y7Dz9brUvw25S7lbOKlCEDGKKnEz8j0qs3aqFs89Un1eEL2ONIGXtdXxETsDj0/gWYjwTZVNXycWCNCi1uGLpAQvYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6031
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

On Mon, Nov 17, 2025 at 01:41:17PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 12, 2025 at 02:46:08PM +0100, Winiarski, Michal wrote:
> > > > I agree that it should be done in the core eventually.
> > > > I didn't view it as something blocking next revision, as the discussion
> > > > was in the context of converting every driver, which is something that
> > > > probably shouldn't be done as part of this series.
> > > 
> > > well it doesn't make much sense to push a new driver specific
> > > implementation when the core approach is preferred.
> > 
> > This would generally mean that accepting any new VFIO driver variant
> > would be blocked until core approach materializes.
> > 
> > Jason, can you confirm that this is indeed what you have in mind?
> > Just to determine how urgent the core-side changes are, and whether
> > there's anything we can do to help with that.
> 
> A core approach would be nice, but I also haven't looked at what it
> would be like.
> 
> I think if you post a small series trying to build one and convert
> some of the existing drivers it would be sufficient to let this go
> ahead.
> 
> Jason

I posted a series that attempts to do just that.
https://lore.kernel.org/lkml/20251120123647.3522082-1-michal.winiarski@intel.com/

I would appreciate if we could move forward with the review of this
series independently. It should be relatively straightforward to convert
this driver once we're able to get an alignment on specific core-side
solution.

-Michał
