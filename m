Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8658644980D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 16:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957BA6E30F;
	Mon,  8 Nov 2021 15:20:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593A96E30F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 15:19:59 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u18so27489784wrg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 07:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=GBDq0sQlKFrrSYxj5AVhyU7t/OG7fPr3ZqBHcxsyosI=;
 b=Q6psTiLH794DsfuP91SljLhNGPIhXFPgSalvlmYpbMuSNYV0HFmbYR1qNHGL0l/jr9
 tyByf3SUvBm97dez78W1x+oSFCvIQk674FPaHvQh32lyo94wUYUttJvA0ie1rNfbw+41
 fhBx+bLyuR+vMjS2YSoXFxOMFXheEKiXTuU8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=GBDq0sQlKFrrSYxj5AVhyU7t/OG7fPr3ZqBHcxsyosI=;
 b=mqvfZIfxItgtLxUmnB2v9SbGn/IkksXV60OT2tbo20R2nJWHl14xo5nmn+xvjG/OeC
 p/yPV9elaiWhe6NZirUigpdKCYHOxN49xM6UMY+dmwm4Kz/9GekdbZP1iqYJco9W6zju
 rDkcYZJ1Ctq5cXJagrfsWYwoJijdY5z0Yaw0Pye8I8s/94o+d4l82hULwSAh9I1MyeOh
 4XV4aoUiBqoITkDVHCTQfSwUlET3ObOw3StNVwdfg+anxfuixlc1nfxO0hkdk9yQi1QA
 Ssyv2lVpD9hjrSiDo221FFs98Fj8Tg0WQ0va+HNx875V3hU/lBWdJxjiLVOxaYT2Zj2V
 tMMA==
X-Gm-Message-State: AOAM5337xNaW5ksyJO/gncx0DmvkFhzJkkBFd5Mv8Jz2M60LUdK4RQI2
 zw2+k0CTfcF9BkD+e9XgSBiEXg==
X-Google-Smtp-Source: ABdhPJzpLm4EBrqPSncrAFfGe2yoefmn5H8Jb7dnyaUbsc+/2KKD43RWp8oIUO2Lpm7Vsm4Co/zTUQ==
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr546392wrv.331.1636384797916; 
 Mon, 08 Nov 2021 07:19:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o4sm20359562wry.80.2021.11.08.07.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 07:19:57 -0800 (PST)
Date: Mon, 8 Nov 2021 16:19:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH] drm/drm_plane.h: fix a typo: not -> note
Message-ID: <YYlAGwVnVJewwKER@phenom.ffwll.local>
Mail-Followup-To: suijingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, 15330273260@189.cn,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211108051625.47207-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211108051625.47207-1-suijingfeng@loongson.cn>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, 15330273260@189.cn,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 08, 2021 at 01:16:25PM +0800, suijingfeng wrote:
> Signed-off-by: suijingfeng <suijingfeng@loongson.cn>

Merged into drm-misc-next-fixes for 5.16 merge window.
-Daniel

> ---
>  include/drm/drm_plane.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index fed97e35626f..0c1102dc4d88 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -43,7 +43,7 @@ enum drm_scaling_filter {
>  /**
>   * struct drm_plane_state - mutable plane state
>   *
> - * Please not that the destination coordinates @crtc_x, @crtc_y, @crtc_h and
> + * Please note that the destination coordinates @crtc_x, @crtc_y, @crtc_h and
>   * @crtc_w and the source coordinates @src_x, @src_y, @src_h and @src_w are the
>   * raw coordinates provided by userspace. Drivers should use
>   * drm_atomic_helper_check_plane_state() and only use the derived rectangles in
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
