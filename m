Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEuaDw4ucWmcfAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 20:50:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E082D5C8D4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 20:50:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0803A10E87E;
	Wed, 21 Jan 2026 19:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VWJoFZni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012038.outbound.protection.outlook.com [52.101.53.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF2F10E054;
 Wed, 21 Jan 2026 19:50:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHj6NuQ+ofKey7KbDto2XqObARQ3/83OlhfXNy75N0VvLQYyljku/BL4YVmQEMIp+dLrY623V7xouTykCrBCXQOkdr2wH1d8yTHiLNHVkiMfrz296YAnQSK4r2lpntud/RGNgVKX+TscBTGwtjGINe13XTRf8sYIeR0Kg9K2/Od2fGcI5I6g7hkdfS51jp9iKk/xzhPXKluWjj51DRRdVUtbbKazHe7N911JQ3fSteap+jiekWVOu95oYLsp+ohngBf1JUQdSa1rYIcdYL0IfTi+pn5igpbOs9vL/uFLy9gP2IFrSIWysOQwSA9XQv6kWSDt/MVDl7YMtduns8hwxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8rMqGV8ZpQnx8wUYVJgMX4bwDEpxL8eEt9v9uRbIcA=;
 b=D4KDvK9nUkjSOpOJuUm9LyXEzrED1aE8LQS+LRgpJWkAD0YELZ47zUDqX2xsbwP6ZfBb14G0T4y0zDNcwjrdVIlgK1txwJpw1GKdWnqLs4w3SFrByiZN1VoCvM14h472XPMgYwyZxthapHEZ2K3Vcwl4f6dOiYFzyKdVeNSwWrQWfgdq/eHX5FafYVuySgr2pxY1jOMSqpQLCGqq/dTjS5IFYpicZ0tdEOU2tlE4Kz+zJaMXxI6uK6EymZkoJPWx4ZasX0ZBZdNB2AQ6qK/me4QVka/t/wzMUQLcSb569uFzIgb7HgIMHGzn4HhILdpBhygJ9yI/v4iDxqlMVAr9KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8rMqGV8ZpQnx8wUYVJgMX4bwDEpxL8eEt9v9uRbIcA=;
 b=VWJoFZnimeV0IvvJskDZqBleGnLaGaISwA1exT49OyeQ0lFbA1fVyOB4/xhlX4c27yCNkrmgsusZyw5uh32bJBj8i4tk1ia0kGxJk+oT9zOTS+RZFDwOERM915wlI70g2QvS2c53IbiJN3B9z1TZlePuxt+sPde2yRToVOuncMw86HjTtYL2L6wA4BqHhT5fScKbshPcj2CLC055PfpB8lHb+G46Ts+oj/1pemhPQOJ7YtTtzWEtrZbhBHIdJeSbXJxUa9uk9yzR7Hbw7v0NLhwYGHu0YiYNHAt5O4g8f59zxIRUnvkNgUhl2S+/alrDBrsgEQpYcswKF10tHHJ4Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY8PR12MB7490.namprd12.prod.outlook.com (2603:10b6:930:91::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 19:50:26 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 19:50:26 +0000
Message-ID: <01a981f1-64c7-4504-b309-45a024258fe9@nvidia.com>
Date: Wed, 21 Jan 2026 14:50:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 01/26] rust: clist: Add support to interface with C
 linked lists
To: Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-2-joelagnelf@nvidia.com>
 <DFTTGUYGY72V.3VLVSCB2OOXIB@garyguo.net>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DFTTGUYGY72V.3VLVSCB2OOXIB@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0079.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::24) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY8PR12MB7490:EE_
X-MS-Office365-Filtering-Correlation-Id: c1caae2c-4216-42ee-9713-08de5926522d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEZRbmI1d2hLRzFZbEZJRWhteHNIYStFY09teTBJMWlVYVB6dGdscCs0amlO?=
 =?utf-8?B?M2hFWHltZjZQQ25UaGlXTGhUN0VFZU44cjFGZGhybXAxbThQajRPYnM2aHR6?=
 =?utf-8?B?bWlVTlRYUDA4Q09pS2o1YXlVSFloK005cGU4NTNORjE4cUt0b2tLL0t1T1J5?=
 =?utf-8?B?Z1d2d0EyQmlZZXU2eG9ManFCWDBQMzFtR0lkOVRLSTNCQzhqQ0d1am01RDBr?=
 =?utf-8?B?cGJRRFk4Um5mU2gzaUlDMXkrSkM2czZaaG9xNmJCZVZwVTlEZEx5UHBjWW1h?=
 =?utf-8?B?bWpmNG5jMFZ2eE9kSXIzWFBKTEFzMkVGeElOK1lLVXo5RlJORjFKTzE4QWtm?=
 =?utf-8?B?aFpRTGpiMDhNWjNyWkJlaHFRQ3lhUjhySzZWMHFnSTVXTWFpLzVqek9BRkVn?=
 =?utf-8?B?b0cxbm1SUHhtKzc4YnBQb01EZVhaLzZ3WTN0VEhmU0xzZ21WZzBCL0tXaGhw?=
 =?utf-8?B?NTNobFRURFgwQzlxZlBlZXZHRXM0NEdjVUJucTlMODE2cmVzQ0o2ZGpuWi9X?=
 =?utf-8?B?blFjM0hPS1NCV2RqOWkwNmdpVWVDQU1uY3FwTEZQa2QrRFp3enRpWmVMcVM5?=
 =?utf-8?B?VFVzWmJ5YTg1Q3dpaFNrKzgya2FWZmhTOVQvRmlXNlJnM3J3aDMyTXJtY2sw?=
 =?utf-8?B?L01Gak9MZkpCOUNaSzJwckhBL29CUHpxemcvajNDMWxwcWI5YmxRNThVUmQ3?=
 =?utf-8?B?YUVNYnRTNUtOcEh5dyt2c2puOW9id1ZPTG1pNXp6K2gzdlJ4RTZqZDhHbEdM?=
 =?utf-8?B?M0NtNzNTQzJPZ3hhdXJkUEVLSDh5TVZrU3VyNTFOYTBFcjE1b3MySGFuS1h4?=
 =?utf-8?B?blhBNUlCOGJxM1BKVllvdmFGTmhleXVDWk9KL1BTL2RXSnNRTHRJMlNVV2xF?=
 =?utf-8?B?MUNsSFAwUi9LaXRVUmlKZEw3c1laMUh6bkZMWnRxYlh0OEN2Z3hkRndKdWFR?=
 =?utf-8?B?Z250ZlVFUDg1VkdnVUhFRlNrb2QrK2c0ZVJPRzI2WVlmeWxXc0RBSUo4WUYy?=
 =?utf-8?B?WngxaG16cWltdXNIUlBrRmczV3NPOHhWazc1MmR5Mlh1clptcDcrNDFzbGhZ?=
 =?utf-8?B?L3BHRFhtRDNTdjE4YVR5UExFN0c4NkhSeE9jTFRXNktVTUtNVWRxblQ3REZU?=
 =?utf-8?B?c04yQzVsUjluTFBJOVVuY0o4OUc4WnJubDVoREl3KzFyK1NOUUZZRklBdTZi?=
 =?utf-8?B?Rks5endLUHpSdUp0REljeUtRcUJ2azVab20zWjFDRU5IVUFWQWt5MU1mem92?=
 =?utf-8?B?eFQ1SGFUVk11SlBBT1BMaDNaMHBuS0h3QXBmUU5tVnhoQ3J0eW96QVBUdUF6?=
 =?utf-8?B?bVc4L1FJU3MzYTBEUXkxcllTa3VXaHk3TGQ2R0g2aVZjUTFxZllGMVRpdGFG?=
 =?utf-8?B?cG5GTUdHVDI1SnNSK2V4a2VwZy9zcDVlaGgybUtIQllhaVVaVVY2YzdyOVFD?=
 =?utf-8?B?Y3lTUTh2NFZtNHEwcDE1d0lSTDlmTmxITTlCN2xkZzUyUUw0eCtFWDQwcVJo?=
 =?utf-8?B?cVY3S2EwQjIxMVUvVldKUHRrMmY5RUJ6VlgzSjBMVVFBNlFEMkl6RnZvTGJ5?=
 =?utf-8?B?RGl0OFljbUc3cllhUFM2c0loTWJWdlhNWDhBbEVBSUpRV01DNFkrRFdXa2Vx?=
 =?utf-8?B?SDBZWGcvYWwyR3BHMzNlUkc0Qm5od2g2Uk5WK1RRM2RUemNMOHVEeVp4WUJx?=
 =?utf-8?B?dkVhdmNlZEMvY1luWWtvd3djaVMvNnI3L1AyUmdmN0xicGtPUkRiQnhLMWFS?=
 =?utf-8?B?Q1Rpc01Oc3dTVm15NGZseHQrYWhkeTVOZkp5Zk1ONzY1WFV4b3grSHF2TlhJ?=
 =?utf-8?B?UjJXRHdnSzJxK205MTRwdzlHbXBVbnNjcTVlNW0rTjBYakpzbDFJdGJ2M2c4?=
 =?utf-8?B?a0RWZGN1L3NtNkxjSmxKZ3l4WU9GZE83cldhMVRBUnZyYmhyanMrd0EzaUs5?=
 =?utf-8?B?TzVDSVMzNEU0UlZ6Wjg4RUVacyt2b050bHZJeXpaY0hJVVZneEw1aXgzY0hW?=
 =?utf-8?B?bVVYcmNqd1FLYURxdVkyUTQraUhTeVVNN1Zjb3VkUUN0MStvYnV1bFMrS1pQ?=
 =?utf-8?B?RHRDOEpWd2tHb0RtS01INGs5L21mSFNwUUhPV2RvQlNKalJlZU9BUnYwS1g5?=
 =?utf-8?Q?kL/Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjA3RnBvdlV0QkNoVVFNN3U1b3U1OG5HdU5aRGN5WmI5MlIrMm9DYjVjT3Aw?=
 =?utf-8?B?Wm5ZRnJFSHFZdFFkTGlIVlVDRHlVZXBOdzQveEx1UXJ4bE45RlhXSHNoaHM1?=
 =?utf-8?B?ejZDQTdPMkR4WVBIUm5nQm1hN3hMTUtnd0RaMmcxc3pibmFTdTliWnVJV1Vv?=
 =?utf-8?B?VnZodUUyZTBTdGRkekZ6Q1VWWGdWMFd6NXIway9Ecmgzc2VOc3FKR3lJMG16?=
 =?utf-8?B?V1Z4ZFNxT2NITkxXMkwyVWZ0dytQNm9NeVRrNEUvQmN3Z2tsYTlmNjVTUFNn?=
 =?utf-8?B?elUwd1QvU0VsVVB2U3ZCVWFOTHdWaHlCdTQ0d0h2ZXpoOUJndEQzM0oyVnJr?=
 =?utf-8?B?TW1KQ2Z3cDJtRVpVNFN3U0piQll3SS9rM3pScFpHMU9xWkxyTHZHUHovNmdH?=
 =?utf-8?B?TXhXOW9VNWF6T2pBZ0ZXeTF2NnBDdk5haUpoMTQ5MjdlYnl3OWJiVVBBRHZS?=
 =?utf-8?B?VG5iS0lyeWZINVMrcS9pR3NvYTlCenZQRkdwU08raGJ1THNxbXZNU0hHWUwy?=
 =?utf-8?B?QVRoN3VUMmhxZlhzekFxMWR4WjlSZHI0QTF3c2hvYjhUQTMyYk5LakhMdHo2?=
 =?utf-8?B?TGo0NXdndnJZdGdvWFdmclpnRWNaalNJaFRRbHBOZFlUV0RaYzNGQmZrbWpT?=
 =?utf-8?B?VmdSZnF3NjF3T1BEa05hZExBRWI1bmNMZERrMWpudCtjdkRPN3c4TXJldlRZ?=
 =?utf-8?B?M1BmVk43SzJvM3RjWWhCOS9VeTY0dXRZTUtPVkVZTXlkWWswY0xzbSs0eExX?=
 =?utf-8?B?SDZXdEt1VTBDa1lNcXNadUNyWHFEc0VKWm9oSDJBRTJVTU9vMHpZVDgzUll4?=
 =?utf-8?B?Tm5rYjlsRGRXV1BUTjZQWlJxRDFrV3VPZ3RDV3d2Zzg2clRpQnlxZkVoK2xy?=
 =?utf-8?B?RFFVQzdQazAwL25YQXhtMXAyMGl5NVZTZXlDZjk2RXVTNGgvN2p6ZFRBZVRx?=
 =?utf-8?B?KzlTSElpRTV2enViUWZVUTFHeGJqQi9ocFlYODhDVXAzZGgxQnFSbDF4aG5N?=
 =?utf-8?B?LzdoMVcvV2UwZmdIMy9LdE0rZkFnS29rUHpVaGJZQWxFS3JFd050RmFCZ3ZV?=
 =?utf-8?B?QS9TV1pYeEsxV2JuRkR1VjdBQXFIOVJLOVB3My9XSXhQb0NrWXoySjZOdkU1?=
 =?utf-8?B?RFlKL0lFeENPWnZlYTJTZmxYTTRqM0JTUWlOOWFJeENIMzBnb3pKVWd6eWZO?=
 =?utf-8?B?R2NDYzRTTGJJYjFaTU1Jc1BmR2hRUk92WEFkSCt4a0J4TXdCNGlBcElXZXBn?=
 =?utf-8?B?NVh4bDRzOFJkVVl2UU9CRHBqbFkySGYwR2JuQlVUc2hwVE4xNlhhTzJoV3pY?=
 =?utf-8?B?VDlsMktsQXNSSy9kNmxTVVdjUnRQWXgxRzZCK3crTHJzY0pFL0RXRXJKL08r?=
 =?utf-8?B?K2t5ZHNMWGFKZFZrY3M3T2NPQ2hxVlpibDhLMTJLL2VHTExuWU85Slgvdzhz?=
 =?utf-8?B?a243Nmdab2dtZ1ZDTEN0NTNaaHNzSnNEeDhIWXBQNndaYVoySWduUk5qWlpC?=
 =?utf-8?B?Umx3a2p0ejlsVUtpUjJHUFlMWlRXZjY0elk3ai9PWEx4ZDMxRXBVd0hUYmhM?=
 =?utf-8?B?S2FLTWRtL1JJL1BNL1JkYmJDNmdKQUVzdEFvVmRQZE12UEgxUkRiQnVKZTBZ?=
 =?utf-8?B?bE9sQk1SdEFERFplTFpCTVpMOXU5VHFrZ2llM1VLYXNPV01GS2dkQXhnTW82?=
 =?utf-8?B?UUFTUWZZWm04ZTJRVWZiSlJkb25DNWlrVzkvbU5GS3U4T29tekVObkNEVmZM?=
 =?utf-8?B?K0RGRm1ycHM0bk9ValV0aURMZDlCb1Y5QWp4NUZJSUtNQXV3c2xvLyswaVNH?=
 =?utf-8?B?OVlFaEFaSGxxQ3J4V0tvR1hEckV2d0gxTTlDcFdnZmt4MkVIMDdURFZLM0h3?=
 =?utf-8?B?Q2VzaGViamtlWk9EVmFZdnIxT2lsUWJXZWExOWU3cDBRajYxN0FEbVdNOVgx?=
 =?utf-8?B?aFp5TkZoN0xtejIwaWRMblpFVkJhbXVLL3VXV29OVWNsdVhJaEdhdGM2cjd2?=
 =?utf-8?B?VVBkdkIwclJNeGZEekFpdVl0VGFMcUw4Z3RLNHhpNlRlTTgyUDZRcGhZVEdE?=
 =?utf-8?B?OXliNHlIUHQrMWJXdnBFc2pwdXhJSGdWNDl0RDFxU3ZiTGZra1R1WVUyOEJK?=
 =?utf-8?B?M2FWMzlPY2dIUUdkajk4RmhCRFhuNUxHZmVOdWowVTVzUDhpbldkbWkxNDk5?=
 =?utf-8?B?ZkpGQlBlUjRZN2t2dXhWWlVqZHNuN00rNFNpczdnODZCa1lFMnhDRnZ3T2ly?=
 =?utf-8?B?d0V4c0o2OTBuZzlxeTF2SnNjb0gxb3NCak5hMk11QkR1eTUrdXJZOXNseEQ3?=
 =?utf-8?B?bDNPYkJmSDhHdUNOcllBcnRuNXV5S3BXR1g4OG1rcFdGcmlJTkNYUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1caae2c-4216-42ee-9713-08de5926522d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 19:50:25.8389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGGQDHXegM/govv5MmPSk84x3VNEzCJ1cZNtFvIzKMVL0GDcoN8ksGJ3Zgf9e/csIN59xid+gHC+1GnmVhHazg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7490
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: E082D5C8D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello, Gary,

On 1/20/2026 6:48 PM, Gary Guo wrote:
> On Tue Jan 20, 2026 at 8:42 PM GMT, Joel Fernandes wrote:
>> Add a new module `clist` for working with C's doubly circular linked
>> lists. Provide low-level iteration over list nodes.
>>
>> Typed iteration over actual items is provided with a `clist_create`
>> macro to assist in creation of the `Clist` type.
> 
> This should read "CList".

Sure, will fix.

> 
> I was quite dubious about the patch just from the title (everybody knows how
> easy a linked list is in Rust), but it turns out it is not as concerning as I
> expected, mostly due to the read-only nature of the particular implementation
> (a lot of the safety comments would be much more difficult to justify, say, if
> it's mutable). That said, still a lot of feedbacks below.

Sure, the reason for requiring this is interfacing with lists coming from C
code. I'd see a future where we may want it mutable too (example, Rust code
adding elements to the existing). At which point, the invariants/safety
reasoning may change.

> I think something like is okay in the short term. However, there's an growing
> interest in getting our Rust list API improved, so it could be ideal if
> eventually the Rust list can be capable of handling FFI lists, too.

Yeah we looked into that, if you see old threads, the conclusion was it is not a
good fit for existing rust list abstractions. TLDR; it does not fit into their
ownership/borrowing model.

[...]
>> +
>> +/// Initialize a `list_head` object to point to itself.
>> +///
>> +/// # Safety
>> +///
>> +/// `list` must be a valid pointer to a `list_head` object.
>> +#[inline]
>> +pub unsafe fn init_list_head(list: *mut bindings::list_head) {
>> +    // SAFETY: Caller guarantees `list` is a valid pointer to a `list_head`.
>> +    unsafe {
>> +        (*list).next = list;
>> +        (*list).prev = list;
> 
> This needs to be an atomic write or it'll depart from the C implementation.

I am curious what you mean by atomic write, can you define it?  Does rust
compiler have load/store fusing, invented stores, etc, like C does? Sorry I am
only familiar with these concepts on C. Could you provide example of a race
condition in Rust that can happen?

Also I did this addition based on feedback from past review:
https://lore.kernel.org/all/DEI89VUEYXAJ.1IQQPC3QRLITP@nvidia.com/

There was some concerns around pointless function call overhead when the rust
implementation is already quite intertwined with internals of the C linked list
implementation. I do agree with that point of view too.

Also see my other reply to Zhi on this helper topic, lets discuss there too, if
that's Ok.

>> +    }
>> +}
> 
> I don't think we want to publicly expose this! I've not found a user in the
> subsequent patch, too.

There are 2 users:

    pub fn try_init<E>(

and the self-tests:

//! # let head = head.as_mut_ptr();
//! # // SAFETY: head and all the items are test objects allocated in [..]
//! # unsafe { init_list_head(head) };
//! #

> 
>> +
>> +/// Wraps a `list_head` object for use in intrusive linked lists.
>> +///
>> +/// # Invariants
>> +///
>> +/// - [`CListHead`] represents an allocated and valid `list_head` structure.
>> +/// - Once a [`CListHead`] is created in Rust, it will not be modified by non-Rust code.
>> +/// - All `list_head` for individual items are not modified for the lifetime of [`CListHead`].
>> +#[repr(transparent)]
>> +pub struct CListHead(Opaque<bindings::list_head>);
>> +
>> +impl CListHead {
>> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
>> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
>> +    #[inline]
>> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
>> +        // SAFETY:
>> +        // - [`CListHead`] has same layout as `list_head`.
>> +        // - `ptr` is valid and unmodified for 'a.
>> +        unsafe { &*ptr.cast() }
>> +    }
>> +
>> +    /// Get the raw `list_head` pointer.
>> +    #[inline]
>> +    pub fn as_raw(&self) -> *mut bindings::list_head {
>> +        self.0.get()
>> +    }
>> +
>> +    /// Get the next [`CListHead`] in the list.
>> +    #[inline]
>> +    pub fn next(&self) -> &Self {
>> +        let raw = self.as_raw();
>> +        // SAFETY:
>> +        // - `self.as_raw()` is valid per type invariants.
>> +        // - The `next` pointer is guaranteed to be non-NULL.
>> +        unsafe { Self::from_raw((*raw).next) }
>> +    }
>> +
>> +    /// Get the previous [`CListHead`] in the list.
>> +    #[inline]
>> +    pub fn prev(&self) -> &Self {
>> +        let raw = self.as_raw();
>> +        // SAFETY:
>> +        // - self.as_raw() is valid per type invariants.
>> +        // - The `prev` pointer is guaranteed to be non-NULL.
>> +        unsafe { Self::from_raw((*raw).prev) }
>> +    }
>> +
>> +    /// Check if this node is linked in a list (not isolated).
>> +    #[inline]
>> +    pub fn is_linked(&self) -> bool {
>> +        let raw = self.as_raw();
>> +        // SAFETY: self.as_raw() is valid per type invariants.
>> +        unsafe { (*raw).next != raw && (*raw).prev != raw }
> 
> While is this checking both prev and next? `list_empty` is just
> `READ_ONCE(head->next) == head`.

Sure, I can optimize to just check ->next, that makes sense. Will do.

> 
>> +    }
>> +
>> +    /// Fallible pin-initializer that initializes and then calls user closure.
>> +    ///
>> +    /// Initializes the list head first, then passes `&CListHead` to the closure.
>> +    /// This hides the raw FFI pointer from the user.
>> +    pub fn try_init<E>(
>> +        init_func: impl FnOnce(&CListHead) -> Result<(), E>,
>> +    ) -> impl PinInit<Self, E> {
>> +        // SAFETY: init_list_head initializes the list_head to point to itself.
>> +        // After initialization, we create a reference to pass to the closure.
>> +        unsafe {
>> +            pin_init::pin_init_from_closure(move |slot: *mut Self| {
>> +                init_list_head(slot.cast());
>> +                // SAFETY: slot is now initialized, safe to create reference.
>> +                init_func(&*slot)
> 
> Why is this callback necessary? The user can just create the list head and
> then reference it later? I don't see what this specifically gains over just
> doing
> 
>     fn new() -> impl PinInit<Self>;
> 
> and have user-side
> 
>     list <- CListHead::new(),
>     _: {
>         do_want_ever(&list)
>     }

The list initialization can fail, see the GPU buddy patch:

        // Create pin-initializer that initializes list and allocates blocks.
        let init = try_pin_init!(AllocatedBlocks {
            list <- CListHead::try_init(|list| {
                // Lock while allocating to serialize with concurrent frees.
                let guard = buddy_arc.lock();

                // SAFETY: guard provides exclusive access, list is initialized.
                to_result(unsafe {
                    bindings::gpu_buddy_alloc_blocks(
                        guard.as_raw(),
                        params.start_range_address,
                        params.end_range_address,
                        params.size_bytes,
                        params.min_block_size_bytes,
                        list.as_raw(),
                        params.buddy_flags.as_raw(),
                    )
                })
            }),
            buddy: Arc::clone(&buddy_arc),
            flags: params.buddy_flags,
        });

> 
> 
>> +            })
>> +        }
>> +    }
>> +}
>> +
>> +// SAFETY: [`CListHead`] can be sent to any thread.
>> +unsafe impl Send for CListHead {}
>> +
>> +// SAFETY: [`CListHead`] can be shared among threads as it is not modified
>> +// by non-Rust code per type invariants.
>> +unsafe impl Sync for CListHead {}
>> +
>> +impl PartialEq for CListHead {
>> +    fn eq(&self, other: &Self) -> bool {
>> +        self.as_raw() == other.as_raw()
> 
> Or just `core::ptr::eq(self, other)`

Sure, will fix.

> 
>> +    }
>> +}
>> +
>> +impl Eq for CListHead {}
>> +
>> +/// Low-level iterator over `list_head` nodes.
>> +///
>> +/// An iterator used to iterate over a C intrusive linked list (`list_head`). Caller has to
>> +/// perform conversion of returned [`CListHead`] to an item (using `container_of` macro or similar).
>> +///
>> +/// # Invariants
>> +///
>> +/// [`CListHeadIter`] is iterating over an allocated, initialized and valid list.
>> +struct CListHeadIter<'a> {
>> +    current_head: &'a CListHead,
>> +    list_head: &'a CListHead,
>> +}
>> +
>> +impl<'a> Iterator for CListHeadIter<'a> {
>> +    type Item = &'a CListHead;
>> +
>> +    #[inline]
>> +    fn next(&mut self) -> Option<Self::Item> {
>> +        // Advance to next node.
>> +        let next = self.current_head.next();
>> +
>> +        // Check if we've circled back to the sentinel head.
>> +        if next == self.list_head {
>> +            None
>> +        } else {
>> +            self.current_head = next;
>> +            Some(self.current_head)
>> +        }
> 
> I think this could match the C iterator behaviour. When the iterator is created,
> a `next` is done first, and then subsequently you only need to check if
> `current_head` is `list_head`.
> 
> This is slightly better because the condition check does not need to dereference
> a pointer.

Sure, I can change it to that.
>> +impl<'a> FusedIterator for CListHeadIter<'a> {}
>> +
>> +/// A typed C linked list with a sentinel head.
>> +///
>> +/// A sentinel head represents the entire linked list and can be used for
>> +/// iteration over items of type `T`, it is not associated with a specific item.
>> +///
>> +/// The const generic `OFFSET` specifies the byte offset of the `list_head` field within
>> +/// the struct that `T` wraps.
>> +///
>> +/// # Invariants
>> +///
>> +/// - `head` is an allocated and valid C `list_head` structure that is the list's sentinel.
>> +/// - `OFFSET` is the byte offset of the `list_head` field within the struct that `T` wraps.
>> +/// - All the list's `list_head` nodes are allocated and have valid next/prev pointers.
>> +/// - The underlying `list_head` (and entire list) is not modified for the lifetime `'a`.
>> +pub struct CList<'a, T, const OFFSET: usize> {
>> +    head: &'a CListHead,
>> +    _phantom: PhantomData<&'a T>,
>> +}
> 
> Is there a reason that this is not
> 
>     #[repr(transparent)]
>     struct CList(CListHead)
> 
> ? We typically want to avoid putting reference inside the struct if it can be on
> the outside. This allows `&self` to be a single level of reference, not too.
> 
> It also means that you can just write `&CList<_>` in many cases, and doesn't need
> `CList<'_, T>` (plus all the benefits of a reference).

Sure! Will change to this. I am guessing you mean the following, but please let
me know if you meant something else:

  pub struct CList<T, const OFFSET: usize>(
      CListHead,
      PhantomData<T>,
  );

I don't see any issues with my code using that, at the moment. Will let you know
how it goes.
>> +impl<'a, T, const OFFSET: usize> CList<'a, T, OFFSET> {
>> +    /// Create a typed [`CList`] from a raw sentinel `list_head` pointer.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure
>> +    ///   representing a list sentinel.
>> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
>> +    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
>> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
>> +    #[inline]
>> +    pub unsafe fn from_raw(ptr: *mut bindings::list_head) -> Self {
>> +        Self {
>> +            // SAFETY: Caller guarantees `ptr` is a valid, sentinel `list_head` object.
>> +            head: unsafe { CListHead::from_raw(ptr) },
>> +            _phantom: PhantomData,
>> +        }
>> +    }
>> +
>> +    /// Get the raw sentinel `list_head` pointer.
>> +    #[inline]
>> +    pub fn as_raw(&self) -> *mut bindings::list_head {
>> +        self.head.as_raw()
>> +    }
>> +
>> +    /// Check if the list is empty.
>> +    #[inline]
>> +    pub fn is_empty(&self) -> bool {
>> +        let raw = self.as_raw();
>> +        // SAFETY: self.as_raw() is valid per type invariants.
>> +        unsafe { (*raw).next == raw }
> 
> `self.head.is_linked()`?

I'd considered `is_linked()` to be something that makes sense to call only on
`ClistHead` objects that belong to a particular "item" node, not a sentinel
node, so that was deliberate.

Though, I am Ok with doing it the way you are suggesting too
(`self.head.is_linked()`), since it is functionally equivalent.

>> +    }
>> +
>> +    /// Create an iterator over typed items.
>> +    #[inline]
>> +    pub fn iter(&self) -> CListIter<'a, T, OFFSET> {
>> +        CListIter {
>> +            head_iter: CListHeadIter {
>> +                current_head: self.head,
>> +                list_head: self.head,
>> +            },
>> +            _phantom: PhantomData,
>> +        }
>> +    }
>> +}
>> +
>> +/// High-level iterator over typed list items.
>> +pub struct CListIter<'a, T, const OFFSET: usize> {
>> +    head_iter: CListHeadIter<'a>,
>> +    _phantom: PhantomData<&'a T>,
>> +}
>> +
>> +impl<'a, T, const OFFSET: usize> Iterator for CListIter<'a, T, OFFSET> {
>> +    type Item = &'a T;
>> +
>> +    fn next(&mut self) -> Option<Self::Item> {
>> +        let head = self.head_iter.next()?;
>> +
>> +        // Convert to item using OFFSET.
>> +        // SAFETY: `item_ptr` calculation from `OFFSET` (calculated using offset_of!)
>> +        // is valid per invariants.
>> +        Some(unsafe { &*head.as_raw().byte_sub(OFFSET).cast::<T>() })
>> +    }
>> +}
>> +
>> +impl<'a, T, const OFFSET: usize> FusedIterator for CListIter<'a, T, OFFSET> {}
>> +
>> +/// Create a C doubly-circular linked list interface [`CList`] from a raw `list_head` pointer.
>> +///
>> +/// This macro creates a [`CList<T, OFFSET>`] that can iterate over items of type `$rust_type`
>> +/// linked via the `$field` field in the underlying C struct `$c_type`.
>> +///
>> +/// # Arguments
>> +///
>> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bindings::list_head`).
>> +/// - `$rust_type`: Each item's rust wrapper type.
>> +/// - `$c_type`: Each item's C struct type that contains the embedded `list_head`.
>> +/// - `$field`: The name of the `list_head` field within the C struct.
>> +///
>> +/// # Safety
>> +///
>> +/// The caller must ensure:
>> +/// - `$head` is a valid, initialized sentinel `list_head` pointing to a list that remains
>> +///   unmodified for the lifetime of the rust [`CList`].
>> +/// - The list contains items of type `$c_type` linked via an embedded `$field`.
>> +/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
>> +/// - The macro is called from an unsafe block.
> 
> This is not a safe requirement, probably lift it up and say "This is an unsafe
> macro.".

Sure, so like this then:
  /// This is an unsafe macro. The caller must ensure:
  /// - `$head` is a valid, initialized sentinel `list_head`...

>> +///
>> +/// # Examples
>> +///
>> +/// Refer to the examples in the [`crate::clist`] module documentation.
>> +#[macro_export]
>> +macro_rules! clist_create {
>> +    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) => {{
>> +        // Compile-time check that field path is a list_head.
>> +        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
>> +            |p| ::core::ptr::addr_of!((*p).$($field).+);
> 
> `&raw const` is preferred now.

Sure, will fix.

> 
>> +
>> +        // Calculate offset and create `CList`.
>> +        const OFFSET: usize = ::core::mem::offset_of!($c_type, $($field).+);
>> +        $crate::clist::CList::<$rust_type, OFFSET>::from_raw($head)
>> +    }};
>> +}
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index f812cf120042..cd7e6a1055b0 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -75,6 +75,7 @@
>>  pub mod bug;
>>  #[doc(hidden)]
>>  pub mod build_assert;
>> +pub mod clist;
> 
> Can we keep this pub(crate)?

Yes, will do.

-- 
Joel Fernandes

