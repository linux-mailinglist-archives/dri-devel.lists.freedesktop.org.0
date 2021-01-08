Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EC12EF41D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 15:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0309189954;
	Fri,  8 Jan 2021 14:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E28D89954
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 14:45:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r7so9245105wrc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 06:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2C22FkkrgcCB1vUIbIYeFBmBt8FDKHdUHKhqIYVsg4k=;
 b=SErFgkG5hE64HfFx1I8EiR/N6fLMRxlpahEm7nHFaOuwkPzcOVIF9LFZIQVv+xTG5j
 tIFt/TXRZLC0DBLRivkoOCvANDp6e1/qlP3vtfd0+R7NgtnTuZz/HJ0IeR+OleBF6lva
 FBOFJ2+dmBR0144s/bC3mLTkavTqlO4czpOWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2C22FkkrgcCB1vUIbIYeFBmBt8FDKHdUHKhqIYVsg4k=;
 b=ZaoSTKfJCGvuY9cScp+/jHB7rNRR0TKPSsSCT+g4Ts2Qk0ZqzM/q9TJpvNvInwxPfR
 iXaV8r0ea9u/Dd6CBhIwU6OYvB+PasJiVGl/9NZwdxkqXaRySvpVHbyhMa0u9O8LgtoU
 72FuaHpeyzk/bMedAuLgMdzDFXE+9qPqxVYar5IFooeBYlyQOE78Uc9ScuAb+HmNrIdc
 w3ih0hSUSAstamtb/4Cg1Vy9GURqIXhrrBLoqx912taPk330Mc5xAUoO2ATr7eX6C2Zr
 5WwWtMjggnLFBEu22C+/e225BpfuqHvXQ0s1Cu3QKVsGahaGgX0qwkYH+TNdDWAs0hey
 pEWQ==
X-Gm-Message-State: AOAM531GjtlZgz+GERErwtjr0djRyZwlzJ9Enfc5uCUSM5PZzjMMyzG+
 z4VbA/QZTTUgQm7tnZmT634suA==
X-Google-Smtp-Source: ABdhPJyBPpRQrFq88T+CY/8eYAnTWP2+28ySsobkoqx/RafneIVUuqiAROMSxfk4jRxkzw9L1kDLqw==
X-Received: by 2002:a5d:4243:: with SMTP id s3mr3961744wrr.31.1610117108140;
 Fri, 08 Jan 2021 06:45:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q15sm13047856wrw.75.2021.01.08.06.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 06:45:07 -0800 (PST)
Date: Fri, 8 Jan 2021 15:45:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm/modes: add non-OF stub for of_get_drm_display_mode
Message-ID: <X/hv8YTrUCs2ePwO@phenom.ffwll.local>
References: <20210108101343.23695-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108101343.23695-1-p.zabel@pengutronix.de>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 08, 2021 at 11:13:43AM +0100, Philipp Zabel wrote:
> If CONFIG_OF is disabled, of_get_drm_display_mode is not compiled in,
> and drivers using it fail to build:
> 
>   ld: drivers/gpu/drm/imx/parallel-display.o: in function `imx_pd_connector_get_modes':
>   parallel-display.c:(.text+0x8d): undefined reference to `of_get_drm_display_mode'
> 
> Add an inline stub so they can be build-tested with non-OF
> configurations.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Makes sense, we have dummy functions for !CONFIG_OF for all the others
already.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel

> ---
>  include/drm/drm_modes.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index a0d79d1c51e2..29ba4adf0c53 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -461,9 +461,19 @@ void drm_display_mode_from_videomode(const struct videomode *vm,
>  void drm_display_mode_to_videomode(const struct drm_display_mode *dmode,
>  				   struct videomode *vm);
>  void drm_bus_flags_from_videomode(const struct videomode *vm, u32 *bus_flags);
> +
> +#if defined(CONFIG_OF)
>  int of_get_drm_display_mode(struct device_node *np,
>  			    struct drm_display_mode *dmode, u32 *bus_flags,
>  			    int index);
> +#else
> +static inline int of_get_drm_display_mode(struct device_node *np,
> +					  struct drm_display_mode *dmode,
> +					  u32 *bus_flags, int index)
> +{
> +	return -EINVAL;
> +}
> +#endif
>  
>  void drm_mode_set_name(struct drm_display_mode *mode);
>  int drm_mode_vrefresh(const struct drm_display_mode *mode);
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
