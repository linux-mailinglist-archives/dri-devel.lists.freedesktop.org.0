Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48934968500
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 12:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FD410E172;
	Mon,  2 Sep 2024 10:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="JXPp/BCb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE36A10E172
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 10:40:52 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-53345dcd377so5558217e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 03:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725273650; x=1725878450; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Mbxw34xwUX52mXovX3ZblPNMfn5aLkibCfgqi3D33Gg=;
 b=JXPp/BCbO4NQA9rC/cTV03mbX/tJnm3MpCUVB8ggAAryw7BQWJsrlN3musNNaskw03
 jkbTERROz9eP+kuqucRAh/ezcAaqeZmfCEqdgULH1Kt9ARdJDkaiJ7WA4r3bfmniT2wT
 vSe5hjO2aTllgvJ7jkiMuJoqrPXrlc+JcNZAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725273650; x=1725878450;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mbxw34xwUX52mXovX3ZblPNMfn5aLkibCfgqi3D33Gg=;
 b=jAnRFBDgxbUOeg9uIux4APuz9o/vc+i+BjvhY1/0Opxa4S8ro3n75K0fH4cpyoj9aH
 rYxBXrQVXwcmVXLvSZQtB1YEpp+sTsvjiAnxaZIh0NcCQZDSjIBZ+Nz0qIfNFJ1Lawqe
 GtwaJzOoqrQ2qy/sRfwSv/IHwFuHNdioC0ff1QHTb1rZGLGN5AIdEViwspAnDZ1LpsVG
 fOshopU0Ttkwu6mtJcMmnp0RKLjlCCsLDJCg8gMVJRfPKHhK7IVpAQf59oelNwZxWMwS
 G++jbRJqrQy/PqjxnW2kUjK1m3SgyPnjMjFbDRdnN5yjubjmfegFVg+TGNRk9SQlFrdD
 oSBQ==
X-Gm-Message-State: AOJu0Yy2VEPz1JvxT8hPqNsxo4EDxE0RDdAwUuV4NfP5wUR94C97vMYf
 UOT8sGaEIY+TbQjTkhTuc+bZyzdvj1O9xfmDxJHHYsJ3w33qZiGIzwkCloqCFMg=
X-Google-Smtp-Source: AGHT+IEDzwaxO0gZvWDUgYeTgBA0weg7ruo/M323yNa50izv+9ofKTkVkdxJyCdW1Mv8/1UIil7ujw==
X-Received: by 2002:a05:6512:33d2:b0:52e:e3c3:643f with SMTP id
 2adb3069b0e04-53546af4288mr7129731e87.2.1725273650135; 
 Mon, 02 Sep 2024 03:40:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb27fsm132883235e9.10.2024.09.02.03.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 03:40:49 -0700 (PDT)
Date: Mon, 2 Sep 2024 12:40:47 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: James Zhu <James.Zhu@amd.com>
Cc: dri-devel@lists.freedesktop.org, Alexander.Deucher@amd.com,
 christian.koenig@amd.com, daniel.vetter@ffwll.ch,
 epilmore@gigaio.com, jamesz@amd.com
Subject: Re: [PATCH v2] drm: register more drm device nodes
Message-ID: <ZtWWL6q3hL3O2nl3@phenom.ffwll.local>
References: <20240530153439.4331-1-James.Zhu@amd.com>
 <20240829213730.308885-1-James.Zhu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829213730.308885-1-James.Zhu@amd.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 29, 2024 at 05:37:30PM -0400, James Zhu wrote:
> Since the default number 256 can't handle large modern systems
> with large numbers of GPUs, specify a more reasonable default.
> 
> -v2: update drm_core_exit to unregister more drm device nodes
> 
> Signed-off-by: James Zhu <James.Zhu@amd.com>

We've merged a more complete solution meanwhile, I think this should also
cover your case:

https://lore.kernel.org/dri-devel/b313a6f7-a857-4ec9-bc98-0480cd64bc20@amd.com/

Cheers, Sima

> ---
>  drivers/gpu/drm/drm_drv.c | 4 ++--
>  include/drm/drm_drv.h     | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 243cacb3575c..bfc6c18a7a92 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -1063,7 +1063,7 @@ static void drm_core_exit(void)
>  {
>  	drm_privacy_screen_lookup_exit();
>  	accel_core_exit();
> -	unregister_chrdev(DRM_MAJOR, "drm");
> +	__unregister_chrdev(DRM_MAJOR, 0, DRM_CHRDEV_MAX, "drm");
>  	debugfs_remove(drm_debugfs_root);
>  	drm_sysfs_destroy();
>  	idr_destroy(&drm_minors_idr);
> @@ -1086,7 +1086,7 @@ static int __init drm_core_init(void)
>  
>  	drm_debugfs_root = debugfs_create_dir("dri", NULL);
>  
> -	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
> +	ret = __register_chrdev(DRM_MAJOR, 0, DRM_CHRDEV_MAX, "drm", &drm_stub_fops);
>  	if (ret < 0)
>  		goto error;
>  
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 8878260d7529..8a2da92f02b7 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -45,6 +45,8 @@ struct drm_mode_create_dumb;
>  struct drm_printer;
>  struct sg_table;
>  
> +#define DRM_CHRDEV_MAX                1024
> +
>  /**
>   * enum drm_driver_feature - feature flags
>   *
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
