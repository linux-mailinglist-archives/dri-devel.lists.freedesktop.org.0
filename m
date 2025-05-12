Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5686FAB2F55
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 08:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0C110E182;
	Mon, 12 May 2025 06:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DJaJ6I+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959E210E099;
 Mon, 12 May 2025 06:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747030156; x=1778566156;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ckUFhvJca09G4o4ploGSpxEmxt7ij29cClNEz1JOaVM=;
 b=DJaJ6I+JXmu5grfiiFpSTUpdcsXnBXjMDgiH185aLxKwdtDdBAE+f9Rh
 WdLz2GWl+yBa3las0hzCVCgqU2Z3kpP7vt0UgeklitInGObxTcKeQqdG8
 cGBcWFnxFLe6JtyZbF4u+hRjeod5oDiq0NqmjDThJ+ysr5g0nP5C6zKyE
 NAexvO2X5az2QRORYNcF9Grti5B2V+BwoxTQakB/z4AHo3jgIq35bs7kq
 ruciNhmoVKhazrDysZDS4ZtIJgt/7IK2KmEwoQjZ1o3uSWtKQhhSuWos+
 L9+nOS7bVg3DNoWe0l992lAvkDZG0N9JqRN/sCkH8zOD0wkZiQwA6rNKE g==;
X-CSE-ConnectionGUID: aXV/m+iNQsSdzIkJTtze7Q==
X-CSE-MsgGUID: 4PDIlL+YToCtBImymBvsxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="36437960"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="36437960"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2025 23:09:15 -0700
X-CSE-ConnectionGUID: ZASXYO/BQpih9T6LICYITw==
X-CSE-MsgGUID: e6WjVfkCT1Sfy8q4m0p3ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="137283527"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2025 23:09:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 23:09:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 11 May 2025 23:09:14 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 11 May 2025 23:09:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9HC0D+HDFrRhq1UixOdhyiCM8bfLXT8/r7D88yTiV+dJR5Cl9Wz3fLiiuvl0XtU5kGKGz7j+hN09iJXFBjqc775uZKP8SeKj1oiDZHEvZFpR8yJoF56/jrpQXgirEyijgPpekuqboR0OYFAFa9sFYLQx/hRSWOTq4lsGs/nvRBl9E142eUb4AfelRCn+UQBAKY+qbS3CdezqtXfwSWG5/GqlKUKpmub9QjOw/cfJiNs7BA+sbzDYUeq+WK4V0/wooUOIB/VT1mtP7LsuWroDqeOzWntt7+6bAwW0NVJm+wSueo0wY9jiMpc5lwvPoaVL4N3UP9qNpBTp7AURq3olQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Am4TwqYArpJYB610xNAtII01mxXNM0KOcq34BrnGw2o=;
 b=Oit+/LC151x83iVNQ5+32Vf2RzFU/POpJdS0BPz4EY/w/QaymizLNrRhgBYmL0qd9XKigE9CZuE7oKt6XvE+ackUjxZUDr0iQt5lX+Hr5vzpfX59v+c5ajL39OtViR3TeVKZb/ttw9FSX3pV4LJqQLFd2bH4UPjCF5OauDu0OLGEiMXkRHIhV5ejnkW4DlT3feVZHlQVO8PGrWKwAwCg8PG5oHtzciDaVgOkr/W9u5UF/8jPl/ZbT+n3Hw48gvEANzCSIc7B2whvM6NKIc8FYzv4PfzB6n/3b6QzgKfDQzVoGNR/JeIEET/c3zbLHqJAFKLG6s8SXG1ro0BAd38Oow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CY5PR11MB6438.namprd11.prod.outlook.com (2603:10b6:930:35::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 06:09:11 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8722.020; Mon, 12 May 2025
 06:09:11 +0000
Date: Mon, 12 May 2025 06:08:59 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
CC: Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, <siqueira@igalia.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, Raag Jadav <raag.jadav@intel.com>,
 <rodrigo.vivi@intel.com>, <jani.nikula@linux.intel.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, "Pierre-Loup A . Griffais"
 <pgriffais@valvesoftware.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>,
 <amd-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] drm: Create an app info option for wedge events
Message-ID: <x3ep3offdy5on6hckumvpsvnlfnmjdfqjlcyv7hojitzsn5u3k@opnou6grp7ad>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250511224745.834446-1-andrealmeid@igalia.com>
 <20250511224745.834446-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250511224745.834446-2-andrealmeid@igalia.com>
X-ClientProxiedBy: LNXP265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::20) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CY5PR11MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb07e22-b859-4f12-789e-08dd911b8382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFRoKzA4NHd5d3NaK3NHdDRlQjFJdEEyTGFGTm1TUCt2RGNOSUNRRThIaEx2?=
 =?utf-8?B?d3FxbGxnQmcrcUxCa1lrZzYvUktCTzVqMVFXMVB0Z05ZT3JHT2dGUzJTRlY3?=
 =?utf-8?B?MEU1OVIxMzJNMHZVcFZ0NjhRQnZkaUk2YXIyLzhOOEMzU2tjVDlnMTZMa1Ra?=
 =?utf-8?B?UlBZM243aWF3WDYyeHhnczFQQkUrc1hMMkVHWTA5cjBzY24wcWFnWEhQTWxF?=
 =?utf-8?B?OUhjOXlIczRUZTU5eDVEcU5jaHpab2EvQlQzNjQzWVI4WVlYRzdaaXIvWkFQ?=
 =?utf-8?B?WHg5bUlTSFU0dnFmNi93eWc2bUxHeS9DMEFnUXF1bDV4d2NBQWFRQmhBd2NO?=
 =?utf-8?B?MnBpaWxJNjlHaEdOR1ZUUFg1dkIvdEhYY1dDOHkvWGZjSDh5Z2QrRi95amxu?=
 =?utf-8?B?U3FxcDVsY0pweWdnUU5nREh6WExaRC9hVkNnTEVBRmdsRXNJMGtoTHpURXBJ?=
 =?utf-8?B?YS9ZclFWR0NNNzdOYnFmV0xNV3lUZ0tCRUdoQ2NjTDgyMFdSOXpaS0RtaUdi?=
 =?utf-8?B?OTF5QytpTm9WOVhwUXd0dFdJbWZ6ckZpRHBLN1hkSFhWOVdYeTFEdUtLTTRr?=
 =?utf-8?B?bzRtdFhBNHI5RENIUmRZYWJZcUlWczkwWG9Lc0VTSitwdEc2dEZCbUI4VG5y?=
 =?utf-8?B?TG9rNHB0dEdmdGk5NnVrdDhpbVdrWlZhQ1JFL205RWd3dnlCWEY5WVlqeHRq?=
 =?utf-8?B?aklJNU4yNWY1cDZQTXZXN0wzRHNmT0syQWQ4a1VlcW1idlNIUGt4YnFoYkJ2?=
 =?utf-8?B?WklFcmVCV0kzODZPcitYdGZXTkh1N2lvRzl1MS9QUjQ5THFWSHEydGRhOHVT?=
 =?utf-8?B?ZDlSN1F2WTdKOFZlUjFqSVVkSWZqTmFTR01OeER0MzYrd01Pc0hRMDBQOWhX?=
 =?utf-8?B?NTg0N0MwbzNDZWxIRk52aFV2Y2xWOGp2ejk5eWdXNllEdTNxMUxTSGZTVnA5?=
 =?utf-8?B?MUhrN25ObzBpUktTaGw2L3RrY0Qxc1puNDhNWXFQZlRMWW13WThJRWQwOHZy?=
 =?utf-8?B?SENZZmUwcVM5WkNFRndVdVRYTnlwNHZPRkp0UGZSR0ljV20wR011OXJGWDk1?=
 =?utf-8?B?QlFaQTFtaGV1MnA5bVplazhJUjBWZnNwdnVSRlJEVkFWYUVKa1FMazRxdVBO?=
 =?utf-8?B?SS9WbXc0bWhseEVoaXlPdk1iTEowYWtnaDFkK2lCOFJmZTJOMUxVNW1Pb0pO?=
 =?utf-8?B?MjJReXJJTVZ6NHRVbWk3bWREQUNQemJvRGplTlIxTUN3b3grNDdURklua2ZP?=
 =?utf-8?B?c084MnluY3dwQUNJSnMyWFEyZ0hRbkJHMWJiRFJBcW9hWW1ob25pc3E2MG5z?=
 =?utf-8?B?K2NyL3l6NXlnZlZxQU1uekQ3dngvVExoZDNIU0tUTUtHOFhieHRseGpPQTZQ?=
 =?utf-8?B?R0NNcTRaV1hpUGljSWpucjdMVnFmSEJacklQY1lQQWYwRmJjODh3aTAwRzhp?=
 =?utf-8?B?bHNUTTZYdUI4a1I3cXV2RmRkWDBacFExeWxlekRGWVhvcmtYNWJaN2lBMkpW?=
 =?utf-8?B?K2pzczlmMG9Oc1pxTjdNUjU1ZjNPbnVBNDRQVEZ3b1Z1UlNlSThnZm84ZDFL?=
 =?utf-8?B?aVJkTEcwNzVSRStNTGlOY3dCQUZjOVpPR1U2M2JDZjk0NTRUMUZLV3VEOXc0?=
 =?utf-8?B?YkxDS25LWGtsMnRDeFRhZHRQc2JUYjlCTndlSGJtbmxvOHlxVXVickhaV3RX?=
 =?utf-8?B?bEVHSUJUeHJsM1JnbUl3WDAwWkZIVzROMTQ4ei84SjB1UHJTVWNtSm1vd1c5?=
 =?utf-8?B?bkx5QjhaSUVxZ0ZiWUhzMEZhZE9lMy9KWGwwbEJYR3NicmxQYVJjSmhsRjhi?=
 =?utf-8?B?cTh4K1RMRnp5M2tqTTNHRlVCMnV2M1YxZ2NJcmtVdVErWm9uckRkai9VRDFC?=
 =?utf-8?B?Q3cxWFBsODNHSDBpVCswTGZpMHhqdWNIdEZYYm9YSWI4WW84elR4Vmd1bUEx?=
 =?utf-8?Q?hb/8ORZcIMM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVV3UVNyV3hSSnhYN0VybCsrdGx1R3JKNHk4ZGl2SVlzbkYzaEJpcnFVVmRs?=
 =?utf-8?B?RU4rTDdyZkl5RzAwekN5K3l4ZkFYczJObkM3N1hjdUtja2FoemZybWFlWTNB?=
 =?utf-8?B?Qlh2TFdzcWpQc2kxWUxLTTJWaFo2SzVWcjZSdVpnb3JYc3FGbWVtYVNMMXpZ?=
 =?utf-8?B?THZjVWJrK1g0TGI4TlhTRU1HMDVYaWkxN0ZLRHFMTmUrVW1MQStGRVBCbytu?=
 =?utf-8?B?cjcxbUR2MXViL0pzOS8ydUcwWHhPaHpOS001RVpiV1dXcEZ3NWtKK09FNXlw?=
 =?utf-8?B?cWVnR0VRcTVQUE9qdGI1SDYrUDNIS1REbjZlM0JOSUlQY0JndlVVeUFKT0lh?=
 =?utf-8?B?dU9jcXpxTzhYRjBIT0hlenBzYnI0TUwxYS8zSHIrM2VsZmNiRDd3QkFCRzUy?=
 =?utf-8?B?Y3g2dEpveGYwY3c1a2ZLYk5uc0JqYnVFZUExb2JvOVkrN01ucHBLVGgvYnZB?=
 =?utf-8?B?b3I0UlA3WGFoWlhGNm5CYmdjMVZkZk1PeTlRSWcyT1J2cUF0SjlWdnAyS2c4?=
 =?utf-8?B?djYrbGpsOXFPR2FBd2ZKQksrbFhJN05KaFJVRkU0aGRZS08xSUwzb1M3S2Q4?=
 =?utf-8?B?blh1TGcvTE1idlZvV2pxV096bS9ZdTNocjZob0lVZHN6eGFJdVY2UnVxYnpm?=
 =?utf-8?B?WVVHSGVnb0dIODN0cXpvRkxUVTR4Zkh5UW9YSjVqU1RlMlEwZWVsKzhmZWZv?=
 =?utf-8?B?c3ZGYStqUk9TNzZENTdCdmZwblVXWUQ3bVR2NmhRTzZlS1I2eE5rM0tOb2M4?=
 =?utf-8?B?bTVhY2grdXF0YTBmbnVTMVJHMnJuamEwTDlZaWZaZmo3TWhBdGhTV0lNY0ZM?=
 =?utf-8?B?VExiQzVwY3pyQTE2bG0rOGM0RW43T3RtR1hpUE1vZzloTFloR0o3SWc5aGxP?=
 =?utf-8?B?d25NYTczdG5LNEU4TUJNbmxYbGlzMklPbFJOa295bXVzdmhjRUdLTVl3K1Zp?=
 =?utf-8?B?TnVRUkl1RWpRYzY4N215dGFuU2NpdWw2NjdaampJNjVCOUc2UkhkOEgwN0N4?=
 =?utf-8?B?V29nTFo0OU1qWGwwREIwamtFNm10NzhDVm1aSEdvVmdZVWR0NmVoK1QvY2Vx?=
 =?utf-8?B?WkJXSnBLQ04vZVVXeWMzYVFCMW9Yei9ZRFliOEFZTFNJditPVEpVVHFzaEtS?=
 =?utf-8?B?czZFVWJLazFXUGQ1UjZUdzhZdDJ3RU5Yalpua0hGOFcyNEErU2VBMmFyNk9W?=
 =?utf-8?B?aWxhbzc0V0NqUHdwSW9FZC9sUXAxREF0TXNUTGNUbzhSMklPU3BJOGNFSm91?=
 =?utf-8?B?QU1qRkxvN0U2ZUdneU84VXloTis3U0svK1VwZVpuc05LUGo0UytFWTVwYUNy?=
 =?utf-8?B?bzFvV2ZDTVZ5ZmxMVHV5c3ArWGZqWjBoTlR1UWptaXNOci9yQStPWFJ0Qk5y?=
 =?utf-8?B?aGYrSXorK3UzZU1vM3loclFvYlg1cUo3ZFN2RTlKa2paNGJDTndCeVJwSWRN?=
 =?utf-8?B?cnFBOVJ1VDNiWVhuTC9PTCtEWTVnUy93azRDRExZMm5EM29VbjZnTDFEZlJV?=
 =?utf-8?B?V21SaGtkNGFLSDNhbzVTZ1FvaVRURHRrem5NbUpqb1BVTWtIdnBudmUvaXdC?=
 =?utf-8?B?dk5XdlhKY1psRW1sVk9NM1pLZG5CY3cwZFlyaHJNYTQ5TXVPMU1CaTgreElj?=
 =?utf-8?B?bGVzZ1YxTmFkeHNjekxGWVdWb3F1djRGbTVNTWhWTFRhdkFKeU9pUFdTLzcy?=
 =?utf-8?B?WTQvQ3R3TTV5Ky84Zllqbzc4TlYxb0N1c1o3alhZNEtWdWMyUGY4UzNXL0w0?=
 =?utf-8?B?S2pLSXlqV1lSMmoyMlBJc3lWalJHNWdMcHVUenM2ejZjUzNKc2JtUk1PeTBN?=
 =?utf-8?B?OHRGZ1ZCV21RUU95THBtVk5ndEVtVUR2aG8zMWhXL0pYUjJURFhmZDY1UHBL?=
 =?utf-8?B?KzhRK3JtZ0liYWo2aEJkUjhEZ0h2dHVVWTdVanNzbzhuS1lMdFJ0WFFGbmsr?=
 =?utf-8?B?Nmh6c3gyN1FVNE5MTXJscC9Zazg5Tm5GQ1ZmU1l4Y3dROGZYczB2QklrQU5t?=
 =?utf-8?B?eE5kL0xDMnhXU01Tb2VjekRqSHAxdklRQzdQNmp3SWFhSmU2OU5SbWM0TTNU?=
 =?utf-8?B?am9LYVRlVng5UWhES0NWZlZjVFRUV2dnSFliMisyNVNyYjNUOStWNXVuM2d5?=
 =?utf-8?B?ME1NZHZxck4xdlQ4dk1lTWZ1aFdYWHc5SHhPVlF1YStEL3R5b0NSeXNDTHZT?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb07e22-b859-4f12-789e-08dd911b8382
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 06:09:11.5708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YMRA6ztyImOmXU6mHf+Se/uV8n/EpYFLh2Kz9W/USvNHwwptBjfWx8sCRWJBD7tYZe8PgJNot0JPUjhR33leF5UgmN87xuBF2i4nu3z3Zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6438
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

Hi André,

[...]

> @@ -582,6 +584,14 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method)
>  	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
>  		 "but recovered through reset" : "needs recovery");
>  
> +	if (info) {
> +		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
> +		snprintf(comm_string, sizeof(comm_string), "APP=%s", info->comm);
> +	} else {
> +		snprintf(pid_string, sizeof(pid_string), "%s", "PID=-1");
> +		snprintf(comm_string, sizeof(comm_string), "%s", "APP=none");

I think using PID=-1 and APP=none might be misleading, because
something did cause the wedge if we landed here. You could use
"PID=unknown" and "APP=unknown" or ensure these arrays are
zeroed and fill them only if "info" is available:

-     char *envp[] = { event_string, NULL };
+     char pid_string[15] = {}, comm_string[TASK_COMM_LEN] = {};
+     char *envp[] = { event_string, pid_string, comm_string, NULL };

[...]

+     if (info) {
+             snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
+             snprintf(comm_string, sizeof(comm_string), "APP=%s", info->comm);
+     }

Then, when printing the logs later you could check if they have
a value and only use them if they do (or handle that however
you would see fit :) ).

Best Regards,
Krzysztof
