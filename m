Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A35A3255A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 12:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD3E10E86D;
	Wed, 12 Feb 2025 11:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZTRnMERg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6877010E86C;
 Wed, 12 Feb 2025 11:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739361035; x=1770897035;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tuzmEQL1HJD0rekSyy/s0jSpYZ2z5hx8tHfESBYCGt4=;
 b=ZTRnMERglo6XTg6NKuhnHYb9O1/Sj81N2Nbf4YAWZ5PeZ3SGN6daSjJO
 SbPt2Rf2w8KWMrBZ0P3azZa45cFASfL1xHEajjuNUGrnRZgpB3gXdY9T7
 wnvJ0Zg6WNBcxhLVWnxdynmShHGSYkE9g09TlbNO+K7K6X2AuqNPvVJ7X
 LC84Kos6dk5jfHCGORzQudiaSgFCxwhPLden2z0hEjp5c15DL8JMoSi6/
 i6nuxJCv4UGys9sM0FaGauq9ed3UZ49ty8QBrkEH7UOv7ht4vkSZTyNKW
 uAs10Bn7N2HxYilVegBVFzLnAtQX53hLVzpkKlCCGVHwn6eYDrGKzSlCZ w==;
X-CSE-ConnectionGUID: CZ21wApJRQKcouLaRjIbeQ==
X-CSE-MsgGUID: J/H+msKCQtW/R99K9p9sHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39897748"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="39897748"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 03:50:31 -0800
X-CSE-ConnectionGUID: y4eASBj+RGOqJ2k2K8cWSw==
X-CSE-MsgGUID: c2epMDlJQxqGG/+8fXeNEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116905565"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 03:50:31 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 03:50:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 12 Feb 2025 03:50:30 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 03:50:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtOMiLtXIy0craIyFFQLrEeI47QEUia0MZKKFcUJLk+kaqKAZr/raEijKxyToEmMv8pDOmWHvFejAp4unE3eLcP39d+9GrtHBvhmW0jZeQgcj4JgMX5ks7z6HVNDCryUCLQX3tnEgLIQwBWymXeGp8jNQjrHpR8XWUqC0XeP5LMuoNuhISRobjjOKy/stEL+z475kRH3oVnw+U7LBND2MeBRq3W/wuq7FmMzHWiZxteDYsdhdQTU/Mi7qnb9RgWG5vhq/5yo7R9hBnIujie4oGDp4TxGE1dthGSS14A6HaiXgA4uGeskIaNHr6VpzZs7r/uGsOGybuxFihv8k4FLSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6YFHcR9i/k5adkyWS/DEkxVInJhHmSNVj1EBIBIDsc=;
 b=Km6gfiT4IQzjY/kEDUvlAX0kRWJ6t5e3OXXgXEUx4OMU5tJaH8igWTOB1ePTKyXA9Kga3WF0YJvHbbqorG8XSG8vxobjdpmBwjihSnNnvc+BgmfYiHiBwOkrsZ7WTn+xWrWmB0HhZLB4QHx3TTeDcvzwNdiBRoDNojySSN7e56zDvyROgq/XEtnSmlSyyoe7dsh3cd2+CDmfbWQOwX2XN7iI9VX4wWymJxwyV+xdWatKO8Cm4FVruI2ZnPo+XAh3lsF9rikKgntXHbgVdibqIjt9syBkyUJhMDxijDoOS3ZpxS7ID7FBRuTHPdkaEGLLdvPPUnvp+gpxDsUHMNI+BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by DM4PR11MB8091.namprd11.prod.outlook.com (2603:10b6:8:182::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 11:50:27 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%5]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 11:50:27 +0000
Date: Wed, 12 Feb 2025 12:50:17 +0100
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH 0/3] drm/i915: Fix harmfull driver register/unregister
 assymetry
Message-ID: <tdyxqxcuigkc54zrrue4e6nqdhczgwbhn7z4bbw4h4kgfqmata@uckh7vqzx6ua>
References: <20250206180927.2237256-5-janusz.krzysztofik@linux.intel.com>
 <Z6n4nx7V2D1z0zWA@ashyti-mobl2.lan>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <Z6n4nx7V2D1z0zWA@ashyti-mobl2.lan>
X-ClientProxiedBy: VI1PR08CA0255.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::28) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|DM4PR11MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6370a3-9650-4481-fa64-08dd4b5b7161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTRyNTVKcElvdHBURG1tMXlBelJrN1FnMncxemx4RU5XMjlOMndtZWF3WW1a?=
 =?utf-8?B?TitCNEY0UWNmUitCZnI3QzhkOGdOVHJ1MHhYS1kyQ0FjVzF1a1g4SUlRZmxL?=
 =?utf-8?B?SVRjZ3RLVFhnTnBoTFJjV0FFd1dKYTN2MGkyVXc4YmxpT2pwNWZMbVJ0L25Z?=
 =?utf-8?B?eTBvSGJMTXNaY0dJcGpCOXNLS1VoZytKN3hpT0YvbmVuWTF5WE1tK0xHaTdC?=
 =?utf-8?B?aUhoeFRoQjNYZ1RadC90dUR4M3VLWjJ1eElYNmRhVjYza0oyaVVOcWJ4MDJ6?=
 =?utf-8?B?K3VkdWUwL1lSWTc0cU9zRXpoR2dOQ2FnRUZ6RnhQSThLUTFwZnhZckZNaHBJ?=
 =?utf-8?B?MGtBYkMwd2JxRzFtQlFjQXdWcWJjTWJ5Y0ZSVURYcTJQSmM1SkhIZVlONW51?=
 =?utf-8?B?NkM4ejJSbHhnQXBYQ3JMK2lvWG9kZEVFaGY2bDVOazd3cG16WWZ4Z3FuQzE4?=
 =?utf-8?B?THdEQ2kwNG1hN0wzWUpDYmdwd3NxNFgzWFRuMXhlM0tnTzNHekluS1pwRTBH?=
 =?utf-8?B?bTczMVNvQ2duUlBBQlFLZHZjaVdRaEFSTUo2MzMzVURPWGQ3eG9SajV1bStV?=
 =?utf-8?B?U0RsaVltT2ZQRHFwWVV3RVJJV3k0OWgvZ1BBbTVPRkx2cHlOeFd0eldVZE1j?=
 =?utf-8?B?NkFPWjRJdS9GS203dFIvdmhueU8yTytFVFJxOHNnN3JwQ21sM1pqcG5EUHJK?=
 =?utf-8?B?cERHaisrenhuT0YwUlNBZCtBR1pldGZCN3BEdjZ1cHZiQmJnRlkzeUs0R2xq?=
 =?utf-8?B?Rmc3YVZBelUxdjFnRWMrdUFVV1U2ZmlGcVVBVFpTeWlWZGMxZ21OeXRDbDRh?=
 =?utf-8?B?bDA1Skd5N0Erc3BlL2JITzR4elNzMEdNVis1Q09VUmMxenZiSW5yd2ZrTWZK?=
 =?utf-8?B?V3UyaTBEcDlZdFJ5RndyQlB1QUI5cmNsd3ZrVWFvWUR4Uk1IVENSVzYrRzBV?=
 =?utf-8?B?anhoRERSUm1HRkNvZEFYa0pJdXloMk5FOHErNzJuZjV2TFd6eS9xU3I0QWJX?=
 =?utf-8?B?VWxPZHlxemVDcjlQUjRuZTlZL2ptL0t6ZE9jd2VBL0NkL0NCMWRmRlEzaFdL?=
 =?utf-8?B?RGhPOFgvM1ByQUlHaXNlQTIyV3RuSURMdmltQWtDUXBUMDF2N2FFdGdSUUx0?=
 =?utf-8?B?c25PWCtUdVp6dHpVQmljczM5TGszUktTdjRuelpUZjJUakREVE9XNUo0QXpT?=
 =?utf-8?B?TEpwM0s3SEczZDZrU3Z4RnB4VG54am9vVGZ4N0dGdHhhUmJCUlQxbkdDai92?=
 =?utf-8?B?VHV1QkpzdHg2bjRVS1dydVRpckpsWVZXRGVyNHA2ZTVxNU5QcnlQc3d2d0V0?=
 =?utf-8?B?UnZPZUpheStlWGQzZXowQW0yVCtUTnczeFhrNlMybzFKZXZIOFR5d1ZoVHpM?=
 =?utf-8?B?RS9WWGN4dExpaFg3c3Y1SkwxeTUxT1B2M29CUVd1Nm54Q1EwL0VCMXVTY08w?=
 =?utf-8?B?ZEJ5cThDRjBJbjZlUnRUcXJROVJ0MDA1OGVPK0JOREJmcUZsclJMRW93MHQy?=
 =?utf-8?B?dHF5bUhzK2kwcE9kam1yd2dIWXhiODljMDFEcnJtNVBwMHRlMXRYUEZjV1FV?=
 =?utf-8?B?TFNRWm9OR2FyWVRVZ3U2S1B2MkNMQVdPYnZyTU1sUmNzcVB0TkhrVW14MVhr?=
 =?utf-8?B?NG1aeTFFTysrWFUvVDZrMTlUQ0ZPY2xOdWxEZ0NVYVJqUUUvaDRlbU5rNHhs?=
 =?utf-8?B?TkR1eEhvc3hNUjFqcm1mdWNxRFVwM2xTVTZ1V2dVR1ovVVpYNXlDNmh6ZHZy?=
 =?utf-8?B?K2x3bzNOSSs5eWxycUJWaVVqTFpNS1A3M1NuLzR6dFY5eXNVNTdpV0hJNjBl?=
 =?utf-8?B?S2FtSnZZOHN3aCt4WFZLOWFzWVVPVFB1YmpOQVVUQ1I1cWR6L01HNUNnSUJ0?=
 =?utf-8?Q?jPBGdNu0ArZSF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T204cW5KU0wvVGpXMk9oTld3ZjFCeGE5OUMxOTRaTjdCUkcrdEExUFlTVloy?=
 =?utf-8?B?Y3BlTjlVYXhxWDZPaFA2S0EwNDlTMU1TUUJkU1B1ZGN2K3lSSVdzRkUxekJL?=
 =?utf-8?B?Y0lGQTRORy9VNkFrMTRHVWN4MmQ3a3NFRWJpQUphRUNpckFRaGVIV3c1RXY3?=
 =?utf-8?B?d21NMmY4WUxFcEFhUytnUFRhdDd2VFZvMW9OZklWM1RrUDlva1BCYWNKOU1x?=
 =?utf-8?B?ZTVBb00vWXNtdXhHUEFPcmMvWlhERWpFRG5xOXhScms0RzIvdm5aR2xPZ04x?=
 =?utf-8?B?MmFCTEpnRGt3WE9rOXJ2SW9KUXdDaHd2bnlMSW9sclRaaDNKTkNmc0xNUFhB?=
 =?utf-8?B?UGpYZFA0TSs2ay85SUVaVi9scHBSZEowZ3RvVmROcnZVaEhDN2FEYzE5bUpo?=
 =?utf-8?B?ZWFpcjdiWi96ejQzSmVYZ3ZtQ3VQbk9PQ2FZMXhSRmNWZWptS3RtbEhCekh1?=
 =?utf-8?B?WjRHNVNqWmE5WkUwSSt0S2dQYVk4QzhOUDNyMkpaV2xEaHRnU1Z5UW9IQUFU?=
 =?utf-8?B?ejZRR0JmZXJPMWh3WXp5Z2pYSUZXeWNMZ2pjc0RKZnVEWDJTa1pMTHpIU21t?=
 =?utf-8?B?Kzltb0wwNTRubSticXhMYlhsb0JrVVhENGFUcit5K28ycVNRbzNKekMxZ1hr?=
 =?utf-8?B?V1p2eTlpNzhMa1Zlb3Q5QmJpZHIyY00zK1J5eHFBTnM3UG0reHVpMW5TZDMz?=
 =?utf-8?B?RENDUHU1Um81ZjRiWXdKOVNmMHlJdVBOb0dNbExONkR0MFVjRmVFUlRxcWM5?=
 =?utf-8?B?ZDV5TkpWVDA2MHh0bFp2WDVNR2lyblhmdmdQWkRoNUR2cHlqQ3FkUHB2L2Rp?=
 =?utf-8?B?YkVDa2Zhb3NLaTJUZGZRQnpDQXc4U2c4RFU3bS8rK21nU0d1R2pDWGhLS2hy?=
 =?utf-8?B?ZkpOejZwdDh5SnBEYzJxaXpVZmoyRFd5WkMyMjZCN3p1QWw2SVFsZG8wSkRk?=
 =?utf-8?B?cXp5NkJjalMxbmo4bU9sZ1FYZk0rVWJQRlJoZHNtRUh2eEx2L3RUUE5qV3pF?=
 =?utf-8?B?UVNuVGM3TVF5bGZMYXZ4VWFaQ0lmUWFjQXdWbGp5eDhmajl4ZDJUQVYxQ3Jm?=
 =?utf-8?B?d1JaaFdSNG1CekhzL2hvVzhDNEVqbUc5eFo1NEpyWDFyWThrODhUUlV0Sktv?=
 =?utf-8?B?RU8yUlRjV3dXcjU4NFMyTkR6Tit4WlhKUWVMN2dGeHJkeEc5THlKZjZXMkJk?=
 =?utf-8?B?Ky9FNTdVODJYZ0pzR090NnBGcnJaSm9XSm5vMGc3ZUxJSDZaNExsdmQrTUNU?=
 =?utf-8?B?YjE2YVJEMmFXekV2N21QM3RmQjRvY2lNcHZkN2h1YTlpRkxHNExmckF3VVFa?=
 =?utf-8?B?TWNmZW93Z3FnY2dMV2JTRlh0ZmJhK1liNEdwZTRwTkVTbU9oaEFnSGVteGNV?=
 =?utf-8?B?eVArOTE3N2IzUFVHMStabjZodkVzTjRCYXNTTVUyd3V1SGdoNEdwMGhRb25z?=
 =?utf-8?B?NnR6QUZMVkdGdlpQaGRDZnZnUW5pb0FsNHBBWHM3MWhudUNHL3lWNVJDalQ4?=
 =?utf-8?B?RndESFZmMWNXQjh3b0xjSE1EZk85MXcvSG1rVDNGNkdjdXhpeWQyRHo4ejJn?=
 =?utf-8?B?WUt3bzlqcnVkallYMHplcjY4YzRGbk84cDBXbWpFSTNseEtlcGI5SXR5YWRl?=
 =?utf-8?B?c3hJbmpJU2JKM09vM1Z2VkNFZStMbVdldTBSQkltQnRuYTJlVkIrWlNibTRV?=
 =?utf-8?B?MytRUjIraXZuVDZsYk5Scytpb293MkQ5SjMzSEEvRk83K2RsbkdVcHJSK2gx?=
 =?utf-8?B?c3FPd1FIaTlFLzVzdHZOcFpPZkFZejhreHVmTzQzSnNSNkpiL2QvNFRZQkRt?=
 =?utf-8?B?VkhLVnlwOW1LZ3A2eEdYbnNmQlc2SUwvQ2VNOVZ3Wk0yUFJiUDJRbFZ1UE41?=
 =?utf-8?B?Q0JZSnZPcktRT04rYzQ1M3o2d2o1Zm1JMzRWdXd5eFZqT0lCZ25KMVF0MzNS?=
 =?utf-8?B?bnpNMWhUKzRmTTNqR3EybXlUaUhqQkVFb00yZjQ5aEwrWENTbnpCSEoyUERp?=
 =?utf-8?B?c3k0eCttVnJOTTJWVG02azlwV1RyMjhMeXU3cS96c3lDL052UFArK1hlb29Z?=
 =?utf-8?B?eVRaTUxndzBQTU05bWw1YXhvYk5RZkE4MWZqbnBWUHMvNyt1dVRPSUZJZEE5?=
 =?utf-8?B?azFGRXpKaFJERlR3VFIrY0QvMkdsTmc1a2wzenlmSzFHN2hlRzkxQzZWZWpw?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6370a3-9650-4481-fa64-08dd4b5b7161
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 11:50:27.4277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tD2kbpbznoKSpyHfyb4UB6S1zSQ2j91bwc2tvgjJuuHJabBTNcYoWMgx5nqreR6juF8UpRWojIIjEYspzPpL8K6A5rkp3NOJM+gWEV2tqVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8091
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

Hi Andi,

On 2025-02-10 at 14:01:19 GMT, Andi Shyti wrote:
> Hi Janusz,
> 
> On Thu, Feb 06, 2025 at 07:07:38PM +0100, Janusz Krzysztofik wrote:
> > We return immediately from i915_driver_register() if drm_dev_register()
> > fails, skipping remaining registration steps.  However, the _unregister()
> > counterpart called at device remove knows nothing about that skip and
> > executes reverts for all those steps.  For that to work correctly, those
> > revert functions must be resistant to being called even on uninitialized
> > objects, or we must not skip their initialization.
> > 
> > Three cases have been identified and fixes proposed.  Call traces are
> > taken from CI results of igt@i915_driver_load@reload-with-fault-injection
> > execution, reported to several separate Gitlab issues (links provided).
> > 
> > Immediate return was introduced to i915_driver_register() by commit
> > ec3e00b4ee27 ("drm/i915: stop registering if drm_dev_register() fails"),
> > however, quite a few things have changed since then.  That's why I haven't
> > mentioned it in a Fixes: tag to avoid it being picked up by stable, which
> > I haven't tested.
> 
> I'm not fully convinced about this series as I think that you are
> fixing a subset of what needs to be handled properly. What about
> hwmon? What about gt? what about debugfs?
> 
> In my opinion we need to check in _unregister whether the
> drm_dev_register has succeded and one way would be, e.g., to
> check for the drm minor value, or even set the drm device tu NULL
> (first things that come to my mind, maybe there are smarter ways
> of doing it). This way we could skip some of the _unregister()
> steps.
> 

Is there any situation in which having the driver loaded after failing
drm_dev_register() is of any use? Because if not, instead of recording
the fact of registration failure, we can just stop the driver from
loading altogether by checking drm_dev_register()'s return value,
then calling _only_ the required _unregister steps as cleanup in an
error path, and propagating the result up to driver probe. This way we
don't need to store any additional information at all.

> Andi

Thanks
Krzysztof
