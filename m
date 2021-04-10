Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1D335AD20
	for <lists+dri-devel@lfdr.de>; Sat, 10 Apr 2021 13:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB44F6E4FF;
	Sat, 10 Apr 2021 11:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929226E4FF
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 11:59:33 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id y204so2816997wmg.2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Apr 2021 04:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oIg1PZztVGwUrvL59kCF7lno2imG3ao8dwwj173iJJg=;
 b=hCVrunnfC4XSpSuHvr+t8Ad3yv+jvcqtRdn1MVwjo9qafi1ey02UCnbky88iapyEGK
 b7ai06ECDwXssJUmRj5TGGYooLCZdJ7bnXJrAii5ryXrbDbHoKTAsdcycIJFM0QlfXYe
 I7h6vjWnbhBWLLKYP9fDW2z+w2ceL9MOCyFveuBO1OB+QWRi7BzEGknXqwbsL1N8aC+Q
 0sGkdi8czUKoPtRxEz0A6rdr1joASL42R0jNifAqe8qmh2OCskE5+qqS5oI19cBu8biL
 nxeyrNWUmUbDPv0DtWmoQMSK5utITs9Bk5hZ2mHHt6sib2AsV+Gm1ZRJuK2vWZgXexrb
 eY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oIg1PZztVGwUrvL59kCF7lno2imG3ao8dwwj173iJJg=;
 b=tZvmbPiJb02hl1ejUzuUXn9xjYmZUFF678NmD8zsG42lqfzg6bZZ+xCZ8A6tgJVJeq
 uAQT7MfSCN6u/35Z3ndvWm3vc+xFV/KZGmiFP6TisheLkFpZYBT+jSRQbEYbUYjNB1m5
 dDYB3z/BXVmhzaGY12hHTDjjzH85EJFJPWT8oXL6Md4EasU3er9g3mWhsFYFwpNGqbhr
 TM5Osm0nnxjg10b2xYVwuM+rmIZEQtGZ9f0LvQWl9s10WJKimiBX9anphogrfdSZ/IYO
 a4dAMSD//T8IcYcubbU4S1IIVApomTqUYafOdD+yziYJzmsmDB9FnAzlvUnm0ufNYTty
 7rEw==
X-Gm-Message-State: AOAM530TO5SyVR6NfB8re6wJArBya92wDCgc1lm5fH1kofbzQwq+SjVB
 osZFRssUQjfVrKARoacP/aY=
X-Google-Smtp-Source: ABdhPJy3X61dLqFaMBeR93ExaY9VTnr7V8Z+SGqmDwST+6mfeEYLiFJagFkgtBqx3wo5TDGfooBiOg==
X-Received: by 2002:a7b:ce8f:: with SMTP id q15mr17760290wmj.37.1618055972174; 
 Sat, 10 Apr 2021 04:59:32 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id o7sm8832627wrs.16.2021.04.10.04.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Apr 2021 04:59:31 -0700 (PDT)
Date: Sat, 10 Apr 2021 08:59:24 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [PATCH V4 2/2] drm/vkms: Add support for virtual hardware mode
Message-ID: <20210410115924.g3e45tdkbmscwncu@smtp.gmail.com>
References: <cover.1617602076.git.sylphrenadin@gmail.com>
 <062516fb20fdd8408f10b657cb280d89d59bbc34.1617602076.git.sylphrenadin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <062516fb20fdd8408f10b657cb280d89d59bbc34.1617602076.git.sylphrenadin@gmail.com>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/05, Sumera Priyadarsini wrote:
> Add a virtual hardware or vblank-less mode as a module to
> enable VKMS to emulate virtual graphic drivers.
> 
> Add a new drm_crtc_helper_funcs struct,
> vkms_virtual_crtc_helper_funcs() which holds the atomic helpers
> for virtual hardware mode. Change the existing
> vkms_crtc_helper_funcs struct to vkms_vblank_crtc_helper_funcs
> which holds atomic helpers for the vblank mode.

I would say `rename' not `change'

> This makes the code flow clearer and easier to test
> virtual hardware mode.
> 
> The first patch of this patchset added the function vkms_crtc_composer()
> for plane composition which is used in case of vblank-less mode and
> is directly called in the atomic hook in vkms_crtc_atomic_begin().

Probably this statement will change when you move the vkms_crtc_composer
to here.

> However, some crc captures still use vblanks which causes the crc-based
> igt tests to crash. Currently, I am unsure about how to approach the
> one-shot implementation of crc reads so I am still working on that.
> 
> This patchset has been tested with the igt tests- kms_writeback, kms_atomic,
> kms_lease, kms_flip, kms_pipe_get_crc and preserves results except for

Although the test results remain the same, you should also check the
log. In kms_flip, the substests flip-vs-panning-vs-hang and
flip-vs-panning-interruptible raised an error:
[drm:vkms_composer_common [vkms]] *ERROR* Cannot allocate memory for output frame.
Please, also check for leak.

> subtests related to crc reads and skips tests that rely on vertical
> blanking. This patchset must be tested after incorporating the
> igt-tests patch:
> https://lists.freedesktop.org/archives/igt-dev/2021-February/029355.html .

prefer to use the patckwork link

> 
> The patch is based on Rodrigo Siqueira's
> patch(https://patchwork.freedesktop.org/patch/316851/?series=48469&rev=3)
> and the ensuing review.
> 
> Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
> ---
> Changes in V3:
> - Refactor patchset(Melissa)
> Changes in V2:
> - Add atomic helper functions in a separate struct for virtual hardware
> mode (Daniel)
> - Remove spinlock across 'vkms_output->lock' in vkms_crtc.c(Daniel)
> - Add vkms_composer_common() (Daniel)
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 51 +++++++++++++++++++++++---------
>  drivers/gpu/drm/vkms/vkms_drv.c  | 18 +++++++----
>  drivers/gpu/drm/vkms/vkms_drv.h  |  1 +
>  3 files changed, 51 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 57bbd32e9beb..e6286f98d5b6 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -222,20 +222,20 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
>  	return 0;
>  }
>  
> -static void vkms_crtc_atomic_enable(struct drm_crtc *crtc,
> -				    struct drm_atomic_state *state)
> +static void vkms_vblank_crtc_atomic_enable(struct drm_crtc *crtc,
> +					   struct drm_atomic_state *state)
>  {
>  	drm_crtc_vblank_on(crtc);
>  }
>  
> -static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
> -				     struct drm_atomic_state *state)
> +static void vkms_vblank_crtc_atomic_disable(struct drm_crtc *crtc,
> +		struct drm_atomic_state *state)
>  {
>  	drm_crtc_vblank_off(crtc);
>  }
>  
> -static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
> -				   struct drm_atomic_state *state)
> +static void vkms_vblank_crtc_atomic_begin(struct drm_crtc *crtc,
> +		struct drm_atomic_state *state)
>  {
>  	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
>  
> @@ -245,8 +245,8 @@ static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
>  	spin_lock_irq(&vkms_output->lock);
>  }
>  
> -static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
> -				   struct drm_atomic_state *state)
> +static void vkms_vblank_crtc_atomic_flush(struct drm_crtc *crtc,
> +		struct drm_atomic_state *state)
>  {
>  	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
>  
> @@ -268,18 +268,38 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>  	spin_unlock_irq(&vkms_output->lock);
>  }
>  
> -static const struct drm_crtc_helper_funcs vkms_crtc_helper_funcs = {
> +/*
> + * Crtc functions for virtual hardware/vblankless mode
> + */
> +static void vkms_virtual_crtc_atomic_flush(struct drm_crtc *crtc,
> +		struct drm_atomic_state *state)
> +{
> +	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_crtc_state *vkms_state = to_vkms_crtc_state(crtc->state);
> +
> +	vkms_crtc_composer(vkms_state);
> +
> +	vkms_output->composer_state = to_vkms_crtc_state(crtc->state);
> +}
> +
> +static const struct drm_crtc_helper_funcs vkms_vblank_crtc_helper_funcs = {
>  	.atomic_check	= vkms_crtc_atomic_check,
> -	.atomic_begin	= vkms_crtc_atomic_begin,
> -	.atomic_flush	= vkms_crtc_atomic_flush,
> -	.atomic_enable	= vkms_crtc_atomic_enable,
> -	.atomic_disable	= vkms_crtc_atomic_disable,
> +	.atomic_begin	= vkms_vblank_crtc_atomic_begin,
> +	.atomic_flush	= vkms_vblank_crtc_atomic_flush,
> +	.atomic_enable	= vkms_vblank_crtc_atomic_enable,
> +	.atomic_disable	= vkms_vblank_crtc_atomic_disable,
> +};
> +
> +static const struct drm_crtc_helper_funcs vkms_virtual_crtc_helper_funcs = {
> +	.atomic_check	= vkms_crtc_atomic_check,
> +	.atomic_flush	= vkms_virtual_crtc_atomic_flush,
>  };
>  
>  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  		   struct drm_plane *primary, struct drm_plane *cursor)
>  {
>  	struct vkms_output *vkms_out = drm_crtc_to_vkms_output(crtc);
> +	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
>  	int ret;
>  
>  	ret = drm_crtc_init_with_planes(dev, crtc, primary, cursor,
> @@ -289,7 +309,10 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  		return ret;
>  	}
>  
> -	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
> +	if (vkmsdev->config->virtual_hw)
> +		drm_crtc_helper_add(crtc, &vkms_virtual_crtc_helper_funcs);
> +	else
> +		drm_crtc_helper_add(crtc, &vkms_vblank_crtc_helper_funcs);
>  
>  	spin_lock_init(&vkms_out->lock);
>  	spin_lock_init(&vkms_out->composer_lock);
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 2173b82606f6..945c4495d62a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -44,6 +44,11 @@ static bool enable_writeback = true;
>  module_param_named(enable_writeback, enable_writeback, bool, 0444);
>  MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector support");
>  
> +static bool enable_virtual_hw = false;
> +module_param_named(enable_virtual_hw, enable_virtual_hw, bool, 0444);
> +MODULE_PARM_DESC(enable_virtual_hw, "Enable/Disable virtual hardware mode(virtual \
> +hardware mode disables vblank interrupts)");
> +
>  DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>  
>  static void vkms_release(struct drm_device *dev)
> @@ -159,12 +164,14 @@ static int vkms_create(struct vkms_config *config)
>  		goto out_devres;
>  	}
>  
> -	vkms_device->drm.irq_enabled = true;
> +	vkms_device->drm.irq_enabled = !vkms_device->config->virtual_hw;
>  
> -	ret = drm_vblank_init(&vkms_device->drm, 1);
> -	if (ret) {
> -		DRM_ERROR("Failed to vblank\n");
> -		goto out_devres;
> +	if (!vkms_device->config->virtual_hw) {
> +		ret = drm_vblank_init(&vkms_device->drm, 1);
> +		if (ret) {
> +			DRM_ERROR("Failed to vblank\n");
> +			goto out_devres;
> +		}
>  	}
>  
>  	ret = vkms_modeset_init(vkms_device);
> @@ -198,6 +205,7 @@ static int __init vkms_init(void)
>  
>  	config->cursor = enable_cursor;
>  	config->writeback = enable_writeback;
> +	config->virtual_hw = enable_virtual_hw;
>  
>  	return vkms_create(config);
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 538315140585..a44f530ffaf0 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -85,6 +85,7 @@ struct vkms_device;
>  struct vkms_config {
>  	bool writeback;
>  	bool cursor;
> +	bool virtual_hw;
>  	/* only set when instantiated */
>  	struct vkms_device *dev;

Checkpatch complained of several lines. Please, take a look at this too.

Thanks,

Melissa

>  };
> -- 
> 2.25.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
