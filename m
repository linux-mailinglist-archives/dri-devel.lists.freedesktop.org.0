Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC8B25C27D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 16:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9257F6EA07;
	Thu,  3 Sep 2020 14:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850E56EA13
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 14:26:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v4so3088954wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 07:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=WPGkIiYKzcgeZQHQnOsCQNykJDQ0LcIwyOzw3jP31iw=;
 b=U301XTzYB4iZKTuiJEmNQa6LjlPoAgog/xJoj2wXvl+EI/gGl4kWAUeLkLbROf10CM
 12rXgyOY/z6vjHv0JLB7K9Jbh5iTKLxDuFMfUQin7FIUR20sK3PUvcY3qbKpbGGT1p5c
 wW2cc2EqnzOcUZz45pxPARRleTG2/83YxeQSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=WPGkIiYKzcgeZQHQnOsCQNykJDQ0LcIwyOzw3jP31iw=;
 b=qO5n/CPMF2UyZmQ3BWZ/RPAzWdLQHB9veE2JGQarbE6neSMBHTMcdwu04CphIkdpOn
 9oI8UzcuJE3DhZ8QrmYNbGvydBb5c51l9XvKMpPV/YwNdq9VsMlC2K0q4JZZwlihxIE0
 WfFej3M8QLvO+MMnYxprxWz6MqE2YjouxKVHIzeKgdZiWq/NR7YVVMMieahwJdMWf19b
 qclgJ4Azf3wO/TCfn544kwIJfRRBqmtOPJn/GaUDFqUxi8bf7bSeitpsBHzlSwiiR6op
 zOrNerlEjrQekfZsQ6YTswu6OLoDMBKlhd9Vjl1MY2/ZvzPYX+/5kjaCdgGIZ57GEhIr
 x1og==
X-Gm-Message-State: AOAM533O+TbSn1xmLy25Yj02/SlXZpSkkZ3WfEJzAsZw+MQQ3af+nh2/
 Kg7fBYlbVTFWcgXP/8K/6IfQNBI+u6b9pw9p
X-Google-Smtp-Source: ABdhPJy+7miLidr8+Q7a35jxDlUiV0t4pfimyyJefQnknzDQJHXA9I2kP+JojMTk8ShJea3BVBMVhA==
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr2747038wma.111.1599143204660; 
 Thu, 03 Sep 2020 07:26:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q6sm4392609wmq.19.2020.09.03.07.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 07:26:43 -0700 (PDT)
Date: Thu, 3 Sep 2020 16:26:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/managed: Cleanup of unused functions and polishing
 docs
Message-ID: <20200903142641.GL2352366@phenom.ffwll.local>
References: <20200902072627.3617301-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200902072627.3617301-1-daniel.vetter@ffwll.ch>
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
Cc: Luben Tuikov <luben.tuikov@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 02, 2020 at 09:26:27AM +0200, Daniel Vetter wrote:
> Following functions are only used internally, not by drivers:
> - devm_drm_dev_init
> =

> Also, now that we have a very slick and polished way to allocate a
> drm_device with devm_drm_dev_alloc, update all the docs to reflect the
> new reality. Mostly this consists of deleting old and misleading
> hints. Two main ones:
> =

> - it is no longer required that the drm_device base class is first in
>   the structure. devm_drm_dev_alloc can cope with it being anywhere
> =

> - obviously embedded now strongly recommends using devm_drm_dev_alloc
> =

> v2: Fix typos (Noralf)
> =

> v3: Split out the removal of drm_dev_init, that's blocked on some
> discussions on how to convert vgem/vkms/i915-selftests. Adjust commit
> message to reflect that.
> =

> Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> Acked-by: Noralf Tr=F8nnes <noralf@tronnes.org> (v2)
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Ok pushed that now to drm-misc-next. I'm also working on getting the
remaining bits of the basic drm managed conversion resubmitted. That was
unfortunately massively sidelined for the dma-fence discussions.

Quick heads-up:
drmm_add_final_kfree and drm_dev_init will both disappear, please use
devm_drm_dev_alloc.

Cheers, Daniel

> ---
>  .../driver-api/driver-model/devres.rst        |  2 +-
>  drivers/gpu/drm/drm_drv.c                     | 78 +++++--------------
>  drivers/gpu/drm/drm_managed.c                 |  2 +-
>  include/drm/drm_device.h                      |  2 +-
>  include/drm/drm_drv.h                         | 16 ++--
>  5 files changed, 30 insertions(+), 70 deletions(-)
> =

> diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documenta=
tion/driver-api/driver-model/devres.rst
> index eaaaafc21134..aa4d2420f79e 100644
> --- a/Documentation/driver-api/driver-model/devres.rst
> +++ b/Documentation/driver-api/driver-model/devres.rst
> @@ -263,7 +263,7 @@ DMA
>    dmam_pool_destroy()
>  =

>  DRM
> -  devm_drm_dev_init()
> +  devm_drm_dev_alloc()
>  =

>  GPIO
>    devm_gpiod_get()
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index d4506f7a234e..7c1689842ec0 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -240,13 +240,13 @@ void drm_minor_release(struct drm_minor *minor)
>   * DOC: driver instance overview
>   *
>   * A device instance for a drm driver is represented by &struct drm_devi=
ce. This
> - * is initialized with drm_dev_init(), usually from bus-specific ->probe=
()
> - * callbacks implemented by the driver. The driver then needs to initial=
ize all
> - * the various subsystems for the drm device like memory management, vbl=
ank
> - * handling, modesetting support and intial output configuration plus ob=
viously
> - * initialize all the corresponding hardware bits. Finally when everythi=
ng is up
> - * and running and ready for userspace the device instance can be publis=
hed
> - * using drm_dev_register().
> + * is allocated and initialized with devm_drm_dev_alloc(), usually from
> + * bus-specific ->probe() callbacks implemented by the driver. The drive=
r then
> + * needs to initialize all the various subsystems for the drm device lik=
e memory
> + * management, vblank handling, modesetting support and initial output
> + * configuration plus obviously initialize all the corresponding hardwar=
e bits.
> + * Finally when everything is up and running and ready for userspace the=
 device
> + * instance can be published using drm_dev_register().
>   *
>   * There is also deprecated support for initalizing device instances usi=
ng
>   * bus-specific helpers and the &drm_driver.load callback. But due to
> @@ -274,7 +274,7 @@ void drm_minor_release(struct drm_minor *minor)
>   *
>   * The following example shows a typical structure of a DRM display driv=
er.
>   * The example focus on the probe() function and the other functions tha=
t is
> - * almost always present and serves as a demonstration of devm_drm_dev_i=
nit().
> + * almost always present and serves as a demonstration of devm_drm_dev_a=
lloc().
>   *
>   * .. code-block:: c
>   *
> @@ -294,22 +294,12 @@ void drm_minor_release(struct drm_minor *minor)
>   *		struct drm_device *drm;
>   *		int ret;
>   *
> - *		// devm_kzalloc() can't be used here because the drm_device '
> - *		// lifetime can exceed the device lifetime if driver unbind
> - *		// happens when userspace still has open file descriptors.
> - *		priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> - *		if (!priv)
> - *			return -ENOMEM;
> - *
> + *		priv =3D devm_drm_dev_alloc(&pdev->dev, &driver_drm_driver,
> + *					  struct driver_device, drm);
> + *		if (IS_ERR(priv))
> + *			return PTR_ERR(priv);
>   *		drm =3D &priv->drm;
>   *
> - *		ret =3D devm_drm_dev_init(&pdev->dev, drm, &driver_drm_driver);
> - *		if (ret) {
> - *			kfree(priv);
> - *			return ret;
> - *		}
> - *		drmm_add_final_kfree(drm, priv);
> - *
>   *		ret =3D drmm_mode_config_init(drm);
>   *		if (ret)
>   *			return ret;
> @@ -550,9 +540,9 @@ static void drm_fs_inode_free(struct inode *inode)
>   * following guidelines apply:
>   *
>   *  - The entire device initialization procedure should be run from the
> - *    &component_master_ops.master_bind callback, starting with drm_dev_=
init(),
> - *    then binding all components with component_bind_all() and finishin=
g with
> - *    drm_dev_register().
> + *    &component_master_ops.master_bind callback, starting with
> + *    devm_drm_dev_alloc(), then binding all components with
> + *    component_bind_all() and finishing with drm_dev_register().
>   *
>   *  - The opaque pointer passed to all components through component_bind=
_all()
>   *    should point at &struct drm_device of the device instance, not som=
e driver
> @@ -706,24 +696,9 @@ static void devm_drm_dev_init_release(void *data)
>  	drm_dev_put(data);
>  }
>  =

> -/**
> - * devm_drm_dev_init - Resource managed drm_dev_init()
> - * @parent: Parent device object
> - * @dev: DRM device
> - * @driver: DRM driver
> - *
> - * Managed drm_dev_init(). The DRM device initialized with this function=
 is
> - * automatically put on driver detach using drm_dev_put().
> - *
> - * Note that drivers must call drmm_add_final_kfree() after this functio=
n has
> - * completed successfully.
> - *
> - * RETURNS:
> - * 0 on success, or error code on failure.
> - */
> -int devm_drm_dev_init(struct device *parent,
> -		      struct drm_device *dev,
> -		      struct drm_driver *driver)
> +static int devm_drm_dev_init(struct device *parent,
> +			     struct drm_device *dev,
> +			     struct drm_driver *driver)
>  {
>  	int ret;
>  =

> @@ -737,7 +712,6 @@ int devm_drm_dev_init(struct device *parent,
>  =

>  	return ret;
>  }
> -EXPORT_SYMBOL(devm_drm_dev_init);
>  =

>  void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *dri=
ver,
>  			   size_t size, size_t offset)
> @@ -767,19 +741,9 @@ EXPORT_SYMBOL(__devm_drm_dev_alloc);
>   * @driver: DRM driver to allocate device for
>   * @parent: Parent device object
>   *
> - * Allocate and initialize a new DRM device. No device registration is d=
one.
> - * Call drm_dev_register() to advertice the device to user space and reg=
ister it
> - * with other core subsystems. This should be done last in the device
> - * initialization sequence to make sure userspace can't access an incons=
istent
> - * state.
> - *
> - * The initial ref-count of the object is 1. Use drm_dev_get() and
> - * drm_dev_put() to take and drop further ref-counts.
> - *
> - * Note that for purely virtual devices @parent can be NULL.
> - *
> - * Drivers that wish to subclass or embed &struct drm_device into their
> - * own struct should look at using drm_dev_init() instead.
> + * This is the deprecated version of devm_drm_dev_alloc(), which does no=
t support
> + * subclassing through embedding the struct &drm_device in a driver priv=
ate
> + * structure, and which does not support automatic cleanup through devre=
s.
>   *
>   * RETURNS:
>   * Pointer to new DRM device, or ERR_PTR on failure.
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index 1e1356560c2e..c36e3d98fd71 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -27,7 +27,7 @@
>   * be done directly with drmm_kmalloc() and the related functions. Every=
thing
>   * will be released on the final drm_dev_put() in reverse order of how t=
he
>   * release actions have been added and memory has been allocated since d=
river
> - * loading started with drm_dev_init().
> + * loading started with devm_drm_dev_alloc().
>   *
>   * Note that release actions and managed memory can also be added and re=
moved
>   * during the lifetime of the driver, all the functions are fully concur=
rent
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 0988351d743c..f4f68e7a9149 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -92,7 +92,7 @@ struct drm_device {
>  	 * NULL.
>  	 *
>  	 * Instead of using this pointer it is recommended that drivers use
> -	 * drm_dev_init() and embed struct &drm_device in their larger
> +	 * devm_drm_dev_alloc() and embed struct &drm_device in their larger
>  	 * per-device structure.
>  	 */
>  	void *dev_private;
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 6ba7dd11384d..533c6e1a5a95 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -163,13 +163,12 @@ struct drm_driver {
>  	/**
>  	 * @load:
>  	 *
> -	 * Backward-compatible driver callback to complete
> -	 * initialization steps after the driver is registered.  For
> -	 * this reason, may suffer from race conditions and its use is
> -	 * deprecated for new drivers.  It is therefore only supported
> -	 * for existing drivers not yet converted to the new scheme.
> -	 * See drm_dev_init() and drm_dev_register() for proper and
> -	 * race-free way to set up a &struct drm_device.
> +	 * Backward-compatible driver callback to complete initialization steps
> +	 * after the driver is registered.  For this reason, may suffer from
> +	 * race conditions and its use is deprecated for new drivers.  It is
> +	 * therefore only supported for existing drivers not yet converted to
> +	 * the new scheme.  See devm_drm_dev_alloc() and drm_dev_register() for
> +	 * proper and race-free way to set up a &struct drm_device.
>  	 *
>  	 * This is deprecated, do not use!
>  	 *
> @@ -595,9 +594,6 @@ struct drm_driver {
>  int drm_dev_init(struct drm_device *dev,
>  		 struct drm_driver *driver,
>  		 struct device *parent);
> -int devm_drm_dev_init(struct device *parent,
> -		      struct drm_device *dev,
> -		      struct drm_driver *driver);
>  =

>  void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *dri=
ver,
>  			   size_t size, size_t offset);
> -- =

> 2.28.0
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
