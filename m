Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99584A50D69
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 22:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D623C10E829;
	Wed,  5 Mar 2025 21:27:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtSxT++S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC9E10E829
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 21:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741210059; x=1772746059;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+iimN/RuCVGiBAXylcChytqNFMQ3vkQqSYCylpiZwdg=;
 b=CtSxT++SE0gemWidIrPZkTrWy98XnDklmz3HXIoPkzsGCh052jyoovfs
 WHZH0TT1M451RlHqbZrU44DKuozLWOGXC974LEFWyugQY+98Lm7xGTDRX
 tlu8+0LB/vT7NpESvhcI/4b+I2LMZVEMSNR6PFW9vzg3nneZ06zj9PjWF
 hOmLs+eAmnCmcj2hOYwO5NghWSbI7UOvYDxRrlqvbimtBmSZZax1nmOan
 8AaskUrEv8o6OpJNKsM1/k4nIt85E5U+gU2/hVowSwqdwrEcZ9REKLcIt
 L0GzxUqqRIaQoXDpYJfBuaIA0Nzd1Pl6JGdilyRpGZLZjXrpagMaOh/Wp g==;
X-CSE-ConnectionGUID: gS3Vzo4uQU6O5mUMgMDHAw==
X-CSE-MsgGUID: mTPekIOlRRi5lyp+4E9bVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42221079"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="42221079"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 13:27:32 -0800
X-CSE-ConnectionGUID: FpABBjQiT1mmnUIUuaOsdg==
X-CSE-MsgGUID: JqmW6RmLRU6sHhTzhVa6Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119734852"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2025 13:27:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Mar 2025 13:27:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 13:27:29 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 13:27:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmErM+1fMNP4Iwfkj16xsXGdBpH2C1jXLHE8Pbh5jH0yLjCVBKhhdI4XFyhP1w4/2NinnmNp1NgJ7/oXo8Evrf+tn4WL5mFE88okCP6LanDRI9g3+7WrmvufUrQXdoRvqfg3tyH5iwsTG3ZxlEHDtDhEUTUbVbece55zzJ+j3xqAEEKWan4z9ihkKiLjCVFiqTxuhy4ym7AnaygiHeMvRNXRilV/s44g8Ob09H1WKMhet1YUe1LI1ijNzt+mHZ3v2i3u1uE3+7oOhYGNn4KzLMs7c7oabtc7yrOMgUYEsQvkVlx59NGk8X8t8/OLItTirLh+2kon4KkWfx8CAjIYTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsqJDxosA/NhiE3AkhtSIrD6IQHsaFYNCkzvn6pqwhs=;
 b=DySavYD20LfaCZfZC3w7BwYGoTUzqWzqn29XBs4/3oOfnf15UQQsTil3w+OzRpLluvuRyuv3RdQd9hg3nkPTL3bjS7wULBvTQ7ICmnpYUKXevTTLikLjsorFQnKLQanZiQJWoxiBDWVFRwarYqYLVYJWDD+/OE3Y78mIA3Re+ZqJHurI7XL8yerd4ogrYqld804u493LwZIdZl4GekaSUjZpXNZrlcVxGpBl7uk7KQcTg7XJq+j/l8haFs+kXTVZzxmKLMUnFL3jAtRrKSar8hQ7PCvO1u4ZEZgvKw2pB1c7Z+da6VdiCVh8Bbokcg0dv4Go3Igq87QRfzb1vQZkPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by SJ0PR11MB8270.namprd11.prod.outlook.com (2603:10b6:a03:479::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Wed, 5 Mar
 2025 21:27:24 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%3]) with mapi id 15.20.8489.028; Wed, 5 Mar 2025
 21:27:24 +0000
Message-ID: <ed416858-e20e-4ad0-bc3b-9c0be09cbd1b@intel.com>
Date: Wed, 5 Mar 2025 22:27:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/1] drm/mm: Introduce address space shifting
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Murthy, Arun
 R" <arun.r.murthy@intel.com>, Matthew <matthew.brost@intel.com>
References: <20250204224136.3183710-1-tomasz.lis@intel.com>
 <9db7851b-d860-47ea-8226-f5b5a1111c21@amd.com>
 <4493a2ec-3d88-4036-bf45-237e192cbe2d@intel.com>
 <d34725de-efc7-4c89-8505-fb68d093d02e@amd.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <d34725de-efc7-4c89-8505-fb68d093d02e@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0018.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::12) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|SJ0PR11MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: bafdca05-e3a1-4619-5c62-08dd5c2c8525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cENCNmV2UENzT3pFdHh2WTR2N2lQMU1VRTZ4a2VZNmFpb3owbC9BbC9aQnFz?=
 =?utf-8?B?WjN3NnJCMlRWU0czQ0dmODJrb3IxSEwwZXk1UWlhV1ZxMXYvR21rZVBIOGVY?=
 =?utf-8?B?ZXR6VkQxNnFtWXQ2VkRETkdpb3l1aWt1c1hDQmxndWFDeVIyZkVkaHBFODIx?=
 =?utf-8?B?bnJ6T3I3L1IxN24rdDBkWEVZVlpyZlcwMnJscW9ra3RodGdyQ1E2cUpERDkw?=
 =?utf-8?B?ZkIwOGVjZVJnR3hSek1DSGV0aHVmVUxOeTdsYjkzWGU0Z3NOcWxxV0I1T0pF?=
 =?utf-8?B?LzltK0tIeko0WDlzYkh1SkI0NExxTnJuVWFodW8xMUVVUDgzclNtU2xYeG5j?=
 =?utf-8?B?K0dqQzZ4WWNBVWpLQkFMcHRxVUVjNjkwcW81NzdYNS8wNGNqQ2IxQ2xHb1Rw?=
 =?utf-8?B?aWVjZ3RNVlM2VnVkSzVnenN1c0FqRGpua2RWdFhDWVZJL0dhbnZtdkdiV0JT?=
 =?utf-8?B?N0pSTytHK1dDNUFsby84SldOY1lLR2E5TFBxUHhWS2lxU2R0Rmx2R1R2dDN6?=
 =?utf-8?B?RDZBWnR6TmtUQWFLQXdQMVRVWW80THorekttaEZEeDNUVzFCQlVVMjZaeVRB?=
 =?utf-8?B?YXVLSWVWN1hORHZGL2E4RGdQSVNSNGc5UUtpUWQ4aE92M21TM1REM0JFRWJv?=
 =?utf-8?B?VU43Z1NNMjlnM05BMXh3UXk3T2NheDVTcUppdmJ1Z0N3QUJERll1a2FLUXl4?=
 =?utf-8?B?Y0JFRkVMRW5JamZ6Q0Q3TWJiZS85UUlibURzTDR3azVvQXNHQ1BzejNvQ1d5?=
 =?utf-8?B?Z2FZSWZCTDhnMkpIWHdPNjY3QnZIUldVQkFSUUpld2I5bXBEZ1BxTDlxN1dH?=
 =?utf-8?B?dWdBYVFEdHU0UkJXaHNWdHRNd2FKOVJIUlVnbUl3MFBNOVhzVXRZUlg0OVRG?=
 =?utf-8?B?d3IxRVJEN0RTYkQ3c0VjRC9sdE9kbTZoN3oyMGZ5Qy9tK2dHRXh0amRTb3hW?=
 =?utf-8?B?L3F1VENYVnVlZGU5cUpJN0JaZEVYUkJPcDN1V0ppRjJzQ1orbkY1NVEwcmFQ?=
 =?utf-8?B?VjduQ1BMWTZ0K2twVDBoc1RBdWRvUUxFM0ljOThmTmRoYUFXRUJNS3RicDky?=
 =?utf-8?B?dE5mUnlKNUJOaEdMMkYxZW9YQnE4NndKM2ZDcXh2NE1uZkVucXlSUHJkVWh1?=
 =?utf-8?B?QWszb2htWjU3ZjhPRHVVTm9ydzh5b1ZNM2xNdmoxVXZ4NWNMWTlvMEhzRWZh?=
 =?utf-8?B?ODUyVGk5UkxhRklmMURCRm5aWHpkTkRSNUhqQWs1cVRjZnRDbktaLzNIQndT?=
 =?utf-8?B?UkpFdWRtOWEydERDYXRSY09WeGJJeTlnMmRXa1BNY0VEcVJ5WTVxNHYyeUV3?=
 =?utf-8?B?SWx0RTQvRFpsWStiYThJVUFmZnhUZFQwc3h6LzdLc1dBU094Ry8yanhNajNy?=
 =?utf-8?B?a2syemZ1ZDk1REEwWFJwdndWRUQrV0JXaEk1MDJXdHFJeG8yK1QyRi92TzFx?=
 =?utf-8?B?NzB1c3h0b0tTUFQ3QVJoL04vSG1oTm1POVFCKzltSGtYcDRXMi9RUHlJSTcv?=
 =?utf-8?B?MFZiVkN5d29SQkl5dExSdThDL3pyYldiY2tvY2Zidlc3d3dPSXBURm1wYjIr?=
 =?utf-8?B?bDY4aUdtdFBOclZKejgwUVpPTDlkYngzU01LNkZualNKUzFIdXlMRldqMWFi?=
 =?utf-8?B?WWZVMGpUbmdaakQwU3psaXA1OTNhYTNGNTlRMEh3WjlzajR0Y2NrNDlqMDYx?=
 =?utf-8?B?QTFSM0JTUnVyNm9ZdTZKUy9KTkUyYkRKWk9pUUIrYmtXNFMrOEhLWXh6Y21O?=
 =?utf-8?B?Y256V2NEaXlNWjJiQnBUcnloVHdKWit3N1krWE1pV2tONE5IMk9SUnQrV2dv?=
 =?utf-8?B?MmtscklMUkREUHBTcXRzc2Q2Y1E0T2xpUnFNRDFoMHhhb0dEYkhOY0F4STZH?=
 =?utf-8?Q?Jqjl81MU6G/m+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkhPVHFtenhEWjlWbXhYOUNyb0k1TmJwTFNZdjlBMWRnNy9mSi9leURXOXgx?=
 =?utf-8?B?b2hPVDVqVmtodjhqbllGYlZCODN5V2pKMmpEcmdydGhaS29teUMvVjUzZnEz?=
 =?utf-8?B?d1V2VDBBWk5nQmJMTm83b0VFN0lYM2J4bzBraUJIRDNGUXJuWlF5UHZRMWJ1?=
 =?utf-8?B?bFlLcEZzMXJTcDNpc1A5R29CTFF5Q0VMT2VBN0VoQ1lCWEZobTQ5U1E4RkxK?=
 =?utf-8?B?aURTcm41bUlnZGFtTEJ4Umg4OVJ5ekRaZXMyRUJ4bFAwYU92Z3YwempIZGNv?=
 =?utf-8?B?b3ByYmRsMGlNZloyRU9JR3B4NnYyRk1QMmkrQ1lTcTVsRWt4b0ZTK1UvczNu?=
 =?utf-8?B?Z1J3eFVNVm1wbXBXQXhWYmM4U3d2bGFxVWRjcWR3UU1YOXFjYkEwSWdCYXlW?=
 =?utf-8?B?RkNlQnBtMmtIZys4S1ZsS2xVNEZMMk1kbUNmLzE0SWZtMTdXMVdST2w0YXE5?=
 =?utf-8?B?eUl6dXBkU2Z4K1l5UUVrbTUxeDZJZXZTNFBSd1paL1o3SFNIeE1DK09yRmlu?=
 =?utf-8?B?ZWI5K09KcUt3anJZZVVad09tVmdkSms4ZkNHRFpRVjM2NTZYd21OSU9EaG5R?=
 =?utf-8?B?ZEcrSWpDc2lDZmFmNDZuSVJrTUlIRG9TWFN0YnhVRFhLQUpNSm5EaEpjSk9K?=
 =?utf-8?B?dDRHVVpKRU5UbzhweURVcW82N1l6VXEyVDV4RjJ0MU5qOXl4eGxvRCtvcU9L?=
 =?utf-8?B?Um9ZWTlaWFRXM0l1MUFWcFNFRklLcUh1R3UzaUQzOHpnNE5PUWsrZDJwcjRi?=
 =?utf-8?B?dVdhdmhOSk14T2NzK2J4Wmp0TlBMV0E3ZUpmcnBXWVRWNHdLQno1cmlRcDJ0?=
 =?utf-8?B?RFlaVTZ4cExXZDZuL3FiNHZoaGdMR3JTWkhhTlJvVTZmN3Jpb3pnaUV2Q2JN?=
 =?utf-8?B?UUw3c1Y1UnVZSmQ2UFMzWTNKSU1iM1JDYjNsMitCYXFKZGpOanMwUytnbWQ5?=
 =?utf-8?B?ckIrM09YWEZONGtFMlJuL2RKYU9KZElpNmZrcGs2OWo1bG5PeXBBRVJETXVP?=
 =?utf-8?B?YnlBNnhhY1FCOWhXcklFVW9qK1B1L01BRjRDVjcyanhJMlRxZE1scXAxUHJk?=
 =?utf-8?B?ZkFzamdGRitURXJhQ05PU3Z6ZVN0aE5tbXVqSFdLV2hxaWM4KzlMeXZhRGdL?=
 =?utf-8?B?dFlQTlBUbGdpRUdlTHdyWUFTbGgyQm8vZTFmRktuVVNBeWpBUVg2cTRKb3o1?=
 =?utf-8?B?RTlnMzZ1YjBFNGdyMmlGREp6MnFBSEVzQmphOE5ZR1BsM2FmMjF5MUs2bkZD?=
 =?utf-8?B?SkxzaXREUGxIUCtiYjR4azNXbVVpMUQ0aWI2UEMzNE1jVHBKdEZnWXdnN0tX?=
 =?utf-8?B?YnQySGMxTXFNeEs1NXFhbzl2Q0JKYVZsV3hlMGd1SGk5bWM5K2JyZ0VZN1VF?=
 =?utf-8?B?RkxHSFRRMUJLVTlhNGlVcldxNXZoc3k1QUprV0NNYnZNTWE5Vi9ndlRsekFu?=
 =?utf-8?B?UkZTNVpGVjZaMFpMNXhvVWU4RGZJMGZ5U01DbEI4K200QkxWM1FqekdXNmRH?=
 =?utf-8?B?ZllBaDQzNnpRY0I5OGlJZFB0ZklLRm43Z2tpNE9SRUErZCtJM09ENGk3dCs1?=
 =?utf-8?B?S21UWVRwQnBGK0RTNGg1L05vVnlSNE9oMVRoR2Y2bXo3WEdMZ1ZMaFpVTjV1?=
 =?utf-8?B?WnFCdUNLaFcxekI0WWZoZDdOWGI0dkgvNU1IdzBlU1VIZTA1aE85M3E5dTZp?=
 =?utf-8?B?cHlKVTFOWXhJK2t1VEkxaWtBdCswU2Q2WHcvdkpxUSsvc2RwUHI0L3RKOHhT?=
 =?utf-8?B?aXFVRlFBdGVQTmcyR1MzS0NwUXNNY1oxdjZOdGM3OXlMZUVqRUNLRm5zcFF5?=
 =?utf-8?B?d1RWYzZMNUpBS2tnbmVSYVlpeXcrU3BHZ1ptOHQ4MDhncTJ1QUcwYW0yTDZu?=
 =?utf-8?B?MHpxNmJQZXc5ejlUNFJ4eEF5ZFpyTUVYZlE4NXNTQmtXZ0h5U0VWc24vUncw?=
 =?utf-8?B?Rm9Ca0JmdHh3OXRwdWpSdUNZZGNrUERpUXFSUUZhUHp5VHBWRFBvbytkSG9y?=
 =?utf-8?B?cnlNRUp4RzIvN0Zhek0raGplNXkwdUNSR1hFWVFJYzMybllOeFExdzZQY0pO?=
 =?utf-8?B?djZEUENOU3Q5anRQUTNMeEU5NlYrYmk5V0FNT01ua0JBTDVlbElyRnVScko0?=
 =?utf-8?Q?8jXJjiqEWGXBpfWFEbMsilWqD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bafdca05-e3a1-4619-5c62-08dd5c2c8525
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 21:27:24.1663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xW+iIhItcWvaE2kQeTWcq4p4vZ5asqyF210vtoNQbKSK0FdZC1IPkqh39yWt2HBox0koSdD93ACcCxVvGZAFTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8270
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


On 05.03.2025 08:15, Christian König wrote:
> Am 04.03.25 um 16:39 schrieb Lis, Tomasz:
>> There was no NACK, and no further questions/comments for a month.
>>
>>  From that, we conclude that the proposed change is considered acceptable.
> Well there was also not any comment from Arun nor Matthew who are the de facto maintainers for this particular code.
>
> Saying that the whole change looks completely unecessary and overly complex to me.
>
> Just maintain the offset for your VF separately to the drm_mm nodes and you don't need to change all nodes any more when that offset changes.
>
> Going to comment on the other reply as well.
>
> Regards,
> Christian.

I will make sure to add Arun and Matthew in the further discussion.

On 05.03.2025 08:18, Christian König wrote:
> Am 05.02.25 um 17:02 schrieb Lis, Tomasz:
>> On 05.02.2025 09:32, Christian König wrote:
>>> Am 04.02.25 um 23:41 schrieb Tomasz Lis:
>>>> This RFC asks for introduction of an interface which allows to shift
>>>> a range managed by drm_mm instance without repeating the node list
>>>> creation.
>>> What do you mean with "shift" here? As far as I can see from the code you just modify the start address of each node, e.g. you manipulate the offset.
>> Yes, that's the idea - move the address space to a different base.
>>
>> Should I use different terminology?
> Yes, absolutely. A shift is usually something different than an offset.
Ok, instead of "shifting a range" I will refer to that as "adding offset 
to the range".
>
>>>> The long explanation:
>>>>
>>>> Single Root I/O Virtualization is becoming a standard GFX feature
>>>> in server environments. Virtual Machines provided with direct access
>>>> to virtualized GFX hardware, in form of VFs, need to support the
>>>> standard set of features expected by Virtual Machine Managers.
>>>> These standard features include ability to save the VM state, and
>>>> later restore the VM, possibly on another machine with different
>>>> setup. For the restore to succeed, the GFX hardware model must match;
>>>> but for its configuration, some differences are often allowed. Such
>>>> alterations may include a different range of non-virtualized
>>>> resources assigned to the VF, including global address spaces.
>>>>
>>>> If any non-virtualized address space is saved, as part of VM state,
>>>> on one machine and restored on another, it may happen that the target
>>>> range differs from source range. To shift the address space,
>>>> currently creating a new drm_mm object is required, and moving all
>>>> nodes to the new object while adding the shift.
>>>>
>>>> GFX hardware handled by Xe driver contains Global Graphics
>>>> Translation Table, which is an example of such non-virtualized
>>>> resource. Should this interface change be accepted, a series which
>>>> utilizes this interface in Xe driver will be prepared.
>>> Well that sounds exactly like what AMD is doing, but we just add the VRAM base to the MM node when calculating the final address in the MC address space.
>>>
>>> On the other hand AMD hardware has different address spaces, e.g. VRAM in page table always starts at address 0 while in the MC address space it has a certain offset which differs from device to device.
>> We use the drm_mm in a similar manner - some address spaces start at 0, other use a narrower range. But we do not add any base after creation - we have the nodes at final offsets.
>>
>> There is one more technique we use in few places to restrict range of valid addresses - we create "balloon" nodes which fill up the inaccessible areas. When the accessible range shifts, we then remove all notes, and add them back with balloons resized and the rest of nodes just moved by an offset.
>>
>> Using the function proposed in this RFC will actually force us to abandon the ballooning approach for VF Global Gfx Translation Table address space and refactor the code to give only the accessible range to drm_mm. That is why I'm sending the RFC without use example - we will have to refactor the Xe code to use it.
> Well that approach looks overly complex to me.
>
> Just maintain the VF offsets separately to the drm_mm nodes and apply it in your address calculation whenever necessary. That's basically how all other drivers do it as far as I can see.
>
> This way you don't need to update all nodes whenever your base offsets changes.

My current implementation, without drm_mm modification, involves 
removing and re-adding all the nodes. The proposed implementation makes 
the code simpler, not more complex.

For maintaining VF offsets separately - this could be done, if 
Matthew/Arun agree to this extra addition within Xe driver. However, if 
that is the preferred implementation, then why the `drm_mm_init()` 
declaration contains a `start` parameter? Do we really want to have 
support of offsets within `drm_mm`, but keep the support incomplete?

Are we sure that the other drivers you mention, went for a solution with 
extra offset in addition to drm_mm `start` offset because that is the 
best engineering solution? Maybe I'm missing something, but a solution 
with multiple offsets stacking together looks to me like a workaround. A 
workaround likely introduced to avoid spending the time required for 
discussions and finding an agreement about improving the common drm_mm 
utility.

Well, let me know what you think.

-Tomasz

>
> Regards,
> Christian.
>
>> -Tomasz
>>
>>> Regards,
>>> Christian.
>>>
>>>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>>>>
>>>> Tomasz Lis (1):
>>>>     drm_mm: Introduce address space shifting
>>>>
>>>>    drivers/gpu/drm/drm_mm.c | 24 ++++++++++++++++++++++++
>>>>    include/drm/drm_mm.h     |  1 +
>>>>    2 files changed, 25 insertions(+)
>>>>
