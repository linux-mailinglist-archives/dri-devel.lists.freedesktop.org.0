Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C1FA0B3A6
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38E510E5F9;
	Mon, 13 Jan 2025 09:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nAdOoCqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7247910E5FF;
 Mon, 13 Jan 2025 09:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736762077; x=1768298077;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gbK/cu5glTV45iLDZP7MwBsqpFz+CZrqOiGrq42c+XY=;
 b=nAdOoCqrcJ0Co1qeXJ4B1ZbEE0F+6xlUYpuqFv6b/2yMWT/VObD5gXGw
 Jq2k2prP7m8P2J+enjGzweRe3k0g/4CPWuqee5mt0wlxpTXX1YhSRxvAd
 eZo/JXAeBGLPxpVDMbEZWh2j6sYUZ9+nEZD0ELjH7V6t8mZAQKaBtAb9L
 vnuMCho7+WPlOSKzGEaAe5MbZa4tjLaPcXCTPNMXqeNzB6uOM0DFr/BS6
 9NOL7ZjTSjzq0yrhPkbZCZP8G+vWmos066QdUSlB8WLZCJ3wegY1Kkf7m
 UW14J1Ivwst83v58ua2/LCQknOH9Zk8BLvslmJLx5cqaUgu7N0k4Hx156 Q==;
X-CSE-ConnectionGUID: xBjHkE3kTcOS2ICKGNAazA==
X-CSE-MsgGUID: +DESoMXLQ7i7haT1NmJsaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="62389480"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="62389480"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 01:54:37 -0800
X-CSE-ConnectionGUID: 20cDzkstQSysFOnXYWR1zg==
X-CSE-MsgGUID: SP9PtZLTSVqaZT2zmIhYfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="104592433"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 01:54:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 01:54:36 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 01:54:36 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 01:54:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlevWDVMrBjaq6wbzbYRgdVqeGP72S+Do4A1U9zdi+0KbpzrH04zUkhCN7fIrq+zT6IJVmGHOpWST6n5ti4hDilqi7ZPzybYnEKXhOXcuDtx2NKPQ0/W4gYkXwCeI2Ml2spsXsqrYwSDoPA5i5mEaAxrjZjK3+8kIVr7KRUWG3pEKLpLGozsJI5s7lQChc0KDuFbuV5PGEZh+YvB2UM8xmG0kZNvT/c8XrcDjfTuJJt02Zr7X69ZbrtZGoP+RElBi8t/7FKODisNxh0Q2BPhslc4/Uiqt7MEvgkTueZuCgG9G+6ad292p/3Mk6gQtl7ZaUY7Ln58Om8znxPZvV8d1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdtc+JDn1gqJTMdMuDgD4Mo6MnUe1fzfajxq/7+l57U=;
 b=fGltMZXtKQRZgG9u7quJNZJ7ncIvXl8ZLpL+LaOXLfckpSC91j6jKlYlRtDkkyD3wLV/ZNsz/EYhuUkMsHGdb5MayvJB16NThxsUjA4YotdwINgjhdj42KzpV3BrONiTsu4hqtpN+vUeFSa9lvqyoMdp68/FvwpaTNW8pNgXEmfn/lV1lGbY5l8+D2/jw+we8OswTCr8ZCIH/52oWOBglQ3oebH85WcCx71Ts5v+U9PGY7/sDnSTqOzemKONZkJCls48RiWaV10in42b3EJDFEx1Un36XhcPG9yEurAXr/5FO2YJqganwKjjshiEPdodhXeNz1RpI7+haky8eh8xqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH7PR11MB7480.namprd11.prod.outlook.com (2603:10b6:510:268::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Mon, 13 Jan
 2025 09:54:34 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 09:54:34 +0000
Date: Mon, 13 Jan 2025 09:54:26 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/gt: Replace kmap with its safer kmap_local_page
 counterpart
Message-ID: <5u3wlllxlvu6hddynpsee76f6pap7mwuys5axravyr5aqf6abq@genmarmlntv3>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250110100155.506796-1-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250110100155.506796-1-andi.shyti@linux.intel.com>
X-ClientProxiedBy: DUZPR01CA0176.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::12) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH7PR11MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c64041a-84d7-4ab3-f03e-08dd33b8485a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UllXMk1zU0Q3dUlLRHAvYmVCai9FQ2tBR3NUejdaWVJuc01HR0RpQkNESXk2?=
 =?utf-8?B?RVNjaC9LSFNvdE14MU1Lb2lrUkZPYUZETWg2OVJTTytzYTE4eEZuODdDOWNw?=
 =?utf-8?B?cmp4cUxsQXlOaExGSnF4dHJoMzJRNVhKQ2dQcDZyTk9vWmxoL01nWHRRZEhP?=
 =?utf-8?B?Z2QxQ0Fpbjg1YVdBdnlyanB2OHoxTlZteHBpcks5WE5GTS96WCtoNTkxWVpm?=
 =?utf-8?B?a3I4dHRKMEg0RGd0MmdsNGtkVTZuNkt0aVhLNTV6MnFLc2kzT1lDS2FmMHBs?=
 =?utf-8?B?VklUV1NhdHBuakFaNEdvRE5LSlRJYk9lcVVUTVl5bXB4MU9jQzlXUWp3NHM3?=
 =?utf-8?B?ZDRPaXA1clBwblBGdjhtYk85a1JQdVVjWDZpSEhKM0RXSitIRlJHcnpERlI2?=
 =?utf-8?B?c3ZQSHdGRVpiWTU0UW12Q3ZXZ3RIQm9oc3VNUnhIN1dGdHlPeGFZNXAzdnNL?=
 =?utf-8?B?RTNldmMzWWlnTWlINEY4cDhqVXZLQ0JiS2lXK1ZsaFVqaUlCR2lWdzExSmpN?=
 =?utf-8?B?bVZmRVV1UnpPeXRFUmlOdFZlczM1bXRIN2YvNDBBYlJZMFJRVXRWTmJVeC9K?=
 =?utf-8?B?anh1dG1TaWNGSVJzaXJtM29JZDVMTEdDWnlldFlJYU5lRmZqZjNybjdJNzBm?=
 =?utf-8?B?QW5GVzM3ZVY2QlQxQlpUMXhzUnJzaTRCanFKemI3K21RdmgvWUdJamhlNVNh?=
 =?utf-8?B?WElEV1lOSXF6Nk82UTltd1htWUZCSllYRkFXQjZBM1VLRXp2SUc2SWxydWhP?=
 =?utf-8?B?cG9YbEVyUDVBN3lhdDFCcHFIZnBSNFZrdDRXMW94OExqUUIreHlRQXZmQlZt?=
 =?utf-8?B?M3daY0FZRGVSOWhzSW91SnBha05oNkE3MTNGSW5nVDdvZG5pcWNzbGgrVncz?=
 =?utf-8?B?U3d6TUo0b3M1aXFheG4xbWFVLzFlK25RK0V6MVFlRzZaV0kvTnlkSFRZcFJp?=
 =?utf-8?B?N0RYNEg4WUN1Q1puZGdOY1JQY1F5dW5XVlFNRWVDY1pJUklMTnBCbk85NWM0?=
 =?utf-8?B?Z3Zldk03d1VZWDJuV21LZ2s2aTJTTDN6OUNsUTNuS0ZWdVp5cnF5YmtHTFBj?=
 =?utf-8?B?eWU5RS95OU5CVGcvUnlMdmUram5DaUM1RkZDWUw4MUNFRTBrbHV0VXovSGdr?=
 =?utf-8?B?WGFqeW9HZWh0ZTNtQ202eDNUV2JTYk5oeDlrVitDa0NvT1VRcWtiU2lZY1pz?=
 =?utf-8?B?amYrSWwydUJ6TEdsbmIyWFI5SlE1VFZRSGYzeWtYWEFiNmRDZy9IRDlZeHV3?=
 =?utf-8?B?SU5UcHQyYW10SVBhcENTVXkvdUxMWWRVb245Tk5tcDZ5M3E0UzRKOVVuYUlV?=
 =?utf-8?B?VzlSMUJXZ3hnTXBGa3d6NVRDUGRSdUJoV2Z5ZDIwVTIzTlZ1ZHhzSW9IWVd2?=
 =?utf-8?B?SnJ5Y3Fub1BzekRFTjN4N2dVT3ZQdk1ZcmY4Y2dyS3g4dWxzZk9lZURscklz?=
 =?utf-8?B?RmRKN3ovcXZhMjF1VnpxcXdkZ3dOVExsaHU2M1IxQ3dXYUhRaEYvS3dLNFU1?=
 =?utf-8?B?cjEzeEcxVytMalJWTythU2VjQWpWak9SV1FYMVZEQUhhdkcyVW9iU0lPVFpL?=
 =?utf-8?B?TWhjSlhBS2U1WUVNeVFrZkU2S0RBelhmN2ZyZ2xJMHNVQUs0bTNYM1M0aHN4?=
 =?utf-8?B?blVrVUVpeExZNm03U0pIS0hLSXk0M081SnFVZUtQMVNlZFJTZmErL3NXTmh2?=
 =?utf-8?B?MXBVcG9YZHUwNHVvQ2ZHWDdOMzd4ZFo4RHJRVDUxc2JabXFVRSsrVUJnMmlU?=
 =?utf-8?B?UGxCNU85a0JJd0cxeWFXMVBhTEM4OXpkMnRCYzFsT0hOMFQxT2xVSDQvNkhW?=
 =?utf-8?B?ZDkxSm1mZVZlREVWMWQzM1pIQ096YXBIc0JtQmpVVHJzcnA3b2dEdnRyZEh0?=
 =?utf-8?Q?Wq13tt8Q421zC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmJvYzRobXo4RGhvVlFYQ01EVmFXRnM0bGFTQklpWG9YdmNyeWxtVS9nL1U1?=
 =?utf-8?B?Qm42cFcyQnBCdXVPQUpkV0dFZ0F5MmpyZjNDQi9JREwwQXg2VWtLSk8zQ1Ur?=
 =?utf-8?B?c01WdTRCcmVIcmM2dTVRelNpYXFCa3FtbUc5Wlo2UGdYVDlMVmVuclFMTnF2?=
 =?utf-8?B?V2RvQ0J4VTJ4aXFGWnE0NUl1bFIzT2xEdHBwS0dPb001WFV3czZhNHdSclVT?=
 =?utf-8?B?a2gwMEk3UjRKMXJ6Tm41MWgrbno1K1ljQ1gzdDlGSC9rY1I4K2ZkbzUwdWFB?=
 =?utf-8?B?VDhYZmZCMjhReVU4YXZobkdvMEEzZkhQdEcrMnYxRlN3NTJFUzdNc29sOXMw?=
 =?utf-8?B?Uks1UzVoN1ZxT1lrazRoZy9XeWx1QUFyRTlNNDQ1bGR5dGlyWklFQzN4NUpq?=
 =?utf-8?B?SW1hck1YQ2tFckJ5VTVoSkdkNlErU3kzTW5KemdaUENCMDVKSU9CUlZ1WWlz?=
 =?utf-8?B?ck0zVXh6czdqRUNUUkFWZ0N3dlpPMUhTbk4wM09Zd04vYjFMc1FCcEJOcXpx?=
 =?utf-8?B?eDRqQWhUV1o5WWxpTmNSZGk0ZVlORitxMUR4Qy9mNnBZcGtTS2VYK05nWTNl?=
 =?utf-8?B?N0FON3kxZVowNTFuYnpnWU04T3p3bU9WTHZUS25uSEpqaXp0ejdzTjRBMTFx?=
 =?utf-8?B?blBFUlBjbmZvUEdpbGlNc0pPK0RjVURhRWoyWE5uekxCdExFMlRqMllKZjNn?=
 =?utf-8?B?ckF6OU0yQ3Rna0FOSmlXMGNQbVJ0SzRIdUNJaXRjM01TemVYUXB4YytDS29p?=
 =?utf-8?B?MUU1R0JnbWQvZU96S0JRRTEyMkRJdW42Z3hYRFJRdmtiM1FIcS9xS3hHRW5W?=
 =?utf-8?B?QzVBYUtwWkNHdU14a2pEc3F1YlorSDAwQTFKYVpLd1hyNGtMMytwTVB3WkRO?=
 =?utf-8?B?WTJjL01yczFWKzMzdEI2R2RuV1V4RFdRbGhCa1p2TFE3KzhuTXk2enB4MmE4?=
 =?utf-8?B?TDFlZ1ljbkJJR3Y0Q2E2OUZOWlVzQ1JVRFhJS0NWQ01pSXJuMlFMWE5hbWV6?=
 =?utf-8?B?dkFGYXhWZnVmRnl3aVl3eGYvVzV5eHJ3NFYwa3VqQkxmMUorTEU3NWFGWjZo?=
 =?utf-8?B?eFRUd0RRT3NHcjVQcFlvYW9vZEgyMHNYb1JFTmNkRWZEQVFNSDV4SXVsdkk1?=
 =?utf-8?B?bDY2aXNHVVV5RDVEK0NkcDZ4RnNXbENLMkRNYk5aY01KWVZBTVU5VzJyYkp4?=
 =?utf-8?B?TzBSU25Rbk42ZTZXallBTDBTV0wzbCtrUjNyenJvWkxCVVZRRmE5dWZjbWZ0?=
 =?utf-8?B?VDVYVjBMMXBBeUVOd2JJSExYZHRSN2RwTitOZVJNYUFKNmdEQ0dxYk5UQ1dB?=
 =?utf-8?B?NE1QemtReEdHSmFkMkQvb0xwTlBPS25QV3FmUlNLOGxmY1ByWkVRVm5FMUVD?=
 =?utf-8?B?WGV4VGNObk4xNklFNmNESzVaa3pBWmtTMXF6QzNJK3pwR0RtQnNqenlmSGxX?=
 =?utf-8?B?bms0R1JPdzFQanBPVFhuZjFEbWFqaTZ4aFlYRkNLZWJocmt0Y3d0ZUNvcGlV?=
 =?utf-8?B?V2tKd004bjh1U0dWZVlBdTdQVmtKamdOejE0NkpWRnNQbGlmSlJ0K0FBVHY3?=
 =?utf-8?B?T1I5QnRzVTNRT2tZY1FyMk12Z1dIdWw3U3RxamJmSGE2dnQwaG5McW5HN1VY?=
 =?utf-8?B?dDRaamNkR1B2VTVieC9nWUpQcWtWVnpXUDBUaDJ0ZytIazdXRjlJUlVEd2pP?=
 =?utf-8?B?eVFrZkd6c1I3MzFDSTVONmVHbXNkSDZRVWg3NUpWUkVOQkxNdm45cHhac1hH?=
 =?utf-8?B?Y2J5eURlMllpd2ZXQzRwclROYURZYUJPeFNlcmY2NGtSYkVjUzRkajBWZXBB?=
 =?utf-8?B?cGRpUDVPRjIzT2FWVEp2NlVyblV5ZzJnNDRVckZycm9uelpVaWUrOTRwRG9w?=
 =?utf-8?B?M0Nsb1BTQS92VDBZZjAwSFlvSW5nR0svU2c1dkdqbld0TzZyQzZac3NkNlM5?=
 =?utf-8?B?QjYwOXZENHFmK0FnRnl5Z2pUYWR3UzlWRHQxbHdIQldtVmRNWEozdGpJVzRq?=
 =?utf-8?B?MXFJemZWeXA5Mm1qTy9PSmNnQ25Ta3BVeitsYktpNEpZZXBQZUkySkhDenVG?=
 =?utf-8?B?K2lxZXNNQXhDbmxhd0drZDdrVXNjanlQN3dLa25LWmk4M1NKVVZpY1VaNi81?=
 =?utf-8?B?d1o0dC9LNmdOMXc5MjlOZCt2T0o2aVRRaEFWbGtGNUhhQXpQcUVSSThTaDcz?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c64041a-84d7-4ab3-f03e-08dd33b8485a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 09:54:34.0213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53GP5sQgS82T4MmvjmtuuM79hSMi76Y4x19pU2rNO0JFWnKo+wU9rafpKJh9ql667vM9OqFRcgG3JYfyCEsVSX2k+EJTeEWX1XbT9SakKJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7480
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

On 2025-01-10 at 11:01:55 +0100, Andi Shyti wrote:
> kmap_local_page(), unlike kmap(), performs a contextualized
> mapping of pages. This means the pages are mapped locally to the
> thread that created them, making them invisible outside the
> thread and safer to use.
> 
> Replace kmap() and kunmap() with kmap_local_page() and
> kunmap_local() counterparts for improved safety.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/shmem_utils.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
> index bb696b29ee2c..365c4b8b04f4 100644
> --- a/drivers/gpu/drm/i915/gt/shmem_utils.c
> +++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
> @@ -108,7 +108,7 @@ static int __shmem_rw(struct file *file, loff_t off,
>  		if (IS_ERR(page))
>  			return PTR_ERR(page);
>  
> -		vaddr = kmap(page);
> +		vaddr = kmap_local_page(page);
>  		if (write) {
>  			memcpy(vaddr + offset_in_page(off), ptr, this);
>  			set_page_dirty(page);
> @@ -116,7 +116,7 @@ static int __shmem_rw(struct file *file, loff_t off,
>  			memcpy(ptr, vaddr + offset_in_page(off), this);
>  		}
>  		mark_page_accessed(page);
> -		kunmap(page);
> +		kunmap_local(vaddr);
>  		put_page(page);
>  
>  		len -= this;
> @@ -143,11 +143,11 @@ int shmem_read_to_iosys_map(struct file *file, loff_t off,
>  		if (IS_ERR(page))
>  			return PTR_ERR(page);
>  
> -		vaddr = kmap(page);
> +		vaddr = kmap_local_page(page);
>  		iosys_map_memcpy_to(map, map_off, vaddr + offset_in_page(off),
>  				    this);
>  		mark_page_accessed(page);
> -		kunmap(page);
> +		kunmap_local(vaddr);
>  		put_page(page);
>  
>  		len -= this;
> -- 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Krzysztof
> 
