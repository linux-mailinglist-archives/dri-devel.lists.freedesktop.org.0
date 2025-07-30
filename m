Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4178B1674F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 22:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A88E10E6D5;
	Wed, 30 Jul 2025 20:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZY6azXi5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DBC410E02C;
 Wed, 30 Jul 2025 20:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753905794; x=1785441794;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cV3REdm8P3PfxPV+vcedXrK0h5qHLhaejoxscxmqGnw=;
 b=ZY6azXi5Ns1iPL5VeIlbVl317svngEAx0KXwjcDKglyl8gxXYN1QdhyY
 SDCxxNYRY4t4BNDW9BAOavmTGKNO7HsHbizM1sMMT943vKuzmH0Y7EQx+
 sHPX+Ciyyt/ehEII7n/Wg6/2Tu+vYlypQHgpa8UKxVFTY1OKspnuVuc5X
 CyzU2qyYTUztAg8m+RicEkOy2I10tMDIjS5G9AhJXDKjdhwr4+EayTfO5
 lM+mbVk5dDGBqIZpn4M64HAmkIGUSbXBqulPFliy6KaNWsBaYM0KB508n
 6Sy/JSXrC3mDxHZaK233ZHNFccqKmxi0wR9E05vV0a6y97v6hPcziNJGH w==;
X-CSE-ConnectionGUID: QN98SLdCSYG4Ri//Nrqb3A==
X-CSE-MsgGUID: WJUJuuaSRceISVk9Ma7I1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="73808733"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="73808733"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:02:55 -0700
X-CSE-ConnectionGUID: gtYZgZFlQcK62okwsh5jWQ==
X-CSE-MsgGUID: KfqdBqbHS2mipaF0l1txmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162957208"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:02:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 13:02:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 13:02:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.70)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 30 Jul 2025 13:02:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbRrEr1eMBowZoArdpW58R49uqG6I+/HGl1nrS+l1/SGk6qRGeH797qNVyFdlQGmvryBmLLKqZxtdILfZcH3JPVx/yjws78DeHd8qjX5aYzAZlRbfj7GvtMwwfnWZy7hi9PhHiFcgIWpz0x+RYfYQU1I9UHnfsHDhb/t/TfVdf/cOgLOcR015WJqYKuzHf0WybkFn6M0w/CDP2YvBlsJz18rfup46dQPdQUeTu/ayuXz7CNxCNxweSDzlKdnEdn8xSZGdEwOBXA3tRQ5CLb5dmaDipYO4BtuhwRhhvupkdA8aWpoH88YOxR7PR+nGf9dkNCkE4lw7aIt8QSTyeUrMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1rkMhSwlbCAjcqHkFSTjyGMWedVumQstAH9/VFv/8E=;
 b=AoTeHlNhg1D5OuPrmoia3NDcPcuRA1GJo3mRVEdOSwr2xsgwGUbpoijLe5UMUlHxtJ1MaTDql73vw268TESwkxOxmvZL54pU9IrucIIKP9C0eVb8NWawHOCwNq+aHros2PXb1j89tawHVruz/4lV1D2QbZjELqUzHcUEGNqML7DMhh0REkUlfpdLHjJs+Ao3cgT3Ll4KHS8f+khClX+2TEZemu2qdsE5nl8GJwKNdlvG258QbvyPYGVm10e1zFBRuxov+y5l5FvT/iN19tmaisTsiXbdpRgiMPBpvvMVBoxJGyM/VHGPGTHz/BC+uxYeqHS0Ck11YLPM8QM/NkNVpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ0PR11MB4927.namprd11.prod.outlook.com (2603:10b6:a03:2d6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 20:02:37 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 20:02:37 +0000
Date: Wed, 30 Jul 2025 23:02:26 +0300
From: Imre Deak <imre.deak@intel.com>
To: Nicusor Huhulea <nicusor.huhulea@siemens.com>
CC: <stable@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <cip-dev@lists.cip-project.org>,
 <jouni.hogander@intel.com>, <neil.armstrong@linaro.org>,
 <jani.nikula@linux.intel.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
 <laurentiu.palcu@oss.nxp.com>, <cedric.hombourger@siemens.com>,
 <shrikant.bobade@siemens.com>
Subject: Re: [PATCH 0/5] drm/i915: fixes for i915 Hot Plug Detection and
 build/runtime issues
Message-ID: <aIp6UgiwtDU1Ktmp@ideak-desk>
References: <20250730161106.80725-1-nicusor.huhulea@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730161106.80725-1-nicusor.huhulea@siemens.com>
X-ClientProxiedBy: DU2PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::23) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ0PR11MB4927:EE_
X-MS-Office365-Filtering-Correlation-Id: f84032d5-7a6a-4b06-e33a-08ddcfa407f9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGd5U3ZxaE0wVzJSR1RJNm40eWh2VVQ5NmZ5RzZQSUIydVhXUkx4RDl6cWVk?=
 =?utf-8?B?ald2NmRZRHBWdzdTc3pHN0hBQWVoeExkTy94UHJ4dFM4dHVWMmVMSWtHNnl5?=
 =?utf-8?B?c2YxTmdNZEdXeFFKZHFHWm85NTdncTdsem9DbVUrU1UxK3p3c3VMTDJDOHgw?=
 =?utf-8?B?aTVHQXdJT0hkaXRNK1llc25HaUUvMVEyZnFzTlZjQU4zd3ZpSWJIRFZPSnJM?=
 =?utf-8?B?djVlV1pVY1drUWZFUjh1SytnRHV1Rmx0MGdrSVg1VHhJQ0hoWnFidDNsUWVK?=
 =?utf-8?B?NEhNczNMTXNyeDhYZnFUQk1uazhtaHVsSlh5a2czVUE1OGJKS1VjMllxL1Bq?=
 =?utf-8?B?NmJFa1E1amFXYzBoSWhFY3RyVmYzMXZSMXdTRFFOaGM0R3dyS0FPc2VQc1Vm?=
 =?utf-8?B?NWVlVStpTVlKekdhSGlOR0FoMGRTd2hrN0Jrc3NzTWp2VGI5NmloVitVenFB?=
 =?utf-8?B?Z0c4clJib0thZGQ1dGdhODdjRTlJSkp0MEtHUk1WL0VVNnZvbXdmdDJFeUJ0?=
 =?utf-8?B?Y0FEeUlGVnFwbHJYQWlNUzNZTUtyVStoRXNabFJQSlN5Znl0TFZxRm5kbjRv?=
 =?utf-8?B?a0RYNjJOR3lNcmlLS3U2L1BUdGdrRGVpM2xuL0NxTHZ0RmhoK24xNU02QnZw?=
 =?utf-8?B?SXk4bm5sM3dBVmhUSnpyOGN4YU9xckFUK3d6NTIydTlEK1c4RmVySWFBcktZ?=
 =?utf-8?B?YXFKQXFyRnJ0WkVMazN1a1dMKzhud0NGYUlZZE9OeWZxMVBES3FNN2YxdWd5?=
 =?utf-8?B?MzVXOExUdHBJazMycVkrZzZzZEtFRHNlNVc4YjRDQXZnQTJ1V1Bqa05WOHRE?=
 =?utf-8?B?dEVuczFhbXBTTVNSeEZ6QmQvbVJ3MHFGVHhZbytna1d6ZkRPMmFnOUpwRHI3?=
 =?utf-8?B?SkVIclo1MGhvQURFdHYxYk91QWpmR3ZnU0laRHlpaGI2cms4ekNVTjFRN2VK?=
 =?utf-8?B?eW13ZWIrY2NzVVU5b1ExTDdLeE9JRjJZKzQwcHd0L3gxNUdSeGVPVDlxdFl1?=
 =?utf-8?B?dzhiYkNESUdqdnorZkdXbFhWaTZkc2VZcWwwL0JwS3IybjJnR3U3VDJEbWhG?=
 =?utf-8?B?N0Nva25qYTA2dUlLQjdWaFRvYmJZd2tGR3ErdDVCUy90ZGJLdGZZdURTRkl6?=
 =?utf-8?B?TmVITTJjQkxYMEV5U0JobWFrV1d6ckFLRmVxeWZtVjBTYko1U2p5MWY2SFcr?=
 =?utf-8?B?Z1NjeG8wQWs2emF2dmxZdFRSUzJBdWJ0bTgvalRaUUpFK2YxZEJiMHlnMU15?=
 =?utf-8?B?ZHhvcmc0L3R6K1kyWkJSVmhrZGMyVnp3cUxFSzhuS28yT0xNOXFUY0p1aFNY?=
 =?utf-8?B?cUJ0amdnZ3lrY1ozLzIwR3R6dEpaYmh0WjBrTkgrdkc5WTdybmkrbWtBUWs1?=
 =?utf-8?B?WkZSNmN1ejZOenJRUjd2STdkc29pcWU2b3cvSStBM01jUy9pQlFMRlhhVVQw?=
 =?utf-8?B?STcwQzJlTnR5cjBQbXhJRkJCNFZwQ2srUDFObTU4RkFaYzVDNEdzZkJNdkc0?=
 =?utf-8?B?TzVlZm1Ic0I4NVUrUTNzYTc4UFlXZkp4ZWJVZ2NnNFE0UG9sb29idCt5bWV1?=
 =?utf-8?B?VkFvejR6R25oWlcwTWIvdXIxTURrWWVacG1xZlRCVHFtalpWcWFwZDh6YW1N?=
 =?utf-8?B?ZjBMLzNCcEMrZnJxc3JGclhPdVFPN2o2b3l2TithMDZHUHg4K00wWGVDcGJK?=
 =?utf-8?B?WkZFN0lXZ0UwWGZEc2ozVUh0NHFRK2hHUEp3MmwzMUtROVd4aVMxWGN5ajZU?=
 =?utf-8?B?YXBaMlRqeGxpMnRVZWovRFNPUGtOTWdhRWFTekZGTU1rQ2lYVUNMY0lDeWtu?=
 =?utf-8?Q?rUqAP6cBTyCT0NeUbUab4BfuekcOQ/OFARZ40=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlBxaDhsRkhFLzgrUkpaYjJFaWhDUHBuSVp0V293MG84VVcrd0ROSVFJdS9W?=
 =?utf-8?B?TU1rR0ZsUnAyMUIwSnNOMkI5andrUGF4MEpFTUpDU3lQVHR2UHM5NEVTYmxU?=
 =?utf-8?B?cmRDZjFpaERVcWNjRVpvS3Y1SGx3NDF6OXppaWxzNkIzdEdnemQ1TXBlSVA1?=
 =?utf-8?B?VjJTV2dQK05IMzBabWY3bnZBV29uWGJxNFJLeWVTNkpZTU5mOGRaM0I5eUVs?=
 =?utf-8?B?V1BwdzFDTkNEMVBVRklsWWFiQU1aNkRhMEYxTDlneVJmbXdKSys1bzE1aTkx?=
 =?utf-8?B?d1g3TmhtbUdLbHhZRlJ1M3A2S25sSzFoeWNWYzJxd2ZQN2hsUVdZVlVGQTla?=
 =?utf-8?B?UmU5YXZJVEwrSExIcEl0OTdiNFZPVnhpRldaamg3b01OS3k5clp4R3doeTgx?=
 =?utf-8?B?bHIwRUR2VFFDMGpsN0ZnVFdxdWMxVTYrMWxGMVprUUQ5R0llOGh6bUVzVlZQ?=
 =?utf-8?B?N3JDZmpteGgvZTNheXdISHhBN0o3OUVQcXF0OWVmcjRQSm95cjhrNDRrT2dw?=
 =?utf-8?B?OG0yaFJselU0SzZFRkRkaDBVK1ExL1VGZnZOQUhXTy8yQlVWVEFmd1hhL2hC?=
 =?utf-8?B?QU9rQThROU9la1BNMG94MXYrMFExbnZVZk5LNmxNUXVVd0J5dG1SaFFhR1pP?=
 =?utf-8?B?ZlRQaEY2cEdRdDlIcFdEcGI3aXFiMFY4bjhENG9YYVBkaFNPZFNFMUdNS0VN?=
 =?utf-8?B?NUZjMXhvOXFVTHBzVXRmekZiR1EzOWRhYkp6RjhGcXpqQnczTWxRY1o0KzdJ?=
 =?utf-8?B?UDBKdDc4Tk5acFl1S0FKMnc1TDNUVGZIUDBacWp4SlVqYXhaZGE3NUgwNmRx?=
 =?utf-8?B?MFdmMWs0QW5Edk1EY2NINllLNGVTeUZMWjN3UlpvdDVVUUh3VU9nU3pTc251?=
 =?utf-8?B?TlJQUnJRY2ZhUlQwWnFHY2I0eG41TnNjNG9pRC9xbmRSaVBpRmd6ZndxYUlX?=
 =?utf-8?B?Q285cDE2Q3hGaDh4b3NLT0lMMnJoZWFJUFRzK3JzYWowUW9mb3JWNFRDNmtC?=
 =?utf-8?B?LzVUS0JodDBVMndyTU1MdDB2SW1KenZyVUg1R0dNK3dqUjBkbXBNOWIzb2ti?=
 =?utf-8?B?TWhnWEV1UUhjUGJmV0VGU3hhbjMzemtMWkR0cUl2Z3lnb05FcmU3bUVOQ2lG?=
 =?utf-8?B?UEozNG9QS2h0MFBZMFpFRFJlVGRSQkpqTW44dmdOL2M4TEtNN052MGhhTTU1?=
 =?utf-8?B?UG9uUUJmQ1IrMExzaVlrTFJJRTJxUERKOStwenpxRnREa2tBZUNLRkFNRE1l?=
 =?utf-8?B?RVErNUozMncrYkJQcUYvK2FrYWpUS1dLc0lxbTl6V1kxQW96VjUwVEhlNmRP?=
 =?utf-8?B?UERXUUdPVzMrT09kNDZLT0t6ZnpLZ01QRUJFanR4d1ZSN3cranVtUWxMTEFh?=
 =?utf-8?B?RnNHcVlNYWRpOXR0OEZQTG9wTjR4ZEhpUlFIU3VtcXBrNnQ1L3FqdVJUeTRE?=
 =?utf-8?B?MzdLN0xrd0R6SXJRci9mS2Nrb1lGYWllY1NBNnlTV3RZTEdPYUhaaEtsTmxt?=
 =?utf-8?B?REx1TWN6WEwycU5WMlc1WWpXRU5jTjZuaVdTN3pCKzZNYjJhamlSWlZVaElh?=
 =?utf-8?B?akUrTjJKbDNvK2FRNjljeTlNcTVtUnhYeDMrV0Iyd0RMRzBIME1tdW9Xa2Fl?=
 =?utf-8?B?R213dUlCdy8zaWMxWFBVVnhvaUFva21PL3ZMRmlidXdQeFBzUUpjekVPVzgy?=
 =?utf-8?B?dGdOR2N5LzhhaGhSTXFDM3NaRzdjY0Y4TUJ2WUgvdUlCVUFmOE8xenhtOVRW?=
 =?utf-8?B?MkFFNTFYM1AvODFHL0VwSmpXMXl3dDIrMlZtNk55UWQ1TW01VEdQeldJekl0?=
 =?utf-8?B?TVdPSDlqc28vSDYyZlkrRjArVFUxdnIwWjA1eUwxbUlBRlMvQjd0dDY5VThY?=
 =?utf-8?B?b1crWlN3MXJpcHdDQi9qaVBoMS9tTTVqVnAyV0VVUkNDSjFwTGdlWjI3bUlj?=
 =?utf-8?B?cEduSjlFZVNqZEI1RS81Wi8ybWt4Wi8wMSthd3hjZEpXQTEzVmkzd3pWUVlr?=
 =?utf-8?B?TWlwczJPWU51WFpiOVB0K0FjdzRCdDhORTdLUVA3K0Z2T2VLZ2ZWODU5QVFQ?=
 =?utf-8?B?bW8wNEpEL3FJRFFobnF0WnVGK3RZVWJxV3IrOFFoUmhVUUY5VlN4T1ZUVWdq?=
 =?utf-8?B?bHdEb0w2VkZkd3kvcVQzcFFRa2V5TUxaWStiS0FhK2w0NzNkTDlmKzQ2a0RV?=
 =?utf-8?Q?N5p60AMvdfJMFSLmIhkOXuf2fWXra9nH6nyDLeAA95TA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f84032d5-7a6a-4b06-e33a-08ddcfa407f9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 20:02:37.4119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNVA0EEnK9Sxm6vUohktjjYpVNegxmQl9JA+RelrAH0hvglOVvHRxJU/lq91B+usTGWihb3yXqsQoL8SmwjKnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4927
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicusor,

thanks for the report and the root causing effort. The patchset itself
has a few issues:

- commit cfd48ad8c4a9 ("drm/i915: Fix HPD polling, reenabling the output
  poll work as needed") you backport fixes d33a54e3991d
  ("drm/probe_helper: sort out poll_running vs poll_enabled"), but this
  fixed commit is not part of the 6.1.y stable tree which you are
  targeting.

  Similarly commit d33a54e3991d fixes c8268795c9a9 ("drm/probe-helper:
  enable and disable HPD on connectors"), which is not part of 6.1.y
  either.

  This means the issue commit cfd48ad8c4a9 is fixing is not present in
  the 6.1.y tree, as the changes introducing that issue are not present
  in that tree either.

- The compile errors the patches in your patchset introduce would
  prevent bisection, so fixing up these compile errors only at the end
  of the patchset is not ok; the tree should compile without errors at
  each patch/commit.

Looking at v6.1.y and the patchset I suspect the actual issue is the

commit 4ad8d57d902f ("drm: Check output polling initialized before
disabling") backport in v6.1.y, which had the

-       if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll)
+       if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
+           !drm_kms_helper_poll || dev->mode_config.poll_running)

change, not part of the original

commit 5abffb66d12b ("drm: Check output polling initialized before
disabling"). i.e. the original patch didn't add the check for
dev->mode_config.poll_running. So could you try on top of v6.1.147
(w/o the changes in the patchset you posted):

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 0e5eadc6d44d..a515b78f839e 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -250,7 +250,7 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
        unsigned long delay = DRM_OUTPUT_POLL_PERIOD;

        if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
-           !drm_kms_helper_poll || dev->mode_config.poll_running)
+           !drm_kms_helper_poll)
                return;

        drm_connector_list_iter_begin(dev, &conn_iter);

If this doesn't resolve the issue, I think we need to figure out the
actual root cause, for that could you please open at a ticket at

https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/new

attaching a dmesg log booting v6.1.147 and if possible also the latest
drm-tip kernel with the drm.debug=0xe kernel parameter?

Thanks,
Imre

On Wed, Jul 30, 2025 at 07:11:01PM +0300, Nicusor Huhulea wrote:
> Hello maintainers,
> 
> This series addresses a defect observed on certain hardware platforms using Linux kernel 6.1.147 with the i915 driver. The issue concerns hot plug detection (HPD) logic,
> leading to unreliable or missed detection events on affected hardware. This is happening on some specific devices.
> 
> ### Background
> 
> Issue:
>     On Simatic IPC227E, we observed unreliable or missing hot plug detection events, while on Simatic IPC227G (otherwise similar platform), expected hot plug behavior was maintained.
> Affected kernel:
>     This patch series is intended for the Linux 6.1.y stable tree only (tested on 6.1.147)
>     Most of the tests were conducted on 6.1.147 (manual/standalone kernel build, CIP/Isar context).
> Root cause analysis:
>     I do not have access to hardware signal traces or scope data to conclusively prove the root cause at electrical level. My understanding is based on observed driver behavior and logs.
>     Therefore my assumption as to the real cause is that on IPC227G, HPD IRQ storms are apparently not occurring, so the standard HPD IRQ-based detection works as expected. On IPC227E,
>     frequent HPD interrupts trigger the i915 driver’s storm detection logic, causing it to switch to polling mode. Therefore polling does not resume correctly, leading to the hotplug
>     issue this series addresses. Device IPC227E's behavior triggers this kernel edge case, likely due to slight variations in signal integrity, electrical margins, or internal component timing.
>     Device IPC227G, functions as expected, possibly due to cleaner electrical signaling or more optimal timing characteristics, thus avoiding the triggering condition.
> Conclusion:
>     This points to a hardware-software interaction where kernel code assumes nicer signaling or margins than IPC227E is able to provide, exposing logic gaps not visible on more robust hardware.
> 
> ### Patches
> 
> Patches 1-4:
>     - Partial backports of upstream commits; only the relevant logic or fixes are applied, with other code omitted due to downstream divergence.
>     - Applied minimal merging without exhaustive backport of all intermediate upstream changes.
> Patch 5:
>     - Contains cherry-picked logic plus context/compatibility amendments as needed. Ensures that the driver builds.
>     - Together these fixes greatly improve reliability of hotplug detection on both devices, with no regression detected in our setups.
> 
> Thank you for your review,
> Nicusor Huhulea
> 
> This patch series contains the following changes:
> 
> Dmitry Baryshkov (2):
>   drm/probe_helper: extract two helper functions
>   drm/probe-helper: enable and disable HPD on connectors
> 
> Imre Deak (2):
>   drm/i915: Fix HPD polling, reenabling the output poll work as needed
>   drm: Add an HPD poll helper to reschedule the poll work
> 
> Nicusor Huhulea (1):
>   drm/i915: fixes for i915 Hot Plug Detection and build/runtime issues
> 
>  drivers/gpu/drm/drm_probe_helper.c           | 127 ++++++++++++++-----
>  drivers/gpu/drm/i915/display/intel_hotplug.c |   4 +-
>  include/drm/drm_modeset_helper_vtables.h     |  22 ++++
>  include/drm/drm_probe_helper.h               |   1 +
>  4 files changed, 122 insertions(+), 32 deletions(-)
> 
> -- 
> 2.39.2
> 
