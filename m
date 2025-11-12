Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34231C52773
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7324F10E73C;
	Wed, 12 Nov 2025 13:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SFV5PsDH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951C310E733;
 Wed, 12 Nov 2025 13:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762953873; x=1794489873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=mbfInv4MkJk5M0Gg/gDdRXheK+KSHTo0IjgoNtHDIU8=;
 b=SFV5PsDHs7HsT51blgXm/NG1av70pLOnlByRO+0xkKX6Ptif7CawCbcI
 AKSJXgGAHuJZofAUx2VIQcVm32gN2lOBAJYPr0iht45TTckiJwcFGesQl
 MrpIl3BPD6zjOeXzoizBJ5EriyRMy7hZgcYwF91Bp/VnQpeKXTQOGFs1K
 3BX62of+1X8/qjKVU6XETVCPtIUqeBax5SumsCWUhvA4I7XjEfHPZJoRl
 +tliDbnSwrjMFtwRSFbzQOsBIOqKVnOLjwSCVbNONIzaD97Pvfdq6EQEO
 2SCUIhzIPLrWQsr6UIt1nhqdc2rprGOv00lEHx+Ye+CnC98Xg+Q8URqnN A==;
X-CSE-ConnectionGUID: Xl9PmTC5QmiHhuZfgFJS7A==
X-CSE-MsgGUID: +Jy94IvjRFKa3pxlAKJDCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="75322790"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="75322790"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:33 -0800
X-CSE-ConnectionGUID: T029r+7eStWN6xk0v5ylBQ==
X-CSE-MsgGUID: f5V5aFuMRQ+ebeFaDJhtNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="188858103"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 05:24:33 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:32 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 05:24:32 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 05:24:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDeEcoMA5NlN8YZC4FLKEHMgF27jeqOCGCxetIzZJdcpzGTkpG+N+je1xZyfCFQjJcmhNp7VQJ5Nul3aAZsAXWdaBKebP8O03P6aZc/Xemvj/5qNHHjxdaXxddH1ZEIcOdaejeVv3/rEg7T9h0NVonnbwwTt5hOZ9XbF4BLuwLhlHtCqKhwdwWOn+uGXjWgaM6oojGiqegmorjo7V/byuCDbEeTQqkhl6elceCiGS3yUAikHqA3sN0ctYbAerEBo/nnDYPnzwrQy9al8VqnWM3G2S6Jowc6g6LT1xG+sDRWTdwntujte5/dD3P3LQEP2BsxgnEcuIOpz+MA8DGealw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lOHNlG7XUxIdI4w4Rx7YDO+HIGjpC4VkodDBoP2iy4=;
 b=QoXOB8ZO0atfhrnat6pWF0+ADwMV0LP+sCPdYMGHFXOumAaYjQdw4i+Og/KtJbR9dvFfSBqTOlwtrk6+MI5PbUF1QMnx8/PhxNWY+ACXr1o6DRXqqXDrHQBItOfh02v1rHOpTq1WmYjxbxsotc6ThVY2T/uvcY5js+HqDhIzaG3bwFGoZCWMgOAEg7uBiuWt0kI0+4zNX5eJqyzyK9PzS6gfJGDNM3FhfKfWvmLZbb54F/a+c/NJwGqKbtHou320bUnRHOeWkGIPbjqcqce7MYejEbzqeTQ3HZI8Y8sfcqwYi+RoZERMhaweYAEeHMsBskGpCs2oBtDItjqeafe0cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV1PR11MB8849.namprd11.prod.outlook.com (2603:10b6:408:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:24:28 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:24:28 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>
Subject: [PATCH 23/24] drm/xe/pf: Add wait helper for VF FLR
Date: Wed, 12 Nov 2025 14:22:19 +0100
Message-ID: <20251112132220.516975-24-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112132220.516975-1-michal.winiarski@intel.com>
References: <20251112132220.516975-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0003.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV1PR11MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f4a3e49-c635-432a-1206-08de21eece2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZG5YNUxmTG9XTUxmR1o0M1FGMDFyNllucGpDeVNiRVBpUXpqems0R0N5UUsx?=
 =?utf-8?B?ZjI2a213K1FMTFAyQzFKK1dybU15Z2tScy82V05iNnZFU0RhRDFEeVF1VDlP?=
 =?utf-8?B?WmRpTGY1a0ZsRUxSRFlzVzJXT1NJVC9vVFdkTlkwVmlKM3cwZ3IxUngyQjAv?=
 =?utf-8?B?eWZSblllcTdoKy9GZE4wK3R0NlNxdVhlMFpkdm15d2EzaXIzKzBRWTMvZWRN?=
 =?utf-8?B?bmp5TTh4NytGRi96SmJoV0ViTTU4bWZyOUFUbzRaVFplYmFiSFc2NDEzc1ZN?=
 =?utf-8?B?cFIyQ29BMDMzRjlrbU12RFVaUjhycm1MSGVFSm44eVpZTFJVRmdPdUFsYjhh?=
 =?utf-8?B?dnNyeHBhYVpDNTFjcnRZK21sNkZQMUVBSFlVVGtRaEthM2dlbjNuaVBNc2pV?=
 =?utf-8?B?UXNwc1RMQTRPUENBV0JTSEFFYnJiZXJUU2diUmY3RTF3andNaVF6VjFXVXRl?=
 =?utf-8?B?VHpSb2dYM1loRTRFTXZkWUxjMmMxK1FMS3pwenJOOEZnZlZ3STVWbENJL056?=
 =?utf-8?B?eXBLZ2VPa0o5dEt4cFVMSW1FZG9HWjNBR3ZnOWdTVXNlTENaRlhhWHlSald4?=
 =?utf-8?B?TnM0NHI1L29Ma0VVOGFpdld0aHpQWTBxalBZYUx3VjZqYWF4bGZnd3V3TVIz?=
 =?utf-8?B?QUNOL29wb2xEa1ZLYXRRSGlMdy9tUndqTzgwMUNpdUJLM05ML3l0UlREU2do?=
 =?utf-8?B?amRpdnErSE9mSVl6TnVYd0tzN1A5ZVRUelY2bXo2OHp0UnlTNkdjVmU4ZFdL?=
 =?utf-8?B?OUhFVldidkJoZFozSlhORjFYTW5aQWtHekJlNHpnOEFDTTQ5K3gyOW8yNkZF?=
 =?utf-8?B?dWZEelJuK2VEN3hJNzBnTEhUQ2QyNUlkbnlyVkJqZllwa1ZRV3o0aDBvTDZJ?=
 =?utf-8?B?SGN1NWk2c3ExUTF0b1FZZnd4UVJwREEyMlU1WHhGOFUyZnpkZVhnZUkwUG9s?=
 =?utf-8?B?MndNaERDekNnU21laE52VzdnNXErNGRKeFNUZVhENmlDaE5oRWs0UVlmRUIv?=
 =?utf-8?B?VExNYVJOdTJsNHQzQWxrelZKNitWRFI1WDJac05QM1M3Y0xEVlZFcnZZUmEz?=
 =?utf-8?B?L0Q4aFhIUU1mMTY3Wk1xdFp2UnVhTm44OFRoWVdXZytUMzFiVTFnclpyNXdj?=
 =?utf-8?B?ZFkxYU1mcllSc0o0Q1laQ1ZYbXFybXpqMHRNemVYeVdQeFpNRjZoSFVGZTZD?=
 =?utf-8?B?Q2hkUUllZHV6Q2sxTmNRcFBrU1lCV2E5bllWS0ROZlFxOGlVdlN3Q3FEaGtw?=
 =?utf-8?B?T0g3QVVqMXdPeXV4NGhIbHNUVjVRWUhLbDQ3eG9mM0lTUFl0WlA2YnR0YzRk?=
 =?utf-8?B?WlI2MllyMjhnM04rRmRZWE9HeHVRcmJRV1hwWHBDSGl5L0lMa2dIbjYxUENT?=
 =?utf-8?B?dU5hMW5TaGV0UVRqdkM3YVhxYXBlRllMcVBVYVFvOWV0Mlp6VGdFQmNZRFVH?=
 =?utf-8?B?a3djQ3VrU0ZQb0duZ3NGbm5TOTM3WGJic1pzL3ltQU1xL2Zxc2FFc1VsWnl4?=
 =?utf-8?B?c2FjbEx2TUhjOG5oSWxFQzRiaG16OUsxSHNSOWxHdkNxMDVTRGlWbHArWVAy?=
 =?utf-8?B?TmZadDNUcUFjOW5Ga2srVnVCU3hPdldMVVBXNWw1Yys1NjZpZXdrcldjRzVp?=
 =?utf-8?B?ZElQcDJIMHdZY2Q4eUpJSFVncVR4Qm5FU2NxNkJFc0JzRFc5RytOdnQzLzFL?=
 =?utf-8?B?WTAvWWdaa0VoM0VwMlhtSnhva0pwT3JDNk5IaGE5K2ZVRXJQeXE0bW9FMUxT?=
 =?utf-8?B?T3JHNWVqV1diaGJTR1R4RmhFWFNuTlloR3l4U0VLQzZWTzJ6d3NlRE5ya2JT?=
 =?utf-8?B?Z2hJeG1XRGx0S1Q5UXRMbzFQMktmMTZCY25UMUNqVGNtUGt4ayszMUw4VEVK?=
 =?utf-8?B?NHRIYndyYnZOdE5ZOUFRRVREOTdoK3lRWTJtblJlcmdKaTR2dHFpNERTUUlE?=
 =?utf-8?Q?kd08TUTAVec5b0wB3+SitissrjCI5Qvw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWd4SWFmbUQ4MFJRSDBlTWYrSTJsMlBodDk1dzhsZnR1SCs2eHNmZ1pHdW5I?=
 =?utf-8?B?dzlpSzJyUG9sMU05WlJhd3I5SWpPbzBIVUZsTnUvbEEzbWMvc3NmSW5LMVdk?=
 =?utf-8?B?Y3hISFl4V3RmV3p1SHdpanUrK282NDdTVGkrbWpWWnVTcGIzVU1MbUFUQzY0?=
 =?utf-8?B?Qm1ZVXMvT2Ixb0xjaWN1aXBrNmxkYlBRTG5FRjF1NnpCTytycENobS9uby9h?=
 =?utf-8?B?NzRpa2JvZGgyaFJxZjAvVnV5ei9zWUhKbWZVNGtCY1YxdlhRcDNuVVR0Z3Fu?=
 =?utf-8?B?UmluTkswRmptQWpjcW5uWmRFaUpDdWhzdHpjQ2NEcW8wcFlqbm14TW1YN0FC?=
 =?utf-8?B?WkMyTEpsZnhGc3JvcFBZK2JiYTN5MTRYSE1SaGFmbDAxZ3l4UDhCZ0NDenB6?=
 =?utf-8?B?eFRlbHJOWGZRMkVkb29XTjJ5Z1JRYk5VTzY4L3RSSjIyRk1mKzdjYkxwWkYr?=
 =?utf-8?B?VEZkSmN4b3Z5REtMMGh6V1NYSVFnTlppT0dJYzkzYjBGU1NTZWdudWg5MldK?=
 =?utf-8?B?akwzTmNWNXdGNFZzRHJvN2dHODR3b1ZMY0JyMDRhVm1BMkh4WUJ6d3h6czkx?=
 =?utf-8?B?ckZ3S3NDZTlFWDRKRFNFUEhpNTliVnQ4TEZ3S3UyeE9QNVR6MUgwR3ZxcFA1?=
 =?utf-8?B?eW9YK3N6cGVhWFY1TlRSSnBMQ2MxVDZyclJVanJTTElEbGFSTGNDSW1aUVc1?=
 =?utf-8?B?NjVFajZQQWtOWGlFTm1neUwyVXhNNXM1Z0pSZllDRjRuRzlwc1NldDV2cloz?=
 =?utf-8?B?ZDUvbzQ0T01mTmd6YWpZcVJiTzRJa1FyWlEzZ293ZStDb2pGR1dPd0tnVW5M?=
 =?utf-8?B?YlNqYWhpbGZXZ3o1TEc3MVVzdjZ6c21TeGNoZVErbWZaeTJxUDRHWGhjTEF5?=
 =?utf-8?B?elV2SXhpR3o3ZjBaWjYwV0hWK1VQQUlYNVJNRzNrWmpsT1lQdVpKS0p3OHBM?=
 =?utf-8?B?LytyS1EwdVVkRndJcnRpTU9IUU5KeEEvYTNnWUpvVTVQMTVXcDFWUjNXampI?=
 =?utf-8?B?aFJHYlJ4R1NyM2ZVS3hWZlI4c3NZa2pFZUhFMHZiTWhQVGorTCtRdlNpc3JJ?=
 =?utf-8?B?RnFid2xaVHZCTEpHQUFjdUdkZDR4TUtLR2MrOElvbWNleU9WUWtqYlFRbEcz?=
 =?utf-8?B?NTRxN0NrbVJOM0V2UjlvOTFlRlQ1V1dZdVo5MWcrVEl5SUNOQk00NXFTMW82?=
 =?utf-8?B?RGhneCtvRFFnOWNhbDZPUXNqTU5CNGwrMklkT3ppSG9EdmhjWDNaQ0ZCQmJW?=
 =?utf-8?B?K1k2VnVHRHhjUy84a1BsTHFYSVc3eWtpV2pZUUp4TmdFcGdoS1JzMW1mOHM1?=
 =?utf-8?B?MmRYdlRFUkxZa2NVREhCUFZGek54OGhEODVML3h2WGNMK3M2YmJkSExJRVhF?=
 =?utf-8?B?VzR0WVkzSGhITG5BQzZkSU1XbTFuZ0I1SmxJVDhnTXNvT1E5RHVzZlVBazZC?=
 =?utf-8?B?dis1Wm84djBPMFR3eWRtQ2ZTT0xFYmFwczkrajIrSDl3Tm1DZm5qV1pFREJu?=
 =?utf-8?B?dUNGcDFmR3JzNEx4cmJmY2tzOTBoZFhUUG1zeEFGU3hMcnkzTVZZRFpiaUJ6?=
 =?utf-8?B?V0hIc2ZKTW1UUUkrMGloMm5mY0IyN1p3dVBQd0dEajQzQzZ2cHdUZXFwSnc0?=
 =?utf-8?B?eVZBQUs5NGZXRm1pdURZdWVLWXVLS3Yyc1cvUGM3T0p2NmY1ODVZd1lnTU1Y?=
 =?utf-8?B?UUZjc2hwckJ4L2wwR1hNUDlQNEdWY0dMbjRDdXdTdCt4aFhlYmNKNi9tbWU1?=
 =?utf-8?B?bGN4OUFzaU1NeDd2eitpQmlodjFMem95UUM2bENCZHYxL3FsMElPQ0pWYWpw?=
 =?utf-8?B?OHFGSnJZUno2RklpZ3M3YnNmMEZGOWUyd3RkMVRBSnlqT01hOG5ianNjNzV5?=
 =?utf-8?B?ckVTYm1SY29WcjZPYzJuVDVlNUlTZFNRUGZsMnc0WjM5SEVsUmdQTFZ5RnQ4?=
 =?utf-8?B?RzVRVXF4d0FScmZtSHVxOTNDT3BUSXNiQjlLWkVtbGszRXBta2dtQUpOaGdz?=
 =?utf-8?B?dzRaMHE5Q2xTQ2JZWHgySnNzUEIwMUxkazIrRzluOFJWbEEyZmZ5NFVMUjZL?=
 =?utf-8?B?VEZzVnY5MEFmdW1BeDRLOXhMWFBRUFdCQkFHbmh2SklnOTV3aUgyWXZSbFdn?=
 =?utf-8?B?Z1VST1NKWmcxMTc3ZlRjRjBZaVdkSFlFM2lhakx6SmlPN3ZBUE94MmhHYzJ4?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4a3e49-c635-432a-1206-08de21eece2b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:24:27.9880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLXsLYYjM6aYGEXx2mdY28cHedwW8mM18lmiv90WyzCpCsECQyA5u+k0DUhXpbYEC1GMZD8Tiwow4eEdvkeTH+EDqmmIhV1sGBCKM6XclpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8849
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

VF FLR requires additional processing done by PF driver.
The processing is done after FLR is already finished from PCIe
perspective.
In order to avoid a scenario where migration state transitions while
PF processing is still in progress, additional synchronization
point is needed.
Add a helper that will be used as part of VF driver struct
pci_error_handlers .reset_done() callback.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_sriov_pf_control.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_pf_control.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
index 86668bd4213e0..ed4b9820b06e4 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.c
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.c
@@ -123,6 +123,30 @@ int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid)
 	return result;
 }
 
+/**
+ * xe_sriov_pf_control_wait_flr() - Wait for a VF reset (FLR) to complete.
+ * @xe: the &xe_device
+ * @vfid: the VF identifier
+ *
+ * This function is for PF only.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int xe_sriov_pf_control_wait_flr(struct xe_device *xe, unsigned int vfid)
+{
+	struct xe_gt *gt;
+	unsigned int id;
+	int result = 0;
+	int err;
+
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_sriov_pf_control_wait_flr(gt, vfid);
+		result = result ? -EUCLEAN : err;
+	}
+
+	return result;
+}
+
 /**
  * xe_sriov_pf_control_sync_flr() - Synchronize a VF FLR between all GTs.
  * @xe: the &xe_device
diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
index 30318c1fba34e..ef9f219b21096 100644
--- a/drivers/gpu/drm/xe/xe_sriov_pf_control.h
+++ b/drivers/gpu/drm/xe/xe_sriov_pf_control.h
@@ -12,6 +12,7 @@ int xe_sriov_pf_control_pause_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_resume_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_stop_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_reset_vf(struct xe_device *xe, unsigned int vfid);
+int xe_sriov_pf_control_wait_flr(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_sync_flr(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_trigger_save_vf(struct xe_device *xe, unsigned int vfid);
 int xe_sriov_pf_control_finish_save_vf(struct xe_device *xe, unsigned int vfid);
-- 
2.51.2

