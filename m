Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DAFB326F4
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 07:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6C410E19D;
	Sat, 23 Aug 2025 05:46:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+wGiaTK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592E510E199;
 Sat, 23 Aug 2025 05:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755927993; x=1787463993;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=68eU/3o/Zz+9hn/WZAYHOBxAhnV0PwAF141AvngdY2A=;
 b=N+wGiaTKGuWsAH8dA94+NndH/bkmn9NtCWNnKRwWdaTls971bywyniIz
 ScZtVJQGSYphSGvO4K0TTplsTi/qrzjlZa6406uWxlaVtp9jZ2PEp5MzJ
 SrcccK3WV5MmkeilsVIWVle+hKVGnFsyYS4dGtcT65OhaG8KAlty9sjFC
 Ch9NVd4F8GIw/p+mj+1muq6MatLHJK/YP+3ZU9Q5+Sw97K6hb9FWjZ++O
 FBnApdRSrmLy860zpKDROU+SgC+ZTXd8XYzWEyQ+Nfqr1M+cuIDBjv29z
 1hrYhrqXsRVzw1kxbp5Sh9QbUzgJMoIlogVtoEUa8yuBc88O1qHIf1RbL Q==;
X-CSE-ConnectionGUID: UCtOkm8oQJacs9Am7UJxNw==
X-CSE-MsgGUID: pLwCWnJ5Q7uS22IfwqUGVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58325738"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58325738"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 22:46:33 -0700
X-CSE-ConnectionGUID: 5OBVWB6ATsymSpOceXcZFw==
X-CSE-MsgGUID: rt7BMQ4QQeyHv7kj2KmYdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="174176304"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 22:46:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 22:46:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 22:46:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.57)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 22:46:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3oMt9Iq8I3nufvRMDnXdQY7Od9tROOmbkhcMSX/Rcb8OnX3JCu/upIsOuE/SyB5D6gwzPPX2yyFSC/g/KpAnw89ZHIKak3W6DKV3ZK5066jK53qKv2ZGv3pikX8yjBySEkA5wpObVNAxdVjIFkIdntax/DqNovgL87Yh83ZsDXBrnUosThDytoT9NAmycUSK+Cn8jDlDwfDgnBhHj+uITZc+M23iVwcSSCrwHMvOTgnCdyg+pSPSMhlpmDz7KndFTHDu1l0gBGvZFBFzENNNrL+6ZO188v0BkVYQ7Af6f7lHsK/OUpVIUC/JJCYG8780mxyDBFep0S9Ouck2LiQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BicQIy6sNqkEEB/MrGsw128JILrzv6oAespo8u7ZDag=;
 b=BIFcss4YeQXUqDz6LYActpYqr/a6vPjDibmDz2pR0xEk3jnC/o8WiGAbe0tilshy0Lo4pT6qQqVbvFru/A43lXdP8/mQh6ALuuOQh8UlkrVYpnO+kh9mEWR5Lfuon3by1m16R6YBUINmUHqGxTya6zI8Tw4YTJ0FLmXgbM/SS8XsTI/he61f4S5Poxhbodal1FEoDnGKlv8H3N5hKCIptYOfSm86nODj/5huim9l+VgDlu2StgQC5pOR/1cxR9QAIIrNuSYTp7PqB3d3miGX2CpmHMYP89ghTCr9r956iKGvRCtMQtkOKG4Ng+PF8PMYg6XFnYL3AJyGpqb6DFK4cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA3PR11MB7414.namprd11.prod.outlook.com (2603:10b6:806:31c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Sat, 23 Aug
 2025 05:46:24 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.9052.017; Sat, 23 Aug 2025
 05:46:24 +0000
Message-ID: <3d0136ee-fa1d-40ff-8304-da4d7432b1f1@intel.com>
Date: Sat, 23 Aug 2025 11:16:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] drm: Define user readable error codes for atomic
 ioctl
To: Xaver Hugl <xaver.hugl@kde.org>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, Simona Vetter <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, <naveen1.kumar@intel.com>,
 <uma.shankar@intel.com>, <harry.wentland@amd.com>
References: <20250822-atomic-v3-0-13a0e8f2c581@intel.com>
 <20250822-atomic-v3-1-13a0e8f2c581@intel.com>
 <CAFZQkGwqgo7FavPQecKgwaZ1DcXccY9urRzcfocg+Srd4P9WPA@mail.gmail.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <CAFZQkGwqgo7FavPQecKgwaZ1DcXccY9urRzcfocg+Srd4P9WPA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0024.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::10) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SA3PR11MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a8b369-cda8-4d5c-d2e2-08dde208651e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG0rMnJsY293MmNHVjZia1pzcGluSnFQNHVLWHBQaytlblN5KzN1WkR3SGxP?=
 =?utf-8?B?cUp2K29MNDh3Qk00VVZxam9DMEJSQXhnK2RSV2hvYnlIZElNUTdpOU8yWWdy?=
 =?utf-8?B?bFNYOVJQTDhXVWhSQmpEQWJnNVlSU1lJYzlqbVBHMyt3YUxIMVZNV0NxSloy?=
 =?utf-8?B?NzFYM3A2djdsV0taTUdmK1NCZjFBVTZpQmtpSnFPbTFQdGg1OWNWell1Zjkr?=
 =?utf-8?B?QWNkWVdXaHhaV3lMczhzOE1zaHpLUDd5a01xQkFoRklvV2JpQUdXb1BiOHQv?=
 =?utf-8?B?MkFuZ2p3a1lnb05uVTlHZlRrR1YwUU9iMEFHc2R3UW0xRjFVOHM2a3BCRktR?=
 =?utf-8?B?dytWQklKVjJHS3BGdVBackZKRlRWd3hvRzBLaUNtVDZUUS9vZ3pWQzVybWc4?=
 =?utf-8?B?Yjloc3hTMXowTEFGK0ZKcVJxaENDVXJIU1dCQnNTN1NkTVJpeFdYNjIva01E?=
 =?utf-8?B?K1JjZHhNcUQ1cVI5NEwyT2EwR0c3MkJoZzBjRm10UzQ5ZG5jOTNtTzFWK0t6?=
 =?utf-8?B?UEQ4TnRCVlBRWGduaUI2S2R4SUlRWUcxQmFaSzh5Ykxua0FIaDFlY0lJZHRW?=
 =?utf-8?B?aFBSa0kySHd3WDZoZzlscW5OQWFoT0NYMmozdUR0WW5PSVNtZlZFdGVrS3U5?=
 =?utf-8?B?RmZFcU1PYUlkL0Vlc3FDb01kbnZVRWx2VkIxZzY5RkZtZ0JpSmJBais3akRw?=
 =?utf-8?B?NU1lOTdIZXdUOC9tWlQ1MGlhWDFGaGZwc3JCWWVUOWdsSDVXRVd1eXkrai9v?=
 =?utf-8?B?OURiY3lVaXBTanF6NURjWWx0eW1RaDZmdVl6ampCNmtzSnEvR0l0a1ZKemYx?=
 =?utf-8?B?YnlsYk5hNVF5aU1QZlJxVWc0UGJPbER1V3V1QVNCYlAxRmtGak1UNERFK0F4?=
 =?utf-8?B?MFlGdm53cUYyUHJYZkoraE9pdnlleGswbVhCR0FRVnZ5QkhKUnF4WjE4WFRH?=
 =?utf-8?B?U3pBTWpjZjM1d2dma2FLeTMveGxQVkhGWmZZQ0xyTXJFZkpEMmlydEtMTUJi?=
 =?utf-8?B?M1FNVGx4VzNhTExvYlM3K3pOeDQzb284eC9MN0JzaGt6Sk1FVTNHL2twcjdX?=
 =?utf-8?B?aUhYSFBDV1FuSGlsb0FUNEM0ZWtZcHhiMy9MVGV3RHI0NFBmaDJLd09kNzlE?=
 =?utf-8?B?V3RNS0lpWW5zamZSc0hELzhlNlMzM202ZjhGWks0Qzhvb2xzMzNLYzd6WmhU?=
 =?utf-8?B?T0NRQWZOODIxZ0JsVUc5RW1Lbk93NGtwV0w0SVZDZG9ETy91V3hPSkFrK3dL?=
 =?utf-8?B?WmcwQkp4ODBBczkrc01ZMDhjOTR4aHdJYU80dXJ4aHpnQnA3NjhKMHRjTmt2?=
 =?utf-8?B?cDVHTVNMbWRjOVpoQ3Q0a252Z3N2YmxtS24rK1ZrVkRFZkpySTNCU2NDczR5?=
 =?utf-8?B?Tlp1Y2MyYkkyRFR6aXUrT2RMZkJLRDRRREFhaXpqcDh5SGtJajVmN1l5K3hK?=
 =?utf-8?B?NmxQdWQ1amdiQ0t4MXRWQW5ZMDNGVVBkcVQ0bVEyRzVuTmJabGVtMnBaQUth?=
 =?utf-8?B?ZWttdzgxMFFMK2ZoT3hiNFJ4c2ZsVlFJQ293dUU3bXZwWnVLbTRyOGo5WlYr?=
 =?utf-8?B?NkFLUkhIa3BWeHJGZ1IyYnhoVGxJWFJ6dG5ka05aQkNOaGZwZlNzZC9qVUk4?=
 =?utf-8?B?MWM4UXhGaFhKMGFTVGg0cy96OVlESk9kejArT2NCbTdCSXk1U1FFckFrVFBr?=
 =?utf-8?B?T2RvSXRPQ21KeTdsQ2hoMHhtWU85WHREN2piOGpiVkRKUm9PMnQ4RkVPbWN4?=
 =?utf-8?B?KytISHJWdnhJbWQyK0lNT0hjZVJPdTduTzFSUHZjUWJNRDNxZUNNeTQxZExM?=
 =?utf-8?B?V0RPTGlUL29MbHpTdXhXNDBQNElyS3lka0IyS2RTRGgrSXB2T0ZWbURPYktz?=
 =?utf-8?B?dnlpbUt6TVFmcDZkdm9HYjJMUjU2a0w1RTIvK3VjWHUxUE56MzJUbWxQbFZn?=
 =?utf-8?Q?N1rXnpKvX34=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3gyZm5HMGdBOVF3bXcxb3kxTGVyR01nbHo4RUdzQmtFL1U0TEJlWGtWLzNK?=
 =?utf-8?B?bUVuZ0NtY1lrZUpTZS9xaXVETmtZbWVwM2lrcTRxeVhpUXkzRUFkNWtmVFBL?=
 =?utf-8?B?L2lnOU5xY0Q2V3llL0g4OXE0bzhMeVFPdXNUejF5ZUR0ZDJ0bWFjTUhSM1J5?=
 =?utf-8?B?ODRXQUE4VjNBN29DT0xYc0FsOC9KSm0raGx0S2FDM2ZFb2t1Nm9BeWpJckpC?=
 =?utf-8?B?cjc1WmxYRUh0S1hEU0hRM0xhNEM3RWtEWWdkYzJTYXNwNUhyYjN1QmdiZjhC?=
 =?utf-8?B?eDEwN1Ywd3hiMDM3T3ZHVEZMRTQ2U0lCakE1dHQ4KzRnNUFTNXFSRWNmSjB4?=
 =?utf-8?B?TEdoOWNLNmZMTGF4MEpuOWUxVDh6QS9UOWdSVkwvOEd1OE85MWh0dE5OTG5a?=
 =?utf-8?B?S0t1NkZKYWhkMEp1YSswdkR1aDRwMGdjc3Q2WGhoWm1DNU13a0FNdmt4dWVV?=
 =?utf-8?B?TzRWa01Yakh4WWMweXJPekxJWUJoRGcyYUc2My9yallwcVRRV2EwdHhNNmRK?=
 =?utf-8?B?UDR2alNXRjJBTi93ZXdqQjZDVmJkb0RqOFY4ZEtTMzFvRHpkU2k1L1B6dkU0?=
 =?utf-8?B?TDRIUVlKMHJHcVBXMWVMSXZTbTMySU1KZGUyMVJlUHNPUEQ2VnBqc0ZUVHFD?=
 =?utf-8?B?TmtrRHdCMzBUZFlRN25xSnFQeHBNcGZVSHE3emRkV0FJUm40d2pUcnNUaWVr?=
 =?utf-8?B?ZUYyQlRBTVZYWWhNZHo3S3NIaVlOdFhwbTcxYzZzR3BGTDBqOEhxdFN4SzRN?=
 =?utf-8?B?UUYrRFA4akpHK3V2REVyL2Uvak1ncWtzVkVqQ1hyS3hQSXRqdVVEWktaUFNW?=
 =?utf-8?B?cHlXais5dk05bGpmaHNwWmVjajRoSGNBeTZRRkhsRXU1VlU3NW1BV0tKdWxs?=
 =?utf-8?B?QzZKaUdmQnRlR1FrMkhmb0M4a3B6T3JRNHBxZjUyQStYQ3Izd3lpVlR2R0RX?=
 =?utf-8?B?NTByQWR1a1c5dkhueERFYmluZGpOcHhXdEhYQzQ4a1V1VVpYQ08wbHBtdnFq?=
 =?utf-8?B?cnc4dHBWQlZOU2RwMHlRNTBQdUF1bmI1VWQrQ3Fvdm80ZUFGSFlqclFmdDE4?=
 =?utf-8?B?YnRGNmhRM3FtWjFUV3Fyc3drRUpwMmltSGE1UjhLY3NKdXhWcWRZRlV4TytY?=
 =?utf-8?B?cjRzQU91ZlZ2U0JLWSswK05ZV1gyWHJ6d043WFFIbXhISmVWQjRET3JzaEZI?=
 =?utf-8?B?VExEcmFqSUM4ZXd2RzhqSHdWWFZPUjVsYUxPcFVVekIvWHc2SXR1VGg4Tjh0?=
 =?utf-8?B?cVNCOGVEa1FBQVBWV2Q3dGMrYU9RZ2JIR04zNk9xb0NkSU9aMVpyQlFyUUJk?=
 =?utf-8?B?MFYzbXFreWZqYk5uVklzNFpZNm9NSlI3bENLMVlCMTQzbnNNZmdiYXc3algw?=
 =?utf-8?B?SnRWY2RzMGttM2tpL0F3S1B6a1NEck1YRmtGTDdCdzRyRW9QTklYaFd2NFZE?=
 =?utf-8?B?dVFkbTM1REhiYmRLOVk4a1RER2VMYlBZWkJKc2hXL1dOLyttYVhrY2lZZEto?=
 =?utf-8?B?WTF1ZHFBS2FaWUVSVDdueS84MzhxdjhUemN5TklKaFpVWW0rdzRRU05QcWll?=
 =?utf-8?B?ckR2WlZvQWJVS1B5VDZMUjBNbm0vOFBCRW11b3ZCQ0s2MTlRV2FsYWNnL1NE?=
 =?utf-8?B?YUVZbXNaNlFWWUF0TTdtT3FoeGlod1N5cmJlcDh1MXBoMmVEcm5ZM0lJa0Jk?=
 =?utf-8?B?OXdOb0Z2T0kvalB2dmI4SldZSUZXc3RUWHBwSDROa2w3ZWJFSTROeC91SUox?=
 =?utf-8?B?Skphc1FESEJLWVMrMHdndW1sdFk5Y28vSkZpSTcvY1IySW9yL3ZJSk1Vd0Fx?=
 =?utf-8?B?THEyT2VtOWYxR2tFWjM1c25EN3o3RHQ1aXR3M2lteW1nMVp3OFk2RXM1Tm95?=
 =?utf-8?B?ekM4bm1YM2xONlRvNStVaHNWaFlpMWFQWVd1aGFPMWRBOFNkaENOa25TTTNz?=
 =?utf-8?B?NHZTMXlHdEdoaFdDM0IrMHJUVE5rL2dlMnhVQVJHQjh3OENFd2ZHVnU0VWxD?=
 =?utf-8?B?V1NPK2hPM0tDa3FRcG1BSzhZaFkyYzcxVVZGUXZhNGF5Mm03ZHljaE1oNkVt?=
 =?utf-8?B?YU1PQ1B6MUkvNTdwVGtlZ0tWdmd0RGRiUEl1THMyeTVjMlFoaUUxUlcwSzZ0?=
 =?utf-8?Q?4JmpYzb6zRjuVFRPdk7AZHOWI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a8b369-cda8-4d5c-d2e2-08dde208651e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2025 05:46:24.4023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hP4bgCMtRI+24c7SlwRnFB+AgRLUCk4gX39lR1zlIWsnhiF6B1HeFe8HZ/bm+voMZFfYifblgVTvl6F8xHj2EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7414
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


On 22-08-2025 21:44, Xaver Hugl wrote:
>> +#define DRM_MODE_ATOMIC_FAILURE_REASON \
>> +       FAILURE_REASON(DRM_MODE_ATOMIC_CAP_NOT_ENABLED, "DRM_ATOMIC capability not enabled") \
>> +       FAILURE_REASON(DRM_MODE_ATOMIC_INVALID_FLAG, "invalid flag") \
>> +       FAILURE_REASON(DRM_MODE_ATOMIC_PAGE_FLIP_ASYNC, "Legacy DRM_MODE_PAGE_FLIP_ASYNC not to be used in atomic ioctl") \
>> +       FAILURE_REASON(DRM_MODE_ATOMIC_FLIP_EVENT_WITH_CHECKONLY, "requesting page-flip event with TEST_ONLY") \
>> +       FAILURE_REASON(DRM_MODE_ATOMIC_CRTC_NEED_FULL_MODESET, "Need full modeset on this crtc") \
>> +       FAILURE_REASON(DRM_MODE_ATOMIC_NEED_FULL_MODESET, "Need full modeset on all the connected crtc's") \
>> +       FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_NOT_SUP_PLANE, "Async flip not supported on this plane") \
>> +       FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_MODIFIER_NOT_SUPPORTED, "Modifier not supported on this plane with async flip") \
>> +       FAILURE_REASON(DRM_MODE_ATOMIC_ASYNC_PROP_CHANGED, "No property change allowed when async flip is enabled")
> As mentioned before, some of these errors are a bit too specific. We
> don't need to have an enum value for every way the API can be used
> wrongly - CAP_NOT_ENABLED, INVALID_FLAG, PAGE_FLIP_ASYNC and
> MODIFIER_NOT_SUPPORTED should all just be one enum value for "invalid
> API usage".
> In general, there should only be enum values that the compositor
> implementation can actually use on end-user systems. For further
> information when debugging a broken compositor implementation, other
> tools can be used instead, like drm debug logging or the returned
> string.
I have considered your comment in the last series and have removed 
driver specific errors.
Anyway will have a look again on this and will get back.
>> +#define FAILURE_REASON(flag, reason) flag,
>> +typedef enum {
>> +       DRM_MODE_ATOMIC_FAILURE_REASON
>> +} drm_mode_atomic_failure_flag;
>> +#undef FAILURE_REASON
>> +
>> +#define FAILURE_REASON(flag, reason) #reason,
>> +extern const char *drm_mode_atomic_failure_string[];
>> +#undef FAILURE_REASON
> The intention for the string wasn't for the enum values to be paired
> with a description of the enum - that belongs into documentation, not
> uAPI.
>
> The idea behind it was that drivers could add driver-specific
> information in the string for compositors to log (only in commits
> where failure isn't normally expected), so we have an easier time
> debugging issues a user system experienced by looking at the
> compositor logs. Sending the enum value again in string form isn't
> useful.

We are not sending enum value in string. Its just a single place where 
we have both enum and string. Upon user adding new error codes if both 
enum and string are at a single place it would be easy for the user. 
Hence adding both in a single place using X macros.

Its not mandatory to have a string for every enum, the string can be 
left empty if not required, or later in the driver user can overwrite 
the string as well.

Thanks and Regards,
Arun R Murthy
--------------------

> - Xaver
