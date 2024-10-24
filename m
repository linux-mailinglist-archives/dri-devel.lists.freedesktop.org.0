Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B5F9AEAFE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 17:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D630F10E97A;
	Thu, 24 Oct 2024 15:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMCZNi22";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F30E10E2A8;
 Thu, 24 Oct 2024 15:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729784860; x=1761320860;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eKubF6Asn8YdKaVPk7SnZG6Obu47U52xGG/ueh8SIVE=;
 b=CMCZNi22C0GuAiIBamJIVaXvQ6fr3hJJ2uYNOj7TE/s6G+m7GQhjHRHt
 PjKrUV79nAT076dHlEoi3xHsNh9Dr6EFcip1+zwDaQPhL1eTjOVHCb8D9
 5bK7QuCOTUCS56dqBFS/muqW2H23JIUQOobqcPRklHYKm8jPlIGyu83mI
 bZU5/jprmfFzhQ1JqFEdd22HwAjrNUZM54WiybhJQvwqDsVk5OLiopMlM
 69LRM2DGwelyERIwjTQLsTBIj1CZapKk9Uey4SZwM4O0KPexpi00nSSA9
 TC5AY2SuIECdk9ARnPzbkd1TfdDlfa+8bQDDdt5nEGGicOIH0QllGYKhH g==;
X-CSE-ConnectionGUID: 8eoSFqIAT2qLjRIL828/yA==
X-CSE-MsgGUID: Tv3D5pXgRHaLY9cu8+rhbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="28866151"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="28866151"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 08:47:39 -0700
X-CSE-ConnectionGUID: nAE1LzMEQoavEELNdXOghQ==
X-CSE-MsgGUID: l3l7PdjuQsC4f1Brm1kmgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="81456404"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 08:47:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 08:47:39 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 08:47:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 08:47:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yv+p8S1opKdceU5rL7zF+IJRbNm5TADQagJnguIXJ5gPHonn5d3Kr0iUVQpBibwdFMkAl6DB7wIRpdviu9Opb0iEvTxAVghdYvbod/JRjqMYqAdW3WMVBiP90+3Ci4rNNgFgMtjK2MIdozLyNJV/wOG6Nhbus6zsDUY1HXKDE1/iIoHulSMN8FzfFUG84hTqZ1h1K/C78coKuuaw6PLCoLRI+znL892hVGW01G/SL0e1Fn0Pnn87lCqikLzk7hajBxg9w05hzafp5iCChHULp2/CXfI2eUAKab90TQnmxFEcihF6qy7eN4ozzU35jenv+y2NsEpoXB4D6uIGe2oqxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCdKQu5tTbp0XA2gR4MPzjGAdH94win/CZfT9aVjFcE=;
 b=V4433dxcnUChyl1zpFtYU6oJlfMCtfn9C54KS7D0WyFgI0ch5DC3RpIC3H2qdhvMC4jjvyZjln1jgSeXlOjre/+of/9S38yZdplRLMpJzfGJrlqQvaeJasYbi1YDtNsnqFD8cNtXgn5Rog/v4et3pHJEVObomILF7l1ZQhYRFyHThWW2aerDH8si6V3EU/HB/fOewhTZerARGOcorAN+BoD7pDrDzQm8+Pv/TTZJwUHxHP1boGs9KpdgLNOf6YOrLilp0+NUx2n1UpQ3aVEQvy+2zlJlFtcnuJk2vblSml9t0LFGf7LMwais9KDJCmsL8hF+SEnaueC3UJIDXK0GqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV1PR11MB8790.namprd11.prod.outlook.com (2603:10b6:408:2b1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 15:47:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 15:47:35 +0000
Date: Thu, 24 Oct 2024 15:47:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <ltuikov89@gmail.com>
Subject: Re: [PATCH v2] drm/sched: Mark scheduler work queues with
 WQ_MEM_RECLAIM
Message-ID: <ZxpsAogpxOjU+58p@DUT025-TGLU.fm.intel.com>
References: <20241023235917.1836428-1-matthew.brost@intel.com>
 <eb625699d08db636e19c5141f681759849ff4a63.camel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb625699d08db636e19c5141f681759849ff4a63.camel@redhat.com>
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV1PR11MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bcbaa7d-a2ab-4633-db80-08dcf4432df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU1hMGl5ejlFN25iM1lKZkJENGVFOW1CSmR0U2ZvY0QvUUw4K1ZQTlBDdUR0?=
 =?utf-8?B?d0RGYjQ2LzNqREVQbnZmYUpEY2VZSkVWemtZdmlMK1M3ZDNMa0svNEp0MHRq?=
 =?utf-8?B?T2RWaVBqZ0ZqTGU4dTI3VGZ3ZjVWVTMvMW5SMkx1a0Z4NTlmelZyZ01YMHNt?=
 =?utf-8?B?blhEYnl4WjRpSjB2RXAyNmNDU2hPMFdiZ3ptRU9udi8rWFU5bEwzUVFvTUxI?=
 =?utf-8?B?dWQwM1djT3N3L090N0J1UkFxZDYzaDFRYnJLWTF5ekZGdFYybENJbGtBVDNM?=
 =?utf-8?B?dzBhcnprUnVPekp4TCs3ekl1VkNxNFdTTG5zdlowYVZ0SVJEWk5mSDg4UHoz?=
 =?utf-8?B?d2lhMm05SGdvd0xxYW4vcm5XOU9Icm02SStiMFdjRTJLY01RbVkyTEFpSHBV?=
 =?utf-8?B?dW15T3hKUG50aTlRK09NT3JpZm1PaFR5ejNIdFltSUhWdmdPSmNWdURSSVJL?=
 =?utf-8?B?b1pNajFGbVJJVjFVRFQrbWxiRlZCeFFHN2tFRlZiVlN0OUFaWWxFNjkyVW5v?=
 =?utf-8?B?VU1MOU8ydGptWVAvVFlack11bDhqSWgvMnRtVExMeW4yckxBSzljQjdlU3hF?=
 =?utf-8?B?eEJ5OHlkQnczRTNMbm5POXhoTDA2SDNWSnVFREdLMXJCU1hUNWd6R3lvaHA4?=
 =?utf-8?B?dmdnQ2lZKzF2V0h2Z3ZySFk3OUkyVVIvM0VBRXdMODg5Z295SDVBNGFhWElV?=
 =?utf-8?B?SmhxZEJqMmF4R2lmOWgyRnZZVXBZZHpaazZmR2RKVWIxZ2lxeFIvTXh6eW9X?=
 =?utf-8?B?bjVOQ05HU1dMdk9heXRtMS80RTJDZTVOYnQyUHJnSWJsSmpNOGFwcGlnVGRC?=
 =?utf-8?B?OU5Oc0d0WUduaUg4ZzF0Mk9qSWlHcHorTDQ2c0k2cTNtT1FpN0FxWlE3T2ZC?=
 =?utf-8?B?QWoxemJJOE90R2twVGtPZndVekUyem0xVkdRWjNSeGl3ZnVBaDVCZHNuVFBG?=
 =?utf-8?B?M1hHYTFaSVpZdW5Xa21qYVlhWVJmOTVZdGtMUmVrc05Da3lxTG01dzIyL0pG?=
 =?utf-8?B?OVJkaW5DWWMzeE5TYkthSUk5aDM4YnlvYUpjN0FyMXRWNWNVcDBLRjNyTEpz?=
 =?utf-8?B?N3RpSkdKYlVjbG1IRzhvbHFXRXJZaDI5ZUlta2E5VHhSamtFZVFweHFzak9s?=
 =?utf-8?B?d3NzeGZXQjZiMFQzUnoyNDcrQUdQa3ZyWEp2QjU0Y09vQWRhd1pieFVwdVVW?=
 =?utf-8?B?ekR2Q1FyaVZTQWNnQnBibnVNa2xVZnArSHNkVmF1RTF5Snh1T1NlQ1JtUmpU?=
 =?utf-8?B?VUljamgzTVhOWXBFazlMWTRybkVQWWdmbytiWEc2SEMyMGtXaWNrSHJPUkNr?=
 =?utf-8?B?UU1WaGRrRnUxSHdLTmx2VlFBclc1OC9HQzFJNUI4d1plV0cvSWl5RFJCczNI?=
 =?utf-8?B?dHB0S2V4Q01BdGdwd2Nxbk1HTXpJK3Z6ek5pQ2dPejZyODdoMzk3V21tZStT?=
 =?utf-8?B?T2pMMDVubUNMaE5UeVd4VllxOTJyRC85Ykh2OG04YzJCUkdGcUVQTml5OXph?=
 =?utf-8?B?aXBlTlJKWGNuMFpsQzhXTW45aVFBeUJpMW9vSG1veFhJUzZKRk0wZ1FHU2Fq?=
 =?utf-8?B?a2tMWTFrMW4wcnEyY2JweEk2ZnNoc1V0UDFMRk9wb1BRQ0c2ZDVDOU00ZlZE?=
 =?utf-8?B?QTcra1hEQml5cytrT2NjSXJWQUttdnRJUnJBK0x5aEVKRXQxS3BJUG1lZHJF?=
 =?utf-8?B?R1Z1RUhmSzFxUFZOamtpck9sUkxJcGtjVWkydytTTFdNajVOVGZ6Y2huT1BF?=
 =?utf-8?Q?K+7lRsfYJPwlcADfbioeMhKcLX9HPPQa9cI+N6x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjNFYi9mRFBrWnM4WGlFK2o2N1dFUU01blBQaFkxQ3Q2UGxwS3NlTmxiUGtm?=
 =?utf-8?B?NDNOUkRjOHlpVGRiRUpSam9wYzhYSEJJdnBwbEhrcXFpODVhYkdNMDVCZVdm?=
 =?utf-8?B?MHZsbEt1ZDBoUzhuVHVicGFyNDdIMk80c3RFbkg2ZDFYWXpqem05N2NYSkd5?=
 =?utf-8?B?bVB2S29Jd0h1bmdHa1Q5VThCSkJWRTlhU3l4cnZ3UEh2aXN6RDFNeWpta0Zh?=
 =?utf-8?B?MmFaMWw2UFlTd21kOWRKNXg2WnA4VXpnMmI3VkZPMUU3QUI2cjQwdWUxdTUy?=
 =?utf-8?B?aUIyZWljcFFvQ0JZMUJkZEtaQk5OdU1wQnQyUHlBSE5aWHlOYjd6SEhvdDhX?=
 =?utf-8?B?MDNWbllwRjBBUjk5Z3o4TjU4a2Jxa0YxeU1FUk4yMjBFYTUwK3BlaVN2KzF3?=
 =?utf-8?B?SDlBOEV0QmZSZXJnSHBlOXpVeHNwUm5qd1FuL1E4ck5YL1Z0QnZqT2t4WTk2?=
 =?utf-8?B?OTVkRXNKR0VUOWVFMFZZdjNRUTNIaXJ2SjVLZjBsOVBpRVNaSm5LdmlTWHQ4?=
 =?utf-8?B?S25ydHpsb2VDZUdaUXkxRlNqV2NGeWM2Vll1MW9LYk0wcXQ3bWZCdG5leFJk?=
 =?utf-8?B?M0pubjNsMk9LTy9pb3JHei9CR3V2eDhDZnp6U1RrT3VmWFBNc1RxSUhWa0FY?=
 =?utf-8?B?VlVMTHZzVDlqUEZHUGtDV21nK09KQWRyWkFzdnpJcHI2MTNmL1V5VzZ3eU8z?=
 =?utf-8?B?YllzK0QwQ3dBNVIxZGdIb3RNdU9ZTkFRcFhoUTlQeUQ0WnJWZFFMVzJoeXY5?=
 =?utf-8?B?RS95ZWNZOStIdzlmdmp4QlRYZnJmQWFaRzVUM2ZrdmVvaGQreFVpZi9ScEdr?=
 =?utf-8?B?MGxySUxqdU41NjVvNGF6d1JJN25OZ3RSZkozY0NTTlVZWE1GSDZNMElVTE9k?=
 =?utf-8?B?RHVnUE9RMVZOOWZOMVJRRjR4WWMzVUk4UG5kdFd1b2JaaEpaWmZFb2pKU21D?=
 =?utf-8?B?L053OW9FakRXd01VUFNTdnN1WVhKYkwrLzZQQ0djazRsaFpFdkZ2blI5aFZH?=
 =?utf-8?B?RDltRWsreDBET2x5WmpVY2lUUDlzTjV6dEtiRjFHWjVLZ1oyK2cyY1M1ckVv?=
 =?utf-8?B?V0lYb2I5VUVZNERaMStINkR2TXZmTE0rbFpEWjVuZEtPMmUzdndlTUpJdGp5?=
 =?utf-8?B?SUhCUFFTVWk2dWoxYjVJdlE1SkZYd0lYTS9NOVlZbVFnZDFObmo5YTFwRW5D?=
 =?utf-8?B?Qm1SQ1YzUXVsOUtEQ3FwMlNkbjF5cnNJUFFOV1BZWDNmSzZ1T0ZVMmxybnRX?=
 =?utf-8?B?RjM0UGhlVmhwVkVza3MxYzk2dkFhSzBWR1FoZzJlUGRqK0pGb3E0QzIvSk9h?=
 =?utf-8?B?Rm9PQlBxRXp1VDlaK0F3QzVEVWhnaWdPalV4bjB3b1BGVk1lWlVZbnZmUEhz?=
 =?utf-8?B?K2wwVkFkTENuazBrUWdUcUtUclB2VXREOFVrVmZBY2VZakxSL05TYVEybHR3?=
 =?utf-8?B?UFJENEJDNGVrQmprR2NQMkNkQlJhUmp3YVAvVG5wVUZQcmFvN2laTzEvVUky?=
 =?utf-8?B?WTEvblpYc1lvQmQwanRjcnQ0UlF5U0R2TmQ4eWRlMElSMnR1d2g4K3MrMGNO?=
 =?utf-8?B?U3dNdUFSbFh3SXNHZ0JuNDlncW0vTjNJUXcwNVZuTHhidnBmWDZEbjBOY2RH?=
 =?utf-8?B?bWk0WDFiT3pYNzVTNWpjRVpHRmp5RXdwRzFnbW1idnFiUkhXM096b3BvS3Zy?=
 =?utf-8?B?dU4yMW5JTFNoOEFpN0lCYWNoQjl0NTFwVjJ2V2JpZElCYzVqSzVCZ1U1cFQ0?=
 =?utf-8?B?L1RRSVhnbmcrbXZKcmdGbWlKOUpHbWJ2OUUzaFlzb0lwNDdNalAvVjFNV1ha?=
 =?utf-8?B?RFdqMG9ZL3BpeFA4bXhwTlNqWmUzelBOSmhMa1N0dk94MUxKWFFXNTNJYWxj?=
 =?utf-8?B?SVNPNzlJRGs2YVRza1IvUUhpeUU1SHdmV2U2MDJpejNQMnFaczJySjRvZVJP?=
 =?utf-8?B?WmtSemVtRWlWbTVhb3ZOZDkxcXJoUlJ5ajV3WVFpVWJzWU5McFc4OUxXdk9u?=
 =?utf-8?B?dHlFajZCTlBRcnFEelgrdGNXVnBDeVhmamJwZVdTaUVBb1hCc25nSUVySkpm?=
 =?utf-8?B?U1pPWTNVaEJyb1lUMy95ZHNMYzRVMVBpMllGSlFPM2FjaGpsWFVWZzVsNW02?=
 =?utf-8?B?ano3eXoxWXR6b0dKUndSVnd5eFJiRERDY3ljZENIYXlGb1B0WGVUNER0UnBJ?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcbaa7d-a2ab-4633-db80-08dcf4432df6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 15:47:35.2057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEDI8CWaBp6+86b6NYScoFZAjfzQVcqffPUIzouv+Oc5o92Tqz/yELYvEKtroCu/y87kg9XQ6Skt4fTgrlTd4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8790
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

On Thu, Oct 24, 2024 at 05:35:47PM +0200, Philipp Stanner wrote:
> On Wed, 2024-10-23 at 16:59 -0700, Matthew Brost wrote:
> > drm_gpu_scheduler.submit_wq is used to submit jobs, jobs are in the
> > path
> > of dma-fences, and dma-fences are in the path of reclaim. Mark
> > scheduler
> > work queue with WQ_MEM_RECLAIM to ensure forward progress during
> > reclaim; without WQ_MEM_RECLAIM, work queues cannot make forward
> > progress during reclaim.
> > 
> > v2:
> >  - Fixes tags (Philipp)
> >  - Reword commit message (Philipp)
> > 
> > Cc: Luben Tuikov <ltuikov89@gmail.com>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: Philipp Stanner <pstanner@redhat.com>
> > Cc: stable@vger.kernel.org
> > Fixes: 34f50cc6441b ("drm/sched: Use drm sched lockdep map for
> > submit_wq")
> > Fixes: a6149f039369 ("drm/sched: Convert drm scheduler to use a work
> > queue rather than kthread")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 540231e6bac6..df0a5abb1400 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1283,10 +1283,11 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched,
> >  		sched->own_submit_wq = false;
> >  	} else {
> >  #ifdef CONFIG_LOCKDEP
> > -		sched->submit_wq =
> > alloc_ordered_workqueue_lockdep_map(name, 0,
> > +		sched->submit_wq =
> > alloc_ordered_workqueue_lockdep_map(name,
> > +								    
> >    WQ_MEM_RECLAIM,
> >  								    
> >    &drm_sched_lockdep_map);
> >  #else
> > -		sched->submit_wq = alloc_ordered_workqueue(name, 0);
> > +		sched->submit_wq = alloc_ordered_workqueue(name,
> > WQ_MEM_RECLAIM);
> >  #endif
> >  		if (!sched->submit_wq)
> >  			return -ENOMEM;
> 
> 
> Cool, thx – looks good from my POV.
> 

Can I get a RB?

> Since you now sent this patch as a single one, what would be the
> preferred merge plan for this? Your XE-Series doesn't depend on this
> IIUC, so should we take this patch here separately into drm-misc-next?
> 

Merge this one to drm-misc and we will backport into drm-xe-next.

Matt

> 
> Regards,
> P.
> 
