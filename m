Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BBDB95224
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 11:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF5010E5B0;
	Tue, 23 Sep 2025 09:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaJVwlxG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACE810E5B0;
 Tue, 23 Sep 2025 09:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758618450; x=1790154450;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=idOvqFRBKtoEbXM39sxfbeGvnJn8HYhYr0ACFNmZ3AU=;
 b=OaJVwlxG9Uy2+s3gnp31jkKhPP/6fEyN4iyY3Ak+UVtZNlX4ODeLyYEq
 TiWKfPGz8DF2mjd+aCNJbHGeB8gmTIQPGNtu4qrHVoEMZAY6mqVUAcbtw
 n2mc51woTC3lbEsakepI/lF/ahql79e9K2233wXzPAG7bIanskQTAk/IL
 st463Eg3ySzHlZy8Mc+RUJQUTeyzpa6Oq5Zp1dSXWpvJl9HeJgAWjC84E
 LUL0wyiHGYPe/MDfGm588hlk7mDTpgO5wHk5MgsTLvNi82cer1eC69Leo
 uadV5ZhOKxkHV71OUBfzfZ17VIOH9elVMcDmrmjCUL12dEaIup2EI/aoe Q==;
X-CSE-ConnectionGUID: DdwCgiimTQ2SxmMHwDXfrA==
X-CSE-MsgGUID: SVvpsj/cR5Ca8kY5hU6Jdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61062093"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="61062093"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 02:07:30 -0700
X-CSE-ConnectionGUID: onPXTqJ8QFaWXoL/x/iyDw==
X-CSE-MsgGUID: oL1jaRZdST+4VD3BVpevCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="181101541"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 02:07:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 02:07:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 02:07:28 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 02:07:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjIq2h3q/VOXktHep089luFjllr5Ye0KHSZYb6dhzbWvcc0lWjfbcB5yaKOnQMBmd7cLA45haWI5ljezVlelNaebtqZEdz8u1mt4U/eKHkEqfVW5v7MSHoAqbRh7xs+D+auAR2Y1mbIJ027BYecUP3RIr728d3WcVQuFC2av8n5dVIFvhISknbMgMOZyguZngfrqXuDFO8dpSnNWu43o2Np3BonnNgZjNm8/eveIeu3aYdor3eXyQK/YoYvinfT6RGQ94OZYlVsV2Ijp7xtbAHUQDK2Sq4EX1Bx7UgIc6LaB+qR+LpxIQ4PM4TCDOLuxR6/eIJZWXvEYZTgA92q1lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQMq/WDrJ2vwv+tuRySHF4qq5uJU+Z/f0wF2BVGh6z4=;
 b=hVOIXM2y02uSmaZeWh5FoSpIt4WoP2l1hMwAMsMhdoG3Ie6ESM6tuCcbpk15LJ+PwDAHsDN1pRoOxJMCiLdSZYvYc4kUIAWhio1+Pz1n4SyvSRFaw2kV/45X7gEoDorCyG++V90uVN2OaV7OiUtNy4Jm9hzmUuvydLqZ5YrTg3numcPGtSR0NwGNIMEs5SjxxnLQcQwr7namaAeJc3CxTxXNRPeK7RgmYvp6DUQi/fOXJYRhUlLWL3plkmheV+SiFDO05rlVqJ8FwBbqNu8S4ukA2uAdum31LA5cJRyaM3QdlQHOML3GyrijPBDFcu5oKhf2jPGE6OpXrfIyBAED0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by IA1PR11MB7270.namprd11.prod.outlook.com (2603:10b6:208:42a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 09:07:25 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 09:07:25 +0000
Date: Tue, 23 Sep 2025 09:07:10 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Alexandr Sapozhnkiov <alsp705@gmail.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: Re: [PATCH 5.10] gpu/i915: fix error return in mmap_offset_attach()
Message-ID: <4u27n4orhmm4fn6xpxbdayqj3fz22lw3il7wjhtif5fjdyitps@d6i6i52giy4j>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250922144318.26-1-alsp705@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250922144318.26-1-alsp705@gmail.com>
X-ClientProxiedBy: TL2P290CA0016.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::18) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|IA1PR11MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f7c614-4b9f-4bc9-a05a-08ddfa809d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1l5cm9vY3dnc3lmVUx4Zzh5Rmx0NGxmdDFyTlJ0dDV3YmxkcFlUUEpqN0RF?=
 =?utf-8?B?TkZ0YWQvcmhtZlloN1ZOTEpyR1hleTBuWHBmMTR3bllxYTc1UkhSeWZqY24x?=
 =?utf-8?B?dEFuT0VLQU9neVpvNG5LYzJjMnFPeXVYSEwzQnBqZjAzRkVJOVZFaUxqdExT?=
 =?utf-8?B?QVZHZWJyREJVZy96N2tRS081SytDWm1QNlkwVVU5ZEZQSzg4Zytkemx6K2Iz?=
 =?utf-8?B?SHovOHpjRjNZL1NZUHNHUEo3UHVzbUVNT0JoZEFTMDN1K3VKek4vd3VZUnJo?=
 =?utf-8?B?OXVGaWtpeWltREp6ZldBcU1MTGlnMkQ5UWdJSVdrdU41OUVsemtERWVrYXVF?=
 =?utf-8?B?dXQxaGpBR2VuQ3FqeEV3V1U0T2dFNGFPdXJJUTlQTzdpc3JEY1pYT3Bhcjdj?=
 =?utf-8?B?MEZocytVaHhSWnQ0VlZBNjZVSlhUbEVBNTFaN3ZWSEEydExsT3o0TU1VTUww?=
 =?utf-8?B?cmVJT1B0dllTOHRrdDRBYXZYQ3JCSFE2d2lRSVFIQWhKUXNxdno0WFRZMDdT?=
 =?utf-8?B?bFFrS0VkUExWL2JEMTVqSVZaeDhLT2JkV3RzbFlzT0tlNnBvSVBWWWRRL2hY?=
 =?utf-8?B?Sjc5NW55YlIyUlNyd21oRnpLVVYwOVlkOUlnb3pON09xVXhuNFZlOHJEZDJw?=
 =?utf-8?B?dUdMd1Z5Z1h4NGp5a0pUVm9GMUNST21hRVJzMkVSblJIN2pWUzhpK2F0VnBs?=
 =?utf-8?B?cEpUc2x4ZXJEY1FHM3NZT0xwUEpXU3BiU2t0OHpvZ051eXRWbkR4RVNTSVNT?=
 =?utf-8?B?Y2ZHV3pTck1GVFFWWUg0ZmhCSUdnTDJKR1hpVVlqY0dUMDgzVnFNR1kxQ0hm?=
 =?utf-8?B?Lys1UHYrVGlWYWc1VTFLek95OXdTS0dCT2VtRmpScktSU0tNV3paR3lZclcv?=
 =?utf-8?B?VzkybzdZeU1UWVNLSis0aEYrWlRKbjI1V2kxSGxkbWtYbXQvbmJsc2VWV3hF?=
 =?utf-8?B?N0Q0QTIwYWJJVEFwTnR2QWFaT2NhVWhWSkVmdEczMlhHeVY3Tm56NFdGZmtw?=
 =?utf-8?B?MlBMSER6eEkyQmRRSnJwNkFNZUk4MXpvVXhZOW9wb3pZNGFJMzNUVWwzV0ln?=
 =?utf-8?B?d25FbllQZGcreTJOUUdGYko3MGpxREpLb25zSnNTRWJoeU50SWxQdDF6cEFw?=
 =?utf-8?B?YnQ3dk5VR3F2K3diZkczWnFVOXE0ejExRE5kN1REMndNMkVtTW9iak9SQnkv?=
 =?utf-8?B?Z3p0S1BqdXBLNXJqQkRtWTRWZkd1Q01OMmdkSXZCTytFQnMxQ0NzQVAwTHZU?=
 =?utf-8?B?MGVwcENUdkdzYlJzSXpJRVdVaE8zTnk2TFRicURMcUhYS0UxQXF3NWFER2xY?=
 =?utf-8?B?UHh6ZVB4SjBpSW0vcmVKNE1TcFhJQ2ZJWUFXZHZZWGRVSjRiQ0tENWEvWFdr?=
 =?utf-8?B?Y05sZldLVlBISzJpaWMvT2JqdTBYdDJLc3Bidm1yYWVjUVd3UzBaNDliLy95?=
 =?utf-8?B?Mzc1YXdoc2ZCeXNVVzRQeXJNM1hrL2ZtbFZkS2dDYnp3WTF3ejJtRnUrdFFP?=
 =?utf-8?B?STVNbXRkcVBncGN3ckViT1oxa0JmR2Z6OXVLakNuZnkvZnJaalNZNEVHS0tO?=
 =?utf-8?B?bW5ENm05enQ2R0RtLzFiZlU5WURVclMrVXowNExjVVY4KzZnS214NW9GVU55?=
 =?utf-8?B?N2tUajhRamhVelVMNU1VanlxYktmc29xWEJLZ1FnaXMwUnJtQUI1Wlg4ZjBo?=
 =?utf-8?B?R1gwWDBuT002OGh1K2tnYzZ0ZnJSRGxBMklON1ZMOWpuVlplNjNaeHdaZGZ4?=
 =?utf-8?B?NmhzbUtxTHBTSXlLSFVEbUZTMThxektxTm1BZFJCM0U3RXdGT3YvTk8zOVpy?=
 =?utf-8?B?K2FLVXJZUnFBYk5OSU1XS2QvRVNtdHdRVTJxN21Ta3dXL0luRlVLb2paMlBF?=
 =?utf-8?B?SHBNMFhGRDZkajdoSWR6djJlSTZ3dzBVWk55YUZhejJpSUVmZEhOK05HUEQz?=
 =?utf-8?Q?wQBgLxqfNB4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUFSaUFEVy9FL3VlWlROMUlkZmY0VVkwdU5rOTFlTXRDcWsySzdtRWpTQ3k4?=
 =?utf-8?B?RVNPUytYNzVnazBYUHFtZldWbktYR2Z2LzlFM1k1a0FYRXJCc2tobytCbzBM?=
 =?utf-8?B?aHFzdDRqVEpDMVYxanBWektnbUNxUEU5cU80SkY5VVZFSjBzSjNjV003b09M?=
 =?utf-8?B?NGdoc3lKdFpXQzBXclY5bURIL1hVcCtsY3BQbjF3R1UrTUg2SDRhQnlRVHNt?=
 =?utf-8?B?YzQ1SzA2NTd6ZnYwU3AzakhmcUQ0dEp2ckR6bTZad0djME5OK0V1QWdTZG5m?=
 =?utf-8?B?UkNWWEtHbWMyZTlJclRVNC95dXAvbm11NXhuUWdSaXo4WExlTmpoV3g4SFJB?=
 =?utf-8?B?eVpsZzhrU1dhN3hsaVNIYS90MURRcWZmUVd6dWoyMDg4MlM2eGtNNVBGZ2Jz?=
 =?utf-8?B?QUsvTEh4RTdReVJQTXZNNVRIdjFxVzh2dk1rQnEyTk9mR21DcUdiL1ZmaHNW?=
 =?utf-8?B?aEFEdXF5cUJrMnplRnp5ajJUbVZqRkV3eUlFMVQ4Sm5vY2xSYmxFZzJpbnlh?=
 =?utf-8?B?UzBRSC9xQkxKR29QZ1BISDQvQjBJSm5lOTdnRC9SdC9mWG9EcEp0UDgxQ1dy?=
 =?utf-8?B?WDNRdjlic1BZekpja0Y3U3lNVUpBZXZJU2RjM2gwM1NRVnBpSmZtVnJDKzdV?=
 =?utf-8?B?alJnam8xTkp6d2E0S28wTGRmRW40dUNLa0dKYXc4YnU3aHJWZWxwN3NnV0M5?=
 =?utf-8?B?RkcrT1lpQnhLVEhCM1Vma2FRZjd2RmNOdFVtb0dnYjNtcXpCbjRtOURQcFl6?=
 =?utf-8?B?MmpPc3BHZGZ1Wk8ycTBRWkNMT3NjQzFMWFkwQWRFWitwcHJuRGtDNlZTWFVH?=
 =?utf-8?B?cnR5TERWaHdUODMxbzJyeHZKWWwyVGVxSTYveG5wc0tDdjJKRVF1dk94VWha?=
 =?utf-8?B?N1VZM0FPM091SkkrRmhJMzcxUFoya0RJNDJURXcxWVdXSnZzT055aXBOaDhY?=
 =?utf-8?B?VDZ4ejZjWk55TENDTUlrZ0JIWVRCaXBacGhTMVN5aXFYblVZc1pZSDAyY3lX?=
 =?utf-8?B?VTk1NEN4RW5MeWszc3N3WmhiY1lKN0M3bnlFMldpejRzc3BxS1NwTWdrazgx?=
 =?utf-8?B?VDBSMDBLWTVtakN6c3lPNmx6Q0xyVkhTNGxvY2VBZC95eEFmOEdaUjNURDhh?=
 =?utf-8?B?OEp1U0NRNFJtbU42cnp1Zm9DU1JOdGd3K3ZLak16MnNIeWdXTk0yT1YxaWti?=
 =?utf-8?B?RUJLRTdmQXN2WnRVbXhYK1JlVDVvL0grTzFLS1Jva2NhYU13eUV0ZUk5KzQv?=
 =?utf-8?B?allZbis2WmNMRWU2LzlNeFZJRWpOVjNoN2MxQlNJOTFXSjV0ZXA4RGVxanR1?=
 =?utf-8?B?WTZOVWFKOXoycGZRTGRhRkg0aTRnVEltTUFnUkErdXRLdzhULzlXNEtnQlo1?=
 =?utf-8?B?Zi9XTG5ZNFkvS2RQOFNlYjVOcjJpb0hyenllK2pvdkJBQ29Idm4zN3NBV09a?=
 =?utf-8?B?Y1VBMmkrS0FJaDNFRkV1VEpVL0lNV3gzNVJocThUNDFkMXRVUDROTmtGcUIz?=
 =?utf-8?B?N0k4UXMwSzI0a3hPTUFqQTIvUEJLb3lZYU05dmw4U0JIakpFRkUvR1lzRHFZ?=
 =?utf-8?B?YzB6emhSYWRiakoxUWUrTEVleHJnbkRyVzJaWmpPNE5NclF3QS9qWTh1MkRY?=
 =?utf-8?B?TmVJUGxqdTV3WlBiY3JCa2hMYzVCYjRTK2hreENzSXA1dTdCaVllNlBGcVhN?=
 =?utf-8?B?Z3UrV215aG1rOGJ3OFZCSTVyRzVsNnp2TWRCUFF6MW03VUtOVndGVmx1NEFZ?=
 =?utf-8?B?VFZSYWcydFpyMDhZdmVOZ29iN04zWFZDRlM2RC9ZeStYeU0zSGZNT0VlOHJ1?=
 =?utf-8?B?U1pCb0NnSkptOHZjYXd1bDF3NmpRRVlDT0IyY0N1Rm8wNkNGZDlHYngrTHRx?=
 =?utf-8?B?ZzZsSFZ5cGd5dmQwc0FoKzNwS1BJTGU4NDBUWG5lNWZPT1lyVVdZZUdsaDRj?=
 =?utf-8?B?NGJNcWFTMlIyOTNjSi9HMG1zUDJBenZ3eVdrOU9KWWp1ZldWMHV3dXN6eWNT?=
 =?utf-8?B?RFhBZUY2M2Y1Qk56SlBuOUlxVDBQcUFldHQ4UENLRDRmYi9MR2xMai9HeU5M?=
 =?utf-8?B?NmVtTVA0MFdRSEZpWXZCUmhTNDhPNVB5QjZzdUpVaEFFaUp2eGVRU28reHA4?=
 =?utf-8?B?S3lDSVZxWjF4REVicnZSWEZNSTlCbnNDMXhpYjVUZVJ0SkEyOWM3K0gvak1F?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f7c614-4b9f-4bc9-a05a-08ddfa809d1b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 09:07:25.6373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d8PSVxdECLKrziGTyTaeosQnk53DHhvNQXEnNuMFVH5nXUq8y7V6yqWKmNP6yiNlUeeJ95sjVA32RvCjj2dLEXDZTq/0tWFHmez56c0Bo3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7270
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

Hi Alexandr,

> Return value of function 'drm_vma_node_allow', called 
> at i915_gem_mman.c:670, is not checked, but it is usually 
> checked for this function
Grepping for this function in the repo tells me this is currently
the only place we call it. I'd rephrase the commit message to focus
only on missing return code.

After that:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
-- 
Best Regards,
Krzysztof
