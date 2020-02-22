Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C4116911D
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 18:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FAD6E970;
	Sat, 22 Feb 2020 17:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D516E970
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 17:59:49 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s10so5009837wmh.3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 09:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=l/hiq2wE3AFaF2ygI/KnMXlnSq+FuxYQMZMmaRfBwBo=;
 b=TXAaOBHGNwLPwxf9umORTGoD+wHuERkNpErrg7SVFJTfhSgErBc94aP7sryl8xg9lU
 J1UwkZ98CHwpiCvmND2nCY2rcTG+FvLLJci6WnyNViYM6Eyyt9wYF5O/arO9jyqnFfEw
 ZlSatOVnzhdWAWpWVS+QPdE5A7LyiUdPEkP/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l/hiq2wE3AFaF2ygI/KnMXlnSq+FuxYQMZMmaRfBwBo=;
 b=QVX8zITPA1fpM4y8+4/srfuywTBnF2ATVDYXYiFkdY9PCKf8wR2qAJfoykBBD6chwV
 0h+0VCmknRTqi/byRvXfmfo4uskR6tRcFwk6+QENEkt26BXxqoZKOIGBd67UVx3CsAoN
 ucPIOvMUFkY++BMoLyZBAKvoEhcy9OMgM4FehSIsX5TwP2d5I41DEATFU4g/8mjKWz+e
 U+Xq39/q7qvN1ue3EtN6u4/bbSqk1COkzpYPw0TgYIfRvH2JlIN7fK+e70Jn35HSW8r8
 59qX3FMQ2k4Ohk2+wuExGUkVqY3dXhYe1imZpm6HCuNbQI8H4pBcniktuUkTQ15vszUr
 K5FQ==
X-Gm-Message-State: APjAAAW9chpxvgrO86y5Lj8DBx1CVIZQIq+i4JRNz3s3U5vrUX135dHo
 rIHV4ffL0TRBCgSOYFXKrc2J7Q==
X-Google-Smtp-Source: APXvYqy2XKMUEp+M15s+7MthxSkjnMZAiczdBdaJIEM5WZxoMFQhW1mt/vhq55jzB//N5M+HMrNfnw==
X-Received: by 2002:a1c:8156:: with SMTP id c83mr11051840wmd.164.1582394388302; 
 Sat, 22 Feb 2020 09:59:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y17sm9315846wrs.82.2020.02.22.09.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2020 09:59:47 -0800 (PST)
Date: Sat, 22 Feb 2020 18:59:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH/RFC 3/3] drm: rcar_du: Constify drm_driver
Message-ID: <20200222175945.GL2363188@phenom.ffwll.local>
References: <20200222152430.2984-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200222152430.2984-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200222152430.2984-4-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 22, 2020 at 05:24:30PM +0200, Laurent Pinchart wrote:
> The drm_driver structure is never modified, make it const. The improves
> security by avoiding writable function pointers.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I wonder whether there's some magic somewhere we could do to enlist the
cocci army to create the constify patches for us ...


Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 654e2dd08146..039eee3ef661 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -474,7 +474,7 @@ MODULE_DEVICE_TABLE(of, rcar_du_of_table);
>  
>  DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
>  
> -static struct drm_driver rcar_du_driver = {
> +static const struct drm_driver rcar_du_driver = {
>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  	.gem_free_object_unlocked = drm_gem_cma_free_object,
>  	.gem_vm_ops		= &drm_gem_cma_vm_ops,
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
