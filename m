Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06643C1281C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 02:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A283A10E1C6;
	Tue, 28 Oct 2025 01:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WvoY0LFz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9062C10E1C4;
 Tue, 28 Oct 2025 01:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761614089; x=1793150089;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p6OXMnLsVCJK/mCKaRlomJK6tUnnDxsE4xO909BNxzw=;
 b=WvoY0LFzXQBt2SU01p0Y7eanlsiNB6o/4FhIeAZHAkOk+VhoFFpikMHs
 f/BMcDEVnKN52I7aSI12peC0VXFl75RAJTm9RajQd5838CEMRK+b7j/p8
 xgxRCSjvDOasXb0K1rV8XbeJd0d7INMgfzfGdEzA28iNtAwv1Vc525KyG
 NbDmsRAiQu9KwdUvUUXgJjrPV6kApJzFdlBJskB8szgvb//dZkUoB1mIi
 Xmep+LgBVFbx4A+LjoyxrTam1bm0B8XxTZKLkjUgRJmM7E2fMJhWBkbfX
 MayIMk/SMdiCWjw40MSFz4hencbqAyt3P33kZVQviqshUi+1BOUQDzv8Q Q==;
X-CSE-ConnectionGUID: N2DJtn8oQjG0y2q7M033KA==
X-CSE-MsgGUID: 4ITdbOlLTXuKAThSdPp40Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63594334"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="63594334"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 18:14:48 -0700
X-CSE-ConnectionGUID: qxdinH1ASJ2X5mFv4FbacQ==
X-CSE-MsgGUID: vk5u6p1PQeC79S8tVW0gNA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 18:14:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 18:14:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 18:14:47 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 18:14:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tG9p3hAXK8GfUUyqSFiXN2sCbPl2fvoWcziptJ5tY8KAJEqUrl3gY6wy9/16eFv7WACCWOi9sLGNPzrwc6xmQXcY5RzzCbe5CDIX0+Tsih+z2B1cVcXoJ6FkMvAuy+HV459sUAuhHEu5v6R/ES7ALmKdrufdt0HQJrsGi4HK7Xz+lrvuxsQvfVaBRQlujzD8z+VA3kSZt+rMEg8V5iKPvfG5P72vtWLX9v2Jr3GKl3BymV9DRnYUAmuJuPtlQ4v0/oEafcXYs0JHbskZAygpRvFO/Doc8FasYnwbgIeeFfskTziUav+EH6GxHgoLpS6AWG3u1s2oK1rLtugnX5LE3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1KtCuMHKB0f8EMZNPC4KPUElLupgpBPWXdxNWhrMqU=;
 b=a4HZq47tOcRkpYDuAwzvFVbVVO6+im+Vqi+2npwgsqgk69CJfBd/Hnr4/ewRoqD90rdyt5N4FUDkqSgmMf2/AlPpRpyvE24OJbnQ5dPH6rZy7Rb3zTFTDgSQweTvPVY7RNtSFW/HW2xkVaaAsrJXTSBOdLjFwnFkuJ/33IqGik1QhvtreIqZpt1GXjx0kjK3TGoB8tlK+sB3FccEMmVWyUfi97IOop+7j59dRw8L3/El26PjI3Lbsxx1jnY9vrBwUZ2MHdTvCEgY04PkfnHtg6koBI1bIGENwHVS7b7Enis9az8xRmg2uby6mudg2WauhDzU0wdAo9Zk91HFp4QXmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4647.namprd11.prod.outlook.com (2603:10b6:208:262::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 01:14:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 01:14:38 +0000
Date: Mon, 27 Oct 2025 18:14:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, <dakr@kernel.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH 13/15] drm/xe: Support pcie p2p dma as a fast interconnect
Message-ID: <aQAY+6HMwB+KzjvY@lstrano-desk.jf.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
 <20251025120412.12262-14-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025120412.12262-14-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW3PR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:303:2b::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4647:EE_
X-MS-Office365-Filtering-Correlation-Id: b642fbe0-da23-4200-e362-08de15bf5d3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1c5T2NQMlVnVEJ5Nk5weUJZYkhzdlpKY3orYlZkUmNSQjY4aGVGREttTE43?=
 =?utf-8?B?YmxaWFRCNmJuc0hMWGEyS1RIRFdEVC9pQkw4R1JXQXczNmRJWkRoVXU1Rjls?=
 =?utf-8?B?NWlIL2ZNMUZLTVpJNXVZekxMRGNTcnp1NGZKejRvNUhrTk1INGNWb2pJeFRQ?=
 =?utf-8?B?N201c3lBazhtOHpUanY1eU5ZUDU3dUVETE1iRC9CM0JkVDhKdmNEdSt4Rzdv?=
 =?utf-8?B?dHZXRFp6SUhYTnRyQTdZVS81ZG1GbElJWGhPaDB6RDJiZDZYU3R1R1hwR1hX?=
 =?utf-8?B?cjN4TTUrWmJVUENwT3NuUk1IVkhxa2NyYlZJdzRqZjF1TzdUY3RVVmt5NzJR?=
 =?utf-8?B?Z255YzlsR05IeWZBWVZrRVYydUFHUE1kREJCckErRXk3ZnFUS0lyeGZIbXNr?=
 =?utf-8?B?MlZOYnNlcjNVS0l6ZjFSQ1BONTlEcG5HaEtnNFJvNGFoM3U5dmoyMFYrWTky?=
 =?utf-8?B?b3YrcU5jYUlTVi9iQkY2dDRFVWtwYTRkeFB2VlZNdVpPUjlJVDFRRDdrUkQy?=
 =?utf-8?B?VTYzZDNPRHIyMWJmMmNaT05BYzBMV05QcnNudWEzWHlmT0ljaTc3T0JhRFpJ?=
 =?utf-8?B?S2YyMmRoNHh0ZDBIeS9Zd3dBZTUzR2FqME9qODdpeFZ2ZERwUUkyaUJwdCtr?=
 =?utf-8?B?ektZdXRpQ245dEdDN1VYU1RYREVQSUppeWZzYlFkczBrYzNqekZleWZTWm12?=
 =?utf-8?B?VjhNNTZOcUVHeFVUeEhna2VadWg1dmtCZUhvdWNGb29BL0FvQ3BhTVQ1cmdN?=
 =?utf-8?B?R1l3UDgrajdPb3JrVWpQRGwyUlZ0OXJUYjNhOUFBdlczMldjQXl0bmJVbm1P?=
 =?utf-8?B?RlhQUnRqZG41aXRVbkMydytIaHhQTG02Vk1hMzlWWFhCejFmYyt3UnpVVDJx?=
 =?utf-8?B?bVp0dU5IbVZvNHNrUlhIMVNkZ2UxdmlSTXJ5Nk4wb25KVktlZmVZclVhcTk3?=
 =?utf-8?B?MmhxazdsZ3ZKckw1bVhjL1Mrd1hZTDJtTVZLdzJUMEc2eDBSOG40L3dxWlk4?=
 =?utf-8?B?U1ZBNWZIaFArWUJSRE9oNDNIUFRXZ1hyNUNmdlZBTmJKNFBPQWc3K05pd011?=
 =?utf-8?B?ak9qYnFmbHFKb1E1TDFqYk9EenRKaGV1MTB3WTRvSHNaQ1hjaEdhN3A4R3JI?=
 =?utf-8?B?TVE0UVRvLzZnL1JQM29vSjhmN1hvL3AvMXlVZ281ZjRMMEV1NnpNckxDK2I0?=
 =?utf-8?B?REVPRkEydlNXQ1BEdERqcGM4Zkp1Uk9udUcwSmFyOFFJSEtuNFZDaUF3Qm1C?=
 =?utf-8?B?V2NxbnpLc0hTclBKMWlFUjBYUnUxZUxLbGNIdjJ2bnFsTkdzTnRnMlhTQzFF?=
 =?utf-8?B?VmErNEQ3ZHpRSDY4VW9yRWFKWmVXdUlMNlFpT3g5dW9VVWMyNUc5WXkzWEJi?=
 =?utf-8?B?K2c2ZjhFNlR4WmtWZGhkRytsZjJFR3JHOEVnNkloa0lFTThxamJDdWZKOTlP?=
 =?utf-8?B?VUlWLzQySTFsR1Q5eE1oYU5uSUFadEhtcTgwWnc0SXdXcGFXZ1laTWkyMEFI?=
 =?utf-8?B?Tk9mKzMzZ09zbTJnWXNsemprY0UxL0VJdnRVZ1IyS1NIZnFFeFFJa0EzNDBw?=
 =?utf-8?B?cWxJajZFU3IvN2dwYTNGM0NFZUhCZC9Tbmg1T2xqVnpJR3BXYjR5WnZwc1RJ?=
 =?utf-8?B?QWpOZUNoUWttaEZWUHVZcExUeGFGYzJYak1aU1NrQmdoMk0rNm9HOGhpZEtG?=
 =?utf-8?B?YnFRMzRaNEc3NW9ubS8rNUhudWlPYlRxekR0WHp2WDR3bHNaUS9UT1o5WWFh?=
 =?utf-8?B?RmpNUXVJdmI5RlhTZ09sZjhoYVpKMHd1YWxhaWJIRGxHYityUXI3MUozSFZj?=
 =?utf-8?B?SS92WWh4NmtKWWtDckVrVmNMK2djVDQ4Y2RTaHlkcVFXR1hwMGZyektRMDZq?=
 =?utf-8?B?Mis1aWM4UzZHQzU5alZxT2V4NjdpcTRHMTZ5STlpcS9qR3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S200aTZmMFJrNlJjZmNPdzhwbUVKdXMxV08vN1Jnd0pvNDFsNXdCaFU4amZk?=
 =?utf-8?B?VkRiSHFpOHlRNU9taGFVNnhROW90Z01BRGF0Z0VsNXdjVmlyOENCN0RlNm1k?=
 =?utf-8?B?RHlwVXdoNlBOd25wMzNQa3JCNS9YdnpnRk8wN2VpOXNRVW5paE1DVlNsaDd2?=
 =?utf-8?B?M1d4ekFoZkhBUHFqUC9PTUpjclBjL25XQllNcUUrcXNGby91U2dGVDBnc3Qw?=
 =?utf-8?B?QmNkcjg2QWVUVlBNbEp4QTBvTmdSSkY3TUtBRGI3MEpQRUt4Mnhzcm1aNEUz?=
 =?utf-8?B?OEhFZGNQZFhtbURjM3pIaXV4ZnBoOGg4bWRGNGdKTmtjWkJrWmtyUWliMnVp?=
 =?utf-8?B?WUpzRTZvTWdEcGVvejZHVHBoOXBXWWpMV3dvMGF5ZUxvSzJYVDVIWWRyVlV2?=
 =?utf-8?B?Z01mRE1ibzU3c3hZVHBiUzVyN2krb2NvMy93LzRYejFmVWt1Ni9kZUh0Y0w0?=
 =?utf-8?B?L0FOTlpKN3ZlcHZENzVJOVhLcFJibnoxTDhSVnRSajRTdXpjeHpKSnk3M0ll?=
 =?utf-8?B?dUtsWVdlQVFOOEJOd0dENk0yazd1YTJrVERYeEhxVzhlWUo0L1g0bFpFcHI4?=
 =?utf-8?B?NTFXbWlnR2k1Yk1EQ05uTzlDVnZKT3pLZkgzNWZvWVBLYnAyanpRSjlGcjZr?=
 =?utf-8?B?cFg2NE8zczc4NDFLeGdwTnNVQzhDdkdyS2t6ZDd6OGEvWDliSTV5ajdBNmEx?=
 =?utf-8?B?TVNRb1BoZmFqUzVoMjFwSHJGbVFDU3FjNUwwaloxTmNEak1rcXFjL0kyZExr?=
 =?utf-8?B?akJTdlVTandwK2hFd3NLb0lLT0lKVTVOR3JnTmVtU0x1Tk5lU0gwMHk2aFN6?=
 =?utf-8?B?b1QxUGtoV3VoYlEzcjlIMU5hdVZqbXdoQXAwOERsVm5vaS9vMGwyVThSRGpi?=
 =?utf-8?B?RXVhM0FMZVM2QlFnTXZFeGw2U2VjSWM4dzE1QjByV3lpTWVGYWp5QmJKVndU?=
 =?utf-8?B?RUUzdGhmaFp3eWFPTExWY1FqSlNyVWt0b1d6SDdtcUpLK1QzTCttakJHQ2pI?=
 =?utf-8?B?MXBubCtEWFFSdlM0VnAzYnMxU3lNVndqYmpjMUt1bTU3YVZBRjVWRzVBbnFV?=
 =?utf-8?B?NnRJS1I4M01ZRzZPQzlnVXdhT25Pc3EzcWJ1b1V0TjlnalgvVXZCZGNNc2Zw?=
 =?utf-8?B?MEhHWmtFOHl3QmplalJOUU01SnVzS1NVUUNydG5ESTJKTEdmZlYyUDNLbDRJ?=
 =?utf-8?B?SmY4MjArZ0JzOHl6c0d5blpJMEwyN2xveUt2eTU5QTkvcmFrYkNaclNBVk1G?=
 =?utf-8?B?VTZLSDFvZC8xTWsvems1dXZXNWhWZitOR0w0bEdhSUREd0pXaFgyTFdsc0Vu?=
 =?utf-8?B?R3FQcDQ3VzZKUEhvTE8yWmFmb2dhMmt4d0hhYjd2bEVOZW9nSC8xV2N1ZE42?=
 =?utf-8?B?clBkbXhUZHpJTS85dVRzK1lxbUpNZjlkSFZMSXE3SVRMR2lnQlJzRTVPZTNv?=
 =?utf-8?B?QjExcld3U28xeUhkYmNyeXBNQ3UvYmd4cnIwbFFtdjVwVnhUd0MrdUVPOWxh?=
 =?utf-8?B?Sk5mWTVyTTVLa0luT0w3STB4MHlkSHR4d2ZOSXkxZE1HRkxYb3crOUtSZ1hT?=
 =?utf-8?B?RG5tekhWVEtCcEE5cWZjSlpQcTk5ZlBEYUJ6U0l0V0FVYmoxQ2ZtMlBUd05D?=
 =?utf-8?B?Ri9TdFNmK0I0ZXBnVU90Q1dmZVBEek9NUTZidVgzWjg1Y1lVRlJhdVoxU3ZC?=
 =?utf-8?B?VXphdzIzWlJBWHpzVWgyY0NSa2xiRjBRWTFFMGc3M3pLQTRXVFhHNWZLcHR3?=
 =?utf-8?B?b2hMTjAxUEZ4RzM5VlEvVVVvYUVRNGFaWjZhcEZ0bngxZlZYVmZTK1F2a0F5?=
 =?utf-8?B?SVI2bENFSC94NkFRTFlNS0FuQlRIaXFQVjB5VWdPeUwwY2R1cG1ZdVVOaXMr?=
 =?utf-8?B?dDhuMmRDQzFPaTl6SHk2VktPZ29hbjlNT1A0WitUTkNSZkpJWDZEV1ZFNnph?=
 =?utf-8?B?VGRKSjVKQTR4emFWbTJ5UjdpR0FKekcxS012bVR3anY3cDRlQytKdmpnWldk?=
 =?utf-8?B?MittMHhrSWExWkhkWURTTTRVVldPbmlCOG9MT3hyYUZJV1YrWHpkYkV5bzhS?=
 =?utf-8?B?WjdiRFpQSE5rNy9Mb1JXcVVJQWdEUWg4RWFVcGtIa3ZOcXJoUFNqQTFoUlFC?=
 =?utf-8?B?Y3ZFK1kzVUNDZTJWcnpFOS9VaG93TTNNNjBJaFUrNjFzWUFPaWFaTjhBN0VV?=
 =?utf-8?B?QVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b642fbe0-da23-4200-e362-08de15bf5d3a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 01:14:38.2043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mnf0aMM5KoG1h1mSwk87pW484l/ApGJDbgR5LA4gYHlxuDLhV4yYA9pRahH7L2bz6OSB57AhuIr9/V4L4Xeng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4647
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

On Sat, Oct 25, 2025 at 02:04:10PM +0200, Thomas Hellström wrote:
> Mimic the dma-buf method using dma_[map|unmap]_resource to map
> for pcie-p2p dma.
> 
> There's an ongoing area of work upstream to sort out how this best
> should be done. One method proposed is to add an additional
> pci_p2p_dma_pagemap aliasing the device_private pagemap and use
> the corresponding pci_p2p_dma_pagemap page as input for
> dma_map_page(). However, that would incur double the amount of
> memory and latency to set up the drm_pagemap and given the huge
> amount of memory present on modern GPUs, that would really not work.
> Hence the simple approach used in this patch.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 44 ++++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_svm.h |  1 +
>  2 files changed, 42 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 9dd96dad2cca..9814f95cb212 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2024 Intel Corporation
>   */
>  
> +#include <linux/pci-p2pdma.h>
> +
>  #include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_pagemap.h>
> @@ -442,6 +444,24 @@ static u64 xe_page_to_dpa(struct page *page)
>  	return dpa;
>  }
>  
> +static u64 xe_page_to_pcie(struct page *page)
> +{
> +	struct xe_pagemap *xpagemap = xe_page_to_pagemap(page);
> +	struct xe_vram_region *vr = xe_pagemap_to_vr(xpagemap);
> +	u64 hpa_base = xpagemap->hpa_base;
> +	u64 ioaddr;
> +	u64 pfn = page_to_pfn(page);
> +	u64 offset;
> +
> +	xe_assert(vr->xe, is_device_private_page(page));
> +	xe_assert(vr->xe, (pfn << PAGE_SHIFT) >= hpa_base);
> +
> +	offset = (pfn << PAGE_SHIFT) - hpa_base;
> +	ioaddr = vr->io_start + offset;
> +
> +	return ioaddr;
> +}
> +
>  enum xe_svm_copy_dir {
>  	XE_SVM_COPY_TO_VRAM,
>  	XE_SVM_COPY_TO_SRAM,
> @@ -793,7 +813,10 @@ static bool xe_has_interconnect(struct drm_pagemap_peer *peer1,
>  	struct device *dev1 = xe_peer_to_dev(peer1);
>  	struct device *dev2 = xe_peer_to_dev(peer2);
>  
> -	return dev1 == dev2;
> +	if (dev1 == dev2)
> +		return true;
> +
> +	return pci_p2pdma_distance(to_pci_dev(dev1), dev2, true) >= 0;
>  }
>  
>  static DRM_PAGEMAP_OWNER_LIST_DEFINE(xe_owner_list);
> @@ -1530,13 +1553,27 @@ xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,

This relates to my comment here [1]. Perhaps this is where we should
build in the “map for atomic” logic and route it through get_pages? I
think that could work quite nicely and wouldn’t require an additional
“do these two page maps support atomics?” check.
What do you think?

Matt

[1] https://patchwork.freedesktop.org/patch/683511/?series=156525&rev=1#comment_1255409

>  		addr = xe_page_to_dpa(page);
>  		prot = XE_INTERCONNECT_VRAM;
>  	} else {
> -		addr = DMA_MAPPING_ERROR;
> -		prot = 0;
> +		addr = dma_map_resource(dev,
> +					xe_page_to_pcie(page),
> +					PAGE_SIZE << order, dir,
> +					DMA_ATTR_SKIP_CPU_SYNC);
> +		prot = XE_INTERCONNECT_P2P;
>  	}
>  
>  	return drm_pagemap_addr_encode(addr, prot, order, dir);
>  }
>  
> +static void xe_drm_pagemap_device_unmap(struct drm_pagemap *dpagemap,
> +					struct device *dev,
> +					struct drm_pagemap_addr addr)
> +{
> +	if (addr.proto != XE_INTERCONNECT_P2P)
> +		return;
> +
> +	dma_unmap_resource(dev, addr.addr, PAGE_SIZE << addr.order,
> +			   addr.dir, DMA_ATTR_SKIP_CPU_SYNC);
> +}
> +
>  static void xe_pagemap_destroy_work(struct work_struct *work)
>  {
>  	struct xe_pagemap *xpagemap = container_of(work, typeof(*xpagemap), destroy_work);
> @@ -1573,6 +1610,7 @@ static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or
>  
>  static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
>  	.device_map = xe_drm_pagemap_device_map,
> +	.device_unmap = xe_drm_pagemap_device_unmap,
>  	.populate_mm = xe_drm_pagemap_populate_mm,
>  	.destroy = xe_pagemap_destroy,
>  };
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index 7cd7932f56c8..f5ed48993b6d 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -13,6 +13,7 @@
>  #include <drm/drm_pagemap_util.h>
>  
>  #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
> +#define XE_INTERCONNECT_P2P (XE_INTERCONNECT_VRAM + 1)
>  
>  struct drm_device;
>  struct drm_file;
> -- 
> 2.51.0
> 
