Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24A6BC6CF5
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 00:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FEB10E90C;
	Wed,  8 Oct 2025 22:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rxer2FeL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED6510E8FB;
 Wed,  8 Oct 2025 22:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759963516; x=1791499516;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=T8ORSOP3mwby6rctzACuzpVVpuuXk6W/Ww9FXZogLV4=;
 b=Rxer2FeL2E9NHS1aiepn2ly3XbupOL5pRxwl5UslH6KhFQ8n8Gk70AdI
 EEogclreRUqPe5sN3ZYfYCaPYzkR201fZWvp0LF8LNMDNZGtgxn7u6Ca0
 BT4dMaeLmnUsfnaUC1+Gjh8IBlEN9SDOeUdxjCrmtzgnFomG1vXDvsMUd
 2vDJANxOWOBbM2CSCwhLzwkUwDpesXJknA4sRsqjjAXWrgJk+I1grumq7
 mxozCZo6N68zGmTyZtI9snYG3VH9WL+D4eFOM7kNaV1MV4R4LWuTtzR2S
 c+3gkMwTHnbivzGxSoBFdmuOqjD+j97Zq+ribeq9EDrp63PCYDHgqHYqa g==;
X-CSE-ConnectionGUID: trdT20hrSsGx4ThStLqSrQ==
X-CSE-MsgGUID: 4n6pOsC+S7eKIJLiYwmtyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61205024"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="61205024"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:45:15 -0700
X-CSE-ConnectionGUID: Jmimbg52Q/S94AzVaicN/w==
X-CSE-MsgGUID: MukK9B3vTPi91M6iUDIHOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184935128"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 15:45:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:45:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 15:45:13 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 15:45:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKzTRH9lnxOpln0QxoJ+Vun6PEmiAm4sj54YVmCayp6F3G0QtizkV3Ia4wFTlkWOUYqGLkviNJbSwc6hpszjGSWLlFzIssXGCHXGd3FMMrxUSdMDyIoPIviCzPDjODr8OP1UzDTXVahVWEfK9uVgo36r8m+FOM8S9zcySaE9VjWOyPX2bzc0wpYZpuM59v3emArZUE1E+gMLUJuYk9BIpLlJwqi/2qAkwGzhgp/YQLvw57DaujWaE6Cw8pN1EVxXVhD/iVHin4/wyg+kvykG7uj++Ez9AYR2yMgLp4UXI6Z/poAMN38eHqMOkmt6SZjlqYIFznnbOaE7Gkm49jybWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69yB23U+bF2ksSut+9WUfQZPY/E7oiWIeFjKiwnGH2Q=;
 b=J/JBDbheK/MCFtcx++rRFLStgvbq/042nkZGwEjPwC1NodB5Qfyp0Wx9VZA82b1VMVZ8qLsHYhm732NJMGfpf19V4PaOSRVHhetPpbmI6XNsGRv8Hn19wNmiye79D2YtVg5NCXa0uGTDgMnhS18YNEGd57P6Eon73dje38UYlf5HN1XPMPYjKfcgDD9bWDz+7BjhrkKfwwtZSYT3ZU6TiI1p4VKcCrjjPpX2fqEYoQz6z6JikwNlQ257bCIreExhXyb9JBC3zzv6vOPM7ZLh01zQAUjgM08jUrQ+L2Lx1c1ioi4rEQcex+nS/L4W+zGA804CVnbvER3wJXI0Bt53DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5153.namprd11.prod.outlook.com (2603:10b6:303:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 22:45:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 22:45:00 +0000
Date: Wed, 8 Oct 2025 15:44:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, Danilo Krummrich <dakr@kernel.org>, Philipp Stanner
 <phasta@kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 25/28] drm/sched: Remove drm_sched_init_args->num_rqs usage
Message-ID: <aObpaUPjhAlaDikb@lstrano-desk.jf.intel.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
 <20251008085359.52404-26-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008085359.52404-26-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4PR04CA0133.namprd04.prod.outlook.com
 (2603:10b6:303:84::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: f24a7d96-2b62-468d-267b-08de06bc5067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+29+ZF61n2zo8Ple7NTVtA96dckf7iboLUraB8j34J092n/1EWUa3SZAjT?=
 =?iso-8859-1?Q?QJFLpZD0vgBwqPwhbR6B51HR/N8h4wMeMhZN0jj5L5GGxlJ66QjPmnaHED?=
 =?iso-8859-1?Q?OP5KvUkZnfLuQM3pmHqDQDqD9svrqsFO1ourfZ0hJKzxP/Qflt/jntsaHn?=
 =?iso-8859-1?Q?OXF0lWy5KKW1Ostm3i2M0tTV2+PSvpY7mi0SGS2vnOH5v1gjrI8qbrLOc5?=
 =?iso-8859-1?Q?xf5hTHnyq/qHeaqc3dc5rEiF/5K5vjWPhGOyIy+07Jovay/14SSiNKgiyI?=
 =?iso-8859-1?Q?istAoucYcsZe5h8dNDMxuzawWTJnTowqSHaoGmUhFLu32aL1oMaYs/MBqy?=
 =?iso-8859-1?Q?/IChS++n2hEth+yKrknemsByXlE67mFfOFW1OzDlUNIBPiVdAnDvUfWOlx?=
 =?iso-8859-1?Q?+Dbv8di9UlaL0RPSlCmxSsXVkfTt4kAmRbmTWayxG712NTL8zfTSz8TylH?=
 =?iso-8859-1?Q?Jq5PEIOk4gmjJwxptch7RUzmiBrlEJRTj2+OA1LKLbv4jAl4KjJZ2IfEYt?=
 =?iso-8859-1?Q?ve1WMrNQ0bwBNE2ng8phCkBIHpMLYFMjTXoDmJqK7EXMgFB5+S63X1s3GX?=
 =?iso-8859-1?Q?1c2AzdUmh5+RkqLK7FLFxICxxcHb9BQFKWnp+Po3mNTB7ndaPvaUYzp0rt?=
 =?iso-8859-1?Q?PI5a1fKpgdTHqrIbZScRY1oAjEV4tK+Q4pY5bpaWUcfh9oFiqcFtKdls3F?=
 =?iso-8859-1?Q?ioqQgQ0suc6GZN35pIqmcSI0Cz6H6ubtrHz1CfEajzkDAOEE/1m/SDlHtT?=
 =?iso-8859-1?Q?vNi/iAxwv7RDOL1ceMX+X3xdDDdln7qC6CguSdlIKlu/qyBcA/Za7okFzx?=
 =?iso-8859-1?Q?3S4HZbLRZWpJ0/RZgJ7rYJ5734f/o8JpbQWuGpHlJvNyc1Kdw6dlT5K+rX?=
 =?iso-8859-1?Q?dxeo2/wfh205JLANyoQqEAT0PSOrrHYOZGYI4qvKDxCoyr6ZGO6KJkFmbC?=
 =?iso-8859-1?Q?bOCLAF+izSGTQDG+GQnwgQiNrjR4l4YAaEo4KGJLnaUUJh1+Pq16+N84Ky?=
 =?iso-8859-1?Q?GHp/zRBl3CsCA+Bu3x8N+rn9VHJU4uvUQ8q5KmExUmc5/QY2HF5v2jHZHf?=
 =?iso-8859-1?Q?11NkRJgHk/Pwlf1GAkD1BUvlRCiuZxeqM4/wSiDcjkUS4e/YVJw2+vgHeP?=
 =?iso-8859-1?Q?oo1qHt9VbnnrsRfkHVLt+8psOWGBr8uIBzvNqe+4NskCZcOijdRlScvjgO?=
 =?iso-8859-1?Q?IF73XILNR1h6bSiTbMJP5lHpOAXGnyn2OlgHpThejQlpJTAhhvYRFP+afE?=
 =?iso-8859-1?Q?C0RKC4Jl1Dix9BpQOPKfXt32t6VVcZwFMaxDLaUrVQxepjVjFIHaf5Jxc9?=
 =?iso-8859-1?Q?+wMf5+itG9sTQ0o3HNDxCm58OzrNEyTufGvYX4+D4CC7jYoE+XX4T2LARH?=
 =?iso-8859-1?Q?pa5t03QsV3NoGPtRcMExMZpzwjWr8u6M2H3BiPhZlCRxnQWz8bSTpOmMj7?=
 =?iso-8859-1?Q?YpHUyqpiyCn9XeSEsGdAB9p5zriCek1wOeGbWmIS3bYG7mTb9HuAaGzNUW?=
 =?iso-8859-1?Q?N3gWLV0o0kZd9uqzHPC0tD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CQVBrh2ylfWxXhXTjymT8jUD9+fl9nsiu9s4eSIDsnSaPnog+NWHpj9BF2?=
 =?iso-8859-1?Q?FKkyNqRWkzwRP6j5LeHg0NugdOrky8zaSXqFYFnPQZ8a6XkbaK+HNX+GKv?=
 =?iso-8859-1?Q?RaqWakrvKgtH4I1lSeX/2veBmwnrryg/glel0nHJi3ojfbcNKTLNeT07Sw?=
 =?iso-8859-1?Q?B/Kv7BZDaqua9+0pix7z52e4CPL/eFVRnNe7hnj0GglKwoUtG5IXLFeA57?=
 =?iso-8859-1?Q?nehuqgJ1doW31G/DU/c/1aaopnn9D33cZXluYA+Uz3v7FAwnkV3Fy6DNPx?=
 =?iso-8859-1?Q?sr5UgpDrAHVj/+daS55UH05MU1V7ZaYs6AvAqY2Ycwm+rhDHWZ2s4ctW5Z?=
 =?iso-8859-1?Q?EfD4xd/fzY+sVVFxjQhopWSLLelEHeDwDhQovAkAiAObMoyJXggfwi//LK?=
 =?iso-8859-1?Q?F9Rs06j0uwM9Lv09hHWaj52KzjYCSbja0PAI3e4+PixTx55S9K8pyakrAs?=
 =?iso-8859-1?Q?Fr3uVKayhkW1Y3c5sFxP281/7hgRLiPEslXWD435DccXc0AXjjoNIlfDoM?=
 =?iso-8859-1?Q?U3QoD9KURS9LjCLIduBXHL3RGT0mE7KYwTTVlbCybEGJuGMRPjKFcwhm9s?=
 =?iso-8859-1?Q?Bxd8B33CxaIl0+DmR38SFIdVsMOarnza26R4AA+cmR07FsbOD0V4IBroLw?=
 =?iso-8859-1?Q?9j1nFGrVb+a/N3aWkzJhBNVTt8IkYrnAh3HIOfUeAwsFfFGl5e9zZ7T43j?=
 =?iso-8859-1?Q?y92QU2X64TPuYhkzSrXxmFJEfI1DvJjUhhMK1jrv33fISB6y2MGKcybh8t?=
 =?iso-8859-1?Q?FzjtVG6/ER84ydnI5Jr3uvV4Ha4u6dgtypxM3DOLbyrtpAJCjhVZ3FryhG?=
 =?iso-8859-1?Q?xHN9vaNBFFDVdL80xlCXeeSQRzIamOSQgR8PGpaGn4qKZ3FrSvWPd22bjw?=
 =?iso-8859-1?Q?7uLZmkuJgZf9UPDsGVPQIU5JwxLrrplaMKS5NzXIzo1s0LLJghXPv9eRML?=
 =?iso-8859-1?Q?UbZjvA7BOOa8d+sylfVc3k21brFiGr1sGCGGIsLz9K9rocBneDtgyZaAtt?=
 =?iso-8859-1?Q?nNUHQ4XjW+OjY4xHqp8qSwuC7CHz2q5064KiDipcu+HyPQaqf3/SsvE0yK?=
 =?iso-8859-1?Q?glJIrOF9gD7dzxvkusWO/90Cp3ZJdbvng+KIaLoPExEhp0TVhQ6EmrCVoP?=
 =?iso-8859-1?Q?Of4mJl127pc0FrCRh/ENSgnbFNM3NXbL0zao+08qKMBbhR0oeMH1q6Pf7S?=
 =?iso-8859-1?Q?tSn1BsE0CU27r2Vio6memQJ1zPZ4WdCgVX/ksNnAbf6PM8H7cooZsbOOCS?=
 =?iso-8859-1?Q?xCCmWP8xK/nm0HDEFkHHJObuolzp/a0gY1Nj9xWiYFdrmdw6hYviAZYov9?=
 =?iso-8859-1?Q?cMJql+Km4GUpJepdDmH29WiAHYeF6/6Yg6e/a1xP9rLHnZ08YbwdSmrUqk?=
 =?iso-8859-1?Q?pCudH3l7fGkf9zv+PmTuTtLV+zmP7OLvuEiJKIfWyQyCJq1HhwvFLCkyHb?=
 =?iso-8859-1?Q?4RjO6AZ3EFT5xeYAxOn4OdAu2A2+Wk4bjpJONHIQHM9F1CYaUBCM5yTz3L?=
 =?iso-8859-1?Q?6D7D2PPbpkpQ+vAh5OGynX3mTE/9kF2ytwLGjqsqJccSTY8gIFu0jZHw9+?=
 =?iso-8859-1?Q?wOCesXY4VfOlRWryMMYxWK52jFANjXZjkgK3uAehjsy2oyGZYI7R8vw9oG?=
 =?iso-8859-1?Q?grg2GDOyoF/li7sNtw1kGnS0xrVFqy1rEm858LQNTWe44VFFct6yiFfA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f24a7d96-2b62-468d-267b-08de06bc5067
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 22:45:00.8032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wt3Xl8q/XZGMHVyHPvWgJESTw1aMQ0/A4+zDQRPnRc/Nd0pHMQOplDH3m3ON1PpWqpVdVIMRJ/tg3DBTb1+I6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5153
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

On Wed, Oct 08, 2025 at 09:53:56AM +0100, Tvrtko Ursulin wrote:
> Remove member no longer used by the scheduler core.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index 8e9ae7d980eb..14403a762335 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -290,7 +290,6 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test, long timeout)
>  {
>  	struct drm_sched_init_args args = {
>  		.ops		= &drm_mock_scheduler_ops,
> -		.num_rqs	= DRM_SCHED_PRIORITY_COUNT,
>  		.credit_limit	= U32_MAX,
>  		.hang_limit	= 1,
>  		.timeout	= timeout,
> -- 
> 2.48.0
> 
