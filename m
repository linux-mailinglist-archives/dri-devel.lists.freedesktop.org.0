Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6606265E9F0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 12:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E666B10E6EC;
	Thu,  5 Jan 2023 11:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF2210E6EC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 11:33:28 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t15so26945756wro.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 03:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bmS4PAGHcVbGZlpkKy86Md90VMMV13dwm3OXcRRsgUM=;
 b=CHMVLVNjjjvnLzx8m5710t27TL0/V6f6c0eGy/sp48YPfI+6l7YXfXgbTJNMDbieoa
 76pQhFqmW6V5hQw++IL+fpkdVo398h6ZXSJPKdynoiUhUGQq0rdT4tgAm0cuvauLdWvL
 C2wBCufTvnCMblfNAAdC4jNnvxNQ5YYLiJ1/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bmS4PAGHcVbGZlpkKy86Md90VMMV13dwm3OXcRRsgUM=;
 b=TFGAu2eo0Hbem95yJkDcc4QFFayXK6z7XkBoUe4koJb/OLIhcEwxAliFUbfHjNlDYm
 +uWNjYoRy9EdrcO7pK/iiCsadjzkI1iiGlDeCpMnoNU3+E5vZqaxawCQKiv3aTXQYnvu
 bDkiStdbVZQx6xHVI00Y8p+nkQ1Q+J2xHBWKLF6K8YJ6ANXVo5q/VQZIdAQvpCvJUK6O
 MPQ3npB7nYLfTGr/eJ+X1qiwznRFgUN7nvZgkMGYWL0tDZIuoU1uu36MGxUWkwwU7hgT
 7GjmjN1sdME9UkN92kvy2VwLGXSnhNmT07/uOXvg73NXmLZJuvqAbzfprgxYfu9sf4wJ
 PD+g==
X-Gm-Message-State: AFqh2koJO/tmY8elOvSLgvcVz8UPsiI+xQpfA2y44ZIikxSB9h6lCRW9
 zin4hYeHUrsoV+ZmVkm2RCBRFQ==
X-Google-Smtp-Source: AMrXdXuVRuYY3YBW6EmjwRuOwr6fyV2psCV2g9MIXd0Lo7tdd6J2nfCKHwKAWUoY4YFL2qj9+3O7aw==
X-Received: by 2002:a5d:4e4a:0:b0:2a1:aa5f:8675 with SMTP id
 r10-20020a5d4e4a000000b002a1aa5f8675mr4901321wrt.31.1672918407211; 
 Thu, 05 Jan 2023 03:33:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 e16-20020adfdbd0000000b002362f6fcaf5sm36245365wrj.48.2023.01.05.03.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 03:33:26 -0800 (PST)
Date: Thu, 5 Jan 2023 12:33:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
Message-ID: <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104234036.636-1-quic_jesszhan@quicinc.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: sebastian.wick@redhat.com, ppaalanen@gmail.com,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com,
 dmitry.baryshkov@linaro.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 04, 2023 at 03:40:33PM -0800, Jessica Zhang wrote:
> Introduce and add support for a solid_fill property. When the solid_fill
> property is set, and the framebuffer is set to NULL, memory fetch will be
> disabled.
> 
> In addition, loosen the NULL FB checks within the atomic commit callstack
> to allow a NULL FB when the solid_fill property is set and add FB checks
> in methods where the FB was previously assumed to be non-NULL.
> 
> Finally, have the DPU driver use drm_plane_state.solid_fill and instead of
> dpu_plane_state.color_fill, and add extra checks in the DPU atomic commit
> callstack to account for a NULL FB in cases where solid_fill is set.
> 
> Some drivers support hardware that have optimizations for solid fill
> planes. This series aims to expose these capabilities to userspace as
> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> hardware composer HAL) that can be set by apps like the Android Gears
> app.
> 
> Userspace can set the solid_fill property to a blob containing the
> appropriate version number and solid fill color (in RGB323232 format) and
> setting the framebuffer to NULL.
> 
> Note: Currently, there's only one version of the solid_fill blob property.
> However if other drivers want to support a similar feature, but require
> more than just the solid fill color, they can extend this feature by
> creating additional versions of the drm_solid_fill struct.
> 
> Changes in V2:
> - Dropped SOLID_FILL_FORMAT property (Simon)
> - Switched to implementing solid_fill property as a blob (Simon, Dmitry)
> - Changed to checks for if solid_fill_blob is set (Dmitry)
> - Abstracted (plane_state && !solid_fill_blob) checks to helper method
>   (Dmitry)
> - Removed DPU_PLANE_COLOR_FILL_FLAG
> - Fixed whitespace and indentation issues (Dmitry)

Now that this is a blob, I do wonder again whether it's not cleaner to set
the blob as the FB pointer. Or create some kind other kind of special data
source objects (because solid fill is by far not the only such thing).

We'd still end up in special cases like when userspace that doesn't
understand solid fill tries to read out such a framebuffer, but these
cases already exist anyway for lack of priviledges.

So I still think that feels like the more consistent way to integrate this
feature. Which doesn't mean it has to happen like that, but the
patches/cover letter should at least explain why we don't do it like this.
-Daniel

> 
> Changes in V3:
> - Fixed some logic errors in atomic checks (Dmitry)
> - Introduced drm_plane_has_visible_data() and drm_atomic_check_fb() helper
>   methods (Dmitry)
> 
> Jessica Zhang (3):
>   drm: Introduce solid fill property for drm plane
>   drm: Adjust atomic checks for solid fill color
>   drm/msm/dpu: Use color_fill property for DPU planes
> 
>  drivers/gpu/drm/drm_atomic.c              | 136 +++++++++++++---------
>  drivers/gpu/drm/drm_atomic_helper.c       |  34 +++---
>  drivers/gpu/drm/drm_atomic_state_helper.c |   9 ++
>  drivers/gpu/drm/drm_atomic_uapi.c         |  59 ++++++++++
>  drivers/gpu/drm/drm_blend.c               |  17 +++
>  drivers/gpu/drm/drm_plane.c               |   8 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   9 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c |  65 +++++++----
>  include/drm/drm_atomic_helper.h           |   5 +-
>  include/drm/drm_blend.h                   |   1 +
>  include/drm/drm_plane.h                   |  62 ++++++++++
>  11 files changed, 302 insertions(+), 103 deletions(-)
> 
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
