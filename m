Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5A99F3479
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 16:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6692410E6D1;
	Mon, 16 Dec 2024 15:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gSFmqpn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA6A10E6CD;
 Mon, 16 Dec 2024 15:27:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdcaewj8HTlLZf17LGN2faeR/s0/4ApdXvOFIej9B3eESN5XT+XbN7POfq4ZHkqSTNTlOssSbeQlcEyGWzKC2eoL2tEoO3F9lqCIk0iidwawAm1PVW3k6PlCkunOJGidhmZTo/1GQDG10UGPu+/fRqlCb4TXb+YbcQmn0oMVtDbe9qVIWKnKM1d15Qj0mg04GgLNocTCDh0C7lfT1c/KxLOx4SD98UnqXPHp1rT4/uKP9ZrqxX7ZZNxUnrND+O1uJU26/bw6D5WWDv7FGi3K7k6/pF5zaA4ovL65PA8Xm9kTDF/kXaRmLxJcf5u7RDwXCbBzcwuhHqtT6NpO1mWUmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pH0LsyCwuy8qnUEGofoYkKBDkQGxZ/WPfgzS+0OPYJg=;
 b=Tiz5J4DPAx0bLlnGF7hFp36IUgpcT1pQnivtEG2F/Ck04D4IIYR9FRIO/VzR8SRLuFXz1nghL9OlfVIZTCSzd4Eg9iQ38/jS/vGQUv5KtNvBaMJAHwAdL8imJG0if8U82E6awYXWNfSeToIs9wkKrqFzJp+2huDHPKVgAz6S8Yx2CARBNH8CcIwHi6XIKU+7i4vyCsD0Iw8qD5k/dV1CZCP+IsOZqU/q8gOCeGDwnDFJ6jBj9ZMa+TVVUzT465wIVw/0BOG4i6/aWj2xliUP5RYcYRxUCYu10rDWrs/RwFzzSJPa/d0DwXEaIX57wYk7ahYOcwzzjSpu7BISj6HviQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pH0LsyCwuy8qnUEGofoYkKBDkQGxZ/WPfgzS+0OPYJg=;
 b=gSFmqpn/ih1KmVlduZwQQlnwu+I0WDVVEO5X2+8JCmmFvg2tj2668jWNpyQsirIpMSQ2FlRBMMK8IRTXhGKRWWJ02MMCp7Rqwif+2+XgPqQigtrnrfQAdHSkQCM+eD6Au1rfrYjEtiz++OUkyObDnZNCc36whZiZI1VXkRm2gCY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8198.namprd12.prod.outlook.com (2603:10b6:8:f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 15:27:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 15:27:17 +0000
Message-ID: <127f135d-72f2-47bc-a8af-93add181e7b2@amd.com>
Date: Mon, 16 Dec 2024 16:27:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/amdgpu: Use device wedged event
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Shashank Sharma <shashank.sharma@amd.com>
References: <20241216150250.38242-1-andrealmeid@igalia.com>
 <20241216150250.38242-2-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241216150250.38242-2-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: 454766ae-6ca2-4d0f-a8fa-08dd1de61fa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWp5a1cyRmwyVTVHcXp5ZVNOS0lvRlhTSVROSkQ2Mk0xQjJxWXhDUWpkSTlH?=
 =?utf-8?B?anNXc0FlamNyTFNadEVPOTNEaVp5L3lycTREQUtGR3NjdFl1Q1JsNVJ3ZlZv?=
 =?utf-8?B?VEtCMHpxSzJjYy9PbVVaRTRaSFR0Nk1HVFlsck9WaDFPYnlQbVczdUZsSVNa?=
 =?utf-8?B?TkNTcEZneXYzeU9GUGpGa1Q0UnNaUjBjR1pJaDFnL2tPM0Z2VTFKeWJyQTFn?=
 =?utf-8?B?SlJQelRtVjY3Y1BnRTVVYVRpcyt1SXNzbjZOV3J2MTdyRW5Yc1loYlVuRHZy?=
 =?utf-8?B?aWYzV0NWVFlGUVZzTzdQRGc4ZUFCRU9jb3liSUZOb3Y1UkxINHd5RzJSVkJP?=
 =?utf-8?B?QkZTbTJ4TTZZWTNNU3kxK1dFa0VPU0NzM2FPZytFczl4eXpibnNyYUVqMjJ0?=
 =?utf-8?B?Y2ZsSjRiQ2oyZkRacFErbm1SZUwvY2pna0N5ZUw0dlQ2Vjd1MnNKUkdsV2hr?=
 =?utf-8?B?WU4xUWxsb2w1NE16bkhuRVFVVGVoR3A4ZitTUy95aVlkQmRnOUtpeThScjRy?=
 =?utf-8?B?YzBIUFlwa3NkaG0zSmhFd21aUGdHMDB6WGJjTkowOUVpMi85bkZOZjRMNitQ?=
 =?utf-8?B?K0VicWEwV3B5cG5ReitvMlY5UWx0Ym5VcHRNb1JjMHVRTTR6eG1jR0Ird05v?=
 =?utf-8?B?L2ZRYStDMmw5ZU5nakpGa2FucXcwOVNFd1FvdU4venBxNDgvMWVlRmJnSnJJ?=
 =?utf-8?B?NnpzMnBkeVVpQTc3ZTlhMzBISkV5TUl6VG03K1FyQk9mZ2swUjQ4a1U2RXhP?=
 =?utf-8?B?dkUxd1ErNTZObnFyNnhVZkVJQ2xsZi9EM2RoekZoZW93MU9LbkhUNmlyTkNG?=
 =?utf-8?B?L20wU0pSeFBjWldZbHVsODN3TnZaN0F6akp3TTRiQ2NHZjFmdWh2UDlidThC?=
 =?utf-8?B?c1dTdVIySm1yTUdNR1hYeXRUYW9QZUpHdWZtY0tSdDRtWmxkNHZmdEFjY1dT?=
 =?utf-8?B?RzJQcndDQmpOSFExTGw1TzBqcWhSWTFMdy9WenNPcVRJdXR5VkZpWitDakZP?=
 =?utf-8?B?ay9IWUZsVUVpdElhdnRadVA2Q0hqRXh5Z0pETDB3d3FEV3FnakZCcmxEOTF3?=
 =?utf-8?B?aDJDMlZCekJlT2RqRkZBYVRlVVZOVXo0T2lJY2hDU2pNRUZvZjZUWklpcWty?=
 =?utf-8?B?QjFUVmlZU2NsZDlpUDBWbGU2S0w4SGV4ZURqQ25OUVFFeWloMVA4THZ3VlY4?=
 =?utf-8?B?R1RKWkdlUDBibzZoZWw1T0Fad21iMHhTSEY0RXd6WXBzanNSMW1VdXZFamMr?=
 =?utf-8?B?Tks3MG90bzh3S2VmTUNCYXVrVm1BeXJrWWdOM2RJand5WWVrZlpjaHJDQUZK?=
 =?utf-8?B?UzlvQUtNQnErQnBsMjhUcGVpVVYvamlPU2FzWXAya2tFL3IzL000UVRlcEtQ?=
 =?utf-8?B?cGk1M2JaYnVFSlAwaGw5YTd0K3d6dmhBaThWRkV3L2NYSVUxZDRoNUVBeHNL?=
 =?utf-8?B?RXkwdmtJODgrSVNOREwwMUV6WEx3VEZHdEZXVzI0anJ4T1NYYUtBUVlxM1lP?=
 =?utf-8?B?VzlTd3JiUzZadGJTWXVCVnRiT043NDRzZkxUd09ZYkkrWFRrVCtUMzR1b09M?=
 =?utf-8?B?ZHZ0dmtHam1nK1JMVno1bGY5UFVLdTVwNnpnY3NVSGYrUEZYTTRKaE9BWE9h?=
 =?utf-8?B?RFBIb2VYZkdOSTZ4b0U4RmdpTktGeEpwL3gvTnJyQ05VQUpYdnJHWmdBSnFo?=
 =?utf-8?B?VXpkbjMzS2pKZE5jTTUyQy9nakZ0L01TNWVLNlUva0FqU1phYmpZdGlrcXpo?=
 =?utf-8?B?UStkekRmcVd1VHpnQks4NU1xMmFqM0UwK1hVNTVoZGd6YjNjZ1B2RWNvL1Ry?=
 =?utf-8?B?OVQwdUR4UFI3ZFowUzI3RlExOEwwdTBMbldkd2RQN2JMWTRTcDlueWhVOE5r?=
 =?utf-8?B?bGFFa1ZpYjVvKzByWnpPV0Y5cnRtMVZRZUdjak5Yd0RSWVJYQXNUVzZ4aGxx?=
 =?utf-8?Q?omNN242fRlU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnFNM3l2N2w5c2dYMWZ3RnNDWFh4N2wvTHFNUi95UVQreitCTCt0NWhzZ1dw?=
 =?utf-8?B?dmVJK0V1b2xwUVpNWndKT3ZNY1krczM0UTZEaWNRL09uK21waFU5YzR0cVNU?=
 =?utf-8?B?V3ZsOWpUYUNWYytxd2pFMS81eGhlMS9pYkdWc1lid1drMjBKRFVDMU5TNXFv?=
 =?utf-8?B?MWVKaWZzSmVoaDh2NDErdWU1cDYyNkJVRzFMVDlRZzkxS1gzWlVkN3pEazhK?=
 =?utf-8?B?c21mRGxOak90QkFRYU1YWkpVQXRnaU1WSCtROXBVQnh5Z2cxVDJXTWg0cWQ3?=
 =?utf-8?B?bGxjbmZXbDUzWExzbnl0cGt3SzRRbjduWjJqMzlERjFRNDdpa082NEtjaExF?=
 =?utf-8?B?cUJkeXUvci9rVjd0UWkzeDRMZXlNMks2M09qN3EwVzQ5MVhnMUFMbmhlQzhQ?=
 =?utf-8?B?YVNFTWR1Rm0xTFdLRzUwcEhFMmxKZVdNWTcxa3BXUjk1QTE2SzFZZ3JYODZ0?=
 =?utf-8?B?dWhMSE5xOEd3Y0FnM3BJTUlZRThaSGRuVTZRNGdvWFlsMCtPYWthVXJMdWVz?=
 =?utf-8?B?T3B5NGFGRkVqWFA5d0hnYlBsYy80VndINFYvK2RhOFFtNGs0RG1BdnpscWtH?=
 =?utf-8?B?ZUt3czc5NU8vQW9wM09YSHd6bzRqS1dDckszenZZTWVBTkpVdWpnYnlxWnVP?=
 =?utf-8?B?NUFrVmREQTJXa0pwNkRRNFpudFQzY3ArRzhIdUdLdFpjVVplQzRNQUpnR21F?=
 =?utf-8?B?SHVoVENsRk84NDJidzJIeGYxVlRYS25CZ0hQemJKVko4Q2VsZnp0bGMzMndR?=
 =?utf-8?B?MFphd3hWU0Y2TUxvZXYrY3dVMXFvUjFrOHE0L1o0cjRFVmpQaUg3QUh4UVhJ?=
 =?utf-8?B?MFIwZ3BwMVY1bnM2TUJubFk1ZktaaEZtNG1FWUN1aWZUY1NlWFpjNUFIZmhT?=
 =?utf-8?B?NjhqTEFId1ZHcGFxWEM1aHNMQk1WMmgrTURvOWsycFowWU1sNWN3NWk0dG4z?=
 =?utf-8?B?OGFBSUhvREVCY3R4Vk00Ykt2aTg3cnJyd0hzbm8yVzRaRWluY2JucHNpWlhN?=
 =?utf-8?B?YkhJOVRSSkdXVEFhZXNwbmVEdWVtbkRtNVUzWVZUckNuUGYzVUlhUmd6VmNl?=
 =?utf-8?B?R1Rhc2NQV1ZnbWxzVmorS0pVY0JUaU9ua1pVOXM0ZmtqRmEzeHB6eEdLdFZT?=
 =?utf-8?B?QnBSR1hxaS8zQ3lrRTJxS05LWmM4UU5VcHRza1JvSFphQ2RpLzliNUlxOUlJ?=
 =?utf-8?B?N3FQYTI4Uk93SmpDSk9yV1dqL1lIZlZZdDEwV1J3RWlJai9oNkdkUlc5Q3Zm?=
 =?utf-8?B?TXA0SXVWNWtZNUxEcmI3WWFCczJGZDRJUUhZVXRZdHBRUXlxV1R3TTFrYzhn?=
 =?utf-8?B?K2w0Y0ljcU4rVk83QnpyQWxXTXR3UFpaczNyZEcybTBZWUo4ZzFiY2VsaFE2?=
 =?utf-8?B?WlArYlZvU2ZwOGZpMnNQbWJTSXNOYXZXVFZmVnIvRGVjYUFGOWttUmdrZ0F1?=
 =?utf-8?B?QndTeGpsczJlK2srN3NaVnByaHNZWlduV2IxRXJmWURjUElka1o5eTlzTVF3?=
 =?utf-8?B?dnBHMTBYOUVnc29IZHNQdmV6eHl2dWNWQXI4UW1xTENacTdBcVAxVHdXWEcy?=
 =?utf-8?B?bG9pN2dBRnVqWm9xcUh3SUh2ZTA1NGN3UGZVelZ2S1Z3NytLWkxyMDV1U2h3?=
 =?utf-8?B?cGV4QnRqaEJsLzlxVHZsRDJWTGVoUlQxWGxlOXVBYm9nV25mQzhEdWt0M3ky?=
 =?utf-8?B?Mk5SeE1tMWF5eHNhNVpaT3FwR290Z3lrbVMxWStkQ2poZk5iRkFwbEVuaEl4?=
 =?utf-8?B?eGFxTXc3a1BFNTArQUxsd2NDZ1BJK2lXUUlyWTBMT3k0Wlprc2tzcjcrbUMv?=
 =?utf-8?B?TnRxdTVreGRGdEozMjVvSFc1Q1g4bk1vT2JZcmpNakpIUzU0YlBoK1lFOGxI?=
 =?utf-8?B?SlloMlRtOVcySUdOaDd4M0prYy8xWDRCM2cwVEFrL0VpRy9vc1dEdVN5UXJt?=
 =?utf-8?B?WlJsY3VUb2J1ZEVLZFRrSlRvVDFDd3llazZkZXh3NWhrcnc0djlpYTZkUVlr?=
 =?utf-8?B?WXVCQ2RWejZzM0NYalZmbHQ3eWhiNUgrWGJ2UzVTR0dWS2Q0UjMzTlpCKzJE?=
 =?utf-8?B?UGEwYlJaTDI0TUIxTkV1Vmg1TzNKQ1lOWklVWE1TOUQrcFVwWVZPNDdhN1BP?=
 =?utf-8?Q?+oXr/6ahJHldeHGm57m2ya+j8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 454766ae-6ca2-4d0f-a8fa-08dd1de61fa5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 15:27:17.0009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZC2/vITnsLomYRPUlB36ta3WAWuqIs3QqqAvVsn4y44wHi0lUBHoTb2H0uSw4gLy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8198
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

Am 16.12.24 um 16:02 schrieb André Almeida:
> Use DRM's device wedged event to notify userspace that a reset had
> happened. For now, only use `none` method meant for telemetry
> capture.
>
> In the future we might want to report a recovery method if the reset didn't
> succeed.
>
> Acked-by: Shashank Sharma <shashank.sharma@amd.com>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v2: Only report reset if reset succeeded
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 96316111300a..b0079d66d9e6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6057,6 +6057,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   		dev_info(adev->dev, "GPU reset end with ret = %d\n", r);
>   
>   	atomic_set(&adev->reset_domain->reset_res, r);
> +
> +	if (r)
> +		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE);


That was not what I meant. The idea was more like:

drm_dev_wedged_event(adev_to_drm(adev), r ? TBD : DRM_WEDGE_RECOVERY_NONE);

Regards,
Christian.


> +
>   	return r;
>   }
>   

