Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C30B367CD6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 10:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BD26EA41;
	Thu, 22 Apr 2021 08:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502316EA3D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 08:47:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id h4so34890197wrt.12
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 01:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=vhe86cA9Lih/Xt94SXw0z79g/E1uDPv2HAfY3KSx+U8=;
 b=QVQ0oK3P9q5+OKlOxd2cm20f+Pe+5e1RcMSaxC+9Gh0mXJKMsYMm7TE9eBkDByCvJk
 z0t0VbWjfYIHDAGtcSzpLvKSkPXl/BV6E9PlCvPXDiKVnASbaWpqxRa49TmfmEiHGPhO
 y0vxBUIf7EKTCWvPJvWApPxrMKOr8qz8XVCNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=vhe86cA9Lih/Xt94SXw0z79g/E1uDPv2HAfY3KSx+U8=;
 b=kk0QAEadPIJHrw6pGCUrPE9cHv+wzQPjdiWrXrdFDzT9r0wvn+nAWQtNAZQfWJ1IE2
 gVsGqb8juFyz773XqCSVKd9YABgEU3rpv4ZfIAgsPCV2Kncvls/sAAN8WG1J26TQGR/U
 ATuw8/1+ZE8XgJP3JOvVAO9ed0AO1Ar3Vvd70Fmg3MiFWw+K1vbhNNR8Irod48jgMPRO
 zDM8sqIGs45MaQrbnGjQewhMUKr8u5+Tn9A6hw0lX3ncKJq9fney7IWfEdGP4iOG9L63
 o/rXHGbNnF+v0t+CcL5xq+IoQxa6tZahSued/R8tQEKPZy+ZgPqCFO+lMKBc+a4TuYBZ
 edYQ==
X-Gm-Message-State: AOAM532K9j8PE9QeBGGdEgMRSThMGxETBqGRQN9MxOqNoOEThHKv526N
 N5qZrz/8hVV5VhokxVD9xCp0ng==
X-Google-Smtp-Source: ABdhPJzcm6kE7NQZCOW9L9xzUGFvRn8tmUaI48ZbsK+VB9ct0DWTuMUMU2ZRLQNrm2Aj2yX3VTR6QA==
X-Received: by 2002:adf:fb43:: with SMTP id c3mr2731711wrs.360.1619081272055; 
 Thu, 22 Apr 2021 01:47:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o62sm5253687wme.5.2021.04.22.01.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 01:47:51 -0700 (PDT)
Date: Thu, 22 Apr 2021 10:47:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Subject: Re: [PATCH 3/3] drm: drm_connector.c: Use tabs for code indents
Message-ID: <YIE4HTjVGbBPaRQG@phenom.ffwll.local>
Mail-Followup-To: Beatriz Martins de Carvalho
 <martinsdecarvalhobeatriz@gmail.com>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
References: <cover.1618828127.git.martinsdecarvalhobeatriz@gmail.com>
 <0200474fbdb1149856308bccb8e467415f0b3d99.1618828127.git.martinsdecarvalhobeatriz@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0200474fbdb1149856308bccb8e467415f0b3d99.1618828127.git.martinsdecarvalhobeatriz@gmail.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 melissa.srw@gmail.com, outreachy-kernel@googlegroups.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 08:42:49PM +0100, Beatriz Martins de Carvalho wrote:
> Remove space and use tabs for indent the code to follow the
> Linux kernel coding conventions.
> Problem found by checkpatch
> 
> Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>

Both of your patch sets applied to drm-misc-next for 5.14, thanks a lot.
-Daniel

> ---
>  drivers/gpu/drm/drm_connector.c | 38 ++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 7631f76e7f34..38600c3a6ab2 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1958,11 +1958,11 @@ int drm_connector_set_path_property(struct drm_connector *connector,
>  	int ret;
>  
>  	ret = drm_property_replace_global_blob(dev,
> -	                                       &connector->path_blob_ptr,
> -	                                       strlen(path) + 1,
> -	                                       path,
> -	                                       &connector->base,
> -	                                       dev->mode_config.path_property);
> +					       &connector->path_blob_ptr,
> +					       strlen(path) + 1,
> +					       path,
> +					       &connector->base,
> +					       dev->mode_config.path_property);
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_connector_set_path_property);
> @@ -1988,11 +1988,11 @@ int drm_connector_set_tile_property(struct drm_connector *connector)
>  
>  	if (!connector->has_tile) {
>  		ret  = drm_property_replace_global_blob(dev,
> -		                                        &connector->tile_blob_ptr,
> -		                                        0,
> -		                                        NULL,
> -		                                        &connector->base,
> -		                                        dev->mode_config.tile_property);
> +							&connector->tile_blob_ptr,
> +							0,
> +							NULL,
> +							&connector->base,
> +							dev->mode_config.tile_property);
>  		return ret;
>  	}
>  
> @@ -2003,11 +2003,11 @@ int drm_connector_set_tile_property(struct drm_connector *connector)
>  		 connector->tile_h_size, connector->tile_v_size);
>  
>  	ret = drm_property_replace_global_blob(dev,
> -	                                       &connector->tile_blob_ptr,
> -	                                       strlen(tile) + 1,
> -	                                       tile,
> -	                                       &connector->base,
> -	                                       dev->mode_config.tile_property);
> +					       &connector->tile_blob_ptr,
> +					       strlen(tile) + 1,
> +					       tile,
> +					       &connector->base,
> +					       dev->mode_config.tile_property);
>  	return ret;
>  }
>  EXPORT_SYMBOL(drm_connector_set_tile_property);
> @@ -2076,10 +2076,10 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
>  
>  	ret = drm_property_replace_global_blob(dev,
>  					       &connector->edid_blob_ptr,
> -	                                       size,
> -	                                       edid,
> -	                                       &connector->base,
> -	                                       dev->mode_config.edid_property);
> +					       size,
> +					       edid,
> +					       &connector->base,
> +					       dev->mode_config.edid_property);
>  	if (ret)
>  		return ret;
>  	return drm_connector_set_tile_property(connector);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
