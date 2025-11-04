Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44820C3072D
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 11:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51D610E4FB;
	Tue,  4 Nov 2025 10:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0rXDAzY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D15310E4FB;
 Tue,  4 Nov 2025 10:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762251440; x=1793787440;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=K9IsUGi2wKpFhfnL6iptoWIjbutL+DAGLt1r4zaWAlQ=;
 b=c0rXDAzYtP2L3ORj7+/S+Hx1slnJUhNGSIUf7AQZpTKxo9VQpFjglJ6o
 3HusEBQl82KlKWbE5ApfbDsi/8kRXOYYWXl1DzWe2oCXYLbXfCe6ShpAN
 dVoyHkl7xeIujk6+2rFDgTTPwvq4XDYqr14SuTsuWjSM5l1yryvhIm1Gw
 /ydMJJQFEdt66yzxElkvIG4sSjWu0BWNbfucVAdRhLdHi8ueZKZvJO1c1
 FaPUl3sgoxnIS1rbD8LMcQ4GJhZnvsNmfoLXrmpzUEKBoVASdad/8aHby
 gF7eYuUak8lRWQ8XTu+sJOmqTM542czgfX7LGGLLtGvoEEi4kzExc7cxZ w==;
X-CSE-ConnectionGUID: z++DMAdsRSWhZ/op0bymIQ==
X-CSE-MsgGUID: G0YSyfN7TzGYc3svZHztUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75791943"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="75791943"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:17:20 -0800
X-CSE-ConnectionGUID: kvc8uvYsS7yF+E03YkuOZA==
X-CSE-MsgGUID: kQv+ZSHeSwqzS3z9bIuzhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="186363416"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.182])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:17:17 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
In-Reply-To: <20251104101158.1cc9abcd@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251103112418.031b3f8c@canb.auug.org.au>
 <b4faab8bee2b4430447ff7aeac0f2b3e9aac8ec8@intel.com>
 <20251104101158.1cc9abcd@canb.auug.org.au>
Date: Tue, 04 Nov 2025 12:17:14 +0200
Message-ID: <adda2398c0a29e0c5b0dcaa93a5be6ed0b67a1ce@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 04 Nov 2025, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> On Mon, 03 Nov 2025 11:26:01 +0200 Jani Nikula <jani.nikula@intel.com> wrote:
>>
> And now this:
>
> drivers/gpu/drm/hyperv/hyperv_drm_drv.c: In function 'hyperv_setup_vram':
> drivers/gpu/drm/hyperv/hyperv_drm_drv.c:80:17: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
>    80 |                 drm_err(dev, "Failed to allocate mmio\n");
>       |                 ^~~~~~~
>       |                 pr_err
> drivers/gpu/drm/hyperv/hyperv_drm_drv.c: In function 'hyperv_vmbus_probe':
> drivers/gpu/drm/hyperv/hyperv_drm_drv.c:140:17: error: implicit declaration of function 'drm_warn'; did you mean 'dev_warn'? [-Wimplicit-function-declaration]
>   140 |                 drm_warn(dev, "Failed to update vram location.\n");
>       |                 ^~~~~~~~
>       |                 dev_warn
> drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_plane_atomic_check':
> drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:161:17: error: implicit declaration of function 'drm_err'; did you mean 'pr_err'? [-Wimplicit-function-declaration]
>   161 |                 drm_err(&hv->dev, "fb size requested by %s for %dX%d (pitch %d) greater than %ld\n",
>       |                 ^~~~~~~
>       |                 pr_err
>
> I have used the drm-misc tree from next-20251031 again.

And now this fix [1]...

Thanks for the report, and sorry for the trouble.

BR,
Jani.


[1] https://lore.kernel.org/r/20251104100253.646577-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel
