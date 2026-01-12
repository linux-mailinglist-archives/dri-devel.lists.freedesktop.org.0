Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92536D13B69
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 16:36:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00ECA10E405;
	Mon, 12 Jan 2026 15:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHZ9kBal";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28F210E404;
 Mon, 12 Jan 2026 15:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768232166; x=1799768166;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=zF1DkxAyIUXLZB9eWQtBb31KSqCR4dIV+4XNheST9uI=;
 b=EHZ9kBal7/UAmU+b6iNqsEpqQy9kzzdpAxII7HL8oirKOpmyvuRw9dJW
 YQ2wXMaJeGc77Zlgd4v/Arodbd4y0/GhQq+w4JGaJcwWqh1B10J2CTGeD
 AY1k+WaRlNKWLL7ELAoJdt2EB67W6tiAOXB99JXe8zjknOO/horJcqvdF
 C8nrUmiqGlU24RrqgFYmPApO8iPzhUqLkyFdEWZtt39Mha/qZXrt0MNe3
 F9+D1ut+v4New+3VhXh5l+2g+rXF36wyuy6IlTKWK4D/ojw8rU9QQZLKE
 8N5t3Gapksm1/M7tZWeMFYVrOUsWPaspRJ1ccYOy3snQZu7nyuUYn5pF+ Q==;
X-CSE-ConnectionGUID: xHJMZ9NGQK+JVT1b8MP3rQ==
X-CSE-MsgGUID: YPin2WH1Q5e77xgcik696Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69433662"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208,217";a="69433662"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 07:36:05 -0800
X-CSE-ConnectionGUID: 9twrJM3iR4iCZYakWHnz9w==
X-CSE-MsgGUID: jfABIC3oSmqdV1vvMbt0fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
 d="scan'208,217";a="204131446"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 07:36:05 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 07:36:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 07:36:04 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 07:36:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yg/zgA/csE6f5LN8cAABz+XH+7qKO/8+B8OLf/RQaAUFTAu2JhnV6VDylVsAglLH0ym8vyEu0GxkaIi/f1jsY8lEaTwKEyuxIEPjxCP5xH7wxSqzsCezBQG2FYFre2kayau2/Jh1kEmdQpH2cow5WACnDPLmFzqo3CoreL+zKFNXVYQdzPxYJeuwHCU6Gb6RScHp1YehLRLp9NpJw3BBHXu2jhGhrUqnoRdIIZSuvwpRCTL/lg89X5xBpB6nUD5ZJHNRviJFBZjnPcKViLVD7JblgfeSthfGE2SqrlpBkDZcPqTTgIPehKjgG5xHuXQvxfomxqvdWcy6TCygRIYs3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mURBH0ZI6FDqzU/+9FCDKSRkxpXUzwwBuaD7aVsd0ZU=;
 b=oQrF5zWVX7QOE5D9jO8j75OM2GIztw9EDF7mSeyZxAKwUDKpOwrQi8TbN7D5jHyUCrc6DoHC7ViFMeHMH/9EqBN72b6KmVQSJGSad5yCeem9ajJ4dbmSpDxj2FtqeNu8EjL+KNXR7N8ySBwuMtap1rjthh12TjOe5GVeQhkn0cC3pm9+Da2KDKP5x4s5IyVSlAMHdnrNmTGfjYRLYXZUImNSVxHY2AGJ3TXEH+riHWvnIqYLhKzlWSTB7PchcJdCRDUTePhtt2XVCKpfCFqNI36knarnK4eAoIorqwWyx49WhcqVxcR4Sij0e7e2qCFSfXTdj/Oh8BnSJjWJkmwC/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 15:35:56 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 15:35:56 +0000
Content-Type: multipart/alternative;
 boundary="------------Thbv48VBtzFpN4EYmpNUXVI8"
Message-ID: <a9256cba-0b27-4f46-98ec-49d9da19f289@intel.com>
Date: Mon, 12 Jan 2026 21:05:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 0/7] Async Flip in Atomic ioctl corrections
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
 <342abb15-95e6-4ed6-8b86-a900c0f403a4@mailbox.org>
 <IA0PR11MB730722B84E81A0CC9BF80275BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <d1e6ad38-06bf-4139-966d-312bc728225c@mailbox.org>
 <83e50bd4-de11-4298-bab9-7a5255b0c5ca@intel.com>
 <dd0a089c-6591-4fc3-b14e-5acc1c59cf8e@mailbox.org>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <dd0a089c-6591-4fc3-b14e-5acc1c59cf8e@mailbox.org>
X-ClientProxiedBy: MA5PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::14) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|MW3PR11MB4602:EE_
X-MS-Office365-Filtering-Correlation-Id: 4644d789-59f8-4510-c1ec-08de51f04724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007|8096899003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YThITktKbS8rNTNLdVY1RzBKY3JBRytWdElRN2lZT245WG1DcWt4R1hUa29D?=
 =?utf-8?B?N241QzdNNlNkT0ZjTUhwZXJGU2tIbStGRW9taGMweDNobzVBVEVQY1poZXV4?=
 =?utf-8?B?M3psbVN4akpKU2tLdnJaZ2dpRkd3ZmlNL3YxaERkSHFDYUZaV1Nmd1p5SEMy?=
 =?utf-8?B?OGZ0QkJIbWppa0VPWHhXT0JVbVVKTEZ6MVkwWW4yTzIxQ2dldkZOSmRFdmtn?=
 =?utf-8?B?WGc0WU5kMU9XU01UQVJYMktLU2E2Mzl6OUI0cnRnOE5iQWZ4RUZzSU1NTE9X?=
 =?utf-8?B?VlNFbUYxK1pneUp1ZWVQdzFNa1doWGFxSi9oUXhjWVdVYmRnWitkL0Jnc0ZN?=
 =?utf-8?B?NHZFWW1SUWFRcHArN0RFUU83WG5oVFFxRnhQa21wSDE4ZVdYN000ang5c1Zs?=
 =?utf-8?B?WDV1YjVEeGVJaWwzOHY0NytEMmg5VWV6bngyalpDa2NRa1l4dUtnRWswZm9U?=
 =?utf-8?B?QUUzVnlvMCsvMWdvNzMrUWx5T0EydHhKZC8za2dPQlhpcUw2bUgwOUN4Q091?=
 =?utf-8?B?bjJFNWtNeWlTVVloZUQzODRXNWpmWVVHb0JHWkkrZWFia25xWlFYaDhOWUZ6?=
 =?utf-8?B?Vk4rSERuMGlIYkpTbDZidDdQWVdzQ3h5enBCbEpSVTliRGwzRDkwR01qNlZH?=
 =?utf-8?B?eUU0aFNZL0N3djY3ZDl4Y09XSEFnRnoxcXp0MUt1enNQcmpWMEs4UC9Ka1FI?=
 =?utf-8?B?dmFaL3hRWFRBdy9Jdjl0czc4ZnB5eGxCZHBsSTJtTXBrZzl5WHE5V2NRcU91?=
 =?utf-8?B?NHBVWkVncXA4VTh0T2pLMG9tUjUyNFhISXoyZXpjUGYyamhlWThRMThOcHVU?=
 =?utf-8?B?T0tQUGtHbWRUOXFrYW1TMmZiay8vaG95S2lUamNIa3Z2TkN1QS9DZCtiWmNo?=
 =?utf-8?B?VTJKYk0vcGdFMjhQU2crUFB4eHJDY24vRm5VN0c1NWlBK0h5bEE4MldVbUQ5?=
 =?utf-8?B?dXUwZmQwMjVjekhvWENYa0ZOejFLVXNnRXBkVFFzb0xVWFQrREdtZTRwOUE0?=
 =?utf-8?B?NGhLYWxxaTFSMTBoOW9nR01XODBZSERxVmtmaFZTQkN1UTVqZ3I0aWhJeDha?=
 =?utf-8?B?cm5yRXEyWFV5SGtqNE5NdkNuV3ZmTVEwMjJNZHNOUEZvZnpRL2trSVFaUEVS?=
 =?utf-8?B?NEM3blMvN1pOQkwrTXBGV0dUQ1NKUWc2b2VKTWRoMWxSc0RtLzR3K0pGNnFN?=
 =?utf-8?B?d00xVDhKWE1GK0FtN3R4M3pVRkhPaUhOK2ttY1R5QXJhQm5mWjVra01lWXZi?=
 =?utf-8?B?amU5amtIWlRaWUJlSnBPR2tDcENhbWtueEtkWHY0dVYvR3hPYm8yREs0bURU?=
 =?utf-8?B?aitqQUp5amVGM1F0VXdpMm5penhEQW5meUNXVUJabE1IRzh1L3B2cWlrcTFz?=
 =?utf-8?B?d2M4dHJncWMvNS9ENmtoSnpMWHRXNmZUM1oxNUFwNVlEZHJWSkR0Z080WDZY?=
 =?utf-8?B?VmRzL2cwYllUQ2hGQmx0Vkh0cXh4dytPSUVsN2NiTkpjL1g4ZnRubDM4VGsx?=
 =?utf-8?B?TmFOWDJsMjMyM0UzWU5KeGhQNmx2S3BOdGR5ZVFJVDh2d01iZkxTdFNac3NC?=
 =?utf-8?B?R0ZkdUxOYXB6YkN6M3RCb2FOTEsvNURwNC9TQnNLUkRhN2t1YnVzdzA4WVBm?=
 =?utf-8?B?S05HbHI2Y2pHdFZrOTdzTkg0VkhIUGV5NjBvRU5PZVJnc2tRaUZNam1WeWw0?=
 =?utf-8?B?TmRQNkpvWDBBclo5M1VVSlZxZ3AzcitXL0szNVRWUWphSEFxakp1NFdnY25W?=
 =?utf-8?B?T2JVUUJYVWtwNnpZZTR1anY4UUMzM0x6VFRNOG1GaC9XWEZIeVNVbmoySHB3?=
 =?utf-8?B?MWFmcmhBRGc3bnh3OTBsaXdzc1ZoUG1VdlBzZXMwb3dMRjF4ejMyeWF0dVlu?=
 =?utf-8?B?WWZ1eFY2KzZ6VXhEMjV1c2RkdzhJNTR4K1VKY2h4RWxGR29Ienc2WEFrNDhx?=
 =?utf-8?B?Wm5UaStqQ3Y4OTdER0liZW41VlhBNGVhWDNZM2U1SXk1Q01WYmNZaGZZSUJT?=
 =?utf-8?Q?PYNvT2YDdcR19+CV+ZWhuAzi9fyX6E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(8096899003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WktYYTlZVWNxTEF3akZhNWh1UVFheTlsVDNkMU4zVy9TT0xjVVFneXpORjRa?=
 =?utf-8?B?dEg5eWFONmZYdzV5Wm1OME1YMmxMK0ZUNnRTZExQMTFMcEV0RnNYTElrckVj?=
 =?utf-8?B?dnEzNzNlbDdmdmIvK0poeEsyZmdSN0RlcHUvOGIwdmdGRlRZZXgyL01FS0po?=
 =?utf-8?B?TU1PTzFBaldicTBJaUJUZ2Q3akt6N0VLU0hEcWUxTFdGeElNYzgvc2ovZ1kx?=
 =?utf-8?B?REdIRC9zTTVneDdvSzNrNUZKK0NCMk1tRFFLTFZBS1JFaVlqR1Nac0hkS0Z2?=
 =?utf-8?B?cW1mQTgzN3RmUlBCZmFrVGVlOGYzem96T1dqZXNYRjdkUGNMc2gycFhoSkZO?=
 =?utf-8?B?RVVPcVRjVGR2VExub3NzUFdZUkJkSGI2b1ZlTmpDTTFvQ2RoNVMxZ1VIU0dD?=
 =?utf-8?B?Zm9DS3JzVXd1TWZENnhGMnpsRDF3eUMxU3dQaDlLVUgrR29hWm0zd3NkYjhD?=
 =?utf-8?B?Q21jTmtWVDFyWjBMSUR1aTVZNUlTNGdSVUJiemw1Mlk3U1ZEaTd2Y1JMc1dq?=
 =?utf-8?B?RUtOekxMTGN1VDVoVk5rS1ZITGVWaStnaDdabW5xQU1FN0s5TUFpcS81dFRT?=
 =?utf-8?B?M2dYVUw4TC9rOHNHVk55MDZsRlNNQTJRZFlQZUNRN1N0QXF6NUtTTE50OTJR?=
 =?utf-8?B?b3FjS2J2UFZzbWxGVVFaNkxPWE1zODljbStkeEdadkRpdnZhY3k2OXJaY0J6?=
 =?utf-8?B?ZlhCeUkrNVhLN3JTd1l1OXhNWUFmSmxSQ3grVzJEcmhXbGdzaGNmdExHcEo1?=
 =?utf-8?B?ZTUrWE52dHJ5QmhRY3F0bnUzR3pOUFhsOXpsQU1nU3JwYlplOElOTy9JVkdG?=
 =?utf-8?B?YlZKa21RanBUMWMrWk5WS2FWNkpKRFpLVVZlaGdNRlJ1UUx3UW1aNlhlaWdm?=
 =?utf-8?B?N3NlbWtFUHBiL0FKdVZGZXl1c3BjeVd3WDhOQTdyekVPeG5NTUlPZGgyQ3lR?=
 =?utf-8?B?VjY0R0o4TGhtMXdURmlKU2dYQ1lOYmVGR2U3L1kyeHJndlNxLy9mbXBGQjFH?=
 =?utf-8?B?Qlk0aXc2N2hjcnlRZUJyR1orRUtvRzVqTlo5NVVoa3lGd2lRenJ1cXVaK0pL?=
 =?utf-8?B?K1h4aDNsczExK2RyNlFrb2U1NmdZM2N3OVVrZkhYM3VKdjRnNG01R0xXc0Zo?=
 =?utf-8?B?RmpKaDFBdXJXbjR0M0VUOUhGTEk5dzNoRUFLenAzVTVQVjhyTzhYUFVQWXlC?=
 =?utf-8?B?bFRXYUNoSVN5REpMZldubzF6QVRZdE0zcXIwVmp6VUJWZjJzSTVwUC9tQ1Jr?=
 =?utf-8?B?dVhuUUpvL2F6WmdHRktsRzZrcWgyVXJLMjlpUENHR3gyQjV6dDV1UHVGanY0?=
 =?utf-8?B?UFpoZ2p0K1VTODRPYkpVV0dUTDJWU3FraDgvU2Z0LzBEQkFRQmtERWRSYmdv?=
 =?utf-8?B?a3dlUFl3SnNoblBDcVlHNTl3L3FheDVhYkdpRnUvYUttUWJYc3JjM3poUEJi?=
 =?utf-8?B?ZFh3MEdSNHdQMnRJVmh1YXNWV3dFY1h2SUE5VnlZTE5RWXF3UnkzcmNNNzBr?=
 =?utf-8?B?ZTQwSVorOExkUW5JVDZzL1A5MGppN0tFU21DZzVYa0xySm40WnBmNDJIRk1V?=
 =?utf-8?B?TzZlam9GNFdYMjJhMnpHaUtoeVpuc1BaRTBwQ1VSV0VESTJMTUQ5NTJEcFpt?=
 =?utf-8?B?cmZFWlFnZlg2WXNZTXJmazVacVNoUHZXNjdRUzMrMnVzY084OU9TSTZUMWFh?=
 =?utf-8?B?SnBsZGxreHRkNFQ4ODlONHZhWld4OHNaZjEzWGNkMUxMZ25LWjhkVnVZTk5y?=
 =?utf-8?B?WnlnS1VTZGhQd294R2MvNWZoaHBOcFFNM3Z6TUdTWTYrOEVBcGRQZnR0QUFB?=
 =?utf-8?B?VjlBTzFsV2lIbzcrN29mbVIvT2dPY2RCRlVTS1NHU1ViYU52R1YvelQ2bHFv?=
 =?utf-8?B?ekh1RG93UElRTDhMc0FLeUhmdE9MQkpET2k2MEJIZ1ppMndRZEtDaGNNa3Jp?=
 =?utf-8?B?cmNSa1JlTUVHTTIxVldHUU52SWJPdHZ5a1Y0d29kR0RhNDBKdVhJZ1U0eGU4?=
 =?utf-8?B?MWFGYWYwdE9iNlgxOXBWTUpMQitMNllqQTc0MlZ4azNjVkV0c3FrbjAwMjh6?=
 =?utf-8?B?YTNqVDJCblB4SHhvVWFyN3htOWFpZGk3QndmYnllVCtIVU9iNVBBK0kvNSs1?=
 =?utf-8?B?RHhVVlRBZ2t5Y3l5WUdjblVmU2J2RlhqemhWVGFKZWh3QTdXZG9iODUzWjZj?=
 =?utf-8?B?ZGRQQnJQVjROQkZYZndEOW1hUVdPb1NzazZSU0pMcVhIMHJQcExWN1lsT0l6?=
 =?utf-8?B?Z3FnWGRQYzZvZEFHQUJGZ0gxVC9mUlBlVTRWajZzTFpad1FBdGtMUWRRZEY4?=
 =?utf-8?B?ajRub1VNNHFkVUllSkZ6ZzlpblcxR29HZVduT0xGVEVGcCtCekpBUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4644d789-59f8-4510-c1ec-08de51f04724
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 15:35:56.2343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jyQ6uWioNEwuM9BJ8lETg7Myxvk5/fnCP2VkbWSqDaLv+6M5RB2PzUMJ/TYo4zjjys4/V1x6D3S7xy8M+jiziw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
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

--------------Thbv48VBtzFpN4EYmpNUXVI8
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 12-01-2026 17:04, Michel Dänzer wrote:
> On 1/12/26 09:23, Murthy, Arun R wrote:
>> On 09-01-2026 16:52, Michel Dänzer wrote:
>>> On 1/9/26 12:07, Murthy, Arun R wrote:
>>>>> From: Michel Dänzer<michel.daenzer@mailbox.org>
>>>>> On 1/8/26 10:43, Arun R Murthy wrote:
>>>>>> struct drm_crtc_state {
>>>>>>           /**
>>>>>>            * @async_flip:
>>>>>>            *
>>>>>>            * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the legacy
>>>>>>            * PAGE_FLIP IOCTL. It's not wired up for the atomic IOCTL
>>>>>> itself yet.
>>>>>>            */
>>>>>>           bool async_flip;
>>>>>>
>>>>>> In the existing code the flag async_flip was intended for the legacy
>>>>>> PAGE_FLIP IOCTL. But the same is being used for atomic IOCTL.
>>>>>> As per the hardware feature is concerned, async flip is a plane
>>>>>> feature and is to be treated per plane basis and not per pipe basis.
>>>>>> For a given hardware pipe, among the multiple hardware planes, one can
>>>>>> go with sync flip and other 2/3 can go with async flip.
>>>>> FWIW, this kind of mix'n'match doesn't seem useful with current UAPI, since no
>>>>> new commit can be made for the async plane(s) before the previous commit for
>>>>> the sync plane(s) has completed, so the async plane(s) can't actually have
>>>>> higher update rate than the sync one(s).
>>>> That’s right, such mix and match flips will still consume vblank time for flipping.
>>> Does a plane property really make sense for this then?
>> As per the hardware this async flip is per plane basis and not per crtc.
> That's not really relevant.
>
>
>> Not that I am trying to clean up this. Recently AMD added async support on overlays as well for which  few other hacks were added. The checks that we do for async flip were all done in place of copy the objs/properties, but it actually is supposed to be done in the check_only() part of the drm core code. This was the limitation with the existing implementation.
> Those implementation details can be changed without changing UAPI.
>
The existing approach ends up adding more and more hacks upon addition 
of async feature enhancement in the driver.
One such example is the recent patches from AMD for adding async flip 
support on overlays which adds more and more hacks in the property/obj 
handling code.
This was just an initiative to clean up the async feature and handle 
async flip in a well designed way.

I will leave it to the maintainers and other reviewers to comment over here!

Thanks and Regards,
Arun R Murthy
--------------------

--------------Thbv48VBtzFpN4EYmpNUXVI8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12-01-2026 17:04, Michel Dänzer
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:dd0a089c-6591-4fc3-b14e-5acc1c59cf8e@mailbox.org">
      <pre wrap="" class="moz-quote-pre">On 1/12/26 09:23, Murthy, Arun R wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 09-01-2026 16:52, Michel Dänzer wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 1/9/26 12:07, Murthy, Arun R wrote:
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">From: Michel Dänzer <a class="moz-txt-link-rfc2396E" href="mailto:michel.daenzer@mailbox.org">&lt;michel.daenzer@mailbox.org&gt;</a>
On 1/8/26 10:43, Arun R Murthy wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">struct drm_crtc_state {
         /**
          * @async_flip:
          *
          * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the legacy
          * PAGE_FLIP IOCTL. It's not wired up for the atomic IOCTL
itself yet.
          */
         bool async_flip;

In the existing code the flag async_flip was intended for the legacy
PAGE_FLIP IOCTL. But the same is being used for atomic IOCTL.
As per the hardware feature is concerned, async flip is a plane
feature and is to be treated per plane basis and not per pipe basis.
For a given hardware pipe, among the multiple hardware planes, one can
go with sync flip and other 2/3 can go with async flip.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">FWIW, this kind of mix'n'match doesn't seem useful with current UAPI, since no
new commit can be made for the async plane(s) before the previous commit for
the sync plane(s) has completed, so the async plane(s) can't actually have
higher update rate than the sync one(s).
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">That’s right, such mix and match flips will still consume vblank time for flipping.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Does a plane property really make sense for this then?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
As per the hardware this async flip is per plane basis and not per crtc.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
That's not really relevant.


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Not that I am trying to clean up this. Recently AMD added async support on overlays as well for which&nbsp; few other hacks were added. The checks that we do for async flip were all done in place of copy the objs/properties, but it actually is supposed to be done in the check_only() part of the drm core code. This was the limitation with the existing implementation.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Those implementation details can be changed without changing UAPI.

</pre>
    </blockquote>
    The existing approach ends up adding more and more hacks upon
    addition of async feature enhancement in the driver.<br>
    One such example is the recent patches from AMD for adding async
    flip support on overlays which adds more and more hacks in the
    property/obj handling code.<br>
    This was just an initiative to clean up the async feature and handle
    async flip in a well designed way.<br>
    <p>I will leave it to the maintainers and other reviewers to comment
      over here!</p>
    <p>Thanks and Regards,<br>
      Arun R Murthy<br>
      --------------------<span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------Thbv48VBtzFpN4EYmpNUXVI8--
