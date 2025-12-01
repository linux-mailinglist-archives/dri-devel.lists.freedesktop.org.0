Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4899C98DCE
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 20:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB44810E476;
	Mon,  1 Dec 2025 19:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TmIzEngE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7677B10E470;
 Mon,  1 Dec 2025 19:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764617647; x=1796153647;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=emSgNlA/d1VdpfHj1K2m1alaafpUwAOujwOVyBnGlMU=;
 b=TmIzEngE43tqrRWt0y3eNcqJym998GnSvDU3D/TTkJg3PrYm+K32meFP
 BdmttcEqOg+JweO8cGq1RWXtAzQLBcCzrNakE9zSAIAo1fdWQ+P9a/Z8h
 wf7N/VY1/nKIvDOtKwO7GId8JFFdrsC7kX32X/e9RCILDZaGtWnUvwVdJ
 qGTR9N54aAlZMKkMj1Ay6Hmd6Mjbzo11H0iVnMp331X6pMpTd9Xrpzho8
 yEWOFubkUyJXMd8zmUzPD/6I1mgpnYpLeKTUyTzAW2PkazGk0K+cwo7tJ
 M7LLuv65F1/ErVyXiY5TccC+YINfZvz1j8aw0oQffkUj7BWavnyC9Io4d A==;
X-CSE-ConnectionGUID: BzFL+s9eS9yaIOUkSQHf2A==
X-CSE-MsgGUID: H9FkikizSQu1aUdIr9inCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66607102"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66607102"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 11:34:07 -0800
X-CSE-ConnectionGUID: I00kCBMKSYGsDjNfLv1K8g==
X-CSE-MsgGUID: 221y7yD/TZ6b26NfJXhTwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="194954498"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 11:34:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 11:34:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 11:34:05 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 11:34:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyTReQLC5wzhzJ0YfOYSneLflNKtIcRaM17/4g+R25ucxFn7LVb2jjdyfJHGgSW6x57wtE0LdKeBR2Q+2QJr7YZRFQTmPn1smmh9A1gHGxw3hZKCH4Q/8ty8KU0P1GxyL8jxIzQKHOY3v5AgRV5CoH4X7ClOrNnC4Rt31VJx5FsLD17rqD9JFbizk0LMddtlHxxZa/RUQRZjNIP5WF/EuBLAX3SqqLHn+SsNLNYvWb2bMlBkzQZBwmOXIa338WSa+bBbjvdpiDedKWNK6gnwobBNCrF9xPKR8C8Oa41fSwQQy6s9MESbfooc+y+bOdZCSJ7iZ4y9bzFzn1a0C+pSPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JfaFhvYMVss6c4XFD1ikaJIZMkDWb/pC22LE1GnAS0=;
 b=RctqGYKrc6Xh/nOZeH/alP8OURpULPwl31NXExBjLXAc4BI3OiM/6XOe8/SrJ6FnkxdrQKFninS3Z9n9sZ16m/VeShWISnf7gLAjfXXWS78Xty4fJHBzW4L8VajdOTfYI2uLCGbXzQqdfPMcVISoFI6Z/TMwK8/L1CMdqbAO9bHTq5SyYBTT2j2Ol8kIPmSoTAkqgp0yvmKXFNSjHEOKCizLwMu2nUnwtFYt/2xq8VCPVKhmjUam6dqei4PAVpsraIX6/Sx+Ow9HbTgYVnAjbVRmbNGkSIZ5eVsFc7t7qakzvSwgxCfzeq9CXLw45dNDVo5Qje818WPWnLSpCzIwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PPF1A34EE115.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 19:33:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 19:33:58 +0000
Date: Mon, 1 Dec 2025 11:33:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Philipp Stanner <phasta@kernel.org>
CC: Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 8/8] drm/xe: Use dma_fence_test_signaled_flag()
Message-ID: <aS3touSB1ZyR2hfM@lstrano-desk.jf.intel.com>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-10-phasta@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251201105011.19386-10-phasta@kernel.org>
X-ClientProxiedBy: MW4PR04CA0315.namprd04.prod.outlook.com
 (2603:10b6:303:82::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PPF1A34EE115:EE_
X-MS-Office365-Filtering-Correlation-Id: ee041753-9b9e-407d-4569-08de31109236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7GK0tplFJ6S9wYnb4pzDoEfVbbiLfWgyl5bdaGp0YelOcC3tWqfb91q+1f3m?=
 =?us-ascii?Q?T6noG6d/HPg+U1a+iaa2AURGTwT4wVg09GbRRID8JUEvxAsi3xo2sJ5ZhvLg?=
 =?us-ascii?Q?Jp+Fnzyc8ZlA/exbKAiq5Um17K5951LMSEpxAk5KZ8poUhsEl8qcLxwlqqjC?=
 =?us-ascii?Q?zKMK6S4M7OZNT859h+4Y1KMtMfohCDOPfP47SaELHdTyDFXt0oqKPUoBDxAV?=
 =?us-ascii?Q?GfkAPu0Yxe8v+/N5Qyun/9sjkGICnotvpBN+vWr5BZPwnbdjmqZhXyu0vCzD?=
 =?us-ascii?Q?fM89wK3+mwEK5aX62NlRMiqJS8onih+Ix9zy5/pD6KvGh01wezhwa+lcvwn6?=
 =?us-ascii?Q?XZqKrxXG2LdCG9KyxkSDcPogb67Ozkx2oISH39wfR4jBPnPcl636m2Deq4fl?=
 =?us-ascii?Q?iVdbFUUz3r1Ti2f9wdCBS2vDxycV+lizuJnuxye7+588E3K2H3dNv+6ahvwx?=
 =?us-ascii?Q?aTnhnYAspSTI189G8hnosjDlHPbI/o87Uv9777JY0zoe3y7UyE23I+8q7Nek?=
 =?us-ascii?Q?HI65bxU/XqQ7iV/AjVEG9sc1/CMTtpWJzzPKO48DyGP09yW1c2VEqSNx6muj?=
 =?us-ascii?Q?U4hXBPAUhiWgLYh6EuEWpiWE4GljOp/obkKQFYOP5dVNCnRIlVa56gaMaAD2?=
 =?us-ascii?Q?vJSzdn218VDICi6vxCovBfYvr2i5nLVzw2Hh/LViDjIDRnoT99cC48TrM6iO?=
 =?us-ascii?Q?NBtzCK9GrR/YPtwmW+NlPLvgYyBgDOuMUPAfJHGJw2y781dDOkzHrAYZdErn?=
 =?us-ascii?Q?0TxLjMxqHE/xcb6uaVRA94gZlKGTySVrAMX777ip25oaPFKKdENDO9+jJ8tw?=
 =?us-ascii?Q?aocjmZlzjZ8eTsH7y3rt466jptvUrUboIeSVV+iNtcFOhBWe1ROkQmgbU6js?=
 =?us-ascii?Q?nYlfs9Kzs119kl3zo6nhQYVjDN9Jgwtnr+V+owUDX6kKivtB06J4QqA0bYfW?=
 =?us-ascii?Q?2V2REF1zCc2JJgGwQiu0cRqYxe/X4VMHTL21OZv71v1Qu49LhkPjZej5PvjP?=
 =?us-ascii?Q?k1lsZq1Lfm1eS12otChMOM+IhpCUJ1eoJODVZElg18vvh0GHnvbow958JWMY?=
 =?us-ascii?Q?F3J0uov8/pL0CbrFbwEk+FfjGCfNXMVN2BdxIq4KcLj1uJSRrLBwKVLgLEMr?=
 =?us-ascii?Q?C09rVIFhLCZX3/d+Q2p6oauUQ3eR53kkGPBzYREe9Guqbs4ZNVNEGq0Wp4As?=
 =?us-ascii?Q?4+IL2LAyMZO5t2/5YUpNzUBN5+Vgjg4UYHo9YF1nWU4Dsn2plNhiISVYiO0R?=
 =?us-ascii?Q?nx8yfnQLZQHkojgrOXP2dy16Nk5lCrPfNvIs0PaNM6nJORKsguKg8nTD6+jp?=
 =?us-ascii?Q?u9EmJwWlMBAS9GyGSeIUKvgycT98bajoHmoBRZOI6mAkwbtgcE1AaGqx82au?=
 =?us-ascii?Q?lO/rgU1BFmRroEZ9TtJ3/nFxmxCt6y/jVPueRAh9t5WNUfv8ZNADykKcqR1a?=
 =?us-ascii?Q?QX1l2/qBmf2BDiYHsbbNcHLb874n0zSy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8v9L5y3ENpuZPuXPEuRoIEwv03bSzNmAReUCnRwButwJ1xjcT8M4NO/kV6PW?=
 =?us-ascii?Q?UBm/jiltuXkZTmREDb3UZ6YG34MJONiOa0rQUcXqG2eGksnDEQNSYTOqpr7D?=
 =?us-ascii?Q?V33hmP07cEIO9z1jdQKadgO3f1vtRfsELGYHR9OoCDjUm3TJOQz8xLO7CvWd?=
 =?us-ascii?Q?/2PdDOzHYsfyTpSPWu9qwVgLqORZr+latLflWknWWU9Gnvolk0TrMJ5TIYx8?=
 =?us-ascii?Q?RD0OwNHqK1qyvZq3KUSRhj783As7k2ICGdmN+ov6YqwSdhMD+rmNWU7tQF0x?=
 =?us-ascii?Q?ECxcudHNx9Fi+5bLG1m9ycl+FyEj+FnSErU3pashVNmhwUbtidz3nERxs+Ts?=
 =?us-ascii?Q?8LZ9eo/i4r9pMrYGf9nARrRWT8OnNM9oET4fH9i9OX/bbScN2lQdV9hRWgBJ?=
 =?us-ascii?Q?48f9opERnh5bQw+anbjbFOINhXaaXOpfxAgNF9CGjeJaVpzXc6pA7BXH837y?=
 =?us-ascii?Q?PTPNlHgbKTm2J9rZWK4oyIi9HaLCreRU74T/GvTnn+LBUkMsyhAyCKZx/6q7?=
 =?us-ascii?Q?dt9pt3ql2Qerhehzh3iX2NDEy/P4eGw7PLGx/q4ezjOL3IeldFiZTmzF+wlw?=
 =?us-ascii?Q?rErXIbE+Rwb6voF3flutUe0NOUhfTRdZYrYHJLt0/CFhO9fxjwGmfrjrM8ka?=
 =?us-ascii?Q?CRSsVb0oY0YYwm1L+S98m+WJ2AmDWaaPHAf9Jq5ONB6+BCHrXKczbWCMDEvV?=
 =?us-ascii?Q?B/uQZpAHUl9fBtWaHfpLdW1pEV1qJ95za8A/MIw8LUt/fsYxgXrUP70excxF?=
 =?us-ascii?Q?r8wm870qsdeZ1lxIhA7N+qSKVZ7Cz+Fv53WWPvr66f4cIeRdQwZzL7AdFQNh?=
 =?us-ascii?Q?R38eeJdUGsGDVFancPk7p1ePh8XHZ3jAUsS2fasduNTttDaKvhKwgupZocFp?=
 =?us-ascii?Q?EVyrymFdzalTVsXXnlOoLAP1ZUBsm1rjARxkTFq+pLfWJgm3YPXuBJb0bbXw?=
 =?us-ascii?Q?YPKU3zdLhAN0cEBciyvmyXjpTME76uen9HqEVc+GtOekgKlHz4R2Xda8W0xz?=
 =?us-ascii?Q?6BnVwpF9q22ScdxbZUpjVKWDVgdQQWQb5WmvToTiXSjG8mLH6CNWHVi2Qtav?=
 =?us-ascii?Q?FD7SZyN273FO4hcUOJP8UZ1Dki3RyvNc6z3r0SOef4+FNNIoj1r9t9BDACiI?=
 =?us-ascii?Q?bxKjVKl7PE2vhlq9l+2ltAvCPtWyfAy677UY53eIw/3gXV8KMKKfIYyg+GEz?=
 =?us-ascii?Q?NaX7q5u1LOFU/prF/5qh6ZMiek4P/GGPAlOg/HSFe5pNECyP5Z8mNRZoNxm0?=
 =?us-ascii?Q?hCaMMdlG4ypL0Rx0n6lPUQRV5ss6YuWQfMLmGXe8aYeFdUajPiFD5nI0uKvK?=
 =?us-ascii?Q?RyiZJvB5dYeMh8jKOgt0wqiZ7YoIvNC8Oe6plQcEqEpK2y9HhJ2AuDIbI4sW?=
 =?us-ascii?Q?44rvugz6YH5CHIEzxrBAT3i3YvFUVPd983TGqFbvIaiW2P1i2z32jcVVA51Z?=
 =?us-ascii?Q?FBUODBLFGI6VpcWDEcEKMikKV/pphy2qEQcx3yTwSxm1xCDfOLLNr2Qw0Zpb?=
 =?us-ascii?Q?9i9Pc9PRFcFqwATF6aMUKjpZP9lmWJtkrqcMSxuCYwReQtu2vXs6QfgnaLpq?=
 =?us-ascii?Q?RApO1vzzBem2/CERRcXkyOWIUbL+kdojh6FJsWqinwvTNkvNl0Wni9S1E/Vj?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee041753-9b9e-407d-4569-08de31109236
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 19:33:57.9396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lPuLw8dUS5bIqDXf1tVsRNctWrdqj6IFVDCPiwBKeXeoYxlqg3wKiJKhvrmQE/evUvCu5jqKjoGhYem4cds1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1A34EE115
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

On Mon, Dec 01, 2025 at 11:50:12AM +0100, Philipp Stanner wrote:
> There is a new dma_fence helper which simplifies testing for a fence's
> signaled_flag. Use it in xe.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++------
>  drivers/gpu/drm/xe/xe_pt.c         | 3 +--
>  drivers/gpu/drm/xe/xe_sched_job.c  | 2 +-
>  3 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index cb5f204c08ed..06736f52fbaa 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1037,8 +1037,7 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
>  
>  	xe_exec_queue_last_fence_lockdep_assert(q, vm);
>  
> -	if (q->last_fence &&
> -	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
> +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
>  		xe_exec_queue_last_fence_put(q, vm);
>  
>  	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
> @@ -1064,8 +1063,7 @@ struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
>  
>  	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
>  
> -	if (q->last_fence &&
> -	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
> +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
>  		xe_exec_queue_last_fence_put_unlocked(q);
>  
>  	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
> @@ -1106,8 +1104,7 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
>  
>  	fence = xe_exec_queue_last_fence_get(q, vm);
>  	if (fence) {
> -		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
> -			0 : -ETIME;
> +		err = dma_fence_test_signaled_flag(fence) ? 0 : -ETIME;
>  		dma_fence_put(fence);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 07f96bda638a..1ca2dec18e51 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1208,8 +1208,7 @@ static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
>  	for (i = 0; i < num_syncs; i++) {
>  		struct dma_fence *fence = syncs[i].fence;
>  
> -		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -				       &fence->flags))
> +		if (fence && !dma_fence_test_signaled_flag(fence))
>  			return false;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index d21bf8f26964..1c9ba49a325b 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -188,7 +188,7 @@ static bool xe_fence_set_error(struct dma_fence *fence, int error)
>  	bool signaled;
>  
>  	spin_lock_irqsave(fence->lock, irq_flags);
> -	signaled = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> +	signaled = dma_fence_test_signaled_flag(fence);
>  	if (!signaled)
>  		dma_fence_set_error(fence, error);
>  	spin_unlock_irqrestore(fence->lock, irq_flags);
> -- 
> 2.49.0
> 
