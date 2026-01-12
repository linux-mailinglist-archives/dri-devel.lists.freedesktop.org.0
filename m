Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E453CD11339
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 09:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B24310E309;
	Mon, 12 Jan 2026 08:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KmNGOA0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0379D10E305;
 Mon, 12 Jan 2026 08:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768206377; x=1799742377;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NAnZvK93/3y69KEDy8h7na33/YBqM4agmGnpegij1hw=;
 b=KmNGOA0RHtxP0sKNgbzlQ2Xp1/ja+P++af5j/84i4bPbaAAW9666f0WS
 J1u/y5mK1T8f7vF9IOfeXtxq/M0D0DaiqcVnM1/Vx/xgmGaSXlGoo81hT
 I6iZBiJ8q7iL/77Ir5olyxVkHcLxbszqHWNJ021mV+pxqoRivBmJxrVUP
 Y9Z4WrLgBq97JeI+lQHeK64Jm1pOQd+IA98tnEz6NqUdLm96naFmviANh
 etYXCHFirbBjwbh/Qvu7xWOuLR2PHf0p7tTTkhL2zcAiHG5nZWLZOgiqB
 ydrlcF7hGruaseN1kyZoeu9QsCqChxvMGil4sJEY1pP643ADXdMpLGQva g==;
X-CSE-ConnectionGUID: mVosDkYRSziRDtUstGp1oA==
X-CSE-MsgGUID: B3XyWP83Sg24kYUqcjF4lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69526768"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69526768"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:26:16 -0800
X-CSE-ConnectionGUID: +TOAwThaRXGEtv9MncHTUA==
X-CSE-MsgGUID: jjlvabPwRnuuuQGHT1QOvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="208867055"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:26:15 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 00:26:14 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 00:26:14 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 00:26:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8ZLYV/6+1fPJGovSIhyvN8OWf5GIXSEwzy/fLnBsQMgqcGmC1c6vaftxeKwDlWOefMbXkZGoRLbBLTHpv42VymK0bOZ5/s86Uv0liYco8hzTADT7IM4cqLuTxf+wVkKvFpnCqwirQxGxc756pXeoX0+HYHdIeVN10hcr0mmaangZ1L0w4CtrCXxdJraH9jbFWPfd66qC0PIrUFgccYIOmGeV9/oUFlRprw+ZZt6H7HjDzTWV7yDZdwaz1Iycq3G3V3TSRc3jZgVw9t9sP2Y8AiA6axobfjuMXxT9+sPMGB7o7YqTnBzWVpupr19U1fvvHjCvEhw+9m7tUNdv6z5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAnZvK93/3y69KEDy8h7na33/YBqM4agmGnpegij1hw=;
 b=BREqlrJL4bZ4I27XA+5xogkPohZGCWvnMBBlb4voKJC28an5EFIGTh/uOPIEymsEyY8gUedoZywbn/4kbTbQedkwEUOdySitCaEiVFltrmPPW/KmRbGQNWpBo2nhDDEfP3psQROvT8Oca6YTMRMQBtYT6J8EtD4yCZeFtgBKA3rv7tP8BKo/Y9IoNwlX9jaNyuGjX2QGr1qAqOe72X62dkqiLB6+8LHpL6hPFRrHyo+A5j764URMRFPmBd/1n8hS6mwUwNPSP4NAnDJIwF/xJXe3YwrH4wwo4oyXL3KKm/jouHtaQo3H1IqM0ojyfKJ/4dRuB1JHlHplfxWi+Fx3zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ5PPFC4905B1D0.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::855) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 08:26:12 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 08:26:11 +0000
Message-ID: <385071a7-15c9-4265-87b0-fe30dcf6f87e@intel.com>
Date: Mon, 12 Jan 2026 13:56:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH [RFC] v3 5/7] drm/atomic: Allow planes with NULL fb along
 with async flip
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "xaver.hugl@kde.org" <xaver.hugl@kde.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>, "Syrjala, Ville" <ville.syrjala@intel.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <20260108-async-v3-5-e7730c3fe9ff@intel.com>
 <6316ba11-0660-419c-afb6-a1588f6efef5@mailbox.org>
 <IA0PR11MB73076D91D60F168B9D112051BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <05ac3e30-b3dc-48ea-96db-1cbdb4454730@mailbox.org>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <05ac3e30-b3dc-48ea-96db-1cbdb4454730@mailbox.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::11) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SJ5PPFC4905B1D0:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ca2c9ed-4908-43d2-3d09-08de51b43e05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0lMTG9QOXAwdytacmswRnpwNkpQVmd0U01tTHR3bUxnMzN4bFpmZ3lhdzJw?=
 =?utf-8?B?TzBmTWc1QStKKzJCa0dPdTMxUlZEcHo5RXNXMFZBWjNDdXZSa2ZDbTY2VTNx?=
 =?utf-8?B?U0ZKZkFmajhkNzJmQUJFekVQVFJnZ0pnVjhNVXdzaFluZjd6azVGaTNXWGdo?=
 =?utf-8?B?YmVhOS9lNFhPY0oxMk5WZUsrVDF6VmFPa1hVaTBXN1AzS1RvTFozVjFzR2xT?=
 =?utf-8?B?NElRa3prZHQrSnhYdTdvWXFHMy9vZzVMb2xMbFZJVGhsMFlESzgrZzMrYjBX?=
 =?utf-8?B?akN1RXpRcCs0WmxWcFRONjhaT253R2xFS0kvY1JUTk1Oc1NoVFA0VjRNYjVU?=
 =?utf-8?B?Z2pYTTIvWjJ0bW1FUkswU0VuR3ZWSXl1SEdNb1hGV3ZaSi9TYkhXWHFmbXpN?=
 =?utf-8?B?bDJEdkxSdFRZdWh0OWVUVngrSlp4c1lFM1czODlQN2UyMUlBeVI5TDcySVVz?=
 =?utf-8?B?dVI1c0tzaldpQkxjNHU1eHVENzE1NUVmY2pqL3IvMmdoRWg1Y1ZONS9DRms0?=
 =?utf-8?B?ZFhBQS9FQ3JrdXFxYXhhZG9ITFZndXJOZE9tNkZHS1BWSkJqby90bHYrY1Fl?=
 =?utf-8?B?b0tpcERnQUVsLzF4RzVKYWJxTktaQnZNMzF3YUVTRFVNTnMxSVl1Q21zYXJm?=
 =?utf-8?B?R2tLVGZNMnovcjhuRVpwenVhc0c0Wk15NmYrZmlDNGlzd3h1aC9hWkJiaVZO?=
 =?utf-8?B?TGZvemJGeWJ3ajhtcGlOK0UwMHM5cGF0NG5ZQmRaazFsbHZmeHIyblJQL25u?=
 =?utf-8?B?Q0F1SVlOUi9lQkVpNVVSdWQzN29hSCtsQVFjQUJjbTIybG8yQ21BQ0pnbGtY?=
 =?utf-8?B?Y3JqWkY3Z1VuMjNvY3hIREpQMEZxZWxGdGpFTVcxaWFvdVZXS2QyRVNvclls?=
 =?utf-8?B?TzRwMlJ0NFBhMUdoZi9nOTc3bTRHQWEyMXBYM25xOHdZdDg2ckNHL0ZYeEx2?=
 =?utf-8?B?SVhlUnNXdElBK2lJQUcrYUFBTGdCcFFIK1U4Y1d3ZTFQOHR6RmdadGVvQ2VK?=
 =?utf-8?B?NG14OXJYYnh5U3NXQndQeEJLK3JXcW1iU2ZGbzB0YjlKK0xUWGtVSHdtWjRI?=
 =?utf-8?B?ZDM3Qi9pdkljRTRGbXBSZVhPS1AxV3E0SThBQkxxTDF2K1lTdE9XeS9Rc2VY?=
 =?utf-8?B?Nkh1a24zV0JuM0tQVm5lZVJmdUxCSk9uNkF0K0xjOVlKUTJISmtwR09rZDNo?=
 =?utf-8?B?RTZjM25zeE1nM0V4UjB5cFEvcWVkeitDaDhiSTZBa24ySTYvNWoyeEUzNExp?=
 =?utf-8?B?YmJSaGNCZkpSRno4V3drVEk2K3NzZk1ycTgzU3poWEFuNG9RQjVDVTMxT3Yy?=
 =?utf-8?B?VU81WUo5ZmRJNjJPYVAyYXowSG1GNE5VMUlUZGUrS2tmZ0NsNVVrSU5mYTVK?=
 =?utf-8?B?dkhWaU82QmYydmI3aVJ4Tko1c0ppZmR0aEk5bDI0alV4ODhHcjcwajl2cE9k?=
 =?utf-8?B?TFVqb1FvRmJDRGlMU2hCOVY5a3oyWXgzYjRXSTRZQ3NRS2ZuVG5VN3dEV0N2?=
 =?utf-8?B?bmRTQng2VENhTEpRY256UjdLUVZ2UkFjSUs0Vi84TDc5SHN2d0txd21WZXBB?=
 =?utf-8?B?NUNsL3Q4aFpmV0diQXZwOXRWWjltaEZzbGhUdTVwZHpDN29tZ09YWTIxdDNn?=
 =?utf-8?B?MW5LL2doU0VDNnlEWkh2cHhEcXYzQUl5aW9qM3pFQktLSFB1aHpEbkorVnJY?=
 =?utf-8?B?bkxRb0VCNXc1cFlKSVBKa2szT2x2cjZ1Sm16Wlp5a3JZZXZUMDYrMjQ2V2Uy?=
 =?utf-8?B?MXhwc0grWDZUS2QzTGp2UEQxdUN5M3VCN2lzNDFXWUxPVlJwU29GOTRQYi9l?=
 =?utf-8?B?YnpoMCswK1daazZTRHdJNG5BZHpuaE5TamZobzFvdUVqWGJ6WmVJb2xNVmgy?=
 =?utf-8?B?a3k2NkhwNmluMWgxVHJ4Sllrb2RmeWR0Zkc5U1lWczZ1UmsrL3VWT0owc29H?=
 =?utf-8?Q?npeBkf4iF1HWGc0LlR+2MapRuzXUfvgC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0taYkhyOG5jdkxIdlFVbHdqMEY1YTFqbTRJMEd1dUJmeUxTd2Fod2hVRm9U?=
 =?utf-8?B?Nm12eEtOUFMzQktUdWowdXgrOE5xTm9QcGRyaWptdmRlMzVuc3NvQU95Ukkw?=
 =?utf-8?B?NXRJTExkQjh0OURSVVlmYmxDMWZLYjloZlNvQW5BUjRpWC9LeXZqbHBhMzdB?=
 =?utf-8?B?Ylkzb2VieGRtYllON2RTbnloVm1ZRUFoQUh2MEFUYnlTOC8zeEJiVmN4RVdN?=
 =?utf-8?B?bXByZWE3WWJ3TDFYTU5hb2RWR1k1VDN6WlhJTnpsR1BiREhwT0thRXlKKzJW?=
 =?utf-8?B?aXdsOHg0bzBrVVJTaXgyUnlMSlFPRnc5RnFqYktITHJNaFpTeFlhZjFMcHhP?=
 =?utf-8?B?enVTUTh6UDlWN3Q0RjMvVXdOTWNJbEdoZklkTnRuWENPWFc5MnN1OURsQkxM?=
 =?utf-8?B?a2p5dFo5SnpKaXVMM1pqTGZEYWJkaUJxMnV3bm1IeWRGcmRuSmdHbCt3bXRH?=
 =?utf-8?B?NXRBOXo4bTVGOTEyVGFXKzU1dU9vbEVlY2gwVmQ4RklYREIyWkJ3emF4NXI1?=
 =?utf-8?B?Q2VwZEZKTldKVDVZVGIrMjFxZ2owMkk3Y3JhdjZHNzR1MFppOW00VDJYR2Fy?=
 =?utf-8?B?d2kxUXlHZWlEUHR4NFdhaDlvK3NUTW5USUVzU3ZkdHY3SzhwKzJHY2ltdzVx?=
 =?utf-8?B?ZjJ5MGlZM3pRalpKLzFNbmFNTlJ4bDJTdGJBSkxSVDdwRHJ2cVBVTG8xd3d3?=
 =?utf-8?B?OW5ORGhmOXNwM09RTjMzOVo2Nmg4TDFUSHd5WGVIRjhUbnYranhXUkFPb0hl?=
 =?utf-8?B?VkxndGp4TlVaOFNlb3h6a2oyaWdZMWVEVFNFMU1QMHp2enFtaitPNW5MTWhx?=
 =?utf-8?B?UlBIekE1dy9BSTZRbTRFc2taSjAzZkQ3bWVQS1BUaFZybTZLSjJ5U2JuN0ps?=
 =?utf-8?B?SGczTXBJSEk3d1R5aDhjM21vbGt4WVRRVjByL2d1bTgvRkhNRGxrZ0F4ZVlt?=
 =?utf-8?B?UVVZSjRaTnNkTC8yU1BKZEEvem1PS2FRYUpaSFRRSU0yUFRwanFSRkpITTd6?=
 =?utf-8?B?Tk5KUGlNL0N6L1hEM0psQXFOemVLSkNKWDdGUGRPQW0xMjkxeU5zc3Y4bGpD?=
 =?utf-8?B?SlhudVdGRUt6cjIrNXNYSG1icjNOaHdRUXV0eElOVXMxUjNBd1dLSG9UVnRu?=
 =?utf-8?B?bjU0TUVKc1hDL0JsY2p4UzA4VXdVNGtFdUJnREJmakpCQytYYjBBZ1JiTmkv?=
 =?utf-8?B?MnluSWtjQlpxUXpwRnNLU0hZbWFsOEwxbFVOMGVLYkI4N0NRMXZkdExWdUtR?=
 =?utf-8?B?OTRMVnFWVVkxTitNbUxkUlJkL0lTeURzV2dGaEtGWHZrSXFNcHJBTXdDRlBD?=
 =?utf-8?B?SVIxakkrUTNOODNvYnhhN0dUdUJuVFlGVVIrOFpPM05PREpHMWxQZ0p0R3Rx?=
 =?utf-8?B?YU1TbGhQMjNQTDJZc3dJT2VYMERwQmRVSWZCT0tLTEtLaHhsSXdhUHlEU2hU?=
 =?utf-8?B?L0JFNWN0enpYS1UyQmhFanMxVHpIMXliT29YZmpqeDRUNFhxUEd3elZ2RWxi?=
 =?utf-8?B?R0tjNW5IaUxaL0NmSjY4UTJ4K1RaVmgrM3NZSDBiM0xUcmtzQS9LUTVDNGlN?=
 =?utf-8?B?RitkRWoySGxEeVoveEpLNHYxejNEQW8xVUlWczF6YmtWNDdWNEdZaWhlMGNQ?=
 =?utf-8?B?RjdMaXlqV3czUnA0akxIUy9zQkRaZTBSNFNTL1Jza0dnU1B6S09namhwdUdk?=
 =?utf-8?B?elRUQ0dhS3JFdXZBMFlscVRyVTl5VEV4ZCt2UDFjWXFRalcweG5XVmw2N0tt?=
 =?utf-8?B?MFFLUWFWK0ZycEtIcVZlaUdNVkxzRlhwb1dQTGkwWDhXdkExMjNVeTlWTVhh?=
 =?utf-8?B?SmxZaGFpN00vaG9tSEdsVUk2RFhBTkZGRktCYVpqWXpNSG5DbmZvR1hBQ0Mx?=
 =?utf-8?B?eVRIRUdWNHh0TlNRTWc1RW5TYjNna2pWVmVOVzVOd2FpTklzUGE0bzNhd0tT?=
 =?utf-8?B?RUVlYkhnU3dvT1pkczNSZVptYXR6M0RjZEVMN0pVNVNES1VTNiszUG9vWWFx?=
 =?utf-8?B?eGRZblIrMFc3RU1HTk53dGo3ckU4RGZqcWNPODNJaU1MbWkrWGtHaU1TbjI1?=
 =?utf-8?B?TTBMSElYVmErTmlPTEJRb21UVzh2eXVXNnhpNFdoU0lyeWlET1hRQUlZUnc5?=
 =?utf-8?B?Tk9CY1o2aXQ4bGtPVkY1LzBHUXArR25RWlBMTVhrZTFtTHovL2dzdUtTdVZ2?=
 =?utf-8?B?M2NrNjI0MUtVWXkwMzlWWTlGclFCazRPZFkrWWZISTc5dnJYcjUxU3A5ZEtl?=
 =?utf-8?B?TE5UNlAvTWJHRlRmR1ZKQndLV21TY1JjYnZpMnFWQSt0MFFERzVJQmZtaFdv?=
 =?utf-8?B?MjNpdjdQOUR4bUtYeVprR3JDenpiYkhaTzBZVG05bHBockVIaGJvZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ca2c9ed-4908-43d2-3d09-08de51b43e05
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:26:11.2930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HracOgxaqy6G72BxoJ76lE5+6PskLrZRdghd5+WETO3GXCoUVwRgG9YHD3XTejWPFqqRD9Ro5EC0HC0uYKwwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC4905B1D0
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

On 09-01-2026 16:53, Michel Dänzer wrote:
> On 1/9/26 12:08, Murthy, Arun R wrote:
>>> From: Michel Dänzer <michel.daenzer@mailbox.org>
>>> On 1/8/26 10:43, Arun R Murthy wrote:
>>>> Along with async flip if there is a request to disable a sync plane by
>>>> providing a NULL fb allow them.
>>> That could result in async changes to other planes taking effect in an earlier
>>> refresh cycle than the sync plane being disabled, couldn't it? In which case the
>>> commit arguably wouldn't actually be "atomic".
>>>
>> This is the request from the community to allow disabling of a sync plane in an async flip atomic ioctl.
>> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834
> Can't see any such request there. I suspect there might be a misunderstanding.

Here cursor is a sync flip.
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2855843

Thanks and Regards,
Arun R Murthy
--------------------

