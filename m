Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F4CBD5D27
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 21:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30AC10E4CC;
	Mon, 13 Oct 2025 19:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKZ3hnxc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7744410E4C4;
 Mon, 13 Oct 2025 19:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760382032; x=1791918032;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HWjTkCAsahwmtjXnjBcmgIitAZAX+It8WFmKUM5UHoM=;
 b=ZKZ3hnxc+Oejg4hI/zadFQJFwFZ/y/umO8V8dj6C6MM8FMDi+jz5incx
 osrKE7y71cDMBCOt8zuvJD1PYVNxjc+v1bcDfUuAT8RXGcBsOIysB5/7a
 C4+bewYPDUM+Q9ffvozCqWhpsnRnKgkFPpgR3rTMUh0YsV423eUExsbVM
 XMS74asfySLfB5RCrWkE/yR96XAGTRH9G4prWnPXQCmuXh9N+xG2qE9BN
 nmaaj0BF7umnPpMZw9PRL44ahaP0cCTgnP1VwxXse6fIVQ1WPpfRJKiCr
 zRpgeefJ+BQC60r94p5K3ueeigCyFfD+fElySD73f8+iERf9heZjInSOd Q==;
X-CSE-ConnectionGUID: o7IX32mQTAOqZdJ94BWRpA==
X-CSE-MsgGUID: P8V+S3yKQfaGJ8rWjRtkaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="72795110"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="72795110"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 12:00:32 -0700
X-CSE-ConnectionGUID: G4JCT9mxRea/vEnpISMykg==
X-CSE-MsgGUID: 3p8PTbUwSKaoes/MUE+ppg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="186080663"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 12:00:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 12:00:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 12:00:31 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 12:00:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtYO/D5gYZqsRPmSFh0UeBhA3qE9WWKxxPPrRsGYLhY/AizLagZ8EOyT+n7Gfe960AzayRNOs6E2sIO79aObXdpd1gBZw2A4z65zrZzPZUyuXDPFS90WL+mgbl7sBlgSeRyt9VyBUSOrNfkzTMYKkuAAc1Fb+Pp2Fy6VoQtMaDrURaYReVWWhoDXJhzbPOqZaKq/6wAaLPBr5L4ERd4lpRNLX5cWWdoj4snXr5HmRQmjFaUiUygtyYkfzMbqV4l7xnIdjlM4gDTjywYwy5OkM8C2KM3uahyZPcPImPQaTt1fcHDu03GMLZha/LVjUcJVRXD8PHkz/NTcIQVldvsiDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUlc9S9KrHReqj72OM5AxD7RRTDnD+W6ZDVS6dXZq8A=;
 b=GoYff2IkWPiLrkIasauIHl5dPmBQ6jEdAhsyvQVly7qGFFyK9P+Nr9vlkKvCLvU1dVJa61hIzZT+HMn80obiZbyCnnTCUJKYSRaV3mzQTy2K3FStGuJS3AaUtw60ru/nyFeB+cMstZIE5zgUDgKBr3bXOIA8E16d/xWs4vVJok7ykzG/RWE6IjTfI8hwF/6jlSg+7KjLTA/Mr08ZgSXZSSEj95uKGwSQbWGveDeqpZmby9iGIpVPEiEHXEJso/H/lNLe8RklQLeh4OO8CcpI1V2JRYc4wZvX40pZq7kR/x28JR/NhGrzfcPB2DCH+l4Vy6VUtXl3yio8uiXc5oPJ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:00:27 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 19:00:27 +0000
Date: Mon, 13 Oct 2025 15:00:21 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, "Yishai
 Hadas" <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, "Shameer
 Kolothum" <shameerali.kolothum.thodi@huawei.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH 26/26] vfio/xe: Add vendor-specific vfio_pci driver for
 Intel graphics
Message-ID: <aO1MRU5PeiU1Rpw_@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-27-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251011193847.1836454-27-michal.winiarski@intel.com>
X-ClientProxiedBy: SJ0PR03CA0342.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::17) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ2PR11MB8424:EE_
X-MS-Office365-Filtering-Correlation-Id: a10ed7d2-c7da-4939-96aa-08de0a8ac54d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDRoVW0vYUpPSFMvd1EzUWNEbm53cjUrVEorVmVtOXE0dUZYbXVjZml5UnJP?=
 =?utf-8?B?OFJmYXVpajMrOWo5Z3VXaUJlZng1aFU0cm9za3UyYkppMmJMc3RpZ0dpNHBI?=
 =?utf-8?B?UXlnWkYwZzZUVzJ0a3JsZ2ZTN0d4bnFTbkthYk8rYjV6YzJycE4vY1k1ZDhs?=
 =?utf-8?B?cFJRdG54WmZHS3p1dCtHQ1VDTzFyT0trcHp5V1N5ekRIcUFUUVdTaGpWbjlY?=
 =?utf-8?B?U3J5cU1WU2NEVkVORHNhRVRZa0k5YUR3NmZNaDltSENnTkVnLzIxQWRGY1lW?=
 =?utf-8?B?SzdDYVR0bk0zMnJJanZDSzRZQTJvMVIvd3k4Nm9XTFNzVnY4R1NXN1lDcFkz?=
 =?utf-8?B?eEIxTTV0ZEdsWFk0dnArSSs2eHFtSm1raUsvUHVKRXg1VEZrWWRncHJQdkxo?=
 =?utf-8?B?SFVnTE50YnFXMUo3TVRUbmFZdmE4cVhIOXBHVWtpU1VNcWRRYUdSMy94K28r?=
 =?utf-8?B?RTNNb0NwL3ZtaDFQYmxLb2ZKU09hRGJXaDRlZTM0SlNraXFnMHBUdWt6K3ZM?=
 =?utf-8?B?MVIxa0JZS2RKbXRIYnJTQ09PRGpnaGFnTDUrL21RRlhXekVrSzNPalFsL2px?=
 =?utf-8?B?cldwSUphaWRDa3JDWEQrR1FUODloYjRlWFBVM1NRNVpDakRJSjFTWStYMXhE?=
 =?utf-8?B?bVd1NUZweFZnSU1yMEVhUjAyNTVXcnM4dW9iRTdqRVJwZU5vcHpKMG43dlF6?=
 =?utf-8?B?QnRWWnNjWnVmaTMzSVBQL3NLTngxWFlyR0N0VGJaWnBBeEZkMUxnNWJvZlBw?=
 =?utf-8?B?TFIyanhOek85SThtQlVCa3ZRT0lZckVPNTVSb1RxbkxGUmVkUk4zYkpXR2pB?=
 =?utf-8?B?azd3MHF4QlBKck1WUlF6TUJGbEh0RG1IRUVDYlFVVHdZMnRTeUs3SUczU0dl?=
 =?utf-8?B?U1R6T2ZCZ04wb3MwekRicHYzWGh6bmM0bjRjakVnMnpRQlVmQlhpL0NOWmVG?=
 =?utf-8?B?OEpIZHJyU1BNSEdrZ0c3ZEEvbWs3ZEltUkEyUXlxcWFyUmpQTktCcURMMHdu?=
 =?utf-8?B?RVpxYVlkQ1I4clZRMkhDOUZqdEU4RnY5aVp3UGw0UXFxd3FQWWFuYnNTelZk?=
 =?utf-8?B?TUxkVGl3R2kzZ2cydWRlRG1zM01IUHdDK1d6Rk5GMVJoaGR2OGx2NisvQXVr?=
 =?utf-8?B?V05sN0VOWEhTRTBQcDlpUXZJSXJLdnNsUDVUNXk0dWVCcmVWQTZPY0JjK2Er?=
 =?utf-8?B?ckFybFN2WC9jaWowL0c0bm5aQkdUdkpJRGE2ZGNwMzIva0hUVFRmUk80Y0lP?=
 =?utf-8?B?U1JXUjFaa28xWlFvUXRLNUg2VTFaWFUwSCtMOTlJYkRqNFovTVhEZEpuWU9z?=
 =?utf-8?B?UXZKMmlWZCtaUVVkR0N1NG01d2haNEpYZWRhcEtuWE1uWDNCWEhkMHBSNTFn?=
 =?utf-8?B?R3lKVFVlbHl6dUxXUTVydEd3eG1Qc2NHeUZUWWRpamt5NUxFWjN3dEUyRjIy?=
 =?utf-8?B?NDM1bjNPY244VGdia2w3YVB0OGZPN2ZlWXZRZXVCdFVPa2VYYU1BMUsyZnpj?=
 =?utf-8?B?NVBkc0wzZUw0OHV0LzhaYjFLVkR2Y0kzNllWaTU2S2hJcWFVWlZNMVhuRHRa?=
 =?utf-8?B?VHV2cm02cDZkUnpPSjA5Zys3eFB4MWIyOHg0OXcwZVNzS3Z2M1BVWUV0TkRG?=
 =?utf-8?B?cEJ0dzZKVXQzeHJUU2hWbitkYXBHakdRaFphdGROQm95aEFoYkszNFRTSDZX?=
 =?utf-8?B?UzVsdU1PTHRQcCtNN2lXNXhpbVZweXd0a1NmRkx3SlJ2N3JoQlpUVGRFMnJD?=
 =?utf-8?B?b0hCMHZQZFY4ZGJKVmRwbGRLcVJjTHJNTVVZQzE5UTU2Sm5xbG5PR0pES21Y?=
 =?utf-8?B?UHpocXkrQUhROUdXekVJZTB3SEJMSXJlQWgvZ3g0RitYSldDK2hDemJHSnU4?=
 =?utf-8?B?OUZnZEtwYTVpMzdMYmxFUXhFazlvTit6KytjNTVFOVp1NWNBSWpVTmtHVzFZ?=
 =?utf-8?Q?8aYtNt7nPB8pGHf39crAsguN4nPPyiTW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUQzdWVqQW1oVDFFMHJGbS9CUGhheVJwTTQ1UlYrTVB1NE44VFhWS25pdnQx?=
 =?utf-8?B?cXc1NXhHMkpuWGlWcXduNWtoUmU4VFJub3RTeHdNK1haclk2WDEzY1dsK0pR?=
 =?utf-8?B?TEkwTXkrNjBYL1R3djBrd2ZDZDYvZUQ3VXVid1M5ck1qamR4bk9odHBkdUVa?=
 =?utf-8?B?c2NlTURQK0xoQUM0VVMyL2tXRjV4Q090T1ZPeEhObjhETzU3ZDUzRWVlR1l4?=
 =?utf-8?B?WkpCdmxJSHlDTVZvalNtYUNUazNUTDJiVmh3cGNMTkZ4Tmx4UTB4bWx0YW1E?=
 =?utf-8?B?T3VWYThGRUNjTGkwdy9jcFR3WnZKd3ByZEhhOXYxajNpa0I4NkNCcGUySXh5?=
 =?utf-8?B?Y2ErWm0reEFONEpGdHBXUE42eUYyRVNYdTFQa1d5aXgvS0dYQ2VTeFhLZzBl?=
 =?utf-8?B?Sloydm9aOFFURWVCeG9qbkUrZ2twTkZzNDU2M0xtQmkydUthQ1daN0UwSzEy?=
 =?utf-8?B?dTVmWmJLank3ZlFXZUIwQlFUck9UVDZ1bjJEOVVXaEpVWVJLSnk2VGJrTXdC?=
 =?utf-8?B?V1pUVkxwVldoU3lmK3pmSDJaT0FvM0FzdnU3R01xaG9lWFdSeVRCWmlEYmh2?=
 =?utf-8?B?RmQ1WmMzcU9ZcXhkL25nYzNIb3ZqRE5mTUxNSmsyYThJL1NmLzlnK2lsWnFv?=
 =?utf-8?B?WTdDTGh4ZlJjcGwvVUU1RUtwV256TlhFNWtNV1VFNDNxWHBNZjBCYmRPOUxZ?=
 =?utf-8?B?aElzcklNWUlpZVQzV0REdXJPc29CcDZlc2IyVDlYZTdDNkJwc051bDJvenVn?=
 =?utf-8?B?NUtLZWlkMFJDNjFWMkpIZ2lmQStUK25SeFBuNnRYOEZjelRyUjBPQVpDRnNQ?=
 =?utf-8?B?R2ZlbzQ0ak1DQVVhTjd0aUhBQ244YzdLZEl0YUtjOCs2aGtuUGVOcUdkOXJw?=
 =?utf-8?B?Y0YxcUEyVXJrQnFieURNVktPVU5LL2ZmODBjeXRZdjkvSmhhWFkvbWVhVUta?=
 =?utf-8?B?bHlneE1EV0duYlFnb1d3WnFUb3BnVFc2dkI0a1lEMFdXUFU4N0J6VDdhU0Na?=
 =?utf-8?B?Qi9oanBOVlZ1SXgzQ3VkR0NhOFRRSUJoZGVNdVJIV3hCT3V2RUZ1aUFaWmZx?=
 =?utf-8?B?OWY3Tmx4dGZ5dUh3djRXdUpYV2YxZi9LcVpraStjQnYwcU5ENGhlTmI1ZGo0?=
 =?utf-8?B?RURyQkJ2bWxwamh0SXplcmZ5QjE2bFZ6NlNXQ1AvSHVkeEJWVXp5L2hJcUs3?=
 =?utf-8?B?WUZCaWpVaVNjdHVJUFVPSytYL1gybTdRVWVZZUEvUkpKVUVhZlhBaFJvMjBx?=
 =?utf-8?B?MWhFUEdPVFh2dWtVcFUvZ0Zxb05BNDV3VUQrUmwvVm5DdkNBS1dNd2JHdDAx?=
 =?utf-8?B?YjRaeTE5OUx3VThNTC8vcjhqeGlLVlhmdGduenV0WGFFSXN2L1diRzQ5SU5H?=
 =?utf-8?B?V2x2SXBWM2JLd2MzM2Vsb05wT2lIWUorN2RwQ1lLdUg2N2RyQnV6N0YvQnJv?=
 =?utf-8?B?ZFI3bjVhUE9rMUZYNGFKZkNmcGNSdGRwbVFPZ1VjdEVySnFDa3F2NDFBT3Bx?=
 =?utf-8?B?bjFHTDRqblA2LzJMTldyMmc0cXdMWXpZVXpGak1MWDVpTWFWQ2JhU2ZzdVhC?=
 =?utf-8?B?MUtjUWRzeWh0NE1wdnFYTTNmYlJoZG5RTXU1eE8yRk9nQ1VEajd3OFNjbDJi?=
 =?utf-8?B?MmZlbGlmSjVwbEt3a3N1S0dlZmhYOWkrR01kelEvQ2VqOTloQ2RxZlVVU0Ri?=
 =?utf-8?B?RXY1VWcrTTBuNmg5RUgraWNnUFJadDFFOXFkWVdSZENxdGM5REtEdG5ORlVH?=
 =?utf-8?B?SGJ2MHVPOVRld2VuWTBNUkMyMC9SaCtDWHYxbUZ5RklVejV4WjN1RkR1KzlO?=
 =?utf-8?B?NzNhSnNvTGs2enhleFpFZkNBMFIxVTNPQWhtN1A1UlZWVjlwTnNuN1g2U0lR?=
 =?utf-8?B?c1pIU1Exdm16Z1U0THFTdzRLQmg4dHpBRTRuVFBxUk5EcVpSakhVWkNiTXpZ?=
 =?utf-8?B?Qzc4Q25HVUhBVHBQelcrbVo3bjI2M3ZGRHpiaUhDaGpXbWZBOG9VOUVPZHpn?=
 =?utf-8?B?Q2kxc2FSWmV5S1RqNDFvc2RsOHNKNjdqb2IxdlJjMU9hdW1xRnZ6L1ZvNjZB?=
 =?utf-8?B?aEN1N0NHTUxwUlRScWhxZ3lyNXR2eDZKK1QyUzZFbjAwTHZYZklaRXR0bnpj?=
 =?utf-8?Q?EDpK8vnAmR8YhYrsUSdo4GYkQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a10ed7d2-c7da-4939-96aa-08de0a8ac54d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:00:27.1298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Z6nMxeQe4abId0FtKOD/FMmxp98yenAZs1fR6JTRIRU7Su2lgjit7n3quI1dWy1i7+wOqy+PxjglTyNCphatw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8424
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

On Sat, Oct 11, 2025 at 09:38:47PM +0200, Michał Winiarski wrote:
> In addition to generic VFIO PCI functionality, the driver implements
> VFIO migration uAPI, allowing userspace to enable migration for Intel
> Graphics SR-IOV Virtual Functions.
> The driver binds to VF device, and uses API exposed by Xe driver bound
> to PF device to control VF device state and transfer the migration data.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  MAINTAINERS                  |   7 +
>  drivers/vfio/pci/Kconfig     |   2 +
>  drivers/vfio/pci/Makefile    |   2 +
>  drivers/vfio/pci/xe/Kconfig  |  12 +
>  drivers/vfio/pci/xe/Makefile |   3 +
>  drivers/vfio/pci/xe/main.c   | 470 +++++++++++++++++++++++++++++++++++
>  6 files changed, 496 insertions(+)
>  create mode 100644 drivers/vfio/pci/xe/Kconfig
>  create mode 100644 drivers/vfio/pci/xe/Makefile
>  create mode 100644 drivers/vfio/pci/xe/main.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d46e9f2aaf2ad..ce84b021e6679 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26567,6 +26567,13 @@ L:	virtualization@lists.linux.dev
>  S:	Maintained
>  F:	drivers/vfio/pci/virtio
>  
> +VFIO XE PCI DRIVER
> +M:	Michał Winiarski <michal.winiarski@intel.com>
> +L:	kvm@vger.kernel.org
> +L:	intel-xe@lists.freedesktop.org
> +S:	Supported
> +F:	drivers/vfio/pci/xe

Just to confirm:

The patch flow towards drm-xe-next right? or for future changes
that doesn't depend on the xe necessarily you plan to send through some
kvm tree?

Either way,

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> +
>  VGA_SWITCHEROO
>  R:	Lukas Wunner <lukas@wunner.de>
>  S:	Maintained
> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> index 2b0172f546652..c100f0ab87f2d 100644
> --- a/drivers/vfio/pci/Kconfig
> +++ b/drivers/vfio/pci/Kconfig
> @@ -67,4 +67,6 @@ source "drivers/vfio/pci/nvgrace-gpu/Kconfig"
>  
>  source "drivers/vfio/pci/qat/Kconfig"
>  
> +source "drivers/vfio/pci/xe/Kconfig"
> +
>  endmenu
> diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
> index cf00c0a7e55c8..f5d46aa9347b9 100644
> --- a/drivers/vfio/pci/Makefile
> +++ b/drivers/vfio/pci/Makefile
> @@ -19,3 +19,5 @@ obj-$(CONFIG_VIRTIO_VFIO_PCI) += virtio/
>  obj-$(CONFIG_NVGRACE_GPU_VFIO_PCI) += nvgrace-gpu/
>  
>  obj-$(CONFIG_QAT_VFIO_PCI) += qat/
> +
> +obj-$(CONFIG_XE_VFIO_PCI) += xe/
> diff --git a/drivers/vfio/pci/xe/Kconfig b/drivers/vfio/pci/xe/Kconfig
> new file mode 100644
> index 0000000000000..787be88268685
> --- /dev/null
> +++ b/drivers/vfio/pci/xe/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config XE_VFIO_PCI
> +	tristate "VFIO support for Intel Graphics"
> +	depends on DRM_XE
> +	select VFIO_PCI_CORE
> +	help
> +	  This option enables vendor-specific VFIO driver for Intel Graphics.
> +	  In addition to generic VFIO PCI functionality, it implements VFIO
> +	  migration uAPI allowing userspace to enable migration for
> +	  Intel Graphics SR-IOV Virtual Functions supported by the Xe driver.
> +
> +	  If you don't know what to do here, say N.
> diff --git a/drivers/vfio/pci/xe/Makefile b/drivers/vfio/pci/xe/Makefile
> new file mode 100644
> index 0000000000000..13aa0fd192cd4
> --- /dev/null
> +++ b/drivers/vfio/pci/xe/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_XE_VFIO_PCI) += xe-vfio-pci.o
> +xe-vfio-pci-y := main.o
> diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
> new file mode 100644
> index 0000000000000..b9109b6812eb2
> --- /dev/null
> +++ b/drivers/vfio/pci/xe/main.c
> @@ -0,0 +1,470 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <linux/anon_inodes.h>
> +#include <linux/delay.h>
> +#include <linux/file.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/sizes.h>
> +#include <linux/types.h>
> +#include <linux/vfio.h>
> +#include <linux/vfio_pci_core.h>
> +
> +#include <drm/intel/xe_sriov_vfio.h>
> +
> +/**
> + * struct xe_vfio_pci_migration_file - file used for reading / writing migration data
> + */
> +struct xe_vfio_pci_migration_file {
> +	/** @filp: pointer to underlying &struct file */
> +	struct file *filp;
> +	/** @lock: serializes accesses to migration data */
> +	struct mutex lock;
> +	/** @xe_vdev: backpointer to &struct xe_vfio_pci_core_device */
> +	struct xe_vfio_pci_core_device *xe_vdev;
> +};
> +
> +/**
> + * struct xe_vfio_pci_core_device - xe-specific vfio_pci_core_device
> + *
> + * Top level structure of xe_vfio_pci.
> + */
> +struct xe_vfio_pci_core_device {
> +	/** @core_device: vendor-agnostic VFIO device */
> +	struct vfio_pci_core_device core_device;
> +
> +	/** @mig_state: current device migration state */
> +	enum vfio_device_mig_state mig_state;
> +
> +	/** @vfid: VF number used by PF, xe uses 1-based indexing for vfid */
> +	unsigned int vfid;
> +
> +	/** @pf: pointer to driver_private of physical function */
> +	struct pci_dev *pf;
> +
> +	/** @fd: &struct xe_vfio_pci_migration_file for userspace to read/write migration data */
> +	struct xe_vfio_pci_migration_file *fd;
> +};
> +
> +#define xe_vdev_to_dev(xe_vdev) (&(xe_vdev)->core_device.pdev->dev)
> +#define xe_vdev_to_pdev(xe_vdev) ((xe_vdev)->core_device.pdev)
> +
> +static void xe_vfio_pci_disable_file(struct xe_vfio_pci_migration_file *migf)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev = migf->xe_vdev;
> +
> +	mutex_lock(&migf->lock);
> +	xe_vdev->fd = NULL;
> +	mutex_unlock(&migf->lock);
> +}
> +
> +static void xe_vfio_pci_reset(struct xe_vfio_pci_core_device *xe_vdev)
> +{
> +	if (xe_vdev->fd)
> +		xe_vfio_pci_disable_file(xe_vdev->fd);
> +
> +	xe_vdev->mig_state = VFIO_DEVICE_STATE_RUNNING;
> +}
> +
> +static void xe_vfio_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
> +	int ret;
> +
> +	ret = xe_sriov_vfio_wait_flr_done(xe_vdev->pf, xe_vdev->vfid);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to wait for FLR: %d\n", ret);
> +
> +	xe_vfio_pci_reset(xe_vdev);
> +}
> +
> +static const struct pci_error_handlers xe_vfio_pci_err_handlers = {
> +	.reset_done = xe_vfio_pci_reset_done,
> +};
> +
> +static int xe_vfio_pci_open_device(struct vfio_device *core_vdev)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev =
> +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> +	struct vfio_pci_core_device *vdev = &xe_vdev->core_device;
> +	int ret;
> +
> +	ret = vfio_pci_core_enable(vdev);
> +	if (ret)
> +		return ret;
> +
> +	vfio_pci_core_finish_enable(vdev);
> +
> +	return 0;
> +}
> +
> +static int xe_vfio_pci_release_file(struct inode *inode, struct file *filp)
> +{
> +	struct xe_vfio_pci_migration_file *migf = filp->private_data;
> +
> +	xe_vfio_pci_disable_file(migf);
> +	mutex_destroy(&migf->lock);
> +	kfree(migf);
> +
> +	return 0;
> +}
> +
> +static ssize_t xe_vfio_pci_save_read(struct file *filp, char __user *buf, size_t len, loff_t *pos)
> +{
> +	struct xe_vfio_pci_migration_file *migf = filp->private_data;
> +	ssize_t ret;
> +
> +	if (pos)
> +		return -ESPIPE;
> +
> +	mutex_lock(&migf->lock);
> +	ret = xe_sriov_vfio_data_read(migf->xe_vdev->pf, migf->xe_vdev->vfid, buf, len);
> +	mutex_unlock(&migf->lock);
> +
> +	return ret;
> +}
> +
> +static const struct file_operations xe_vfio_pci_save_fops = {
> +	.owner = THIS_MODULE,
> +	.read = xe_vfio_pci_save_read,
> +	.release = xe_vfio_pci_release_file,
> +	.llseek = noop_llseek,
> +};
> +
> +static ssize_t xe_vfio_pci_resume_write(struct file *filp, const char __user *buf,
> +					size_t len, loff_t *pos)
> +{
> +	struct xe_vfio_pci_migration_file *migf = filp->private_data;
> +	ssize_t ret;
> +
> +	if (pos)
> +		return -ESPIPE;
> +
> +	mutex_lock(&migf->lock);
> +	ret = xe_sriov_vfio_data_write(migf->xe_vdev->pf, migf->xe_vdev->vfid, buf, len);
> +	mutex_unlock(&migf->lock);
> +
> +	return ret;
> +}
> +
> +static const struct file_operations xe_vfio_pci_resume_fops = {
> +	.owner = THIS_MODULE,
> +	.write = xe_vfio_pci_resume_write,
> +	.release = xe_vfio_pci_release_file,
> +	.llseek = noop_llseek,
> +};
> +
> +static const char *vfio_dev_state_str(u32 state)
> +{
> +	switch (state) {
> +	case VFIO_DEVICE_STATE_RUNNING: return "running";
> +	case VFIO_DEVICE_STATE_RUNNING_P2P: return "running_p2p";
> +	case VFIO_DEVICE_STATE_STOP_COPY: return "stopcopy";
> +	case VFIO_DEVICE_STATE_STOP: return "stop";
> +	case VFIO_DEVICE_STATE_RESUMING: return "resuming";
> +	case VFIO_DEVICE_STATE_ERROR: return "error";
> +	default: return "";
> +	}
> +}
> +
> +enum xe_vfio_pci_file_type {
> +	XE_VFIO_FILE_SAVE = 0,
> +	XE_VFIO_FILE_RESUME,
> +};
> +
> +static struct xe_vfio_pci_migration_file *
> +xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
> +		       enum xe_vfio_pci_file_type type)
> +{
> +	struct xe_vfio_pci_migration_file *migf;
> +	const struct file_operations *fops;
> +	int flags;
> +
> +	migf = kzalloc(sizeof(*migf), GFP_KERNEL);
> +	if (!migf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	fops = type == XE_VFIO_FILE_SAVE ? &xe_vfio_pci_save_fops : &xe_vfio_pci_resume_fops;
> +	flags = type == XE_VFIO_FILE_SAVE ? O_RDONLY : O_WRONLY;
> +	migf->filp = anon_inode_getfile("xe_vfio_mig", fops, migf, flags);
> +	if (IS_ERR(migf->filp)) {
> +		kfree(migf);
> +		return ERR_CAST(migf->filp);
> +	}
> +
> +	mutex_init(&migf->lock);
> +	migf->xe_vdev = xe_vdev;
> +	xe_vdev->fd = migf;
> +
> +	stream_open(migf->filp->f_inode, migf->filp);
> +
> +	return migf;
> +}
> +
> +static struct file *
> +xe_vfio_set_state(struct xe_vfio_pci_core_device *xe_vdev, u32 new)
> +{
> +	u32 cur = xe_vdev->mig_state;
> +	int ret;
> +
> +	dev_dbg(xe_vdev_to_dev(xe_vdev),
> +		"state: %s->%s\n", vfio_dev_state_str(cur), vfio_dev_state_str(new));
> +
> +	/*
> +	 * "STOP" handling is reused for "RUNNING_P2P", as the device doesn't have the capability to
> +	 * selectively block p2p DMA transfers.
> +	 * The device is not processing new workload requests when the VF is stopped, and both
> +	 * memory and MMIO communication channels are transferred to destination (where processing
> +	 * will be resumed).
> +	 */
> +	if ((cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_STOP) ||
> +	    (cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_RUNNING_P2P)) {
> +		ret = xe_sriov_vfio_stop(xe_vdev->pf, xe_vdev->vfid);
> +		if (ret)
> +			goto err;
> +
> +		return NULL;
> +	}
> +
> +	if ((cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_STOP) ||
> +	    (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RUNNING_P2P))
> +		return NULL;
> +
> +	if ((cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RUNNING) ||
> +	    (cur == VFIO_DEVICE_STATE_RUNNING_P2P && new == VFIO_DEVICE_STATE_RUNNING)) {
> +		ret = xe_sriov_vfio_run(xe_vdev->pf, xe_vdev->vfid);
> +		if (ret)
> +			goto err;
> +
> +		return NULL;
> +	}
> +
> +	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_STOP_COPY) {
> +		struct xe_vfio_pci_migration_file *migf;
> +
> +		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_SAVE);
> +		if (IS_ERR(migf)) {
> +			ret = PTR_ERR(migf);
> +			goto err;
> +		}
> +
> +		ret = xe_sriov_vfio_stop_copy_enter(xe_vdev->pf, xe_vdev->vfid);
> +		if (ret) {
> +			fput(migf->filp);
> +			goto err;
> +		}
> +
> +		return migf->filp;
> +	}
> +
> +	if ((cur == VFIO_DEVICE_STATE_STOP_COPY && new == VFIO_DEVICE_STATE_STOP)) {
> +		if (xe_vdev->fd)
> +			xe_vfio_pci_disable_file(xe_vdev->fd);
> +
> +		xe_sriov_vfio_stop_copy_exit(xe_vdev->pf, xe_vdev->vfid);
> +
> +		return NULL;
> +	}
> +
> +	if (cur == VFIO_DEVICE_STATE_STOP && new == VFIO_DEVICE_STATE_RESUMING) {
> +		struct xe_vfio_pci_migration_file *migf;
> +
> +		migf = xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_RESUME);
> +		if (IS_ERR(migf)) {
> +			ret = PTR_ERR(migf);
> +			goto err;
> +		}
> +
> +		ret = xe_sriov_vfio_resume_enter(xe_vdev->pf, xe_vdev->vfid);
> +		if (ret) {
> +			fput(migf->filp);
> +			goto err;
> +		}
> +
> +		return migf->filp;
> +	}
> +
> +	if (cur == VFIO_DEVICE_STATE_RESUMING && new == VFIO_DEVICE_STATE_STOP) {
> +		if (xe_vdev->fd)
> +			xe_vfio_pci_disable_file(xe_vdev->fd);
> +
> +		xe_sriov_vfio_resume_exit(xe_vdev->pf, xe_vdev->vfid);
> +
> +		return NULL;
> +	}
> +
> +	if (new == VFIO_DEVICE_STATE_ERROR)
> +		xe_sriov_vfio_error(xe_vdev->pf, xe_vdev->vfid);
> +
> +	WARN(true, "Unknown state transition %d->%d", cur, new);
> +	return ERR_PTR(-EINVAL);
> +
> +err:
> +	dev_dbg(xe_vdev_to_dev(xe_vdev),
> +		"Failed to transition state: %s->%s err=%d\n",
> +		vfio_dev_state_str(cur), vfio_dev_state_str(new), ret);
> +	return ERR_PTR(ret);
> +}
> +
> +static struct file *
> +xe_vfio_pci_set_device_state(struct vfio_device *core_vdev,
> +			     enum vfio_device_mig_state new_state)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev =
> +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> +	enum vfio_device_mig_state next_state;
> +	struct file *f = NULL;
> +	int ret;
> +
> +	while (new_state != xe_vdev->mig_state) {
> +		ret = vfio_mig_get_next_state(core_vdev, xe_vdev->mig_state,
> +					      new_state, &next_state);
> +		if (ret) {
> +			f = ERR_PTR(ret);
> +			break;
> +		}
> +		f = xe_vfio_set_state(xe_vdev, next_state);
> +		if (IS_ERR(f))
> +			break;
> +
> +		xe_vdev->mig_state = next_state;
> +
> +		/* Multiple state transitions with non-NULL file in the middle */
> +		if (f && new_state != xe_vdev->mig_state) {
> +			fput(f);
> +			f = ERR_PTR(-EINVAL);
> +			break;
> +		}
> +	}
> +
> +	return f;
> +}
> +
> +static int xe_vfio_pci_get_device_state(struct vfio_device *core_vdev,
> +					enum vfio_device_mig_state *curr_state)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev =
> +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> +
> +	*curr_state = xe_vdev->mig_state;
> +
> +	return 0;
> +}
> +
> +static int xe_vfio_pci_get_data_size(struct vfio_device *vdev,
> +				     unsigned long *stop_copy_length)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev =
> +		container_of(vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> +
> +	*stop_copy_length = xe_sriov_vfio_stop_copy_size(xe_vdev->pf, xe_vdev->vfid);
> +
> +	return 0;
> +}
> +
> +static const struct vfio_migration_ops xe_vfio_pci_migration_ops = {
> +	.migration_set_state = xe_vfio_pci_set_device_state,
> +	.migration_get_state = xe_vfio_pci_get_device_state,
> +	.migration_get_data_size = xe_vfio_pci_get_data_size,
> +};
> +
> +static void xe_vfio_pci_migration_init(struct vfio_device *core_vdev)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev =
> +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> +	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
> +
> +	if (!xe_sriov_vfio_migration_supported(pdev->physfn))
> +		return;
> +
> +	/* vfid starts from 1 for xe */
> +	xe_vdev->vfid = pci_iov_vf_id(pdev) + 1;
> +	xe_vdev->pf = pdev->physfn;
> +
> +	core_vdev->migration_flags = VFIO_MIGRATION_STOP_COPY | VFIO_MIGRATION_P2P;
> +	core_vdev->mig_ops = &xe_vfio_pci_migration_ops;
> +}
> +
> +static int xe_vfio_pci_init_dev(struct vfio_device *core_vdev)
> +{
> +	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
> +
> +	if (pdev->is_virtfn && strcmp(pdev->physfn->dev.driver->name, "xe") == 0)
> +		xe_vfio_pci_migration_init(core_vdev);
> +
> +	return vfio_pci_core_init_dev(core_vdev);
> +}
> +
> +static const struct vfio_device_ops xe_vfio_pci_ops = {
> +	.name = "xe-vfio-pci",
> +	.init = xe_vfio_pci_init_dev,
> +	.release = vfio_pci_core_release_dev,
> +	.open_device = xe_vfio_pci_open_device,
> +	.close_device = vfio_pci_core_close_device,
> +	.ioctl = vfio_pci_core_ioctl,
> +	.device_feature = vfio_pci_core_ioctl_feature,
> +	.read = vfio_pci_core_read,
> +	.write = vfio_pci_core_write,
> +	.mmap = vfio_pci_core_mmap,
> +	.request = vfio_pci_core_request,
> +	.match = vfio_pci_core_match,
> +	.match_token_uuid = vfio_pci_core_match_token_uuid,
> +	.bind_iommufd = vfio_iommufd_physical_bind,
> +	.unbind_iommufd = vfio_iommufd_physical_unbind,
> +	.attach_ioas = vfio_iommufd_physical_attach_ioas,
> +	.detach_ioas = vfio_iommufd_physical_detach_ioas,
> +};
> +
> +static int xe_vfio_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev;
> +	int ret;
> +
> +	xe_vdev = vfio_alloc_device(xe_vfio_pci_core_device, core_device.vdev, &pdev->dev,
> +				    &xe_vfio_pci_ops);
> +	if (IS_ERR(xe_vdev))
> +		return PTR_ERR(xe_vdev);
> +
> +	dev_set_drvdata(&pdev->dev, &xe_vdev->core_device);
> +
> +	ret = vfio_pci_core_register_device(&xe_vdev->core_device);
> +	if (ret) {
> +		vfio_put_device(&xe_vdev->core_device.vdev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void xe_vfio_pci_remove(struct pci_dev *pdev)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev = pci_get_drvdata(pdev);
> +
> +	vfio_pci_core_unregister_device(&xe_vdev->core_device);
> +	vfio_put_device(&xe_vdev->core_device.vdev);
> +}
> +
> +static const struct pci_device_id xe_vfio_pci_table[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_ANY_ID),
> +		.class = PCI_BASE_CLASS_DISPLAY << 8, .class_mask = 0xff << 16,
> +		.override_only = PCI_ID_F_VFIO_DRIVER_OVERRIDE },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
> +
> +static struct pci_driver xe_vfio_pci_driver = {
> +	.name = "xe-vfio-pci",
> +	.id_table = xe_vfio_pci_table,
> +	.probe = xe_vfio_pci_probe,
> +	.remove = xe_vfio_pci_remove,
> +	.err_handler = &xe_vfio_pci_err_handlers,
> +	.driver_managed_dma = true,
> +};
> +module_pci_driver(xe_vfio_pci_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_DESCRIPTION("VFIO PCI driver with migration support for Intel Graphics");
> -- 
> 2.50.1
> 
