Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6454E2A0DE5
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 19:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1DF6EDFF;
	Fri, 30 Oct 2020 18:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC75F6EDFF;
 Fri, 30 Oct 2020 18:53:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w14so7555025wrs.9;
 Fri, 30 Oct 2020 11:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fNVhUhYJvcYK+s54ub8QbVx0f0OcbhYbIdqPHb4m+xw=;
 b=GRV5cDVWoP7UJtAUNoPfYpw72dVw+Qj5N+6h3x02mZ5DnHP3L62/VVO/4gZLtSIZHG
 NewFv40EtehXcnnZvv0y5x0Y/j+PVeE9atKo3Tn8qVvPfQZ8trHzJfK4M2u55srzQac6
 Yy3WQyKVfN0jb3jXTeL2rcbwLmc1ztYupXBOWZlSQ2V3piavrTM8Ijwsb4HdEmC2wKbn
 DXl6FTolODauxXW1GtreD7Sc6kxxxOI5L2lGN7m5MZJxTFwdUttQUPi0pr/KOxlzspRo
 L2F+ceJc3jq0535oqtW6/yJ/Pz7uALRzVOy9CK2rEU8R6skOC7mElYAsIoh7huRPL674
 dt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fNVhUhYJvcYK+s54ub8QbVx0f0OcbhYbIdqPHb4m+xw=;
 b=rV2UqiYAKbRRx/uNbkyiQ8avhnwreXKuFdZa0FItXjF1FYM7HbAsJovESakQYrdWfP
 4QBbkIv7+AVB3uk22G32OV8N6MyCBCeYfgdUinTaMH7hWsI/Cjm5zcu/9oP4iFiAz02n
 yaXTRbgvn7MruTMK4mHJv33hLxpDpxs/7+hkV8Do+l6N3g2sGVqx47bbrUZ1f80dtAdK
 /jI//XxiT7oim4I5usXzuTPLL2JetqT5PlSzbWRljSwsSjmqUqLCA0rhXGRRryWS5o2Y
 a0NMAPOhZMAyOHMCa3KUkF8GjHd6jN6XDv46bt2IHq5ubTumdf/8Vqz8XBcM86bZ+AOM
 N81Q==
X-Gm-Message-State: AOAM530V0MLzP9pzUZo/UzHNz5o7rKJQTO7dtt6Gyp1keurlhftkJpN6
 s5NRw2y8F1op8tZ+tDesi5qAoI5m02gYjoFpXYPnIioWgC8=
X-Google-Smtp-Source: ABdhPJyJUtP/NBo9GZBq6Vsi8HOKQXtm62SfRUDL19K6OFu6soXa76iRkp6JhZTPBuUs89SZRaEdeOlwOa+PVMxp+U0=
X-Received: by 2002:adf:dd50:: with SMTP id u16mr5171603wrm.419.1604083991480; 
 Fri, 30 Oct 2020 11:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201030101104.2503-1-daniel.vetter@ffwll.ch>
 <20201030101104.2503-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20201030101104.2503-4-daniel.vetter@ffwll.ch>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 Oct 2020 14:53:00 -0400
Message-ID: <CADnq5_OUO4SOuzNH2YKvYbrJ-A_TZq9XeiZeg0ky60Kiy3fo=A@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm: Allow const struct drm_driver
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 6:11 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> It's nice if a big function/ioctl table like this is const. Only
> downside here is that we need a few more #ifdef to paper over the
> differences when CONFIG_DRM_LEGACY is enabled. Maybe provides more
> motivation to sunset that horror show :-)
>
> v2:
> - Fix super important checkpatch warning (Sam)
> - Update the kerneldoc example too (Sam)
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/drm_drv.c | 17 +++++++++++------
>  include/drm/drm_device.h  |  4 ++++
>  include/drm/drm_drv.h     |  5 +++--
>  3 files changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 457ac0f82be2..0371d1f095b2 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -284,7 +284,7 @@ void drm_minor_release(struct drm_minor *minor)
>   *             struct clk *pclk;
>   *     };
>   *
> - *     static struct drm_driver driver_drm_driver = {
> + *     static const struct drm_driver driver_drm_driver = {
>   *             [...]
>   *     };
>   *
> @@ -574,7 +574,7 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>  }
>
>  static int drm_dev_init(struct drm_device *dev,
> -                       struct drm_driver *driver,
> +                       const struct drm_driver *driver,
>                         struct device *parent)
>  {
>         int ret;
> @@ -589,7 +589,11 @@ static int drm_dev_init(struct drm_device *dev,
>
>         kref_init(&dev->ref);
>         dev->dev = get_device(parent);
> +#ifdef CONFIG_DRM_LEGACY
> +       dev->driver = (struct drm_driver *)driver;
> +#else
>         dev->driver = driver;
> +#endif
>
>         INIT_LIST_HEAD(&dev->managed.resources);
>         spin_lock_init(&dev->managed.lock);
> @@ -663,7 +667,7 @@ static void devm_drm_dev_init_release(void *data)
>
>  static int devm_drm_dev_init(struct device *parent,
>                              struct drm_device *dev,
> -                            struct drm_driver *driver)
> +                            const struct drm_driver *driver)
>  {
>         int ret;
>
> @@ -678,7 +682,8 @@ static int devm_drm_dev_init(struct device *parent,
>         return ret;
>  }
>
> -void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
> +void *__devm_drm_dev_alloc(struct device *parent,
> +                          const struct drm_driver *driver,
>                            size_t size, size_t offset)
>  {
>         void *container;
> @@ -713,7 +718,7 @@ EXPORT_SYMBOL(__devm_drm_dev_alloc);
>   * RETURNS:
>   * Pointer to new DRM device, or ERR_PTR on failure.
>   */
> -struct drm_device *drm_dev_alloc(struct drm_driver *driver,
> +struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
>                                  struct device *parent)
>  {
>         struct drm_device *dev;
> @@ -858,7 +863,7 @@ static void remove_compat_control_link(struct drm_device *dev)
>   */
>  int drm_dev_register(struct drm_device *dev, unsigned long flags)
>  {
> -       struct drm_driver *driver = dev->driver;
> +       const struct drm_driver *driver = dev->driver;
>         int ret;
>
>         if (!driver->load)
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index f4f68e7a9149..2c361964aee7 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -83,7 +83,11 @@ struct drm_device {
>         } managed;
>
>         /** @driver: DRM driver managing the device */
> +#ifdef CONFIG_DRM_LEGACY
>         struct drm_driver *driver;
> +#else
> +       const struct drm_driver *driver;
> +#endif
>
>         /**
>          * @dev_private:
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 7af220226a25..cc9da43b6eda 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -516,7 +516,8 @@ struct drm_driver {
>  #endif
>  };
>
> -void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
> +void *__devm_drm_dev_alloc(struct device *parent,
> +                          const struct drm_driver *driver,
>                            size_t size, size_t offset);
>
>  /**
> @@ -549,7 +550,7 @@ void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
>         ((type *) __devm_drm_dev_alloc(parent, driver, sizeof(type), \
>                                        offsetof(type, member)))
>
> -struct drm_device *drm_dev_alloc(struct drm_driver *driver,
> +struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
>                                  struct device *parent);
>  int drm_dev_register(struct drm_device *dev, unsigned long flags);
>  void drm_dev_unregister(struct drm_device *dev);
> --
> 2.28.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
