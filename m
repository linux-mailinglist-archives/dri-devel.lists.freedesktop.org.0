Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44629ACFEFF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 11:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0044810E333;
	Fri,  6 Jun 2025 09:15:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WjrH7X6r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3D710E333
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 09:15:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E87F81FD31;
 Fri,  6 Jun 2025 09:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749201298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=qWW0a985Z35LZphmza6JcdJpxc4kHyGa4JehGQh2SEM=;
 b=WjrH7X6rxh0IHR0u0d1e5uVK1xAeV8Rsiis7243nGxc3/fdkLD6RhMebSrplwCo/wnAo/+
 wKYhXQRcoNykKew7c4K6+120la7xACSRzrWsrTqtg4yRlNfMvMOyprr53PIFYuQPkG6JOa
 7besYjGw/oM2ZyNut/wuC5NysswfYudg28mEzPU9vBQzFkoXaPhxtUQVr8OK69ZxEsM90/
 tMKS26PXEXENGp4Z8mQi6VaJr7YjA+cH1hcLYwTYMRF3DLZcSB+4jsJJicsAAyKMVALd+3
 RwrSKSNOGGaUZxYWiF60+9AcbaxcQDMKiB8mijJfmYm6wXtNnUpqpMTfD1femQ==
Message-ID: <137fa3b9-a771-4e9b-89d0-b6e560e0bd05@bootlin.com>
Date: Fri, 6 Jun 2025 11:14:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/vkms: Use vblank timer
To: Thomas Zimmermann <tzimmermann@suse.de>, mhklinux@outlook.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, drawat.floss@gmail.com, javierm@redhat.com,
 kraxel@redhat.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 fvogt@suse.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev
References: <20250605152637.98493-1-tzimmermann@suse.de>
 <20250605152637.98493-3-tzimmermann@suse.de>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250605152637.98493-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekieevtdefgedtkeehteehtddttdefhffhgeejleejjeeluddvhfdugedvkeehveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplgduledvrdduieekrdeiledrvdefudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehmhhhklhhinhhugiesohhuthhlohhokhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhor
 hhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohepughrrgifrghtrdhflhhoshhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgrvhhivghrmhesrhgvughhrghtrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 05/06/2025 à 17:24, Thomas Zimmermann a écrit :
> Replace vkms' vblank timer with the DRM implementation. The DRM
> code is mostly identical.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Tested-by: Louis Chauvet <louis.chauvet@bootlin>

> ---
>   drivers/gpu/drm/vkms/vkms_crtc.c | 49 +++++++-------------------------
>   drivers/gpu/drm/vkms/vkms_drv.h  |  6 ++--
>   2 files changed, 15 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 8c9898b9055d..5b7829e8c900 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -10,22 +10,14 @@
>   
>   #include "vkms_drv.h"
>   
> -static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
> +static bool vkms_crtc_handle_vblank(struct drm_crtc *crtc)
>   {
> -	struct vkms_output *output = container_of(timer, struct vkms_output,
> -						  vblank_hrtimer);
> -	struct drm_crtc *crtc = &output->crtc;
> +	struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
>   	struct vkms_crtc_state *state;
> -	u64 ret_overrun;
>   	bool ret, fence_cookie;
>   
>   	fence_cookie = dma_fence_begin_signalling();
>   
> -	ret_overrun = hrtimer_forward_now(&output->vblank_hrtimer,
> -					  output->period_ns);
> -	if (ret_overrun != 1)
> -		pr_warn("%s: vblank timer overrun\n", __func__);
> -
>   	spin_lock(&output->lock);
>   	ret = drm_crtc_handle_vblank(crtc);
>   	if (!ret)
> @@ -57,18 +49,14 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
>   
>   	dma_fence_end_signalling(fence_cookie);
>   
> -	return HRTIMER_RESTART;
> +	return true;
>   }
>   
>   static int vkms_enable_vblank(struct drm_crtc *crtc)
>   {
> -	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>   	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
>   
> -	hrtimer_setup(&out->vblank_hrtimer, &vkms_vblank_simulate, CLOCK_MONOTONIC,
> -		      HRTIMER_MODE_REL);
> -	out->period_ns = ktime_set(0, vblank->framedur_ns);
> -	hrtimer_start(&out->vblank_hrtimer, out->period_ns, HRTIMER_MODE_REL);
> +	drm_vblank_timer_start(&out->vtimer);
>   
>   	return 0;
>   }
> @@ -77,7 +65,7 @@ static void vkms_disable_vblank(struct drm_crtc *crtc)
>   {
>   	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
>   
> -	hrtimer_cancel(&out->vblank_hrtimer);
> +	drm_vblank_timer_cancel(&out->vtimer);
>   }
>   
>   static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
> @@ -85,28 +73,9 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>   				      bool in_vblank_irq)
>   {
>   	struct vkms_output *output = drm_crtc_to_vkms_output(crtc);
> -	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> -
> -	if (!READ_ONCE(vblank->enabled)) {
> -		*vblank_time = ktime_get();
> -		return true;
> -	}
> -
> -	*vblank_time = READ_ONCE(output->vblank_hrtimer.node.expires);
>   
> -	if (WARN_ON(*vblank_time == vblank->time))
> -		return true;
> -
> -	/*
> -	 * To prevent races we roll the hrtimer forward before we do any
> -	 * interrupt processing - this is how real hw works (the interrupt is
> -	 * only generated after all the vblank registers are updated) and what
> -	 * the vblank core expects. Therefore we need to always correct the
> -	 * timestampe by one frame.
> -	 */
> -	*vblank_time -= output->period_ns;
> -
> -	return true;
> +	return drm_vblank_timer_get_vblank_timestamp(&output->vtimer, max_error,
> +						     vblank_time, in_vblank_irq);
>   }
>   
>   static struct drm_crtc_state *
> @@ -274,6 +243,7 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
>   {
>   	struct vkms_output *vkms_out;
>   	struct drm_crtc *crtc;
> +	struct drm_vblank_timer *vtimer;
>   	int ret;
>   
>   	vkms_out = drmm_crtc_alloc_with_planes(dev, struct vkms_output, crtc,
> @@ -285,6 +255,7 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
>   	}
>   
>   	crtc = &vkms_out->crtc;
> +	vtimer = &vkms_out->vtimer;
>   
>   	drm_crtc_helper_add(crtc, &vkms_crtc_helper_funcs);
>   
> @@ -305,5 +276,7 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
>   	if (!vkms_out->composer_workq)
>   		return ERR_PTR(-ENOMEM);
>   
> +	drmm_vblank_timer_init(vtimer, crtc, vkms_crtc_handle_vblank);
> +
>   	return vkms_out;
>   }
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index a74a7fc3a056..126016898285 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -10,6 +10,7 @@
>   #include <drm/drm_gem.h>
>   #include <drm/drm_gem_atomic_helper.h>
>   #include <drm/drm_encoder.h>
> +#include <drm/drm_vblank_timer.h>
>   #include <drm/drm_writeback.h>
>   
>   #define DEFAULT_DEVICE_NAME "vkms"
> @@ -180,8 +181,9 @@ struct vkms_output {
>   	struct drm_crtc crtc;
>   	struct drm_writeback_connector wb_connector;
>   	struct drm_encoder wb_encoder;
> -	struct hrtimer vblank_hrtimer;
> -	ktime_t period_ns;
> +	struct drm_vblank_timer vtimer;
> +	struct drm_pending_vblank_event *event;
> +	/* ordered wq for composer_work */
>   	struct workqueue_struct *composer_workq;
>   	spinlock_t lock;
>   

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

