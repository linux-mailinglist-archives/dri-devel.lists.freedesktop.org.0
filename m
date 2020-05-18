Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672141D7EF8
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 18:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FBC6E445;
	Mon, 18 May 2020 16:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0F36E445
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 16:44:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id m12so203739wmc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 09:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=+sSdxG+45JpBCxiSG1ik2FxZ+bBTihebjB6gLOUfFzM=;
 b=qi2t/txwnCWqkyu0dzRq40kNxzJcobBleEXk3LfNng3HXN84pj842BwzG+E676NYHA
 LPU0g5wSgYgr0h+ICuxqA9hPgmgGK8SyPCEnuXgtnKERg7si/YVm04xcDuNoc9RjdYvH
 eMc0MzcYgNtrCxKqmhEQyHPHStcY8PPfCcBl5QLp7587Ae+JXRhdRn2BJRRsoU8mti1X
 UH1wetZA8F1CKHFEWjzUAPE88O6xy02pyphDcCJkWnczaUaDLWywCNB81GKgJWtc08Zf
 aV4nokY1a13ZJkb8qjv2U1b5Xw6zxJEKiw9p3i1PLahl/Oc6rhDudqCSyuus75HFEjn+
 sGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+sSdxG+45JpBCxiSG1ik2FxZ+bBTihebjB6gLOUfFzM=;
 b=RIlNEeIEjarqLd1e9DGJsKYfWvSa8DZALANjTuWKM6Z60XVO8+JEgzMPop7r1hL6w5
 K3xp92p4l8Nl/M0mx4bShwejHtERIV9ugof8qbfZznLsbXc+eCza2n2pEW3t12zW1aaF
 tWNvDaQo0+5en0MVga3cxb9EpjvOLi11aJfsNvOdDiRSt6ueT61GXFBHbOVbQk/mO8wq
 zpDT3Uz5KIeSWqOi9AzBk1FO+E+gOwQvNUUvHUH/bgPdvdywzKnH36un7pOBZbmI/RMi
 jrSeOm941XGZ07O4px9BxSf9bmA1qbG3Csw3PTCTnrLeBT9oOd/QmNm2FcCbmmTTbb70
 sH/Q==
X-Gm-Message-State: AOAM531eRTJmHhJNGX3rdDT7byQUuGLVnq8pTNwEw2malTOBQ3w909oB
 HSGelz2ntEtwh+sp+XiPcVRVyQ==
X-Google-Smtp-Source: ABdhPJzO877HAa1ZHgwuZWeR9A/8kBtLG2o9lvW6ij/N2C4EC8BPHaOEi2q/cYUsrO5/9i2xn7nESw==
X-Received: by 2002:a7b:c1d2:: with SMTP id a18mr254461wmj.176.1589820292494; 
 Mon, 18 May 2020 09:44:52 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a13sm16775503wrv.67.2020.05.18.09.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 09:44:51 -0700 (PDT)
Date: Mon, 18 May 2020 17:44:49 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 11/16] backlight: add overview and update existing doc
Message-ID: <20200518164449.2dgazleaxozxdwx7@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-12-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200517190139.740249-12-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Andy Gross <agross@kernel.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 17, 2020 at 09:01:34PM +0200, Sam Ravnborg wrote:
> Add overview chapter to backlight.c.
> Update existing kernel-doc to follow a more consistent
> style and drop kernel-doc for deprecated functions.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>
> ---
>  drivers/video/backlight/backlight.c | 131 +++++++++++++++++++---------
>  1 file changed, 90 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
> index 17f04cff50ab..2212f0e3570e 100644
> --- a/drivers/video/backlight/backlight.c
> +++ b/drivers/video/backlight/backlight.c
> @@ -22,6 +22,45 @@
>  #include <asm/backlight.h>
>  #endif
>  
> +/**
> + * DOC: overview
> + *
> + * The backlight core supports implementing backlight drivers.
> + *
> + * backlight is controlled from userspace via firmware, a platform
> + * specific way or via sysfs. The backlight core provide support
> + * for all three types of backlight control.

This paragraph seems very difficult for a reader to absorb (isn't
"controlled from userspace via firmware" more like the backlight
subsytem notifying the userspace when something else controls the
backlight behind the userspace's back).

Maybe just drop the paragraph? Notifications are covered further down
anyway.


> + *
> + * A backlight driver registers a driver using
> + * devm_backlight_device_register(). The properties of the backlight
> + * driver such as type and max_brightness must be specified.
> + * When the core detect changes in for example brightness or power state
> + * the update_status() operation is called. The backlight driver shall
> + * implement this operation and use it to adjust backlight.
> + *
> + * Several sysfs attributes are provided by the backlight core::
> + *
> + * - brightness         R/W, set the requested brightness level
> + * - actual_brighness   RO, the brightness level used by the HW
> + * - max_brightness     RO, the maximum  brightness level supported

I've not come across this markup before. Do all these extra
spaces create readable output when formatted?


> + *
> + * See Documentation/ABI/stable/sysfs-class-backlight for the full list.
> + *
> + * The driver shall implement the get_brightness() operation if
> + * the HW do not support all the levels that can be specified in
> + * brightness, thus providing user-space access to the actual level
> + * via the actual_brightness attribute.

Again... this doesn't look like the formatted output will get a
paragraph break here.


> + * When the backlight changes this is reported to user-space using
> + * an uevent connected to the actual_brightness attribute.
> + * When brightness is set by platform specific means, for example
> + * a hot-key to adjust backlight, the driver must notify the backlight
> + * core that brighness has changed using backlight_force_update().
> + *
> + * The backlight driver core receives notifications from fbdev and
> + * if the event is FB_EVENT_BLANK the value of blank, from the FBIOBLANK
> + * ioclt, is passed to the driver via the update_status() operation.
> + */
> +
>  static struct list_head backlight_dev_list;
>  static struct mutex backlight_dev_list_mutex;
>  static struct blocking_notifier_head backlight_notifier;
> @@ -40,9 +79,17 @@ static const char *const backlight_scale_types[] = {
>  
>  #if defined(CONFIG_FB) || (defined(CONFIG_FB_MODULE) && \
>  			   defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE))
> -/* This callback gets called when something important happens inside a
> - * framebuffer driver. We're looking if that important event is blanking,
> - * and if it is and necessary, we're switching backlight power as well ...
> +/*
> + * fb_notifier_callback
> + *
> + * This callback gets called when something important happens inside a
> + * framebuffer driver. The backlight core only care about FB_BLANK_UNBLANK

s/care/cares/

> + * which is reported to the driver using backlight_update_status()
> + * as a state change.
> + *
> + * There may be several fbdev's connected to the backlight device,
> + * in which case they are kept track of. A state change is only reported
> + * if there is a change in backligt for the specified fbdev.

Typo.


>   */
>  static int fb_notifier_callback(struct notifier_block *self,
>  				unsigned long event, void *data)
> @@ -318,12 +365,16 @@ static struct attribute *bl_device_attrs[] = {
>  ATTRIBUTE_GROUPS(bl_device);
>  
>  /**
> - * backlight_force_update - tell the backlight subsystem that hardware state
> - *   has changed
> + * backlight_force_update - force an update due to a hardware change
>   * @bd: the backlight device to update
> + * @reason: the method used for the backlight update
>   *
>   * Updates the internal state of the backlight in response to a hardware event,
> - * and generate a uevent to notify userspace
> + * and generate an uevent to notify userspace.

s/generate/generates/


> + * A backlight driver shall call backlight_force_update() when the backlight
> + * is changed using, for example, a hot-key.
> + * The updated brightness is read using get_brightness() and the brightness
> + * value is reported using an uevent.

There seem to be several missing paragraph breaks above.

>   */
>  void backlight_force_update(struct backlight_device *bd,
>  			    enum backlight_update_reason reason)
> @@ -336,19 +387,7 @@ void backlight_force_update(struct backlight_device *bd,
>  }
>  EXPORT_SYMBOL(backlight_force_update);
>  
> -/**
> - * backlight_device_register - create and register a new object of
> - *   backlight_device class.
> - * @name: the name of the new object(must be the same as the name of the
> - *   respective framebuffer device).
> - * @parent: a pointer to the parent device
> - * @devdata: an optional pointer to be stored for private driver use. The
> - *   methods may retrieve it by using bl_get_data(bd).
> - * @ops: the backlight operations structure.
> - *
> - * Creates and registers new backlight device. Returns either an
> - * ERR_PTR() or a pointer to the newly allocated device.
> - */
> +/* deprecated - use devm_backlight_device_register() */
>  struct backlight_device *backlight_device_register(const char *name,
>  	struct device *parent, void *devdata, const struct backlight_ops *ops,
>  	const struct backlight_properties *props)
> @@ -415,6 +454,15 @@ struct backlight_device *backlight_device_register(const char *name,
>  }
>  EXPORT_SYMBOL(backlight_device_register);
>  
> +/** backlight_device_get_by_type - find first backlight device of a type
> + * @type: the type of backlight device
> + *
> + * Look up the first backlight device of the specified type
> + *
> + * RETURNS:
> + *
> + * Pointer to backlight device if any was found. Otherwise NULL.
> + */
>  struct backlight_device *backlight_device_get_by_type(enum backlight_type type)
>  {
>  	bool found = false;
> @@ -433,12 +481,7 @@ struct backlight_device *backlight_device_get_by_type(enum backlight_type type)
>  }
>  EXPORT_SYMBOL(backlight_device_get_by_type);
>  
> -/**
> - * backlight_device_unregister - unregisters a backlight device object.
> - * @bd: the backlight device object to be unregistered and freed.
> - *
> - * Unregisters a previously registered via backlight_device_register object.
> - */
> +/* deprecated - use devm_backlight_device_unregister() */
>  void backlight_device_unregister(struct backlight_device *bd)
>  {
>  	if (!bd)
> @@ -486,10 +529,12 @@ static int devm_backlight_device_match(struct device *dev, void *res,
>   * backlight_register_notifier - get notified of backlight (un)registration
>   * @nb: notifier block with the notifier to call on backlight (un)registration
>   *
> - * @return 0 on success, otherwise a negative error code
> - *
>   * Register a notifier to get notified when backlight devices get registered
>   * or unregistered.
> + *
> + * RETURNS:
> + *
> + * 0 on success, otherwise a negative error code
>   */
>  int backlight_register_notifier(struct notifier_block *nb)
>  {
> @@ -501,10 +546,12 @@ EXPORT_SYMBOL(backlight_register_notifier);
>   * backlight_unregister_notifier - unregister a backlight notifier
>   * @nb: notifier block to unregister
>   *
> - * @return 0 on success, otherwise a negative error code
> - *
>   * Register a notifier to get notified when backlight devices get registered
>   * or unregistered.
> + *
> + * RETURNS:
> + *
> + * 0 on success, otherwise a negative error code
>   */
>  int backlight_unregister_notifier(struct notifier_block *nb)
>  {
> @@ -513,20 +560,22 @@ int backlight_unregister_notifier(struct notifier_block *nb)
>  EXPORT_SYMBOL(backlight_unregister_notifier);
>  
>  /**
> - * devm_backlight_device_register - resource managed backlight_device_register()
> + * devm_backlight_device_register - registering a new backlight device

s/registering/register/

>   * @dev: the device to register
>   * @name: the name of the device
> - * @parent: a pointer to the parent device
> + * @parent: a pointer to the parent device (often the same as @dev)
>   * @devdata: an optional pointer to be stored for private driver use
>   * @ops: the backlight operations structure
>   * @props: the backlight properties
>   *
> - * @return a struct backlight on success, or an ERR_PTR on error
> + * Creates and registers new backlight device. When a backlight device
> + * is registered the configuration must be specified in the @props
> + * parameter. See description of &backlight_properties.
>   *
> - * Managed backlight_device_register(). The backlight_device returned
> - * from this function are automatically freed on driver detach.
> - * See backlight_device_register() for more information.
> - */
> + * RETURNS:
> + *
> + * struct backlight on success, or an ERR_PTR on error
> +*/
>  struct backlight_device *devm_backlight_device_register(struct device *dev,
>  	const char *name, struct device *parent, void *devdata,
>  	const struct backlight_ops *ops,
> @@ -553,13 +602,13 @@ struct backlight_device *devm_backlight_device_register(struct device *dev,
>  EXPORT_SYMBOL(devm_backlight_device_register);
>  
>  /**
> - * devm_backlight_device_unregister - resource managed backlight_device_unregister()
> + * devm_backlight_device_unregister - backlight device unregister

s/backlight device unregister/unregister backlight device/


Daniel.


>   * @dev: the device to unregister
>   * @bd: the backlight device to unregister
>   *
> - * Deallocated a backlight allocated with devm_backlight_device_register().
> + * Deallocates a backlight allocated with devm_backlight_device_register().
>   * Normally this function will not need to be called and the resource management
> - * code will ensure that the resource is freed.
> + * code will ensure that the resources are freed.
>   */
>  void devm_backlight_device_unregister(struct device *dev,
>  				struct backlight_device *bd)
> @@ -650,8 +699,8 @@ static void devm_backlight_release(void *data)
>  }
>  
>  /**
> - * devm_of_find_backlight - Resource-managed of_find_backlight()
> - * @dev: Device
> + * devm_of_find_backlight - find backlight for a device
> + * @dev: the device
>   *
>   * Device managed version of of_find_backlight().
>   * The reference on the backlight device is automatically
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
