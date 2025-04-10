Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A618A83887
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 07:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371EB10E35E;
	Thu, 10 Apr 2025 05:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SudoBIbu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4127510E35E;
 Thu, 10 Apr 2025 05:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744263696; x=1775799696;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o33fpnK39KSWeiw9kTqaDW7HvNfiBAl9pb68HDKCdDA=;
 b=SudoBIbuKsMUJA+y24leT7YkoriFTnwVhppaUBVSbciAF78xmKQu8Q58
 /zDhOehdcrOkCl4EJvW/ogPIK5bthml38RqWRgzWGOPPYcnwKeBHoaAVT
 d4ZYB5pyUPaK/V6AG4KJm5DYARMEz/Ih4+5p0F5DzCWf+fW3T2bjBFQse
 PhkrOzuHc3gYcciuAWocOiUdHWyywo+ICeqeqipMoGfaF5V0YIOrFZx2f
 66zUzOFt31d9KskgzCpfkmNPQsUdUA2lKglV8B1QIutmkobEUKD+7pBq2
 R7/F1HNSlK5S7d151sILAExUbHi3OQoiyPvfZ1IhPKyBacZwjvNcDBzqf Q==;
X-CSE-ConnectionGUID: lpqCWhFkQ9azu23PMRSMow==
X-CSE-MsgGUID: SOrVxW0aShiXuTuZqAZoJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="68249321"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="68249321"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:41:33 -0700
X-CSE-ConnectionGUID: FpgTDDt0RMKyJ9fRkDnCeA==
X-CSE-MsgGUID: 8I0dy9yqSm6z3VJ4svdybQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="133904555"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 22:41:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 9 Apr 2025 22:41:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 9 Apr 2025 22:41:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 9 Apr 2025 22:41:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ifu4g3ALlZWp+AXx/3Kt+Ue/iCPW0D6YKgkLCCBDYnMpN2qhFaJAxLZx7i5cPFINCMS33Y8saDieyRXrkNrcwnAOuOHUsX4QpROeqTuEHzuw3mGHngmwqyeyumEjzjecIxH2mSmtFaRc71hCmFN/ZQgMSgGMl/XxXrzDTfXukpxQBWCZClVkq254784gM1w2TQ2MDDjpxCOodFmVnZQGOn1C30HcNFsKRplomZMeG1doabpCc6I/SL/qRztFYpmP2RTesvF/obDZeTjV1oZFo+rbcKRDRaDmR23UifKSfv495ZOVuV1xep/PX6b0Wi/iSqCo0aFXu+RWSe4QFrgYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHCAJruwkhPO9/+Bwt8Nm2aaugY5qcy+h+wc6Nt9imE=;
 b=DO8kuBxzVPmxNY5bcnPYs21XQbYJVsLCcoTiUre1vMhn6mLNzJ5dNm1HTWMQN0/gvnGxXLq3WWVywso/rpx7ClKDNw+eyHxNxJ0tN0YPrqb1xq1gtiGiICBcJ0hm3WahlchMhUb2DSfNbGajV5XQGXscz0eNvjG4Urly48fPIhB8PWm8j+VQaw2a7m5ArV+bVcmh/chvEa9p8c6o7AO7kv10xqvcsxLLdHTDlBJ1NxL5w9EWiTxkH3XDciQ0KvN+Upbby3fIpwXGuK8BKw/NbuV09taNRo23RjHSooAT/D45W1+G7x84j/GyavPd4JV8XQ+/Ja7aRP9mbezy9JazQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV3PR11MB8458.namprd11.prod.outlook.com (2603:10b6:408:1bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 05:41:14 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%5]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 05:41:14 +0000
Message-ID: <0e034903-5bbc-435b-8636-ab67f582a536@intel.com>
Date: Thu, 10 Apr 2025 11:11:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/i915/backlight: Modify condition to use panel
 luminance
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>
References: <20250408050138.2382452-1-suraj.kandpal@intel.com>
 <20250408050138.2382452-3-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250408050138.2382452-3-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::16) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV3PR11MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a91358-11a6-445b-1b75-08dd77f24eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0trNzBzakV5VFBNR2hQNXNVZUlCbHlLNFRERG41UFArMGZrNmNNWGhDdEo2?=
 =?utf-8?B?VjJJYzJkZU11VEEvcWx4TURPSUwvQzhjR3UvVVdnUUcrdzVxMG0wY2RFMkU4?=
 =?utf-8?B?dWJZeU15RVAxSEhCWnMxdzk5bkh0cTZ4QmNJVlY0dFRQWVBxT3dXcnVJSlFJ?=
 =?utf-8?B?SXg0TVVmY2taZndVNGdveGhLUUU1czdCb0NhQlpvbzlGMy82Q21hSDhmNE5F?=
 =?utf-8?B?UEgvWGV1bCt0bllEZ2tNMWw1S2ZDL2ErRnB6ZytnMFNtbzVZdzZQOGp5dVli?=
 =?utf-8?B?UWJic2tHWDBndmlVZDhGUmphTVJMRDZTeExsM0FNdFoxclZxTE9JYlB0a1p6?=
 =?utf-8?B?NDVsajdzTi9XZE14TWhXYjFTSnV3UEY1WWNFb0lLQkJwSS9XeHFGWGUxcXRY?=
 =?utf-8?B?VE81N0RmUC9wSzVoV1p6dFlpa3FPd2l2Zllob0dXTWdsYXZORjhuYXVCM2Yr?=
 =?utf-8?B?em5Va1hRbHZ6ZUdBeStXaVBaelVWTkFxd1VlN0V1U2N4TWZrTVlaanZETE10?=
 =?utf-8?B?d2pzY1lKTkluMWNxUWtmODloVllZaElwaWQ3cm4zcVRENkVabktmNkJOWjFw?=
 =?utf-8?B?T1pUZmNXNDN4VFdWLzlGSVhpdmZ1Y1Rub1lYZysxL05VZlQ1QzlOWG1Pb3pD?=
 =?utf-8?B?S3NnZUt1d3JKdWl3bW5PUFdaaVFCY2lKV2tjK01SNjI4aXhpQXZVUk9sZUY3?=
 =?utf-8?B?MXR5cS9IWk1OYzBYWDZ6eG1FRi9FTTl6RzJJbXoxUzN1SE1hTGhvQkZRcHN4?=
 =?utf-8?B?b3c1VVNQbDBVTS9nS0JHQ2RRUW1RSVJsUXExQVBIaUJscUltbVNFMkFaMEph?=
 =?utf-8?B?RWtPWldHUUVKemZFajcycWZhMTZvdnp0SUFwL0pLbEE1eUpoVkVWMXZHeUF2?=
 =?utf-8?B?TFpIaFpIMUpSM2xpdjFqQ2QyT0Z0b1d1VmlRdlVvRXd4WTZtM2t4WDVoVDJx?=
 =?utf-8?B?L3p5dUZPdUNCNW9iMDVBcEQzRXFGRzdOSVNUcE4zK1RuSlpDUlZEMEF5SldU?=
 =?utf-8?B?bXBEeVZITUs5U1VOL3dMcjVsa0NWeU1ETUxnclVKSkppNUhyR2xnWFFEYkpn?=
 =?utf-8?B?MHRxaWNmMTFGRXhOWWFDN0crRWZLaUdOeGwraHdmaktJNW11b1Z6Qi9OaENn?=
 =?utf-8?B?NmFsU09MR0VJODYwbjhPTTUzdEdWWmpTQW9sWVM5K014RmdqNFpxNWxRN3Q1?=
 =?utf-8?B?dlREeDBPRHdWTFlEYUhtQWxtdGplZnQvSHVQdnJwVjJpaG8yR2hJZ3JIb3RF?=
 =?utf-8?B?UzNKSGdsODZTUUNoaHBUTGQxLzY1NFlJSk4vSUordlJtWVVBcnRjUGRpQzli?=
 =?utf-8?B?NDRpb3V5d2cza3lLNlR4TDVzTHFkUTVjQS80M2phZy81NkZ4bFhKeHZNNzQ0?=
 =?utf-8?B?alJqSnFCckhQMjVBaERxdEo3TVlzbUdxOWtuM3NiVEs0Wm12dTN4K3dndEw4?=
 =?utf-8?B?UkV0aDRUNEFDaHJ4ZHo1eVNzbFhIazNGZmdIL3EydS9aa2VSSHlaUXNIeVpj?=
 =?utf-8?B?OFdOUWVVWW04amRoSjJPMXZjMFJNTkdsVG9qcHdtQmJFVjJqUk92OHBxVkFL?=
 =?utf-8?B?c3F0S0JqVnNqK21KbWdKYUlCRS85NFU3WTRiM1JralpUdGhqd0lyS3ZETFlz?=
 =?utf-8?B?MTlUb0d2UHB6Qjl5Q1JlMHZDZ0N6cVNZWHQ1dEJCKzBVRm0rMTkwdlBaM0cv?=
 =?utf-8?B?TW8zd05nWDVROTFLUXJtRUIrNlNablZOUzk4L2krYW55NDhsWWRKNnloUXdK?=
 =?utf-8?B?VlNNZWZ2NzNqbUdUT0t0Y3JRaWpHZ0pKaVRaSGdDb1k0L1hucmwrc0ppOTJn?=
 =?utf-8?B?UlhIWHg5bVZrRWlmRmZDZHBPSmRDNUhUeWpENTVsd2hadmdzcWduY3U1UnlL?=
 =?utf-8?B?UzBEM3BNQlJFVTk4bUREU2xwRFNiSnczSGMxbk43ay92UFVHM21CQkp2WXdt?=
 =?utf-8?Q?Q5cxapQng4w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?USt3UUFENjV3cmJrQjVZME5jN0FYeFFmMEVCUGtnZFVzQzFSK1F3TlFTQjY2?=
 =?utf-8?B?TVhJVmRaSy8ySWJEcXhMSWUvczB5YXF4VUJMNkxrV1l6Wkg2dVBRL0ROMWE0?=
 =?utf-8?B?VGF2NEJCcHpYWmkrdVM2L082VUFuVTVkREpaUWFpaEo0aXhIa2tpbXZrVlVP?=
 =?utf-8?B?anArSnhsSkRSb09nakRLWXR5S3M4U0hFeitzOWlUT2FUZkpNU2VzM1VNREdJ?=
 =?utf-8?B?OHJGdDJ6c3JOeU53UGFGT2o5eUlBSEhCYStxaVU2RUhvYTVXQ3ZVd0VTWnJx?=
 =?utf-8?B?T3ErYVBIRjVOeHdlSEh3NjRacnAyKytWWmFBT2hUeU5XaG9RQ1NKUm5SbGVu?=
 =?utf-8?B?TmN2TXo1S2RvalB5MTJqd2djeFJDN3g3S1QrYldwdyszQTlqcnAweEc2SDdH?=
 =?utf-8?B?SUcrOXlNTjZ1Z29kMjBEYVFUZFR6bDFySnBHYzhnQ1N5WWNvMjQxWUwycExR?=
 =?utf-8?B?ZmtqWkI2UkVoL1Jibmo4Y0cwcTlPcU5pU2g4Uno1c3h6a3VrU2Y4N3NnR1o5?=
 =?utf-8?B?eEVZbzh6V1VPRDErSnlwK0cxbGlHMUY5eG9mME9rK0tEeXUyVDkvMDMrTFpj?=
 =?utf-8?B?NjRXM3JNNkp6TW5HeUZ5VUtyNzgvbVlpdko4Vy9DNExYTjBNdFpnMTFCMVBJ?=
 =?utf-8?B?THFLbTlSNEkrTGZ0Wjh1aWlPUDM5VzRuZGh2S3Jmc2ZXT2JpajdYUXdSUzUw?=
 =?utf-8?B?YTlLaFljWHNkcWV5SnVzM3F1dE1NVG00a1RUcUJqWFJ6TUV3V1c2b3NGK1hn?=
 =?utf-8?B?RnV3amNRaS9TYWE1cFVJK2M2M2hsRWlCckZLSmthRHg3R2Jod2Jwd2tKWWN1?=
 =?utf-8?B?eExoaUxQVWorb3VuLzlnaCt0aXVMckJEN0d3TmtnZ2JCQnBhNkdFRzVhbUdK?=
 =?utf-8?B?VUNIMWI4dTdhSVZSNnB1OXBiWE1wWUZzd0Z2YVdBcmtKenVTM0JkRjlMc1k4?=
 =?utf-8?B?Yk1UTi9LQWhlelFuSG80YXZPNFQ1ODNzVkFFeVRPeGJSK3NaOVBwVUNPcXR4?=
 =?utf-8?B?K1I2Q2FCekRCeU1XRS9ucEVzWmkrNzVCVDZPL3p2WVZCWHNzRkY5L1dLQUNJ?=
 =?utf-8?B?MVIzNk9PT0VtNEVaNmkyMy8xblFnYWh6YVJtN3VHYnhhWGZFSTlKU0pWbWpu?=
 =?utf-8?B?Snh5T0hsNXpMdGFxWVVReHB1d3MvalRhdmdST0tFMGpjY25YNVJjZWUyNk1P?=
 =?utf-8?B?dDhoOGR0bG5vWHpndjRWQWg3M2pSODZ3U29Gdy9qSFQ4dWVlOFNkRFV0TEJp?=
 =?utf-8?B?bzFMY1JxOGM0SktiK3pPRTRzaFkyM1BaU0I1ZjVBTXVBZmFyMzhBcnZPSHEr?=
 =?utf-8?B?TFZsQm5Ea1daeTA3eUpVbW85NjE3Q2Y1YWlHZ1RVSlBOYzI4ak1ySHVzTHBI?=
 =?utf-8?B?dnVJbjRtRi9JZHpRUnJ3bUpleHR6RTUrdk0rOFpESVJjMHZDVjZQaGV4MjlV?=
 =?utf-8?B?c1lEcjZiL3dxVTIzSzZFSnc3VThKU05jVmltS25oY25sMUhudG9ST1h0Yi9P?=
 =?utf-8?B?M3JneUh4OGpONWY3bWJjNUxxOUZEbytLTkk4dmVIRnFWRjRxS0NRbkozc1pH?=
 =?utf-8?B?Y2VoUC85a0EyOVE5UTF3SFgzWGpSQlpvU1dUZ1RpRWVVb3VKVGJUVGEzQ1la?=
 =?utf-8?B?ZnByNlhhR2Rsd09qcVpNeGg5ZlZYOTNnb1h1V2oyMzYwVCtoYUR6ZzZwRGF0?=
 =?utf-8?B?c05UaGpkN28zRmVFUnFwUXJKQkhSTDVaQ0x0b01hN21zbGFkMXBLa0cxejdC?=
 =?utf-8?B?eDVlNnpwVGpJTWFhM3dpQ3FuNGVNTUxMc2pqelhtNytLS3FoZmtiMlNBd1Vl?=
 =?utf-8?B?QlFkUytGR09ZUEJnUEM4STNDTHovckN0dlJwZ0hNN2NTRzRaSzlBdjRwbDNC?=
 =?utf-8?B?Z3lOT2dmRGNidFZ0V2h5ay9yMGpFT1lJNEdWT1JiWkFwb1p6M2pwb3pnMVNz?=
 =?utf-8?B?aG9SWk05RHhNRmdXZUtRZU0xbjA3cGlLeXFoSWR6UHRvWk44RHpVdUtTYW8z?=
 =?utf-8?B?TkhkRWdjakg4b3VrRy8xc2ZSNTNLakljRENPc2VPRHExVDRSZ3lJWDEwdWtv?=
 =?utf-8?B?UU1zNnJrOVJzcXNCbTRnck5qL09yQzlwaDRBMXVhU2hKTVJpOWI3TlU3WDg1?=
 =?utf-8?B?TTRPYllkaTJsaWN4bnVYYXhoYmRJa29QdlJ5NDdHTWxndFdkd3UvQ3p6ZERa?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a91358-11a6-445b-1b75-08dd77f24eac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 05:41:14.5991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbuTeF30SBX8NZXyt5n4vxsDmoESZ71OoTnPcytrSjrEx/BqnfQfg3Da2qqKa7pXSk43WZJoo07w8gv8g9Q5D2XvUI4APHfGaH7ifc7Kzto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8458
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


On 4/8/2025 10:31 AM, Suraj Kandpal wrote:
> According to our internal spec we need to now check if both
> panel luminance and smooth brightness are available in panel for
> us to be able to change brightness using luminance value.

Since DP_EDP_SMOOTH_BRIGHTNESS_CAPABLE is introduced in eDP2.0 and

DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE was introduced in eDP1.5

is it like that we intended this for eDP2.0 only and not for eDP1.5 panels?

This will perhaps change the behavior for existing eDP1.5 panel. Do we 
need to add a fix me?

Regards,

Ankit

>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 8173de8aec63..20ab90acb351 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -663,7 +663,8 @@ intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
>   	struct intel_dp *intel_dp = intel_attached_dp(connector);
>   	struct intel_panel *panel = &connector->panel;
>   
> -	if ((intel_dp->edp_dpcd[3] & DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE)) {
> +	if ((intel_dp->edp_dpcd[3] & DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE) &&
> +	    (intel_dp->edp_dpcd[3] & DP_EDP_SMOOTH_BRIGHTNESS_CAPABLE)) {
>   		drm_dbg_kms(display->drm,
>   			    "[CONNECTOR:%d:%s] AUX Luminance Based Backlight Control Supported!\n",
>   			    connector->base.base.id, connector->base.name);
