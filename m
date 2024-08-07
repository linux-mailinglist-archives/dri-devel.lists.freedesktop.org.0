Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F35194B3DB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 01:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B499C10E609;
	Wed,  7 Aug 2024 23:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIWbswS7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644A710E607;
 Wed,  7 Aug 2024 23:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723074359; x=1754610359;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=24thgKWbF7qEa9W/NvMIZn+f5JBc3YnLInKnIHi0eSY=;
 b=IIWbswS7AB/ccfDDN88ThFB8TYuJLm1qNL2CCAe6KV5K0GSWhrnF1ua7
 9bKuQ7kPI94RHqaGQGIbhfBnvGnEZYJhbMSQf4bYPgjUqS4kLEhDI8xks
 MqewhbOzbg9UxmvgZ43+9bygr9XY0iUep0bMouHsTMQ6SFaNiGf7DEfjQ
 R+7UmsMdZN8dZTgJFLxGvkWlAqRmohVfYPJ4Akiad2XsNj+TA1mEvao64
 sRJH4pBBG7aOSaieeTUq8J+BwJNDQ8FvnZ8oTXusamg+IuwNDSXW1BpLM
 zUAb08215+NoAPlVyezAuKQZqO7R//YhrqGQDtW0faPvWb0PwmhCxOQ7h A==;
X-CSE-ConnectionGUID: Nt6opc0CSzuT/sioM7u75Q==
X-CSE-MsgGUID: T9L6jFdbR2eWaq4bOxKcsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="12909783"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="12909783"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 16:45:59 -0700
X-CSE-ConnectionGUID: vDAbCqe3TfG9Zgq8DEWk/Q==
X-CSE-MsgGUID: bz2m18BxT6a4Bh1cpziAmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; d="scan'208";a="57099356"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 16:45:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 16:45:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 16:45:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 16:45:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtKgN7HUaKjaH33pLezlcR+n213UmAXz/GKGDS92tV61kUkhSCM0dN4IIv/EC4RpwMe0cQyOIDd6+AkBgUjE2n+H5g4ZjOkyfknh/Y3yj1zZl6H4s4ZCkL8KoanYOwoOZ90kQCwE8EWeu+OhiVtFiNe9wEBnmCrLG4rMgFkXV0cwhN60ol9O3Fs/YRrufVIjLOrODZ/diJJRpHNFnwsymOlHZIFIfgMkfW5G8wPlQzs8x1QNTjAcLvNyZCHYK2E2TRih7+mEKar04U6bCtb5sFN4DJAqsW/5AWSuxpvbxg7LvHPC2gi/XF8xPngcxcmFOm5XrIcFBnQLVW6o94qEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GInAsYzxSS0A+x419EpgbmYbrPrSKDtCybhDPydEGQ=;
 b=LAQA3cCIKpHoryvfSNe+qXU3RTs5G5CinZ1hxG8TaB39mF4zzzJWobOXqpwu3YFbEcAL5jAoagmBX7wGYEXIVy+71jMmKuh11rIdzPh/+SnKi2fmitLd/bxor8MWZI0cjlIkjUXOHLi0yc8JABycjamConP5K23+H2fi9wAgNXyDD3lMJQoiX6Cd2f8jsQUQjTZJ/L5wXlKOT9AJ57yQcNIw7iDYizAg7lUxkI/SyYJ8ycbAxmDWOM/LWoYY7KoFUWe7ydWgFds7ExtZ7oVubdMdTP55en01qON2lDYfoznWllQsRZY8tBE7v1Ovpm2YqjdhG1QWSnPuan/6kZoUqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5099.namprd11.prod.outlook.com (2603:10b6:806:f9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 7 Aug
 2024 23:45:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 23:45:53 +0000
Date: Wed, 7 Aug 2024 23:44:34 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 12/12] drm/xe: Increase the XE_PL_TT watermark
Message-ID: <ZrQG4l9I1KTZZwwl@DUT025-TGLU.fm.intel.com>
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-13-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240703153813.182001-13-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5099:EE_
X-MS-Office365-Filtering-Correlation-Id: 98ecd525-314c-441d-5d5d-08dcb73b12fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?T89TbI9quUTJ0vpHqa7lKKohm3+QHU2Z02kHs42nncYOEKr43E/EKtD3Or?=
 =?iso-8859-1?Q?rKu+x0/5rWE6THMo7j2vmlHHubGlR/lNgl6qSEwyDMqouqcmAH03v5t6xL?=
 =?iso-8859-1?Q?eP5P9+5GrM1UgyYukCt+5PDCt2EXfzUpUHopfPxbN7/VCStlKiirzIpo16?=
 =?iso-8859-1?Q?NgnlRkswn5a+oR2AOiAeuK1m2bKy8dMO5X9SyWg2WcAICzVjaCaudSiqeC?=
 =?iso-8859-1?Q?ruMgFi3WmxYfHctFCvaM+lo8thnkdkO9eFlrAwPZNHfkFtLJum/gyx937P?=
 =?iso-8859-1?Q?bZZXg14xEQPRMMRPTnhLtI+iqEVr/SIelQrw6m5cWupB70v6OSoCoXXfHU?=
 =?iso-8859-1?Q?gds5a6oNKdGiWIlzWwsRzMriStDuyrdjLltuaZEdJSvACBpFr2zh/4xZCp?=
 =?iso-8859-1?Q?hPXOg6zLTCB05HlR9WDJbsvbXCra9BSspHkHW0pa3ElewU30LZiOKRS5I4?=
 =?iso-8859-1?Q?HHTBXZi47sR+t0UOASc7IvYhugAAeaO+YxC2K3B1cZHFO3LS4j/6tDTEj9?=
 =?iso-8859-1?Q?4WtC6+/z5PgJj/N63WTMMt1SPdMMkrUSvVNa2uWKssaYmWpzP1+wQ5uRA0?=
 =?iso-8859-1?Q?FaXLUElbHTSPFKXi5VSvm5s1It/ho8dTijXyBeGaOMLYiVeOvqoJlalQaJ?=
 =?iso-8859-1?Q?7BItkS810l6YJwxZ6PbC+FWR8B/0vKcRggOLpq1ihxQOq219jGKHZoJO5U?=
 =?iso-8859-1?Q?ayPc73RnhIAAZtmXt0iW+l8cRegBjlUUFQ+0l/ze8a0Amqq13/ZMkBXqUU?=
 =?iso-8859-1?Q?zF/Lv821zBtYJiWcgjrlhKbeidTN7U6plHG2PUbMqyqgG3sEhde/qf+EhA?=
 =?iso-8859-1?Q?3gkiRzE+vvOk2b7sZ0W6INq5N0AUjTEJA8+318yrogSzWBdP8IQykdS2hP?=
 =?iso-8859-1?Q?oGagJaelmiVLbRCavJ/b5G72GOoDV6mICm8k60H3v4tw9UEk+zmgt9XSTJ?=
 =?iso-8859-1?Q?6j/DOMA5CEo2Uxhz42xGH5Cbrj4Oa1csHeD6iwXwJr+YDkyh1og2mjPSPU?=
 =?iso-8859-1?Q?7w/O4peWLJ3IaASiQQ8nOD+Dbiv7xnQqrZaPn3M/RRVkdjSWWOI+EpDOuR?=
 =?iso-8859-1?Q?PvJ/tCcAfno5bokhF8ecLOmymBgblf/68vZ0akn6qXqWKs1pNIok1lDrOP?=
 =?iso-8859-1?Q?jBrOoYVFvtk0nVKqfX946JUs1zVsMZ4+QksB3tOsnxjth/oP9jRyCgO0en?=
 =?iso-8859-1?Q?3OHBhyAHwY6FX8MZSViA9pBGff5949FoB0oTmVbZbHFgqbAUx8gFH6+K6S?=
 =?iso-8859-1?Q?XWNMPfrbg+v1vGmnaydjENJkFEHC4vf4jY7t4chw0skA2Lp/5neR0dPrQc?=
 =?iso-8859-1?Q?db06StApQZ9VW/IAXWovREgolyGYSKwNNKys7QxQz45SmrDq2/a3iIO/LQ?=
 =?iso-8859-1?Q?fRZJXrF7zAgnuDvWksijLlLhx1K2jlKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Rw/3uJa/SG6BMFit+gJzAX01zM5uB6f4d1KE/7QUky5Ce1ZG3y1vyMtI/d?=
 =?iso-8859-1?Q?OIPq0Le9rz8JIgKBJTabRPrZRLMLFiKTwyftaO2CdKJriQdaYLaF0UJvOk?=
 =?iso-8859-1?Q?QoUr7ov8MJzN/4KhPxJY7x6kogHlxeH3eOIjq9Etg7zduZdjEPJXZXQ69z?=
 =?iso-8859-1?Q?kZW0SAnHoL4I276nLRJ7bHk8Re4z/8CfmZ7D5CYEIm6U/IrJWpbSNQwX6+?=
 =?iso-8859-1?Q?lH678I8L1GeANqOImaJhYe/pqJievyt97YU5G79o71DRWCeFHkh4yecq+L?=
 =?iso-8859-1?Q?fypg2ibK2A6ZAzxP7EW7J7wfhRuaVC8/A7wuyLvtXDNdMzRnK9Oin1u0/w?=
 =?iso-8859-1?Q?oviX2DLn9VPH2OHVF1zTdtVycockHS5Wbswi6CyYAcmRrjVFQPZHaZWfh1?=
 =?iso-8859-1?Q?GJgHvZKIbFE9eZuUGsD976lQF8qO1MzR8Wo0iW/y8R6yh1vdWkuP60IdUf?=
 =?iso-8859-1?Q?MS1pmgMdqOWK0QPgg2TP5EIIFltFC6y9FvSB3CY+b+wWjTGEmFMW6PwAMc?=
 =?iso-8859-1?Q?AqNlVKRXNGK54SllSOgD3R7hDXF69IKsFbhq75kMPSTqg3bZgmsbhHyoSr?=
 =?iso-8859-1?Q?FZq1kzxR6xM6/MUi2l31a/slz0l7DcmLpKjXATYMVQeHvAC094wOqE/8Ii?=
 =?iso-8859-1?Q?X8q0/UgFO6MAxihmCyGcCWtxYIAoOFZjyq8KrAMQaMV44z5Hkkgi7T8r4o?=
 =?iso-8859-1?Q?6qfYd18ZCTQBLWzOr/USQmhgtRp0Q6enZX40DKHpBctW8OINeAeRS8bj6h?=
 =?iso-8859-1?Q?VGv/VSyn+YlzU315i6mz4rkUTekG3q26tsvUdidw6CS89DIgrpy4Yx/Oa4?=
 =?iso-8859-1?Q?6gatAjWZAF6qL8EGh2Bl9WmvLXqcvylcew+ZExAV/4AM/tmvK0o2XsmKHq?=
 =?iso-8859-1?Q?5g6+6YIynQG5FzPZBnNLOTEqTLOeExhfb6rQhWV8SNw0Yg/gkHt9WFF1N4?=
 =?iso-8859-1?Q?ew2Xkz5Yfi7ZE58CzwCcx42+H3DL3Q4kZJ5Uk/sHtU6meZdXtzR7IL9/KQ?=
 =?iso-8859-1?Q?KQ322xL6lmzi0PRQCy1pD5Kq6TocPFMN9nCAWKYw/aPbmms2yUX08aYgha?=
 =?iso-8859-1?Q?CptbBD7nu++2l2YKsbG+sqCK6F4GNAuK2T145KlzJvPH0Ljxvxj3aTkjey?=
 =?iso-8859-1?Q?Q7MDEoeNuxovQq1LyyMtkigbcjzbfwl6IOZE58n/w9LIh2J8V/s1jZrpIl?=
 =?iso-8859-1?Q?+SbKvt+oJHu5risZj9UyeBwwxddXzv0DLChor3l7sRyfBh1MlIOe+6M4Ig?=
 =?iso-8859-1?Q?j8l06D+t++JlAmHVd13ilrkMrYDflSp6GKgY+jFnzTX8jj0w5wQ6J+b8Xf?=
 =?iso-8859-1?Q?2gwFM5sLErYyMO5enoohr54/P0+SiJWQiuUR85KBtq5V5CPM2QgYSlxT3G?=
 =?iso-8859-1?Q?NMQpzm4TRB+fw/6BRSdGG+ccojGJ91Z+9LdnL5tO+wdCd0rdjyslh2pBCp?=
 =?iso-8859-1?Q?GG2QCevimShsSMKkPKWIQfLxo+EwEe75dAWgDTcXKUBwv+XTFGmUk0Y5pC?=
 =?iso-8859-1?Q?Ionlt6HiXwlANpFrEVWG7ATUXVoL/EUWpsgEGeL7woyS9lC4jJ+QLXZcTd?=
 =?iso-8859-1?Q?Lf+iGP2OagCx8rp48VsuY3u7giwG3kQOjVnQCOwhDQHjiABagVWwbPmYbf?=
 =?iso-8859-1?Q?iPc19F65SeXuN0mzDA8lSeA6ApkLAtIR6MWE5peBg6cFlEoA7LPhSnIg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ecd525-314c-441d-5d5d-08dcb73b12fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 23:45:52.9755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAcZQxQXDNtdoqyx8iPfH7gJmn8Bmli0ViU91TtLFEDstTuuKk7qsNVZMzzPHTTGy8xCD/rVsQKCUyG5dHb2aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5099
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

On Wed, Jul 03, 2024 at 05:38:13PM +0200, Thomas Hellström wrote:
> The XE_PL_TT watermark was set to 50% of system memory.
> The idea behind that was unclear since the net effect is that
> TT memory will be evicted to TTM_PL_SYSTEM memory if that
> watermark is exceeded, requiring PPGTT rebinds and dma
> remapping. But there is no similar watermark for TTM_PL_SYSTEM
> memory.
> 
> The TTM functionality that tries to swap out system memory to
> shmem objects if a 50% limit of total system memory is reached
> is orthogonal to this, and with the shrinker added, it's no
> longer in effect.
> 
> Replace the 50% TTM_PL_TT limit with a 100% limit, in effect
> allowing all graphics memory to be bound to the device unless it
> has been swapped out by the shrinker.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> index 9844a8edbfe1..d38b91872da3 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
> @@ -108,9 +108,8 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
>  	u64 gtt_size;
>  
>  	si_meminfo(&si);
> +	/* Potentially restrict amount of TT memory here. */
>  	gtt_size = (u64)si.totalram * si.mem_unit;
> -	/* TTM limits allocation of all TTM devices by 50% of system memory */
> -	gtt_size /= 2;
>  
>  	man->use_tt = true;
>  	man->func = &xe_ttm_sys_mgr_func;
> -- 
> 2.44.0
> 
