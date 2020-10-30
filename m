Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FF72A009D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 10:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4056ED13;
	Fri, 30 Oct 2020 09:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383AE6ED14
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 09:01:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g12so5545817wrp.10
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 02:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lS9cLVa7ki23Q9hV5df0gycL8TDk+suWHefN1yZAvQI=;
 b=bLdnNBx991+fEL6unEVZ8c1nk/xvgTVbXjcGKB4Q1eS8ZXJnv4P81WNLlCMOuLhg2k
 5tqLuwqfha9zMuCOR/TA3MM7zyxv6R0rOWeVT17ffLEMAtqLBJUOOacmfSchNaD+7hBx
 S867tbVvqUZFuoI/p3WrDfaDtGzjnmGbF0xsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lS9cLVa7ki23Q9hV5df0gycL8TDk+suWHefN1yZAvQI=;
 b=FSFLZn1QocFXS6JT9OunDcTVy9SGISH4pPxkznVX8FcQPVJ8bS+OTvlt0Pj39LIRWQ
 qiumiXv2pLmqzvvkPwWBwDm3BYgaMgHWvqvWZnp1yNay9uUSerKuiwjgrVBAzyGNWCNy
 3jaW8PERiWo2s5/AFo7Sfdn/NUrfn+5F3hkcq3pLerWObvPlqD4t48gngWHVnaUnMUkm
 l2R21Wx9HtBDuID6d2s2gpOODm2crtz3WX69bDYfLsd+evDKUev/yAIJyihH+DNVgQp+
 JB/9WWWx9lzXe7jhTrarfFV1nWU59q0x+raaiWeubnBdlsg6+YlXo1+BRrQKQla91VZD
 JDjA==
X-Gm-Message-State: AOAM532WDOuKr7uFECzN2Bzx3s8ProyUamPKFB2xqaaHyVM1+eHnME77
 1Mm+ySxVLFfOW+rj8VNhI9/orw==
X-Google-Smtp-Source: ABdhPJwQxYTb0APmo+jOySsAO8r2hc4ifYBDW46GYqt577jI7TaikEFfn1bTiE9MXKtJM6IQK25iZA==
X-Received: by 2002:adf:ab05:: with SMTP id q5mr1682043wrc.32.1604048458831;
 Fri, 30 Oct 2020 02:00:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f17sm3978456wmh.10.2020.10.30.02.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 02:00:58 -0700 (PDT)
Date: Fri, 30 Oct 2020 10:00:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Abhinav Kumar <abhinavk@codeaurora.org>
Subject: Re: [PATCH v2 1/4] drm: allow drm_atomic_print_state() to accept any
 drm_printer
Message-ID: <20201030090056.GG401619@phenom.ffwll.local>
References: <20201030010101.4345-1-abhinavk@codeaurora.org>
 <20201030010101.4345-2-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030010101.4345-2-abhinavk@codeaurora.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, khsieh@codeaurora.org,
 seanpaul@chromium.org, tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 06:00:58PM -0700, Abhinav Kumar wrote:
> Currently drm_atomic_print_state() internally allocates and uses a
> drm_info printer. Allow it to accept any drm_printer type so that
> the API can be leveraged even for taking drm snapshot.
> =

> Rename the drm_atomic_print_state() to drm_atomic_print_new_state()
> so that it reflects its functionality better.
> =

> changes in v2:
> - Rename the function drm_atomic_print_state to
>   drm_atomic_print_new_state and update the commit text
> - Fix kbot errors
> - Add kernel doc for the newly exported function
> =

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/drm_atomic.c                  | 29 +++++++++++++++----
>  drivers/gpu/drm/drm_atomic_uapi.c             |  4 ++-
>  drivers/gpu/drm/drm_crtc_internal.h           |  4 ++-
>  .../gpu/drm/selftests/test-drm_framebuffer.c  |  1 +
>  4 files changed, 31 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 58527f151984..5df7b67ced78 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1,6 +1,7 @@
>  /*
>   * Copyright (C) 2014 Red Hat
>   * Copyright (C) 2014 Intel Corp.
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining=
 a
>   * copy of this software and associated documentation files (the "Softwa=
re"),
> @@ -1543,9 +1544,21 @@ int __drm_atomic_helper_set_config(struct drm_mode=
_set *set,
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_set_config);
>  =

> -void drm_atomic_print_state(const struct drm_atomic_state *state)
> +/**
> + * drm_atomic_print_new_state - prints drm atomic state
> + * @state: atomic configuration to check
> + * @p: drm printer
> + *
> + * This functions prints the drm atomic state snapshot using the drm pri=
nter
> + * which is passed to it. This snapshot can be used for debugging purpos=
es.
> + *
> + * Note that this function looks into the new state objects and hence it=
s not
> + * safe to be used after the call to drm_atomic_helper_commit_hw_done().
> + *

Empty line here in the docs. With that removed.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> + */
> +void drm_atomic_print_new_state(const struct drm_atomic_state *state,
> +		struct drm_printer *p)
>  {
> -	struct drm_printer p =3D drm_info_printer(state->dev->dev);
>  	struct drm_plane *plane;
>  	struct drm_plane_state *plane_state;
>  	struct drm_crtc *crtc;
> @@ -1554,17 +1567,23 @@ void drm_atomic_print_state(const struct drm_atom=
ic_state *state)
>  	struct drm_connector_state *connector_state;
>  	int i;
>  =

> +	if (!p) {
> +		DRM_ERROR("invalid drm printer\n");
> +		return;
> +	}
> +
>  	DRM_DEBUG_ATOMIC("checking %p\n", state);
>  =

>  	for_each_new_plane_in_state(state, plane, plane_state, i)
> -		drm_atomic_plane_print_state(&p, plane_state);
> +		drm_atomic_plane_print_state(p, plane_state);
>  =

>  	for_each_new_crtc_in_state(state, crtc, crtc_state, i)
> -		drm_atomic_crtc_print_state(&p, crtc_state);
> +		drm_atomic_crtc_print_state(p, crtc_state);
>  =

>  	for_each_new_connector_in_state(state, connector, connector_state, i)
> -		drm_atomic_connector_print_state(&p, connector_state);
> +		drm_atomic_connector_print_state(p, connector_state);
>  }
> +EXPORT_SYMBOL(drm_atomic_print_new_state);
>  =

>  static void __drm_state_dump(struct drm_device *dev, struct drm_printer =
*p,
>  			     bool take_locks)
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index 25c269bc4681..b4b3cb28a8ea 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -2,6 +2,7 @@
>   * Copyright (C) 2014 Red Hat
>   * Copyright (C) 2014 Intel Corp.
>   * Copyright (C) 2018 Intel Corp.
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining=
 a
>   * copy of this software and associated documentation files (the "Softwa=
re"),
> @@ -1294,6 +1295,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  	struct drm_out_fence_state *fence_state;
>  	int ret =3D 0;
>  	unsigned int i, j, num_fences;
> +	struct drm_printer p =3D drm_info_printer(dev->dev);
>  =

>  	/* disallow for drivers not supporting atomic: */
>  	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
> @@ -1413,7 +1415,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>  		ret =3D drm_atomic_nonblocking_commit(state);
>  	} else {
>  		if (drm_debug_enabled(DRM_UT_STATE))
> -			drm_atomic_print_state(state);
> +			drm_atomic_print_new_state(state, &p);
>  =

>  		ret =3D drm_atomic_commit(state);
>  	}
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_cr=
tc_internal.h
> index da96b2f64d7e..2bd56ec9fb0e 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -5,6 +5,7 @@
>   *   Jesse Barnes <jesse.barnes@intel.com>
>   * Copyright =A9 2014 Intel Corporation
>   *   Daniel Vetter <daniel.vetter@ffwll.ch>
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining=
 a
>   * copy of this software and associated documentation files (the "Softwa=
re"),
> @@ -233,7 +234,8 @@ int __drm_atomic_helper_disable_plane(struct drm_plan=
e *plane,
>  int __drm_atomic_helper_set_config(struct drm_mode_set *set,
>  				   struct drm_atomic_state *state);
>  =

> -void drm_atomic_print_state(const struct drm_atomic_state *state);
> +void drm_atomic_print_new_state(const struct drm_atomic_state *state,
> +		struct drm_printer *p);
>  =

>  /* drm_atomic_uapi.c */
>  int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
> diff --git a/drivers/gpu/drm/selftests/test-drm_framebuffer.c b/drivers/g=
pu/drm/selftests/test-drm_framebuffer.c
> index 2d29ea6f92e2..9296c68cbe71 100644
> --- a/drivers/gpu/drm/selftests/test-drm_framebuffer.c
> +++ b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_mode.h>
>  #include <drm/drm_fourcc.h>
> +#include <drm/drm_print.h>
>  =

>  #include "../drm_crtc_internal.h"
>  =

> -- =

> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
