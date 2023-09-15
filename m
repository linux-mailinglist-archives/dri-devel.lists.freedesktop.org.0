Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E7D7A14D2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 06:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B84D10E05F;
	Fri, 15 Sep 2023 04:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E4810E05F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 04:37:32 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-26f38171174so1376559a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 21:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694752652; x=1695357452;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lud7J0kQvKKVpUJfUwiDxIroUbqIAEqeTTjdBEz5LAE=;
 b=hSN1sz16Yl+ICfmNN5f6wZsIRiNqUOurXcT+DX0IXa7FJAIIMkPvlEZF2oxUz8J7z0
 5x0AKUJuKyw9HUAuiXhz96VJvjcZh/Sv3USgS1YkEfCcXbapqREY2bEM5q8JVlC8Omzr
 j9eBAI5MBvA2EqNc+DNE3cIFYDUFZNbZIbFoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694752652; x=1695357452;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lud7J0kQvKKVpUJfUwiDxIroUbqIAEqeTTjdBEz5LAE=;
 b=E+mVTl4XuCNTOaKd2+avpZtzocclHvgpJT4+NUJp97WzSF+DuZoDx3lEFz8gq7V5Cx
 PFQlfEXuDiz1Ssy8oJzMspUfAKyAuutTRVlgFcWGjgi8Hy2uKDp66F23D5MyoDtsGXep
 8odiof5G2lhkuWIAqt/VvTZUSX0A61c8Hhm5QBs+M7B1qalYo3BVBntkc6zyal0ab41J
 oukmPpU7Ph1+Fgpdxi8YtzVe+w17ySeOK3oJCMOBlv1YgZpK1zX+WI3z1rBdQnhqe1lg
 SnPuVqYDSwAalcd41+yjX4bHosy7GENxGcC7SMPQ3WLI3SZTtVa/iqHsseY4sqhCpDEp
 Y4iA==
X-Gm-Message-State: AOJu0YwuH1tfT3Wfh+TQvFo/COC3wAIWzqfONCi9aCZ7mTANymNHxODs
 BoYjn+ALs63loX1P+/14Yz/Dmw==
X-Google-Smtp-Source: AGHT+IGIeRbvnxCp056eR7o04HYzcINgzzT4WzRCg/DYfYTFWSI7K7p21iVLjcZDM8PdtIN9vSXuEQ==
X-Received: by 2002:a17:90a:83:b0:274:a021:9383 with SMTP id
 a3-20020a17090a008300b00274a0219383mr227611pja.17.1694752652282; 
 Thu, 14 Sep 2023 21:37:32 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 gv4-20020a17090b11c400b00273f65fa424sm2107850pjb.8.2023.09.14.21.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 21:37:31 -0700 (PDT)
Date: Thu, 14 Sep 2023 21:37:31 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH] drm/gma500: refactor deprecated strncpy
Message-ID: <202309142135.16032DEA8@keescook>
References: <20230914-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-v1-1-0a53a076ce20@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-v1-1-0a53a076ce20@google.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 08:52:21PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> Since `chan->base.name` is expected to be NUL-terminated, a suitable
> replacement is `strscpy` [2] due to the fact that it guarantees
> NUL-termination on the destination buffer without also unnecessarily
> NUL-padding.

How did you decide about %NUL padding? (I see it is kzalloc'd, so it
doesn't matter.)

> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> 
> 
> drm/gma500: refactor deprecated strncpy
> ---
>  drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
> index 06b5b2d70d48..68458cbdd6d5 100644
> --- a/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
> +++ b/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
> @@ -141,7 +141,7 @@ struct gma_i2c_chan *oaktrail_lvds_i2c_init(struct drm_device *dev)
>  
>  	chan->drm_dev = dev;
>  	chan->reg = dev_priv->lpc_gpio_base;
> -	strncpy(chan->base.name, "gma500 LPC",  I2C_NAME_SIZE - 1);
> +	strscpy(chan->base.name, "gma500 LPC",  I2C_NAME_SIZE - 1);

What's going on here with the destination buffer size? chan->base.name
is 48 bytes. I2C_NAME_SIZE is 20.

Ultimately it doesn't matter since the source is a const char string,
but it's still weird. Therefore:

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

>  	chan->base.owner = THIS_MODULE;
>  	chan->base.algo_data = &chan->algo;
>  	chan->base.dev.parent = dev->dev;
> 
> ---
> base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
> change-id: 20230914-drivers-gpu-drm-gma500-oaktrail_lvds_i2c-c-a53c6d8bd62f
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 

-- 
Kees Cook
