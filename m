Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF1AA50A1E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 19:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24601896F7;
	Wed,  5 Mar 2025 18:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQek/1nR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2ED896F7;
 Wed,  5 Mar 2025 18:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741200206; x=1772736206;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TNpoHMNFdFxafF08ZxQpaameRbCTGKtEimAXiDkCXds=;
 b=BQek/1nROlKyuDKpIIFiVY7qhqxsWpIYYuZjCJRg8HCHuzTAqSjzQO0Z
 t/tE6+LNRlaKi1zvBsL9LwU58gQs94hk2KdHNTQugwScHuExApqLlAZ3z
 /K3/wIySlJTbCBgg6B570gh17VdShuojy4EKPDN+MaUjFeeJ5Soi2K/2r
 qKRmMsyndzt9BfROCiOxErc4B8yHct5EJt9tYRzC20kqLsX+LzeKs0pCr
 O3N+dGAs9LkM0ebdW0O7eUcaGDZp29Ds8EDZ0Qq31y+Cr7A6EJf9kmxBC
 aFrdpQw9rJrDQK3FIfjRD7c9unYJVuU1KpTYPw2nhcd/aVoHYOic4AtS/ Q==;
X-CSE-ConnectionGUID: n2iBAUs1Rda3QPWNAQTnKA==
X-CSE-MsgGUID: F6UEHQJGROe5g0+aqjkikA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59727652"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59727652"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 10:43:25 -0800
X-CSE-ConnectionGUID: 1Oqh3/o2TSmb4vmW/2X7nQ==
X-CSE-MsgGUID: AP2kmUUUQRq2KH0utEEaQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118696918"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2025 10:43:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Mar 2025 10:43:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 10:43:24 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 10:43:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUvl7QEFABTeU0YrgH9TDe2asApuSw+FA3FPcTVXvUyY4OP6jfxeGHWd5Tiop7DlUCONk475XjFujajBiP1VouuC+bRltSlupw3FWe6yAqlm1pWRIEizJ/HknCxOaISepyBnmuZHBp4O+vatCYf51JYwbVBnsczPwybJ09DfKcC3hfOEWIYtNHWlMFOejAHORWLbMM2M4ETcBscP8vEC65F1FAUnCPWRdwncGX/Oz87dkYyOOr5ObvEHVGXh7zC772+2Ot6Q5zNHokmx/6yajkO0l8CtWENZkkdRxHkWTKO78mrnrc8PneGQ0+3RWXilhSRNgEQfgBkzMahrmOKxZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgvuDj1pLP7C7fl/N1OM0XD0AKMNdP1yW31p9wpHV6I=;
 b=RH+wAUPtuuFEXSJyA1gzhNKfHjuzKfjxgBBTSv7Kzu27hQJoBI4TB0ueAyVwgpWDnTvxzHRH0ZqFKH23FKyrH1TlnnZVMV3W4bfQWrPmMpEc9WMh/louxA+OANkaoCPl0ySO4FVrGnqGgymfJjM5mvd8Y0xb1MdMtm9SHhZg8lEghDuM8HcAlpVWnIhEVtewIvNTcK2PgFr6zV7owwa3gOHeyHWBsFI+KW16b6d9R6g2vDL3gP5XBjdt5hGxjJ5AfpN7M827/JksQB4aD2UIq3HtPHo4qDjkVBPuOIj8SshqrjcBlEEN5y2NTSUKfXi6Wgo1QPilAvlkwwUI+nvs1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8060.namprd11.prod.outlook.com (2603:10b6:510:24f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Wed, 5 Mar
 2025 18:43:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8489.028; Wed, 5 Mar 2025
 18:43:18 +0000
Date: Wed, 5 Mar 2025 10:44:23 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, <jeffbai@aosc.io>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>, Francois Dugast <francois.dugast@intel.com>, "Alan
 Previn" <alan.previn.teres.alexis@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Mateusz
 Naklicki" <mateusz.naklicki@intel.com>, Mauro Carvalho Chehab
 <mauro.chehab@linux.intel.com>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Kexy
 Biscuit" <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>,
 <stable@vger.kernel.org>, Haien Liang <27873200@qq.com>, Shirong Liu
 <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
Subject: Re: [PATCH 1/5] drm/xe/bo: fix alignment with non-4K kernel page sizes
Message-ID: <Z8ibh7DIIexKQGuX@lstrano-desk.jf.intel.com>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
 <20250226-xe-non-4k-fix-v1-1-80f23b5ee40e@aosc.io>
 <wcfp3i6jbsmvpokvbvs5n2yxffhrgu6jyoan3e3m6tb7wbjaq6@tbsit7ignlef>
 <Z76WIgGvvhlbYl/j@lstrano-desk.jf.intel.com>
 <af689d4b-204d-495b-a7e8-0f7632b43153@intel.com>
 <Z78vTt8Ph9opzJmf@lstrano-desk.jf.intel.com>
 <cc402132-2e82-41d2-8981-f1b9a795c1a1@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc402132-2e82-41d2-8981-f1b9a795c1a1@intel.com>
X-ClientProxiedBy: MW4PR03CA0203.namprd03.prod.outlook.com
 (2603:10b6:303:b8::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8060:EE_
X-MS-Office365-Filtering-Correlation-Id: a706de49-c41a-4f04-0b28-08dd5c15988e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkkrTms2eTdXbTdsTzNMNHZ4TXJscGRNRkgxQ2xRWHp1b0Y1Vnh2cndmcUJj?=
 =?utf-8?B?TW01b3kzVzhZU3QwQTh2c1l5OGx4TUpwdWpiZ3JmRENtNE93VUUvSzZKWmV4?=
 =?utf-8?B?eXRyT0RSZFc2d2VwSHYvU1VoSmhhZ1AzZVltdUxPMjU5RjhDTHNHRTlyYkJm?=
 =?utf-8?B?QmZ2Qm1pa0ZoK21zWFZGcmNSLzg0NG90M1lnSHdWWjZSSFlPMm56TThESlhS?=
 =?utf-8?B?emtPam1OU1JVcDFKR0VKc3Jla0lDelZKTklvSUlqczd2T3BYTGRpN044Z3FP?=
 =?utf-8?B?WURMMVZLYmE1ZHRUdkgxdXNEVVNzOXRWUTMyeVZvek9uczhudUVjK0EvQ2tZ?=
 =?utf-8?B?MXh5djRPTU9HcnB2OGdBSGpjQ2o1NU5JTkFIOHIwbmYxc2FJZjFSYjFXV2Fh?=
 =?utf-8?B?b1pnOG1UVzYzZmY2cUtpdHlaNDErVk9LdysvV0liNUp1TllxVWRnVktxUkgx?=
 =?utf-8?B?Skt5d1dLNnpMU3FlTWhVS2swOWhuVjFHbGd0UGVoM1ZiUjMwc1ExUUlrNEN6?=
 =?utf-8?B?QlJweC9vd3RoMnZ4NkVRdXpSUnJLR2NIUXZnRUcycEQ0Z3RLZVlIWTFGdWtn?=
 =?utf-8?B?OTZFREczcjN5cW53UkRzLzY0YUEyVlMwMUJ4aGk2RFhVYUh6dHJSSzJaY0hI?=
 =?utf-8?B?RE1kTTJWR1dmNUZYTmZqRDYzOHpibFRWb2hQWXgrTXF5OHlIWjhTeGVmR1RX?=
 =?utf-8?B?QzlldFRuSStmcVdsT1pjV3FKUVpwRW1BZUtPUnpkYUNGdGt5VUpEb0NHTFgz?=
 =?utf-8?B?N0E2UXJhYStoZFVCS3RocUMxMmMyWU5BTGhsMW9YZkYrMzJUNkh1enBwaG9n?=
 =?utf-8?B?eWJncDBVY1NEclBkcUQyOXZyd2pvMUpLR2o4a0JUSHZtTHRjQjFLQlN5VER5?=
 =?utf-8?B?dmVKNkZVRUQwQ0dUdVRjdzR6Z3d4ZGp1ZlVPMTU5Y1lKdjh6Y212dm55U2Va?=
 =?utf-8?B?VHhZc1MvdUl1M2VPYWx6Y3h6YmRiVHM1V1FLOVdDNjFLWG9CK3hlU0s2SjJt?=
 =?utf-8?B?dDY4aVFVcUZEelNtc01SbW4zc2ZwSDY0NlFMZFh0MDlRcmYxRFN6RzdqMGYy?=
 =?utf-8?B?bEpCUHNUU1Y1Z3pTUXNibFVjVmRlOXhRbjNmYnNQZm1QYnRybWZkWmVXcTVP?=
 =?utf-8?B?QTdKcGc1dVIvYmFxSE52cUc0ZW5DRFlnTENaYkxYbUZLTEZwUVY5TUU1WDlh?=
 =?utf-8?B?U2NvQnEzRXFGM1VMVjVLMEllTHBROElqZUtzNVlTZktXRVNramVQTXM2bmdx?=
 =?utf-8?B?SlVoL3NyZk5rSXpJTGl2Zmk4NjB4RFFzSTRUR1Q4RjFhTUt6a0tVa2k2ci9L?=
 =?utf-8?B?NFVuSmhBeGp1Qm5RRGhoMjRoMUF5S21HK2s4V2o0RU9TaTY2a0xCNEtzVXM0?=
 =?utf-8?B?RDgvbjVjV0ovdmduUjRiSE5kdDdnc2xNWUUwWE5vVmV4TVIxNTNWSkp3dUs1?=
 =?utf-8?B?OHl3dGp3SXVLOVB4c2VZNHZyZHlBSi9XNGRoTG8wOWQzS2RwdzREVGxEZXVy?=
 =?utf-8?B?aGJaQ0Y2cjdNUTMzdGUrNlBwNFJXa2IwMEhqbTBmS0R1N3drekNFTmZUL3V0?=
 =?utf-8?B?ZmRUK3k1VngreWFvbE1kSlZ6SHFocTkrbUVodlpVSWpuNXNVWHVvTjFCRkox?=
 =?utf-8?B?ZlR6dDFIM0xGbEorbUNiV3hFT3h5eXpkVVpIenhPYWxXR0FJMXdwM3BEemNq?=
 =?utf-8?B?eXJIb1R5d3c5TER0QlUyWkVnTFlTdUhvek1lTkdtM1crdTNDOW5QSG5UOU85?=
 =?utf-8?B?aUpmQlF0cGZqNzNrR3ljdEUzVWJZZkVWVURCWmR6bjVEVjN4Z3Z5YnlzTVcx?=
 =?utf-8?B?NWFQcmdBaG1NRU1BcU41dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFJhcEFSeFRwWDFiUXpPY2xOV2IvUlZCdXVWSmtMdEV1c1NOeXo4N0VPQnJq?=
 =?utf-8?B?ZFB1czEvQjVNNTI3R0tWaGNxTlJEUGFvQklrZ3d6RkNvck5oUWxPNlJneEE0?=
 =?utf-8?B?REFsV3Vmays3RWhpbkVPbnBnYXU2ZVdubUkyWVhmVmsvVHh0dzNUSTlsbHRV?=
 =?utf-8?B?OXp3d2I1NE0rUi9GVzlDdmVvdlZnaW1aZ3BXTE1IZ01TUlpiQU1qNzVxR2Fj?=
 =?utf-8?B?WWxTWWx4U203OG91RVdtZjdiOUt5TTNxZ0l3TEJrNWRzQjlSaTk5MHVpYlNN?=
 =?utf-8?B?dTVSUTFRMTdXem1GaTNUV0FENHVMTlRuMlFKZDVicGs5UTBtc3FsVDhwRUk5?=
 =?utf-8?B?aHV6eWxCWDltNi9Md01UMTdzNlh1WUl3aWlrN3ZDMXpUL05PYXVUL2JFQXJN?=
 =?utf-8?B?R3U1U3VLeEJ3S3cycEVaeDlrL2xSTVJ4NUpVQ0JwYk93NDBsVWNLNGlyajlo?=
 =?utf-8?B?MlNzMkVrRW9NR2dYeG96WmNSRUpiV2VUQWhrY2FDQkU5RnZJM1hpOVRIWGlP?=
 =?utf-8?B?eHNxTTRHNHZsTXRrdWs0SWJUeWhUNS96RnNFYXk0RmdCT0s0UWRoeEdsWk9Z?=
 =?utf-8?B?NE4wWGJ1aVhkem9BcUxxbGw0MUJ4THhWUFZydzB1a2duYXRKMUdFSzlIblpS?=
 =?utf-8?B?cXVyOFNDQzNwa0pYWlU4SjVZbElxeDVXSFVMYU01UGFVYVFjT0pwRHhJL0FW?=
 =?utf-8?B?SzN2WDViQ0d3VUM1QUxTeXdtVEVTQW5jSjZoZ2taTlVTM2lkTng5STlwc1NP?=
 =?utf-8?B?T3g1V2M5Q1ovbC9nZm9uU1JjZnZFVDNjYTlEN0lmYmdiZjdZU0g1a3hweURw?=
 =?utf-8?B?ZktEYXB5clUvcDF0Nkk3L0hPTC9SQmE0RlQvNFlqRitSczU2VUNoQzk2L09r?=
 =?utf-8?B?aW1XNVV2eVFmTkFBNTRabGxEYjloMCtmbTh2T1JqckFaMGUwSVJmVHZZR29R?=
 =?utf-8?B?WEtKTis1Q0lQNGJDT0dWTmIvcGZXN3l4Y1RuU0pLY2hsUmh5ZzdMaThRWWlU?=
 =?utf-8?B?WTBKUmFJRVFobjZPU2lESHBpbVcrc3h5c0FSODlSeGhQbWZSK3d6ODhxVFYx?=
 =?utf-8?B?MlZtMFM0S2dtbGRWWWtTeExCZFZITVJrSDlRTU05UUo0RXp4b2E5SUxNUXk3?=
 =?utf-8?B?a1hPRmpqZWt1bFZzSnowNDBTSE0zUGpPM04vaVNOQTNhbW9Lam44cExyR0l5?=
 =?utf-8?B?TzZJWi8rcEZmdFZHc0hvRHp5M0VSOWgrb2NkVCtjK2E0dUVtSEw0bjBRZWZh?=
 =?utf-8?B?azVHK1VHeGVsVTA3WnRBZTV1bHJ5Z3MwS1pXWUpvZlBjVmU2bkdmNGRLcEpl?=
 =?utf-8?B?L2VjMFhVYW0xbUo2UlI2TTNMSXRWZFZJVGo1RXNXNEE5aXBTVFhOeENRVHhT?=
 =?utf-8?B?QzY3WEFvcnRrV0hGZjBaQ3Q0UmVXc0syQW9rMlBVam5ONC9UUjdobTY4cFFL?=
 =?utf-8?B?bTJ2MHY1Z1JCUjFqMGhlN2lLTmNVM3hJRkhIK1BhMDFLTHdNOWNtQ0ZOd1FW?=
 =?utf-8?B?S2xoQ3FmUXpKRWpDT01RblI1UE1Eam5oT0V4NnMzbXY3dkJCdmM4QWtrczFq?=
 =?utf-8?B?bW0rRVNDQkYxcm5vd3BrTFVwczJFbzBrZDNtNjAvazFRaFAraEU1Y3h3Y0NK?=
 =?utf-8?B?bDY3REZ4ZE5GN3doUFZxbi9QWFEvZnBlNUlmZzNDTEoyc0VPYzhNRkZSdmp3?=
 =?utf-8?B?YkJ0ODBTZUc4WDg3R2o5WjlWNVE3Q1crbzlGWkx5NW9PZWhWblFhWGdGUEY2?=
 =?utf-8?B?azUwbG5aTFNtTktDcDlQVitHSGwwSzNETHhTbHNpeFB0MkY4Y3N5SHhISUVW?=
 =?utf-8?B?bGY4RDBLTm00OFRsQVZDSjVrMStwT0x1dWVPbDNOWW5LamZqMjdnNmV2ZXJP?=
 =?utf-8?B?UWtmWTRESHMrWWhIUWlYclUrMXhLZ2Rkc0NRU21sNk5TamQ1cTE5enFsOE55?=
 =?utf-8?B?YjZYUUJyNHErMVlrTHkrM0ZHU3gyazkzR0dFMWJNdkVjM2l3QTNsMERtdm9B?=
 =?utf-8?B?aVZBS09Jand1MGhOVTZJbFhTZlZJb094K1V5aFA5NFJ2YkRleDBJRit2dkVK?=
 =?utf-8?B?NzVQeXZPS0dSbHh0WWRmVit6THFKSnIwY01HZENYTkVlZjl1VUJNTjFoQzh0?=
 =?utf-8?B?MGJxdXVTem1pcDVMTWJGdVk2RzdDdjh3dVFRc0x6OW9EZ2lNcHdPcE1pRTU5?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a706de49-c41a-4f04-0b28-08dd5c15988e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 18:43:18.2705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPXmz86Gh4isuSVdJ+1j7r7JRW2DvuwbSISgDg7+xZYzCH7JChRDFXyWRnu6V7Mp71Z9LNR9cWGHcrBg7KxgFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8060
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

On Wed, Feb 26, 2025 at 06:05:55PM +0000, Matthew Auld wrote:
> On 26/02/2025 15:12, Matthew Brost wrote:
> > On Wed, Feb 26, 2025 at 10:38:40AM +0000, Matthew Auld wrote:
> > > On 26/02/2025 04:18, Matthew Brost wrote:
> > > > On Tue, Feb 25, 2025 at 09:13:09PM -0600, Lucas De Marchi wrote:
> > > > > On Wed, Feb 26, 2025 at 10:00:18AM +0800, Mingcong Bai via B4 Relay wrote:
> > > > > > From: Mingcong Bai <jeffbai@aosc.io>
> > > > > > 
> > > > > > The bo/ttm interfaces with kernel memory mapping from dedicated GPU
> > > > > > memory. It is not correct to assume that SZ_4K would suffice for page
> > > > > > alignment as there are a few hardware platforms that commonly uses non-4K
> > > > > > pages - for instance, currently, Loongson 3A5000/6000 devices (of the
> > > > > > LoongArch architecture) commonly uses 16K kernel pages.
> > > > > > 
> > > > > > Per my testing Intel Xe/Arc families of GPUs works on at least
> > > > > > Loongson 3A6000 platforms so long as "Above 4G Decoding" and "Resizable
> > > > > > BAR" were enabled in the EFI firmware settings. I tested this patch series
> > > > > > on my Loongson XA61200 (3A6000) motherboard with an Intel Arc A750 GPU.
> > > > > > 
> > > > > > Without this fix, the kernel will hang at a kernel BUG():
> > > > > > 
> > > > > > [    7.425445] ------------[ cut here ]------------
> > > > > > [    7.430032] kernel BUG at drivers/gpu/drm/drm_gem.c:181!
> > > > > > [    7.435330] Oops - BUG[#1]:
> > > > > > [    7.438099] CPU: 0 UID: 0 PID: 102 Comm: kworker/0:4 Tainted: G            E      6.13.3-aosc-main-00336-g60829239b300-dirty #3
> > > > > > [    7.449511] Tainted: [E]=UNSIGNED_MODULE
> > > > > > [    7.453402] Hardware name: Loongson Loongson-3A6000-HV-7A2000-1w-V0.1-EVB/Loongson-3A6000-HV-7A2000-1w-EVB-V1.21, BIOS Loongson-UDK2018-V4.0.05756-prestab
> > > > > > [    7.467144] Workqueue: events work_for_cpu_fn
> > > > > > [    7.471472] pc 9000000001045fa4 ra ffff8000025331dc tp 90000001010c8000 sp 90000001010cb960
> > > > > > [    7.479770] a0 900000012a3e8000 a1 900000010028c000 a2 000000000005d000 a3 0000000000000000
> > > > > > [    7.488069] a4 0000000000000000 a5 0000000000000000 a6 0000000000000000 a7 0000000000000001
> > > > > > [    7.496367] t0 0000000000001000 t1 9000000001045000 t2 0000000000000000 t3 0000000000000000
> > > > > > [    7.504665] t4 0000000000000000 t5 0000000000000000 t6 0000000000000000 t7 0000000000000000
> > > > > > [    7.504667] t8 0000000000000000 u0 90000000029ea7d8 s9 900000012a3e9360 s0 900000010028c000
> > > > > > [    7.504668] s1 ffff800002744000 s2 0000000000000000 s3 0000000000000000 s4 0000000000000001
> > > > > > [    7.504669] s5 900000012a3e8000 s6 0000000000000001 s7 0000000000022022 s8 0000000000000000
> > > > > > [    7.537855]    ra: ffff8000025331dc ___xe_bo_create_locked+0x158/0x3b0 [xe]
> > > > > > [    7.544893]   ERA: 9000000001045fa4 drm_gem_private_object_init+0xcc/0xd0
> > > > > > [    7.551639]  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
> > > > > > [    7.557785]  PRMD: 00000004 (PPLV0 +PIE -PWE)
> > > > > > [    7.562111]  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
> > > > > > [    7.566870]  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
> > > > > > [    7.571628] ESTAT: 000c0000 [BRK] (IS= ECode=12 EsubCode=0)
> > > > > > [    7.577163]  PRID: 0014d000 (Loongson-64bit, Loongson-3A6000-HV)
> > > > > > [    7.583128] Modules linked in: xe(E+) drm_gpuvm(E) drm_exec(E) drm_buddy(E) gpu_sched(E) drm_suballoc_helper(E) drm_display_helper(E) loongson(E) r8169(E) cec(E) rc_core(E) realtek(E) i2c_algo_bit(E) tpm_tis_spi(E) led_class(E) hid_generic(E) drm_ttm_helper(E) ttm(E) drm_client_lib(E) drm_kms_helper(E) sunrpc(E) la_ow_syscall(E) i2c_dev(E)
> > > > > > [    7.613049] Process kworker/0:4 (pid: 102, threadinfo=00000000bc26ebd1, task=0000000055480707)
> > > > > > [    7.621606] Stack : 0000000000000000 3030303a6963702b 000000000005d000 0000000000000000
> > > > > > [    7.629563]         0000000000000001 0000000000000000 0000000000000000 8e1bfae42b2f7877
> > > > > > [    7.637519]         000000000005d000 900000012a3e8000 900000012a3e9360 0000000000000000
> > > > > > [    7.645475]         ffffffffffffffff 0000000000000000 0000000000022022 0000000000000000
> > > > > > [    7.653431]         0000000000000001 ffff800002533660 0000000000022022 9000000000234470
> > > > > > [    7.661386]         90000001010cba28 0000000000001000 0000000000000000 000000000005c300
> > > > > > [    7.669342]         900000012a3e8000 0000000000000000 0000000000000001 900000012a3e8000
> > > > > > [    7.677298]         ffffffffffffffff 0000000000022022 900000012a3e9498 ffff800002533a14
> > > > > > [    7.685254]         0000000000022022 0000000000000000 900000000209c000 90000000010589e0
> > > > > > [    7.693209]         90000001010cbab8 ffff8000027c78c0 fffffffffffff000 900000012a3e8000
> > > > > > [    7.701165]         ...
> > > > > > [    7.703588] Call Trace:
> > > > > > [    7.703590] [<9000000001045fa4>] drm_gem_private_object_init+0xcc/0xd0
> > > > > > [    7.712496] [<ffff8000025331d8>] ___xe_bo_create_locked+0x154/0x3b0 [xe]
> > > > > > [    7.719268] [<ffff80000253365c>] __xe_bo_create_locked+0x228/0x304 [xe]
> > > > > > [    7.725951] [<ffff800002533a10>] xe_bo_create_pin_map_at_aligned+0x70/0x1b0 [xe]
> > > > > > [    7.733410] [<ffff800002533c7c>] xe_managed_bo_create_pin_map+0x34/0xcc [xe]
> > > > > > [    7.740522] [<ffff800002533d58>] xe_managed_bo_create_from_data+0x44/0xb0 [xe]
> > > > > > [    7.747807] [<ffff80000258d19c>] xe_uc_fw_init+0x3ec/0x904 [xe]
> > > > > > [    7.753814] [<ffff80000254a478>] xe_guc_init+0x30/0x3dc [xe]
> > > > > > [    7.759553] [<ffff80000258bc04>] xe_uc_init+0x20/0xf0 [xe]
> > > > > > [    7.765121] [<ffff800002542abc>] xe_gt_init_hwconfig+0x5c/0xd0 [xe]
> > > > > > [    7.771461] [<ffff800002537204>] xe_device_probe+0x240/0x588 [xe]
> > > > > > [    7.777627] [<ffff800002575448>] xe_pci_probe+0x6c0/0xa6c [xe]
> > > > > > [    7.783540] [<9000000000e9828c>] local_pci_probe+0x4c/0xb4
> > > > > > [    7.788989] [<90000000002aa578>] work_for_cpu_fn+0x20/0x40
> > > > > > [    7.794436] [<90000000002aeb50>] process_one_work+0x1a4/0x458
> > > > > > [    7.800143] [<90000000002af5a0>] worker_thread+0x304/0x3fc
> > > > > > [    7.805591] [<90000000002bacac>] kthread+0x114/0x138
> > > > > > [    7.810520] [<9000000000241f64>] ret_from_kernel_thread+0x8/0xa4
> > > > > > [    7.816489]
> > > > > > [    7.817961] Code: 4c000020  29c3e2f9  53ff93ff <002a0001> 0015002c  03400000  02ff8063  29c04077  001500f7
> > > > > > [    7.827651]
> > > > > > [    7.829140] ---[ end trace 0000000000000000 ]---
> > > > > > 
> > > > > > Revise all instances of `SZ_4K' with `PAGE_SIZE' and revise the call to
> > > > > > `drm_gem_private_object_init()' in `*___xe_bo_create_locked()' (last call
> > > > > > before BUG()) to use `size_t aligned_size' calculated from `PAGE_SIZE' to
> > > > > > fix the above error.
> > > > > > 
> > > > > > Cc: <stable@vger.kernel.org>
> > > > > > Fixes: 4e03b584143e ("drm/xe/uapi: Reject bo creation of unaligned size")
> > > > > > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > > > > > Tested-by: Mingcong Bai <jeffbai@aosc.io>
> > > > > > Tested-by: Haien Liang <27873200@qq.com>
> > > > > > Tested-by: Shirong Liu <lsr1024@qq.com>
> > > > > > Tested-by: Haofeng Wu <s2600cw2@126.com>
> > > > > > Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410a077b3ddb6dca3f28223360
> > > > > > Co-developed-by: Shang Yatsen <429839446@qq.com>
> > > > > > Signed-off-by: Shang Yatsen <429839446@qq.com>
> > > > > > Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
> > > > > > ---
> > > > > > drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
> > > > > > 1 file changed, 4 insertions(+), 4 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > index 3f5391d416d469c636d951dd6f0a2b3b5ae95dab..dd03c581441f352eff51d0eafe1298fca7d9653d 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > > > @@ -1441,9 +1441,9 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > > > > > 		flags |= XE_BO_FLAG_INTERNAL_64K;
> > > > > > 		alignment = align >> PAGE_SHIFT;
> > > > > > 	} else {
> > > > 
> > > > } else if (type == ttm_bo_type_device) {
> > > > 	new code /w PAGE_SIZE
> > > > } else {
> > > > 	old code /w SZ_4K (or maybe XE_PAGE_SIZE now)?
> > > > }
> > > > 
> > > > See below for further explaination.
> > > > 
> > > > > > -		aligned_size = ALIGN(size, SZ_4K);
> > > > > > +		aligned_size = ALIGN(size, PAGE_SIZE);
> > > > > 
> > > > > in the very beginning of the driver we were set to use XE_PAGE_SIZE
> > > > > for things like this. It seems thing went side ways though.
> > > > > 
> > > > > Thanks for fixing these. XE_PAGE_SIZE is always 4k, but I think we should
> > > > > uxe XE_PAGE_SIZE for clarity.  For others in Cc...  any thoughts?
> > > > > 
> > > > 
> > > > It looks like you have a typo here, Lucas. Could you please clarify?
> > > > 
> > > > However, XE_PAGE_SIZE should always be 4k, as it refers to the GPU page
> > > > size, which is fixed.
> > > > 
> > > > I think using PAGE_SIZE makes sense in some cases. See my other
> > > > comments.
> > > > 
> > > > > > 		flags &= ~XE_BO_FLAG_INTERNAL_64K;
> > > > > > -		alignment = SZ_4K >> PAGE_SHIFT;
> > > > > > +		alignment = PAGE_SIZE >> PAGE_SHIFT;
> > > > > > 	}
> > > > > > 
> > > > > > 	if (type == ttm_bo_type_device && aligned_size != size)
> > > > > > @@ -1457,7 +1457,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > > > > > 
> > > > > > 	bo->ccs_cleared = false;
> > > > > > 	bo->tile = tile;
> > > > > > -	bo->size = size;
> > > > > > +	bo->size = aligned_size;
> > > > > 
> > > > > the interface of this function is that the caller needs to pass the
> > > > > correct size, it's not really expected the function will adjust it and
> > > > > the check is there to gurantee to return the appropriate error. There
> > > > 
> > > > Let me expand further on Lucas's comment. We reject user BOs that are
> > > > unaligned here in ___xe_bo_create_locked.
> > > > 
> > > > 1490         if (type == ttm_bo_type_device && aligned_size != size)
> > > > 1491                 return ERR_PTR(-EINVAL);
> > > > 
> > > > What we allow are kernel BOs (!= ttm_bo_type_device), which are never
> > > > mapped to the CPU or the PPGTT (user GPU mappings), to be a smaller
> > > > size. Examples of this include memory for GPU page tables, LRC state,
> > > > etc. Memory for GPU page tables is always allocated in 4k blocks, so
> > > > changing the allocation to the CPU page size of 16k or 64k would be
> > > > wasteful.
> > > > 
> > > > AFAIK, kernel memory is always a VRAM allocation, so we don't have any
> > > > CPU page size requirements. If this is not true (I haven't checked), or
> > > > perhaps just to future-proof, change the snippet in my first comment to:
> > > > 
> > > > } else if (type == ttm_bo_type_device || flags & XE_BO_FLAG_SYSTEM)) {
> > > > 	new code /w PAGE_SIZE
> > > > } else {
> > > > 	old code /w SZ_4K
> > > > }
> > > > 
> > > > Then change BO assignment size too:
> > > > 
> > > > bo->size = flags & XE_BO_FLAG_SYSTEM ? aligned_size : size;
> > > > 
> > > > This should enable kernel VRAM allocations to be smaller than the CPU
> > > > page size (I think). Can you try out this suggestion and see if the Xe
> > > > boots with non-4k pages?
> > > 
> > > The vram allocator chunk size is PAGE_SIZE so that would also need some
> > > attention, I think.
> > > 
> > 
> > Agree. So I think __xe_ttm_vram_mgr_init should be called with
> > s/PAGE_SIZE/SZ_4K?
> 
> Should be fine from allocator pov. But also need to update the upper layers
> in the VRAM manager itself, I think.
> 

Right. A lot of pfn logic is based on PAGE_SIZE/SHIFT and that would
likely need to be updated too. 

> > 
> > > But I think we also then need to deal with the assert in: https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/gpu/drm/drm_gem.c#L181.
> > > 
> > 
> > Yep. I think that would need to be adjusted as well to be bypassed if we
> > are never going to CPU map the BO—specifically, CPU map it to user space
> > or if the BO is not in VRAM. For kernel VRAM mapping, this resolves to
> > an offset within an existing large PCIe BAR mapping, so allocations
> > unaligned to PAGE_SIZE should work.
> 
> Yeah, agree. I thinks it's possible.
> 

Yes, might be a little more difficult than I originally thought though.

> > 
> > Maybe export __drm_gem_private_object_init, which skips the BUG_ON, and
> > call this in Xe to avoid interfering with other drivers' expectations?
> 
> Some other places I spotted are the VRAM manager, and stuff like
> xe_bo_vmap() and then into TTM itself. So it might be quite widespread.
>

Ok, so maybe for initial merge we drop this idea and circle back given
the complexity as we'd just be wasting memory for things like PTEs?

Matt
 
> > 
> > Matt
> > 
> > > > 
> > > > Also others in Cc... thoughts / double check my input?
> > > > 
> > > > > are other places that would need some additional fixes leading to this
> > > > > function. Example:
> > > > > 
> > > > > xe_gem_create_ioctl()
> > > > > {
> > > > > 	...
> > > > > 	if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
> > > > > 		return -EINVAL;
> > > > 
> > > > This actually looks right, the minimum allocation size for user BOs
> > > > should be PAGE_SIZE aligned. The last patch in the series fixes the
> > > > query for this.
> > > > 
> > > > Matt
> > > > 
> > > > > 	...
> > > > > }
> > > > > 	
> > > > > 
> > > > > Lucas De Marchi
> > > > > 
> > > > > > 	bo->flags = flags;
> > > > > > 	bo->cpu_caching = cpu_caching;
> > > > > > 	bo->ttm.base.funcs = &xe_gem_object_funcs;
> > > > > > @@ -1468,7 +1468,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
> > > > > > #endif
> > > > > > 	INIT_LIST_HEAD(&bo->vram_userfault_link);
> > > > > > 
> > > > > > -	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
> > > > > > +	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, aligned_size);
> > > > > > 
> > > > > > 	if (resv) {
> > > > > > 		ctx.allow_res_evict = !(flags & XE_BO_FLAG_NO_RESV_EVICT);
> > > > > > 
> > > > > > -- 
> > > > > > 2.48.1
> > > > > > 
> > > > > > 
> > > 
> 
