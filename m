Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3A0CB0D95
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 19:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DF310E4E6;
	Tue,  9 Dec 2025 18:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T6axZnSO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A016310E117;
 Tue,  9 Dec 2025 18:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765305206; x=1796841206;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HJ5eH4Ef3335I+Qz6XVK8X3n6VNQEKDZl0KO9D+yZUI=;
 b=T6axZnSOeYOZZNkIfdC58CVDRpwCK+pmD7JxhoOQ564CHbRlUBTxJis/
 8BBfIv6YnpSjIZObfLcuQwRbVDXxTTIlaQn9vOMYSAqV9hBaWmSXAnqpW
 EpJYPy0CuYK8ulvqcjbnkWWyzx8ic54PbQ3YO35mAyL4+yIvnDiPD4s8j
 5d5JebhhiGwPrE8W3sBNrWrsdwIblLmnbvbjYStRSJvf5WAk5bH4zmQKh
 oms+f0Ki81ljXKfQPU137WEncMALI9sMHKjhr6rXVQWZuIIEYiDyC0t3n
 VI8/zdb0IEjt7NJIxcq670P2Dr0s5qVjEtpNmBVzK4aSGYB4BU72G/jyN g==;
X-CSE-ConnectionGUID: bbpYWbu+TSmCGISKE7tzZg==
X-CSE-MsgGUID: eJYy8ngiRGyYCn1yqDmd/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="54814192"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="54814192"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 10:33:26 -0800
X-CSE-ConnectionGUID: iLcJD7K1Tv+TgC8O1fD/zw==
X-CSE-MsgGUID: LWZDgxzNS/WZQepX/G0bBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="200470601"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 10:33:26 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 10:32:55 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 10:32:55 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 10:32:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spSi9C9hsZ3h1cBapP3yhmqrEloEDLePNYf/aAE5wckPlY3HZ3x7Dm1abT6OEJrmE/GgyKu3UyMc38KYRBcfFTS3Af/OnJ9RvFKSNrD2nIUEY3uMyWsn5GEnRJvan5Gkncm7TvruBogP0Aw849kdJON57fanGq54xs3041i5a3Yp4Vun6j9NZXbfIhavzu8teoXibk/nRUyNuZrZ786xlNc9j82nZkEIKvHVHhZNBLySmB9eAtv40qj3wzHhpbKtdIQHsUwAaVEOI/tRTgbo0Y4JVS30z8/rIFrLYeJdVNgIN6flPv64881T3fgf9BlENury7rFGCwupwHAJHsDhiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGBGYG/Cu9cN52/Ad+G5FC3gqU1iGT9iIwweBmuDcQw=;
 b=HgTYAlL2L1+z5YQDN3t+LwgEgADlgEGvweuCGi8TXvFlZDo2oGpX/mDdt4169ex+lYXfccmoO0tfaQIUAW9x+Slo9oJjrBqivq86cnTHhvjdgPMOVX9Nb1UHs2ag+8vaZ9naCcA5ji7a6Ub9b5JHV9iYvFP1/VkKdsih3w/9+1fIAW9aj5inp/MBEzXuwGMoVosOL650C1P0W4RbtSVChJzdj1g610bMXx51d65m0wk3Yht/GYYaxr6FM4cgKLdfyiSBad4xMvU3BYqhf5Uef8+p1tPUe19yjszfutN9YwkzlPpjlpDMQYl2stLulaLatGE7drQD5YZSCfkedQzQAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 18:32:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 18:32:46 +0000
Date: Tue, 9 Dec 2025 10:32:43 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <phasta@kernel.org>, <vitaly.prosyak@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, <dakr@kernel.org>, Boris Brezillon
 <boris.brezillon@collabora.com>, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
Message-ID: <aThrSyU2Puvc8JC9@lstrano-desk.jf.intel.com>
References: <aTcf4o0huubgUPIQ@lstrano-desk.jf.intel.com>
 <aTcguvAQCZ07xD/C@lstrano-desk.jf.intel.com>
 <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
 <aTdFgVM5s/H5tc4G@lstrano-desk.jf.intel.com>
 <b0781c7fd90c51394ec60faa71222fc3af06bb0c.camel@mailbox.org>
 <e99a2e97-3058-4501-ad22-457ede493a59@amd.com>
 <3e780e52dc0a7f1267e814c895e9d5e840a8c913.camel@mailbox.org>
 <d846a1dd-a705-410a-a043-ffae43bada57@amd.com>
 <fb93bfa5f32025ce187153d0eeb47c43ec8cec7b.camel@mailbox.org>
 <6c46e3b3-c324-487e-8c14-4742c323c8ff@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c46e3b3-c324-487e-8c14-4742c323c8ff@amd.com>
X-ClientProxiedBy: MW4PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:303:16d::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f753c0-c162-497b-1341-08de3751595f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVV6Q1ZqanZDYWFxblBmNE51UXZoOGFuT1J4L1RSS05qNTZWTUc4c2ZTYXVC?=
 =?utf-8?B?MVkrMzBEbEFFaUYvNDBEREVheGJsd3ZwQTZieFhrbE5ocTJ5ZCsrRndnMlBy?=
 =?utf-8?B?Z0ZsYk5jc0VDbDNtelo0d25TVC9kT0lCVjQrQ2NCcVVLeDBRaG5RdmZhc09a?=
 =?utf-8?B?VlVqWkhPSGxoTmk4SWVjV3hJdE5yaVI2ZmRuMmVEYkRyWEpSSGlESmI3K0V6?=
 =?utf-8?B?bzBIdFp5WHZ4eW0wdXdqRUxNZGhkVURzVm5MbXhJVVVSaW13WjM0VjRZdVkz?=
 =?utf-8?B?Mi9mOXFCQXViNGJwdWhUS0JjcmNSTkZMMUk5RjlFaW1keUkrUk9TcU01cklq?=
 =?utf-8?B?NFVDc09LcXZUMENlcjU2MXZBVEZGUWJrNnVndGNIRVVmRHBlUjUreEd2Lytm?=
 =?utf-8?B?UXgzQ0lwZ2t1MjZMWFdYRDNTYmdnajZFRjFzSmlVdEE3akZYRHNZdWJWRDNj?=
 =?utf-8?B?YUlhMUZMcnI3RklwZmR0TTFLczByMm5MekhTWGtUT2xFQ29PSjV3VS9IdXR1?=
 =?utf-8?B?cy9wTUEwZy9hRjNmZTl6VlVqR1ZhN3NoR1pUc1puT2JiZmQrdExSeVNSdEUv?=
 =?utf-8?B?ZXhQTmFybmNvOThsTjNmSlNrbzZzOUo5T2R5THVIaThKVysrcUZIZWZqN3Fs?=
 =?utf-8?B?YnBMUDhYSCtlYVlsdUJsWlBLRWlSUE9Wc2o3Z3F6cTZRdkdPamJVSjFYWjM4?=
 =?utf-8?B?cVpyQ3A5akhsUGtBMWpwc005eEVHd3kyMnMxN3pGZlA3UkVOMVhGOFc0Tkh6?=
 =?utf-8?B?Tk9FOGQzS1Y4VGcrR0E2Nlo2MUlpMVFUaWFCdG9zYnFqanFiTWZJeGhFSUd3?=
 =?utf-8?B?ZlRiZmx0QkY3UU4vMkhQYXdZR0MwQ0NFVXlXcHNaRTBvKzk1ZGxLd2svLzdq?=
 =?utf-8?B?WmRVTTJRUGZ0OHpQSjVDVElXYkc5QUZqWFc0d3FzeS9zQWtYVjBwZlozUUxH?=
 =?utf-8?B?a1JBTmVBQ1pSSFNudzhybHh5dm5mRDJ0YXF2MEE1czNKOUZJaDJITUNMRmJu?=
 =?utf-8?B?T295NCttcUpoS2RKMERTLzI5OGNKK2lEVGtwT29GbHJJTXhSMm1uOGovZDky?=
 =?utf-8?B?TkdGQitaVEIxZGZ5QXJpY3RwZFNpbHdrcDhJOXZFcmRhWVRXTmFWc1VJak9w?=
 =?utf-8?B?NktBQ2NadW1FbEpUZEthSlhNQzZhb3J1THlpbmdYekw5alRHWUQxSGpHaFo0?=
 =?utf-8?B?Zjc0Qll2elh0YXBYZXpUU2lsYkJDSXVKditMZmdrbjNRM3V2MWJ5M0tlQ3lG?=
 =?utf-8?B?VnBtREVMbTZOQVVuSDZrVlhXa1NYVnJCazYyd2xDYnNPbmlzM3FldnhKcFM1?=
 =?utf-8?B?ZmJ6MzE3QXdsZ1pwWjAwaGc1eTNuUm1XbzFOVzh2RkVoVGZneFBLZ041d08r?=
 =?utf-8?B?U0hibG5wZHArYTI0TWl6REEwTkFuZUViUU9aVHVmU3FWZklMVDNTMmFDUWdo?=
 =?utf-8?B?dXcrNldidlJoZkUzV2wraFdsYjRRcVVzeEE3M3NYUjlEUXNBRVY3ZUh2ZWtr?=
 =?utf-8?B?TzgzOFpqcG9kYUNIei9VZEVCMzY2b1lONUVtcG5TQXg0WUgrSGkreVUwMTBG?=
 =?utf-8?B?eFhKNzFYK1hSNnptcUNWemRtRWpUM1ptZGhiWmVjYm1mUXpZVWpKeDhOU1cw?=
 =?utf-8?B?YWFvUlE4ZUNBbnFPdytBM0xEUlNzTWYvUnJuOXA5bWsydGxjeW0vam53WXpS?=
 =?utf-8?B?UHd5QkJWQStCOGFmY3JoSzNOa2RlUml3bU1MTXJwWGhFWldtdnNQNFRLa3NR?=
 =?utf-8?B?NFIxeDh6bFR5dGlRMml3SkNkc1hGc3dSUytJUmp1WTVhME10RHhlNWpuZ1NS?=
 =?utf-8?B?SHM2RXJsbnBQSWlyREtnd2NGaThKTjVaZkdmWkllbkJjaDJ2WXphYzJKL1hL?=
 =?utf-8?B?VUk1YkxlS3BvOGpHdWdZdWZHRkVYeEpxcnhyYlZNemxPRDlHUlltWkhBcDA3?=
 =?utf-8?Q?GlCPUn0ypsIIitOH/G8si3g4N2ff4bYf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWVBdFAreXZWUE5SR0gxdG9GckQ1cUhDR29lOEFhK0k5OVFkWXRxeldCS3ZH?=
 =?utf-8?B?UCtva1FXMjY4WDlHdVQySDdCMmlqS1haamw1TURncGVLM2grUDFyRk00OGVC?=
 =?utf-8?B?VHZPeEpnSXZ5YlBIVWVMS04wcWovUG05WlNMWmZzMkY3WEdvbHBiMFMzMGl2?=
 =?utf-8?B?UWVzbXBIdW9tZWZQNSthTmp0Zi80NVZiVzFGUHBsYnEvTDZMNnF0WDZGdDFF?=
 =?utf-8?B?cXpuMVNNTlE5ZG1obWZWZDJpZGFMYjAxaXpIYmZKZzF3UnJJREF1a3JMZWx5?=
 =?utf-8?B?bjNqRFBNU2tNRGErM3IrYnZqTk85MEs1NjJ6RWxTc3pYTml3eXBZV3FIMGo5?=
 =?utf-8?B?UHNIR0o2ZGRIcGlvTDB3V3Y4QklubzVXdEFsaDJMU3dha0hBQnRUK2lwb0VS?=
 =?utf-8?B?cS9RaE1walpUK1JOYWVVQk5tODhMK3NFVWxRMXp5RmVJb0VUVzZrZXpOL3VR?=
 =?utf-8?B?bWRJRUozelpWbFZWV2tWNmlNVWFzd0d6Vi9RWUh3Q1Jubzl3WEZrelVsK3ZB?=
 =?utf-8?B?VU5UOTV2OFF4TzRBbWhremorNy9xQ0NrN1FmTytMaGFlU3A1OTFHVjNodzBI?=
 =?utf-8?B?TUdxZ1NaOW9TcVgyR3lxOEZ5dDVOZGFBdWY2Y2tDS1cvNEYvMExCdUZmZVJx?=
 =?utf-8?B?UlJaNTNWcmJYcitXeFNQc0RVUk5hWDRFOEFOOXlxN21ndkdpV3ZDeGk4MVlk?=
 =?utf-8?B?ZlRoN0ZWM0ovbVhETFllNzM5TTdza2dFcFhFak9zOU53NGhJTFJnaVNLM1N3?=
 =?utf-8?B?cW5NQXpLUWFQRVFTWmVJbHpGU2NzYmZRSy90c2xheVVIZzhoNUpaZW1jaDcz?=
 =?utf-8?B?amN6c3NaazVxNEkwS0p2TjRaNWFTZVNDSVd4UXBYK2d4WHliak9hV29ZL1RC?=
 =?utf-8?B?aHlGMXBOeUYydWdiOVFVSlpWZExtVzBuNHB3a01NRDhxTjhCZGFWcmZubVB6?=
 =?utf-8?B?ZXpJVnNEckZTVnlzSDY5UUo0d3lZSEZVcjhOQ3dkNTVib2J4Y0NRVG5VbVUw?=
 =?utf-8?B?aEI0aFhJQTdJUVFlZHVXdEhKS2tCRVJpd1o3dzZJUzU5eEtKZis4ekdoSGNL?=
 =?utf-8?B?OVgwM1B2OFJwVEJJdHJRRndncVVKdHFwV2xuVDQ5VGhveHE2NFYyZWJXU1E1?=
 =?utf-8?B?Mk44N1VVVG9jVXljekpOTDMxOVRvdExVZVd4SGxPVlNiOWk0N25sc3BmblVG?=
 =?utf-8?B?MytjMGVSaGJOd3JleU1QeVdRd3kzQ0p3RDVjV2tXT3VyZWZ2dm5OYmQzZFdS?=
 =?utf-8?B?MGpEaXhWUnJ5eXkva1RNeE1TV0ZuaHlWZis0OFBETy9OTVJNM3lsMEE0ak8r?=
 =?utf-8?B?TTlaTGpYbmVwejAyd3psRWNoZkRTOUdNQkpNd2tzcjZoQXArWUFyVVFtOC9X?=
 =?utf-8?B?OEdqbVZmNWovMkZ5TUpSc1FwNEdJaHBmNzB2ajQ2T2RxMVNIY3pNZnp6Y29L?=
 =?utf-8?B?cy9VTUlkZHhSU2Zkak9mOGhLM05FRWlvQVArN0trSTM0ZFB5RTlFVUJlMlht?=
 =?utf-8?B?b00rRnltbW9jWUFYVlh1YWtXc09RMjQxODNxTCtCT29aNWNpNGl6d0lTZ2tC?=
 =?utf-8?B?YUJwVTFJaVp4SEZ2aEJTNGxGM1pVa2hvci93aEY3cEJGbitSTlFZZjJIQ1RM?=
 =?utf-8?B?ZjhuRytBQ1BYRDVnWnJ5QVE5cVo1N1hTaExUaWFQSG9iSVhvYlJtZkdEWWk5?=
 =?utf-8?B?d2krMVIrRW8wcDcva3FNWUppTWlHdHkyR0pwb3p1Q3VabHFvVk82TzhCQ1dj?=
 =?utf-8?B?Yy8xZk0zd0Nrc2c5N3dZUXN2aEg1SFRYU0Y2NytFcDljdGxyMTB6WEg3aXZX?=
 =?utf-8?B?alhpbVNCdTBzcGZLRXpDeEwzT0dML2RJcHArNWUyVDZlRER6VkRGMHJLNzBB?=
 =?utf-8?B?REZGOVF0UGY0bWdQeFkrb0UvWkV2VmYwQ1J6aWRYUDF0TUdXUmxrQmRiQnlh?=
 =?utf-8?B?T0lIcE9oWWh2dDlTQm9EK0VYWUZmamdCajFKcWx0d1FpQndaZzRMaDhXcUhR?=
 =?utf-8?B?R0NWeWcwQ2ZWOGhMaUxQY3U4SUtjaTZqUTZIbWtmYmRGdmdUUDlPTnhwcVY0?=
 =?utf-8?B?ODhubUZ3K1Bpb3ZZM0MyQThzekxmVVJnMEhNa1MrK1htSmhobEFOdmJTWTJX?=
 =?utf-8?B?RXpJUDJpZjhkZS82Y2ZjSUJ0bDcrMUVwMU80MkoxYTVCR0VZbU1MbS9nbGwy?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f753c0-c162-497b-1341-08de3751595f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 18:32:46.5762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uxfdp/zoV3LOJ6LbrN2tI1qVFs1tIjcrBEN/7+BD0YkEm9qf7SAL69kdmBCKvXoFpcORim3ODvhmGoD3/V5rIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
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

On Tue, Dec 09, 2025 at 05:27:25PM +0100, Christian König wrote:
> On 12/9/25 15:28, Philipp Stanner wrote:
> > On Tue, 2025-12-09 at 15:19 +0100, Christian König wrote:
> >> On 12/9/25 14:51, Philipp Stanner wrote:
> >> ...
> >>>>>>>>>> How can free_job_work, through drm_sched_get_finished_job(), get and
> >>>>>>>>>> free the same job?
> >>>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> It can't.
> >>>>>>>
> >>>>>>> But exactly that happens somehow. Don't ask me how, I have no idea.
> >>>>>
> >>>>> *Philipp refuses to elaborate and asks Christian*
> >>>>>
> >>>>> How are you so sure about that's what's happening? Anyways, assuming it
> >>>>> is true:
> >>>>
> >>>> [  489.134585] ==================================================================
> >>>> [  489.141949] BUG: KASAN: slab-use-after-free in amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
> >>>> [  489.151339] Read of size 4 at addr ffff88a0d5f4214c by task kworker/u128:0/12
> >>>> [  489.158686] 
> >>>> [  489.160277] CPU: 11 UID: 0 PID: 12 Comm: kworker/u128:0 Tainted: G            E       6.16.0-1289896.3.zuul.0ec208edc00d48a9bae1719675cb777f #1 PREEMPT(voluntary) 
> >>>> [  489.160285] Tainted: [E]=UNSIGNED_MODULE
> >>>> [  489.160288] Hardware name: TYAN B8021G88V2HR-2T/S8021GM2NR-2T, BIOS V1.03.B10 04/01/2019
> >>>> [  489.160292] Workqueue: amdgpu-reset-dev drm_sched_job_timedout [gpu_sched]
> >>>> [  489.160306] Call Trace:
> >>>> [  489.160308]  <TASK>
> >>>> [  489.160311]  dump_stack_lvl+0x64/0x80
> >>>> [  489.160321]  print_report+0xce/0x630
> >>>> [  489.160328]  ? _raw_spin_lock_irqsave+0x86/0xd0
> >>>> [  489.160333]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> >>>> [  489.160337]  ? amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
> >>>> [  489.161044]  kasan_report+0xb8/0xf0
> >>>> [  489.161049]  ? amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
> >>>> [  489.161756]  amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
> >>>> [  489.162464]  ? __pfx_amdgpu_device_gpu_recover+0x10/0x10 [amdgpu]
> >>>> [  489.163170]  ? amdgpu_coredump+0x1fd/0x4c0 [amdgpu]
> >>>> [  489.163904]  amdgpu_job_timedout+0x642/0x1400 [amdgpu]
> >>>> [  489.164698]  ? __pfx__raw_spin_lock+0x10/0x10
> >>>> [  489.164703]  ? __pfx_amdgpu_job_timedout+0x10/0x10 [amdgpu]
> >>>> [  489.165496]  ? _raw_spin_lock+0x75/0xc0
> >>>> [  489.165499]  ? __pfx__raw_spin_lock+0x10/0x10
> >>>> [  489.165503]  drm_sched_job_timedout+0x1b0/0x4b0 [gpu_sched]
> >>>
> >>> That doesn't show that it's free_job() who freed the memory.
> >>
> >> [  489.405936] Freed by task 2501:
> >> [  489.409175]  kasan_save_stack+0x20/0x40
> >> [  489.413122]  kasan_save_track+0x14/0x30
> >> [  489.417064]  kasan_save_free_info+0x3b/0x60
> >> [  489.421355]  __kasan_slab_free+0x37/0x50
> >> [  489.425384]  kfree+0x1fe/0x3f0
> >> [  489.428547]  drm_sched_free_job_work+0x50e/0x930 [gpu_sched]
> >> [  489.434326]  process_one_work+0x679/0xff0
> > 
> > The time stamp shows that this free here took place after the UAF
> > occurred :D
> 
> No, that is just the way KASAN prints it.
> 
> E.g. KASAN detects that something is wrong, starts printing the current backtrace and then the backtrace of when the memory was freed.
> 
> >>  
> >>> @Vitaly: Can you reproduce the bug? If yes, adding debug prints
> >>> printing the jobs' addresses when allocated and when freed in
> >>> free_job() could be a solution.
> >>
> >> We can reproduce this pretty reliable in our CI now.
> >>
> >>> I repeat, we need more info :)
> >>>
> >>>>
> >>>>>
> >>>>>>>
> >>>>>>> My educated guess is that the job somehow ends up on the pending list again.
> >>>>>
> >>>>> then the obvious question would be: does amdgpu touch the pending_list
> >>>>> itself, or does it only ever modify it through proper scheduler APIs?
> >>>>
> >>>> My educated guess is that drm_sched_stop() inserted the job back into the pending list, but I still have no idea how it is possible that free_job is running after the scheduler is stopped.
> >>>>
> >>>
> >>> And my uneducated guess is that it's happening in amdgpu. It seems a
> >>> sched_job lives inside an amdgpu_job. Can the latter be freed at other
> >>> places than free_job()?
> >>
> >> Nope, except for error handling during creation and initialization.
> >>
> >>> timedout_job() and free_job() cannot race against each other regarding
> >>> jobs. It's locked.
> >>>
> >>> But maybe investigate Matthew's suggestion and look into the guilty
> >>> mechanism, too.
> >>
> >> That looks just like a leftover from earlier attempts to fix the same problem.
> >>
> >> I mean look at the git history of how often that problem came up...
> > 
> > If that's the case, then we don't want to yet add another solution to a
> > problem we don't fully understand and which, apparently, only occurs in
> > amdgpu today.
> > 
> > What we need is an analysis of what's happening. Only then can we
> > decide what to do.
> > 
> > Just switching the workqueues without such good justification receives
> > a NACK from me; also because of the unforseeable consequences –
> > free_job() is invoked extremely frequently, timedout_job() very rarely.
> > Drivers will not expect that their timeout_wq will be flooded with so
> > many work items. That could very certainly change behavior, cause
> > performance regressions and so on.

Not mention this will 100% explode the work item which calls run_job
under the right thread interrupt conditions that I detailed in previous
reply why free guilty doesn't is dangerous. Free job can only safely be
executed after the work work item which calls run_job exits.

Matt

> 
> Yeah, I was fearing that this could be problematic.
> 
> Regards,
> Christian.
> 
> > 
> > 
> > P.
> > 
> > 
> > 
> 
