Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF95458B87
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 10:29:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6760F89F2A;
	Mon, 22 Nov 2021 09:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9019189F03;
 Mon, 22 Nov 2021 09:29:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="234698194"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="234698194"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 01:29:30 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="508879579"
Received: from rmcdonax-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.19.217])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 01:29:13 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org
Subject: Re: [PATCH bpf] treewide: add missing includes masked by cgroup ->
 bpf dependency
In-Reply-To: <20211120035253.72074-1-kuba@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211120035253.72074-1-kuba@kernel.org>
Date: Mon, 22 Nov 2021 11:29:10 +0200
Message-ID: <87fsroo7x5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kw@linux.com, songliubraving@fb.com, kafai@fb.com, airlied@linux.ie,
 yhs@fb.com, ast@kernel.org, dri-devel@lists.freedesktop.org, andrii@kernel.org,
 a-govindraju@ti.com, ray.huang@amd.com, sbhatta@marvell.com,
 lorenzo.pieralisi@arm.com, daniel@iogearbox.net,
 krzysztof.kozlowski@canonical.com, john.fastabend@gmail.com,
 geert@linux-m68k.org, matthew.auld@intel.com, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, sgoutham@marvell.com,
 thomas.hellstrom@linux.intel.com, pawell@cadence.com, tzimmermann@suse.de,
 mani@kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, kpsingh@kernel.org, rogerq@kernel.org,
 linux-samsung-soc@vger.kernel.org, rodrigo.vivi@intel.com, bhelgaas@google.com,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org, axboe@kernel.dk,
 linux-block@vger.kernel.org, sj@kernel.org, lima@lists.freedesktop.org,
 linux-mm@kvack.org, jingoohan1@gmail.com, peter.chen@kernel.org,
 linux-usb@vger.kernel.org, christian.koenig@amd.com, hkelam@marvell.com,
 yuq825@gmail.com, gregkh@linuxfoundation.org, akpm@linux-foundation.org,
 colin.king@intel.com, freedreno@lists.freedesktop.org, gakula@marvell.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Nov 2021, Jakub Kicinski <kuba@kernel.org> wrote:
> cgroup.h (therefore swap.h, therefore half of the universe)
> includes bpf.h which in turn includes module.h and slab.h.
> Since we're about to get rid of that dependency we need
> to clean things up.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: axboe@kernel.dk
> CC: maarten.lankhorst@linux.intel.com
> CC: mripard@kernel.org
> CC: tzimmermann@suse.de
> CC: airlied@linux.ie
> CC: daniel@ffwll.ch
> CC: jani.nikula@linux.intel.com
> CC: joonas.lahtinen@linux.intel.com
> CC: rodrigo.vivi@intel.com
> CC: yuq825@gmail.com
> CC: robdclark@gmail.com
> CC: sean@poorly.run
> CC: christian.koenig@amd.com
> CC: ray.huang@amd.com
> CC: sgoutham@marvell.com
> CC: gakula@marvell.com
> CC: sbhatta@marvell.com
> CC: hkelam@marvell.com
> CC: jingoohan1@gmail.com
> CC: lorenzo.pieralisi@arm.com
> CC: robh@kernel.org
> CC: kw@linux.com
> CC: bhelgaas@google.com
> CC: krzysztof.kozlowski@canonical.com
> CC: mani@kernel.org
> CC: pawell@cadence.com
> CC: peter.chen@kernel.org
> CC: rogerq@kernel.org
> CC: a-govindraju@ti.com
> CC: gregkh@linuxfoundation.org
> CC: ast@kernel.org
> CC: daniel@iogearbox.net
> CC: andrii@kernel.org
> CC: kafai@fb.com
> CC: songliubraving@fb.com
> CC: yhs@fb.com
> CC: john.fastabend@gmail.com
> CC: kpsingh@kernel.org
> CC: sj@kernel.org
> CC: akpm@linux-foundation.org
> CC: thomas.hellstrom@linux.intel.com
> CC: matthew.auld@intel.com
> CC: colin.king@intel.com
> CC: geert@linux-m68k.org
> CC: linux-block@vger.kernel.org
> CC: dri-devel@lists.freedesktop.org
> CC: intel-gfx@lists.freedesktop.org
> CC: lima@lists.freedesktop.org
> CC: linux-arm-msm@vger.kernel.org
> CC: freedreno@lists.freedesktop.org
> CC: linux-pci@vger.kernel.org
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-samsung-soc@vger.kernel.org
> CC: linux-usb@vger.kernel.org
> CC: bpf@vger.kernel.org
> CC: linux-mm@kvack.org
>
> Well, let's see if this makes it thru email servers...
> ---
>  block/fops.c                                          | 1 +
>  drivers/gpu/drm/drm_gem_shmem_helper.c                | 1 +
>  drivers/gpu/drm/i915/gt/intel_gtt.c                   | 1 +
>  drivers/gpu/drm/i915/i915_request.c                   | 1 +

For the i915 parts,

Acked-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel Open Source Graphics Center
