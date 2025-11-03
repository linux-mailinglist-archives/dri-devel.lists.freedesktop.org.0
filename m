Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49572C2DAFE
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 19:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B0610E489;
	Mon,  3 Nov 2025 18:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfjFliXO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0058510E473;
 Mon,  3 Nov 2025 18:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762194663; x=1793730663;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h2eLvK5JAKT5OUx6z2RmrNsZ6nGmdLCFKby0dc+wqfU=;
 b=nfjFliXOtgFoImW/uDtrtJ9NkFj202Dnl6gqXbC9xavQBtRh7Qk75z8b
 Vlgki9tUL0viSUrVVtCtM4OLItAv3K8aUQ5rnl7YpoMwcTcYcINNyticg
 DjMcDl8tsfZdqhifR2LXZllPWCkDy237QK+UVyqZeqntykbuhgT7d6ICH
 AqVfej7SwrRYjD2Pl8qE5Aq7w8xvaqXEIdXnVf3Gm31LOlFwidPgYL0G1
 x2sO/Ty77sId8TWWA9eoCc1grm02nHSW5iUekB1IT9wDs6C7LrtEYWn2c
 gYkpKI0w/xF5KxwY6eZlYPX59v7XaBsnEyaWf1wUo7ob2LQTkf+mHIgFW Q==;
X-CSE-ConnectionGUID: lbNHsDZjSnC33qAUwDPJcg==
X-CSE-MsgGUID: GnVTmp2bSQG3H07y5zggYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="67933980"
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="67933980"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 10:30:48 -0800
X-CSE-ConnectionGUID: w96L23HWRa6JwEbBJhU14w==
X-CSE-MsgGUID: hjDGu+woTrGwG4Nm7wcg3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; d="scan'208";a="187660161"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 10:30:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 10:30:47 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 3 Nov 2025 10:30:47 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 3 Nov 2025 10:30:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGJpNdX8p4Ty9qnLHy+kDJURb+SYunV9exRbDqqXSwglNUygm40XnILxr6VLLPDyMGJ0ZrCSzvAqGe5pTtvVLXf7C6uFjuwT9Xn0K0FTF1ajVNv/nW3C6LIoyAtmkumDSoiPc0wt274Ooju+OsWDEqVrk+NhfJHnxGEotwnyBgC61MIZxAqAvxiThmfgNB6RGC5wyyJyvjD8V8/N5mxCGKadpZGCjkj+uJf0Tq+Izew6cqYtGG1urWLF2g3TpkM3rw38oMepEEK+mgnAzrKU+yQmFtDsi1ILoM5a2OntxAwxtynjrfAqCi+TnSveGhySQmjjn6FwjboJl97QnrzzTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHL5UWmVqkgfXu2+Jb4AQiBkttmxAUFk2FtnQnUYcnA=;
 b=nueFLHukXodcNlzTSqQdpI79652LxhFcXif4XCXCJ+JlxY7nCnK0V2LmGoWGpFbMvmW3MELU9A5chhFikeeVV66eQZjAnO41cvWXcKtm4+lHzNm/JEFVMeEWgvAdXSPJmKyHPdNaZOq2ahE9bJ/aOzUeQCf0sRms+kta1f7YbGTVBAyXr3iRUWt68gFwOVGBbKIrtREz2l1Etng6rpul3ZhppDIqQqz+aA3LnkwoWHN5m/KPitaalujUooYV61gRCHmW2xIkCWWKN8AzYXBmGhJctfx281/i6foc+zAZozn+ntmAp6Lvb9V23MW6L7jpjoo/lt59e0Z8dI6B1/6MhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV2PR11MB5973.namprd11.prod.outlook.com (2603:10b6:408:14e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 18:30:42 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 18:30:42 +0000
Message-ID: <efde06ef-1ce4-4bc7-a0ca-01a27b697ae0@intel.com>
Date: Mon, 3 Nov 2025 19:30:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/28] drm/xe/pf: Switch VF migration GuC save/restore
 to struct migration data
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
 <20251030203135.337696-16-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251030203135.337696-16-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0273.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:84::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV2PR11MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: 58cbd25d-1c00-4254-d078-08de1b07187f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3RrUFJhdXBTdVhXcEpLQk9nZHRKR05kS2FHRVY3L21XQnJ5SGhyUDJvZk8v?=
 =?utf-8?B?NkhkVTlDY3dNelFrWVp0YStIenBZeUFZTjBMM1puWWw4enlhUlZzb05Sc2Iz?=
 =?utf-8?B?SFpBd1dKeHN6ZnJsMXd1bThnRGw2MUE0aXFSSEFqUW5WaFN6THNNQmM2U2lC?=
 =?utf-8?B?RlN5TjFCQTB5NVRTSEZyTVRhdEZXZ1RscXVpa2d4VitQSzBMUUtpQUxRYkdW?=
 =?utf-8?B?OGJ3eWduSkd2V3ZqVnc2a1hHbC9zMFJNZGdTUFVndVVhZmhXUmhJSnpxOXQw?=
 =?utf-8?B?YW1XOGt1c21sYi9rUnNDVXhKM3hrRnBTdmhRL3E2VjFnRWpYV04xTjNJZDJv?=
 =?utf-8?B?dURVbGp1OW9JeW5WVmMwNDlJb1Y3Y3lVRExJV2FZcEdNSG9mRE9pS3M3RE1G?=
 =?utf-8?B?ODRTQ1FXWnFIbEZVVU9CaTkxOFF1NE53eEFDUGM0a0JReWN2NG41NkxmckVm?=
 =?utf-8?B?eWhVV1BiOVZ1TkhnaENyT1V3THdScjBka0NqYXl0aC8zRCtOdmk4OGNvejhp?=
 =?utf-8?B?RmFvVTRNcjEzRkRaMGRCd21VRmF4Q1ozVm1wNDVkancraTd1cHEyYUdSZFFo?=
 =?utf-8?B?dm9NbC8vd3I1Y3FMRDRlYWIwc1ZPYzMwVHNHUElCSGZUNndPRGY2V2lNUjJZ?=
 =?utf-8?B?MEdLZmhZK1NqNWNOeHlmeTBiT1k3cWRVN0ltend0SmZGZXlINjVyNjhkYjFu?=
 =?utf-8?B?aXlKaTZpa3hHeDNDZE9CTWltbUlZN3BCQzdzaG9HM1FUeXhLZXJMWUNoclI5?=
 =?utf-8?B?NWtMRWpSRjB3UDg3cG16eG9pU3BnOWhxWGtMODNHcmRVcitua1NBaFJXYWo3?=
 =?utf-8?B?SzdSY1ViVlBQak1MUFhIZ0dhUWp5WXdYMXdtNzNybllPUFZwQ2tKZVNtZGdL?=
 =?utf-8?B?UmNRdkVtU3Q3UFdLcGhUeU53dVQzaElvcWg5Zk9pQ1JnMHZwYWZ1UTgwSktv?=
 =?utf-8?B?NnVwN1J5RHloS3RtVkdRWkRqdjl2eTBnd2pTcklJQW9MM1BDQ1NBb3lGSGdy?=
 =?utf-8?B?end0RWttVDlyVHFhMDZsZ0M5K2dCemVSL3c5TCtYOEprQ3U0VzY2clZNVVpa?=
 =?utf-8?B?SjM5R2NiVy85S3VWNEZCMDRPNFNlaER5VFhZRld1VDU2djZHNmhSRndnRFJq?=
 =?utf-8?B?blUzVEFtaitzVUFBSHhvdkZUNWpnbC9uaXFuVklVVk9uRTg1bXE3ZlhFVnQ5?=
 =?utf-8?B?YzVDeUtPSG92UjVGa2tlY0ZLdzYrYmlxOFd5ZHo1WHJRZUdHSVhhTnhWTndo?=
 =?utf-8?B?ajVRS0VSK09sZEpwUlhLTlZ4VktyMFhDcms3NC9BNkx3c0dHWmFHeStCSngw?=
 =?utf-8?B?MFVoQmh2TDdJRGRhZDJRNzErNThrTmtKQ3RMN1dPd2VrMm9qY0tZWnF5bFds?=
 =?utf-8?B?c0c2ZTQ1Wkc5cWw1cXlMdGlYb2dGZnAxd09TRlQ5bUhMUjMyTENRenN1QzF5?=
 =?utf-8?B?Ym9LdEJ4RlVDSVlibW00OVRTQTZrNElsSlVmUDNtTVg4bXYrcjdQR3dZQ1E2?=
 =?utf-8?B?cTFmc1Z4Sk9CaXlJQy81bXBiTXJsRXQzbGNCUlFXYU9qSlhic2kxWlNMR1E5?=
 =?utf-8?B?ZlJpRFowbkdLdHpEcXlYTWJTMzBjTFlDVXFocmd1djhSYW5HOXQwYmVVV29k?=
 =?utf-8?B?cGNIdzFQeW1hRCt6eDBZL0s5NDlUcEZjemZ4M3piRk9pNGt4QXVEMnZMMXpG?=
 =?utf-8?B?ckdnTmJ4V0tkU1l5YlU0Y3p1SXoyTzB4TTNKOWthcUNwd2lBT2kwVjdldzNp?=
 =?utf-8?B?WkM1eTM3dmJpYzNlL0tmUE1vMCtOc2tqMWp1RWt4STkyNkhhQzVqVXJjYnpy?=
 =?utf-8?B?RDFxRnJvMm45VzFueE1lZ2NQR2REY1NpL09RR0NCUVloQXdWN3NqamJnb3lC?=
 =?utf-8?B?YzVJK0VPS09OWjJwUDZlWVVZVDhhSTkxZURRK0ZtUXZoUGc1bEhRWHBVa2pm?=
 =?utf-8?B?Y0Fjc3BkOG0xNXgycHRSOFB2UEV2cU1ReSt4VkNMR05RbXJjYW91S21neFB6?=
 =?utf-8?Q?hwFBq05BeWEJRUgkyN7WN6tERZuVBA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3dOYlJQS3dhME1hK21wSjVXbm85Y2RiYUdjTnZ6TnorN3dVNW8wV1pnODJV?=
 =?utf-8?B?bnRYTGtiSTV2VCtpeXpvNm1NSjFCZjZPaFFhTUtneDFCTzJaWEM0eVNHTEMr?=
 =?utf-8?B?V2NyYTJzTkhWdUs5WnhrWWxzbDhKbG1IOERZOVgwY044bmZEUVN5VnlqUFNp?=
 =?utf-8?B?NFNGOXZadElkT2pmSnlYQXlNeEFIVEhocDF2VWhRVGJ6dHdoRDZac2Y3eFZU?=
 =?utf-8?B?MXVkZ2ZORmlWZ0VQNzFVRmVqdnI5bkM0bEhicjNKazBYZ0JJQTl4TzdMaVdx?=
 =?utf-8?B?bUNxYVJPMU0wb29oQVNxYzh5UHF2MjgzSzE3WlJKZGZvUDVMWHlpS0pTVWpx?=
 =?utf-8?B?aXNqa1Fac210UWtJRjR3RnZ1Y3RRNDNNWDlNMXpkVmRJa2Yyb25KMVNBMWNv?=
 =?utf-8?B?M2dhOFhxNzIyeXRqMnlibHErM1JNVkN0b1puRGxPYzdFTTQyR2xSdDhsSzNZ?=
 =?utf-8?B?RStackNkRGduV3JlaVZuS0xSeWFnODBuNzMrRnRrWnByb0FQV2FqRVU4bG5x?=
 =?utf-8?B?TTdkMXFXT25NSnJsN0xaa1NhSSt3RGhWUndFNUdVMjl1VmF2cmZERUhpK1ZV?=
 =?utf-8?B?SFdQYzFweFhBMllvOWJmUE1sYWl3UzJwcURzcGJ6cHF4R08vTlAvZzkwNTVo?=
 =?utf-8?B?YkJ0UkloT0I4aXV1YkJ0MnNKRFdMVkFsM1hhc1JxeWNmVnc4ZjJxdWdHc2NV?=
 =?utf-8?B?ZnBsWkpqQUZBZkFCWTZHVGNJUkNxd1VJL0trV0tFajRac2ZhRVNqdnh6VW5k?=
 =?utf-8?B?V1VlTDhVbjdOOU9TY1lDZE9wUGVLVjdURm5IT0s1aXhZUG10VUNyRkpsYVFp?=
 =?utf-8?B?UkRKNzdXMHJHa3RGaWxhd1BZbnZDSlFOUkdyeDBmQklJSjNBS21DK3duTW1Z?=
 =?utf-8?B?UmlBaEZRVjFVT2FVMHJsMHJvendRSTFOTUM5U3FRVzF6ekRqaFhEVVlpYms4?=
 =?utf-8?B?SHNFWGUyakswYmZXazZ2Nk1iOWYvSlhwaDFiQ0JNcy9TaVJlcnFFMlFwVklY?=
 =?utf-8?B?aWVmeXRXb09WdWc3MVpJYTAvSXorbG1ZditiajZlaWcyVTdsTnV5M0FscjBu?=
 =?utf-8?B?NlN4Mnp1RHROdTZydXZxMXRUTmh2SzloVGQvUHg1M1B6MVZKRlUyNlBHZk1G?=
 =?utf-8?B?T3BXZnpBNFN0Rk5SRWlZUDFtU1NGZm5rR09jNUJYN3pZbW4rbksxbUU5VG5t?=
 =?utf-8?B?cHJmZGZVT1lUelh5dEh2NXNIOTQ4SXprU3J5dUJhNmdDV1g4bVlDNDNERncr?=
 =?utf-8?B?TkhNKzZPcmdveUZkRkJxZW10cmdLNlFXaVVWL3lZTEM0NFdma1ZzMlplSGNj?=
 =?utf-8?B?ZmsrMGVuM2t3eGpYei9jTFRlK1ZHcSs3Sjc5MVRNT1lWdGJoMzQwRXM2djZC?=
 =?utf-8?B?cko4blNRNk1TZDRBU3pxVmF2TUhxcTMyQjcrVDNCdFROV20wczlhQjRtY29G?=
 =?utf-8?B?Qzg3b2VsZWxLYzZMOVV1LzBDK0x2MzI3Rko4ZnNtNTB3T09zQzJ4WnlWRGw0?=
 =?utf-8?B?U3BqajFUS0tjdkFuZFF3VGE2UFdUZG9lUU50Z3djODlWTzNqT3djQWlKVnZx?=
 =?utf-8?B?eVk5MUNHaXVvTU5DcEN5MWl3a0JzQmhyRFVFWlZjR3JzdlJGT21MQzZtcHpE?=
 =?utf-8?B?VTc1eTVtWkNKT3o5V0ptUy9mUGFQNHFpN2NpQ0RjSmVqU0lzVkFqT3E4NkZR?=
 =?utf-8?B?VHc0c09DREFaZlk4SXhtdVREdHVBZHlNa01XQjN2Qmx3cmdyejZBTXZ3dTIr?=
 =?utf-8?B?c2hXODM4NXJvelNZR3k5dDZ0OEZ0SE9uZGUxMG9CZGFsSlY0QUdCUXNGRFRr?=
 =?utf-8?B?NWd6aVc2eGF4NVhORkFDWHlZdWhmak5INjN1d3lzaGZEc1B6RXhsTDNsLzBB?=
 =?utf-8?B?TWNIQjFoaUppR3F3VDhYM3lYb2lSVGZkL2JBQ1A0ck96NUlzYm5uOWxrYjRa?=
 =?utf-8?B?NzNXcldkUUE0Q21hWURvalBRNHlrQ1RTcW94YmgwNUxNa0o4VWJoV2dzcExm?=
 =?utf-8?B?NkFVWTVvT00zNUJVUTZMbFVSRWgyYkNNVVUybm5YbE9kdGt6NFdZbk15L0ZN?=
 =?utf-8?B?elMxbk1WSVY2VGt6NWNzZTU4YXNQWHJocXc3anFCQXcrczhmOVdvdm1VL0hR?=
 =?utf-8?B?dktoS1A2MG1LdzN2RktrTkdpTzJPdW5IQ2k0NG1ESUJ5Vnk4WDdGVmhGMkV0?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58cbd25d-1c00-4254-d078-08de1b07187f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 18:30:42.5393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VgLsm4L4AT33oiA1nlO4YatIQ9sef+XMRORG4EiZdPDeP7IsoJ88xnKiHaQhaURoQnlg4Bp0ZxVHOyRw6maLFBKVPS6lJeODiMVYg7sf34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5973
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
> In upcoming changes, the GuC VF migration data will be handled as part
> of separate SAVE/RESTORE states in VF control state machine.
> Now that the data is decoupled from both guc_state debugfs and PAUSE
> state, we can safely remove the struct xe_gt_sriov_state_snapshot and
> modify the GuC save/restore functions to operate on struct
> xe_sriov_migration_data.

hmm, that reminded me that maybe instead

	xe_sriov_migration_data

better name for this "data" struct could be

	xe_sriov_migration_packet

to make more distinguished from

	xe_gt_sriov_migration_data

which has completely different usage

> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 265 +++++-------------
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  13 +-
>  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  27 --
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   4 -
>  4 files changed, 79 insertions(+), 230 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index a2db127982638..4a716e0a29fe4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -28,6 +28,17 @@ static struct xe_gt_sriov_migration_data *pf_pick_gt_migration(struct xe_gt *gt,
>  	return &gt->sriov.pf.vfs[vfid].migration;
>  }
>  
> +static void pf_dump_mig_data(struct xe_gt *gt, unsigned int vfid,
> +			     struct xe_sriov_migration_data *data)
> +{
> +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
> +		print_hex_dump_bytes("mig_hdr:  ", DUMP_PREFIX_OFFSET,
> +				     &data->hdr, sizeof(data->hdr));
> +		print_hex_dump_bytes("mig_data: ", DUMP_PREFIX_OFFSET,
> +				     data->vaddr, min(SZ_64, data->size));
> +	}

nit: maybe this function should be based on the drm_printer/drm_print_hex_dump
then we will get proper GTn: prefix 

> +}
> +
>  /* Return: number of dwords saved/restored/required or a negative error code on failure */
>  static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
>  				      u64 addr, u32 ndwords)
> @@ -47,7 +58,7 @@ static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
>  }
>  
>  /* Return: size of the state in dwords or a negative error code on failure */
> -static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
> +static int pf_send_guc_query_vf_mig_data_size(struct xe_gt *gt, unsigned int vfid)
>  {
>  	int ret;
>  
> @@ -56,8 +67,8 @@ static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
>  }
>  
>  /* Return: number of state dwords saved or a negative error code on failure */
> -static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
> -				     void *dst, size_t size)
> +static int pf_send_guc_save_vf_mig_data(struct xe_gt *gt, unsigned int vfid,
> +					void *dst, size_t size)
>  {
>  	const int ndwords = size / sizeof(u32);
>  	struct xe_guc *guc = &gt->uc.guc;
> @@ -85,8 +96,8 @@ static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
>  }
>  
>  /* Return: number of state dwords restored or a negative error code on failure */
> -static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
> -					const void *src, size_t size)
> +static int pf_send_guc_restore_vf_mig_data(struct xe_gt *gt, unsigned int vfid,
> +					   const void *src, size_t size)
>  {
>  	const int ndwords = size / sizeof(u32);
>  	struct xe_guc *guc = &gt->uc.guc;
> @@ -114,120 +125,67 @@ static bool pf_migration_supported(struct xe_gt *gt)
>  	return xe_sriov_pf_migration_supported(gt_to_xe(gt));
>  }
>  
> -static struct mutex *pf_migration_mutex(struct xe_gt *gt)
> +static int pf_save_vf_guc_mig_data(struct xe_gt *gt, unsigned int vfid)
>  {
> -	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> -	return &gt->sriov.pf.migration.snapshot_lock;
> -}
> -
> -static struct xe_gt_sriov_state_snapshot *pf_pick_vf_snapshot(struct xe_gt *gt,
> -							      unsigned int vfid)
> -{
> -	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> -	lockdep_assert_held(pf_migration_mutex(gt));
> -
> -	return &gt->sriov.pf.vfs[vfid].snapshot;
> -}
> -
> -static unsigned int pf_snapshot_index(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
> -{
> -	return container_of(snapshot, struct xe_gt_sriov_metadata, snapshot) - gt->sriov.pf.vfs;
> -}
> -
> -static void pf_free_guc_state(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
> -{
> -	struct xe_device *xe = gt_to_xe(gt);
> -
> -	drmm_kfree(&xe->drm, snapshot->guc.buff);
> -	snapshot->guc.buff = NULL;
> -	snapshot->guc.size = 0;
> -}
> -
> -static int pf_alloc_guc_state(struct xe_gt *gt,
> -			      struct xe_gt_sriov_state_snapshot *snapshot,
> -			      size_t size)
> -{
> -	struct xe_device *xe = gt_to_xe(gt);
> -	void *p;
> -
> -	pf_free_guc_state(gt, snapshot);
> -
> -	if (!size)
> -		return -ENODATA;
> -
> -	if (size % sizeof(u32))
> -		return -EINVAL;
> -
> -	if (size > SZ_2M)
> -		return -EFBIG;
> -
> -	p = drmm_kzalloc(&xe->drm, size, GFP_KERNEL);
> -	if (!p)
> -		return -ENOMEM;
> -
> -	snapshot->guc.buff = p;
> -	snapshot->guc.size = size;
> -	return 0;
> -}
> -
> -static void pf_dump_guc_state(struct xe_gt *gt, struct xe_gt_sriov_state_snapshot *snapshot)
> -{
> -	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV)) {
> -		unsigned int vfid __maybe_unused = pf_snapshot_index(gt, snapshot);
> -
> -		xe_gt_sriov_dbg_verbose(gt, "VF%u GuC state is %zu dwords:\n",
> -					vfid, snapshot->guc.size / sizeof(u32));
> -		print_hex_dump_bytes("state: ", DUMP_PREFIX_OFFSET,
> -				     snapshot->guc.buff, min(SZ_64, snapshot->guc.size));
> -	}
> -}
> -
> -static int pf_save_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
> -{
> -	struct xe_gt_sriov_state_snapshot *snapshot = pf_pick_vf_snapshot(gt, vfid);
> +	struct xe_sriov_migration_data *data;
>  	size_t size;
>  	int ret;
>  
> -	ret = pf_send_guc_query_vf_state_size(gt, vfid);
> +	ret = pf_send_guc_query_vf_mig_data_size(gt, vfid);
>  	if (ret < 0)
>  		goto fail;
> +
>  	size = ret * sizeof(u32);
> -	xe_gt_sriov_dbg_verbose(gt, "VF%u state size is %d dwords (%zu bytes)\n", vfid, ret, size);
>  
> -	ret = pf_alloc_guc_state(gt, snapshot, size);
> -	if (ret < 0)
> +	data = xe_sriov_migration_data_alloc(gt_to_xe(gt));
> +	if (!data) {
> +		ret = -ENOMEM;
>  		goto fail;
> +	}
> +
> +	ret = xe_sriov_migration_data_init(data, gt->tile->id, gt->info.id,
> +					   XE_SRIOV_MIGRATION_DATA_TYPE_GUC, 0, size);
> +	if (ret)
> +		goto fail_free;
>  
> -	ret = pf_send_guc_save_vf_state(gt, vfid, snapshot->guc.buff, size);
> +	ret = pf_send_guc_save_vf_mig_data(gt, vfid, data->vaddr, size);
>  	if (ret < 0)
> -		goto fail;
> +		goto fail_free;
>  	size = ret * sizeof(u32);
>  	xe_gt_assert(gt, size);
> -	xe_gt_assert(gt, size <= snapshot->guc.size);
> -	snapshot->guc.size = size;
> +	xe_gt_assert(gt, size <= data->size);
> +	data->size = size;
> +	data->remaining = size;
> +
> +	xe_gt_sriov_dbg_verbose(gt, "VF%u GuC data save (%zu bytes)\n", vfid, size);
> +	pf_dump_mig_data(gt, vfid, data);

as already commented elsewhere, these two lines are always together,
we can combine them into improved pf_dump_mig_data(gt, vfid, data, what)

> +
> +	ret = xe_gt_sriov_pf_migration_save_produce(gt, vfid, data);
> +	if (ret)
> +		goto fail_free;
>  
> -	pf_dump_guc_state(gt, snapshot);
>  	return 0;
>  
> +fail_free:
> +	xe_sriov_migration_data_free(data);
>  fail:
> -	xe_gt_sriov_dbg(gt, "Unable to save VF%u state (%pe)\n", vfid, ERR_PTR(ret));
> -	pf_free_guc_state(gt, snapshot);
> +	xe_gt_sriov_err(gt, "Failed to save VF%u GuC data (%pe)\n",
> +			vfid, ERR_PTR(ret));
>  	return ret;
>  }
>  
>  /**
> - * xe_gt_sriov_pf_migration_save_guc_state() - Take a GuC VF state snapshot.
> + * xe_gt_sriov_pf_migration_guc_size() - Get the size of VF GuC migration data.
>   * @gt: the &xe_gt
>   * @vfid: the VF identifier
>   *
>   * This function is for PF only.
>   *
> - * Return: 0 on success or a negative error code on failure.
> + * Return: size in bytes or a negative error code on failure.
>   */
> -int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid)
> +ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid)
>  {
> -	int err;
> +	ssize_t size;
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, vfid != PFID);
> @@ -236,37 +194,15 @@ int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid)
>  	if (!pf_migration_supported(gt))
>  		return -ENOPKG;
>  
> -	mutex_lock(pf_migration_mutex(gt));
> -	err = pf_save_vf_guc_state(gt, vfid);
> -	mutex_unlock(pf_migration_mutex(gt));
> -
> -	return err;
> -}
> -
> -static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
> -{
> -	struct xe_gt_sriov_state_snapshot *snapshot = pf_pick_vf_snapshot(gt, vfid);
> -	int ret;
> -
> -	if (!snapshot->guc.size)
> -		return -ENODATA;
> -
> -	xe_gt_sriov_dbg_verbose(gt, "restoring %zu dwords of VF%u GuC state\n",
> -				snapshot->guc.size / sizeof(u32), vfid);
> -	ret = pf_send_guc_restore_vf_state(gt, vfid, snapshot->guc.buff, snapshot->guc.size);
> -	if (ret < 0)
> -		goto fail;
> -
> -	xe_gt_sriov_dbg_verbose(gt, "restored %d dwords of VF%u GuC state\n", ret, vfid);
> -	return 0;
> +	size = pf_send_guc_query_vf_mig_data_size(gt, vfid);
> +	if (size >= 0)
> +		size *= sizeof(u32);
>  
> -fail:
> -	xe_gt_sriov_dbg(gt, "Failed to restore VF%u GuC state (%pe)\n", vfid, ERR_PTR(ret));
> -	return ret;
> +	return size;
>  }
>  
>  /**
> - * xe_gt_sriov_pf_migration_restore_guc_state() - Restore a GuC VF state.
> + * xe_gt_sriov_pf_migration_guc_save() - Save VF GuC migration data.
>   * @gt: the &xe_gt
>   * @vfid: the VF identifier
>   *
> @@ -274,10 +210,8 @@ static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid)
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid)
> +int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid)
>  {
> -	int ret;
> -
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, vfid != PFID);
>  	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> @@ -285,75 +219,43 @@ int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vf
>  	if (!pf_migration_supported(gt))
>  		return -ENOPKG;
>  
> -	mutex_lock(pf_migration_mutex(gt));
> -	ret = pf_restore_vf_guc_state(gt, vfid);
> -	mutex_unlock(pf_migration_mutex(gt));
> -
> -	return ret;
> +	return pf_save_vf_guc_mig_data(gt, vfid);
>  }
>  
> -#ifdef CONFIG_DEBUG_FS
> -/**
> - * xe_gt_sriov_pf_migration_read_guc_state() - Read a GuC VF state.
> - * @gt: the &xe_gt
> - * @vfid: the VF identifier
> - * @buf: the user space buffer to read to
> - * @count: the maximum number of bytes to read
> - * @pos: the current position in the buffer
> - *
> - * This function is for PF only.
> - *
> - * This function reads up to @count bytes from the saved VF GuC state buffer
> - * at offset @pos into the user space address starting at @buf.
> - *
> - * Return: the number of bytes read or a negative error code on failure.
> - */
> -ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
> -						char __user *buf, size_t count, loff_t *pos)
> +static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid,
> +				   struct xe_sriov_migration_data *data)
>  {
> -	struct xe_gt_sriov_state_snapshot *snapshot;
> -	ssize_t ret;
> +	int ret;
>  
> -	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> -	xe_gt_assert(gt, vfid != PFID);
> -	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +	xe_gt_assert(gt, data->size);
>  
> -	if (!pf_migration_supported(gt))
> -		return -ENOPKG;
> +	xe_gt_sriov_dbg_verbose(gt, "VF%u GuC data restore (%llu bytes)\n", vfid, data->size);
> +	pf_dump_mig_data(gt, vfid, data);
>  
> -	mutex_lock(pf_migration_mutex(gt));
> -	snapshot = pf_pick_vf_snapshot(gt, vfid);
> -	if (snapshot->guc.size)
> -		ret = simple_read_from_buffer(buf, count, pos, snapshot->guc.buff,
> -					      snapshot->guc.size);
> -	else
> -		ret = -ENODATA;
> -	mutex_unlock(pf_migration_mutex(gt));
> +	ret = pf_send_guc_restore_vf_mig_data(gt, vfid, data->vaddr, data->size);
> +	if (ret < 0)
> +		goto fail;
> +
> +	return 0;
>  
> +fail:
> +	xe_gt_sriov_err(gt, "Failed to restore VF%u GuC data (%pe)\n",
> +			vfid, ERR_PTR(ret));
>  	return ret;
>  }
>  
>  /**
> - * xe_gt_sriov_pf_migration_write_guc_state() - Write a GuC VF state.
> + * xe_gt_sriov_pf_migration_guc_restore() - Restore VF GuC migration data.
>   * @gt: the &xe_gt
>   * @vfid: the VF identifier
> - * @buf: the user space buffer with GuC VF state
> - * @size: the size of GuC VF state (in bytes)
>   *
>   * This function is for PF only.
>   *
> - * This function reads @size bytes of the VF GuC state stored at user space
> - * address @buf and writes it into a internal VF state buffer.
> - *
> - * Return: the number of bytes used or a negative error code on failure.
> + * Return: 0 on success or a negative error code on failure.
>   */
> -ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
> -						 const char __user *buf, size_t size)
> +int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
> +					 struct xe_sriov_migration_data *data)
>  {
> -	struct xe_gt_sriov_state_snapshot *snapshot;
> -	loff_t pos = 0;
> -	ssize_t ret;
> -
>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>  	xe_gt_assert(gt, vfid != PFID);
>  	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> @@ -361,21 +263,8 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  	if (!pf_migration_supported(gt))
>  		return -ENOPKG;
>  
> -	mutex_lock(pf_migration_mutex(gt));
> -	snapshot = pf_pick_vf_snapshot(gt, vfid);
> -	ret = pf_alloc_guc_state(gt, snapshot, size);
> -	if (!ret) {
> -		ret = simple_write_to_buffer(snapshot->guc.buff, size, &pos, buf, size);
> -		if (ret < 0)
> -			pf_free_guc_state(gt, snapshot);
> -		else
> -			pf_dump_guc_state(gt, snapshot);
> -	}
> -	mutex_unlock(pf_migration_mutex(gt));
> -
> -	return ret;
> +	return pf_restore_vf_guc_state(gt, vfid, data);
>  }
> -#endif /* CONFIG_DEBUG_FS */
>  
>  /**
>   * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT.
> @@ -599,10 +488,6 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
>  	if (!pf_migration_supported(gt))
>  		return 0;
>  
> -	err = drmm_mutex_init(&xe->drm, &gt->sriov.pf.migration.snapshot_lock);
> -	if (err)
> -		return err;
> -
>  	totalvfs = xe_sriov_pf_get_totalvfs(xe);
>  	for (n = 1; n <= totalvfs; n++) {
>  		struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, n);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index 4f2f2783339c3..b3c18e369df79 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -15,8 +15,10 @@ struct xe_sriov_migration_data;
>  #define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
>  
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
> -int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
> -int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
> +ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
> +					 struct xe_sriov_migration_data *data);
>  
>  ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
>  
> @@ -34,11 +36,4 @@ int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid
>  struct xe_sriov_migration_data *
>  xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid);
>  
> -#ifdef CONFIG_DEBUG_FS
> -ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
> -						char __user *buf, size_t count, loff_t *pos);
> -ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
> -						 const char __user *buf, size_t count);
> -#endif
> -
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> index 84be6fac16c8b..75d8b94cbbefb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> @@ -6,24 +6,7 @@
>  #ifndef _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
>  #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
>  
> -#include <linux/mutex.h>
>  #include <linux/ptr_ring.h>
> -#include <linux/types.h>
> -
> -/**
> - * struct xe_gt_sriov_state_snapshot - GT-level per-VF state snapshot data.
> - *
> - * Used by the PF driver to maintain per-VF migration data.
> - */
> -struct xe_gt_sriov_state_snapshot {
> -	/** @guc: GuC VF state snapshot */
> -	struct {
> -		/** @guc.buff: buffer with the VF state */
> -		u32 *buff;
> -		/** @guc.size: size of the buffer (must be dwords aligned) */
> -		u32 size;
> -	} guc;
> -};
>  
>  /**
>   * struct xe_gt_sriov_migration_data - GT-level per-VF migration data.
> @@ -35,14 +18,4 @@ struct xe_gt_sriov_migration_data {
>  	struct ptr_ring ring;
>  };
>  
> -/**
> - * struct xe_gt_sriov_pf_migration - GT-level data.
> - *
> - * Used by the PF driver to maintain non-VF specific per-GT data.
> - */
> -struct xe_gt_sriov_pf_migration {
> -	/** @snapshot_lock: protects all VFs snapshots */
> -	struct mutex snapshot_lock;
> -};
> -
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> index 812e74d3f8f80..667b8310478d4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -31,9 +31,6 @@ struct xe_gt_sriov_metadata {
>  	/** @version: negotiated VF/PF ABI version */
>  	struct xe_gt_sriov_pf_service_version version;
>  
> -	/** @snapshot: snapshot of the VF state data */
> -	struct xe_gt_sriov_state_snapshot snapshot;
> -
>  	/** @migration: per-VF migration data. */
>  	struct xe_gt_sriov_migration_data migration;
>  };
> @@ -61,7 +58,6 @@ struct xe_gt_sriov_pf {
>  	struct xe_gt_sriov_pf_service service;
>  	struct xe_gt_sriov_pf_control control;
>  	struct xe_gt_sriov_pf_policy policy;
> -	struct xe_gt_sriov_pf_migration migration;
>  	struct xe_gt_sriov_spare_config spare;
>  	struct xe_gt_sriov_metadata *vfs;
>  };

otherwise LGTM, so with dump helper improved

	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

