Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E39FA1883E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 00:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D02610E647;
	Tue, 21 Jan 2025 23:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ey0nuips";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C328410E647;
 Tue, 21 Jan 2025 23:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737501383; x=1769037383;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bvMQEvDwFhXev2YT/eueyj4eLeSNgLmrSKhcLVl9H+Q=;
 b=Ey0nuipsttTzyb0pZwFtojGKeAb8jJ5DBgzcz84xQU5Aikw+Wj/dKvIe
 JO5vbqtPGFfcsRc2lJuEvNbXbGNkYs5R+GkrI0PYebHYhtfe31Z0WDsLu
 Car6vAEEETGYAk4xOjkMVsC39SZBpls5gBkAAXkn9rhHJj99gi6oQKJje
 sBiHo8T55lihxbrxNz3E9kICffHZM7ee15rc/o/FMApWN+EDYQhaN8bSv
 wQrc4JbqSEjyT5eG1rBRT54ZZ6F0T3fs+UWdXeJDjRFc4CXIcT7FGaoRW
 OLkkimnK2FT3ZtTRegiqJxcB61YPfzV06hOrAzJ7pVMFV1ik+8obuWpkq w==;
X-CSE-ConnectionGUID: lD+C/5gkTZOcN7MgmzWOKQ==
X-CSE-MsgGUID: dbUmREhCTNKA1ftu9ZggCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38092943"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="38092943"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 15:16:23 -0800
X-CSE-ConnectionGUID: /UYFkJ1EQuaXUcI+SZs4yg==
X-CSE-MsgGUID: K0CKUWvFThSPByXJdt3w7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; d="scan'208";a="106773506"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 15:16:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 15:16:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 15:16:22 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 15:16:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0yEGEvrcZdsiX99oHOxXj80rIc4J99vVO1jYXbOXPqenqRV2TEXuL1Nj7EL0G7dylcxexiHYN47BV19AUMn7E1hk8vTuY73J0hp1pZFCjB8XgcESG3J2A6FRebXzjiocw+vsJErg+Znyyk+H2fM0JSbUtqGah4xBKzS9b6/oLYxkkh7lO04SUfww5ILu1dgZVvb+o8qg+sIVMIbGbtu9BzWEMXlOiRGOvXwPcLQHjOiTDG8L9l+nOQuWKoH1D1+MpdIsmarwRJ3z6IHHXCCppiMxcKAfm0ytXkJE3JdXaG4qOvrm979e7LJrvTcWRyfm9uHWXNOq4uMTZcHSskN0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxvCFnIMxAgeDA5RqKtRYpyV5RhJ24/1vXndcctl2dQ=;
 b=l7jUUTIl6VNthaCXNJ8Q0yPIni0cV+4nFLvMnRAlSnZ/MpNZyGmWxpRakRRteUZcY2FIWrO6yntmzna2Kr3mHhY/6azzY15SF1oB262DrqyjCJsu+dkQgDHgevZh0JRN5uOtWkjqko0y4Mnf9bmZrB/BdHCXHva/KCOgOKjst5HUzJO985I28VmS7JG1Y5uZWeBbEM+nXextIta131xSvZpq8ANpXueW8d0GUEhX/3CnYPNvotgCTD6ijtoR4WXUhvTvCb+FkZ0hFw0OL7pSp6a4Ejcf4gmYLFMlc37JSkEMVFdmLTO7RSeiNnQgjCXjzmIt+D791Xgd0CMalTJWwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by CY8PR11MB7313.namprd11.prod.outlook.com (2603:10b6:930:9c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 23:15:53 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%6]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 23:15:53 +0000
Date: Tue, 21 Jan 2025 18:15:49 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, John Harrison
 <john.c.harrison@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 "Zhanjun Dong" <zhanjun.dong@intel.com>
Subject: Re: [PATCH v4 0/1] Maintenence of devcoredump <-> GuC-Err-Capture
 plumbing
Message-ID: <Z5AqpemmzmBX2755@intel.com>
References: <20250121190935.1984508-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250121190935.1984508-1-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: MW4P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::12) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|CY8PR11MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 277f6aa9-c02c-4a38-0e15-08dd3a718d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E2zAm7nxQr+wkgtZ8KoiG+4C1CfoBj8fReB7KLu3KMOOoKqq4g2Vg9iV34Hn?=
 =?us-ascii?Q?EcuEncZrWFtMUMuQSiwi5ji9tFYuBinYqKjouYlnRvLb/nlHwpnYT8iJW4tx?=
 =?us-ascii?Q?eP3PAOcli7JjvNqhFSUw+3aGUYeKwBPz73sHYewWL5y+Qp6FYg2hKz8yy+TH?=
 =?us-ascii?Q?8P8MiK7tEi475IhhHirdY+Ugvsmu7kH4/7moxX9U4OMKFf/7N0EnJ3CjJGNz?=
 =?us-ascii?Q?37FEOZehn766+Js/kl2/mYv3TrmT7uM4UkeIreqpPe3Tmi5O9vrxUhYoN597?=
 =?us-ascii?Q?7ZXDqbXw11wF2h90eaYOXzemNQ+Pt50dIQaHoRNcSS/W20o/5TSDfJ9n2Kwn?=
 =?us-ascii?Q?wBN+BYBafBJCZ85/aY9QP2PoyYasf2/8GD96qF7wWagOTjxsZKQgeHmYgpPw?=
 =?us-ascii?Q?j7CoPxGfl+V+mi2ESuo0WIUakq5epyLf3+CmSErvepCdSEWsYcLBe13ZZCgk?=
 =?us-ascii?Q?6mcMmTC3PqpyijtZ4xfcI8sARXNMnlR/PzJSGf9yLEHd6mt1t5CR3Op763kN?=
 =?us-ascii?Q?7HxL7rGmp2eyZy1niJuo0TOGsg5jNz2sDgfKY5QCgr4mAYHSiBxzIcWnQOWP?=
 =?us-ascii?Q?tBSwSSFXkEbXJrWTmWA4mdGehEyugk+75vqkJoGr+/U3RheYnZFUpzT362SS?=
 =?us-ascii?Q?0O3NI2WQ3sG67rZ4UTezALe1r7oArBNyp2PSnJVPLydI8LDbjRxbdPuC3O+c?=
 =?us-ascii?Q?q6ev2UkkW25xDTLjqT48spe4Oxjpb7lbmbhEH2SzxoA0M436HlX4S3EIK9pX?=
 =?us-ascii?Q?OBBElPUqgUk35kj7eJtO2DMuF32nOIUbUnXzN7sR76/Wszul9May9c2/L7b6?=
 =?us-ascii?Q?3mxGbUyPVv7zu0qGU29e3FZES53Ck53uiftq/15puajYZ4QneuH2PRLJWkoH?=
 =?us-ascii?Q?Z3vvx3LKiUrkwhH/DXtdpKbd/AYfpVseK4TEjtp9UIQ0pIwwiwVH6w/dEfG8?=
 =?us-ascii?Q?3U6k1MGzbXfLKaLUjvD3dPD5G5HffL8Rn6ZzYc55/0mwh6jhsETPohppe8EH?=
 =?us-ascii?Q?JIGLX6F/W8/2Ms1cT6MJddG8eezWz+gAZjdK5PHuvrmN+R/Rqk3VakMDQgS1?=
 =?us-ascii?Q?7mmaN1bM17Z3pG5WqnmCC/SJRggLqdJgIEKrYEIJqAKcfqefsjZQ+kb7nK6h?=
 =?us-ascii?Q?qBDwIYU32r1OGN92obLFMjyebmY+YnmwjhA87XL233HhktzzO4OYWOvplj56?=
 =?us-ascii?Q?7xU/wWeExTbKty/V1y4IskyhxcwM+m6wLFlqosOl/wosScfgKMOwYniHhQYs?=
 =?us-ascii?Q?IKk+IJjmlZzZHW8g/pWMuee45UzUDLLq7Xyd5FbKCN6Ug6mJfJmcOBS08phU?=
 =?us-ascii?Q?jhVY4PGz1Wy5sTerNobp0Q2ke/PcWrerSkkWO5HazH+3zU8xdEzn2OGI03jg?=
 =?us-ascii?Q?/OnrrQGCqoKaq9ue81Nxb16FHH+v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S/VMPMhyhG89ftByEn36WF7Ob0MI2J5ddGa6ooJgtXWJiF1oYQPnBsxJH6ti?=
 =?us-ascii?Q?Vvwn+hXPE9St/PgQU8aJPOCIZJ55KPknOZFKbM/69KJ4VIQeSfiP52NuPDWw?=
 =?us-ascii?Q?7w620sJwJkMuu/VmzyOQePnCT9EMgN2MoAe+T8h21wWf8JxN+9zOl6wAscN7?=
 =?us-ascii?Q?2XQ737FQ7/LPGEsC1wSvldTiW5nhDMjcMAX06U9UhAUoYvjmg9zCQouDozQD?=
 =?us-ascii?Q?yKWc8hKGbi+BzzxRQgLyrqQJbEovIibZAXr+0HCBIBOCDy67QT6NTEWNXQoG?=
 =?us-ascii?Q?dEn0Vzpv9EvkdMMrzahpDdLJxf5NqmYbF3D9KF78u3bYnlncUd8jrLg6lpPq?=
 =?us-ascii?Q?dWtoAxsbsLgJ3O8mvL5CJSBgYFz3mcy47PGA8C+tLrmv1Sck6aLwZunvGP4i?=
 =?us-ascii?Q?Lj9OnltNFG7lf1Of5XC/NYYyEnf3dsUQdmUOMCCI9/jysgUqu7+15ITSCPWg?=
 =?us-ascii?Q?7PpuL6yFh9cIBHSy7iNheSBuiUiMu8wjXhvHN4sp75iFmuo2t8M28/gHrR+0?=
 =?us-ascii?Q?KNwuZIOY3r7WsVId8S6jwz1M+b1FwzuLfdROCy4lUHCz0Gsw9VL7hQ/gini+?=
 =?us-ascii?Q?WRRJ9tIGqj7RjIjsmb0tlNA7n2aBmY/y0GrULw3bwrFxYiyzG+Ie9SgTSXG4?=
 =?us-ascii?Q?pycMMsqKaMWQ21t2VCNa8kY6OXiIoLwEEDoj9jaiNXHa137n1o6xSfOpARym?=
 =?us-ascii?Q?rDbZHV5dPaEz9s34/dxf3W0wZmyllaZGjKBVfx21HzDTlEpnqZfMtO6opQ25?=
 =?us-ascii?Q?CgMDXn7DfrO9MeQSDmJrRtvEar9/7oN9E++dIEVi8A7UY2ZqI3c8uF7VzZPD?=
 =?us-ascii?Q?/kEHbB4Tg0oruGdGEfUspVYPqibybjUxywSWd4+Py6Pavq99kvKfnJGnNpgC?=
 =?us-ascii?Q?Zq601R7FuXB2GW8fczKJQowapOFgU6OVVLXZ1Z+qlk2B91uZ69aDntIAWHvo?=
 =?us-ascii?Q?yb6J34Z9/waCjnnMRcabNt0jgnXNVG+QItp2CjDL+RHQgum2Rl+VoauPvWP7?=
 =?us-ascii?Q?V8+gjCW3UFQyT+bQXwyibJz8yqMPhUeQyZEGfzDvgldhP/YuaIhyhfa/C7hr?=
 =?us-ascii?Q?gXgvLZ6Z8GYnLXRK8py2tobVF48rh3xLmxAhFwWFcu1fRpU9ec+GoCeiBL7d?=
 =?us-ascii?Q?u3vxI0iTA0kFEeF32K1ehR1iEJ8CRtofc5nO7Rs0VuKVUjehrMrUo38Tz+kh?=
 =?us-ascii?Q?SlY6wEWCVecSI6lR89YNaqiO6GSSkH3EkqqBILIftQ/Zm92TsvOrxhoBjeSg?=
 =?us-ascii?Q?/Nw9a1h1uk9ccQQi1tTp6PEUdDhU3q/nyIc0Ev8ZylTVD4EP2FhJrmd6xacT?=
 =?us-ascii?Q?XPuxF+NZ3Xn1fbaH30MrcRKcrOW0z4MDXmb/2SPrHk+ejgv/V945kOWuI80E?=
 =?us-ascii?Q?K+8VYA2QZiYkgubP5vb45Db7t8lwvcBRhDmBLGTXE7lz/housTBAdbQ1l/zH?=
 =?us-ascii?Q?QS4UDKCU+jcNbaTkNHcmmwqqYdzamdzf9ZyHt8S3Wm0NjpsQ+HLDQnBDV32J?=
 =?us-ascii?Q?1ZJ2wDMrMph7FpxQPgSTy2wqNl0VEzC6r72c8t0N9u3HIAvIoyZ2Iu7NYX4c?=
 =?us-ascii?Q?IwqmLBxJ3cibU+1uMuw2sXswvYmXv8kA9rqW3ydOXw3QR1owhtqkW1BpWzvu?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 277f6aa9-c02c-4a38-0e15-08dd3a718d2a
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 23:15:53.2753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oq6rIb1uAG0gvS+BpW9r/h1+ifXokDVTDf3w3n1Fxi481H04CbDCYjlJ6ydreMizI4vlVccvRwzC8Ci+9DXI1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7313
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

On Tue, Jan 21, 2025 at 11:09:34AM -0800, Alan Previn wrote:
> The GuC-Error-Capture is currently reaching into xe_devcoredump
> structure to store its own place-holder snaphot to workaround
> the race between G2H-Error-Capture-Notification vs Drm-Scheduler
> triggering GuC-Submission-exec-queue-timeout/kill.
> 
> Part of that race workaround design included GuC-Error-Capture taking
> on some of the front-end functions for xe_hw_engine_snapshot
> generation because of the orthogonal debugfs for raw dumps of engine
> registers without any job association. We want this to also be handled,
> even if indirectly, by GuC-Error-Capture since there is a lot to manage
> when it comes to reading and printing the register lists.
> 
> However, logically speaking, GuC-Error-Capture node management,
> despite being the majority of an engine-snapshot work, is still
> a subset of xe_hw_engine_snapshot.
> 
> This series intends to re-design the plumbing for future

A 'series' of 1 patch is not a series. Cover letter is not needed.

However, this patch is the size of a series and it should be
split. I'm really surprised that someone went over and
*really* reviewed it.

Even the subject of the patch doesn't make a lot of sense to me.
I don't even know what to write in the pull-request with a patch
like this.

Please break this in small patches.

> maintenence and scalability, rearranging the layering
> back to what its should be (xe_devcoredump_snapshot owns
> xe_hw_engine_snapshot owns xe_guc_capture_snapshot)..
> 
> Alan Previn (1):
>   drm/xe/guc/capture: Maintenence of devcoredump <-> GuC-Err-Capture
>     plumbing
> 
>  drivers/gpu/drm/xe/xe_devcoredump.c           |   3 -
>  drivers/gpu/drm/xe/xe_devcoredump_types.h     |   6 -
>  drivers/gpu/drm/xe/xe_guc_capture.c           | 406 ++++++++----------
>  drivers/gpu/drm/xe/xe_guc_capture.h           |  10 +-
>  .../drm/xe/xe_guc_capture_snapshot_types.h    |  68 +++
>  drivers/gpu/drm/xe/xe_guc_submit.c            |  21 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c             | 117 +++--
>  drivers/gpu/drm/xe/xe_hw_engine.h             |   4 +-
>  drivers/gpu/drm/xe/xe_hw_engine_types.h       |  13 +-
>  9 files changed, 359 insertions(+), 289 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
> 
> 
> base-commit: cfa9d40db8c30d894171010fe765d96e9bc6a47e
> -- 
> 2.34.1
> 
