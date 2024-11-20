Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB849D413D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 18:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A99D10E2F3;
	Wed, 20 Nov 2024 17:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajNO6iVY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AFB810E2D8;
 Wed, 20 Nov 2024 17:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732124184; x=1763660184;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QWem1rHAqdC1vTuTSDm+z65OMTXJIQ1nkj5AZoylirs=;
 b=ajNO6iVYnuKSKQ2TRNMSX8dOjFvGy33DbevTYZsLw4k76SkPyKgnr94Z
 DOCUmeWR6QdUa4hNkj+n4uwan4+qVWoW37mgZ7L2jhNNDq/45B2L7OuII
 vf83lBwBn+l0aZ7nbS6GMW1hbx7oU+qSfIq3vm0Sp6ECS+i+3DRkruy9E
 PHgBMWEhU181r5Gjh+p2AazsVjDsB2kcga3brvAspFRt768NhNdye/7It
 vuU9LCSguRysuFbBkjKmdKSMTqkczy/mUGXruexQDBaZeLygnOXtZN4Z6
 HwPfY2BoOviHlHKbdlupawcVLxQZ+sAS+FSiXM3LiVphnBJOD+QbcD/IR A==;
X-CSE-ConnectionGUID: v/4KhhdNSZS3ovhhlLcxsQ==
X-CSE-MsgGUID: 5zkRm0crR6+KNFE9djYOQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="42821322"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="42821322"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 09:36:23 -0800
X-CSE-ConnectionGUID: Nb1YiQddTXWGE3RaBTq7ow==
X-CSE-MsgGUID: e/hExlMlR2uCnR3NS03PgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="94049922"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 09:36:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 09:36:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 09:36:22 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 09:36:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROc2yBQI0+geYEG8GkUFYeM6c/45aD2DI85+Xlf39eH9/154anKx1lXJkAAv9q059RapeEe7mKGVRj9T53An5EC0SlkuQFG7UFs4hchBruUfk5RKxr/oHadOLViIhB3JlZQgjv2cbQvT8NunTI7aHbt7y/EljxHnIEDMlDTgiAyH03SANzEbniOpRdqsO2xznfpFxLvZgH8lNV/xn57YjWzpLsdIaP+d8Y1oOmQ0UwXdSUhn+fOsBeRWO/sEY8VurajNbW+/dc4TvhfZNrOdOJ4PFK+OePKUzpJZ9L4UUXH7X9bKV+2K8voyQqOOov+UUGdPzwGmwRgARglNqMwBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C29WYLZ2GaaEK231h+ujJNhVdhydW5Kvk5pC2dsv2mA=;
 b=Ed0Ww8vbfmhXiTZbjTYDT7dzy5QOOymqhcwdQ4moLwtqRaYE8ys79H1YRl/MZmSct3V4yvnPvtgIfiMO8C86ylxk9fjzqtYpZ52NtpAF55QLiSwtRY3RSBfa2d0WCZDk/dBcHwqJu0G6e6uAWQUx1WzcKzs/GUcH3PvRQ1NNHC9IC4bdCfEuq4e97MDGLGPLWKcbKsXiHoqy2I7r/tX9LW5ssB7zxGonYHVx3/jeM09WcsEllDGxG75YD5qmlPhgW0P8HaPccxXeUrz2t6qw9Ru55GXmamk+6JzWUFQFafecZD0Rew38BsbaDFW81ch5GhgNbReV6xU+PTBg4peSPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4754.namprd11.prod.outlook.com (2603:10b6:5:2ad::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Wed, 20 Nov
 2024 17:36:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 17:36:18 +0000
Date: Wed, 20 Nov 2024 09:36:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <kenneth.w.graunke@intel.com>, <lionel.g.landwerlin@intel.com>,
 <jose.souza@intel.com>, <simona.vetter@ffwll.ch>,
 <thomas.hellstrom@linux.intel.com>, <boris.brezillon@collabora.com>,
 <airlied@gmail.com>, <mihail.atanassov@arm.com>, <steven.price@arm.com>,
 <shashank.sharma@amd.com>
Subject: Re: [RFC PATCH 01/29] dma-fence: Add dma_fence_preempt base class
Message-ID: <Zz4eNeYuHulccROH@lstrano-desk.jf.intel.com>
References: <20241118233757.2374041-1-matthew.brost@intel.com>
 <20241118233757.2374041-2-matthew.brost@intel.com>
 <431e53fd-ab98-427c-a6ed-6c2907438952@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <431e53fd-ab98-427c-a6ed-6c2907438952@amd.com>
X-ClientProxiedBy: MW4PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:303:8c::18) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4754:EE_
X-MS-Office365-Filtering-Correlation-Id: 56fd1595-7649-442b-0877-08dd0989d765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8PMFPL53LbgSZfibAi/eqRAlnynw7Aosx4EF8XJT2Pm6cySCXrodt9sHXz?=
 =?iso-8859-1?Q?HnsCYhKNO6OUvJ4fFf3iSyjT2oN5XQ+uByHhNZNzLPN31tFQX84G4T8qtk?=
 =?iso-8859-1?Q?LkJ1+Z3AU5kFkYDGh7yOscO1p1/XdCI+oUv6UfCDvMp8KhqbgmqHh8mQlW?=
 =?iso-8859-1?Q?SqnDAGHEZRs9is3OLCCkxZun5MKiaQKMJYWd1pL+Jpr9iOUrIuJ7mFS8Hr?=
 =?iso-8859-1?Q?v3JxlvRj1+FuEETOwWP2qkJQB7/7mQ/82Wt8FRTcaWc+7LLvP4viuNLLf5?=
 =?iso-8859-1?Q?wSk0GcXj8mN6kxH62MFHta/IDZ9T2ETWe7aj2wMlmuW7P4YDRKWVGoxsXx?=
 =?iso-8859-1?Q?ovHdEZtxl9PSebbwVsGFYG24j1dYz7toaNaKECN+gFOLx6ajylifqqicfZ?=
 =?iso-8859-1?Q?AJR+SsyhkooidZ2LvkgkRtgKPb313c7UI+nNvu3d09jSZ2ZhNoZEH8nAME?=
 =?iso-8859-1?Q?5PGEA+QBkHWXA3fZBJlcABl5whEes4NdUqS4+VVEBU+qO+NNE9SVNP8R7m?=
 =?iso-8859-1?Q?HgPcDfl7azindUsPCK/o8XTrdjoZ39Y5Bq6gwnP8Pw/h2le4kg9Oq4Q2YJ?=
 =?iso-8859-1?Q?BrlwDdbrDPWBwKbdr630kma8DkHaOlRpOyT03KmAisIyyMPu+8kdNvFt1K?=
 =?iso-8859-1?Q?G76DZXgOgV3dtrSccX2GBCpDb3EvP+z+I+CJezWA15HzRwghy0n6GDWZaK?=
 =?iso-8859-1?Q?FmKNbX9R9l5ggpWSqIGIAb+o01z7VB0fAZHa8e4VmhD+9NKbyvEqlz9lBZ?=
 =?iso-8859-1?Q?o7dpXYfW19gwoNAC+o5smWYkbOQgUx8A6xGK8lG2z5r6aeACNlHCcVHKyB?=
 =?iso-8859-1?Q?o9bSz3+QT1DOGmfCOoATwUvK4IIC6l0tSpHm7JPggxzH4tNS0fRIA7NwzA?=
 =?iso-8859-1?Q?OVZNxeVVhJ2CoXGxSRehsY+F1/4Vs8GHflkaawJZIZW4NjV/xZ9G8xvUwZ?=
 =?iso-8859-1?Q?3XKxtQlVWuiGqpzJiitHRYLVwW6H+02DqA8vr/hP4qOBYZwCz5a5A7Wf7Y?=
 =?iso-8859-1?Q?wscq/F2geuZB+fVIYeJAL/ixve5QZAbIMR6//7ojW3JqwGQfNrcSO79r4A?=
 =?iso-8859-1?Q?8sbqPgFYUo2DLR6uBpr6MPYAvA9kH+LII8hoI2w++cSek/x5Gp35C/pLxF?=
 =?iso-8859-1?Q?zxmI1N1uQ9AIUy3vfW0zaZ8l4XrGDd1l0ND0uuQPx6tXPQDitHmiVavTI0?=
 =?iso-8859-1?Q?m4otIorU9SJsG8E3xqswZR1gYW5Y6bNZ33zsYVj7KtHoAx39SGA6X4ciR0?=
 =?iso-8859-1?Q?8nYoTQHhQsSLd/KayQjjmlhREkwUM2U4tm+98KKUvkvEJz2lK8radP5uPm?=
 =?iso-8859-1?Q?9rZRb6gBgn0+QZv7DII5sXUV11AkhGbcnkW5GE5wAywMiCQgB12jvHUKNI?=
 =?iso-8859-1?Q?heeBiJ+Iza?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?e3XUqtsLCCq5q2xk/pXa5TP3HPLjGBo76O2w5m96zSfcSB0ewyflUbSgwn?=
 =?iso-8859-1?Q?EizYqsBX1A09HVtNIXAiTpC6Tifbfo1lAQlYyxleU1OU2vECpetNlSsjlG?=
 =?iso-8859-1?Q?cFawNEtuAhU9I1LDn2vwJPaOyscMKRDOsmmo+XNfIbBUMUIMAFvdAMeUCL?=
 =?iso-8859-1?Q?YPIkwRl+ptZJb7CQTOcYKB0LLKMYntvVmRc+1fjGUZCf9C40HWZdWbLWY5?=
 =?iso-8859-1?Q?V/lU93k5grkO8R3NtGy94iQycuKW+ZmDBiDJYb+XAFET2zWyGB1KyPX74N?=
 =?iso-8859-1?Q?mVE7X8p1Xp22FAf20UNGScG60WsSUVVrUC0f5CtKuk+jzomV9JqjaXT+QT?=
 =?iso-8859-1?Q?3vS3rYzcVpgBKUbZHDOKD8xKS3qaa+4Ztpn4buk8kD0i8hbmEk9eqYzE4x?=
 =?iso-8859-1?Q?usESzy7GSw8g+0vg1Xbrmx3c3YTv+oOqDXEfXF0CDvAf/H3/KUCIYx7iZS?=
 =?iso-8859-1?Q?eBjPlyagmKTlttovwLk4WstFNsjJtv6xE8uD2PlqtHVdZ1bjN5ttvw2rUU?=
 =?iso-8859-1?Q?kSHeF/Qqo9hWUKCPdzff/Fc2psVCr9wVmRM+R2Q946HR2HcX5AZGOUiz4/?=
 =?iso-8859-1?Q?tqzmEkwUJYH87LRBVqIvxxKd0GKk2Jvwsabfuyx0R/EqGvw2ueD5Ksy4ca?=
 =?iso-8859-1?Q?kE3RaN/b+usFo5vH26/QP2CiQDOhKYlpgpq27OqtyPAYY6eOE5RmVv20nM?=
 =?iso-8859-1?Q?TAw62l4gOssnG1njqo+ArrVIAGE9nYgBduRtVEQZFCCMYmhkS+4FFBtxkG?=
 =?iso-8859-1?Q?O9DFyqn9VWy6+R6awowtNyIYDe1fH7ZwWmQFoVXOMO7xeLDRCMT5xq6FNa?=
 =?iso-8859-1?Q?Nb6oqdaGHEjQiSKnoW69aQq9ivHFvQC/yeG05j3/PcZcJBxEg101N9Ewg3?=
 =?iso-8859-1?Q?+POY/HR/VA9tA4Td/dXxvVt6gBjTe3DZ2If2TFiGoSuieWy4I/lJLr64up?=
 =?iso-8859-1?Q?KJEQqILTwME3ziIgjCjRTc7KVxKIBcCYb0BP/bm9F+yUpGFMJ1j6eyXGSC?=
 =?iso-8859-1?Q?8Jz9X+4GNfPT+RnT/tl5U1HCwzSD+bEfj3Njw7hVi2E6ozSkzz7cEr8RK6?=
 =?iso-8859-1?Q?R1VEz9MwSF3P7eUIEVSHeTUKR/oACZeGBt0zVWO8J54S1u3DQoKThxD0P1?=
 =?iso-8859-1?Q?xzR5vxr7/6VkOtXCYGnlSBvw9MDzHIZ/vV1ajFsbM+1WJsyG//loTVk1f6?=
 =?iso-8859-1?Q?glgL9NEaH0Hi8hsf56Hbg/vuLK/SASQgXbPbDOM63gsxYubBxJD/Bjw0xL?=
 =?iso-8859-1?Q?TIUnL5ovo8+ayqbWAYUfngnFosi2XyXgr+H7CKJ2abWVF1kiPdfHVmvexp?=
 =?iso-8859-1?Q?3hb8JRxbx3iuFJzta7uTem7BBAFnkTjMMrTJzw0I0AE7hskoxGXGHR4OjV?=
 =?iso-8859-1?Q?Hrys01MzLvRG07IC4wvOS/F8uo/eOmgFRibfFJ5kw/yl1O227keUtKqNZY?=
 =?iso-8859-1?Q?Z87mGGIS4NwI3e+Zte+fFWhFHGMLD7mBuywAy/cW7rdDrmYbigfCyziIeZ?=
 =?iso-8859-1?Q?XxbMQ+mrWX38Q42wwIYuaGZOoNNGQqJ9pnYi6rS5rv5we9uTbNUE8d/yXG?=
 =?iso-8859-1?Q?mc+23mAsMwIBVxCFfGzpRrWR3ebfyNiPxRJqGrybFLc7j1Sc1zUoDVeXI6?=
 =?iso-8859-1?Q?a2qESo4jMnQrBzJRbuXSr/eX/7eG5sROsxjKTm4FMxmPe7NISChrki5A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56fd1595-7649-442b-0877-08dd0989d765
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 17:36:18.7063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ACX/x1rEJNJAJbn9yIrWwN0vQaEzVITaLdJkyMqro1H5QXbBoHVWpvoHIQCtqA6EdS1Yt3NcPzkG5wnEGTR83w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4754
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

On Wed, Nov 20, 2024 at 02:31:50PM +0100, Christian König wrote:
> Am 19.11.24 um 00:37 schrieb Matthew Brost:
> > Add a dma_fence_preempt base class with driver ops to implement
> > preemption, based on the existing Xe preemptive fence implementation.
> > 
> > Annotated to ensure correct driver usage.
> > 
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/dma-buf/Makefile            |   2 +-
> >   drivers/dma-buf/dma-fence-preempt.c | 133 ++++++++++++++++++++++++++++
> >   include/linux/dma-fence-preempt.h   |  56 ++++++++++++
> >   3 files changed, 190 insertions(+), 1 deletion(-)
> >   create mode 100644 drivers/dma-buf/dma-fence-preempt.c
> >   create mode 100644 include/linux/dma-fence-preempt.h
> > 
> > diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> > index 70ec901edf2c..c25500bb38b5 100644
> > --- a/drivers/dma-buf/Makefile
> > +++ b/drivers/dma-buf/Makefile
> > @@ -1,6 +1,6 @@
> >   # SPDX-License-Identifier: GPL-2.0-only
> >   obj-y := dma-buf.o dma-fence.o dma-fence-array.o dma-fence-chain.o \
> > -	 dma-fence-unwrap.o dma-resv.o
> > +	 dma-fence-preempt.o dma-fence-unwrap.o dma-resv.o
> >   obj-$(CONFIG_DMABUF_HEAPS)	+= dma-heap.o
> >   obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
> >   obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
> > diff --git a/drivers/dma-buf/dma-fence-preempt.c b/drivers/dma-buf/dma-fence-preempt.c
> > new file mode 100644
> > index 000000000000..6e6ce7ea7421
> > --- /dev/null
> > +++ b/drivers/dma-buf/dma-fence-preempt.c
> > @@ -0,0 +1,133 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#include <linux/dma-fence-preempt.h>
> > +#include <linux/dma-resv.h>
> > +
> > +static void dma_fence_preempt_work_func(struct work_struct *w)
> > +{
> > +	bool cookie = dma_fence_begin_signalling();
> > +	struct dma_fence_preempt *pfence =
> > +		container_of(w, typeof(*pfence), work);
> > +	const struct dma_fence_preempt_ops *ops = pfence->ops;
> > +	int err = pfence->base.error;
> > +
> > +	if (!err) {
> > +		err = ops->preempt_wait(pfence);
> > +		if (err)
> > +			dma_fence_set_error(&pfence->base, err);
> > +	}
> > +
> > +	dma_fence_signal(&pfence->base);
> > +	ops->preempt_finished(pfence);
> 
> Why is that callback useful?
> 

In Xe, this is where we kick the resume worker and drop a ref to the
preemption object, which in Xe is an individual queue, and in AMD it is
a VM, right? wrt preemption object, I've reasoned this should work for
an either per queue or VM driver design of preempt fences.

This part likely could be moved into the preempt_wait callback though
but would get a little goofy in the error case if preempt_wait is not
called as the driver side would still need to cleanup a ref. Maybe I
don't even need a ref though - have to think that through - but for
general safety we typically like to take refs whenever a fence
references a different object.

> > +
> > +	dma_fence_end_signalling(cookie);
> > +}
> > +
> > +static const char *
> > +dma_fence_preempt_get_driver_name(struct dma_fence *fence)
> > +{
> > +	return "dma_fence_preempt";
> > +}
> > +
> > +static const char *
> > +dma_fence_preempt_get_timeline_name(struct dma_fence *fence)
> > +{
> > +	return "ordered";
> > +}
> > +
> > +static void dma_fence_preempt_issue(struct dma_fence_preempt *pfence)
> > +{
> > +	int err;
> > +
> > +	err = pfence->ops->preempt(pfence);
> > +	if (err)
> > +		dma_fence_set_error(&pfence->base, err);
> > +
> > +	queue_work(pfence->wq, &pfence->work);
> > +}
> > +
> > +static void dma_fence_preempt_cb(struct dma_fence *fence,
> > +				 struct dma_fence_cb *cb)
> > +{
> > +	struct dma_fence_preempt *pfence =
> > +		container_of(cb, typeof(*pfence), cb);
> > +
> > +	dma_fence_preempt_issue(pfence);
> > +}
> > +
> > +static void dma_fence_preempt_delay(struct dma_fence_preempt *pfence)
> > +{
> > +	struct dma_fence *fence;
> > +	int err;
> > +
> > +	fence = pfence->ops->preempt_delay(pfence);
> 
> Mhm, why is that useful?
> 

This for attaching the preempt object's last exported fence which needs
to be signaled before the preemption is issued. So for purely long
running VM's, this function could be NULL. For VM's with user queues +
dma fences, the driver returns the last fence from the convert user
fence to dma-fence IOCTL.

I realized my kernel doc doesn't explain this as well as it should, I
have already made this more verbose locally and hopefully it clearly
explains all of this.

> > +	if (WARN_ON_ONCE(!fence || IS_ERR(fence)))
> > +		return;
> > +
> > +	err = dma_fence_add_callback(fence, &pfence->cb, dma_fence_preempt_cb);
> 
> You are running into the exactly same bug we had :)
> 
> The problem here is that you can't call dma_fence_add_callback() from the
> enable_signaling callback. Background is that the
> fence_ops->enable_signaling callback is called with the spinlock of the
> preemption fence held.
> 
> This spinlock can be the same as the one of the user fence, but it could
> also be a different one. Either way calling dma_fence_add_callback() would
> let lockdep print a nice warning.
> 

Hmm, I see the problem if you share a lock between the preempt fence and
last exported fence but as long as these locks are seperate I don't see
the issue.

The locking order then is:

preempt fence lock -> last exported fence lock.

Lockdep does not explode in Xe but maybe can buy this is a little
unsafe. We could always move preempt_delay to the worker, attach a CB,
and rekick the worker upon the last fence signaling if you think that is
safer. Of course we could always just directly wait on the returned last
fence in the worker too.

> I tried to solve this by changing the dma_fence code to not call
> enable_signaling with the lock held, we wanted to do that anyway to prevent
> a bunch of issues with driver unload. But I realized that getting this
> upstream would take to long.
> 
> Long story short we moved handling the user fence into the work item.
> 

I did run into an issue when trying to make preempt_wait after return a
fence + attach a CB, and signal this preempt fence from the CB. I got
locking inversions almost worked through them but eventually gave up and
stuck with the worker.

Matt 

> Apart from that looks rather solid to me.
> 
> Regards,
> Christian.
> 
> > +	if (err == -ENOENT)
> > +		dma_fence_preempt_issue(pfence);
> > +}
> > +
> > +static bool dma_fence_preempt_enable_signaling(struct dma_fence *fence)
> > +{
> > +	struct dma_fence_preempt *pfence =
> > +		container_of(fence, typeof(*pfence), base);
> > +
> > +	if (pfence->ops->preempt_delay)
> > +		dma_fence_preempt_delay(pfence);
> > +	else
> > +		dma_fence_preempt_issue(pfence);
> > +
> > +	return true;
> > +}
> > +
> > +static const struct dma_fence_ops preempt_fence_ops = {
> > +	.get_driver_name = dma_fence_preempt_get_driver_name,
> > +	.get_timeline_name = dma_fence_preempt_get_timeline_name,
> > +	.enable_signaling = dma_fence_preempt_enable_signaling,
> > +};
> > +
> > +/**
> > + * dma_fence_is_preempt() - Is preempt fence
> > + *
> > + * @fence: Preempt fence
> > + *
> > + * Return: True if preempt fence, False otherwise
> > + */
> > +bool dma_fence_is_preempt(const struct dma_fence *fence)
> > +{
> > +	return fence->ops == &preempt_fence_ops;
> > +}
> > +EXPORT_SYMBOL(dma_fence_is_preempt);
> > +
> > +/**
> > + * dma_fence_preempt_init() - Initial preempt fence
> > + *
> > + * @fence: Preempt fence
> > + * @ops: Preempt fence operations
> > + * @wq: Work queue for preempt wait, should have WQ_MEM_RECLAIM set
> > + * @context: Fence context
> > + * @seqno: Fence seqence number
> > + */
> > +void dma_fence_preempt_init(struct dma_fence_preempt *fence,
> > +			    const struct dma_fence_preempt_ops *ops,
> > +			    struct workqueue_struct *wq,
> > +			    u64 context, u64 seqno)
> > +{
> > +	/*
> > +	 * XXX: We really want to check wq for WQ_MEM_RECLAIM here but
> > +	 * workqueue_struct is private.
> > +	 */
> > +
> > +	fence->ops = ops;
> > +	fence->wq = wq;
> > +	INIT_WORK(&fence->work, dma_fence_preempt_work_func);
> > +	spin_lock_init(&fence->lock);
> > +	dma_fence_init(&fence->base, &preempt_fence_ops,
> > +		       &fence->lock, context, seqno);
> > +}
> > +EXPORT_SYMBOL(dma_fence_preempt_init);
> > diff --git a/include/linux/dma-fence-preempt.h b/include/linux/dma-fence-preempt.h
> > new file mode 100644
> > index 000000000000..28d803f89527
> > --- /dev/null
> > +++ b/include/linux/dma-fence-preempt.h
> > @@ -0,0 +1,56 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +#ifndef __LINUX_DMA_FENCE_PREEMPT_H
> > +#define __LINUX_DMA_FENCE_PREEMPT_H
> > +
> > +#include <linux/dma-fence.h>
> > +#include <linux/workqueue.h>
> > +
> > +struct dma_fence_preempt;
> > +struct dma_resv;
> > +
> > +/**
> > + * struct dma_fence_preempt_ops - Preempt fence operations
> > + *
> > + * These functions should be implemented in the driver side.
> > + */
> > +struct dma_fence_preempt_ops {
> > +	/** @preempt_delay: Preempt execution with a delay */
> > +	struct dma_fence *(*preempt_delay)(struct dma_fence_preempt *fence);
> > +	/** @preempt: Preempt execution */
> > +	int (*preempt)(struct dma_fence_preempt *fence);
> > +	/** @preempt_wait: Wait for preempt of execution to complete */
> > +	int (*preempt_wait)(struct dma_fence_preempt *fence);
> > +	/** @preempt_finished: Signal that the preempt has finished */
> > +	void (*preempt_finished)(struct dma_fence_preempt *fence);
> > +};
> > +
> > +/**
> > + * struct dma_fence_preempt - Embedded preempt fence base class
> > + */
> > +struct dma_fence_preempt {
> > +	/** @base: Fence base class */
> > +	struct dma_fence base;
> > +	/** @lock: Spinlock for fence handling */
> > +	spinlock_t lock;
> > +	/** @cb: Callback preempt delay */
> > +	struct dma_fence_cb cb;
> > +	/** @ops: Preempt fence operation */
> > +	const struct dma_fence_preempt_ops *ops;
> > +	/** @wq: Work queue for preempt wait */
> > +	struct workqueue_struct *wq;
> > +	/** @work: Work struct for preempt wait */
> > +	struct work_struct work;
> > +};
> > +
> > +bool dma_fence_is_preempt(const struct dma_fence *fence);
> > +
> > +void dma_fence_preempt_init(struct dma_fence_preempt *fence,
> > +			    const struct dma_fence_preempt_ops *ops,
> > +			    struct workqueue_struct *wq,
> > +			    u64 context, u64 seqno);
> > +
> > +#endif
> 
