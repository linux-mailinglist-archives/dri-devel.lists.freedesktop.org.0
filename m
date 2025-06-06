Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB1FACFE7E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 10:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BF010E9B4;
	Fri,  6 Jun 2025 08:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gXQ+7TKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C106910E9B4
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 08:44:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A701943254;
 Fri,  6 Jun 2025 08:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749199440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q3ourGZ4/eF/wP4FAzyNQcrYbyPbro92UlX3xfEO8k0=;
 b=gXQ+7TKPPvXs0/gc5pLifV9BLs0ND3fNTDfU+2t1ytzLfLwoOu0dWJrJmaq4JEiF2cporV
 K6Ot6wk4LT/NHCRFxuc/UOYoW4Rv+KNQ6hic/Jm1iqdtrTPVu+xA7SvIHfuSylACWbsQ2e
 Z4xw+wc/wvdd+z6TOfbZ9zR5zQlfjBRd9kDPSjW0z55jKQNyLk6JfkOWHbDxziHubNtTMW
 YuDh15QY7/R/cPcJRWWTlfoGo1UNKZiBH3mcLUDg8R153S8WcWkfNoBRZWZtdL+PF4LoPn
 Qz+PzOHbS+9Pu47LMUOQtR4GkBXcgoXJrvxbnJrlRCrjxaE5Dlwq980k2tpl4A==
Message-ID: <b6b43b7f-f3bd-442a-9174-97d3ada0f695@bootlin.com>
Date: Fri, 6 Jun 2025 10:43:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/vblank: Add vblank timer
To: Thomas Zimmermann <tzimmermann@suse.de>, mhklinux@outlook.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, drawat.floss@gmail.com, javierm@redhat.com,
 kraxel@redhat.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 fvogt@suse.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev
References: <20250605152637.98493-1-tzimmermann@suse.de>
 <20250605152637.98493-2-tzimmermann@suse.de>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250605152637.98493-2-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekieevtdefgedtkeehteehtddttdefhffhgeejleejjeeluddvhfdugedvkeehveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplgduledvrdduieekrdeiledrvdefudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudehpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehmhhhklhhinhhugiesohhuthhlohhokhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhor
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
> The vblank timer simulates a vblank interrupt for hardware without
> support. Rate-limits the display update frequency.
> 
> DRM drivers for hardware without vblank support apply display updates
> ASAP. A vblank event informs DRM clients of the completed update.
> 
> Userspace compositors immediately schedule the next update, which
> creates significant load on virtualization outputs. Display updates
> are usually fast on virtualization outputs, as their framebuffers are
> in regular system memory and there's no hardware vblank interrupt to
> throttle the update rate.
> 
> The vblank timer is a HR timer that signals the vblank in software.
> It limits the update frequency of a DRM driver similar to a hardware
> vblank interrupt. The timer is not synchronized to the actual vblank
> interval of the display.
> 
> The code has been adopted from vkms, which added the funtionality
> in commit 3a0709928b17 ("drm/vkms: Add vblank events simulated by
> hrtimers").
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/Makefile           |   3 +-
>   drivers/gpu/drm/drm_vblank_timer.c | 100 +++++++++++++++++++++++++++++
>   include/drm/drm_vblank_timer.h     |  26 ++++++++
>   3 files changed, 128 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/drm_vblank_timer.c
>   create mode 100644 include/drm/drm_vblank_timer.h
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index b5d5561bbe5f..6722e2d1aa7e 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -146,7 +146,8 @@ drm_kms_helper-y := \
>   	drm_plane_helper.o \
>   	drm_probe_helper.o \
>   	drm_self_refresh_helper.o \
> -	drm_simple_kms_helper.o
> +	drm_simple_kms_helper.o \
> +	drm_vblank_timer.o
>   drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
>   drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
>   obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
> diff --git a/drivers/gpu/drm/drm_vblank_timer.c b/drivers/gpu/drm/drm_vblank_timer.c
> new file mode 100644
> index 000000000000..be46d3135c8e
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_vblank_timer.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <linux/hrtimer.h>
> +
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_vblank.h>
> +#include <drm/drm_vblank_timer.h>
> +
> +static enum hrtimer_restart drm_vblank_timer_function(struct hrtimer *timer)
> +{
> +	struct drm_vblank_timer *vtimer = container_of(timer, struct drm_vblank_timer, timer);
> +	struct drm_crtc *crtc = vtimer->crtc;
> +	struct drm_device *dev = crtc->dev;
> +	u64 ret_overrun;
> +	bool succ;
> +
> +	ret_overrun = hrtimer_forward_now(&vtimer->timer, vtimer->period_ns);
> +	if (ret_overrun != 1)
> +		drm_warn(dev, "vblank timer overrun\n");
> +
> +	if (vtimer->crtc_handle_vblank)
> +		succ = vtimer->crtc_handle_vblank(crtc);
> +	else
> +		succ = drm_crtc_handle_vblank(crtc);
> +	if (!succ)
> +		return HRTIMER_NORESTART;
> +
> +	return HRTIMER_RESTART;
> +}
> +
> +static void drmm_vblank_timer_release(struct drm_device *dev, void *res)
> +{
> +	struct drm_vblank_timer *vtimer = res;
> +
> +	hrtimer_cancel(&vtimer->timer);
> +}
> +
> +int drmm_vblank_timer_init(struct drm_vblank_timer *vtimer, struct drm_crtc *crtc,
> +			   bool (*crtc_handle_vblank)(struct drm_crtc *crtc))
> +{
> +	struct hrtimer *timer = &vtimer->timer;
> +
> +	vtimer->crtc = crtc;
> +	vtimer->crtc_handle_vblank = crtc_handle_vblank;
> +
> +	hrtimer_setup(timer, drm_vblank_timer_function, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +
> +	return drmm_add_action_or_reset(crtc->dev, drmm_vblank_timer_release, vtimer);
> +}
> +EXPORT_SYMBOL(drmm_vblank_timer_init);
> +
> +void drm_vblank_timer_start(struct drm_vblank_timer *vtimer)
> +{
> +	struct drm_crtc *crtc = vtimer->crtc;
> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> +
> +	drm_calc_timestamping_constants(crtc, &crtc->mode);
> +
> +	vtimer->period_ns = ktime_set(0, vblank->framedur_ns);
> +	hrtimer_start(&vtimer->timer, vtimer->period_ns, HRTIMER_MODE_REL);
> +}
> +EXPORT_SYMBOL(drm_vblank_timer_start);
> +
> +void drm_vblank_timer_cancel(struct drm_vblank_timer *vtimer)
> +{
> +	hrtimer_cancel(&vtimer->timer);
> +}
> +EXPORT_SYMBOL(drm_vblank_timer_cancel);
> +
> +bool drm_vblank_timer_get_vblank_timestamp(struct drm_vblank_timer *vtimer,
> +					   int *max_error, ktime_t *vblank_time,
> +					   bool in_vblank_irq)
> +{
> +	struct drm_crtc *crtc = vtimer->crtc;
> +	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> +
> +	if (!READ_ONCE(vblank->enabled)) {
> +		*vblank_time = ktime_get();
> +		return true;
> +	}
> +
> +	*vblank_time = READ_ONCE(vtimer->timer.node.expires);
> +
> +	if (WARN_ON(*vblank_time == vblank->time))
> +		return true;
> +
> +	/*
> +	 * To prevent races we roll the hrtimer forward before we do any
> +	 * interrupt processing - this is how real hw works (the interrupt is
> +	 * only generated after all the vblank registers are updated) and what
> +	 * the vblank core expects. Therefore we need to always correct the
> +	 * timestampe by one frame.
> +	 */
> +	*vblank_time -= vtimer->period_ns;
> +
> +	return true;
> +}
> +EXPORT_SYMBOL(drm_vblank_timer_get_vblank_timestamp);
> diff --git a/include/drm/drm_vblank_timer.h b/include/drm/drm_vblank_timer.h
> new file mode 100644
> index 000000000000..0b827ff1f59c
> --- /dev/null
> +++ b/include/drm/drm_vblank_timer.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _DRM_VBLANK_TIMER_H_
> +#define _DRM_VBLANK_TIMER_H_
> +
> +#include <linux/hrtimer_types.h>
> +#include <linux/types.h>
> +
> +struct drm_crtc;
> +
> +struct drm_vblank_timer {
> +	struct drm_crtc *crtc;
> +	bool (*crtc_handle_vblank)(struct drm_crtc *crtc);
> +	ktime_t period_ns;
> +	struct hrtimer timer;
> +};
> +
> +int drmm_vblank_timer_init(struct drm_vblank_timer *vtimer, struct drm_crtc *crtc,
> +			   bool (*handle_vblank)(struct drm_crtc *crtc));
> +void drm_vblank_timer_start(struct drm_vblank_timer *vtimer);
> +void drm_vblank_timer_cancel(struct drm_vblank_timer *vtimer);
> +bool drm_vblank_timer_get_vblank_timestamp(struct drm_vblank_timer *vtimer,
> +					   int *max_error, ktime_t *vblank_time,
> +					   bool in_vblank_irq);
> +
> +#endif

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

