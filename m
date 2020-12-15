Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82152DAC80
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 13:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFFB89304;
	Tue, 15 Dec 2020 11:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4376889354
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 11:59:57 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e25so18238781wme.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 03:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=AHASKMgtyjqftLYSNx1zW4K9iETPXaBXN6ZbMW8229U=;
 b=aLQfH/fpUhKhWWdfgex0BhLZ92m6v/1VZkPA+iR53DqtVk6lLrDiKqrV1/+zEatt5B
 RIWmIPRs+1FHuGPdQGJm7cAWQ77+H40pjdm6y0YP57ZzrQkpQ3obtwLo5RLhiDr4Boxe
 2WAooMb8eguO0owJ/GBO8t0J08GGLMZkYfvkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=AHASKMgtyjqftLYSNx1zW4K9iETPXaBXN6ZbMW8229U=;
 b=YA3ikIHlcenTRUKNAZ5sk869GRWgAbJ+6sBp1UIJJcPIqepr4ylCMrhHXsJE1fSNFM
 gyMidMpjiZJyxVF8HTVhRRP07J25kVB2ViEPk829z7ijkIIMZCnZudFqpph/vgNYmoMC
 IY0ZoZoO/HAJvug93dcKb07eyNXaws6F2Z+uUv1stPQqHG5vPIuLx8BuCfbim/jcpqix
 halgfP6gGktqa1sqq2wvwETtKxvw6WkoqQXKCYYCkmlcBSWYBoW0bummOG7Tn9Rkbjnr
 OSgN6cZ7XKy/0ey3EC465RPMJszJiAW0uZ9o5p488AnVNUjDkXaa3PjLcT2Cei6g1wpN
 gkWw==
X-Gm-Message-State: AOAM533NTpua6Po1KpEvpZJif4jQ6c288FSeFfZ7jnVu2yIyxVuWuB8Q
 Yfb/hy/8Q5rpTvc+QlrtptRJ3Q==
X-Google-Smtp-Source: ABdhPJyfx3JxHYjSL/rge1M+TOoXfNMl/tHR/yeLsHvM0nVKvXQ0milbBLndBEi82RHGTVOB3y0HuQ==
X-Received: by 2002:a05:600c:410d:: with SMTP id
 j13mr32725060wmi.95.1608033595958; 
 Tue, 15 Dec 2020 03:59:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q143sm37528307wme.28.2020.12.15.03.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 03:59:55 -0800 (PST)
Date: Tue, 15 Dec 2020 12:59:53 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/hisilicon: Fix rmmod hibmc_drm failed
Message-ID: <X9ilOeTwn9V0Jpdp@phenom.ffwll.local>
Mail-Followup-To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie,
 tzimmermann@suse.de, kraxel@redhat.com, alexander.deucher@amd.com,
 tglx@linutronix.de, dri-devel@lists.freedesktop.org,
 xinliang.liu@linaro.org, linux-kernel@vger.kernel.org
References: <1608001299-7237-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608001299-7237-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org, kraxel@redhat.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 15, 2020 at 11:01:39AM +0800, Tian Tao wrote:
> drm_irq_uninstall should be called before pci_disable_msi, if use
> devm_drm_irq_install to register the interrupt, the system will
> call pci_disable_msi first and then call drm_irq_uninstall, which
>  will result in the following callstack.
> 
> kernel BUG at drivers/pci/msi.c:376!
> Internal error: Oops - BUG: 0 [#1] SMP
> CPU: 93 PID: 173814 Comm: rmmod Tainted:
> pstate: a0400009 (NzCv daif +PAN -UAO -TCO BTYPE=--)
> pc : free_msi_irqs+0x17c/0x1a0
> lr : free_msi_irqs+0x16c/0x1a0
> sp : ffff2028157f7bd0
> x29: ffff2028157f7bd0 x28: ffff202849edab00
> x27: 0000000000000000 x26: 0000000000000000
> x25: 0000000000000000 x24: 0000000000000000
> x23: ffff0020851da000 x22: ffff0020851da2d8
> x21: ffff0020cc829000 x20: 0000000000000000
> x19: ffff0020d6714800 x18: 0000000000000010
> x17: 0000000000000000 x16: 0000000000000000
> x15: ffffffffffffffff x14: ffff2028957f77df
> x13: ffff2028157f77ed x12: 0000000000000000
> x11: 0000000000000040 x10: ffff800011b2f8e0
> x9 : ffff800011b2f8d8 x8 : ffff2020203fc458
> x7 : 0000000000000000 x6 : 0000000000000000
> x5 : ffff2020203fc430 x4 : ffff2020203fc4a0
> x3 : 0000000000000000 x2 : 0000000000000000
> x1 : 00000000000002c9 x0 : ffff0020d6719500
> Call trace:
>  free_msi_irqs+0x17c/0x1a0
>  pci_disable_msi+0xe4/0x118
>  hibmc_unload+0x44/0x80 [hibmc_drm]
>  hibmc_pci_remove+0x2c/0x38 [hibmc_drm]
>  pci_device_remove+0x48/0x108
>  device_release_driver_internal+0x118/0x1f0
>  driver_detach+0x6c/0xe0
>  bus_remove_driver+0x74/0x100
>  driver_unregister+0x34/0x60
>  pci_unregister_driver+0x24/0xd8
>  hibmc_pci_driver_exit+0x14/0xe768 [hibmc_drm]
>  __arm64_sys_delete_module+0x1fc/0x2d0
>  el0_svc_common.constprop.3+0xa8/0x188
>  do_el0_svc+0x80/0xa0
>  el0_sync_handler+0x8c/0xb0
>  el0_sync+0x15c/0x180
> Code: f940b400 b4ffff00 a903e7b8 f90013b5 (d4210000)
> ---[ end trace 310d94ee8abef44f ]---
> Kernel panic - not syncing: Oops - BUG: Fatal exception
> 

You should mention here which patch you're reverting. With that:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Since the proper fix will probably take a while longer. Also why was this
not noticed when merging the original patch? hisilicon is the only user of
devm_drm_irq_install we have in-tree right now.
-Daniel

> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> index e3ab765b..02f3bd1 100644
> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> @@ -251,6 +251,10 @@ static int hibmc_hw_init(struct hibmc_drm_private *priv)
>  static int hibmc_unload(struct drm_device *dev)
>  {
>  	drm_atomic_helper_shutdown(dev);
> +
> +	if (dev->irq_enabled)
> +		drm_irq_uninstall(dev);
> +
>  	pci_disable_msi(dev->pdev);
>  
>  	return 0;
> @@ -286,7 +290,7 @@ static int hibmc_load(struct drm_device *dev)
>  	if (ret) {
>  		drm_warn(dev, "enabling MSI failed: %d\n", ret);
>  	} else {
> -		ret = devm_drm_irq_install(dev, dev->pdev->irq);
> +		ret = drm_irq_install(dev, dev->pdev->irq);
>  		if (ret)
>  			drm_warn(dev, "install irq failed: %d\n", ret);
>  	}
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
