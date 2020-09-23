Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A447275BDA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 17:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BD66E9D2;
	Wed, 23 Sep 2020 15:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909226E9D2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 15:30:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x14so443695wrl.12
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 08:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fDTYBIWjZ0V2GphdLaW/RIeXLFZkTjKm3H2Sds/uTSw=;
 b=ju3rw1CIY62Ut3tGAcmP89INckkwtwnqAEJvk2Y+WvItwS6QHIuZkcLdgOQlsmsx9I
 XtpyIPof5z9bR1vm1nIZdTwPsH7yp9U0ZVWfs78CQB9B18EROjkF1Txm9Ei0jhaE24ND
 TcxKFnHVdQCX13n44Z5o9ItFDBo1tYn9HmvyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fDTYBIWjZ0V2GphdLaW/RIeXLFZkTjKm3H2Sds/uTSw=;
 b=ZgYwyiTMtBnopuigOzS9bKFqc7tcYO0RAtJiZ5DPU48cIXh/WOwIIy3tPXMYNekU9w
 7DwRsi9HeVvH3Qsz+CZaf25PeZXR6TEYYiVrBz3hHiBmueS5CBEsOCXvV9fskA4CtwXG
 Sm1tBnJIuMR2+cxpYj+5zSM1aDrtcu5tl48bGdmmzCCRJeqtxidEEHxkz0TgtlDw7gCx
 nd5+qWMuI3Y8FyoLWZbVfox0PRqAmjB62FmUD3VMFwHxhOU8ujqTies+qx0z3m32wneB
 zuGRpR2Ti8qgmuQjeqtvRVh6lLCi9dTVApPXxYXG0xp7HiqoOcP6QsH60yY4HiAazu3a
 QIDQ==
X-Gm-Message-State: AOAM532b+p5z9l2iH6sTrlIg23C/JookK8gXnrPHeUAq3ciaXup4n/Np
 Ztkqmh79YpX02jo5ePnmWqrNKO7Fh/kVMcfw
X-Google-Smtp-Source: ABdhPJw7pqDY/Gefhz1g8rInBqgp1KVKBDjRleeHIYm7QwJebZpRItzQLPq940q2c0X31sHVkqRcGA==
X-Received: by 2002:a5d:4388:: with SMTP id i8mr162807wrq.365.1600875020337;
 Wed, 23 Sep 2020 08:30:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l10sm144657wru.59.2020.09.23.08.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 08:30:19 -0700 (PDT)
Date: Wed, 23 Sep 2020 17:30:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/ast: Reload gamma LUT after changing primary plane's
 color format
Message-ID: <20200923153017.GR438822@phenom.ffwll.local>
References: <20200922144655.23624-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922144655.23624-1-tzimmermann@suse.de>
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 04:46:55PM +0200, Thomas Zimmermann wrote:
> The gamma LUT has to be reloaded after changing the primary plane's
> color format. This used to be done implicitly by the CRTC atomic_enable()
> helper after updating the primary plane. With the recent reordering of
> the steps, the primary plane's setup was moved last and invalidated
> the gamma LUT. Fix this by setting the LUT from within atomic_flush().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 2f0ddd89fe32 ("drm/ast: Enable CRTC before planes")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org

Does what it says in the commit message, and makes sense.

Maybe add a comment to the load_lut function or where it's called stating
that this must be done after every plane color change, seems like an
important piece of information to carry around in the code itself and not
just in the commit message.

Either way: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/ast/ast_mode.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 834a156e3a75..ba3bf76e104d 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -742,7 +742,6 @@ static void ast_crtc_dpms(struct drm_crtc *crtc, int mode)
>  	case DRM_MODE_DPMS_SUSPEND:
>  		if (ast->tx_chip_type == AST_TX_DP501)
>  			ast_set_dp501_video_output(crtc->dev, 1);
> -		ast_crtc_load_lut(ast, crtc);
>  		break;
>  	case DRM_MODE_DPMS_OFF:
>  		if (ast->tx_chip_type == AST_TX_DP501)
> @@ -777,6 +776,17 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
>  	return 0;
>  }
>  
> +static void
> +ast_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_crtc_state *old_crtc_state)
> +{
> +	struct ast_private *ast = to_ast_private(crtc->dev);
> +	struct ast_crtc_state *ast_crtc_state = to_ast_crtc_state(crtc->state);
> +	struct ast_crtc_state *old_ast_crtc_state = to_ast_crtc_state(old_crtc_state);
> +
> +	if (old_ast_crtc_state->format != ast_crtc_state->format)
> +		ast_crtc_load_lut(ast, crtc);
> +}
> +
>  static void
>  ast_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>  			      struct drm_crtc_state *old_crtc_state)
> @@ -830,6 +840,7 @@ ast_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>  
>  static const struct drm_crtc_helper_funcs ast_crtc_helper_funcs = {
>  	.atomic_check = ast_crtc_helper_atomic_check,
> +	.atomic_flush = ast_crtc_helper_atomic_flush,
>  	.atomic_enable = ast_crtc_helper_atomic_enable,
>  	.atomic_disable = ast_crtc_helper_atomic_disable,
>  };
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
