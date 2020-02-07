Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDBC1558B3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 14:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFFB6FC94;
	Fri,  7 Feb 2020 13:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682F26EAC4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 13:44:15 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c9so2735153wrw.8
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 05:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=m9Hn1RaUXFooKHwmRZTfAKZ274VjztClE8pDRYYGw2c=;
 b=M0PjjdgYCPa6DgxGqO3xxPQ3OX262TSN0UqM6Kqiq8/lumJMhLG+2HPA3bnZvyhpwc
 CVSO/cXMEAMr+UUk3ef8vaeTxw3+qSrjyvfJWj/sLyvEzrHr1LqWAjHi8Ap3jRrWzagR
 fWYlOeYeXN31g0NzMnTA5QYYX6ZfrRyNtdkGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=m9Hn1RaUXFooKHwmRZTfAKZ274VjztClE8pDRYYGw2c=;
 b=L7MmozaNy9TIucGKvx/lm0mhB4hY18OZdmlmVJPylkKGpQMmblj26s6ZALIZHvhmVy
 DrlJIHQTA8CZ7Mf497VhVTiafWmqpTFaqtlvcEsDBUG1JD8aT87UzxzD7+8eIIVm0xMJ
 N1ANx2VRd+UQVTcWW+V7gNu8EJlAD9MRZuZaaxXAAcUksUbxtMmR6DYxKKCZmF+lICdc
 2tX6AQor7EVUuDWUftXQS9aKvq8O24H8uQwKglqFudUdMj4k2JGoMNPF0f24A/8b5bg2
 876fxqj3eHRGEnVR8W1YPLDVl4Yn6096U5IqW737MuWdDcpMQvJNOaVdto2FXI1g/w8m
 3jfw==
X-Gm-Message-State: APjAAAW4RdCtXWV0yeU0m7UHmAM7jiXCxzewowOiNbGidXjzCeL7aRZl
 RzhU2nLStyutQ764W0vWQNEAag==
X-Google-Smtp-Source: APXvYqwJ37XAlNKHJ3NdiUGsMdK5N0tuoJlJ5hgMTD925OdVra68xNS96qXdlwiN2Ssrdy6rDTdM8Q==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr5065348wrk.53.1581083054017; 
 Fri, 07 Feb 2020 05:44:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g25sm16762868wmh.3.2020.02.07.05.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 05:44:13 -0800 (PST)
Date: Fri, 7 Feb 2020 14:44:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/qxl: add drm_driver.release callback.
Message-ID: <20200207134411.GB43062@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200207121405.25895-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207121405.25895-1-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 01:14:05PM +0100, Gerd Hoffmann wrote:
> Move final cleanups to qxl_drm_release() callback.
> Add drm_atomic_helper_shutdown() call to qxl_pci_remove().
> 
> Reorder calls in qxl_device_fini().  Cleaning up gem & ttm
> might trigger qxl commands, so we should do that before
> releaseing command rings.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/qxl/qxl_drv.c | 21 ++++++++++++++-------
>  drivers/gpu/drm/qxl/qxl_kms.c |  8 ++++----
>  2 files changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> index 1d601f57a6ba..8044363ba0f2 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -34,6 +34,7 @@
>  #include <linux/pci.h>
>  
>  #include <drm/drm.h>
> +#include <drm/drm_atomic_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_modeset_helper.h>
> @@ -132,21 +133,25 @@ qxl_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	return ret;
>  }
>  
> +static void qxl_drm_release(struct drm_device *dev)
> +{
> +	struct qxl_device *qdev = dev->dev_private;
> +
> +	qxl_modeset_fini(qdev);
> +	qxl_device_fini(qdev);

Same here, there's a few iounmap and io_mapping_free which I think should
be in the pci_remove hook.
-Daniel

> +	dev->dev_private = NULL;
> +	kfree(qdev);
> +}
> +
>  static void
>  qxl_pci_remove(struct pci_dev *pdev)
>  {
>  	struct drm_device *dev = pci_get_drvdata(pdev);
> -	struct qxl_device *qdev = dev->dev_private;
>  
>  	drm_dev_unregister(dev);
> -
> -	qxl_modeset_fini(qdev);
> -	qxl_device_fini(qdev);
> +	drm_atomic_helper_shutdown(dev);
>  	if (is_vga(pdev))
>  		vga_put(pdev, VGA_RSRC_LEGACY_IO);
> -
> -	dev->dev_private = NULL;
> -	kfree(qdev);
>  	drm_dev_put(dev);
>  }
>  
> @@ -279,6 +284,8 @@ static struct drm_driver qxl_driver = {
>  	.major = 0,
>  	.minor = 1,
>  	.patchlevel = 0,
> +
> +	.release = qxl_drm_release,
>  };
>  
>  static int __init qxl_init(void)
> diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
> index bfc1631093e9..70b20ee4741a 100644
> --- a/drivers/gpu/drm/qxl/qxl_kms.c
> +++ b/drivers/gpu/drm/qxl/qxl_kms.c
> @@ -299,12 +299,12 @@ void qxl_device_fini(struct qxl_device *qdev)
>  {
>  	qxl_bo_unref(&qdev->current_release_bo[0]);
>  	qxl_bo_unref(&qdev->current_release_bo[1]);
> -	flush_work(&qdev->gc_work);
> -	qxl_ring_free(qdev->command_ring);
> -	qxl_ring_free(qdev->cursor_ring);
> -	qxl_ring_free(qdev->release_ring);
>  	qxl_gem_fini(qdev);
>  	qxl_bo_fini(qdev);
> +	flush_work(&qdev->gc_work);
> +	qxl_ring_free(qdev->command_ring);
> +	qxl_ring_free(qdev->cursor_ring);
> +	qxl_ring_free(qdev->release_ring);
>  	io_mapping_free(qdev->surface_mapping);
>  	io_mapping_free(qdev->vram_mapping);
>  	iounmap(qdev->ram_header);
> -- 
> 2.18.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
