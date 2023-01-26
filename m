Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 853A967D9D5
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 00:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFC910E0C6;
	Thu, 26 Jan 2023 23:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E9910E0C6;
 Thu, 26 Jan 2023 23:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674776608; x=1706312608;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zz/xKK6QCo1ek6JQ0UBcFX+mcJV+95sBtfF7NAwjrZk=;
 b=gKrEtTVBtu7Qi9PzF4KWqQoadP4CLh7FohZuhn/YDk9Gsvz4q3CSRktq
 jPyhkyHQ6eMgi1ykjKHYuaWRuJ8RY3R9xv1Q7KxYaREegIQule5+fnG01
 uJa/lXjZ8gRFtxUayBMsISD2TRU9g4MTLZ4AfV8T9EymT/Rn5V3iDyAIg
 QFP1Z9j4/RKjSLD9E2pnAJFb5GCYp5th+oF126iWxSwilN7Z1qcQYGcLi
 A18wVJ6TCcF9+hRsDVAemcUUK1AfO+gOgQ4qlzyIKqLA2Ri3qP7ulj487
 ezAcbgYSl0LuPiT+30TLRyb8qF0X/+7I+c9QV7+xmHlqbQRZZC2k57lpa g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="325659769"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="325659769"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 15:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="771355674"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="771355674"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jan 2023 15:43:26 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 15:43:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 26 Jan 2023 15:43:26 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 26 Jan 2023 15:43:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+NNE50k8zKrSeUydJbRfjji4/+UyX/mSTqrMslu4Rk2LaBi3BbHiJAPrvVEHH34kKXrVlG4GqDPz2Ir5ac0tnasbL83NJq7NCf/bMd3t2tfeqVuEOYtmUUlpYmClvXCc+w05FQe2CzFwVZAxRS/ytynswgxWhL3svSDE5RB1c1ybQ6k8XHQ/nooWFqP1134gcn104zianfS0KCb1oSGNEwkppBo8zHDueYv14oxmpIZ85RNN4AXSmFE6oGkxUKfQ5nqOfr+0Mly4eAM1dR/EyJbDs21sz7xLHbkkwt7K9D2uo/hzXv25nwqVSpggTGN/XYroRiZAXWTeGRdhSjoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28jfIqmwgY9unrGGgr+jYV+s0V+oVRAO8tKZZV4UQYY=;
 b=e+lZprlh2MplF0It4vO5t/+DPG1uaNUBUm4f2MXen8mvsjJBgup5m7gbX3/p+Nbd8o7qe3p2+TCthkq0gNk9wQHnZn/px50/YkheXGxRSLhllw4TRtcKunYPhJkHbxttxss1Zl1RuxEFP1wwGR0vRzNzHZx7q9J74zV2lCccrtkUuhdIve78xK+VKtfR9xgbnFTLRh3qlhgZHH6jfQST3EVOgdpyJ1KyZP2oVczI/Lmb5KVHHewUxrJYbcxcQEaGblSJzVwvGx1qGhGDiEezWrNld74r9JZmZdZ7Ot9XuahKhu2h54aGiBlipAOmVFdAGCu8uWYqenmtUtvlZ1ZOmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5446.namprd11.prod.outlook.com (2603:10b6:208:31e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 23:43:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.6002.033; Thu, 26 Jan 2023
 23:43:23 +0000
Date: Thu, 26 Jan 2023 23:43:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next 03/14] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <Y9MQCfCo9F7dwl33@DUT025-TGLU.fm.intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-4-dakr@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230118061256.2689-4-dakr@redhat.com>
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5446:EE_
X-MS-Office365-Filtering-Correlation-Id: ba224d39-eb04-43b4-22b4-08dafff71c9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iqdFAt9SNiCyw4TSB9bM2fAFy2KrAIj03GVfMYRWikl+nrviVCUXpDKBzGidRi9HOpSrEgZVXH9QqdJUzmfLRA7l2VCpL9gHRFD7eyuhYQWHIanV95o/UzHoPUo2PLuZxYsFiFIC0z3CWaRkYL2ohOdWnxbyPu5ijVT9ftGTVwmsDRWeS/VggxaUzkP9KI9A/ZrqIcA3GGban4W01RTyNmCx5dd89q+dkC/7XEAqHrBeLTLdzaqfmf6nsAn382zTSpxQdkgCFO44vEIy9sfGUNRHBATHE5IO0601rRBF715WfVwow3sc01qTaeEwcGLyeSGD+Sy+09OvoLiyP8cRBvbs3UnTwcA/fc4pD809P5d0de6C6rRkIzZRzV2aeagHNB5ApHqdT2kVLRNMyt/i7Lgq9J2rQQ2wxxMju4iQStpsp34JEbQZq5yGJbknpAQX8bN8YG+7c4IFrab06czWA7FyX2ITg7WhwGFz+msiefHp+39E1reV5s7sp1UNEutgB0VD1YhkO11fWGP4fY3aS+dsRl9NF/G4yNiUvuPc1HvmYG9CS8n8k9EGK+HmwT2gUAi+0M4XlbvMQc/YbPj+5cPYqr71c1IYw2BMBdE6syk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199018)(66899018)(66946007)(4326008)(316002)(8676002)(66476007)(6916009)(8936002)(41300700001)(66556008)(38100700002)(86362001)(82960400001)(6506007)(6666004)(966005)(26005)(6512007)(186003)(7416002)(30864003)(44832011)(5660300002)(83380400001)(2906002)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YDrhRL0MPMhMGohkK9XN8/N7JqK5FrMfu2XguUyBA4JyxqqbJG3mLI/eFX5n?=
 =?us-ascii?Q?LnI7Hxd5CvqBTXyO4RB/ZO2sYhb+d6VZakPQJGUUb6D8L1iz+OknCKtTMk8f?=
 =?us-ascii?Q?hk5ujAWiS8mMhd0Rob3YD+nF7r27PRBkQgD2FPuwyFQWXALo23i79+B1U3U5?=
 =?us-ascii?Q?LVx81jIKnuk02T7TWuFlpdEdm6BzE++Qk2Ll5hmmvawvNmMQyBrR2nYToKnr?=
 =?us-ascii?Q?5hLAhyWNUon70O9bRFHexGzl6gROCB04uI2tQTIewpAulla/LHuo06+Pxev4?=
 =?us-ascii?Q?ePwCpCPpjZtm3k83iNce9N8f7wz2/pJwDyHIJ+7moOOrQSyeNavZNaHVyBNY?=
 =?us-ascii?Q?IIJo8ExMGLrqy4EPRiTj0rN4LlLzuaRQ0L+VKCeYiC219+foVpKDCFnWlwrJ?=
 =?us-ascii?Q?1No09FsBYe9wzLBrHWjanBYrtq2CK0sC40BHKioxBVZQ2lRe07eVJ2CzTda5?=
 =?us-ascii?Q?Y/pgJmCXxeqAlhhc3g7G8vYi2IIcMqaLeG8s16Pp60JSUe1ju0TotF4v2PTP?=
 =?us-ascii?Q?/EuL2jLQzh53HkJt6i4Vya4IIDImmsr4Nprle8HsWgHHee6hQdGPbxqK8bHE?=
 =?us-ascii?Q?tvMIavT5zwVfM1hm4T/CzC1RkQUPfDY9R/mejtjHBi/+9rJxBDg6cayqcWXK?=
 =?us-ascii?Q?0UGQTcAgcveuXgad+zWOVi8ryMvCBcRrwIXzI30pJ0M2GVSKpA0PqkC0BwRT?=
 =?us-ascii?Q?Do5favCxaUQ2rtZpetEm5zRU+r7I+7HY1ah/emL6lbCQ+2Ub7nnqC/5TfNd9?=
 =?us-ascii?Q?v2o1P+5AJOG+6lDyTvSHRL2Ki2s+A/uhQbjB6W5cPRxYT7kma3CMrg0uvjI8?=
 =?us-ascii?Q?6VgyH+1Hafy4CTQKwo8LfweGmdnDHUDIwxGV7+09Z3Hq1Kab+/rNxt4yiqQa?=
 =?us-ascii?Q?Fd5nphv9tWuzRTfm5NF36M6FFZHGiU2Q+9eieS0ETIhAzkr+SFL/LxEM9avN?=
 =?us-ascii?Q?F+4UB9ewdDd0nmeK+uT4hGybyUVeBnscTEUEUxJa66v3ZNYixae84P+n3MfG?=
 =?us-ascii?Q?NJ13U6RWgxVSWFtRteYKa6aLGrhL8p5BqHyhDl7iO7l1ZmlEtPFP6VrnwRMV?=
 =?us-ascii?Q?dm0RbjBjSjg/QxHj1hohpjvIr2QumSm9ap/rC/pQn9WRrV6ricXVzS7JT/tN?=
 =?us-ascii?Q?QV4B/Z8YteAQxP83/du2LTF1CSUMvKAXo4NZZpP1AOKv3aHWGvG4lSUzKAoN?=
 =?us-ascii?Q?CLNxqz2F0kC7lfRkA9qcZqgACvqaDlhmnPEo4FPpaBJkUWk4MYGmUdUMW1K5?=
 =?us-ascii?Q?D1ovVgOAoj7CE8LcZosJTOMaJGGJ+ABiDezux3MhuMVtmfH45iWxpUDcazvu?=
 =?us-ascii?Q?zlSgAjrNJ7ohyUzESZgg5BR4ZyT3X0pavBb4pLOYlS+FHOlJF7Jsvl3k6kC5?=
 =?us-ascii?Q?IrjLB8Eyi5L+JaefKGzSJC3BVm1aFVHfPKE2VzqIV4CdlcEUXa1rPDbsCgCi?=
 =?us-ascii?Q?NTLtUKHEHTOn8Vv5WlT5xNcwLt9uFzpwqt+cGvKXarvfPV6s4Y+6j2z2Ka0T?=
 =?us-ascii?Q?ZEL4jeDUTtOQdhaGPkUr/eNi2Nl1gkJxcafkBgiHd4EiWAV7uT56CK+jP2g2?=
 =?us-ascii?Q?mIOwnNwQ003x/bg895cj2VWTyIXTcfprYo32O2U175nUmV0weznzmeN+Rvu1?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba224d39-eb04-43b4-22b4-08dafff71c9d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 23:43:23.1067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hvjb3/GVB1A7XhGRNmvrTW5GMYM4f99mS0wqdBLngaOed8X/64/FNS9ypopMq8Sa5337olM7fBOJxL2gocowqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5446
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
Cc: tzimmermann@suse.de, corbet@lwn.net, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bskeggs@redhat.com, jason@jlekstrand.net,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 07:12:45AM +0100, Danilo Krummrich wrote:
> This adds the infrastructure for a manager implementation to keep track
> of GPU virtual address (VA) mappings.
> 
> New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
> start implementing, allow userspace applications to request multiple and
> arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
> intended to serve the following purposes in this context.
> 
> 1) Provide a dedicated range allocator to track GPU VA allocations and
>    mappings, making use of the drm_mm range allocator.
> 
> 2) Generically connect GPU VA mappings to their backing buffers, in
>    particular DRM GEM objects.
> 
> 3) Provide a common implementation to perform more complex mapping
>    operations on the GPU VA space. In particular splitting and merging
>    of GPU VA mappings, e.g. for intersecting mapping requests or partial
>    unmap requests.
> 
> Idea-suggested-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

<snip>

> diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
> new file mode 100644
> index 000000000000..adeb0c916e91
> --- /dev/null
> +++ b/include/drm/drm_gpuva_mgr.h
> @@ -0,0 +1,527 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#ifndef __DRM_GPUVA_MGR_H__
> +#define __DRM_GPUVA_MGR_H__
> +
> +/*
> + * Copyright (c) 2022 Red Hat.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include <drm/drm_mm.h>
> +#include <linux/mm.h>
> +#include <linux/rbtree.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +
> +struct drm_gpuva_region;
> +struct drm_gpuva;
> +struct drm_gpuva_ops;
> +
> +/**
> + * struct drm_gpuva_manager - DRM GPU VA Manager
> + *
> + * The DRM GPU VA Manager keeps track of a GPU's virtual address space by using
> + * the &drm_mm range allocator. Typically, this structure is embedded in bigger
> + * driver structures.
> + *
> + * Drivers can pass addresses and ranges in an arbitrary unit, e.g. bytes or
> + * pages.
> + *
> + * There should be one manager instance per GPU virtual address space.
> + */
> +struct drm_gpuva_manager {
> +	/**
> +	 * @name: the name of the DRM GPU VA space
> +	 */
> +	const char *name;
> +
> +	/**
> +	 * @mm_start: start of the VA space
> +	 */
> +	u64 mm_start;
> +
> +	/**
> +	 * @mm_range: length of the VA space
> +	 */
> +	u64 mm_range;
> +
> +	/**
> +	 * @region_mm: the &drm_mm range allocator to track GPU VA regions
> +	 */
> +	struct drm_mm region_mm;
> +

I'd suggest using a rb_tree rather than drm_mm, it should be quite a bit
more light weight - that is what we currently use in Xe for VM / VMA
management.

See lines 994-1056 in the following file:
https://cgit.freedesktop.org/drm/drm-xe/tree/drivers/gpu/drm/xe/xe_vm.c?h=drm-xe-next

I'm pretty sure all of your magic marcos (drm_gpuva_for_each*) should be
easily implemented using a rb_tree too.

Matt

> +	/**
> +	 * @va_mm: the &drm_mm range allocator to track GPU VA mappings
> +	 */
> +	struct drm_mm va_mm;
> +
> +	/**
> +	 * @kernel_alloc_node:
> +	 *
> +	 * &drm_mm_node representing the address space cutout reserved for
> +	 * the kernel
> +	 */
> +	struct drm_mm_node kernel_alloc_node;
> +};
> +
> +void drm_gpuva_manager_init(struct drm_gpuva_manager *mgr,
> +			    const char *name,
> +			    u64 start_offset, u64 range,
> +			    u64 reserve_offset, u64 reserve_range);
> +void drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr);
> +
> +/**
> + * struct drm_gpuva_region - structure to track a portion of GPU VA space
> + *
> + * This structure represents a portion of a GPUs VA space and is associated
> + * with a &drm_gpuva_manager. Internally it is based on a &drm_mm_node.
> + *
> + * GPU VA mappings, represented by &drm_gpuva objects, are restricted to be
> + * placed within a &drm_gpuva_region.
> + */
> +struct drm_gpuva_region {
> +	/**
> +	 * @node: the &drm_mm_node to track the GPU VA region
> +	 */
> +	struct drm_mm_node node;
> +
> +	/**
> +	 * @mgr: the &drm_gpuva_manager this object is associated with
> +	 */
> +	struct drm_gpuva_manager *mgr;
> +
> +	/**
> +	 * @sparse: indicates whether this region is sparse
> +	 */
> +	bool sparse;
> +};
> +
> +struct drm_gpuva_region *
> +drm_gpuva_region_find(struct drm_gpuva_manager *mgr,
> +		      u64 addr, u64 range);
> +int drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
> +			    struct drm_gpuva_region *reg,
> +			    u64 addr, u64 range);
> +void drm_gpuva_region_destroy(struct drm_gpuva_manager *mgr,
> +			      struct drm_gpuva_region *reg);
> +
> +int drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> +		     struct drm_gpuva *va,
> +		     u64 addr, u64 range);
> +/**
> + * drm_gpuva_for_each_region_in_range - iternator to walk over a range of nodes
> + * @node__: &drm_gpuva_region structure to assign to in each iteration step
> + * @gpuva__: &drm_gpuva_manager structure to walk
> + * @start__: starting offset, the first node will overlap this
> + * @end__: ending offset, the last node will start before this (but may overlap)
> + *
> + * This iterator walks over all nodes in the range allocator that lie
> + * between @start and @end. It is implemented similarly to list_for_each(),
> + * but is using &drm_mm's internal interval tree to accelerate the search for
> + * the starting node, and hence isn't safe against removal of elements. It
> + * assumes that @end is within (or is the upper limit of) the &drm_gpuva_manager.
> + * If [@start, @end] are beyond the range of the &drm_gpuva_manager, the
> + * iterator may walk over the special _unallocated_ &drm_mm.head_node of the
> + * backing &drm_mm, and may even continue indefinitely.
> + */
> +#define drm_gpuva_for_each_region_in_range(node__, gpuva__, start__, end__) \
> +	for (node__ = (struct drm_gpuva_region *)__drm_mm_interval_first(&(gpuva__)->region_mm, \
> +									 (start__), (end__)-1); \
> +	     node__->node.start < (end__); \
> +	     node__ = (struct drm_gpuva_region *)list_next_entry(&node__->node, node_list))
> +
> +/**
> + * drm_gpuva_for_each_region - iternator to walk over a range of nodes
> + * @entry: &drm_gpuva_region structure to assign to in each iteration step
> + * @gpuva: &drm_gpuva_manager structure to walk
> + *
> + * This iterator walks over all &drm_gpuva_region structures associated with the
> + * &drm_gpuva_manager.
> + */
> +#define drm_gpuva_for_each_region(entry, gpuva) \
> +	list_for_each_entry(entry, drm_mm_nodes(&(gpuva)->region_mm), node.node_list)
> +
> +/**
> + * drm_gpuva_for_each_region_safe - iternator to safely walk over a range of
> + * nodes
> + * @entry: &drm_gpuva_region structure to assign to in each iteration step
> + * @next: &next &drm_gpuva_region to store the next step
> + * @gpuva: &drm_gpuva_manager structure to walk
> + *
> + * This iterator walks over all &drm_gpuva_region structures associated with the
> + * &drm_gpuva_manager. It is implemented with list_for_each_safe(), so save
> + * against removal of elements.
> + */
> +#define drm_gpuva_for_each_region_safe(entry, next, gpuva) \
> +	list_for_each_entry_safe(entry, next, drm_mm_nodes(&(gpuva)->region_mm), node.node_list)
> +
> +
> +/**
> + * enum drm_gpuva_flags - flags for struct drm_gpuva
> + */
> +enum drm_gpuva_flags {
> +	/**
> +	 * @DRM_GPUVA_SWAPPED: flag indicating that the &drm_gpuva is swapped
> +	 */
> +	DRM_GPUVA_SWAPPED = (1 << 0),
> +};
> +
> +/**
> + * struct drm_gpuva - structure to track a GPU VA mapping
> + *
> + * This structure represents a GPU VA mapping and is associated with a
> + * &drm_gpuva_manager. Internally it is based on a &drm_mm_node.
> + *
> + * Typically, this structure is embedded in bigger driver structures.
> + */
> +struct drm_gpuva {
> +	/**
> +	 * @node: the &drm_mm_node to track the GPU VA mapping
> +	 */
> +	struct drm_mm_node node;
> +
> +	/**
> +	 * @mgr: the &drm_gpuva_manager this object is associated with
> +	 */
> +	struct drm_gpuva_manager *mgr;
> +
> +	/**
> +	 * @region: the &drm_gpuva_region the &drm_gpuva is mapped in
> +	 */
> +	struct drm_gpuva_region *region;
> +
> +	/**
> +	 * @head: the &list_head to attach this object to a &drm_gem_object
> +	 */
> +	struct list_head head;
> +
> +	/**
> +	 * @flags: the &drm_gpuva_flags for this mapping
> +	 */
> +	enum drm_gpuva_flags flags;
> +
> +	/**
> +	 * @gem: structure containing the &drm_gem_object and it's offset
> +	 */
> +	struct {
> +		/**
> +		 * @offset: the offset within the &drm_gem_object
> +		 */
> +		u64 offset;
> +
> +		/**
> +		 * @obj: the mapped &drm_gem_object
> +		 */
> +		struct drm_gem_object *obj;
> +	} gem;
> +};
> +
> +void drm_gpuva_link_locked(struct drm_gpuva *va);
> +void drm_gpuva_link_unlocked(struct drm_gpuva *va);
> +void drm_gpuva_unlink_locked(struct drm_gpuva *va);
> +void drm_gpuva_unlink_unlocked(struct drm_gpuva *va);
> +
> +void drm_gpuva_destroy_locked(struct drm_gpuva *va);
> +void drm_gpuva_destroy_unlocked(struct drm_gpuva *va);
> +
> +struct drm_gpuva *drm_gpuva_find(struct drm_gpuva_manager *mgr,
> +				 u64 addr, u64 range);
> +struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start);
> +struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end);
> +
> +/**
> + * drm_gpuva_swap - sets whether the backing BO of this &drm_gpuva is swapped
> + * @va: the &drm_gpuva to set the swap flag of
> + * @swap: indicates whether the &drm_gpuva is swapped
> + */
> +static inline void drm_gpuva_swap(struct drm_gpuva *va, bool swap)
> +{
> +	if (swap)
> +		va->flags |= DRM_GPUVA_SWAPPED;
> +	else
> +		va->flags &= ~DRM_GPUVA_SWAPPED;
> +}
> +
> +/**
> + * drm_gpuva_swapped - indicates whether the backing BO of this &drm_gpuva
> + * is swapped
> + * @va: the &drm_gpuva to check
> + */
> +static inline bool drm_gpuva_swapped(struct drm_gpuva *va)
> +{
> +	return va->flags & DRM_GPUVA_SWAPPED;
> +}
> +
> +/**
> + * drm_gpuva_for_each_va_in_range - iternator to walk over a range of nodes
> + * @node__: &drm_gpuva structure to assign to in each iteration step
> + * @gpuva__: &drm_gpuva_manager structure to walk
> + * @start__: starting offset, the first node will overlap this
> + * @end__: ending offset, the last node will start before this (but may overlap)
> + *
> + * This iterator walks over all nodes in the range allocator that lie
> + * between @start and @end. It is implemented similarly to list_for_each(),
> + * but is using &drm_mm's internal interval tree to accelerate the search for
> + * the starting node, and hence isn't safe against removal of elements. It
> + * assumes that @end is within (or is the upper limit of) the &drm_gpuva_manager.
> + * If [@start, @end] are beyond the range of the &drm_gpuva_manager, the
> + * iterator may walk over the special _unallocated_ &drm_mm.head_node of the
> + * backing &drm_mm, and may even continue indefinitely.
> + */
> +#define drm_gpuva_for_each_va_in_range(node__, gpuva__, start__, end__) \
> +	for (node__ = (struct drm_gpuva *)__drm_mm_interval_first(&(gpuva__)->va_mm, \
> +								  (start__), (end__)-1); \
> +	     node__->node.start < (end__); \
> +	     node__ = (struct drm_gpuva *)list_next_entry(&node__->node, node_list))
> +
> +/**
> + * drm_gpuva_for_each_va - iternator to walk over a range of nodes
> + * @entry: &drm_gpuva structure to assign to in each iteration step
> + * @gpuva: &drm_gpuva_manager structure to walk
> + *
> + * This iterator walks over all &drm_gpuva structures associated with the
> + * &drm_gpuva_manager.
> + */
> +#define drm_gpuva_for_each_va(entry, gpuva) \
> +	list_for_each_entry(entry, drm_mm_nodes(&(gpuva)->va_mm), node.node_list)
> +
> +/**
> + * drm_gpuva_for_each_va_safe - iternator to safely walk over a range of
> + * nodes
> + * @entry: &drm_gpuva structure to assign to in each iteration step
> + * @next: &next &drm_gpuva to store the next step
> + * @gpuva: &drm_gpuva_manager structure to walk
> + *
> + * This iterator walks over all &drm_gpuva structures associated with the
> + * &drm_gpuva_manager. It is implemented with list_for_each_safe(), so save
> + * against removal of elements.
> + */
> +#define drm_gpuva_for_each_va_safe(entry, next, gpuva) \
> +	list_for_each_entry_safe(entry, next, drm_mm_nodes(&(gpuva)->va_mm), node.node_list)
> +
> +/**
> + * enum drm_gpuva_op_type - GPU VA operation type
> + *
> + * Operations to alter the GPU VA mappings tracked by the &drm_gpuva_manager
> + * can be map, remap or unmap operations.
> + */
> +enum drm_gpuva_op_type {
> +	/**
> +	 * @DRM_GPUVA_OP_MAP: the map op type
> +	 */
> +	DRM_GPUVA_OP_MAP,
> +
> +	/**
> +	 * @DRM_GPUVA_OP_REMAP: the remap op type
> +	 */
> +	DRM_GPUVA_OP_REMAP,
> +
> +	/**
> +	 * @DRM_GPUVA_OP_UNMAP: the unmap op type
> +	 */
> +	DRM_GPUVA_OP_UNMAP,
> +};
> +
> +/**
> + * struct drm_gpuva_op_map - GPU VA map operation
> + *
> + * This structure represents a single map operation generated by the
> + * DRM GPU VA manager.
> + */
> +struct drm_gpuva_op_map {
> +	/**
> +	 * @va: structure containing address and range of a map
> +	 * operation
> +	 */
> +	struct {
> +		/**
> +		 * @addr: the base address of the new mapping
> +		 */
> +		u64 addr;
> +
> +		/**
> +		 * @range: the range of the new mapping
> +		 */
> +		u64 range;
> +	} va;
> +
> +	/**
> +	 * @gem: structure containing the &drm_gem_object and it's offset
> +	 */
> +	struct {
> +		/**
> +		 * @offset: the offset within the &drm_gem_object
> +		 */
> +		u64 offset;
> +
> +		/**
> +		 * @obj: the &drm_gem_object to map
> +		 */
> +		struct drm_gem_object *obj;
> +	} gem;
> +};
> +
> +/**
> + * struct drm_gpuva_op_unmap - GPU VA unmap operation
> + *
> + * This structure represents a single unmap operation generated by the
> + * DRM GPU VA manager.
> + */
> +struct drm_gpuva_op_unmap {
> +	/**
> +	 * @va: the &drm_gpuva to unmap
> +	 */
> +	struct drm_gpuva *va;
> +
> +	/**
> +	 * @keep:
> +	 *
> +	 * Indicates whether this &drm_gpuva is physically contiguous with the
> +	 * original mapping request.
> +	 *
> +	 * Optionally, if &keep is set, drivers may keep the actual page table
> +	 * mappings for this &drm_gpuva, adding the missing page table entries
> +	 * only and update the &drm_gpuva_manager accordingly.
> +	 */
> +	bool keep;
> +};
> +
> +/**
> + * struct drm_gpuva_op_remap - GPU VA remap operation
> + *
> + * This represents a single remap operation generated by the DRM GPU VA manager.
> + *
> + * A remap operation is generated when an existing GPU VA mmapping is split up
> + * by inserting a new GPU VA mapping or by partially unmapping existent
> + * mapping(s), hence it consists of a maximum of two map and one unmap
> + * operation.
> + *
> + * The @unmap operation takes care of removing the original existing mapping.
> + * @prev is used to remap the preceding part, @next the subsequent part.
> + *
> + * If either a new mapping's start address is aligned with the start address
> + * of the old mapping or the new mapping's end address is aligned with the
> + * end address of the old mapping, either @prev or @next is NULL.
> + *
> + * Note, the reason for a dedicated remap operation, rather than arbitrary
> + * unmap and map operations, is to give drivers the chance of extracting driver
> + * specific data for creating the new mappings from the unmap operations's
> + * &drm_gpuva structure which typically is embedded in larger driver specific
> + * structures.
> + */
> +struct drm_gpuva_op_remap {
> +	/**
> +	 * @prev: the preceding part of a split mapping
> +	 */
> +	struct drm_gpuva_op_map *prev;
> +
> +	/**
> +	 * @next: the subsequent part of a split mapping
> +	 */
> +	struct drm_gpuva_op_map *next;
> +
> +	/**
> +	 * @unmap: the unmap operation for the original existing mapping
> +	 */
> +	struct drm_gpuva_op_unmap *unmap;
> +};
> +
> +/**
> + * struct drm_gpuva_op - GPU VA operation
> + *
> + * This structure represents a single generic operation, which can be either
> + * map, unmap or remap.
> + *
> + * The particular type of the operation is defined by @op.
> + */
> +struct drm_gpuva_op {
> +	/**
> +	 * @entry:
> +	 *
> +	 * The &list_head used to distribute instances of this struct within
> +	 * &drm_gpuva_ops.
> +	 */
> +	struct list_head entry;
> +
> +	/**
> +	 * @op: the type of the operation
> +	 */
> +	enum drm_gpuva_op_type op;
> +
> +	union {
> +		/**
> +		 * @map: the map operation
> +		 */
> +		struct drm_gpuva_op_map map;
> +
> +		/**
> +		 * @unmap: the unmap operation
> +		 */
> +		struct drm_gpuva_op_unmap unmap;
> +
> +		/**
> +		 * @remap: the remap operation
> +		 */
> +		struct drm_gpuva_op_remap remap;
> +	};
> +};
> +
> +/**
> + * struct drm_gpuva_ops - wraps a list of &drm_gpuva_op
> + */
> +struct drm_gpuva_ops {
> +	/**
> +	 * @list: the &list_head
> +	 */
> +	struct list_head list;
> +};
> +
> +/**
> + * drm_gpuva_for_each_op - iterator to walk over all ops
> + * @op: &drm_gpuva_op to assign in each iteration step
> + * @ops: &drm_gpuva_ops to walk
> + *
> + * This iterator walks over all ops within a given list of operations.
> + */
> +#define drm_gpuva_for_each_op(op, ops) list_for_each_entry(op, &(ops)->list, entry)
> +
> +/**
> + * drm_gpuva_for_each_op_safe - iterator to safely walk over all ops
> + * @op: &drm_gpuva_op to assign in each iteration step
> + * @next: &next &drm_gpuva_op to store the next step
> + * @ops: &drm_gpuva_ops to walk
> + *
> + * This iterator walks over all ops within a given list of operations. It is
> + * implemented with list_for_each_safe(), so save against removal of elements.
> + */
> +#define drm_gpuva_for_each_op_safe(op, next, ops) \
> +	list_for_each_entry_safe(op, next, &(ops)->list, entry)
> +
> +struct drm_gpuva_ops *
> +drm_gpuva_sm_map_ops_create(struct drm_gpuva_manager *mgr,
> +			    u64 addr, u64 range,
> +			    struct drm_gem_object *obj, u64 offset);
> +struct drm_gpuva_ops *
> +drm_gpuva_sm_unmap_ops_create(struct drm_gpuva_manager *mgr,
> +			      u64 addr, u64 range);
> +void drm_gpuva_ops_free(struct drm_gpuva_ops *ops);
> +
> +#endif /* __DRM_GPUVA_MGR_H__ */
> -- 
> 2.39.0
> 
