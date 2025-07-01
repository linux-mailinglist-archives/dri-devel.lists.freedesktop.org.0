Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DE5AEF8A6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 14:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200B710E03E;
	Tue,  1 Jul 2025 12:34:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOYZTkdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B452310E03E;
 Tue,  1 Jul 2025 12:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751373296; x=1782909296;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q3wxTr/Na0N5LF/M67/LaqV0YkzyTdYsFtqYh74+R1k=;
 b=kOYZTkdYXwb36MaKDBAIKKezNzu+xgO4s+VDro2ir0lIqlfTjwXHWRqm
 Sm6oPAcP+qQqDKEtMwDC96WNqYeaysRzs64kdUGCFj4kBMenWIBvkyC9R
 gl2BQmunCiW10lqyAHn4LzI1STAj1vCEoD8WX3qh2dVY0n9whJQan1kMf
 /v/0kE/YfNZ375wlLeAbRMdfqSHb/Tbw1rX18fneR4K4O51qyTBA+jCuD
 P1Zi2/sCuAWKHfw/xrAWOTgbFqxn+yjV7oJnYEfrop3kDIKrUDzP/oU33
 6G+4EL2adMiHSvP+3woScni7BAmuxSprIUyjllqo4NoRdxph57Iz3j8kn Q==;
X-CSE-ConnectionGUID: VAaDZK2hRnGzczbr0GWJIA==
X-CSE-MsgGUID: wo0vtOPKR4iLZqzHy/pl0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="56263278"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="56263278"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:34:56 -0700
X-CSE-ConnectionGUID: yURANzKATvOxKPyfNaoUdg==
X-CSE-MsgGUID: s/QU49UhS86T481ZK9NPAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="184805731"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 05:34:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 05:34:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 05:34:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 05:34:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+OWpoi4o4MSS83VSad9zLLYqrGMfEuuHYqyufqD3kHCMiyU5gXs7phi0d48aakPPfIMCDFsCNYy+FObOh8F5ustMJ7RI+wci7ioNSFEuAL3oTUvQ/+sSjMqbXUK8FvtEtmMNACefnOskdqRpXShCMRes2SAcbiR+SAAYgeIbXfW5low/isAMddykwSNNBnVZEocMydU+cllZsJ3x6pRakK3bborg6/FBRzmgKv8UwwnEGVoRsZNDtqVIPIKCMHXOcGwvagkozWtdlJoVDrhhevEi+ttEQSTiYhG7/GtiMyZvprIU7/AEwlGH0J3T7dewfwFsDs761ljiH4GeEzf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+gK2GrxxCqyZJQvDu2MlHmFjOBuitMU1dkCl7wa+Ao=;
 b=Lh7xdYDzxlbuXKpE7D2os7/FUvHQs7/FzOkexsth4b4D8pgPPPAjGnwhmfm9KE5mGrZFSwxsPaFMqUXIF39tvz1o4kVK4GqjMzFNmgimOpOQFpTtRwJbsO+Jaw/ZsKJd4h7kyTxnfSpP21MmSaFv/GMXfDlbygvnFr7cah5R6vilKFOMBAueshBIy6wlhQrZQbNphjUkmVn0OqeFxjzn6+Uq9UCR8gWlURyll7IrYZUQXz0W1BxQlDSAFGlzuA7znuaOCCrqQpNOZ+b9IpkdKXrFyUE4XKSsi+hFqPdMoABmbCJDBx+mFpJ4hztlfOPfHoBxrxgCf/xMRoLQH1ARHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB7919.namprd11.prod.outlook.com (2603:10b6:208:3fa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Tue, 1 Jul
 2025 12:34:13 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8880.015; Tue, 1 Jul 2025
 12:34:12 +0000
Message-ID: <eab7307a-d6a2-402b-945b-674e9c5f608b@intel.com>
Date: Tue, 1 Jul 2025 18:04:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] mei: late_bind: add late binding component driver
To: Greg KH <gregkh@linuxfoundation.org>
CC: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
 <2025062834-scraggly-barracuda-7ea6@gregkh>
 <205cc43a-4254-4d27-9b4f-139006e871e4@intel.com>
 <2025070140-dad-jaywalker-0774@gregkh>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <2025070140-dad-jaywalker-0774@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::36) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 120733c6-db14-42d0-5a74-08ddb89b9598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTY2b0hpajdTTDhnZWdJb0ZNd3g3cGxQMnpFTnp6a0dtSUJlc29jM1ZBbXB2?=
 =?utf-8?B?RU11bXQxck0raGtYczZsUWFDeDl6dEpBRkZ4NjhLRFlIenBYenhON0VvU3Uy?=
 =?utf-8?B?UWZud2hkbnd1TTRZVnFsaXcyQ045V2hhNmd1eVJic1BRRkZ0SGlCMVRsSFQ5?=
 =?utf-8?B?QW9pa0JzZ09HSTNrcXU5OHllNUE5b0FjbGxldktvSFlxUGxtaTlZTDdiQitu?=
 =?utf-8?B?N3pEVUIrbS8ya3hRVmZneWIyM1hac3lkS01Ma29FdXZlbEJPR1J0bjh4ZFZG?=
 =?utf-8?B?bDU0RG0zbERWZjRueHJiZ1BXS1dVNWU5UnozSXB2WHI1UXNrRzBDdVRxL2kr?=
 =?utf-8?B?cU4ySkhSa1Y1UmIrNnVWZHd5SjhxaS9WTlg5MGNEYzk3bWZrd3JXNDI0Wno1?=
 =?utf-8?B?RW1LcWdzeG5TY3F3TCs5V2JpM2NQc2VDOFFzQkJRVXJlSVJXQXZXaThUa0hI?=
 =?utf-8?B?YUFkdFFyQjVJTUh2Mlk2N2RJR29qcWFLaXcvT2pjVVFDeU1JTDU1bDZzajR6?=
 =?utf-8?B?aHNHeng1TG8rbTJKOUZRaml5WXNQbXhVdlM3YnY1MzhMaktydERtN01laUp2?=
 =?utf-8?B?QWxMNjFKTmJKMHJSZXg2b2RIQjMxWitnZ0srRVJsYldvTmk0cG9yOFd5M2lt?=
 =?utf-8?B?a1ZJdUR3cHZJbUFtQ0JHdzF1bHJZanhoNWZMYUZ3dVV3RkVQczVKSEpseDZV?=
 =?utf-8?B?VVJsQ0x6TEVTQ0xJdjBqMlJCVjZDZUlNbzIvWU03QkJ5ZkRUZmJ5N2poYVB2?=
 =?utf-8?B?VVFONU9wRC91a1FlcDVkV3c2VW1zZ0JOakcraTQvd0RkT2xvR2o4NlNXZ1Zy?=
 =?utf-8?B?MlpucTlNdkd4c3hsYTJScUZkRVZ0ZDVEcS9ibG1OLzdRRjN6SzVUNlpWMmhl?=
 =?utf-8?B?Sk9Ra2dCWkNyOThEUlFNRnN5UUtOVHk2enUvNFJFeWszQnltZm0xMURBSTd2?=
 =?utf-8?B?akF6TlUzbzdIeDlsWTJaclFSM0h3Y0Y4bjlKdFBWOGQvY04rZmppWWJzcU9x?=
 =?utf-8?B?bVBQY3NoaVVjNmNDOVlWdHNaYXFySU1XcW9DMXdVUEdnMk82N0QwdjJEb3Uv?=
 =?utf-8?B?eU4vT1ZlUmdPOXFwV0hDVDVFNUtOM1g5ZkZqdVhCYWpKakVDdXhzak1xb1g2?=
 =?utf-8?B?MElHN1E1eHhMK1lwc01XVVBVQlR5WVhEcEFPKzdZQjNZM2w4WTlFL3FQNHZ2?=
 =?utf-8?B?M0FUQmlNNWwvOGNPbEIwVkVWaFlXZHRVeWVjYWZXWHhwRnptRTc2RFJHZWd6?=
 =?utf-8?B?RVVsODRTL3I0VVFOZDQ5bUtSZWhDSlM4QzFmSUltOVdVUmgySGpETXM5ZFZ3?=
 =?utf-8?B?MEh6Lzk1Q05aZmJtWFBldmh0Mit3QWJGeGxZZGJMNDFBakp1KzdNNmIrT1NF?=
 =?utf-8?B?Y29kMXlsSHVZSFAvdWxXbWVKQ0JtMGpadEhrcmJ1ZFJONlF0ZXhHeEhYUmdU?=
 =?utf-8?B?R2svMTVuZzlNVmE4eGM0V1FIWGpNYXpyYVlNRUNTQmljMjV2Zk9RWjYwT3VB?=
 =?utf-8?B?MjVrZkRtMGxiK1N4STM0dVkrU3ZrYlNpUEJOYTdweG1nbUZSa2NrRDNnSVRC?=
 =?utf-8?B?T3F0RlcvUjVmc1F0M3BhandwZ1ByTml0SDZZM09JaWdSTTFpVHYzVHJkV1da?=
 =?utf-8?B?ODdMbkdqM1hlNFg5cjhxa2pwN2tRYmk1ZU5XaXIybnA1KzQ5NFlweEhySGNz?=
 =?utf-8?B?UDdwN2VmNlBiODgzNFpYNUVXUGxBMHp6a3o5TzlENmZGWDRqSjFFTE5YaDBr?=
 =?utf-8?B?VkhXYUxiazY3OGVZNHZNRXhHRlI2bzJweHhWMldwQWg5SzI3SXlBV0J0VTdY?=
 =?utf-8?B?SDVnZ1lKZ3B2cCtFVTN6SmNFNDU3cis4ellCUCt6WklXdTVxeTgxK3o0ZnY2?=
 =?utf-8?B?TVpFMlU1UW5paXNUN3lLZ1NQcWRvSlN5VWFmb0F5a2lEZTJ5OHZ5czVlRVJY?=
 =?utf-8?Q?M9y0QOIIzhU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0hNQVpyeERsajlqbGlFS2RrblV0QmdBMHV0ZGNrRHdQejAzSFFER0Z2WWNF?=
 =?utf-8?B?NjV5VlNJeDFuc05kSVYrdDZyWENNcXBlakFOZEgxckxneTNEVHE2T2prTGdw?=
 =?utf-8?B?bWNJV1ZHeVJEeURmQW5IK0R6Q2NTZEN1S211QVlzSEFMODdFWVpuNlJQU2o0?=
 =?utf-8?B?ODk1enJvYjFJUHEzL3JXSHRyL3RQVFl1V0piV2tvcmxQeEx5cnRoWEROV2Nk?=
 =?utf-8?B?c0FBY290QVVpUkkvZFUvTDI5UHhEdTB5YncxWDFCbXlLc1N6Y1Nlc3RVNU91?=
 =?utf-8?B?UEN0cnFhY2dIdmdWemdyWXcwMTQwb1VveUhERmtpOHhyU3BOdDQ5Z3B3UGpm?=
 =?utf-8?B?bmNHVHR6blV5WHU5WFN6QlIrQUFyUVZMS3IvUUFobnp0VDZNMlFrQWRTbjZw?=
 =?utf-8?B?MGJHRW5HcHVtelZqSFJtQzg2R21LbmlrV003VmtwQ1czQnZib0VlQjU1bjJT?=
 =?utf-8?B?ZG1UR21Tc3VUbGhqbm4xSUxUb3pPQ1I3SW1mWEhMakt6UTFGei94a05ZcjFp?=
 =?utf-8?B?Lzg5UHpqSXkvTmIyTzV2TmNwQ0RyekNUZHlxdVdvSHBneGxUM1c4U1dMNFRG?=
 =?utf-8?B?YzEwQUlaNU96bzFCYit5ZVJ4RUE5Vk1KYU52RFVjaDNwT0Y4S1RLZmJiSmRP?=
 =?utf-8?B?Rnh4VktQR3NSWFNYbytOeWFaWEdndlZkam9VMDdCanNBZEE5aFk5bkRpaHhr?=
 =?utf-8?B?eTRzdDRsaG14UXhNb1pidTFxaUNVQVV5TFM0MWVWT01VbXZQNVBNdE9yMVBS?=
 =?utf-8?B?WmY5eCt2eCtGOURnRnZ3ZkV2eGRTck0rZWlZNVZ5UzZabi8xVVBhT2FoRms4?=
 =?utf-8?B?QXE0aDJnLzFEQ0F2WDQybmJkRzVrUHEyUmZ0OUl4UEpOQitTcGhLY29laWZm?=
 =?utf-8?B?NS9WTlBXcUxYYUVDMm5uVml6Ni93V1h3Tks1dzkxNVFvNVBmaDIzZldxelIz?=
 =?utf-8?B?N0lqYW5ZaDlvU0xKOXRJRUg3WDREQXRqTVoxSGxRNVZLdXVQN0hqcm9RSUFh?=
 =?utf-8?B?WS9qZHlUTjRjaEovdWxVUmVuc2s4c3lNTzFEWnlVRXhnWXlQUTI3R2ZWRUMz?=
 =?utf-8?B?R1daOEZLRCtvUGJBVFdwWVp5VXRnOWhhcVNvL28xaVFVR0JwVkZHSjJ2aXN3?=
 =?utf-8?B?dC9oUU16VjlKM1ZORFlSN09lT0JVd3k1Y1FKL1ZqUzRnUTRlOHQ4U2hHYVFX?=
 =?utf-8?B?K0cyQWc4M01iK3VYWkgvc0I2d0U3Ym9RY2JMNm82NEpqNENkdmVEaS9ZWDF1?=
 =?utf-8?B?UVA0UkJzZytDblc0NmFjeE5sSHV6UFVzZ05hMkx1QlNNSllmaUowWUJEcG1m?=
 =?utf-8?B?ZFNTalZQZk5zVHZOYzRDMmttMHZ1MC9qS2gzNUE2UmlyaUdWSi9zb3BIOVY3?=
 =?utf-8?B?VmcwL0h2ZVp5MDN4ajNkaXYxTjJkbm55RTkrSkxQS0wyemZCUE90SXZmOFcw?=
 =?utf-8?B?cHdpR2NHL3FiNkIyUXVlTi9QazU5N2RwRGhqWWtuSjlBeG5WTDNPTFJYQ29S?=
 =?utf-8?B?RjU1SVhpTjBCQnhOOStFZDg4QVQwWlpnMWFHYWFKMHlLV01rdFFoZWJwTEJj?=
 =?utf-8?B?VDZITG5IZDR0NjBueDVIWFA0N2t3Sjd5MnFsZ0FiRHhTTVgwekpBOEFBeE9q?=
 =?utf-8?B?NzMrREV6akQ1N1Q1TGhTci9PbVpSMmNQSlI1R3hzZHJNNnNQdFRQUHh5Vm00?=
 =?utf-8?B?bFhjZW9oTjdxekdFWHpIc1hNWHZFSUxBYnhLQkRVUzZxNVdwVlREVDZYMnhs?=
 =?utf-8?B?MTFqUTlUYUtDS3FiSzEyV2VFcmhKcG43akxGVGtUT3Rqd0tHUmgyQzhVVmwy?=
 =?utf-8?B?cUNBTjViMDY5TjdLaFoxc1VtTzl1MDBRNHVFNkc5VnEySUZIb1dxYjRGUTh2?=
 =?utf-8?B?cHFqODBvWVBwVEZTMHlUcWFPaE9Bb21hRU9ZWWY1eDhmU3JQaUVJdklYclFZ?=
 =?utf-8?B?dDNXYjhKYWlXYmk1QVZLVldwcEZUNmRHaGlZYmFMN0szdmR6UnFJbWFyZFkz?=
 =?utf-8?B?UXVad3RBOTVWNnR6UnBPUzRsMFFram5heStLK3BXbTlUeS9yLzZjTElYNVJ3?=
 =?utf-8?B?ZEhJTURiQy9lZGZzdVFKK3VmLzNHYkVoRGRPUzB5V3Bla3E5V282cXR0WjF6?=
 =?utf-8?B?a1UvaXRDY1pBSmNhWEhHNk5GS2VUcGlpUGVqYVhDN3JxOTlrTHR6WnpVUFZQ?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 120733c6-db14-42d0-5a74-08ddb89b9598
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 12:34:12.8896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c66sZglgbNkn+6REKuxInOC+z75Csoj998xwSmvr3oN1NV9/7a0gQSwP5sxTcty2enPtYMKq48Fk2CD1YHoG+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7919
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


On 01-07-2025 15:15, Greg KH wrote:
> On Tue, Jul 01, 2025 at 02:02:15PM +0530, Nilawar, Badal wrote:
>> On 28-06-2025 17:48, Greg KH wrote:
>>>> + * @payload_size: size of the payload data in bytes
>>>> + * @payload: data to be sent to the firmware
>>>> + */
>>>> +struct csc_heci_late_bind_req {
>>>> +	struct mkhi_msg_hdr header;
>>>> +	u32 type;
>>>> +	u32 flags;
>>> What is the endian of these fields?  And as this crosses the
>>> kernel/hardware boundry, shouldn't these be __u32?
>> endian of these fields is little endian, all the headers are little endian.
>> I will add comment at top.
> No, use the proper types if this is little endian.  Don't rely on a
> comment to catch things when it goes wrong.
>
>> On __u32 I doubt we need to do it as csc send copy it to internal buffer.
> If this crosses the kernel boundry, it needs to use the proper type.

Understood. I will proceed with using __le32 in this context, provided 
that Sasha agrees.

>
>>>> +{
>>>> +	struct mei_cl_device *cldev;
>>>> +	struct csc_heci_late_bind_req *req = NULL;
>>>> +	struct csc_heci_late_bind_rsp rsp;
>>>> +	size_t req_size;
>>>> +	ssize_t ret;
>>>> +
>>>> +	if (!dev || !payload || !payload_size)
>>>> +		return -EINVAL;
>>> How can any of these ever happen as you control the callers of this
>>> function?
>> I will add WARN here.
> So you will end up crashing the machine and getting a CVE assigned for
> it?
>
> Please no.  If it can't happen, then don't check for it.  If it can
> happen, great, handle it properly.  Don't just give up and cause a
> system to reboot, that's a horrible way to write kernel code.

Fine, will drop the idea of WARN here.

Thanks,
Badal

>
> thanks,
>
> greg k-h
