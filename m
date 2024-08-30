Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5754996569D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 07:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CCB10E248;
	Fri, 30 Aug 2024 05:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idMJRYE4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467C710E1BC;
 Fri, 30 Aug 2024 05:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724994112; x=1756530112;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4T7nq03uw7MKVm3BxaF+yy9Icj82JMXJxtb0LB6tf14=;
 b=idMJRYE4IJs21U18gmht9MRDXbIdlhZgmquEBVW/GcljjzjaIqgC2X7A
 bvrGNRIWCx3Wdfq4bve35zbUv1nSM15weLcIz70WYNIxE2sI494oxVKGQ
 9NJisKhASuMxjmXQNl10VYK5Widmh+VG68pwbC2nfcHYDpcz/B8ieUnJw
 CPaMGPvaljXRH2pqlncVm70tsma26qrUhBhfJ0DwOdqczSWW5DzLs79ZQ
 DDR3tvjDG0Qo3SMiCoCjj+8WVDhSaHlelDg29V7Vm4VgMSWPbQX2q2WbU
 NpPmZv0jYDaNQcZBiSN8iPIV79mFz90Lg3DccWx5EtuSJXWomwouN5sGR A==;
X-CSE-ConnectionGUID: Owu+bkeqQhGvyniMa49HDg==
X-CSE-MsgGUID: cJTN7ShbRBqEHSQu5o25Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="35029268"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="35029268"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 22:01:52 -0700
X-CSE-ConnectionGUID: UpNqRyDUQjmNMMQsu8TSrg==
X-CSE-MsgGUID: IgaqMnghTbmCQcYMk+gGDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="63482078"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 22:01:51 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 22:01:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 22:01:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 22:01:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZ5Fyk35l8lDmR69omsLEXV9UYhrxn8U+NdHiyaK2Px7mN/m5Nygy3htya1mFX6iB17eBg97H/LLxK5AOKH2lqeLjVyLwLX70dyi10DEO4+k7usISc1jM7tr/TE9tWEwH3Kgy+2o+vnolGcKceALbakFO53OPPYHKsgpYf6IYN3iZlbicPcWAAZnaxFzEtqLwQvaBvfH6gFIGdBdPnTt3+k5LpOe4Freu7Z6CLyvax+BZDlOXW9ChjssTwCWlyUtqWpCJ1BmX27WixcM97Q1YkaUIjhqiOW8U86j3VGjfOKtjdt0+lGsUVlcFBWxIB6E/Zep1q35yVRJXurDgHYm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vUPCpxJxT/vkfGRcOM42arUwRieJLRbN06o16sCFpo=;
 b=FKx17vGyh4UK6fzKu3RtSwsMJL5Rk2owLF8GnfeK7jbGBpV/jGG/ZVWub9dlOo1n2PFXkO9IiuH/4qsnjXPlwiWhpFNSQ/qr1EYszTFDZnWaSWfVraUiy8IkB83jRogposils5i6SY4dEbia4zWJQlY9cjuTERIl+x7zM97ZT0bpUrOAKnV+OC3gFiLDed6j2NxuJukklT3wv9Vd/BJO53dAbnYP82Rgjm9niBe9TYDHfFn5SxIayvc+0wrNmSuXUpXJk1DR61BaheaWgSCMdo+xtAze8QL9WUOod/0JlLFxp0xiWxM5ZVgDA7KRQ4s6kZ9ISlnOg9JgKfKTUsFy2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5937.namprd11.prod.outlook.com (2603:10b6:a03:42c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 05:01:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 30 Aug 2024
 05:01:39 +0000
Date: Fri, 30 Aug 2024 05:00:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <christian.koenig@amd.com>,
 <thomas.hellstrom@linux.intel.com>, <matthew.auld@intel.com>,
 <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
Message-ID: <ZtFR2zyqwsr1sddw@DUT025-TGLU.fm.intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <Zs80t6LxPt2bXMPA@phenom.ffwll.local>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zs80t6LxPt2bXMPA@phenom.ffwll.local>
X-ClientProxiedBy: SJ0PR05CA0164.namprd05.prod.outlook.com
 (2603:10b6:a03:339::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cbfb7d2-a41e-4bff-890a-08dcc8b0d53c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0FaSEFzMFRMbGhtQjNkKzdIVjhnRi9BcUpCSGNnRnVUaDRMNHRHOTI0WURx?=
 =?utf-8?B?dWhoVUYveDZjSTU1d0xCOXRSTng5ZzBRSTFpVnYyMXVjVjVPNWo5WkJHd3FF?=
 =?utf-8?B?Z1VhbVRuSmdoTjJ5MWQrck5XeURxRUdZeHA5ZURucnZzdWJXaEZ2K1E4WHdS?=
 =?utf-8?B?bEFjQUNMbG0wcE9NZVBGYW1NbkZCeGUxSWlsaE9WZVBURUJkMklMK2Y2RVdK?=
 =?utf-8?B?OE16RkpHcmkzKzNyc3pKalB4QzNWeXREQ2JrUlR0ZG5Hd1dDeXVZRVNNMmww?=
 =?utf-8?B?ZGQrRHltK2VCT1FMUWxRWm5QOFh3Q09NSit4UXp0N2d6Y2wreHMxVFRpem0w?=
 =?utf-8?B?OFNyVGFBK24wVlZua3FPS2RsUlhaVFdlaUxOdy9BUDhwaEN2SlN0RDU5L3ZY?=
 =?utf-8?B?ZE5mSW5LWnUzWDdBK3I5OXpHOG1QZFNGRVJoZnpydkZzKzVHTzFDME95UDBX?=
 =?utf-8?B?OWExR0R1Njd5RUE3a0xEY3pwelIrV1UxZ2JFcmt0WnFzUDJlL2hMT0U1NnBj?=
 =?utf-8?B?aUI3aGJBYUZ1VGlaZFdOT3lEbk5jZ2dVUTIwMGJ2bVAzK1JkK2tlZnFkYW94?=
 =?utf-8?B?SGtQL3BJRityekN2cXl6ZGpKUlM0SGVJZFRRcSsrL3VLQTFvSnE2VjZ2eUR1?=
 =?utf-8?B?UkZWY3B2NGFUMmVTaVdsM3JKZmVIZFNqVXN1RUdNTCtFY1FmZkQydWJWeThx?=
 =?utf-8?B?OG16bndwTWI5bUhIWDJEY3QxTE5mSTd4N3BBUUl3RllFZmNOdXFqMXlkR1J5?=
 =?utf-8?B?RFNzMndPWW9hbXVrU3MrQy9rMVRqaUFoRVYzblg1cVNKU0VuOE51d3E3N1Nz?=
 =?utf-8?B?VDZHajUydzZFY3NvTXRzZVlGT0tSVzlhcjBDaHV3UUc4YmIwREVjSGFMdzBm?=
 =?utf-8?B?ci9SYjhHaktqVkxJOWgxeU5TNUZCcmlxSmYwYWM2dGNwdUZtRWRBUDMya1BI?=
 =?utf-8?B?ak44eXI4cGIydmRrUmttbXM3ZWU0eit2UnlKRFhFZUM2T0pyVExGN1Q4Tndq?=
 =?utf-8?B?RDlFOTIzQXoydlFTZVJGU21vdy9mR1BWK2FlOSt4M09MME5NbG8rS212MVMx?=
 =?utf-8?B?aDVycDdyMVpMVi9GUzBlVzJzRXlrT0Voczd3ZzFTdlhPMzdFZFBOditXT2sx?=
 =?utf-8?B?K2FFWkExcmZucjhFN3o1M1VqRjdsQ2lKTEFWN0owdDk5NFFmclA4RzBxaWZh?=
 =?utf-8?B?Nm9iSDBMK2h2VzZ5U284eDM2VTB3T2Jvd1pSaHc4TlNzdVpUcnprdi9IV1Ni?=
 =?utf-8?B?cGgwUDNCZFYwNHpGcFRVSEFmMkVqOGZhbllhNCtZeENsbGN6MURSR2ZoZlN2?=
 =?utf-8?B?M2hZVGRZRlZEVWttQ0tRMlRocHB6VnVyT05QYUI2c1NGNlUyZVZqV2hQejQ1?=
 =?utf-8?B?SjVQbyt3WXBQaWdzTmZRTFRFZGdvMkFvVlhQaFhPdmNMQ1JSSXpxczFvZzhY?=
 =?utf-8?B?d2JjQmp0MFlJaG11WmQ5dXh5SUpadnhHaW1vYWxhZ3FESmV1TzYvb1duRFI5?=
 =?utf-8?B?cXExRnNjV3JsVGRGMnlodGVkSGw1VCtPb1l6UFBpZE5NVWJhSzNCcm14d2Zr?=
 =?utf-8?B?M1FBaE5hTmEyOFhPeHh3ejcvS1VzRmRnSG9BcCt1MnF3cFdXL1JTQzBTb3Y3?=
 =?utf-8?B?QjZUdUFiK0FYeGR0Zjd4ek9hZzZEZ3NEVGp6UXJKQ0JFYnZqeW5mb1pZVmNV?=
 =?utf-8?B?b3BsQU5qTjk5TXZwZ0lhYTVpK3Q2dzZVR0U4M1BJQlA2a0ZiSnRXT1VOMTY5?=
 =?utf-8?Q?ChWDxfyCzq4GN42usw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Um10U2JsdDBVTkVpUkROUk90V3htdXk1VndjNlk1QjZmMWV5ditZMTV6RDFu?=
 =?utf-8?B?TnRySUZ0UUpzZ2VUOVhlRndTVGZudUJDckdPRlF4QSs0eTZzaW1EcE9JQVUz?=
 =?utf-8?B?cDBWNkpHS3RtS3BZY3cyZzlDbHp2a2lRTDNFclI1SS9TZm1qSlpEUXY3TGRZ?=
 =?utf-8?B?UlBDanFOemM0UE44NldkSjRSRDJhUHgzRW5TYlBlYjhTNmprVVZJOHY3YnBG?=
 =?utf-8?B?REw5amNNVmMzK1NzNk5XNktER2t6SFdJNW1ya1R3K0Yyamp4ZVQ4NlQyRjc2?=
 =?utf-8?B?UDVnN0VxRTJKejJXNFh4L2I3M1NQWXA5SVVEN2tGaWZST0R0UU9BSWt3U2hj?=
 =?utf-8?B?WGpaQVhLREpvU3lJMXhTUnIyUVplcnNyTFdxYWxERVc5MEE1TzVWWDdSa1d0?=
 =?utf-8?B?NjVJV3c4Y3owOXc1amR1eWxIQmpDM293ZUlxWEd2cGpQZFFXcnhGY3dZZjF3?=
 =?utf-8?B?UldON0NUaWtObEo3RVFjbm5GK3hpUCt3UXV3aXBTM0creExsbmpVeEFqcTZi?=
 =?utf-8?B?Zzk5Y0VYVkdSWnA2Y2I1V1gwdmUwWHBWRkErKzBqVnF4enpodHpXUVBLUDU4?=
 =?utf-8?B?VDVzY2lrdVhLY29MSFR1WkNKTUpjeU1IWlpndzF2SzJvNDVOQk9YTnNjMHpx?=
 =?utf-8?B?TGtvSGhuSVIrRFlyRytkTzZuU1FXUVB5VW5YUXQzSUkwS1JDbDkrZVJuUnNJ?=
 =?utf-8?B?b1VwQTNLdWpxdjE0WXlyODB0cytKOVhBV1d6bjZlMVNTdWFyUzNlVTRFT0lB?=
 =?utf-8?B?Njg5Qm5HK1c1R2RwOGpEU05PTlZuVSt2cmNvZ2NaMWlnenBuTThYc2ZTKzJ3?=
 =?utf-8?B?TFJFNlRFQmxNZXBBaXNCQk1SWW5FMXowSGRaZU9xR0VpQS9GRGFWMjJoZE9K?=
 =?utf-8?B?d3ptZzVwUWsvZEEyU1dESENpQUd1L2RyUTNmUFEzMVZDQXo2ckJOY1lzTVJq?=
 =?utf-8?B?V2JLazJ6cVNteC94cythT3p4a2k1L28yWExVaHl2MHNEdWkyS2NJS2thM0d4?=
 =?utf-8?B?WCtScmxhYXNoMFIzNmdUK3VsZk04Sm1RR0Z4Y1hUZCtYVk51Y052YmJiTzFS?=
 =?utf-8?B?L1BzMFY3QkJSNDBkeXAyeTZ1K1lObTFFcFZFZHZsOE1Zbm5KNHduVDJ4TGlG?=
 =?utf-8?B?emRGV2NtcWxpSzJNejRQdmxtY083UTVCTHpxelJMUzdCSGtzdGoxM0J4MWlN?=
 =?utf-8?B?MmJpRnNXY1lweGZBTzhzTWJNK3hIdzlOVVFPOVp6RWNHV1dEWjZtdlJRN0xD?=
 =?utf-8?B?Wk9BL2p4a0d3RVRGVUtJTHVxbk5ZMmdvM1dSUnJHMUN2RjJYWmNGSW5KUWQv?=
 =?utf-8?B?eEhqNmpJVXlWVFpQMDgydmV1elphTk5SMllNK1o2dHNqNWlHUlFtU3hPV0pi?=
 =?utf-8?B?M2ZyblovV1hPNlBjM2crbEMxZkpNRTVYdGptNFRkUWdJSDkyYWlicEpuRGox?=
 =?utf-8?B?VXAvWXVCazJXZ245ODR0YVNsaWhIcHBvTmVWMDY5L25ueGZOc21GTkdOd21M?=
 =?utf-8?B?alRLR0tnZmJLTTNlcDJrUExPcGY1OG9tZXlPQ3Zlbkpmb1M2QXMxczEzQVBs?=
 =?utf-8?B?UjZSVFJNME8zMk9FRW5kc2lJdFhyQzRJU1N1Yk9ONGNPOWlCUVFWR1hDcGNa?=
 =?utf-8?B?QzNOc1FmdVlJbTE1M2daVnY1U1A5Ty9BZTlmMUFnUXZYa1NvMDFBSC96alBm?=
 =?utf-8?B?aE1PWWpTMm5BSndpdkluMlhueW1VUjdNQ1NPdC9CNlZ2WGE5dVkzRkZMaFNq?=
 =?utf-8?B?UkR3RS9qWWsyY2ZNc1ZqcFRYaUxBVzRGUElJaTh4YytBOTY0azJHOWZITXVD?=
 =?utf-8?B?SXJteHZQZVhzQzlzWTZkbVRLaXdBRGQ2VGNkOSswZEFEdzZKTDBtcjdkQVFB?=
 =?utf-8?B?R3FhRHV1WkNLa0ZReHM0NXp5QWQ2VWVoY2Z2b1VNNG5oc1ZnTDRESmVScldY?=
 =?utf-8?B?REthaGZncHRmVW84UmVNNkhYZFZJVng5R1lkR3k2QjF5NitRaDZkM0RXVWN5?=
 =?utf-8?B?SThIdWxMUCsxU0hyV3FnK1YyTkhVNDUvZHI3TlJzbWpNV25oSVVRNUxCSjdQ?=
 =?utf-8?B?WkVMaGdaenBGZ0NLd2k2SUM5bnZhc2dEWnBUbVZuWEthc2RZRWF1NmVPRzcv?=
 =?utf-8?B?ZDVNczRxT3Q5TGZNQ3VRbkk5UUFvMWdMRkNQMHVqN2NtakVHWjZIYTY1bXo2?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbfb7d2-a41e-4bff-890a-08dcc8b0d53c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 05:01:39.8427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btI60EBuuxWq1hhZc37jgMwdbY8b3GWzDd6ANGgYDx+hIs8GHgX1SbRsh5bpPGkbnjFyjlwqhPgHBDCcV2IViA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5937
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

On Wed, Aug 28, 2024 at 04:31:19PM +0200, Daniel Vetter wrote:
> On Tue, Aug 27, 2024 at 07:48:38PM -0700, Matthew Brost wrote:
> > +		if (!ctx->mmap_locked) {
> > +			/*
> > +			 * XXX: HMM locking document indicates only a read-lock
> > +			 * is required but there apears to be a window between
> > +			 * the MMU_NOTIFY_MIGRATE event triggered in a CPU fault
> > +			 * via migrate_vma_setup and the pages actually moving
> > +			 * in migrate_vma_finalize in which this code can grab
> > +			 * garbage pages. Grabbing the write-lock if the range
> > +			 * is attached to vram appears to protect against this
> > +			 * race.
> > +			 */
> 
> This one is really scary, since it means the entire migrate pte trickery
> is essentially completely busted. Grabbing the mmap write lock just means
> you block out pretty much everything interesting from concurrently
> happening.
> 
> My gut feeling says we need to figure out what's happening here, because
> this looks a bit too fundamental to me.
> -Sima
> 

Sima,

I’ve already replied to this.

We’ve discussed the mmap write hack extensively, so I’m not quite sure
where to put this. The reply chain is quickly becoming a mess. However,
I’ve looked into this and collected some data points based on your
feedback.

I’ve pushed a branch [1] with the updated code.

The first new commit [2] removes the mmap write lock hack and addresses
an issue related to VRAM migrations, which couldn’t collect all VRAM
pages without this hack.

With this commit [2], xe_exec_system_allocator --r twice*race* fails
quite regularly, perhaps 25% of the time. This test is a
single-thread/process test that races CPU and GPU faults with migration.

It fails with the following dmesg:

[   68.473007] WARNING: CPU: 12 PID: 1643 at drivers/gpu/drm/xe/drm_gpusvm.c:1407 drm_gpusvm_range_get_pages+0xbda/0x1480 [xe]
...
[   68.473836] xe 0000:03:00.0: [drm:pf_queue_work_func [xe]] Fault response: Unsuccessful -95
[   68.474024] xe 0000:03:00.0: [drm:xe_guc_exec_queue_memory_cat_error_handler [xe]] GT1: Engine memory cat error: engine_class=vecs, logical_mask: 0x2, guc_id=0
[   68.474163] xe 0000:03:00.0: [drm] exec queue reset detected
[   68.474696] xe 0000:03:00.0: [drm] GT1: Engine reset: engine_class=vecs, logical_mask: 0x2, guc_id=0

This means hmm_range_fault collects a mix of SRAM and VRAM pages, which
my design aims to avoid. Perhaps allowing a mix of SRAM and VRAM pages
in my design might work, but I highly doubt it based on AMD's
range->migration_mutex and my inspection of the migration layer.
Allowing mixed mappings would introduce significant complexity, so I’d
prefer to avoid this if possible. Additionally, allowing mixed mappings
would eliminate the use of huge GPU pages when race like this occurs.

I also implemented a retry loop to see if the system stabilizes with
either only SRAM or VRAM pages. Unfortunately, it results in a
continuous loop of drm_gpusvm_range_get_pages / hmm_range_fault until
the test case kills the MM due to a timeout.

Next, I added a lock similar to AMD's range->migration_lock, but using
an rwsem [3]. The semantics are to allow read access for CPU access and
write access for GPU access, thus enabling parallel CPU page faults for
the same range which matching existing core semantics. This provides
finer granularity compared to using the mmap write lock; it only
disallows CPU and GPU servicing in parallel for a given range, rather
than the entire MM. It also aligns with AMD’s approach. I haven’t
checked Nvidia’s approach wrt this locking but can do so if you think it
would be helpful.

Matt

[1] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svm-post-8-27-24/-/commits/mmap_write_lock
[2] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svm-post-8-27-24/-/commit/6cf67d98c719ffbb4ac6124a7cb81d797a5bad9f
[3] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svm-post-8-27-24/-/commit/2b62075d193265b2c1634ecfd0497dffd2e18c13

> 
> > +			if (vram_pages)
> > +				mmap_write_lock(mm);
> > +			else
> > +				mmap_read_lock(mm);
> > +		}
> > +		err = hmm_range_fault(&hmm_range);
> > +		if (!ctx->mmap_locked) {
> > +			if (vram_pages)
> > +				mmap_write_unlock(mm);
> > +			else
> > +				mmap_read_unlock(mm);
> > +		}
> > +
> > +		if (err == -EBUSY) {
> > +			if (time_after(jiffies, timeout))
> > +				break;
> > +
> > +			hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > +			continue;
> > +		}
> > +		break;
> > +	}
> > +	if (!ctx->mmap_locked)
> > +		mmput(mm);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	pages = (struct page **)pfns;
> > +
> > +	if (ctx->prefault) {
> > +		range->pages = pages;
> > +		goto set_seqno;
> > +	}
> > +
> > +map_pages:
> > +	if (is_device_private_page(hmm_pfn_to_page(pfns[0]))) {
> > +		WARN_ON_ONCE(!range->vram_allocation);
> > +
> > +		for (i = 0; i < npages; ++i) {
> > +			pages[i] = hmm_pfn_to_page(pfns[i]);
> > +
> > +			if (WARN_ON_ONCE(!is_device_private_page(pages[i]))) {
> > +				err = -EOPNOTSUPP;
> > +				goto err_free;
> > +			}
> > +		}
> > +
> > +		/* Do not race with notifier unmapping pages */
> > +		drm_gpusvm_notifier_lock(gpusvm);
> > +		range->flags.has_vram_pages = true;
> > +		range->pages = pages;
> > +		if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> > +			err = -EAGAIN;
> > +			__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > +		}
> > +		drm_gpusvm_notifier_unlock(gpusvm);
> > +	} else {
> > +		dma_addr_t *dma_addr = (dma_addr_t *)pfns;
> > +
> > +		for_each_dma_page(i, j, npages, order) {
> > +			if (WARN_ON_ONCE(i && order !=
> > +					 hmm_pfn_to_map_order(pfns[i]))) {
> > +				err = -EOPNOTSUPP;
> > +				npages = i;
> > +				goto err_unmap;
> > +			}
> > +			order = hmm_pfn_to_map_order(pfns[i]);
> > +
> > +			pages[j] = hmm_pfn_to_page(pfns[i]);
> > +			if (WARN_ON_ONCE(is_zone_device_page(pages[j]))) {
> > +				err = -EOPNOTSUPP;
> > +				npages = i;
> > +				goto err_unmap;
> > +			}
> > +
> > +			set_page_dirty_lock(pages[j]);
> > +			mark_page_accessed(pages[j]);
> > +
> > +			dma_addr[j] = dma_map_page(gpusvm->drm->dev,
> > +						   pages[j], 0,
> > +						   PAGE_SIZE << order,
> > +						   DMA_BIDIRECTIONAL);
> > +			if (dma_mapping_error(gpusvm->drm->dev, dma_addr[j])) {
> > +				err = -EFAULT;
> > +				npages = i;
> > +				goto err_unmap;
> > +			}
> > +		}
> > +
> > +		/* Huge pages, reduce memory footprint */
> > +		if (order) {
> > +			dma_addr = kmalloc_array(j, sizeof(*dma_addr),
> > +						 GFP_KERNEL);
> > +			if (dma_addr) {
> > +				for (i = 0; i < j; ++i)
> > +					dma_addr[i] = (dma_addr_t)pfns[i];
> > +				kvfree(pfns);
> > +				kfree_mapping = true;
> > +			} else {
> > +				dma_addr = (dma_addr_t *)pfns;
> > +			}
> > +		}
> > +
> > +		/* Do not race with notifier unmapping pages */
> > +		drm_gpusvm_notifier_lock(gpusvm);
> > +		range->order = order;
> > +		range->flags.kfree_mapping = kfree_mapping;
> > +		range->flags.has_dma_mapping = true;
> > +		range->dma_addr = dma_addr;
> > +		range->vram_allocation = NULL;
> > +		if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
> > +			err = -EAGAIN;
> > +			__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > +		}
> > +		drm_gpusvm_notifier_unlock(gpusvm);
> > +	}
> > +
> > +	if (err == -EAGAIN)
> > +		goto retry;
> > +set_seqno:
> > +	range->notifier_seq = hmm_range.notifier_seq;
> > +
> > +	return 0;
> > +
> > +err_unmap:
> > +	for_each_dma_page(i, j, npages, order)
> > +		dma_unmap_page(gpusvm->drm->dev,
> > +			       (dma_addr_t)pfns[j],
> > +			       PAGE_SIZE << order, DMA_BIDIRECTIONAL);
> > +err_free:
> > +	if (alloc_pfns)
> > +		kvfree(pfns);
> > +err_out:
> > +	return err;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_range_unmap_pages - Unmap pages associated with a GPU SVM range
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @range: Pointer to the GPU SVM range structure
> > + * @ctx: GPU SVM context
> > + *
> > + * This function unmaps pages associated with a GPU SVM range. If @in_notifier
> > + * is set, it is assumed that gpusvm->notifier_lock is held in write mode; if it
> > + * is clear, it acquires gpusvm->notifier_lock in read mode. Must be called on
> > + * each GPU SVM range attached to notifier in gpusvm->ops->invalidate for IOMMU
> > + * security model.
> > + */
> > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > +				  struct drm_gpusvm_range *range,
> > +				  const struct drm_gpusvm_ctx *ctx)
> > +{
> > +	if (ctx->in_notifier)
> > +		lockdep_assert_held_write(&gpusvm->notifier_lock);
> > +	else
> > +		drm_gpusvm_notifier_lock(gpusvm);
> > +
> > +	__drm_gpusvm_range_unmap_pages(gpusvm, range);
> > +
> > +	if (!ctx->in_notifier)
> > +		drm_gpusvm_notifier_unlock(gpusvm);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migration_put_page - Put a migration page
> > + * @page: Pointer to the page to put
> > + *
> > + * This function unlocks and puts a page.
> > + */
> > +static void drm_gpusvm_migration_put_page(struct page *page)
> > +{
> > +	unlock_page(page);
> > +	put_page(page);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migration_put_pages - Put migration pages
> > + * @npages: Number of pages
> > + * @migrate_pfn: Array of migrate page frame numbers
> > + *
> > + * This function puts an array of pages.
> > + */
> > +static void drm_gpusvm_migration_put_pages(unsigned long npages,
> > +					   unsigned long *migrate_pfn)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i = 0; i < npages; ++i) {
> > +		if (!migrate_pfn[i])
> > +			continue;
> > +
> > +		drm_gpusvm_migration_put_page(migrate_pfn_to_page(migrate_pfn[i]));
> > +		migrate_pfn[i] = 0;
> > +	}
> > +}
> > +
> > +/**
> > + * drm_gpusvm_get_vram_page - Get a reference to a VRAM page
> > + * @page: Pointer to the page
> > + * @zdd: Pointer to the GPU SVM zone device data
> > + *
> > + * This function associates the given page with the specified GPU SVM zone
> > + * device data and initializes it for zone device usage.
> > + */
> > +static void drm_gpusvm_get_vram_page(struct page *page,
> > +				     struct drm_gpusvm_zdd *zdd)
> > +{
> > +	page->zone_device_data = drm_gpusvm_zdd_get(zdd);
> > +	zone_device_page_init(page);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU SVM migration
> > + * @dev: The device for which the pages are being mapped
> > + * @dma_addr: Array to store DMA addresses corresponding to mapped pages
> > + * @migrate_pfn: Array of migrate page frame numbers to map
> > + * @npages: Number of pages to map
> > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > + *
> > + * This function maps pages of memory for migration usage in GPU SVM. It
> > + * iterates over each page frame number provided in @migrate_pfn, maps the
> > + * corresponding page, and stores the DMA address in the provided @dma_addr
> > + * array.
> > + *
> > + * Return: 0 on success, -EFAULT if an error occurs during mapping.
> > + */
> > +static int drm_gpusvm_migrate_map_pages(struct device *dev,
> > +					dma_addr_t *dma_addr,
> > +					long unsigned int *migrate_pfn,
> > +					unsigned long npages,
> > +					enum dma_data_direction dir)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i = 0; i < npages; ++i) {
> > +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
> > +
> > +		if (!page)
> > +			continue;
> > +
> > +		if (WARN_ON_ONCE(is_zone_device_page(page)))
> > +			return -EFAULT;
> > +
> > +		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
> > +		if (dma_mapping_error(dev, dma_addr[i]))
> > +			return -EFAULT;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
> > + * @dev: The device for which the pages were mapped
> > + * @dma_addr: Array of DMA addresses corresponding to mapped pages
> > + * @npages: Number of pages to unmap
> > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > + *
> > + * This function unmaps previously mapped pages of memory for GPU Shared Virtual
> > + * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
> > + * if it's valid and not already unmapped, and unmaps the corresponding page.
> > + */
> > +static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
> > +					   dma_addr_t *dma_addr,
> > +					   unsigned long npages,
> > +					   enum dma_data_direction dir)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i = 0; i < npages; ++i) {
> > +		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
> > +			continue;
> > +
> > +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> > +	}
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migrate_to_vram - Migrate GPU SVM range to VRAM
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @range: Pointer to the GPU SVM range structure
> > + *                   failure of this function.
> > + * @vram_allocation: Driver-private pointer to the VRAM allocation. The caller
> > + *                   should hold a reference to the VRAM allocation, which
> > + *                   should be dropped via ops->vram_allocation or upon the
> > + *                   failure of this function.
> > + * @ctx: GPU SVM context
> > + *
> > + * This function migrates the specified GPU SVM range to VRAM. It performs the
> > + * necessary setup and invokes the driver-specific operations for migration to
> > + * VRAM. Upon successful return, @vram_allocation can safely reference @range
> > + * until ops->vram_release is called which only upon successful return.
> > + *
> > + * Returns:
> > + * 0 on success, negative error code on failure.
> > + */
> > +int drm_gpusvm_migrate_to_vram(struct drm_gpusvm *gpusvm,
> > +			       struct drm_gpusvm_range *range,
> > +			       void *vram_allocation,
> > +			       const struct drm_gpusvm_ctx *ctx)
> > +{
> > +	u64 start = range->va.start, end = range->va.end;
> > +	struct migrate_vma migrate = {
> > +		.start		= start,
> > +		.end		= end,
> > +		.pgmap_owner	= gpusvm->device_private_page_owner,
> > +		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
> > +	};
> > +	struct mm_struct *mm = gpusvm->mm;
> > +	unsigned long i, npages = npages_in_range(start, end);
> > +	struct vm_area_struct *vas;
> > +	struct drm_gpusvm_zdd *zdd = NULL;
> > +	struct page **pages;
> > +	dma_addr_t *dma_addr;
> > +	void *buf;
> > +	int err;
> > +
> > +	if (!range->flags.migrate_vram)
> > +		return -EINVAL;
> > +
> > +	if (!gpusvm->ops->populate_vram_pfn || !gpusvm->ops->copy_to_vram ||
> > +	    !gpusvm->ops->copy_to_sram)
> > +		return -EOPNOTSUPP;
> > +
> > +	if (!ctx->mmap_locked) {
> > +		if (!mmget_not_zero(mm)) {
> > +			err = -EFAULT;
> > +			goto err_out;
> > +		}
> > +		mmap_write_lock(mm);
> > +	}
> > +
> > +	mmap_assert_locked(mm);
> > +
> > +	vas = vma_lookup(mm, start);
> > +	if (!vas) {
> > +		err = -ENOENT;
> > +		goto err_mmunlock;
> > +	}
> > +
> > +	if (end > vas->vm_end || start < vas->vm_start) {
> > +		err = -EINVAL;
> > +		goto err_mmunlock;
> > +	}
> > +
> > +	if (!vma_is_anonymous(vas)) {
> > +		err = -EBUSY;
> > +		goto err_mmunlock;
> > +	}
> > +
> > +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> > +		       sizeof(*pages), GFP_KERNEL);
> > +	if (!buf) {
> > +		err = -ENOMEM;
> > +		goto err_mmunlock;
> > +	}
> > +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> > +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> > +
> > +	zdd = drm_gpusvm_zdd_alloc(range);
> > +	if (!zdd) {
> > +		err = -ENOMEM;
> > +		goto err_free;
> > +	}
> > +
> > +	migrate.vma = vas;
> > +	migrate.src = buf;
> > +	migrate.dst = migrate.src + npages;
> > +
> > +	err = migrate_vma_setup(&migrate);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	/*
> > +	 * FIXME: Below cases, !migrate.cpages and migrate.cpages != npages, not
> > +	 * always an error. Need to revisit possible cases and how to handle. We
> > +	 * could prefault on migrate.cpages != npages via hmm_range_fault.
> > +	 */
> > +
> > +	if (!migrate.cpages) {
> > +		err = -EFAULT;
> > +		goto err_free;
> > +	}
> > +
> > +	if (migrate.cpages != npages) {
> > +		err = -EBUSY;
> > +		goto err_finalize;
> > +	}
> > +
> > +	err = gpusvm->ops->populate_vram_pfn(gpusvm, vram_allocation, npages,
> > +					     migrate.dst);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	err = drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
> > +					   migrate.src, npages, DMA_TO_DEVICE);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	for (i = 0; i < npages; ++i) {
> > +		struct page *page = pfn_to_page(migrate.dst[i]);
> > +
> > +		pages[i] = page;
> > +		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
> > +		drm_gpusvm_get_vram_page(page, zdd);
> > +	}
> > +
> > +	err = gpusvm->ops->copy_to_vram(gpusvm, pages, dma_addr, npages);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	/* Upon success bind vram allocation to range and zdd */
> > +	range->vram_allocation = vram_allocation;
> > +	WRITE_ONCE(zdd->vram_allocation, vram_allocation);	/* Owns ref */
> > +
> > +err_finalize:
> > +	if (err)
> > +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> > +	migrate_vma_pages(&migrate);
> > +	migrate_vma_finalize(&migrate);
> > +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
> > +				       DMA_TO_DEVICE);
> > +err_free:
> > +	if (zdd)
> > +		drm_gpusvm_zdd_put(zdd);
> > +	kvfree(buf);
> > +err_mmunlock:
> > +	if (!ctx->mmap_locked) {
> > +		mmap_write_unlock(mm);
> > +		mmput(mm);
> > +	}
> > +err_out:
> > +	return err;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migrate_populate_sram_pfn - Populate SRAM PFNs for a VM area
> > + * @vas: Pointer to the VM area structure, can be NULL
> > + * @npages: Number of pages to populate
> > + * @src_mpfn: Source array of migrate PFNs
> > + * @mpfn: Array of migrate PFNs to populate
> > + * @addr: Start address for PFN allocation
> > + *
> > + * This function populates the SRAM migrate page frame numbers (PFNs) for the
> > + * specified VM area structure. It allocates and locks pages in the VM area for
> > + * SRAM usage. If vas is non-NULL use alloc_page_vma for allocation, if NULL use
> > + * alloc_page for allocation.
> > + *
> > + * Returns:
> > + * 0 on success, negative error code on failure.
> > + */
> > +static int drm_gpusvm_migrate_populate_sram_pfn(struct vm_area_struct *vas,
> > +						unsigned long npages,
> > +						unsigned long *src_mpfn,
> > +						unsigned long *mpfn, u64 addr)
> > +{
> > +	unsigned long i;
> > +
> > +	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
> > +		struct page *page;
> > +
> > +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> > +			continue;
> > +
> > +		if (vas)
> > +			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
> > +		else
> > +			page = alloc_page(GFP_HIGHUSER);
> > +
> > +		if (!page)
> > +			return -ENOMEM;
> > +
> > +		lock_page(page);
> > +		mpfn[i] = migrate_pfn(page_to_pfn(page));
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_evict_to_sram - Evict GPU SVM range to SRAM
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @range: Pointer to the GPU SVM range structure
> > + *
> > + * Similar to __drm_gpusvm_migrate_to_sram but does not require mmap lock and
> > + * migration done via migrate_device_* functions. Fallback path as it is
> > + * preferred to issue migrations with mmap lock.
> > + *
> > + * Returns:
> > + * 0 on success, negative error code on failure.
> > + */
> > +static int drm_gpusvm_evict_to_sram(struct drm_gpusvm *gpusvm,
> > +				    struct drm_gpusvm_range *range)
> > +{
> > +	unsigned long npages;
> > +	struct page **pages;
> > +	unsigned long *src, *dst;
> > +	dma_addr_t *dma_addr;
> > +	void *buf;
> > +	int i, err = 0;
> > +
> > +	npages = npages_in_range(range->va.start, range->va.end);
> > +
> > +	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
> > +		       sizeof(*pages), GFP_KERNEL);
> > +	if (!buf) {
> > +		err = -ENOMEM;
> > +		goto err_out;
> > +	}
> > +	src = buf;
> > +	dst = buf + (sizeof(*src) * npages);
> > +	dma_addr = buf + (2 * sizeof(*src) * npages);
> > +	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
> > +
> > +	err = gpusvm->ops->populate_vram_pfn(gpusvm, range->vram_allocation,
> > +					     npages, src);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	err = migrate_device_vma_range(gpusvm->mm,
> > +				       gpusvm->device_private_page_owner, src,
> > +				       npages, range->va.start);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	err = drm_gpusvm_migrate_populate_sram_pfn(NULL, npages, src, dst, 0);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	err = drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
> > +					   dst, npages, DMA_BIDIRECTIONAL);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	for (i = 0; i < npages; ++i)
> > +		pages[i] = migrate_pfn_to_page(src[i]);
> > +
> > +	err = gpusvm->ops->copy_to_sram(gpusvm, pages, dma_addr, npages);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +err_finalize:
> > +	if (err)
> > +		drm_gpusvm_migration_put_pages(npages, dst);
> > +	migrate_device_pages(src, dst, npages);
> > +	migrate_device_finalize(src, dst, npages);
> > +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
> > +				       DMA_BIDIRECTIONAL);
> > +err_free:
> > +	kvfree(buf);
> > +err_out:
> > +
> > +	return err;
> > +}
> > +
> > +/**
> > + * __drm_gpusvm_migrate_to_sram - Migrate GPU SVM range to SRAM (internal)
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @vas: Pointer to the VM area structure
> > + * @page: Pointer to the page for fault handling (can be NULL)
> > + * @start: Start address of the migration range
> > + * @end: End address of the migration range
> > + *
> > + * This internal function performs the migration of the specified GPU SVM range
> > + * to SRAM. It sets up the migration, populates + dma maps SRAM PFNs, and
> > + * invokes the driver-specific operations for migration to SRAM.
> > + *
> > + * Returns:
> > + * 0 on success, negative error code on failure.
> > + */
> > +static int __drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > +					struct vm_area_struct *vas,
> > +					struct page *page,
> > +					u64 start, u64 end)
> > +{
> > +	struct migrate_vma migrate = {
> > +		.vma		= vas,
> > +		.pgmap_owner	= gpusvm->device_private_page_owner,
> > +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> > +		.fault_page	= page,
> > +	};
> > +	unsigned long npages;
> > +	struct page **pages;
> > +	dma_addr_t *dma_addr;
> > +	void *buf;
> > +	int i, err = 0;
> > +
> > +	mmap_assert_locked(gpusvm->mm);
> > +
> > +	/* Corner where VMA area struct has been partially unmapped */
> > +	if (start < vas->vm_start)
> > +		start = vas->vm_start;
> > +	if (end > vas->vm_end)
> > +		end = vas->vm_end;
> > +
> > +	migrate.start = start;
> > +	migrate.end = end;
> > +	npages = npages_in_range(start, end);
> > +
> > +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
> > +		       sizeof(*pages), GFP_KERNEL);
> > +	if (!buf) {
> > +		err = -ENOMEM;
> > +		goto err_out;
> > +	}
> > +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
> > +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
> > +
> > +	migrate.vma = vas;
> > +	migrate.src = buf;
> > +	migrate.dst = migrate.src + npages;
> > +
> > +	err = migrate_vma_setup(&migrate);
> > +	if (err)
> > +		goto err_free;
> > +
> > +	/* Raced with another CPU fault, nothing to do */
> > +	if (!migrate.cpages)
> > +		goto err_free;
> > +
> > +	err = drm_gpusvm_migrate_populate_sram_pfn(vas, npages,
> > +						   migrate.src, migrate.dst,
> > +						   start);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	err = drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
> > +					   migrate.dst, npages,
> > +					   DMA_BIDIRECTIONAL);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +	for (i = 0; i < npages; ++i)
> > +		pages[i] = migrate_pfn_to_page(migrate.src[i]);
> > +
> > +	err = gpusvm->ops->copy_to_sram(gpusvm, pages, dma_addr, npages);
> > +	if (err)
> > +		goto err_finalize;
> > +
> > +err_finalize:
> > +	if (err)
> > +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
> > +	migrate_vma_pages(&migrate);
> > +	migrate_vma_finalize(&migrate);
> > +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
> > +				       DMA_BIDIRECTIONAL);
> > +err_free:
> > +	kvfree(buf);
> > +err_out:
> > +	mmap_assert_locked(gpusvm->mm);
> > +
> > +	return err;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migrate_to_sram - Migrate (evict) GPU SVM range to SRAM
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @range: Pointer to the GPU SVM range structure
> > + * @ctx: GPU SVM context
> > + *
> > + * This function initiates the migration of the specified GPU SVM range to
> > + * SRAM. It performs necessary checks and invokes the internal migration
> > + * function for actual migration.
> > + *
> > + * Returns:
> > + * 0 on success, negative error code on failure.
> > + */
> > +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > +			       struct drm_gpusvm_range *range,
> > +			       const struct drm_gpusvm_ctx *ctx)
> > +{
> > +	u64 start = range->va.start, end = range->va.end;
> > +	struct mm_struct *mm = gpusvm->mm;
> > +	struct vm_area_struct *vas;
> > +	int err;
> > +	bool retry = false;
> > +
> > +	if (!ctx->mmap_locked) {
> > +		if (!mmget_not_zero(mm)) {
> > +			err = -EFAULT;
> > +			goto err_out;
> > +		}
> > +		if (ctx->trylock_mmap) {
> > +			if (!mmap_read_trylock(mm))  {
> > +				err = drm_gpusvm_evict_to_sram(gpusvm, range);
> > +				goto err_mmput;
> > +			}
> > +		} else {
> > +			mmap_read_lock(mm);
> > +		}
> > +	}
> > +
> > +	mmap_assert_locked(mm);
> > +
> > +	/*
> > +	 * Loop required to find all VMA area structs for the corner case when
> > +	 * VRAM backing has been partially unmapped from MM's address space.
> > +	 */
> > +again:
> > +	vas = find_vma(mm, start);
> > +	if (!vas) {
> > +		if (!retry)
> > +			err = -ENOENT;
> > +		goto err_mmunlock;
> > +	}
> > +
> > +	if (end <= vas->vm_start || start >= vas->vm_end) {
> > +		if (!retry)
> > +			err = -EINVAL;
> > +		goto err_mmunlock;
> > +	}
> > +
> > +	err = __drm_gpusvm_migrate_to_sram(gpusvm, vas, NULL, start, end);
> > +	if (err)
> > +		goto err_mmunlock;
> > +
> > +	if (vas->vm_end < end) {
> > +		retry = true;
> > +		start = vas->vm_end;
> > +		goto again;
> > +	}
> > +
> > +	if (!ctx->mmap_locked) {
> > +		mmap_read_unlock(mm);
> > +		/*
> > +		 * Using mmput_async as this function can be called while
> > +		 * holding a dma-resv lock, and a final put can grab the mmap
> > +		 * lock, causing a lock inversion.
> > +		 */
> > +		mmput_async(mm);
> > +	}
> > +
> > +	return 0;
> > +
> > +err_mmunlock:
> > +	if (!ctx->mmap_locked)
> > +		mmap_read_unlock(mm);
> > +err_mmput:
> > +	if (!ctx->mmap_locked)
> > +		mmput_async(mm);
> > +err_out:
> > +	return err;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_page_free - Put GPU SVM zone device data associated with a page
> > + * @page: Pointer to the page
> > + *
> > + * This function is a callback used to put the GPU SVM zone device data
> > + * associated with a page when it is being released.
> > + */
> > +static void drm_gpusvm_page_free(struct page *page)
> > +{
> > +	drm_gpusvm_zdd_put(page->zone_device_data);
> > +}
> > +
> > +/**
> > + * drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM (page fault handler)
> > + * @vmf: Pointer to the fault information structure
> > + *
> > + * This function is a page fault handler used to migrate a GPU SVM range to RAM.
> > + * It retrieves the GPU SVM range information from the faulting page and invokes
> > + * the internal migration function to migrate the range back to RAM.
> > + *
> > + * Returns:
> > + * VM_FAULT_SIGBUS on failure, 0 on success.
> > + */
> > +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
> > +{
> > +	struct drm_gpusvm_zdd *zdd = vmf->page->zone_device_data;
> > +	int err;
> > +
> > +	err = __drm_gpusvm_migrate_to_sram(zdd->range->gpusvm,
> > +					   vmf->vma, vmf->page,
> > +					   zdd->range->va.start,
> > +					   zdd->range->va.end);
> > +
> > +	return err ? VM_FAULT_SIGBUS : 0;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_pagemap_ops - Device page map operations for GPU SVM
> > + */
> > +static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops = {
> > +	.page_free = drm_gpusvm_page_free,
> > +	.migrate_to_ram = drm_gpusvm_migrate_to_ram,
> > +};
> > +
> > +/**
> > + * drm_gpusvm_pagemap_ops_get - Retrieve GPU SVM device page map operations
> > + *
> > + * Returns:
> > + * Pointer to the GPU SVM device page map operations structure.
> > + */
> > +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
> > +{
> > +	return &drm_gpusvm_pagemap_ops;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_has_mapping - Check if GPU SVM has mapping for the given address range
> > + * @gpusvm: Pointer to the GPU SVM structure.
> > + * @start: Start address
> > + * @end: End address
> > + *
> > + * Returns:
> > + * True if GPU SVM has mapping, False otherwise
> > + */
> > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, u64 end)
> > +{
> > +	struct drm_gpusvm_notifier *notifier;
> > +
> > +	drm_gpusvm_for_each_notifier(notifier, gpusvm, start, end) {
> > +		struct drm_gpusvm_range *range = NULL;
> > +
> > +		drm_gpusvm_for_each_range(range, notifier, start, end)
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > diff --git a/drivers/gpu/drm/xe/drm_gpusvm.h b/drivers/gpu/drm/xe/drm_gpusvm.h
> > new file mode 100644
> > index 000000000000..0ea70f8534a8
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/drm_gpusvm.h
> > @@ -0,0 +1,415 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef __DRM_GPUSVM_H__
> > +#define __DRM_GPUSVM_H__
> > +
> > +#include <linux/kref.h>
> > +#include <linux/mmu_notifier.h>
> > +#include <linux/workqueue.h>
> > +
> > +struct dev_pagemap_ops;
> > +struct drm_device;
> > +struct drm_gpusvm;
> > +struct drm_gpusvm_notifier;
> > +struct drm_gpusvm_ops;
> > +struct drm_gpusvm_range;
> > +
> > +/**
> > + * struct drm_gpusvm_ops - Operations structure for GPU SVM
> > + *
> > + * This structure defines the operations for GPU Shared Virtual Memory (SVM).
> > + * These operations are provided by the GPU driver to manage SVM ranges and
> > + * perform operations such as migration between VRAM and system RAM.
> > + */
> > +struct drm_gpusvm_ops {
> > +	/**
> > +	 * @notifier_alloc: Allocate a GPU SVM notifier (optional)
> > +	 *
> > +	 * This function shall allocate a GPU SVM notifier.
> > +	 *
> > +	 * Returns:
> > +	 * Pointer to the allocated GPU SVM notifier on success, NULL on failure.
> > +	 */
> > +	struct drm_gpusvm_notifier *(*notifier_alloc)(void);
> > +
> > +	/**
> > +	 * @notifier_free: Free a GPU SVM notifier (optional)
> > +	 * @notifier: Pointer to the GPU SVM notifier to be freed
> > +	 *
> > +	 * This function shall free a GPU SVM notifier.
> > +	 */
> > +	void (*notifier_free)(struct drm_gpusvm_notifier *notifier);
> > +
> > +	/**
> > +	 * @range_alloc: Allocate a GPU SVM range (optional)
> > +	 * @gpusvm: Pointer to the GPU SVM
> > +	 *
> > +	 * This function shall allocate a GPU SVM range.
> > +	 *
> > +	 * Returns:
> > +	 * Pointer to the allocated GPU SVM range on success, NULL on failure.
> > +	 */
> > +	struct drm_gpusvm_range *(*range_alloc)(struct drm_gpusvm *gpusvm);
> > +
> > +	/**
> > +	 * @range_free: Free a GPU SVM range (optional)
> > +	 * @range: Pointer to the GPU SVM range to be freed
> > +	 *
> > +	 * This function shall free a GPU SVM range.
> > +	 */
> > +	void (*range_free)(struct drm_gpusvm_range *range);
> > +
> > +	/**
> > +	 * @vram_release: Release VRAM allocation (optional)
> > +	 * @vram_allocation: Driver-private pointer to the VRAM allocation
> > +	 *
> > +	 * This function shall release VRAM allocation and expects to drop a
> > +	 * reference to VRAM allocation.
> > +	 */
> > +	void (*vram_release)(void *vram_allocation);
> > +
> > +	/**
> > +	 * @populate_vram_pfn: Populate VRAM PFN (required for migration)
> > +	 * @gpusvm: Pointer to the GPU SVM
> > +	 * @vram_allocation: Driver-private pointer to the VRAM allocation
> > +	 * @npages: Number of pages to populate
> > +	 * @pfn: Array of page frame numbers to populate
> > +	 *
> > +	 * This function shall populate VRAM page frame numbers (PFN).
> > +	 *
> > +	 * Returns:
> > +	 * 0 on success, a negative error code on failure.
> > +	 */
> > +	int (*populate_vram_pfn)(struct drm_gpusvm *gpusvm,
> > +				 void *vram_allocation,
> > +				 unsigned long npages,
> > +				 unsigned long *pfn);
> > +
> > +	/**
> > +	 * @copy_to_vram: Copy to VRAM (required for migration)
> > +	 * @gpusvm: Pointer to the GPU SVM
> > +	 * @pages: Pointer to array of VRAM pages (destination)
> > +	 * @dma_addr: Pointer to array of DMA addresses (source)
> > +	 * @npages: Number of pages to copy
> > +	 *
> > +	 * This function shall copy pages to VRAM.
> > +	 *
> > +	 * Returns:
> > +	 * 0 on success, a negative error code on failure.
> > +	 */
> > +	int (*copy_to_vram)(struct drm_gpusvm *gpusvm,
> > +			    struct page **pages,
> > +			    dma_addr_t *dma_addr,
> > +			    unsigned long npages);
> > +
> > +	/**
> > +	 * @copy_to_sram: Copy to system RAM (required for migration)
> > +	 * @gpusvm: Pointer to the GPU SVM
> > +	 * @pages: Pointer to array of VRAM pages (source)
> > +	 * @dma_addr: Pointer to array of DMA addresses (destination)
> > +	 * @npages: Number of pages to copy
> > +	 *
> > +	 * This function shall copy pages to system RAM.
> > +	 *
> > +	 * Returns:
> > +	 * 0 on success, a negative error code on failure.
> > +	 */
> > +	int (*copy_to_sram)(struct drm_gpusvm *gpusvm,
> > +			    struct page **pages,
> > +			    dma_addr_t *dma_addr,
> > +			    unsigned long npages);
> > +
> > +	/**
> > +	 * @invalidate: Invalidate GPU SVM notifier (required)
> > +	 * @gpusvm: Pointer to the GPU SVM
> > +	 * @notifier: Pointer to the GPU SVM notifier
> > +	 * @mmu_range: Pointer to the mmu_notifier_range structure
> > +	 *
> > +	 * This function shall invalidate the GPU page tables. It can safely
> > +	 * walk the notifier range RB tree/list in this function. Called while
> > +	 * holding the notifier lock.
> > +	 */
> > +	void (*invalidate)(struct drm_gpusvm *gpusvm,
> > +			   struct drm_gpusvm_notifier *notifier,
> > +			   const struct mmu_notifier_range *mmu_range);
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm_notifier - Structure representing a GPU SVM notifier
> > + *
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @notifier: MMU interval notifier
> > + * @interval: Interval for the notifier
> > + * @rb: Red-black tree node for the parent GPU SVM structure notifier tree
> > + * @root: Cached root node of the RB tree containing ranges
> > + * @range_list: List head containing of ranges in the same order they appear in
> > + *              interval tree. This is useful to keep iterating ranges while
> > + *              doing modifications to RB tree.
> > + * @flags.removed: Flag indicating whether the MMU interval notifier has been
> > + *                 removed
> > + *
> > + * This structure represents a GPU SVM notifier.
> > + */
> > +struct drm_gpusvm_notifier {
> > +	struct drm_gpusvm *gpusvm;
> > +	struct mmu_interval_notifier notifier;
> > +	struct {
> > +		u64 start;
> > +		u64 end;
> > +	} interval;
> > +	struct {
> > +		struct rb_node node;
> > +		struct list_head entry;
> > +		u64 __subtree_last;
> > +	} rb;
> > +	struct rb_root_cached root;
> > +	struct list_head range_list;
> > +	struct {
> > +		u32 removed : 1;
> > +	} flags;
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm_range - Structure representing a GPU SVM range
> > + *
> > + * @gpusvm: Pointer to the GPU SVM structure
> > + * @notifier: Pointer to the GPU SVM notifier
> > + * @refcount: Reference count for the range
> > + * @rb: Red-black tree node for the parent GPU SVM notifier structure range tree
> > + * @va: Virtual address range
> > + * @notifier_seq: Notifier sequence number of the range's pages
> > + * @pages: Pointer to the array of pages (if backing store is in VRAM)
> > + * @dma_addr: DMA address array (if backing store is SRAM and DMA mapped)
> > + * @vram_allocation: Driver-private pointer to the VRAM allocation
> > + * @order: Order of dma mapping. i.e. PAGE_SIZE << order is mapping size
> > + * @flags.migrate_vram: Flag indicating whether the range can be migrated to VRAM
> > + * @flags.unmapped: Flag indicating if the range has been unmapped
> > + * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
> > + * @flags.has_vram_pages: Flag indicating if the range has vram pages
> > + * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
> > + * @flags.kfree_mapping: Flag indicating @dma_addr is a compact allocation based
> > + *                       on @order which releases via kfree
> > + *
> > + * This structure represents a GPU SVM range used for tracking memory ranges
> > + * mapped in a DRM device.
> > + */
> > +struct drm_gpusvm_range {
> > +	struct drm_gpusvm *gpusvm;
> > +	struct drm_gpusvm_notifier *notifier;
> > +	struct kref refcount;
> > +	struct {
> > +		struct rb_node node;
> > +		struct list_head entry;
> > +		u64 __subtree_last;
> > +	} rb;
> > +	struct {
> > +		u64 start;
> > +		u64 end;
> > +	} va;
> > +	unsigned long notifier_seq;
> > +	union {
> > +		struct page **pages;
> > +		dma_addr_t *dma_addr;
> > +	};
> > +	void *vram_allocation;
> > +	u16 order;
> > +	struct {
> > +		/* All flags below must be set upon creation */
> > +		u16 migrate_vram : 1;
> > +		/* All flags below must be set / cleared under notifier lock */
> > +		u16 unmapped : 1;
> > +		u16 partial_unmap : 1;
> > +		u16 has_vram_pages : 1;
> > +		u16 has_dma_mapping : 1;
> > +		u16 kfree_mapping : 1;
> > +	} flags;
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm - GPU SVM structure
> > + *
> > + * @name: Name of the GPU SVM
> > + * @drm: Pointer to the DRM device structure
> > + * @mm: Pointer to the mm_struct for the address space
> > + * @device_private_page_owner: Device private pages owner
> > + * @mm_start: Start address of GPU SVM
> > + * @mm_range: Range of the GPU SVM
> > + * @notifier_size: Size of individual notifiers
> > + * @ops: Pointer to the operations structure for GPU SVM
> > + * @chunk_sizes: Pointer to the array of chunk sizes used in range allocation.
> > + *               Entries should be powers of 2 in descending order.
> > + * @num_chunks: Number of chunks
> > + * @notifier_lock: Read-write semaphore for protecting notifier operations
> > + * @zdd_wq: Workqueue for deferred work on zdd destruction
> > + * @root: Cached root node of the Red-Black tree containing GPU SVM notifiers
> > + * @notifier_list: list head containing of notifiers in the same order they
> > + *                 appear in interval tree. This is useful to keep iterating
> > + *                 notifiers while doing modifications to RB tree.
> > + *
> > + * This structure represents a GPU SVM (Shared Virtual Memory) used for tracking
> > + * memory ranges mapped in a DRM (Direct Rendering Manager) device.
> > + *
> > + * No reference counting is provided, as this is expected to be embedded in the
> > + * driver VM structure along with the struct drm_gpuvm, which handles reference
> > + * counting.
> > + */
> > +struct drm_gpusvm {
> > +	const char *name;
> > +	struct drm_device *drm;
> > +	struct mm_struct *mm;
> > +	void *device_private_page_owner;
> > +	u64 mm_start;
> > +	u64 mm_range;
> > +	u64 notifier_size;
> > +	const struct drm_gpusvm_ops *ops;
> > +	const u64 *chunk_sizes;
> > +	int num_chunks;
> > +	struct rw_semaphore notifier_lock;
> > +	struct workqueue_struct *zdd_wq;
> > +	struct rb_root_cached root;
> > +	struct list_head notifier_list;
> > +};
> > +
> > +/**
> > + * struct drm_gpusvm_ctx - DRM GPU SVM context
> > + *
> > + * @mmap_locked: mmap lock is locked
> > + * @trylock_mmap: trylock mmap lock, used to avoid locking inversions
> > + *                (e.g.dma-revs -> mmap lock)
> > + * @in_notifier: entering from a MMU notifier
> > + * @read_only: operating on read-only memory
> > + * @vram_possible: possible to use VRAM
> > + * @prefault: prefault pages
> > + *
> > + * Context that is DRM GPUSVM is operating in (i.e. user arguments).
> > + */
> > +struct drm_gpusvm_ctx {
> > +	u32 mmap_locked :1;
> > +	u32 trylock_mmap :1;
> > +	u32 in_notifier :1;
> > +	u32 read_only :1;
> > +	u32 vram_possible :1;
> > +	u32 prefault :1;
> > +};
> > +
> > +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > +		    const char *name, struct drm_device *drm,
> > +		    struct mm_struct *mm, void *device_private_page_owner,
> > +		    u64 mm_start, u64 mm_range, u64 notifier_size,
> > +		    const struct drm_gpusvm_ops *ops,
> > +		    const u64 *chunk_sizes, int num_chunks);
> > +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
> > +void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
> > +
> > +struct drm_gpusvm_range *
> > +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm, u64 fault_addr,
> > +				u64 gpuva_start, u64 gpuva_end,
> > +				const struct drm_gpusvm_ctx *ctx);
> > +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> > +			     struct drm_gpusvm_range *range);
> > +
> > +struct drm_gpusvm_range *
> > +drm_gpusvm_range_get(struct drm_gpusvm_range *range);
> > +void drm_gpusvm_range_put(struct drm_gpusvm_range *range);
> > +
> > +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> > +				  struct drm_gpusvm_range *range);
> > +
> > +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> > +			       struct drm_gpusvm_range *range,
> > +			       const struct drm_gpusvm_ctx *ctx);
> > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > +				  struct drm_gpusvm_range *range,
> > +				  const struct drm_gpusvm_ctx *ctx);
> > +
> > +int drm_gpusvm_migrate_to_vram(struct drm_gpusvm *gpusvm,
> > +			       struct drm_gpusvm_range *range,
> > +			       void *vram_allocation,
> > +			       const struct drm_gpusvm_ctx *ctx);
> > +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > +			       struct drm_gpusvm_range *range,
> > +			       const struct drm_gpusvm_ctx *ctx);
> > +
> > +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
> > +
> > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, u64 end);
> > +
> > +struct drm_gpusvm_range *
> > +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, u64 start, u64 end);
> > +
> > +/**
> > + * drm_gpusvm_notifier_lock - Lock GPU SVM notifier
> > + * @gpusvm__: Pointer to the GPU SVM structure.
> > + *
> > + * Abstract client usage GPU SVM notifier lock, take lock
> > + */
> > +#define drm_gpusvm_notifier_lock(gpusvm__)	\
> > +	down_read(&(gpusvm__)->notifier_lock)
> > +
> > +/**
> > + * drm_gpusvm_notifier_unlock - Unlock GPU SVM notifier
> > + * @gpusvm__: Pointer to the GPU SVM structure.
> > + *
> > + * Abstract client usage GPU SVM notifier lock, drop lock
> > + */
> > +#define drm_gpusvm_notifier_unlock(gpusvm__)	\
> > +	up_read(&(gpusvm__)->notifier_lock)
> > +
> > +/**
> > + * __drm_gpusvm_range_next - Get the next GPU SVM range in the list
> > + * @range: a pointer to the current GPU SVM range
> > + *
> > + * Return: A pointer to the next drm_gpusvm_range if available, or NULL if the
> > + *         current range is the last one or if the input range is NULL.
> > + */
> > +static inline struct drm_gpusvm_range *
> > +__drm_gpusvm_range_next(struct drm_gpusvm_range *range)
> > +{
> > +	if (range && !list_is_last(&range->rb.entry,
> > +				   &range->notifier->range_list))
> > +		return list_next_entry(range, rb.entry);
> > +
> > +	return NULL;
> > +}
> > +
> > +/**
> > + * drm_gpusvm_for_each_range - Iterate over GPU SVM ranges in a notifier
> > + * @range__: Iterator variable for the ranges. If set, it indicates the start of
> > + *	     the iterator. If NULL, call drm_gpusvm_range_find() to get the range.
> > + * @notifier__: Pointer to the GPU SVM notifier
> > + * @start__: Start address of the range
> > + * @end__: End address of the range
> > + *
> > + * This macro is used to iterate over GPU SVM ranges in a notifier. It is safe
> > + * to use while holding the driver SVM lock or the notifier lock.
> > + */
> > +#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
> > +	for ((range__) = (range__) ?:					\
> > +	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
> > +	     (range__) && (range__->va.start < (end__));		\
> > +	     (range__) = __drm_gpusvm_range_next(range__))
> > +
> > +/**
> > + * drm_gpusvm_range_set_unmapped - Mark a GPU SVM range as unmapped
> > + * @range: Pointer to the GPU SVM range structure.
> > + * @mmu_range: Pointer to the MMU notifier range structure.
> > + *
> > + * This function marks a GPU SVM range as unmapped and sets the partial_unmap flag
> > + * if the range partially falls within the provided MMU notifier range.
> > + */
> > +static inline void
> > +drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
> > +			      const struct mmu_notifier_range *mmu_range)
> > +{
> > +	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
> > +
> > +	range->flags.unmapped = true;
> > +	if (range->va.start < mmu_range->start ||
> > +	    range->va.end > mmu_range->end)
> > +		range->flags.partial_unmap = true;
> > +}
> > +
> > +#endif /* __DRM_GPUSVM_H__ */
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
