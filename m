Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C832ABFC08
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 19:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4B110E76F;
	Wed, 21 May 2025 17:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XiOyrSmL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56F710E6F7;
 Wed, 21 May 2025 17:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747847449; x=1779383449;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WlTmd3Mbtow/1dSdJw5aFOUKq5HCLKu6N2ivc61u4sI=;
 b=XiOyrSmL9CPY+4jbqWDxnHWdki6/Ih+A16vuh5SBoek5OXYNDZ0G73qb
 zApvHwAIrg1DGrUFVeyv0Qh3392YHDhUHNiThzQ5uAxROP8TQfiqO4fM5
 m/ErauRrFvKIMpQ/veOhxKAc3OPj32KtoXudVbyAiKf2sueLkTyc/5QXF
 I0cRueBEoEePwXJoVmopi0EpxijxqLQTN0w1G+INWjhXclQBcJ1IM//Cn
 GcjwGnpx9yx1HRA6ziNnQwu1kqnXcDfPgTHUuIbgSj36Xhrtj3vDJ97rJ
 /0naoyiiFrVBqrZIcrO10hHsIh4Bxh/Twzng7UTM9AOGuF7sKm6Ht/gaF w==;
X-CSE-ConnectionGUID: FQpJWIgFTeuHiWKRbT1UZw==
X-CSE-MsgGUID: V90tLwA4SoWv5s1rP//0eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67254494"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="67254494"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 10:10:48 -0700
X-CSE-ConnectionGUID: ity0R/ZaSxmieex+OKtKYQ==
X-CSE-MsgGUID: yny+wVS6TySomKAn2E7MCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; d="scan'208";a="171035132"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 10:10:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 10:10:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 10:10:47 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 10:10:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrUDNq8mfC20PNEoM8S2zTikEjwwgVrGK/bBhwOWn6arPgarKTQAwNoXLY1YzKW5nUWdWxVLCn2nn2tiG2SKAwMpMhj5otKk73OC3WguAdcK+CPa4IEi8wYQe7RwtN6vrSwb5FiSe+McFIziBRbbHAZcywzchzDIOyuOc2mUyoFIeqbHL985p2vOldXZDlzi4PTvokxSaaIai97OWiEtpoedYl/oGcUXPKutq+mTixP86yXiOqwxAeizyOsHe4a6gPCCGo3kOUhlLkxUK63AFt0I5xmwudUQOdLYOvGzzXCMlvqRSSSG1voQMnf7TB3BMGGCj5UGTvcxx6CcczMp9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znunJF1z9cMNaGvVpRJbEWfiDU09viG/W95caNTi0nQ=;
 b=DuI+DT9cFwgpCCZ/oOmFmr7UowHyEKkJXFjajfgS3KuT/cS10WAoppeOKY6CcNk41IkV9RxdXNaKV4eqqh84RF2U59LRzO+Npw+AE5mH3qtQWdDv9e8bHsNDx6mh0Li9/u+svJ7XTivEzoE6RrlEz8kvcTJM1/BkMez68t+twP4LR0RiNwqfgflr6ZpTs9bo8a3BCrXxatNIKnLuNGwU+xjKevVm+VfJsdS44PtgNni7jZnCZ4xYefyUwHOY1waaIuKHoKPf3LYE6EhKlgLgB+iRfDblURkPlQhrd0xnu18FAemxbG9jBMnr3GL9+XnxlB3QRNLnX5gnPJAgwnsuHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8019.namprd11.prod.outlook.com (2603:10b6:8:12e::18)
 by IA1PR11MB8803.namprd11.prod.outlook.com (2603:10b6:208:59a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 17:10:44 +0000
Received: from DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695]) by DS0PR11MB8019.namprd11.prod.outlook.com
 ([fe80::d2ab:ff8b:3430:b695%6]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 17:10:44 +0000
Date: Wed, 21 May 2025 19:10:37 +0200
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Andi
 Shyti" <andi.shyti@linux.intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, Krzysztof Karas
 <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Jani Nikula" <jani.nikula@linux.intel.com>
Subject: Re: [RFC 0/2] Introduce a sysfs interface for lmem information
Message-ID: <jdtdaeyiqkgr2uztzo5slfixmnhwf7swa3zjntg5cnn4eb475f@rf346gvalbot>
References: <20250519153418.44543-1-krzysztof.niemiec@intel.com>
 <174775327260.81385.8059929394366685323@jlahtine-mobl>
 <b88bb6af-2215-4f1c-8e48-05f36957c6ab@ursulin.net>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <b88bb6af-2215-4f1c-8e48-05f36957c6ab@ursulin.net>
X-ClientProxiedBy: DU2PR04CA0064.eurprd04.prod.outlook.com
 (2603:10a6:10:232::9) To DS0PR11MB8019.namprd11.prod.outlook.com
 (2603:10b6:8:12e::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8019:EE_|IA1PR11MB8803:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a10a617-26fd-4f35-43db-08dd988a6c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHo0U2d6UUtZc01uamRyZ09iVnhkVUtXNnYrZHhWMUxyaU5mMDd3dktBT2ox?=
 =?utf-8?B?Um9sNmlwa0Qxb2FsR0gvbjVXQitKMUpEamxSTE1iSXpSVlQ0UzVSeHVVY3Fi?=
 =?utf-8?B?V1o0UTdvUXQxM3NJMGdCOWVYOWo0LzJhdkxmMzQ1S2dJWGo3T3pZMlo4V2sv?=
 =?utf-8?B?K3BncHU0L0prRURMYWZYcTd5MW14aWwyVHVIcWRLOTAwclliSmhxVWg5MVor?=
 =?utf-8?B?WlNibTVxL1NkemNWNk1ucXZacmp4MVEvblRHODZoeU94MzU4TG5pUVcrRUVz?=
 =?utf-8?B?WHRkcnkwaDJ5VktLM3UzM3p6eHd6UjM5eFMrd2dleEhJeklYK1R2V3lVWWY0?=
 =?utf-8?B?ajQyUUJ5L3hxYXpFMnl0NEJDZyt2S2FvcVB6RTl4ZnBkSHU3eW14TGpmbGUy?=
 =?utf-8?B?MWYrS0VqM2YzQWQxaFBPNlc4NjdWY0prblg2QVo3S2U5dVBSbFY3dzdobTdY?=
 =?utf-8?B?cXJwYlc0bS9Nb3RaQ2dwdUI1MER4VE4zTEM4OFZJTTg0OG1HbGwxSEhnQ1NW?=
 =?utf-8?B?RWorMDA0M1MwRHhpRDFuVmRsd3lyRS9xdzFYaXNOUFEwc2d2VUsyZElDRXNt?=
 =?utf-8?B?ZFNaRVpXbzZHZVovSGRrVnRaZUNFNy9valU3ckN5dGI2SjJidzJ3WnpqWkxD?=
 =?utf-8?B?WEM3ZktZZlN6MkFNOXh3d3hrQkt1anlPR2VlSFU5RWdtN0pibVBvTlRRZzR1?=
 =?utf-8?B?ZDU5TVJOMEhmL1pXR0dVZ0RidDJ0bFZ1Z2JKT0hLcUpnOEwxMit2VnFURmVE?=
 =?utf-8?B?OE5JM1RMc2pydVk2M1k4QXlqYTY0MkFScm90dlhzSjFDdzFwZytNbGZtaEp5?=
 =?utf-8?B?K1hOMm1KZHo1R01JT1ZQSjY5VFBMWEdzR0ZSYU5CZzc0azBXWDl1SXV0dlht?=
 =?utf-8?B?OTRJaEpqZ3hpRGRzWU00eG1qeVMyY0ErVVR5ZHFYYWcrQWp2SUhIRGRwTjFR?=
 =?utf-8?B?cDB2WWpYRDZHdTJGUVY0aCtyc2FaT29CWTB0NForRW5wZFNLdUVKL2ZHUzdp?=
 =?utf-8?B?bkdDWW4xMVBBUTI0dWNhYytUay9LaWRIbGl3TFpWOUM3MUtENWo2ZVJmU0cz?=
 =?utf-8?B?ekQ1amZPSTl3VVh5cDA3dkIwdHpWNFJZNXQwWW9EdmwvQSt1UFA1WmVQcThp?=
 =?utf-8?B?bHhRZVNxbkpzV2ZjZkhPc3VRM3QxVjhBMVhhTlhNQ3lZQ2VJWmRpVUhjM256?=
 =?utf-8?B?VHY5NDltYmRmQXJWd2p0RUJseHU0VGtVTUVJRUIva3dsSE1tLy9uMkdTd1RC?=
 =?utf-8?B?WUlDWEdIZ2kxL09xMmpvZWJBdWZqYkdpbDk4UkxjSmFrcTY3UlE1ejJzdERF?=
 =?utf-8?B?Z1BGY1kxdFVKTi9MRlluSWd5VGZkb0dpY3o0R2g1RlBacWlSZTFqSFZ1RVRl?=
 =?utf-8?B?VEFDSWxocjRlYTQ3c2xyMXV2Qis2ekFjbkxoZVRtSnp5OTRYaGNIWE51SEJs?=
 =?utf-8?B?S1JCc0l4UVlFL2pMU25oQmxEdG1aUlNjZC8xbnlFNFlKWFlaa2JHSGtCamtJ?=
 =?utf-8?B?d0J2bU8vNVVEZ3lVbXZpVlBXTm9UZ0F2c1JkL2EzaHFzK004WW4vOHpMY2NZ?=
 =?utf-8?B?cll4REFLR3JDdFRXRVNvcjFFTDJqYjJ1SzZ4MHpHRDMzM0ZYWkZWMFRtRFdX?=
 =?utf-8?B?bFQzWlJiNmdHUW03UzFadGdpTFNMQjZIMHRGMDJDdDZzVTNzd1hubE9LYnhq?=
 =?utf-8?B?QXFtd1NJeE9tR2Q0Mm1CQitoSXpzems1MnhhSTkwOHBCOUk0VHQzZ0ZHRDZo?=
 =?utf-8?B?d0FuUm5NMXV3b21vU3k3dkNVVUlTV08zdDY0WURxcVlUU3lMemFKelFjV1BJ?=
 =?utf-8?Q?aj2NzAVGmf2maEcfi+Guir1EzbnCh7x5heFC0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXpMU2JMZFlNa0dETHpBTGtCN3dxS0NjSU1WYzRLVzFXclNyQ2EzNk1RRWVQ?=
 =?utf-8?B?dlNIR3Nub2VzdTlCV2hQS3VKY3ZTa2hjMnMzVlg3ZkljekRUV01VSlJCMEI0?=
 =?utf-8?B?OWNHajk0L2srV1M2NkgrUTBMenNiUEpDSWJCWExSbWRVVWlBR2hvT0hmcUpa?=
 =?utf-8?B?RnpFelBVSjJ2dWNncit1dzJoQ2pYTUhqOTFRc2JmcDcrQVRmWlZJNCtBdFpI?=
 =?utf-8?B?TE0zdSt3ZTJZZm1HdFB5M0c2Zk1ueU9FL0Q5UlFVdTJnWUtJOGlsRzdreFFC?=
 =?utf-8?B?aVF0eGQzOVRUeVVnN0lsN09BM0Z1TUZPVVNnbnpUKzVTMXlKalg3NGV6MmJG?=
 =?utf-8?B?eUt2WkQ4L1pvbFdEbEpVMjA5U01JWkhkM253bExpb1hKd3lsVHJxaXltVmh4?=
 =?utf-8?B?UGlaSFFTZUZWRFpqSjZiNko4bnVWQUV4Um5UWjg4NktOMWpMUjlpNHEva1FG?=
 =?utf-8?B?MENKaFczalNWenNoeDVyd0pFQm5sV2ljQWo5STROYm1zYVVFNUZYTHVaOTEy?=
 =?utf-8?B?S1lHMWZXWjNmRGZLV21laExnZGpYSlNEdGVEeXgvSUdFZmpRTHY2S0JreUlC?=
 =?utf-8?B?NkpUdE54aCsrUGo1aEtHdU5RNy9KVXAzZDltSU05Y0I2YmZ2WXlibVpKcDdQ?=
 =?utf-8?B?Tlh4UFlicDQyVCt5NUV3R3dFUjRiQnBkK1RpazZaUG0xci9LblBCTkxnWkI5?=
 =?utf-8?B?K2ZOTjBudktCaHhZZGtHTDQ2RmR1a3N6TTlXRXBlTEgxcFJHU3VFU3IrWXNC?=
 =?utf-8?B?V085Y0R6YXdJNDByUmR2V0p3bWhqa2ZOQkE5QUw3UWVISzIzeFpBYzNZNUdp?=
 =?utf-8?B?ZGxwTkVRMExvdWZkUk5JVjB5a2lSWHdzbnRscUJQWVcwTVdMb0hmRnpydm80?=
 =?utf-8?B?YmtFWklrVUc5amVDL1dWb01MSC9PZ3FLZXdqV0dCN0MvdUNYNWpJdDZ4QURs?=
 =?utf-8?B?WnlzVjhrSU5zWWoxRFMzQzhFcmMwenRxMDk0SjhSNjIyTWpBL29Ud3I3V2Rr?=
 =?utf-8?B?cEIvaDBtcDREcDgrbWpvWWNlWjI1UHNrSXJ2QVlKNnlZUkY5aTZzcGRPMnh4?=
 =?utf-8?B?Q2tmUWhHMjFBcElTcUZ0MUVPaXdJbkRQQ2J5azdMaU1GOEJqakY1QitBVG9S?=
 =?utf-8?B?TGZKbzc0SityOXRnbE9valRKQmlCLzRkbEh5elBkNWw5SEJLR3V1NDFEUTZV?=
 =?utf-8?B?LzJKYUlVOEQvRGtGdVdDeFhlZk95TzV3UWZFa1dMT081b1AxTFFhei9hYXBl?=
 =?utf-8?B?TWdFTHVHMHU2N1NzWUVhTEp1eWJ5Um5iNmRoaC81NEdOdlFnRHBFMm1OYlA5?=
 =?utf-8?B?RDdTUk9SZkNjcFRJV0RIYUhQblRyWlB4emtLRW14UDJwSHA4NTR6QWNvSTJO?=
 =?utf-8?B?RnNRVjBtR0dYM2QwMjhMWk5MS1l6bWx2SmxDZjF4eVJ5RHYzb1BHU2c1VE9o?=
 =?utf-8?B?eE1YWmR3YnplbXZud2F2UXVTTDgyWStBNDRuV3dPczIzY0lIN01RYXBEUnc3?=
 =?utf-8?B?R0Z6TWhlOWR5NEdkZjNtMENvTXZnSUJrcEhBVVpGRHBlUnVabWMzQm4zSVVI?=
 =?utf-8?B?MlpaTmpwdDc3cTFVS3h0ZlRsMHlzNk14RFR6d1lwVVBIMGQ3eThWUHgvL05h?=
 =?utf-8?B?VWV3ZGNZeWdSTEJrb0pHYW90Yk51TDVEY284UlVrcWhzY2hITlpsS3dVbTBO?=
 =?utf-8?B?amhwRGJ0amQrMlZ3c1Fqc09ZQnlTMUJ3M1FSOU5GMHZkZmVkd3JuNExqaFR5?=
 =?utf-8?B?T1NNOStOMVdVcnRMV3lLVkRIYXBsSDdHTm1mVklWUkJkSFRyc0VnbDMxckdm?=
 =?utf-8?B?dlJTdmdKbGNyaVJGMHlxMitEY3RoODU0RlRsaHRLWTlJSGV3SFVxaEw0bFRr?=
 =?utf-8?B?SUFqUnptTlJicVNQUWRocDVHS3d0OXUrK3RsRjliQ08rQ1lJd2N1YTF6SEJz?=
 =?utf-8?B?M0RxRElZa25aQzJ2MWEvK0gxWUlRNnZzR2YxSVFjRDNudlNOR21XajY4d0Vt?=
 =?utf-8?B?VVp6RWtadm1ta01hanJBRDRObzdQaE4vYmd0SHcyTitQSnk4ejZ3MktBbmdi?=
 =?utf-8?B?dG9IUzdVZktPaU0vR3RYUE95YXh0WTFhQ1VwNUEwRDZ4VjJpa3grNWJTQnp0?=
 =?utf-8?B?Ukt1N00ySkFBbWVRUjZWWnNxK3lHRVI0dStwajZVY3ZMUVBBWHVhL203ZVdx?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a10a617-26fd-4f35-43db-08dd988a6c4b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 17:10:44.7148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YR2Q1h4KaDAq8y2lKVIy/CCBdn+lBzCW293o1eYNDZBX1nl5DeEOXp2k3EF3IhyPjNAfwaYHocXr3QmqJyn+0Ulkc9PRJswNW95l+z6o7Xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8803
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

On 2025-05-21 at 09:06:43 GMT, Tvrtko Ursulin wrote:
> 
> On 20/05/2025 16:01, Joonas Lahtinen wrote:
> > (+ Tvrtko, Rodrigo and Jani)
> > 
> > Quoting Krzysztof Niemiec (2025-05-19 18:34:14)
> > > Hi,
> > > 
> > > This series introduces a way for applications to read local memory
> > > information via files in the sysfs. So far the only way to do this was
> > > via i915_query ioctl. This is slightly less handy than sysfs for
> > > external users. Additionally, the ioctl has a capability check which
> > > limits which users of a system might use it to get information.
> > > 
> > > The goals of this series are:
> > > 
> > >          1) Introduce a simpler interface to access lmem information,
> > >          2) Lift the CAP_PERFMON check on that information, OR provide
> > >             the administrator with a way to optionally lift it.
> > > 
> > > The first patch introduces the general mechanism without protections.
> > > This will effectively lift a capability check on obtaining the memory
> > > information. The second patch introduces that check back inside the
> > > _show() functions, but also adds a sysctl parameter allowing to override
> > > the checks, if an administrator so decides.
> > > 
> > > I'm sending this as RFC because I have a feeling that there's no
> > > consensus whether memory information exposed in the patch should be
> > > protected or not. Showing it to any user is strictly speaking an info
> > > leak, but the severity thereof might be considered not that high, so I'd
> > > rather leave it up to discussion first.
> > > 
> > > If we decide for lifting the check, the first patch is sufficient.
> > 
> > Nack on that.
> > 
> > CPU memory footprint and GPU memory footprint have a very different
> > nature. This was discussed to quite a length, please refer to mailing
> > list archives.
> > 
> > > If we
> > > decide against it, the second patch protects the information by default,
> > > but with a way to expose it as a conscious decision of the admin. I find
> > > it a decent compromise.
> > 
> > No need for the added complexity if we were to add a sysfs.
> > 
> > If a sysfs is added, it can be made root readable by default but system
> > admin is free to chown or chmod the file for more relaxed access. Back
> > in the original discussion time, this was omitted for lack of users.
> 
> Agreed, no need to complicate with redundant access controls in the kernel.
> 
> > Even now, userspace/sysadmin could already essentially use setuid helper
> > process that will only report the memory statistics.
> > 
> > So I'm not really fully convinced this is needed at all.
> > 
> > And if it is to be added for the convenience of usersppace, it should
> > probably then be considered to be a standard interface across DRM drivers
> > ala fdinfo or cgroups.
> 
> Cgroup visibility for device memory exists in principle although i915 hasn't
> been wired up to it.
> 
> For system memory (integrated GPUs) there is some work in progress around
> memcg accounting, although I am unsure if i915 would be automatically
> covered or not.
> 
> Also going a step back, from MangoHUDs point of view, I don't really see why
> total GPU memory is very interesting? I would have thought it is more
> interesting to know how much the monitored client is using, which is already
> available via fdinfo. Total memory sounds like something which it could
> leave to interpretation by the entity looking at the traces. (If the
> monitored client is running alone then total_free =~ total - client, and if
> it isn't running alone then it doesn't matter, no?)
> 

They use it to plot the VRAM usage so you have a rough idea of how much
of the total the client is using. [1]

[1] https://github.com/flightlessmango/MangoHud/blob/master/src/hud_elements.cpp#L1471-L1485

> Regards,
> 
> Tvrtko
> 
> > > This change has been requested in these parallel issues for i915 and Xe:
> > > 
> > > https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14153
> > > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4861
> > > 
> > > Thanks
> > > Krzysztof
> > > 
> > > Krzysztof Niemiec (2):
> > >    drm/i915: Expose local memory information via sysfs
> > >    drm/i915: Add protections to sysfs local memory information
> > > 
> > >   drivers/gpu/drm/i915/i915_sysfs.c          |   6 +
> > >   drivers/gpu/drm/i915/intel_memory_region.c | 136 +++++++++++++++++++++
> > >   drivers/gpu/drm/i915/intel_memory_region.h |   3 +
> > >   3 files changed, 145 insertions(+)
> > > 
> > > -- 
> > > 2.45.2
> > > _
> 
