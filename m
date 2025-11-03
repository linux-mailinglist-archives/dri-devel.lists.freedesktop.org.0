Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131C3C2DC27
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 19:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB0A10E217;
	Mon,  3 Nov 2025 18:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C+5aKu/Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3394C10E217;
 Mon,  3 Nov 2025 18:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762196118; x=1793732118;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sDdenJVQiBju/b4OhhyATNGa7eG0+qiZpAL6R+ldboI=;
 b=C+5aKu/QitCHq5mUVpM71Oco9OtDje8f3kBI3neQ4ci+TMLowTOiONHo
 76Vo07nYw9rxeKVKv80yYu803gwgoTYbMDQVq68lfgqvlG0/mgkMCEJ2h
 E68hXHWbzjoDMzO23PWsqgaa6U6gaADUnrQiaMSww1t/ukBnI3QizP4wb
 7VRY5h678mKImiHpLPxAN6qYv3A6HkAwItkcMqeIEAwxuddJ7cXpf6CHU
 qwLflMURObjWSW3M7ayD1imWnTMb6VTMBxOQsdSJPc/mpVRNZUaJaRa7L
 3vBEImU5lFkVDHTCo11bC1Z3kmOSGgt1+X3yZ7cTMC4cG6pkp4ZAIbEsC Q==;
X-CSE-ConnectionGUID: F3g857R+TZSragBkYj5ezQ==
X-CSE-MsgGUID: JSWlZhEMSQqyczb06m8nXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="89741300"
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="89741300"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 10:55:18 -0800
X-CSE-ConnectionGUID: UgvAbGMWRae5FHISCSrnUA==
X-CSE-MsgGUID: 8saqJka1SIig6P8IN7AcPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,277,1754982000"; d="scan'208";a="187665622"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 10:55:18 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 10:55:17 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 10:55:17 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 10:55:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWrBrGwP3LmHsEmjqSte9Ue/mKnw30+/4MDUaH2CZRYrtcdsT2qXlpZ5AJtchJH9cJoV4etT4u98Xo9w6Qb+7O17hsfIZdapVcx0oW4Kb25xXxmUpHAzFCIMWTKF9q8avDiArk3BCiaxHEIG2ne9dAX/smq/luFwkbDI7YT7s/GHDC+QVh2QoDsdRAGxL7DaJOc0kJrcMu7SS/oeklVvdAr1KJetRa+LX5fdDaqgwERZubCULrvMbJdYFxpUEZuGAVbiGP5xyrLqfUO6ArQajBmt2xQmPCrjC0PBhqoUmlGSx46/nsAwKZy1LJX4PSViBrEOGh9x9FOk3dP9KDeHLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9dJR3qUnKcbn/tK6lH4f/3vAls8fCoPbqX3F0+qaQiM=;
 b=gzfFFRTN3VKiA6vUT2/ShOdWj+t6lFPEry1fiTW1WHZVDMU82+umfaVXtPkPACZC5LUBE2wrAuSGXmLDOTDPpPy6dpuA/Ia9h0PKpBQ8rB+Y96Tw9ZPTlmyqWje4zKR8Bbmh8UHAJktskRRSJCBtcg640+VscCkszYWBKyyRsEUQGHkuTwwjQAwORj+QNnKrJR9sNQJpgnqjhI5eRMWPLaIMWZ0IY3scDCXLIxNXvdlMoXBxFesbNe+0zCkYCqUsG0TCN+HFl26Q/+b45hatWhIWU9AofZHGN5ScmFbAF/Wuyvzfr3QMNKXXHNBoYyGlYBbCRuFqU5d5C4FAjYQ6RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB8183.namprd11.prod.outlook.com (2603:10b6:8:161::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 18:55:15 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 18:55:15 +0000
Message-ID: <0f279cfe-c3b0-44d2-9bcd-82662058d9c3@intel.com>
Date: Mon, 3 Nov 2025 19:55:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/28] drm/xe: Move migration support to device-level
 struct
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-3-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251030203135.337696-3-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: 60f8c498-60e4-48a4-c08e-08de1b0a8642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUNWaWVmNVJ6OTBiSGJYUmxscVhqMHkrQ3JTU3duRmFpdGpLYVY2VSs3YThi?=
 =?utf-8?B?K3Nyb1VaUVAzZjBrY2dZUjdMZFJqRW9UWFVrMWhoU2k2MFVhaDk0QUthWUt5?=
 =?utf-8?B?TmdGcTdjSE9IMjJUMG5RQTR5YXdRendmdXdFTmVRYU8vNGVXb2RPT29vdlhI?=
 =?utf-8?B?SFlUblcrMkhINmNRZFJZOGlrNWdGMHlUb0xPSnBYRDRRWUVzeWdhay9wTEh5?=
 =?utf-8?B?MjYyemllMllhUEUrRkVFMzZlZXZUcFBIMENWd3EveWJOYy9HUENTZkE0ak1V?=
 =?utf-8?B?YUM4TUZDUTQ3eWJLTlNmRm91WFdSdzgxNTBSb3NXd3pMNEtQTi83TXpMenR2?=
 =?utf-8?B?c2hyTlZrR0p6QzJjRysxVVNiejlxdHhlTnlabG1JSGtRMTN6enpsbGlsYlJI?=
 =?utf-8?B?WWZIOFVYMys4SkZlV3V6MjBHb3M4bmh0ekkxT2RKUzkzV3B1cVpoeXFEWTBn?=
 =?utf-8?B?RDRHeXFyMXE1QWVLY2JROXpVeDMzT0V0Qjh5SmVOZ0Y0L2t5RG5vVFY5MHVE?=
 =?utf-8?B?cHlSdjU5cjRtR1FxYWp1QndVMzFUL2VBelVhbm85QlJaTUVaend0MkdyNWRM?=
 =?utf-8?B?dVNEMjJUZHBDN0k4dzJZbldiTWZpOGZMT1BwZUo0N0oxUStXa2xkSmFQY2pE?=
 =?utf-8?B?dDFlNlR6WWd4ODlXNWwxSWlTbFphMERLMDMwRy9kVzRBSXJGRmQ4OWdHSEhx?=
 =?utf-8?B?czZtYVMwdjMvZHh3ZXJGZ1RKSjl6Y1BZdHFMY2Q4MTBVSUttdDhLZFlSS2FF?=
 =?utf-8?B?Z0hOZXRGRWJuQWZNRy9IczJiRzVlaE1tT2tlM1VvTVlFT2xKVmpJUkRqV2pl?=
 =?utf-8?B?UDdpd0pGbWtLckp4OWRmNEc5VEIrbXAxTWdaYWVZNUllY2RoTGljWmpZbm54?=
 =?utf-8?B?dVpvU29nUWl0YUlKZHVQVzY1MXVWNUFDNWhjSE9zV3BRREJkSTRWRXQyM3Fq?=
 =?utf-8?B?dmxnaW56TmxqajlyUFJzU0tXQ0RNbHFDTFRsWFZoNTFrSWJhbFRtQ0Y3RTZY?=
 =?utf-8?B?aG5VQjlnUm9BNnMybEV2eGdHbHhpV0dReWRmK3pPNmhuaGI0QmF4Y0tGaVVK?=
 =?utf-8?B?SEhGM2xSVEVBT3RYMUFOby9zZW9tVEhtWEY1Q2U3azh6Wm5DenJqZU9JM1J2?=
 =?utf-8?B?dTRmSVV5QUp4OGVPMThQbnMxc2tGd1Q5UjlsTmljM1h2amZqSEJua0pKWmZJ?=
 =?utf-8?B?emd2TWpCazNpU2FXRlpPMW82ZVBhQjhucUZoN1hnS2tnYWc3a0thQVlYU0kr?=
 =?utf-8?B?WTdjb2NNK3FZUXBLSENacE9RWWxhWXQyWDQxSnY4Q2l5a1UvSGUyVmNpbCs4?=
 =?utf-8?B?cm1zOGRpTCs1MERNZ3FTRmtyd3BteWgwM0RzVFVyM0ZLS2FVcU81MzNtZGcz?=
 =?utf-8?B?bE90WElxbGR0Y3BFOUUwVmZPR1JaTHEzNXNGWFJxQmhTNGtCY1ZlZG1zZ042?=
 =?utf-8?B?ZmoxK21mSm9vRUZuQU50Sk1Gd0Qrd0lwbm5JNGYvcUEyZy9ES0RYSHl5eHBB?=
 =?utf-8?B?Wkh0RVJ4a0dkMjRMSmhXZ1NUY3RudXRGK1ErSmhISEpGdUlYZFdEV2ViYVds?=
 =?utf-8?B?SjFIOTJDNnkrVXFWQTJtMjRKQTM5c0M1aTJ0NlF5dXdIU2VJSG9SazZkZ3hj?=
 =?utf-8?B?S2ZXWHR0cFhJeTdETitaSU4reTRTdERFb1VXSG1uaVFMRm1iUnE3aGc3Q1Jp?=
 =?utf-8?B?bUp5YXFEdmcyc1FUdURvVFlZNHV4WkdMbUdTSSswcVdMcjQ5WDBFZStXSk1p?=
 =?utf-8?B?ZVJwK296OWlpbU50elNzQlBlalNQbkI0MXpDRFRnTE1OdzFXYlBHTCtrQmtz?=
 =?utf-8?B?RHFQb3I0WDN0ZVVsa05YQ3Y0QW5vTzNLdklvSjZtQXRnZ3lmZlp3ekZPMTBK?=
 =?utf-8?B?OGJlamFSLzNITkorVFNqOHZSSnVWMEJYUnMxVzVEUE5HOTk4dVBCT2RDOEk1?=
 =?utf-8?B?OVBpenhzV2dHRUVGMEF3aEY2ODNYRWJkcEE4eTJFQk4xYnF0YWhRK2UzRnQ3?=
 =?utf-8?B?YWZpc2o5dUliSHJlZ3A2SHNaNllNU2ZlZmxkQ2Nxd0FlUjNRNFZmVjRiYkNw?=
 =?utf-8?Q?fGusBk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K256SUFMTFBTMWZoL2Y0TStncGF6MHVIaUo1ZlluSzZKVVI1ZmViQ1lHeXpy?=
 =?utf-8?B?dTB1S3VzSTZjc3Z1NmQwd0E2cGVmU0VQazAwdFBjUi90ak1rMXN3QXZwRUZw?=
 =?utf-8?B?RGVCRkpQa1J4bndVQkMrVVc2SnpKTCtIKzZWa3EvR0ZacktNNVI3cmpLdm0v?=
 =?utf-8?B?eGhndzRTallwOUZVUEpqcTVnVXhZaWlmaG52OSs1R1pOdGI0WVpCckFmSDNU?=
 =?utf-8?B?d2JjaElTNGQyZ2IvQkV5OGpSOTRxR0RubFVrUDZvNFNjaU5jUDZ6Y2hWK3Ry?=
 =?utf-8?B?bXB2OHNJS0cySUJBQ0xyaC9lZC9USXRsRXc2cThHQm92UnBRZlFyTjM0QW5L?=
 =?utf-8?B?aWt3R0RraUEzUkh6TGY5SEowS00vYmE5MHZRdE1mVFlIblpuR0t4VmZsbWln?=
 =?utf-8?B?d1VDRkZoTzRvUDAvb3hqN2JwNUVSenBXdTdPYmhjRll0S0E3eVFmclFBZ2FS?=
 =?utf-8?B?RDRYWngrRW9JOGI0UStBMGFQUkcvVVRPWW9uWmVsOFIyamhVZ3pyRTZ6WGph?=
 =?utf-8?B?bG1kZzFqTlhLZlVXbUJ5UkZOYnloVncycXRuMmhDWVFVeUZpZ2gxZjlwM3JX?=
 =?utf-8?B?S0JMNEt6cXlqeFozTWNIc2pNVGttYWhxSzZkN21zb1FFU2JMZWxvTWVmTkxG?=
 =?utf-8?B?c3Joc0F6SnYvVlkyK3VMZXdBaDFudjE2emJ2MUhnZXA3bWlaY3c1dndNNGNQ?=
 =?utf-8?B?M0RqR1hCNnRBQjFwN1RwK2hGMWZBd3d4b0Q3d28vTmM0MDZzbGsxRXlXb0Fm?=
 =?utf-8?B?bWV4K1hlM01DamttMmxKUmRIR1g3UEZiUkVmM1hzTmNqT2JYMlpKM1VTMDQv?=
 =?utf-8?B?YmdZdjErZ2h4cGVzL0VwS0FFa09iNFFFa0NweXJCU0hGZEFyYkppWENWWEZ6?=
 =?utf-8?B?elplTG1LZktLaCtKejgwVGx1dkZZTW0rdDNwN2lBVFNwOG45Q3Y4NEExMHhX?=
 =?utf-8?B?M3NBbDZVUmRnek5lQkw3QlV3QS9PMmloSW9xdi9rK0xXMzVoWlRnNk9BUkRH?=
 =?utf-8?B?YUxuR1luK1ZkMUh5MzFLcjFQcDBwM3dhL2Ewd0N5RERYSEI5OHc0dk4yMVMr?=
 =?utf-8?B?Qk11MHpkY1FKYU1yam1CTHVuSGVCVEdwc0xaMlpSZ0VCY202dGduTnU2MDFn?=
 =?utf-8?B?R28yZ2EzR01PVzFkM1ZKdEpHeC9rUEdkaUlBMDRXYTFLMGVvcVlCY2s2Y0sr?=
 =?utf-8?B?cFMvZVlLZjA2RU5jTEF3M1lKdWgxZTJBTzlLVlFBUXV3YzJmb0Vic0FUVmlV?=
 =?utf-8?B?b21SK2xFNjRDcjFlRlFMbndvZ1d4Y3p4WXV6dTJPNnRMYy8wWC91VFkxTW1l?=
 =?utf-8?B?WmYyd2h2QStvNUNrVkVJWEliN3Q3ZXZTeVJjUUI5TE01QXNvVTFqZDV2aER6?=
 =?utf-8?B?VDZzOUo1OGxWRmJhOVd6SkJRSnc3QWdhSHlnWXJyYjhsQjYzR3gvRUpDdVBV?=
 =?utf-8?B?R1BJcldIM1RqdzZTaTRjbmVQS2RTVEhKRkRTQm5OelBVbVBDK0hnWTIwa0Fz?=
 =?utf-8?B?blJKN1A5ZTU4QXJqUTlicTJtQUd0aExPOWlNN3FqQ0NJTm9wTTZTMlh0MGlR?=
 =?utf-8?B?Vk9xamExWGJFVmdPQ0RnbUxHVGRIY0hNYXRGL3Mxd0Y2ekZmeTBmbndrNzBO?=
 =?utf-8?B?MHhhViswSCtoaEFEOG5zbkVDWTE3WlI3ZFFUNTVLcHVudGM1eFUwaWhSeGFz?=
 =?utf-8?B?RzR4bEJzK3huUG1IRGEvR0N0VVcvOWxLTTVIcEpndS9wNzIzb2xQTS90VGMw?=
 =?utf-8?B?ZE9ZYm9ERXQzdGgwSUhlaTFJQ2RMU0N0Z08vZXZBS2ozWk5xYnJ0VzBhRDA1?=
 =?utf-8?B?MzBqbWhLRm9oL0NYVjM3bzdBVW1pcnhZeFpsOC9XWW15VEgrNWJvdmo5eU1H?=
 =?utf-8?B?M2dJWTh1aUNIbFpmUDVaWFFoUS9xa2NHajVvS1k0WnZWMVBCOGdTU1YrZWts?=
 =?utf-8?B?YUE3c0MyT0VXQWgzQUNBZncwNW1XSmtSTk5LMnNSWElhUFUxU0pId3FOVmdI?=
 =?utf-8?B?V1hwR0RQWHBlZ2lEbmExM3Q3aFU2aDA3YUNYaStRQ1NzalN0ODhZWjFBRGt3?=
 =?utf-8?B?RVJ3aGxKa0dVaS9wT0RBWFpnWDRleUo1L2t5VERra21kT3RYVk93TUZTeHNM?=
 =?utf-8?B?TEJoQURDYnBsTzk0WnNqT2tqNkVoT1N6OXIxTE9YaEJDYlNkNERIaFgvVk95?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f8c498-60e4-48a4-c08e-08de1b0a8642
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 18:55:15.1295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDe28sjEiBp8xal/5hJSj8EqcP8L1sXJtlvUoHaYsVs+WUr/cE7SHu+CvOYWbwEegNmReYKvOB8zeEHv2QuWkq550zpzo9WnsPW+xLAl7rM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8183
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



On 10/30/2025 9:31 PM, Michał Winiarski wrote:
> Upcoming changes will allow users to control VF state and obtain its
> migration data with a device-level granularity (not tile/gt).
> Change the data structures to reflect that and move the GT-level
> migration init to happen after device-level init.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---

...

> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> new file mode 100644
> index 0000000000000..e69de29bb2d1d
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index c753cd59aed2b..24d22afeececa 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -39,6 +39,12 @@ struct xe_device_pf {
>  	/** @provision: device level provisioning data. */
>  	struct xe_sriov_pf_provision provision;
>  
> +	/** @migration: device level VF migration data */
> +	struct {
> +		/** @migration.supported: indicates whether VF migration feature is supported */
> +		bool supported;
> +	} migration;
> +

late notice: all our other sub-components (except sysfs *) to hold its private fields define its own struct that matches component name

but here, you use anonymous struct instead and what worse,
later on you start using xe_sriov_pf_migration name to hold per-VF data,
which breaks the above naming pattern even more

can you add to xe_sriov_pf_migration_types.h:

+struct xe_sriov_pf_migration {
+	/** @supported: indicates whether VF migration feature is supported */
+	bool supported;
+};

and rename per-VF struct to something else? like:

	struct xe_sriov_migration_state - Per VF device-level migration related data


*) sysfs doesn't define/use any custom data types, just kobject

>  	/** @service: device level service data. */
>  	struct xe_sriov_pf_service service;
>  

