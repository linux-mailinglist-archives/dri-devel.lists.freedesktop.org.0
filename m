Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5746E8614
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 01:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B718610E247;
	Wed, 19 Apr 2023 23:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA59F10E247;
 Wed, 19 Apr 2023 23:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681948359; x=1713484359;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=97Fm3O1ggxRIu/0eiD9vrhE8Bwi/8sAcNGhkhWKHDWk=;
 b=SXGQOPMvVOxFw0PJjvvmoHNTES8i6mWTlAlPJ9l23NvX/si7SC5N1ppg
 VfsQ3MzWIfas3Z699RkbA+PMR4haiWSwahQkeuMtuhurS2N8cB47Gn5ci
 PZuJXpI3CZ6X3owoizyB3mZBaOyW3phWAuiscJLdkQKznyu6UoWPV+1bz
 RJrA7ZG5om7ix3NufDhwvSzhVvEFv/YjYXc1u5CEEI549bz+IHxtXu/si
 Er2m/V83VVizyzFPFEnV0aYwaKy0K6kI+iojytlCX878d8dtlePlMtnow
 ewI7fZupGbN69tGolmvBZCAibfj7X/tkMocfquEx7EsF92uIw2U1sJKD0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="334408369"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="334408369"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 16:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="685137073"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="685137073"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 19 Apr 2023 16:52:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 16:52:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 16:52:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 16:52:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 16:52:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FU5Pf/Ug9Wr18Q3VvRK7nhoGDekx95nViyluwKtVdMyq+tPBOPVhEA90iWA5Kzz+/3oMHHNbp7H3bOKMSbwk9S+saosWzuzGo/QFLpq32c9i6m9XqVj4J2afqecSq2UpfIu5fKVfvy1Z9hEqVqhhOU9Kzg29m/qwdovkktXUh8pZ/ToXl9wt40FwK4dLoPSq8+iAxKGJEaWEWaLDas3ZFx2mh9Vvyyo0dvyf4Vfny65y1NzwRPu9JvdvlMQvJGGlwy6ti+N0WoRhfM5L92etAV7Gfln4TX8aTPuncJ12dlHjiekuma2T8IkMhgSL5kB8WPNrXqmC9avFfkxsMeJ/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7J0BGVesSoPVHtuva2bjt9DiXRkgKVgkAHMqVMUHeU=;
 b=PNAYmoQ8EjSu1jXPtivk2iQl5pJlOxEMdRkl8CHFhCjK/jre6pKgGkKqc5eC87g0lYoTSjaPXFGZeRkwMqHDA13tvnHgV/xfxhju99/ViEzVMsYPUdM4y0kgdHHZqbgDEaJPcgzoEWJFjVWD1AO1Bfv0RmfKpn/e2Y1t5AirxeD0iUXT7eq26rkv86vqvEbSE9EkrcyBThDIIBJoL6VQdU4VPt6r6FHdOKyQcbieYRGqzG7M/QMEFwzCIs81SuyLFMykBDg0bRT2JojcvofchyyJaLu19u+WlE8zVYGvtkpO78ueR1kHJFWjx0DOMGxKRo/sqyo/JeZ0ce8rLYa57A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 23:52:34 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 23:52:34 +0000
Date: Wed, 19 Apr 2023 23:52:24 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v3 0/3] drm/xe: switch to using drm_exec
Message-ID: <ZEB+uDs4Tlpz9qPN@DUT025-TGLU.fm.intel.com>
References: <20230419175650.3259121-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230419175650.3259121-1-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR17CA0067.namprd17.prod.outlook.com
 (2603:10b6:a03:167::44) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b83cb4-6a7e-45a0-f50e-08db4131258e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SULlKk3mYurjhVEqNc1WCMd4R9RpG5hTywfevnBndg7YOPn5HHEp2l29EvJ+e70vUuyJ2xRg6FmTziYkSg8RcZ/upogIH+sO9TOjEaRIcoB8MCpZXd6pDQgjRg9+44UmF9vHvtJgGueI6De3Q1xT5EDGCEraMqdtlpJ+c8R0J2rn6SMz4zFbGJJ3Ku7WgiKJF3cZ3tbB9C9Kz+ePYbXvpSxpLI0ekK2vqkSGSco1a4lJDVcKXvpw2i0FZkgjvAjU6JUZz7BTz/XpGriGTZaewiUx/4E456iPbYQn4z+9GgwJ85k1FPM/Q5SrrrkZyIaYuwVxHgOIKwPxXb0ZJaODQ6YS7TXUptP3YaOJUrQuUI6hZmV+JjM+QEqRswXOH8FQNyB8wW0WMW2FhNka7g/Vhq7MluNdS+6vQk34BESgp8GRCqqEBQdHIU2if5VDgesZ54taf43H15hKMGfK57sOLjtZBLHAmxPpVAP78PUJ5M3Nyc/Xwlj6n1BhvMkv+a4+dP3Nw7XUMSUVYRRoL63yrcm2LLZl5ecRfK1nKsI/E09CEglrrT3rrUCWZxJitFX8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199021)(38100700002)(82960400001)(26005)(6506007)(6512007)(186003)(66574015)(107886003)(83380400001)(44832011)(2906002)(8936002)(8676002)(6862004)(5660300002)(86362001)(41300700001)(6666004)(478600001)(6486002)(966005)(4326008)(6636002)(66476007)(66946007)(66556008)(316002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PHDiYMgzYvhIFq9tTXrIWyhiEiv0BmlemlccUITolu/MSzob3ox5oWHM3D?=
 =?iso-8859-1?Q?JfJ0t7frsZ2J0OT3uwM2aEkWUBcfzNCkwUuBd8+hi7r5Fw8OcNpttWRbIn?=
 =?iso-8859-1?Q?ETmW8Im6c8k3Vkx/u52ZjxZsXKXp9AE2euAUA6ibzRpg/17SJdotquMUBo?=
 =?iso-8859-1?Q?ICnhbWS8cDa40xcai0fCQUqhlXhuurYXTIIp9sG7/Qb2AOzIBMplLBNSuF?=
 =?iso-8859-1?Q?PCiJbcMuyUtW6/YdHinbcJNUrNUuRz9J5jSZiIl8ZDWTJTRojdpmJLCEGx?=
 =?iso-8859-1?Q?kvrGvTadGPQCw71qD3yaXT8Yc6PFj27aGAImJElxXeAubbI5iMeRz/4/iG?=
 =?iso-8859-1?Q?s6RxRRwHdLbLrsBPZXRb57bhUByD9lsVgNduFQXymsQh1TToaityPRtbr2?=
 =?iso-8859-1?Q?vr2tjlsSN8Ncsv0i98vjvONxMG8ZoKrbjrmJirQi15b4b4mR/RH6pPiH6W?=
 =?iso-8859-1?Q?rFlvei2gYtmqyZ7fdyZwoi34xzbHotdo6RerGl1SKBMlx5QFX7hxnhsvqu?=
 =?iso-8859-1?Q?4qXEzowahcaeZ8v4O8Zp3EhOpowZpusMOTirdY7cyZ1F9Lhn7eGo+p1QOk?=
 =?iso-8859-1?Q?91pcZ3Ko90KAPl1/vuHRJ96RKsC7siiGD0NtAOntaw6yG0bLsHjksad6P5?=
 =?iso-8859-1?Q?C95MrwrJCaQ+DitXX8ISfmzvtcBolS7fgZJhkZnsJz/rMUNxOfNfxDC4Ab?=
 =?iso-8859-1?Q?RUq4Y4sesgb0pj3Z0YXSukZNBs0FUz+NgOtD4OlmPR/81NtdJ0rKKu4aeY?=
 =?iso-8859-1?Q?B/vVlMXDIXXbUmh5yW7gPTyGvZLS+UBcoliDRQurQakVVo4o6FtJu/2ZKK?=
 =?iso-8859-1?Q?JsS7cwcJMQT6TcF2U7gEEnrrUubl8DpT3lENCQNmktQf3DwhPfrL6BSHeA?=
 =?iso-8859-1?Q?PjoNId0OD7Te5KHQFVKzRmOSQhD8T8RrAoK6agv5Mb/qMck1NS0rzHlG/A?=
 =?iso-8859-1?Q?1J92L7NVGrZr7P6LDZKNZ0662IdBfdMthPz4S84ayhpNZeZyRCnLZmDgOs?=
 =?iso-8859-1?Q?s+X8umcC34Zd6SwTJurMmr8y/690FVkJ2rUkHe6eHvg3LLUOtjtoKx1W0h?=
 =?iso-8859-1?Q?Tte80rDY7aJgCJU49OJD3QPtlr1gXjNOQL8wazMSu8GSs0BQYQdnD/rhpz?=
 =?iso-8859-1?Q?xls5qg5bOZynPmsDbiyX2qtsLEwMpZ+H01Yo+p214uoNL2SUXh16/j+cMS?=
 =?iso-8859-1?Q?kmP+b/xE5sWURMogMY3YUjYFPs/VkJLHHIdg+n3pFWhb1wgzvzZ+iM1WO4?=
 =?iso-8859-1?Q?6kVDJDh93b5cWzD5nluPzQLMa3cJ7LKKdZGM/BNZ28AVkZImwaVBNRHgpo?=
 =?iso-8859-1?Q?XR+W1z1ih6znBKT7z8+5VUK+kfs5LGbSPb5d46Uqq+PzvwE2gblFR8ek5n?=
 =?iso-8859-1?Q?1LOn7VBCNQTqj+k4oquLwG8op0KjZDD0J95C/+66PAVX815FUfQ5i1DNU8?=
 =?iso-8859-1?Q?ojjLobTQ/FEXcqBR/w1oZLUb1quWyO3U9bkaVYVZ3WjWho4rBdw5uF+PiH?=
 =?iso-8859-1?Q?o1Wuq9nsgFaZcqvzoFY9EsMJUG2tlTZuyynKTIB83rhXBCny/jmNTae46Q?=
 =?iso-8859-1?Q?iYnzKiKEUWHzoA+RdbrvW+I8H95BpJRKrx6aeZDcsoKy7hj8q9wrZPTLGV?=
 =?iso-8859-1?Q?Bq8zyLalt5Flk7nfyHXMsNuZJ5sUvIshUTSHIHMrz+Ets8hp9P6tITiw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b83cb4-6a7e-45a0-f50e-08db4131258e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 23:52:34.5825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgU+zTSh5Xvuh9qf85T0GbUwCfRoYWwLkt1EH12+O8jGpLfXZUCrJDDdsybwH59Uzw4wrO0ck5twFqXzNmGQtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
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
Cc: lucas.demarchi@intel.com, dakr@redhat.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 07:56:47PM +0200, Francois Dugast wrote:
> This makes Xe use the new drm_exec helpers provided by this series,
> which is not merged yet:
> https://patchwork.freedesktop.org/series/114464/
> 
> with this fix:
> https://patchwork.freedesktop.org/patch/530670/?series=112994&rev=4
> 
> v3 includes code shared by Matthew Brost.
> 
> v2: add a first patch with squashed dependencies (Lucas De Marchi)
> v3:
>   - remove "RFC"
>   - add dependencies as original patches
>   - move drm_exec calls to xe_vm_lock_dma_resv/xe_vm_unlock_dma_resv,
>     use new helper functions xe_vm_bo_lock/xe_vm_bo_unlock, fixes in
>     drm_exec calls (Matthew Brost)
> 

For this series in general I'd personally be inclined to include it in
the merge of [1] as the large GPUVA change isn't going to apply after
this series as GPUVA is really invasive / rebase is non-trival. Also
based on a coversation with dakr [2] [3], we probably want to move some
of our locking helpers to GPUVA + do not build DRM EXEC as a module.

Matt

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/340
[2] https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/340#note_1875039
[3] https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/wip-gpuva?ref_type=heads

> Christian König (1):
>   drm: execution context for GEM buffers v3
> 
> Danilo Krummrich (1):
>   drm_exec: fix double dma_resv unlock
> 
> Francois Dugast (1):
>   drm/xe: switch to using drm_exec
> 
>  Documentation/gpu/drm-mm.rst         |  12 ++
>  drivers/gpu/drm/Kconfig              |   6 +
>  drivers/gpu/drm/Makefile             |   2 +
>  drivers/gpu/drm/drm_exec.c           | 248 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/Kconfig           |   1 +
>  drivers/gpu/drm/xe/tests/xe_bo.c     |  17 +-
>  drivers/gpu/drm/xe/xe_bo.c           |  29 +--
>  drivers/gpu/drm/xe/xe_bo.h           |   6 +-
>  drivers/gpu/drm/xe/xe_bo_evict.c     |  24 ++-
>  drivers/gpu/drm/xe/xe_bo_types.h     |   1 -
>  drivers/gpu/drm/xe/xe_exec.c         |  30 +--
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  56 +-----
>  drivers/gpu/drm/xe/xe_vm.c           | 287 +++++++++++++--------------
>  drivers/gpu/drm/xe/xe_vm.h           |  29 +--
>  drivers/gpu/drm/xe/xe_vm_madvise.c   |  36 ++--
>  include/drm/drm_exec.h               | 115 +++++++++++
>  16 files changed, 615 insertions(+), 284 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_exec.c
>  create mode 100644 include/drm/drm_exec.h
> 
> -- 
> 2.25.1
> 
