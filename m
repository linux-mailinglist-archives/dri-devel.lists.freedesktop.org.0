Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3D72AA05A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 23:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118486EB3D;
	Fri,  6 Nov 2020 22:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5304F6EB3C;
 Fri,  6 Nov 2020 22:26:34 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 89B9520068;
 Fri,  6 Nov 2020 23:26:31 +0100 (CET)
Date: Fri, 6 Nov 2020 23:26:30 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/19] [Set 2] Rid W=1 warnings from GPU
Message-ID: <20201106222630.GD826715@ravnborg.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=jxsCkVyRRZrjTV7aRhQA:9 a=CjuIK1q_8ugA:10
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
Cc: Faith <faith@valinux.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andy Gross <andy.gross@ti.com>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Rob Clark <rob.clark@linaro.org>,
 linaro-mm-sig@lists.linaro.org, Leo Li <sunpeng.li@amd.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Keith Whitwell <keith@tungstengraphics.com>,
 Jeff Hartmann <jhartmann@valinux.com>, Rob Clark <rob@ti.com>,
 Gareth Hughes <gareth@valinux.com>,
 Christian Koenig <christian.koenig@amd.com>,
 by <jhartmann@precisioninsight.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lee and DRM folks.

On Fri, Nov 06, 2020 at 09:49:30PM +0000, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> There are 5000 warnings to work through.  It will take a couple more
> sets.  Although, ("drm/amd/display/dc/basics/fixpt31_32: Move
> variables to where they're used") does take care of 2000 of them!
> 
> Lee Jones (19):
>   drm/ttm/ttm_range_manager: Demote non-conformant kernel-doc header
>   drm/r128/ati_pcigart: Source file headers are not good candidates for
>     kernel-doc
Applied

>   drm/selftests/test-drm_dp_mst_helper: Move
>     'sideband_msg_req_encode_decode' onto the heap
>   drm/mga/mga_dma: Demote kernel-doc abusers to standard comment blocks
>   drm/mga/mga_state: Remove unused variable 'buf_priv'
Applied x2

>   drm/radeon/atom: Move prototype into shared location
>   drm/radeon/radeon_kms: Include header containing our own prototypes
>   drm/omapdrm/omap_gem: Fix misnamed and missing parameter descriptions
>   drm/omapdrm/omap_dmm_tiler: Demote abusive use of kernel-doc format
>   drm/radeon/radeon: Move prototype into shared header
>   drm/radeon/radeon_drv: Source file headers are not good candidates for
>     kernel-doc
>   drm/amd/display/dc/basics/fixpt31_32: Move variables to where they're
>     used
>   drm/radeon/radeon_drv: Move prototypes to a shared headerfile
>   drm/amd/amdgpu/amdgpu_device: Provide documentation for 'reg_addr'
>     params
>   drm/radeon: Move prototypes to shared header
>   drm/amd/amdgpu/amdgpu_kms: Remove 'struct drm_amdgpu_info_device
>     dev_info' from the stack
>   drm/radeon/radeon_kms: Fix misnaming of 'radeon_info_ioctl's dev param
>   drm/radeon/atombios_crtc: Remove description of non-existent function
>     param 'encoder'
>   drm/v3d/v3d_drv: Remove unused static variable 'v3d_v3d_pm_ops'

I have applied the three patches that has no obvious maintainer as indicated
above. I assume the respective maintaines to pick radeon, omapdrm, ttm,
amd, v3d and selftest patches.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
