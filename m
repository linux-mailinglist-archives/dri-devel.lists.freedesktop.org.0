Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92B117BB30
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 12:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63FA6ECD9;
	Fri,  6 Mar 2020 11:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54026ECD9
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 11:08:21 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g134so1918808wme.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 03:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=7sHD6CjQ22ZwQRigFX726J4p2bWMAR4ljphlUJcoYAY=;
 b=Po4eTrKTy/hIT89j6SjWAKG3l7sTUwlpHMXmqtkp7pbCRmWtb4lPeWcxoj801ag9Ep
 fHDomNyvJH3mgX40pqhUqCbNwxt0fsj8lTv085lm/A8Ex981ERxWeUd/rMFLwvPwgKQl
 FdFaU5tzI/bMdYNhm7EZq1JnhHpniL+pxbrXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=7sHD6CjQ22ZwQRigFX726J4p2bWMAR4ljphlUJcoYAY=;
 b=Fk8H/Bis6Mc/bm0SUJV0rBLNCqB+efoSHNzvDZHhPeXzAepzhsRu7ZAD2trudkKmBx
 E+mvKGxQDjmWE4heYlkvWKPUGqoUVdYUaDhv88R7klTJ/P8HaRuqJHsbWUOf8c3QSbAh
 SLQGKwc9ZmtpSTsuDtDIHGEU1/RfcyCnZLmDFdPFHeRPHU7e29QBD+P1vFSQ29wO80jD
 P4F2eR3rwXLUFx3qDuXO9QdwP2GWndMrwG3pZeZRvi8KGxd1MFNCJy2K/0JbK451jFSl
 2jmxwxQY9Li3OyN2Gpr8LEdRNHz3U1w5PE8akhNcaAVjpV5DGq3BtsOQ+bk7hoHlBvsm
 bx2Q==
X-Gm-Message-State: ANhLgQ01V3ZEQP75ZfdBZGj6oZLOBFAgIGtDbi5+eYgSu7T3vWixy98o
 frWxUz1IsymyBDC85WS0nd0YGQ==
X-Google-Smtp-Source: ADFU+vtrTfTU2MnfW7j+yGNHZz5hdcacHAa5j7Yz7XI/rd1ollajRTpBJ+5mTOX4x6dxHsunYT4lEw==
X-Received: by 2002:a1c:f214:: with SMTP id s20mr3328009wmc.57.1583492900393; 
 Fri, 06 Mar 2020 03:08:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j20sm13605554wmj.46.2020.03.06.03.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 03:08:19 -0800 (PST)
Date: Fri, 6 Mar 2020 12:08:17 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v2] drm: context: Clean up documentation
Message-ID: <20200306110817.GZ2363188@phenom.ffwll.local>
Mail-Followup-To: Benjamin Gaignard <benjamin.gaignard@st.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, emil.l.velikov@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200306102937.4932-1-benjamin.gaignard@st.com>
 <20200306102937.4932-4-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200306102937.4932-4-benjamin.gaignard@st.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 06, 2020 at 11:29:37AM +0100, Benjamin Gaignard wrote:
> Fix kernel doc comments to avoid warnings when compiling with W=1.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 2:
> - Since it is legacy interface do not fix the description but
>   replace /** by /* to remove kerneldoc validation warnings

On the entire series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
>  drivers/gpu/drm/drm_context.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_context.c b/drivers/gpu/drm/drm_context.c
> index 1f802d8e5681..c99be950bf17 100644
> --- a/drivers/gpu/drm/drm_context.c
> +++ b/drivers/gpu/drm/drm_context.c
> @@ -47,7 +47,7 @@ struct drm_ctx_list {
>  /** \name Context bitmap support */
>  /*@{*/
>  
> -/**
> +/*
>   * Free a handle from the context bitmap.
>   *
>   * \param dev DRM device.
> @@ -68,7 +68,7 @@ void drm_legacy_ctxbitmap_free(struct drm_device * dev, int ctx_handle)
>  	mutex_unlock(&dev->struct_mutex);
>  }
>  
> -/**
> +/*
>   * Context bitmap allocation.
>   *
>   * \param dev DRM device.
> @@ -88,7 +88,7 @@ static int drm_legacy_ctxbitmap_next(struct drm_device * dev)
>  	return ret;
>  }
>  
> -/**
> +/*
>   * Context bitmap initialization.
>   *
>   * \param dev DRM device.
> @@ -104,7 +104,7 @@ void drm_legacy_ctxbitmap_init(struct drm_device * dev)
>  	idr_init(&dev->ctx_idr);
>  }
>  
> -/**
> +/*
>   * Context bitmap cleanup.
>   *
>   * \param dev DRM device.
> @@ -163,7 +163,7 @@ void drm_legacy_ctxbitmap_flush(struct drm_device *dev, struct drm_file *file)
>  /** \name Per Context SAREA Support */
>  /*@{*/
>  
> -/**
> +/*
>   * Get per-context SAREA.
>   *
>   * \param inode device inode.
> @@ -211,7 +211,7 @@ int drm_legacy_getsareactx(struct drm_device *dev, void *data,
>  	return 0;
>  }
>  
> -/**
> +/*
>   * Set per-context SAREA.
>   *
>   * \param inode device inode.
> @@ -263,7 +263,7 @@ int drm_legacy_setsareactx(struct drm_device *dev, void *data,
>  /** \name The actual DRM context handling routines */
>  /*@{*/
>  
> -/**
> +/*
>   * Switch context.
>   *
>   * \param dev DRM device.
> @@ -290,7 +290,7 @@ static int drm_context_switch(struct drm_device * dev, int old, int new)
>  	return 0;
>  }
>  
> -/**
> +/*
>   * Complete context switch.
>   *
>   * \param dev DRM device.
> @@ -318,7 +318,7 @@ static int drm_context_switch_complete(struct drm_device *dev,
>  	return 0;
>  }
>  
> -/**
> +/*
>   * Reserve contexts.
>   *
>   * \param inode device inode.
> @@ -351,7 +351,7 @@ int drm_legacy_resctx(struct drm_device *dev, void *data,
>  	return 0;
>  }
>  
> -/**
> +/*
>   * Add context.
>   *
>   * \param inode device inode.
> @@ -404,7 +404,7 @@ int drm_legacy_addctx(struct drm_device *dev, void *data,
>  	return 0;
>  }
>  
> -/**
> +/*
>   * Get context.
>   *
>   * \param inode device inode.
> @@ -428,7 +428,7 @@ int drm_legacy_getctx(struct drm_device *dev, void *data,
>  	return 0;
>  }
>  
> -/**
> +/*
>   * Switch context.
>   *
>   * \param inode device inode.
> @@ -452,7 +452,7 @@ int drm_legacy_switchctx(struct drm_device *dev, void *data,
>  	return drm_context_switch(dev, dev->last_context, ctx->handle);
>  }
>  
> -/**
> +/*
>   * New context.
>   *
>   * \param inode device inode.
> @@ -478,7 +478,7 @@ int drm_legacy_newctx(struct drm_device *dev, void *data,
>  	return 0;
>  }
>  
> -/**
> +/*
>   * Remove context.
>   *
>   * \param inode device inode.
> -- 
> 2.15.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
