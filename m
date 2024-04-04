Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3056D898A66
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 16:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00662113227;
	Thu,  4 Apr 2024 14:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8YNaeUm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE90112CFA;
 Thu,  4 Apr 2024 14:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712242241; x=1743778241;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=8EegKt9eDidKWkITUAXit3LfBEiwzWMpZpJRS2ODqZc=;
 b=m8YNaeUml3F81/QFFdC3VJE/m5HT4IDtytIU7gpL2vEmhzfLUBXLXPiI
 ZtWQEV6hyGNNYOsZVErf59mn0wl2p++ODYRMbUrOl8F745qSO7Igbj3vI
 mvkqM2UiDwBIHOJzvH4wV0P4lx0weFVFFLAmKoFYSTA5O11TC+5+YdQz6
 nuySvx+woPsD+ZUdo/OYBy4LMQvdiX+sV9PezJYpHh3kmMPqMaUkEVQZ8
 gJNfxyoVaLvFYCkQZxVeEA35L/jGlqdXWsy6g+5mnai5Q3DSE1re27iQ0
 CdeoqrnBj9ZPIFzRj2fPI8mrJSExwJCbjwG+dsz3lu/NYAHgS+qZaNnna w==;
X-CSE-ConnectionGUID: F0GptwquRKSsBVT2X76cJg==
X-CSE-MsgGUID: /fx0CMO0RjCZ6JjqXMM+aQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="10499048"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="10499048"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 07:50:03 -0700
X-CSE-ConnectionGUID: XowrSnvARzSBuwliDlAXtA==
X-CSE-MsgGUID: Mufc9JAUQq6NQPWomTYDIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="41966391"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 07:50:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 07:50:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 07:50:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 07:49:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJR3+8ootcMdv/B9DrBAsWu1LzwVm9lcx5pedTGJmIrSeXA+mc80MDXBFkhL/kMDR5ovajac4SwNwbOQSBrcnZedSfNDFqRTS6ePt0DTJq0lYcYU8PN+re1o4fcQC/Qinid98L5qK2bsOqp6bTKPyHa55hDfHl7GtwTUsvL/sCvPhtoUd4z8NAMqHQy2F0ufYghhQMZXaZmMJCb4IiTxKg8x8YP9z8biKMqs/dyooUIH5Td5g3wK85iCIPVAWg9vFboJeDKuRjd14pPj74ji//Ry+Nkeb8eZ1olCydT3TPqcyLyMsFAjCC7af+xq+zX6FNyBLV41gJMixpxebxVJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vGFBTXL8WNEaCMPxhfLTXGonzfB7s12Xwn+pewtAU8=;
 b=A75hf4X2FiNoh7qwgwBvT3ul1qXI0PqKwRVueaIaYcg6JAbUP2NOoX+D96tni/DD4b6AuEwRW87488kopqnHfG0RP49Bckbj/An8TJJ5JaWQ2VF4Sr3QqMzi3eWb5IezaefR5OafJq5wINS+HOvEsQwOraIysDFR0h83b7jQVdzJLe44nW7jvz8omTIS0/ePHiYH9YcBDtt1pHTMHJur7eRGikBRc2LDcK55lamI30uB6shKtxp9X/If5WmuMk1R0yHWs3Y3BP1+i9LP2+nVcwJYoWvVsnaqLlfdYWj8EOrO+qPgL45Fj0/NA3jW+kGja22D3e6EVhdBcfd0HMADPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6043.namprd11.prod.outlook.com (2603:10b6:8:62::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.26; Thu, 4 Apr 2024 14:49:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 14:49:41 +0000
Date: Thu, 4 Apr 2024 09:49:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <tizan6wdpxu4ayudeikjglxdgzmnhdzj3li3z2pgkierjtozzw@lbfddeg43a7h>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0192.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6043:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dh1mhvSkYR2c0ZhIQGHBGsIbED9RNPAZxFZITdpjwcD/LoPg9qmAW8ytwWR3Lc4lYyQ31U/AWBjSMOdOYj/5zZKNaIqwarBuP1I6b5GUKp1fLZp4A9n+z+KTjp5+c8Vk58i1q7Am6Bpk6PzM6DX+I/V8mO2FuJy0GpYGXexd4zQ9bouQO1iWOtd5tNZaIjnoJLI3a5xOULUhk9ixJdfxwxU6t6OHjR9CxXsQx/i5oVtNhOVpEZm9/kcIUhawQ+yqrSm/qpxvJjMP4O5N0UlDANUHR8TdwJ98ziMpxrXjVkHwqzkfNn3AcoZ1ZN6T9HUUMbays5wKZsM3XcegylzcE3hihILGrudRPzD07GZslpVQ/4oanILc7PCRdsBOwWU67uuGnA+ClIJLWchisXFFteu+uwiqKxiI/pQN6AHQJdBGOHuHCi8bIP5d+YN9BvxecIFGZ8T67gXfFpqbx7jQ1mqa2X/T0v6f3VourNx31peXV1ObBAScUcY/HmyVBQBJSNJIdBIxHV+jf72mRZH8d5wTjHHEWHzbqdozRgVQCx/iWtdPNVK97wm/9uUwynvV3S/MkvKPf973C7XPVzYG/Ktfrdfe4cqPtJh0cjDOSxs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?72Un9WnCxy8+SVS8dcNGnuAqqPu9k5VpgbfYmO/I4J6ZCqRm/aScAmyw3c?=
 =?iso-8859-1?Q?svZcw6jixSRh8aNdgN+j6+oXpg6g/6ch6awzluuTr5sryTLf9PxXVNIC/K?=
 =?iso-8859-1?Q?m6Wf1JYPvewU+tMTukzjhj7ui3iTnKUvsKBPobfH9e+Qn3wPyjGeeE3FEK?=
 =?iso-8859-1?Q?w9dFNElBgGXfUl52cYqikQez69LXv6Jn+LccYUT1vZyay7Ih+Fn5wQLxWd?=
 =?iso-8859-1?Q?KPQcsHidVqMIyFvQeZY3hOQZsL1E8qgoOcmlJRIbUCba1bj6n8QyPGUXyU?=
 =?iso-8859-1?Q?bQ4UivJHb+pEkXbzX0mlwWnGPZ72BVPFHXMI/YXaiIVoKMWiztNzSj96u0?=
 =?iso-8859-1?Q?YNVJaVR4pB3rBcaHjyiEeDWdyn7VjJ4mnTyK22cs8clhLeJrY7vOg5uNJA?=
 =?iso-8859-1?Q?mexcY3/iMYR+GfAZy6xwG00GP/OQ5Dpd9ZehUdlW7UBSwDtnpp2Bb/Klyx?=
 =?iso-8859-1?Q?vHE3W5Wz8G8riXe+5Swud+3SPFQcYX0ObKLRIbWd8v8KEBCEbvKRtDLA0g?=
 =?iso-8859-1?Q?s/wXjp4tjRn75wwq3Z+wFVT/qw/6WmYkYgnajvKshgb0SSjpVzxsLsZzJC?=
 =?iso-8859-1?Q?B5jxLdaQGODFsgWvpkgC2fKNN0dvR6VAEUhOGNQv4ruG/MfMKsYo+YLTHS?=
 =?iso-8859-1?Q?yp60YI7eiRX436aOdMapR7EDs8V6EIyX7ovOQCXAsHfPbCaq0+RYIYb18t?=
 =?iso-8859-1?Q?ypxPF84lLO0wc2NRSTqK+86iCa3q4A7TS/2rIofX1xouJNRF2bXpulI7I8?=
 =?iso-8859-1?Q?F7RpsCY1hUtSBdV8pxUVXa8zMpfVD1NnFvdDRt4vZGfrduBO6fymo3QMnA?=
 =?iso-8859-1?Q?TMLqP7RpAA3+tTL0WzYdJKiGe9o11VQGiPr7F2yfq9rLJVSP3VgdZdmUfP?=
 =?iso-8859-1?Q?thMlvHiGgF+Yl4rRq/da2eNd9u0o5rpIaNohXj0O0vLouIODmpaVu6rDW0?=
 =?iso-8859-1?Q?j5XaqIDuRi/nkOym3Iu0+DLWoecjQTzhkE2TBkq4kiWdSeo+Hquk8PPgeR?=
 =?iso-8859-1?Q?R5RPK0hoeEUGfL0wxdUzhB9qghQ3y7oCWvYBSVb18czOKdaQjKEijvNOuV?=
 =?iso-8859-1?Q?qrjna9EPNUV4VeGAkcJILEzVLY4ci7tjKxlcZ/hzPn29GcXsVwFI+ZDgnf?=
 =?iso-8859-1?Q?LTzQH7ENH+nnR48M2wOhWvABEJQZMAbe0wZC7ThtJeBP1eRkXG54f1hD/u?=
 =?iso-8859-1?Q?/1ebSUvExVMUWf20gI5MEQuvg9jDgx2dxxgvFbs2M/R9tgweEBjXU+6xt4?=
 =?iso-8859-1?Q?2PecTe4bt5Cn3Pkbs0msfK7L1MwfvU1Qij94gKOrpdxBGfe3CC29tEdhYx?=
 =?iso-8859-1?Q?gFXawPht81TjTCQbNWms9SUJlfyiHMmrczx732gvtoDKsG1OwrLM2jfbP7?=
 =?iso-8859-1?Q?WVSsRznP0bmhXjI1K3UmPlHSkOMtVz0Ueltg5DK7ZpYAfmoGYmVTwL7KCm?=
 =?iso-8859-1?Q?ZyFe8gLz3rmUZxEBZRLY6pSd1kBOcIFihCOj+aNDQYiNzZK+ajOC0rJtvl?=
 =?iso-8859-1?Q?X1ICYElhCA9Wcsazlgk1Wf75uVEAgTeOdiEDtv/MOh1myv5Ej7UeNaIQrA?=
 =?iso-8859-1?Q?iC5lYXYZxJy9IEZQztR4bcbde4p6HsYhOM6Pt+ZcS5SefFRmiIiQTKu8Uq?=
 =?iso-8859-1?Q?HfshUeRPgIEFkMs8xMRI4DBcPuBqjhlGoKSEKuf9yPHMEhGLLjhDxEJw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c204968-8247-4ff7-ace9-08dc54b675ba
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 14:49:41.7088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoWk3THm5eKBvNcxCHpJTEJqfVB8tTIGg3d6HncoKJgNnL251LISo5r+44vVIFhpCMGOOgQvfXy7eqtthq36kDXFmD60cSDvSGSmyEIW5pQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6043
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

Hi Dave and Sima,

Please pull the drm-xe-fixes for this week targeting v6.9-rc3.

This is a little late in the week as I was waiting a critical fix to be
applied to get our CI back. This is mainly due to some stress tests
creating hundreds of exec queues and that not playing nice with the
workqueue changes introduced in v6.9. That shouldn't be the normal use
case but was causing CI to abort further tests.  Other changes include
fixes around rebinding and TLB invalidation.

thanks
Lucas De Marchi

drm-xe-fixes-2024-04-04:
- Stop using system_unbound_wq for preempt fences,
   as this can cause starvation when reaching more
   than max_active defined by workqueue
- Fix saving unordered rebinding fences by attaching
   them as kernel feces to the vm's resv
- Fix TLB invalidation fences completing out of order
- Move rebind TLB invalidation to the ring ops to reduce
   the latency
The following changes since commit 39cd87c4eb2b893354f3b850f916353f2658ae6f:

   Linux 6.9-rc2 (2024-03-31 14:32:39 -0700)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2024-04-04

for you to fetch changes up to 77a011012d7d8b98368a763bf74317c6d5ce00f1:

   drm/xe: Use ordered wq for preempt fence waiting (2024-04-04 08:32:34 -0500)

----------------------------------------------------------------
- Stop using system_unbound_wq for preempt fences,
   as this can cause starvation when reaching more
   than max_active defined by workqueue
- Fix saving unordered rebinding fences by attaching
   them as kernel feces to the vm's resv
- Fix TLB invalidation fences completing out of order
- Move rebind TLB invalidation to the ring ops to reduce
   the latency

----------------------------------------------------------------
Matthew Brost (1):
       drm/xe: Use ordered wq for preempt fence waiting

Thomas Hellström (4):
       drm/xe: Use ring ops TLB invalidation for rebinds
       drm/xe: Rework rebinding
       drm/xe: Make TLB invalidation fences unordered
       drm/xe: Move vma rebinding to the drm_exec locking loop

  drivers/gpu/drm/xe/xe_device.c              |  11 ++-
  drivers/gpu/drm/xe/xe_device_types.h        |   3 +
  drivers/gpu/drm/xe/xe_exec.c                |  79 ++------------------
  drivers/gpu/drm/xe/xe_exec_queue_types.h    |   5 ++
  drivers/gpu/drm/xe/xe_gt_pagefault.c        |   3 +-
  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   1 -
  drivers/gpu/drm/xe/xe_gt_types.h            |   7 --
  drivers/gpu/drm/xe/xe_preempt_fence.c       |   2 +-
  drivers/gpu/drm/xe/xe_pt.c                  |  25 +++++--
  drivers/gpu/drm/xe/xe_ring_ops.c            |  11 +--
  drivers/gpu/drm/xe/xe_sched_job.c           |  10 +++
  drivers/gpu/drm/xe/xe_sched_job_types.h     |   2 +
  drivers/gpu/drm/xe/xe_vm.c                  | 110 +++++++++++++++++-----------
  drivers/gpu/drm/xe/xe_vm.h                  |   8 +-
  drivers/gpu/drm/xe/xe_vm_types.h            |   8 +-
  15 files changed, 140 insertions(+), 145 deletions(-)
