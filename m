Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C78D12DC238
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 15:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD8FD6E1CF;
	Wed, 16 Dec 2020 14:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929826E1CF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 14:32:04 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w5so19646845wrm.11
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 06:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Cgl/b66vX7fNa7KCcyRm6d8RXUsqqwzAtkgEe9zu8Dw=;
 b=Rp1Tg7BSERNITZ0wEDidcRuzTkutf5nd/TorYngkddUdcjpm6XjDG4gO51CBBcmZbU
 DcysxdPDVDr6WFA1fueJZteIDc+jyukQwehHSAWkUMbn39Zh64lFOLRoodootEDQCoU5
 D8torYj8yD9ce2tzrjmQjAjFTdOWKItuuOmjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cgl/b66vX7fNa7KCcyRm6d8RXUsqqwzAtkgEe9zu8Dw=;
 b=hwnsumvfiHdVn9I6nAARjkEGvI/4X8mLv6+BKzEW6Cj9pEwFu/l7e73/nLVr91DcZi
 ILnfRU+AsYTmefUhwCp4sKeo2SK2S7IUvzvNahGzpIt21SG9NLS1CKHJ82AqXnqmb5VM
 o8KFbV7yXedMsTYSMzBOi9jybawgTw0euZuvIZbbHcfHYo6YJ4FTG0F7vaHXJv/cvR1f
 k+2zFpp8cfjy4Z+4erdon3BbwiMGZmkvXjMMFLFk0cjj0D6MIK/bI5snDKQanOyp6gx3
 kslpNvyxbaWaabdH7evpbAhgQTiIkmZvr0NOxbYsq3HgShYlcwCj0TWN1RC0bHjNd2qZ
 0XIQ==
X-Gm-Message-State: AOAM533ZIB/ma6W8lpVcINgH0xbLG5D6EeZFQrFnR7hrICyvu1UHp8O3
 bdFUj/Z0hhfqA8hzkT1ysFdw/Q==
X-Google-Smtp-Source: ABdhPJyf26AD/ZyGj3pRTjcGWLXA7jgXHQ3BsHURdAY1+JTAYJzgrDijfutk8JMGgThTfGvmzApT4Q==
X-Received: by 2002:a5d:4b4c:: with SMTP id w12mr38207986wrs.402.1608129123251; 
 Wed, 16 Dec 2020 06:32:03 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l20sm3814977wrh.82.2020.12.16.06.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 06:32:02 -0800 (PST)
Date: Wed, 16 Dec 2020 15:32:00 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 3/3] drm: Constify drm_driver in drivers that don't
 modify it
Message-ID: <X9oaYCLtjYgJuYz/@phenom.ffwll.local>
References: <20201215203126.10175-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201215203126.10175-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215203126.10175-4-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Edmund Dea <edmund.j.dea@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 15, 2020 at 10:31:26PM +0200, Laurent Pinchart wrote:
> A non-const structure containing function pointers is a possible attack
> vector. The drm_driver structure is already const in most drivers, but
> there are a few exceptions. Constify the structure in the drivers that
> don't need to modify at, as a low-hanging fruit. The rest of the drivers
> will need a more complex fix.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/arc/arcpgu_drv.c | 2 +-
>  drivers/gpu/drm/kmb/kmb_drv.c    | 2 +-
>  drivers/gpu/drm/tdfx/tdfx_drv.c  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
> index f164818ec477..077d006b1fbf 100644
> --- a/drivers/gpu/drm/arc/arcpgu_drv.c
> +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> @@ -145,7 +145,7 @@ static void arcpgu_debugfs_init(struct drm_minor *minor)
>  }
>  #endif
>  
> -static struct drm_driver arcpgu_drm_driver = {
> +static const struct drm_driver arcpgu_drm_driver = {
>  	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  	.name = "arcpgu",
>  	.desc = "ARC PGU Controller",
> diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
> index a31a840ce634..3c49668ec946 100644
> --- a/drivers/gpu/drm/kmb/kmb_drv.c
> +++ b/drivers/gpu/drm/kmb/kmb_drv.c
> @@ -400,7 +400,7 @@ static void kmb_irq_reset(struct drm_device *drm)
>  
>  DEFINE_DRM_GEM_CMA_FOPS(fops);
>  
> -static struct drm_driver kmb_driver = {
> +static const struct drm_driver kmb_driver = {
>  	.driver_features = DRIVER_GEM |
>  	    DRIVER_MODESET | DRIVER_ATOMIC,
>  	.irq_handler = kmb_isr,
> diff --git a/drivers/gpu/drm/tdfx/tdfx_drv.c b/drivers/gpu/drm/tdfx/tdfx_drv.c
> index ab699bf0ac5c..58c185c299f4 100644
> --- a/drivers/gpu/drm/tdfx/tdfx_drv.c
> +++ b/drivers/gpu/drm/tdfx/tdfx_drv.c
> @@ -56,7 +56,7 @@ static const struct file_operations tdfx_driver_fops = {
>  	.llseek = noop_llseek,
>  };
>  
> -static struct drm_driver driver = {
> +static const struct drm_driver driver = {
>  	.driver_features = DRIVER_LEGACY,
>  	.fops = &tdfx_driver_fops,
>  	.name = DRIVER_NAME,
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
