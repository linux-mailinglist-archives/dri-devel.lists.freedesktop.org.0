Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1643CFFE8A
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 21:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D054110E5E4;
	Wed,  7 Jan 2026 20:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T074NhNi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBAA10E2D3;
 Wed,  7 Jan 2026 20:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767816332; x=1799352332;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TXshi11LcTFIGTL0riN7miabwARMx6MHzT39e4dXeVE=;
 b=T074NhNipeb4Ft0Dlo3miP1Ym8gNzKy4rVqMVYwtoyfN1HbNeO/tWWcB
 CcdC95Uuj5tFUYmCzpuVMLELwBCdbjZGgRgSnil/pBJlnob2VZynlbwgs
 NSvh11GvvgVbvaGdkZur26cYZub/+AsIlUZ6qHFO0+7PUi3tL2xbPUD3y
 kE9i25C33MAZtwun3FdOiSK8alTmTgDPPtm1dw0WvF6VHS3l3JniPknmY
 bNGRnmZ9Fnp84v6UKujoLfrSVYnOoFgTd4O1k9GyEgn3lCHwjkpz5NMxt
 ehREfPOwn5by8KB4xP7NFZwGhp/pquLF/RYjU+MnAog88wFM6FLdYDbfx g==;
X-CSE-ConnectionGUID: JhilW5LdTOaxdf5ySGquGQ==
X-CSE-MsgGUID: 2KBdyvY7RaCWxPow77ovsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="68200863"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="68200863"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 12:05:32 -0800
X-CSE-ConnectionGUID: +kIkkuuRRhyo1z3ZL1NCQg==
X-CSE-MsgGUID: QoYSwbg1RV2d7STOe5q7NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; d="scan'208";a="207861563"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 12:05:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 12:05:31 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 12:05:31 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 12:05:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzuh+fs9GWgyRF5mPlaSr8CIsyhQn0hp4kNYtmOcWnlh27cGegJYqN0E7BIOmQ9V6vHmqSLggpubQ17GC0Uh57Lce2MlVYB7TLAJKQdk92ZGdj45AUC7micStLW4/Pt4+n3dN01/pu84pNld6VEXlF52zsBF+0TEQbdCH8uI8zzJu+6o8mkOncrrHSGBW4R1Jms5gwFtPaM/PdPvfDzwO79/S63plpZkT43K9OlQkWUkVojfFa80nivhrngl2RaCdQEUv7LTfyXNDh8AezIOdyOfs4HPW8dl9oE/8lt5B45L8dmGpVMH5JnAvmz+QhcwUSsM0aDbl5WeksudkdVaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfafKNwYw1eF3PW8h34n4WVI8WP1t0FviMGBZUXTHUQ=;
 b=r7yZpxMwrxo1qj0V8IVQOunaGzhQVJtOuWl4HqAL1icg+KLG6INABCIHgn+FUBdv76Mqy+BiFedQ3xye1Q/Xm3Gu/llK8HltYgOdTvsFn/r81hPP8644QIv2MITY1wVfbpVJpbEggowJBTgz+M4P2EQWNWatoAJ5i1tGvaS0q6w7ZDGF6+vXvlNxxcX9BxHuB5XQAnrHXKr9A6pi0fBdJDrJ4RNO3OkmDTVaVGKOS5LwYMQNGs8y5MsKy5vY3a9HYW+s03fO69zs7NabXTbd5VD6it77TPuR2qi3u3Z8C0o6gDNZ5ydOwBWDcFFXzvCBjM+XbfxUr8FANdSbwX3ImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM4PR11MB5969.namprd11.prod.outlook.com (2603:10b6:8:5c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Wed, 7 Jan 2026 20:05:27 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 20:05:27 +0000
Date: Wed, 7 Jan 2026 21:05:19 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <himal.prasad.ghimiray@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/pagemap: Disable device-to-device migration
Message-ID: <aV68f0GSPkduQYCb@fdugast-desk>
References: <20260107182716.2236607-1-matthew.brost@intel.com>
 <20260107182716.2236607-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107182716.2236607-3-matthew.brost@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::6) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM4PR11MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: ef46718f-72ba-440d-4f1e-08de4e281982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TU5MRVUyRjRqNTJtYlphUU1LdDJ5dnBIZElZYldueGQ3bXVJZmdrM1lIWWwx?=
 =?utf-8?B?My94UERiTjNodWhobGtGSHhYcUg4dFVGTFlveEhmaHhsaGFUcXlLdlZNeUo2?=
 =?utf-8?B?ZXZpNlk1Qlo5YzVoY25SRTNKY242MkJyTDhPaFFMWUlCN3hBc3lHUENHNzQw?=
 =?utf-8?B?S3gzaUZhT1h3QzA0eUZlWENBU3ZoQ1FNM3RFUnROL0wyZnQ4NUVKU0l3Tk1Y?=
 =?utf-8?B?OFBPSFo3ZTJHdXhpR0g0REpJMmZuc3Fqd1dTNVRPeDBJMkh5cG1QMVgrL1dw?=
 =?utf-8?B?SDNRQnRsVVp1MzJCWEt3azNCbUtaSk5hZEluZTFZQWVtdXJxM2dQN3psdXBw?=
 =?utf-8?B?SlNSYnNZcFNFUUtJQlY4ZzNOeHhlbXB6R3BLMHNhQ0ZTa2dEWVJYNEhoVXNF?=
 =?utf-8?B?SUMycDlCTUlmUng0RU8ySE5WRThXSDZBZlVPUHRtNHJFd1huZzFzL2J5RFla?=
 =?utf-8?B?d0xMckNEN0tnQUZLWThTdll1Y2h6SXRZd01MNjNEVHlXbkwwVVVkNU9SQ3oz?=
 =?utf-8?B?NGJmVVN4NlRJNnp4K0J5LzVsN0kxaGJUR3FJZGd3WVZScGlPUzMzRjRQSXdq?=
 =?utf-8?B?YkN6S29xcmpGMFYyNmRzQmpMQjI2MFRGZE1ueUF6d3N3Mm5meTA5a3NqTGd2?=
 =?utf-8?B?VmFyWHA3L2lGK2FVNGwwNkdUU0ZWNGFjM3U5UHA0MUpCQnNIZy80TVpncTYx?=
 =?utf-8?B?RkhIYmQ4R3VYZUNQRG9QdHFKUDRFZ1E1TXdGTHJnMDkvaE1HVFMrMGFsRjlM?=
 =?utf-8?B?SHVVaGNVUnFBYUQ4SlJFaEY2aHNYZmhPWXBoelU1RVVnRXcrYnNmajFSWEZI?=
 =?utf-8?B?ZVM1QnAvdHJDOExPSnYwVjZYUjhzRCs3VTF2c1FSNVhjdFFFMXFFb2FvY1pt?=
 =?utf-8?B?U09DWXRnUUZIdFZsNlhjendMZ3pSYVdWckY2K24wZTFoL0k4bURvTHFpaVY3?=
 =?utf-8?B?SkYyZkQ1dktKbmJkTm9xQ0pkdmQxN2JQT21lVTlzK3VUc2k3QWM0bkFmRUZ0?=
 =?utf-8?B?YnY2bGNTSFJ5aWJNWWkwTnR5OUlkZHJ1TENWbnA2b1doREx1YzVTelZvS1Br?=
 =?utf-8?B?aXFRWFdvK2dQeGVVdE1RQ05yUVVCMTRyY0tuUlRRV2tsMHlxNitXbWlGbGFI?=
 =?utf-8?B?dVdCS3NLNktGb09TWE9pRkxGNDRlOUo4YjFnV3BxRFlPZlI1SkltL0ZmTzRi?=
 =?utf-8?B?NmNLNmZCaGpGVE8zWnh1TUlaQXRNenVQVlNIVWowdkdLL1F3V3ZBQ0lBc0Rq?=
 =?utf-8?B?RmlvS2E5cFVwazdnZzRpNGtsa2hTQjI2RGR0VFVUWGVwWEw3RjJFandaVGhx?=
 =?utf-8?B?TUp0cWliMGY5S05Xd1FDTE5SdzZKbVE0Z2pib2UyUHdCTjZZT3hiSkRvUnNh?=
 =?utf-8?B?UTZpK0I3ZC9kdXlsd3F6TWhjbFBSbkFEWSsyb2Fuc1NwYzd5L1AxWXAwNUJo?=
 =?utf-8?B?dS90SS9BSmlHTnRzOExQOUhzQS9WS1JQempSejA4RkttKzQ3cHppc3hsMDVF?=
 =?utf-8?B?SktFVlIxQ1h3ZnlWUjBITUhhWWdwSWNSKzBLNGpiRC9SdndoTS9GS3FHOHU1?=
 =?utf-8?B?Zmd2MDRwdzN0TUtaUVUreUlsVTBVNXVWbVJDSjZZRDF4K1Vocm1DY3c0L3lU?=
 =?utf-8?B?aHR3UStZbHRZaWw4TVVTcmtYQjRkYVpWZmo1TjhISlhtQXk3SWRTc212aE5k?=
 =?utf-8?B?RmZYMURPdTI4cUVtYWdDZmlzVG1pU1pMa2dFSmhISzhOZ3lBbHBVRXJWdWdE?=
 =?utf-8?B?a1hlVU54a1M0ZVp6NXF0Q2FtVitvcDBaZktObmNQUHh4U0tKRVVjSTRKZ0lS?=
 =?utf-8?B?Nk03V2I2L3pXa2RtT2t0T3B1T0o0SElSbWFCbDN6c2UvTU5OV05GSExFZGg2?=
 =?utf-8?B?ZzFObWZiVEdFcTRxYzl1Q21tTGp2REl6TGtvdnlxVEtXSStxVW8vK3A5WnF3?=
 =?utf-8?Q?hctlawNBQ/+aP3XUzSKJu/hlwPXbBm2M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NG81c2sxeXhheDdmbmp4aUM1bWt2UHEvaWV0alRiTkFWUkJpT3ArRElaNnNM?=
 =?utf-8?B?Tkk1UU9HTHVpaGxmS0I0TDN0RTlCU082U3d5cFI5QnhyNnU5SmFrMDJxNzdn?=
 =?utf-8?B?ZVlqVGx2MHU4Q0EvcjVaeDJZK0FqYlA2U01MNXB2M1VJVWRodVBIbEtoZWx4?=
 =?utf-8?B?aUQxSG5hak11YUpwZnFhdlFiY3A2M1VGcHVKT1hEeFJHRVpUcGlJemtKUlhr?=
 =?utf-8?B?bW4rYThQQXNhNTFXQ1BQa3NjSHdrdXJzamdBaFR0NDArUUtYR2YyOVNIbzFL?=
 =?utf-8?B?WWRON1h3ZjVqbnBLVlYvLzVwWkNlbTlvTXIwNjI1UTZtZGF5MmZ3OUxqaFpt?=
 =?utf-8?B?Q1JkY1RIOGNYb2V4ZmR2QVB0VS9jSTVqQXlhQ05RYmQwN1UraU5jUzJIVEky?=
 =?utf-8?B?bzJFY3dqSTFBZXkxSWZHVENuWHBWL2dGSkN2Y09CMGNSUnJjTTEyZWI5Ri9W?=
 =?utf-8?B?cGg1cmhzSEVwZnN1dVFSamRvRzdLWTdNVWtnb3FOUmRZZTR4UlB1ZGgrdzZF?=
 =?utf-8?B?V3ZuN1haQUEzVmNtNjg3ZmM1ZkdBMTlNYndhR3FMRUxzS0M3S2xRSlBaUFFp?=
 =?utf-8?B?THdiK0hMakl1WTQ2am44M0toZE9iNnEwSTdONEVDRVlvTVIvUUNwQTRKbmR0?=
 =?utf-8?B?K1dmVzJ2dU5GdkxHTXRJalNXdjRFWm5RMVQzd2YyeWtXM0Vmc0hUK3ZsWTBB?=
 =?utf-8?B?enMxemQ1QjVvTGVjSi9qczhVYzVkSFBYVnJuT1JkY0d4dGxsTEdab2ZCQ01p?=
 =?utf-8?B?NnRIRWxOem9mMnd5dlZaWWpoMTFod2pBaTZKcUFZVDdpanFGYnhrSDYzdU9O?=
 =?utf-8?B?TEdtQ1IzTWUrU01BSm5lWEM0aU1sVHFEZ2xnSWhYVXJQeDc5K0M4YVgvWnVt?=
 =?utf-8?B?UFhueHpCQXFrai9KWWxVTmFMV2JsdmNZRFZpOVFEZm5zdUgzN3FkQWJnK3A1?=
 =?utf-8?B?TDRUNDgvZW5YU0lKSEtZZ0JsOFZnTjJlb1E4MmIzcnVUVnFxY29VcXh5NnlM?=
 =?utf-8?B?N2Z1N1JpOEFWb0FhRVNwYTdGS044dU10YWhjVVdjbHExNmI1ejhGOXV6SzJ6?=
 =?utf-8?B?bXpyUTJsMFBYREhtaWNONDNrV0l4R0pvUzU5TFBDRWNRTHlQZEozR1lzTmMr?=
 =?utf-8?B?ZFJqZE5mQU5aV3ZkQnFZWU0xK25TT3RObTdkSGRvcTA1alV0ZTVVNk1xVTNn?=
 =?utf-8?B?MmxMUzdwOW5xUGU2ZG81c24zL3BhT3pQUEd5d0JiZkQ4cnBySWQrcmt3VHVy?=
 =?utf-8?B?Y0lpZElQK1MvV01WVGF1S3MzYWxjQjJSVlVIakYyNkR2bFg3blBoMXNnT2FW?=
 =?utf-8?B?M04wWHdFMXIxSmliWkUyQ1BZTFM2THRraWdkcnBZR3JtTmplYW5KWFIydmIy?=
 =?utf-8?B?dFowQWxwWUpiZFpuVFBPZVgybVhqMUc5dlRXOW8rVGRZMkt5L21oQTJwVXlC?=
 =?utf-8?B?enIyWlZjK1g1Yy9qaTJMdkpZUlB0V1IxUVJ4ZGYrZFdleUNORWUxSCtzOWRz?=
 =?utf-8?B?WUt6K3JDTjBNdTVVeUVrczdKbUc2Si92LzUxNXpaR1NaQnFQbGVBRnZrRnJR?=
 =?utf-8?B?ek1LNWUxYTk5MFBzNE00dmN4ZllLQ3FXQzRtY2l2YWovanZLRDZlZmgzM3RE?=
 =?utf-8?B?a3EvL1dqRExJaW4wOE1Bb0kxRWpwb3VhRjV2d1cwdGp0cFpRZ3lxNy9DQ3hQ?=
 =?utf-8?B?WXhrU0ZYQ1NkbzY3NXVKSlpOcXhvTkROcHZjWlNzVXRoWFBjUjJYSmEzeStY?=
 =?utf-8?B?aFdWQUFCOHEwZjNQYlJxTngyWXZMRTVKYk9RczlSd25HczI3WlJSaFNIVHJZ?=
 =?utf-8?B?dXh3QWV6R3RsRzdQRTR1VEhVK1Fwdk9wREVieVg1MFhObmx1U09OV0g0elpC?=
 =?utf-8?B?S3RGUWFwakZaVEl2d2NCNmlGQ3BYajlnNStoYjRNV3hjR0dyN05zWm9nL0tp?=
 =?utf-8?B?cDQxSnMydzB0WWo2VlI4TDc3R2pxd09mcWdrQklHVTVGd0pQSWx3L2FhNmgr?=
 =?utf-8?B?ZjRDTUFBeSs3eDFEYWhpNEtISG9jSFlzOUdNcUlFZGFPZTI2RnZCVVFSTUQ4?=
 =?utf-8?B?eElVY3NHR1JBS0FmZ1ozUmNramJrR2NkODkxUTZOR0R0TVdod2h5dmhMMzlB?=
 =?utf-8?B?empnNkdvTjIzSGVXUXZicEZiRmhLaUViTVI2eGIxemdkcVJWRTFpTUdZanYy?=
 =?utf-8?B?bUQyV2JsdjVYTldEMUFqa0lmTnVUdXpYbU9TSlZxZStqZzFrWjhVZnZ2cDcy?=
 =?utf-8?B?eXA0MUJ3RjZLc3lpb3ZSNDVqTk50R0JwUDhWcXU0U3dDbW5yZml4SjJVT0ti?=
 =?utf-8?B?Z09jRStNeGVBdTdXWmlEcXBpY3B3Z0ptdzh2U0lDbitTRHBCZjVVb2lBYW1r?=
 =?utf-8?Q?uCiw/NR/qbOWAoDc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef46718f-72ba-440d-4f1e-08de4e281982
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 20:05:26.8790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S902pKeWcHmw6bqZJO9Hoc+1MhCBrFSLTQOlbrpUTt4OWvyFpAtJzHZ47en5GnBg+1bEbsP57RaQ/RoPKYd/mLtBAcj2bcPJL6/Q4C/8Qtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5969
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

On Wed, Jan 07, 2026 at 10:27:16AM -0800, Matthew Brost wrote:
> Device-to-device migration is causing xe_exec_system_allocator --r
> *race*no* to intermittently fail with engine resets and a kernel hang on
> a page lock. This should work but is clearly buggy somewhere. Disable
> device-to-device migration in the interim until the issue can be
> root-caused.
> 
> The only downside of disabling device-to-device migration is that memory
> will bounce through system memory during migration. However, this path
> should be rare, as it only occurs when madvise attributes are changed or
> atomics are used.
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Fixes: ec265e1f1cfc ("drm/pagemap: Support source migration over interconnect")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index aa43a8475100..03ee39a761a4 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -480,8 +480,18 @@ int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
>  		.start		= start,
>  		.end		= end,
>  		.pgmap_owner	= pagemap->owner,
> -		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT |
> -		MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> +		/*
> +		 * FIXME: MIGRATE_VMA_SELECT_DEVICE_PRIVATE intermittently
> +		 * causes 'xe_exec_system_allocator --r *race*no*' to trigger aa

s/aa/an/

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> +		 * engine reset and a hard hang due to getting stuck on a folio
> +		 * lock. This should work and needs to be root-caused. The only
> +		 * downside of not selecting MIGRATE_VMA_SELECT_DEVICE_PRIVATE
> +		 * is that device-to-device migrations won’t work; instead,
> +		 * memory will bounce through system memory. This path should be
> +		 * rare and only occur when the madvise attributes of memory are
> +		 * changed or atomics are being used.
> +		 */
> +		.flags		= MIGRATE_VMA_SELECT_SYSTEM | MIGRATE_VMA_SELECT_DEVICE_COHERENT,
>  	};
>  	unsigned long i, npages = npages_in_range(start, end);
>  	unsigned long own_pages = 0, migrated_pages = 0;
> -- 
> 2.34.1
> 
