Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCE517715C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190A96EA18;
	Tue,  3 Mar 2020 08:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D126EA18
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 08:37:18 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id m3so1906716wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 00:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0TlX8FUbaw+zrUpFbeCIGHckLJeoFy9Yo9Z1gbY5Se0=;
 b=I1YkJVXpydcaPL4426m5vl0LxoQ9jk5aGctvB28eqR+BmKyczWhOSBSqbiNK8Az00i
 wcUYYgLzr6tGkCQElLS041a2LwSRP3CtVo+sQsYG5goZdNw/N9b6nN30WuMO3h9Bx+3X
 CY07bwfS5dNo2Fl3HzXDWiE+kz1Gzy8NoHgvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0TlX8FUbaw+zrUpFbeCIGHckLJeoFy9Yo9Z1gbY5Se0=;
 b=Q5GPmP1Dz/PyoYmRrxUW8TYJsBnIJ+XyTwczz0jZokNhH/7OhMd/50isonfPvnCNPu
 PZlxzpavHIB5hrGa3NuVilgMTxm61FzDhmvxcb7gJYB8zw97AsjNX55dQ1WnPqEpnkc9
 ayh70T0M40nV5msSGp7QSjIvW8EpjAu4CwOHFm7RLqDKkBhfBQHmMR5DYduDpftXjmgO
 o0aCkRj/ARTosVwpuy0ZKsf2SDPIC+6LsAL0UdnxXybt2oQ4tFLLpeBDieb7e0xUR9TZ
 N7hUu3tQvhFqr8qNFizjm/gw+sY4TBBP7cTt8CPCBL65UqF/B1VqmR1+DCl+A0GIahbt
 KTNw==
X-Gm-Message-State: ANhLgQ1NfUWvewl+rcVx+BWvNCkielJF196vJ15CP4WbYVULgoPii8UR
 vBVm2xNjKQIhQQMFptWoZ1ipHBBx7Rs=
X-Google-Smtp-Source: ADFU+vvaB3XT25s4ZfBN0egikty/T/kd0MYdytig5bU6qWINynkssE/YRtLjTOaOMFFe+NmEIJsr+w==
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr3221182wmd.91.1583224636876; 
 Tue, 03 Mar 2020 00:37:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j205sm3003536wma.42.2020.03.03.00.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 00:37:15 -0800 (PST)
Date: Tue, 3 Mar 2020 09:37:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vblank: Fix documentation of VBLANK timestamp helper
Message-ID: <20200303083714.GO2363188@phenom.ffwll.local>
References: <20200303073135.10605-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303073135.10605-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 03, 2020 at 08:31:35AM +0100, Thomas Zimmermann wrote:
> Per-CRTC VBLANK information used to be addressed by device and pipe
> index. A call drm_crtc_vblank_helper_get_vblank_timestamp_internal()
> receives a pointer to the CRTC instead. Fix the documentation.
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Daniel Vetter <daniel@ffwll.ch>
> Fixes: f1e2b6371c12 ("drm: Add get_scanout_position() to struct drm_crtc_=
helper_funcs")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_vblank.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 47fc4339ec7f..da7b0b0c1090 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -592,8 +592,7 @@ EXPORT_SYMBOL(drm_calc_timestamping_constants);
>  /**
>   * drm_crtc_vblank_helper_get_vblank_timestamp_internal - precise vblank
>   *                                                        timestamp help=
er
> - * @dev: DRM device
> - * @pipe: index of CRTC whose vblank timestamp to retrieve
> + * @crtc: CRTC whose vblank timestamp to retrieve
>   * @max_error: Desired maximum allowable error in timestamps (nanosecs)
>   *             On return contains true maximum error of timestamp
>   * @vblank_time: Pointer to time which should receive the timestamp
> -- =

> 2.25.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
