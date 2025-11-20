Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B20C734AD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 10:48:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8ABF10E736;
	Thu, 20 Nov 2025 09:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oy7Zq5O9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D379110E29C;
 Thu, 20 Nov 2025 09:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763632115; x=1795168115;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lAiuNEndlRuQ4FbhKpOt9ahhZ4UwKGCEkESQNEQFOek=;
 b=Oy7Zq5O9Z4GCEj+jWoF0YlALINRHKXPgjND/IW+MgF5hLrIlhyxfWCU6
 VecxJL46E4CYutganm9+fnFKA1df/M1rf7uF2CJmjQRuk7F19Co/qo4ae
 /pWXVW8KuFFf6v1rGM8bJrpFZ4gcxalGLV/0NwGGlThHLAlccQCNRGHxc
 jTVHYeq31JCluPVCQFci7IEXHdIeUMkFIQiAISHyDKYrI0Ux2lf+A7Zkj
 gjygHHooo2T1r8y/tbJ41JZ9CwJSsCD447KuZV27N9gVhQstwsPj+pPS1
 cBERAVsjO8EMBAHrLqt/CygtjiDlv9Jx0XPKqHV0R9nori5hrBCrcGOEl w==;
X-CSE-ConnectionGUID: EI1D0trfRTm1aQqEoXZ+6A==
X-CSE-MsgGUID: 6VdsqffwRtujThw/ZiZc8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="64703433"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="64703433"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 01:48:34 -0800
X-CSE-ConnectionGUID: +9WIHWlKSHuLV2tdAbcDSw==
X-CSE-MsgGUID: gnMy+mF6TDGG2dEStIf4gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="221961049"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 01:48:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 01:48:33 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 01:48:33 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 01:48:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcOJW7fmmenCmUu1xJTcm7eaJnKhweI00qkpr+pxlx85VvAVySuWLlui6x1iXX0kMx87mtBLDFx9f+IXXCEDc2mrEAxg9GlVlBSIany6ahRJHfSpH/hTdu6eJdKhTvbQvRdiuTD7jVbzCCltAS168O2moaMR8pGVIVXiYklpsmHIr4nEZ5Nvi+FtvnuMYZISyai51adefXJOnXuKgrqbcs5yBAaUtXjayk0wk382EeaFxaT4BIKF65lPpCFO0p8mWIpNF97ePpR90O6PdufvN0sphkVpBIJDz6Bmv1fLfOOLCF54DdOZQBKs6E13o50bShXTkBzcEiqYs2dgDFPQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPK3jTkDRBk6VJvqpQ1U7uF4fq1MPfWIksLC1UGNALg=;
 b=W+hp0fK3qVgUJdsFss/KNbb+EU2jp52lI7ut1UkPWbg7RbiyoYJHQqawtbXhERTMpsfjy8LZTzIpZElkSoCRkHiVk6aBpypzP9MSHs78t+GT5wHrx6Gs3yujFsfcNXC7oLSvf0K91LVxFzjNQhKXis316bLwN8/5FMJckuuEO+DpO/gOmUFefQLgqSCLIT98nhQ79ITd5yjMna+0RA2cIyeNf+szwcL8FqoDPmXHYkshGuijmx89CNqayTmjuZ/UA7rbjPb+LubAf5MubFpDKiObO6yGGjtma3TyuXI1XH3J8otTkQVI5ZsmG7lmV83Ii0lQgHSYt81UDipnfLw+PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA1PR11MB7343.namprd11.prod.outlook.com (2603:10b6:208:424::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 09:48:30 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 09:48:30 +0000
Date: Thu, 20 Nov 2025 10:48:26 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas
 <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer Kolothum
 <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>, Christoph Hellwig
 <hch@infradead.org>
Subject: Re: [PATCH v5 24/28] drm/xe/pf: Enable SR-IOV VF migration
Message-ID: <y6bx5qquuqkir25ltkqvah6g76jcycvhl2jd3qq4cf3hbojahh@om6wmixc45wn>
References: <20251111010439.347045-1-michal.winiarski@intel.com>
 <20251111010439.347045-25-michal.winiarski@intel.com>
 <20251117114813.67fbea04.alex@shazbot.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251117114813.67fbea04.alex@shazbot.org>
X-ClientProxiedBy: BE1P281CA0228.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::7) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA1PR11MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a2f6a37-d6fd-4c51-2875-08de2819f58a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2VJZG5tb29XNmUvVmUyQzlKMU4rWlUvL2hrVUsvMnpJazFTN3RVMjJoMjhn?=
 =?utf-8?B?NlNSejJsUCtocjQzd1hwR1ZqclcwYzQwVVhnYytsSTNsc21uQmUyTzB4Nkw4?=
 =?utf-8?B?OXh2UDZHSlZCNnFFOFAxcWFKLzRmSXNnYTcrQ3NZbFBIU0pSOFNON2w3YklN?=
 =?utf-8?B?TGtuL01aSFpqUUNiVVBrWHpVc0Fpdmo4RGw0TlljMTRWTVJGdXptZ3dteXFI?=
 =?utf-8?B?bVIwREdsRE9reFg0c1JVcVJOd01TYmhKUWdoRFBIOG9jYjNhYlJKeXVPTVA0?=
 =?utf-8?B?bkp1d095UEZxZ2hVUm16eVVVV1N0Z3ZsOU0zYTljVG9rL0k2R0JsOGZhQTIx?=
 =?utf-8?B?R3RYVXdWWFdmdmt0cUlYZ0RjQS9BS2J6L0F5VGFVYVhBT2RHZHM2TlRET1J2?=
 =?utf-8?B?ZWMwS3lsZUpPZCtQTGpGNktiUDViRnB3UmltMXM3T0s0L05SOEZQaXEwWXBY?=
 =?utf-8?B?djN3N09ubXIwT0lOUUhtZVJsNllLMmRaNTJJQ2VZVU1NMU4yajlXL2FFSU11?=
 =?utf-8?B?RW1DREZqUEZZdWwrZ0NuZzU4eHJjM1NpQ2R4SU1TZHYxOTVCTEZGemdQUDdK?=
 =?utf-8?B?TmJydGd2MDZTMk90dmRSQkl3ZWJ3bVQvWCtjd3NqRGEzaXp2cEFPdmxQYnc1?=
 =?utf-8?B?NzJCaEZtUnNlcmFSVkhzN1VOUWF1TnlNUFVqSE04T2hTM3hUWVN5OWlLbU42?=
 =?utf-8?B?WTFmbFVLNWRDc3c0bDNpSHpycjQ5UGQ5blYvL3J4R20xWklwRHNnRkFVa0tj?=
 =?utf-8?B?SWhma1ZUVHdYQVFTUzdiTXcvd1ZWVDdnOW5hR2ptbzBod083K1J6d29HZG5Y?=
 =?utf-8?B?U09sUFdDVVpucmJ5czNIalQzMjR6T25nSXRsa0hOSTgwTG9JL0hWQ01Kd04w?=
 =?utf-8?B?K2ZMVVlhdkVvcTRkQk13TDNicmpPZW81ekwrTXVzeUxoU0J3c1lQWjhkcEZn?=
 =?utf-8?B?SVY5d2lIUzRyRlZGS0VMUDhaU0xwK2NwTGxxcUsyYXE3K1VMZDcwa3loTXJh?=
 =?utf-8?B?K0ZndUNWNjRzRXBraVRPZzU1Rk9kLy92dUFjUUpscG11RS9nVFpXU2dwdStQ?=
 =?utf-8?B?N095cGlKUWY1d21hOFk4Ynl0RGljanBYV0djRVhnZUEvZ1JRUjNsVWNubG91?=
 =?utf-8?B?Z3dWWDM4ZmNmTjVWcE9RRVVKZXZrMnVtbDBtNUVYOEpnYkdFaGxJanFiaGJ5?=
 =?utf-8?B?SUtTK0hEYWFuN1p1dFRXUEpOSXhGRm5kR3N2elMyS2RtTWVOUWNGTDd5WmFK?=
 =?utf-8?B?L1g3b1FzOGt5VjVzK3RJaG53cmJqNGFpOUtYb25XNEpVZ1h6L2FMaUhqZGhX?=
 =?utf-8?B?YVpmRkhnOEFpVk94WEpGSmdhWVAxQjRoU2VGVWZKNmZlZmZjZkRZQUhmVFBo?=
 =?utf-8?B?QURXQldYQmNVWGh4VjdQWjZXaTRCZkE5dlI5ZzdoMnEyalZFNTRwa0pyamxS?=
 =?utf-8?B?OXpva2wydUcvSUE2aXhmNmEzaWJEZWVvNndxQVV4LzlwZHJrTndHNlRCRk9W?=
 =?utf-8?B?ckQ1S3pZQURJbVlpS3E0V3BBc1A4dkl1WVdLenlEbjZYb0hab0JyaHJHaElr?=
 =?utf-8?B?YkRuejJMeW5PdXhob2ZsYXllYlUyTDVyYmRUdnZMU0xxR2pqVkQ0ZklXc29i?=
 =?utf-8?B?eTFVdkxKNS9Ra2NsMnNJaGQxL3hDT3hUWEIrTG1tMFNFK2F4RkVtY1BPNjVI?=
 =?utf-8?B?aFZpMHRNdmh1dnlDSjhHci9qeUJsMVBlakQxRG1VM0J5RjhqZW8vTGRzMC82?=
 =?utf-8?B?cVZQeGNIVWxJNm9wODZNZ0l3enpIVlc1dGw4UnFoQWZFRnh4K0IrbVJrVmI1?=
 =?utf-8?B?eHhIL0xFTXl3OTJkVVFoYTAvUjBlRXkrWGUwQlM4MmZPbDBhS2dqOXNPSGIw?=
 =?utf-8?B?SlJLUXZQcDQ0SGZLbWJ2SE9jU0dlYlRXWlNvM3c4TGFKVlFjdGtxbWE3aHlG?=
 =?utf-8?B?Sk1ka3BpNFQwTkpOZVlRY0Y4NmNHNVlMMXR2dnRadDcvTmRrQjQ0dDJiTU81?=
 =?utf-8?B?NkFONVNWUEFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnhBNms4OUNZUVpzY1J5czQ0MnBUbjkxcWtNcnJYeWtUSEtNdkgzdjE4ZElM?=
 =?utf-8?B?Y2lzRC9xVFJpUGUwcVBBaEwxRUZGN3R1Sm1RWEtGM0VURHV2ZVNxS2NKUG94?=
 =?utf-8?B?bUVyTk9RWXh2NmNIM3VpNDZtenV1Q3FIa0hZYmpDeU9YSFdiTGJlTGc1SUY1?=
 =?utf-8?B?YWhFMDNvMzE0MmhOMnVkblBMTGQrRFBuSWNaUWk0WFUrUmQySUNPd21LVDVy?=
 =?utf-8?B?dWx6UjVMNnhiU2wyN0JlNjBIUHJySWNYemNPUTFsS2N0Qzkyek16cXArc25v?=
 =?utf-8?B?QWptSVV1QjRvQWJPV1BLYW5WZGwxbzlqM0E0U3JSK2lxVUtNMTRuMUZMeWdV?=
 =?utf-8?B?TGhwN25vSDE1UEZOb0pjbVRoM2QrcFBDcm5wUW91Vjgrd2VmaWtDYlJha3BN?=
 =?utf-8?B?alh4MVVTTXZoU2NYbitQTFdZV0hNOW8vTmN6Skg2am9FT0dCQzY2OHA3RFVq?=
 =?utf-8?B?Y0ZpY2pzYkptUnZtVWdLZlgvL1U0NUJxYittSzRrdWNmbzVNNHpCMFNoNUg0?=
 =?utf-8?B?MWtEajZIcSszM1BUalhEUkdZTzB6M1ZVd21VTGkyNnJ4bFJvM1hrYUJTc2lm?=
 =?utf-8?B?OXNqSWZBNHJDTUNncjhQSUR0VGpxY2NrSmRvZndrajF1WlpneWcwdWRnU3hZ?=
 =?utf-8?B?WGMrYXFueEtiYktJWlhDRXRZcnJ0eFVqZUtXL0dDaENJM1R3RFR2dkJrQW9D?=
 =?utf-8?B?aVpHTGhaaU9HVCtCNkhDbTN2S2lnbm0yUmRGdTNEZUpRLzdQYWxXdmo0SnZS?=
 =?utf-8?B?dk5Rb29yU2NwVllnS2ZLMnBuYVlzRnViN1FycHZreXRKdy9XTW05U2JJWmdo?=
 =?utf-8?B?RFBQbkZ1VXdjMVJmSjhZRUk2RUZSZ2x0MXVvNEFlVlFxejJxRHJsRmlPVzlT?=
 =?utf-8?B?ZXZ3Mkx6U2lmenNUR1plZS9IVzZtNEU5Nm5VQVVTVXFHOWRmU2dsbGFKWFpU?=
 =?utf-8?B?cldMU3RwVHhrTTYxSlFGTXBJSDdMT1MwMmlDL2x5dldYanpoemhUeUpqRk1G?=
 =?utf-8?B?U1dDN0xHbjNXb0xxYVF2cWtOSW9PWmJqVkloTkpHUk9JWGpTMzlNemplUTRM?=
 =?utf-8?B?TzVKNFVHTFRPRUwrK0cveVplKzhPZ1NUdUpGYzZrOTFUQW5DQUtONzZGVyt3?=
 =?utf-8?B?RkFBRUluQ1ozdUxwUTZ3UXZhVnNydlFuQkQ5TXc4ZU1uc2Z2cForTVpON2p6?=
 =?utf-8?B?bkpBNGFVbEFVU3l4NnpWT3lKbmVYalRsOHk2bWpmb1lySEdhMDBvNHlTMGNP?=
 =?utf-8?B?MDFIdnNIOWRjZU96dDNhaWFHcHpkQXA2ZVBtL0FmeEZzc1VTSW55N3VQaElX?=
 =?utf-8?B?Yll2WkRSYXdaTnFvdURuMzdtTHIyL3A1TXdOTVg5cXJ3aW52NlIwcmhBbjJp?=
 =?utf-8?B?NW1kKy9raXdWRjMveDkyN0sydHEyQ3BEQWR6MHFNSDE3L0FTNEFmM0ltRStO?=
 =?utf-8?B?cm9TNFdGZTUzYWpNUjhyanpoSzkzMGJJdEpaL1VGRERYUGJNb2JNU3VybklW?=
 =?utf-8?B?N3ZDbXMwYmFrZWpjSktyQlhFS29ZMWFzK0dNM2tvNHBKN3FlTlpXQjM2NHVk?=
 =?utf-8?B?QVFEU3N4UzRNalhEa3JlR2NMempOVTFIWW5EZmRtQURGSG9uZEFxUlVkYUFN?=
 =?utf-8?B?YTZ3YUR3MDhKNE9kV0tIYXFLMVNMdW5GTG83eTZWYnByaVhjeG1JU3FIR2xv?=
 =?utf-8?B?NVd0K2NlS2g4OHR6VlM5dktTSFk5SzRuQUJRaGo3Q0ZZUTV6WGc4Zi9iUzJs?=
 =?utf-8?B?bGNIUzluaHFlNkFzNEdodXArakEybWF4QzUvTDY2Ykp6NEtUb20vdzllWEFp?=
 =?utf-8?B?eU1WRDg5aXZtd2VPcCtHdG8rbEhOZmRUT0J0Y2xWTVk3bkQzeUNNUHAySkJD?=
 =?utf-8?B?R2MvMk9yTHhYNTc4MWdhMVRUZ1B4ZkZGRi9VOUhPVU9pRHh5aGFwajhTc280?=
 =?utf-8?B?a2ErT2Vxcy9GaXJJMUhGekJQcWVORjJjS055MFp0NXg0NHBIOWl0bXBaanZS?=
 =?utf-8?B?YmRwYTFKVnRaajFXWGJqTFpUeHNHYmtxVnZUc2l1WDVXcWhrU2YrQ3NaRFlB?=
 =?utf-8?B?aUVhV3VGZDVxU0U5dWZMdWRCWVZoLzR6VVFibnNnb3gza29KR2FveENaSXNv?=
 =?utf-8?B?WFdETm1KSmNMWWpyRGJxZ1RxZkpXQTg4WmxtM1ZrcVpsWDlBcVVtSkhIb1BC?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2f6a37-d6fd-4c51-2875-08de2819f58a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:48:30.1673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSzY8uO39hjZ+idZZ35+2dLcQl8bxemAPT1Xtfsb5SoXN54JJcctZVm7NtlKdPMzz8rS2AZAPodspUTcsKSogbELW7LP4TManpzENngiUNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7343
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

On Mon, Nov 17, 2025 at 11:48:13AM -0700, Alex Williamson wrote:
> On Tue, 11 Nov 2025 02:04:35 +0100
> Michał Winiarski <michal.winiarski@intel.com> wrote:
> > +static void pf_gt_migration_check_support(struct xe_gt *gt)
> > +{
> > +	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> > +		return;
> > +
> > +	if (GUC_FIRMWARE_VER(&gt->uc.guc) < MAKE_GUC_VER(70, 54, 0))
> > +		xe_sriov_pf_migration_disable(gt_to_xe(gt), "requires GuC version >= 70.54.0");
> > +}
> > +
> 
> The latest GuC firmware I see in the linux-firmware package is
> 70.53.0[1], is this newer firmware available anywhere?  Thanks,
> 
> Alex
> 
> [1]https://gitlab.com/kernel-firmware/linux-firmware/-/commit/9444af1a20eb24a39dba0eb0c511ee47c9d2631f

Hi,

It's not yet available in linux-firmware repository, but it is published
in the DRM staging repository [1].
The FW binaries can be found in the intel-staging branch [2].
It's still going through testing, but I expect that the merge request
will happen in the next couple of days.

Thanks,
-Michał

[1] https://gitlab.com/kernel-firmware/drm-firmware
[2] https://gitlab.com/kernel-firmware/drm-firmware/-/tree/intel-staging
