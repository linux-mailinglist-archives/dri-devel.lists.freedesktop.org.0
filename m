Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA12CB8B4C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 12:25:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB83C10E342;
	Fri, 12 Dec 2025 11:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGy2k9rK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AFC10E342;
 Fri, 12 Dec 2025 11:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765538716; x=1797074716;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C5HB/E9IYs1kRASeZ5/iO45oZmxcU0xKiNpSvjs/uno=;
 b=aGy2k9rKrDTNggaFJwM120Qpp5BQ0oYAZjnZey5OVGNPryM10ohe13SD
 vs1psWp/0YQUGZEM6WZi7uevCk3CT+NkSX5KanEKSlIJYYaimpr7dKt+5
 fbBxAAPhSO8Q6ibNhUXKUAZaqMOgd7iljDJfULpAn0Gb+UlR3IAnfCnfK
 EjuRDTb51xKjU+mY3w7Vekx8s3fcc2lcA5CpZ/5B8aj4eJyqBEx9dUXlQ
 Ft25z0fRxJNoEgu30JHa39Ghr+DzIVg3szlgYMwKrsp5UGe7gBY735CC6
 i0Y1bmYUhP9ds457WzzfrAHndtym658c1YQwH5je3zUSw8JLPfuDg9l/L w==;
X-CSE-ConnectionGUID: zdR0M3tyTPqepA+8y8D+ZQ==
X-CSE-MsgGUID: olyUmEY0Sbul+2+6SG1/fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="55101842"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="55101842"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:25:15 -0800
X-CSE-ConnectionGUID: mwQNFTp/TvKE0FWbjFzZFg==
X-CSE-MsgGUID: EmuxEMrSR7+u9VKB0v/zEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="201485237"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 03:25:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 03:25:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 03:25:15 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 03:25:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TilJrn5cHg/xdehiQwEv9POIUkv8Uap4JIMsRU6LIvOdJDLRHeovc4W/0KqzTIHhP3C2Wq5DgySOIn9qzWALSLY5/X/mCqCd6eKMFeYv9Ux+ah1vllMclchrju/uTrdwmlOggH11/Fh+ytINBRsDHUvWBTptXODSGNonK2pu2lVcCfwCSftBu+SnIESIIEofeUaQojBFeHnewShwWEQRgNYpJBGvZ9Wl7/UQdxk7UrzODnRTNQp/6vHJ7odjbTQo87+/3a6BGyAyrLwHsGegPLSGMueeP8DM9kknbrzL9gSI9l9aUi04zAGtsN53cBVEgPjjdW/7BjzoAR+8LVpF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YRlozCSAzbgwxwr5cF3A7fjZ4/+nsSfuEMA25oySuU=;
 b=qD3PX7lOLnmd2TyEScvQJhI8HR+qA1CLOOrlNK35Zw4h4gmwZJNOBXPqJjgAVuhWEGxkJpp6F85D7EDhzffnypz7aJUhMvuT/7JaamifV7vI+SIoRdjiUi/b2B8EnMlk1eejLmV4o+VZqWHukUCwUgO72cW2/rvdOvlAsPqqI1YP2bnlA5bBEADghrJ/xyUsm3AuWaYLKacRVf4LQ2a4ZAxhOC1HehfMh+19qPWGBurw57Ba07LkavE92fBUC234ZAkaYxYNCJyEEUad/JZmvhX5dSUi7hnT4O8C9jkBjG2APwFl82y6acY4i80+yPPociEw6fZAAOt4I+44amExaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SA0PR11MB4639.namprd11.prod.outlook.com
 (2603:10b6:806:70::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 11:25:08 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::803d:39cb:d276:4ee5%8]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 11:25:07 +0000
Message-ID: <b468f936-56ae-4e0f-85d5-f8dbbf5143b7@intel.com>
Date: Fri, 12 Dec 2025 16:54:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/22] drm/pagemap, drm/xe: Add refcounting to struct
 drm_pagemap
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, <apopple@nvidia.com>, <airlied@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dakr@kernel.org>, "Mrozek, Michal" <michal.mrozek@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
 <20251211165909.219710-4-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251211165909.219710-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0201.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SA0PR11MB4639:EE_
X-MS-Office365-Filtering-Correlation-Id: fc463261-54b4-4494-a48b-08de39711a63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXh4SVh6dXloTjNnSVFoZ3BkbmV1TGdqQ3dJUmdRdlRHT0x5U3ZGRXNxTEkx?=
 =?utf-8?B?YzFFTmw1OWZ1UDdpeHIzSGV6SGd6VGRZakVHWm4yTGpoL05zRFhOVUpjdDUx?=
 =?utf-8?B?UVQzWkY5SkxaVC9SM0dtMGhCOUNFNDVZelJNTWI3alJkK0o0OEQ2K0xkRDVa?=
 =?utf-8?B?UTVJMjErR0lGUHgrZmdhOHNySUF0TXJVN1psL0dydU9aUUxJVUlZMDRMeUJ6?=
 =?utf-8?B?RjhDNnQ1a2JGYmptU2k2aG9PMG8vNmx5UVVlbGtpOWNxenlzZHZ5WEczUkZp?=
 =?utf-8?B?b24wK25yNGN2dDdyRkpEVG40REpydjBhQ2hkbnVLOXplQThpL2djNk5NNlYv?=
 =?utf-8?B?cWtWYTV3Vnk3YjVhYVZTc05tUkxXcS9FalNpV0NoTmJxSDdUTW5peEM1L0hH?=
 =?utf-8?B?MStLdEd6M1lLdVlaNTk1eTV5TW1LUDAyWDZRS1dQemhWNDNsT0pkMmhteHlL?=
 =?utf-8?B?UERHWFNUWmN3VmI5U1QxT0NUeXNTUStHd29vS3lGdEdwa25ORU9yY0VYV3Bk?=
 =?utf-8?B?ZytzSVJCeU1ETEpqcERKSEs0THd4S2QxdURLZ2JTR3p6czVELzIwQXgxWlJW?=
 =?utf-8?B?dmVzdHdKZzFUSk9MMUZFQTdXUHBubUduOE5Wb0VLVUFSVkJ6OExIMkFidE5o?=
 =?utf-8?B?MjQrNVRhM1BiUFNOUjd0eDVBWVdQZnJjQmhlamxtK2cxTHFlUm85alhjam9C?=
 =?utf-8?B?RmRhcmhXWVEwSWJuMGtqODRQRGpsU0UzQVp2T3pEMnBHd3FKTklyT1RWYy92?=
 =?utf-8?B?cHBrNVZGUksyS0xkWHJsMC9CNjJVYTg2Q29XWm1HdDcweG9FTU9xSUtZRzRD?=
 =?utf-8?B?RE9LbGlpMkIvaDNsenZFVENaUXJ6N0w3cmEwRlRNbHV2NTNTNlUxYTk1OXAy?=
 =?utf-8?B?UWdiOVpaNlUwYzhxeHlWbHo0V2lDemV3SkNSRTdjQktQS2dtTDdId3R5NlhO?=
 =?utf-8?B?V0l4dHM1ZE5pTmIwdUFralE2cldibFpQMG1DMUVOdFZmSEduL0dIdWhnTWJn?=
 =?utf-8?B?WVZlTUFFWjRWOXZaRVNZeTEwYXRNZHBDY0RmUEQ1VjcwR1JLZW8xNmV6YTlX?=
 =?utf-8?B?cnJ2dlFFWUZIS0tGWnV5d3c5NC9tY2ZkWGpqTWZKVGxZb1Z4TEJYdHROaUpm?=
 =?utf-8?B?dHV5dWJjVkFBSTRnck5qd1NKMXFhRk1qZy9jRGJSRW9RWWJqZTN4dE1jam5O?=
 =?utf-8?B?ZVFCSExyZHhnbmdhanJyN1YwWkx6dVdIYXo0M2h6Mi93QWpQQ3NXdFFKcERZ?=
 =?utf-8?B?dnhnR3N6MHMxS2lMeTZUc09vdFBwUjJsMTZBbHl6QWl0UHJGN2dab1luRzVK?=
 =?utf-8?B?WGNyWUJoeU9OdnR4b3lJdnNKYlVSZDRVTDNUamRCVHYyR0lwOGtRR0wzTGdM?=
 =?utf-8?B?UTVtUjA3b1I2cWpwTUhyOG5DMHFmS3F5RjRTNFljK1JKU2ZJUEdiTjZFSUEr?=
 =?utf-8?B?ajVTYmw3ZzdwSUFhU1hjdFhvcDVzNE96WDlCZUJ6eVpLSzkyTmgxdERvMmh5?=
 =?utf-8?B?WHB4amFuSWxnclp2L0Nrdk5STkJibHJDdU9sRmhUUVlyUXBCcVBDdjNJM012?=
 =?utf-8?B?b3lhemxLOFJiTGZyUXhWQXY1L2RSRkVBUC9Yd1pHMVNJREVtWEJGaXJiS3Zv?=
 =?utf-8?B?Zk1YK0d1YjFiMi9XTVBEdUREQi9YYjN1WkYzNi9hbVFSNG9Mbk9CUFdEWjY3?=
 =?utf-8?B?dnNEb1VXSkJsazZhTk14bzZqOWNkckdYdkpFOTVFY3lMZEozRXdkaWkxckUr?=
 =?utf-8?B?akJLL1dZaWxOTXVyZ1NzajRtUm1nNllQdEZnck5vQ3JrL21TZi9TbGoyQlkw?=
 =?utf-8?B?eWJFeGdLRFRKeS80NlBsZ1lrb2hTN0VzOTlLMzBVakhSV005UWhWY1I3MWVN?=
 =?utf-8?B?NTc2bDNuQXFUUUs0ZzlnVGtoQUl4Vy8wYWR1bzNJSElYbmlyRVIyVUtxRndC?=
 =?utf-8?Q?NcbUP3WqbxxPQsI8uu+jLYYu02KrePgB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ujd0aTdKallnd0hIUVR1ek1aMnk2ejJlaWpZYktBTyt2QUM3c2VLSjZENmxr?=
 =?utf-8?B?Q2JyZ2NudFc3Y1d0NCtvb3B2R2pVZnNLaUwzNGJ3Ykp4dDl2UzFabGtGdXZP?=
 =?utf-8?B?UGo4TDhFVkNGbVJIeWtZRXdYTmR0WHdDYzZHVHdlR0ZQYndvM0IvRWVYOXpL?=
 =?utf-8?B?eE1pelc2Y3VMUnJyeGZHVzdydFBCbWdyOGNhMnA0cHpoU0VzTG9LQVlEUDJN?=
 =?utf-8?B?ZklTak9FSUVjZUVTL2EwSmVrME5kT3dZVDh0Z0xUU2VVQUF6ZUZIeEREUUda?=
 =?utf-8?B?NzVMYVQzWEI5aEtuSnpXNnpXYWZ2UjlRWWlKNGxnTDBIcXVjRG94blNHbG1N?=
 =?utf-8?B?bUtvSTlZblpTbi9DV2d0MXlzVFNmY0FNNlB6Z0hMZmh3d0VzYkllVzZnTG1t?=
 =?utf-8?B?N0dJemV0Wm5VSkN1Y05hZWs1bnlCVVRjT3VQOUxCUDQyam45angzRk5ST3Q2?=
 =?utf-8?B?SHZjWWNTeTRCdjdLcWdQa1VvcndsNStSekdDUFNvNmJSbnVyQ0NLd0V5Snl3?=
 =?utf-8?B?NDFabE5QbjdiWndqZ3VwRjBKWXkrZ1pxMnlGeUd5OXFlaURLZXlNZXVZNDBB?=
 =?utf-8?B?NUtHQVJ5d2ZkenI2NUJBT0NCZExNc0NFeFdGZHNkaVQ5MDZVZUZpd2VEUnNn?=
 =?utf-8?B?TFZKTzFCd1ZybDg1TklMd05JRkUvN1VheXhHYnpQcDVJckd2YytXeHp3VVI0?=
 =?utf-8?B?VTBMeldmNWY1aTN4L2RLYXdIejFtcTlaM3VRTGwwY1ZCUWNmbDZ6S2VrZnR2?=
 =?utf-8?B?TzkzTzZ2NHZqUFdkekl2ZnJ4MUFjUGJXY2dBZ0NlSjkwcUUvSzRxdEI5Ymlq?=
 =?utf-8?B?S3o1ZFVmWU14OUtYLzhiSWcyVy9CTktscHhxSlFCZVR6a21VNFlUTWM1dkUx?=
 =?utf-8?B?L1hJVElFektKVmUxR0R6OHBucWpNNk01VFhET1luekI5ODhmcGlhMnJ5a1ZK?=
 =?utf-8?B?MnBoSVZUNURmb1c2QXdYSDlCdC9QUjRRVXFpN0Jld0ZmNVFpN1VYSjI3NFBy?=
 =?utf-8?B?US9ob0w2T3JtZXdCalA3dlVmY3ZPbXE4amZ2Nmw4SW1GYkpBNFBSTVFCV2p6?=
 =?utf-8?B?aWpPR1ltVkRJRmRmMW5Pd2V3UWluVW5qNXNtRjFjVnpyWmhmRDV1cXlaazlE?=
 =?utf-8?B?d1RRdmhLOUZKdU1yTVIwbXVncHZidko0YmRVaU9MeUdYQXF3NVg3U3VEVURS?=
 =?utf-8?B?Uk1HQjMvWlcxZTZiTzU4NTlIT3pJVEtobnJkdFUrWTVvc0NzeTlFNVgySGRh?=
 =?utf-8?B?YWJZMU9aSkl6YkZmTFBpRHIrWUl6dkpTYXFBWnZlNzZ3aVBRUXZyQmN6aU1D?=
 =?utf-8?B?NHVxUW8zRC81cHdqbWZSVFdzTzdhRkhvZTNibzZkY3NUWGg3cWlqUGFrMzV6?=
 =?utf-8?B?eDRabDhUc2FzSno0TU1lQW1tSmZwN0RiZDNRaFNpWGY1NGNTb3pHTjkxZW96?=
 =?utf-8?B?K2hXdisvc2g0eTJLV285TnQwbE94QWtINWUxWjkwR3NnSzRYdTZHYUFDQnNI?=
 =?utf-8?B?MDNHQmJCVXE2KzRlNlc3WU1QbFRLeVhEeHRSOUFQYUd4NmRwRkR4S0VCTURG?=
 =?utf-8?B?OEFuaXRHa2RwaWpMSkpCR1ZkanBSTm5Na09nQUJVdExrV0JZWEFYQ2FLQkFp?=
 =?utf-8?B?UlpUamFXTlNRbit6Mkh2YTdtdjFLRmw4eWlNeUl2ak8xcVdYQllNU2ZuNkdj?=
 =?utf-8?B?bWF4VkhCSTRIK3F3akNtUWI3aDBhRW1GKzJQY29iQkcwTG5kTEZWMTFpTUsr?=
 =?utf-8?B?d204L3pycTZiNlYrWkFEY3NkR1VPK2pUTk5mRWhGZmplSzF6eEZjck5jRmJu?=
 =?utf-8?B?YXdPdm1YWlNQckVVVHUzdWhYdTRBTW1kREJZbjNubURXZ205Rk52Ujdlbndl?=
 =?utf-8?B?RDBSRlJCMTlaSCs0WHJsalVyVFMxNU5QbjM0dzd1MHg5YzFRSEcrZWt4cVQ4?=
 =?utf-8?B?VlpvKzZjbVFieVF0TWJ4QnZjNFArNmhUYzRxN3RlNmhJSTYyMXo5R1hTSWI4?=
 =?utf-8?B?cVhObFpyQVEvNFNaYmdvaFdBYUV2WUNTaEllUGtmSVNiNDFnMGpQaVhBakZ2?=
 =?utf-8?B?dmM0U2hLcFBIYlBGYk1Da0ROUy9uL1U2WmdkR000bkRzU2lTNzU0Y0lhN1B5?=
 =?utf-8?B?c2J3NVFHcjE2MkdPd1Q3U2QxR0t3NzlvN2xSdC9LMUZVd2lDZDlxR05xdkpE?=
 =?utf-8?B?b0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc463261-54b4-4494-a48b-08de39711a63
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 11:25:07.7698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qd3dzVwcnL6+x1Tpw6++dfrc7oQgvtsPtLPOl8Q22lDFy3Df3/uxOcJoNZZ1xSALta98LM6E9MmB0jDAkGuKyxZnkRG+Hnosbh0gGKEJX5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
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



On 11-12-2025 22:28, Thomas Hellström wrote:
> With the end goal of being able to free unused pagemaps
> and allocate them on demand, add a refcount to struct drm_pagemap,
> remove the xe embedded drm_pagemap, allocating and freeing it
> explicitly.
> 
> v2:
> - Make the drm_pagemap pointer in drm_gpusvm_pages reference-counted.
> v3:
> - Call drm_pagemap_get() before drm_pagemap_put() in drm_gpusvm_pages
>    (Himal Prasad Ghimiray)
> 

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
> ---
>   drivers/gpu/drm/drm_gpusvm.c       |  3 ++
>   drivers/gpu/drm/drm_pagemap.c      | 51 ++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_svm.c        | 26 ++++++++++-----
>   drivers/gpu/drm/xe/xe_vram_types.h |  2 +-
>   include/drm/drm_pagemap.h          | 36 +++++++++++++++++++++
>   5 files changed, 109 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 39c8c50401dd..4c7474a331bc 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1038,6 +1038,7 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
>   		flags.has_dma_mapping = false;
>   		WRITE_ONCE(svm_pages->flags.__flags, flags.__flags);
>   
> +		drm_pagemap_put(svm_pages->dpagemap);
>   		svm_pages->dpagemap = NULL;
>   	}
>   }
> @@ -1434,6 +1435,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>   
>   	if (pagemap) {
>   		flags.has_devmem_pages = true;
> +		drm_pagemap_get(dpagemap);
> +		drm_pagemap_put(svm_pages->dpagemap);
>   		svm_pages->dpagemap = dpagemap;
>   	}
>   
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 864a73d019ed..e82a38df72a6 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -539,6 +539,57 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>   	return -ENOMEM;
>   }
>   
> +static void drm_pagemap_release(struct kref *ref)
> +{
> +	struct drm_pagemap *dpagemap = container_of(ref, typeof(*dpagemap), ref);
> +
> +	kfree(dpagemap);
> +}
> +
> +/**
> + * drm_pagemap_create() - Create a struct drm_pagemap.
> + * @dev: Pointer to a struct device providing the device-private memory.
> + * @pagemap: Pointer to a pre-setup struct dev_pagemap providing the struct pages.
> + * @ops: Pointer to the struct drm_pagemap_ops.
> + *
> + * Allocate and initialize a struct drm_pagemap.
> + *
> + * Return: A refcounted pointer to a struct drm_pagemap on success.
> + * Error pointer on error.
> + */
> +struct drm_pagemap *
> +drm_pagemap_create(struct device *dev,
> +		   struct dev_pagemap *pagemap,
> +		   const struct drm_pagemap_ops *ops)
> +{
> +	struct drm_pagemap *dpagemap = kzalloc(sizeof(*dpagemap), GFP_KERNEL);
> +
> +	if (!dpagemap)
> +		return ERR_PTR(-ENOMEM);
> +
> +	kref_init(&dpagemap->ref);
> +	dpagemap->dev = dev;
> +	dpagemap->ops = ops;
> +	dpagemap->pagemap = pagemap;
> +
> +	return dpagemap;
> +}
> +EXPORT_SYMBOL(drm_pagemap_create);
> +
> +/**
> + * drm_pagemap_put() - Put a struct drm_pagemap reference
> + * @dpagemap: Pointer to a struct drm_pagemap object.
> + *
> + * Puts a struct drm_pagemap reference and frees the drm_pagemap object
> + * if the refount reaches zero.
> + */
> +void drm_pagemap_put(struct drm_pagemap *dpagemap)
> +{
> +	if (likely(dpagemap))
> +		kref_put(&dpagemap->ref, drm_pagemap_release);
> +}
> +EXPORT_SYMBOL(drm_pagemap_put);
> +
>   /**
>    * drm_pagemap_evict_to_ram() - Evict GPU SVM range to RAM
>    * @devmem_allocation: Pointer to the device memory allocation
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 2152d20049e4..e4036f428dc0 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -903,7 +903,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>   				      struct mm_struct *mm,
>   				      unsigned long timeslice_ms)
>   {
> -	struct xe_vram_region *vr = container_of(dpagemap, typeof(*vr), dpagemap);
> +	struct xe_vram_region *vr = container_of(dpagemap->pagemap, typeof(*vr), pagemap);
>   	struct dma_fence *pre_migrate_fence = NULL;
>   	struct xe_device *xe = vr->xe;
>   	struct device *dev = xe->drm.dev;
> @@ -1427,7 +1427,7 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>   
>   static struct drm_pagemap *tile_local_pagemap(struct xe_tile *tile)
>   {
> -	return &tile->mem.vram->dpagemap;
> +	return tile->mem.vram->dpagemap;
>   }
>   
>   /**
> @@ -1537,6 +1537,15 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>   		return ret;
>   	}
>   
> +	vr->dpagemap = drm_pagemap_create(dev, &vr->pagemap,
> +					  &xe_drm_pagemap_ops);
> +	if (IS_ERR(vr->dpagemap)) {
> +		drm_err(&xe->drm, "Failed to create drm_pagemap tile %d memory: %pe\n",
> +			tile->id, vr->dpagemap);
> +		ret = PTR_ERR(vr->dpagemap);
> +		goto out_no_dpagemap;
> +	}
> +
>   	vr->pagemap.type = MEMORY_DEVICE_PRIVATE;
>   	vr->pagemap.range.start = res->start;
>   	vr->pagemap.range.end = res->end;
> @@ -1544,22 +1553,23 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
>   	vr->pagemap.ops = drm_pagemap_pagemap_ops_get();
>   	vr->pagemap.owner = xe_svm_devm_owner(xe);
>   	addr = devm_memremap_pages(dev, &vr->pagemap);
> -
> -	vr->dpagemap.dev = dev;
> -	vr->dpagemap.ops = &xe_drm_pagemap_ops;
> -
>   	if (IS_ERR(addr)) {
> -		devm_release_mem_region(dev, res->start, resource_size(res));
>   		ret = PTR_ERR(addr);
>   		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %pe\n",
>   			tile->id, ERR_PTR(ret));
> -		return ret;
> +		goto out_failed_memremap;
>   	}
>   	vr->hpa_base = res->start;
>   
>   	drm_dbg(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
>   		tile->id, vr->io_start, vr->io_start + vr->usable_size, res);
>   	return 0;
> +
> +out_failed_memremap:
> +	drm_pagemap_put(vr->dpagemap);
> +out_no_dpagemap:
> +	devm_release_mem_region(dev, res->start, resource_size(res));
> +	return ret;
>   }
>   #else
>   int xe_svm_alloc_vram(struct xe_tile *tile,
> diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
> index 83772dcbf1af..c0d2c5ee8c10 100644
> --- a/drivers/gpu/drm/xe/xe_vram_types.h
> +++ b/drivers/gpu/drm/xe/xe_vram_types.h
> @@ -72,7 +72,7 @@ struct xe_vram_region {
>   	 * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
>   	 * pages of this tile.
>   	 */
> -	struct drm_pagemap dpagemap;
> +	struct drm_pagemap *dpagemap;
>   	/**
>   	 * @hpa_base: base host physical address
>   	 *
> diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
> index 70a7991f784f..093e7199c44b 100644
> --- a/include/drm/drm_pagemap.h
> +++ b/include/drm/drm_pagemap.h
> @@ -130,11 +130,15 @@ struct drm_pagemap_ops {
>    * struct drm_pagemap: Additional information for a struct dev_pagemap
>    * used for device p2p handshaking.
>    * @ops: The struct drm_pagemap_ops.
> + * @ref: Reference count.
>    * @dev: The struct drevice owning the device-private memory.
> + * @pagemap: Pointer to the underlying dev_pagemap.
>    */
>   struct drm_pagemap {
>   	const struct drm_pagemap_ops *ops;
> +	struct kref ref;
>   	struct device *dev;
> +	struct dev_pagemap *pagemap;
>   };
>   
>   struct drm_pagemap_devmem;
> @@ -209,6 +213,37 @@ struct drm_pagemap_devmem_ops {
>   			   struct dma_fence *pre_migrate_fence);
>   };
>   
> +struct drm_pagemap *drm_pagemap_create(struct device *dev,
> +				       struct dev_pagemap *pagemap,
> +				       const struct drm_pagemap_ops *ops);
> +
> +#if IS_ENABLED(CONFIG_DRM_GPUSVM)
> +
> +void drm_pagemap_put(struct drm_pagemap *dpagemap);
> +
> +#else
> +
> +static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
> +{
> +}
> +
> +#endif /* IS_ENABLED(CONFIG_DRM_GPUSVM) */
> +
> +/**
> + * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
> + * @dpagemap: Pointer to the struct drm_pagemap.
> + *
> + * Return: Pointer to the struct drm_pagemap.
> + */
> +static inline struct drm_pagemap *
> +drm_pagemap_get(struct drm_pagemap *dpagemap)
> +{
> +	if (likely(dpagemap))
> +		kref_get(&dpagemap->ref);
> +
> +	return dpagemap;
> +}
> +
>   /**
>    * struct drm_pagemap_devmem - Structure representing a GPU SVM device memory allocation
>    *
> @@ -257,3 +292,4 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
>   			    unsigned long timeslice_ms);
>   
>   #endif
> +

