Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3060A20B503
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 17:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEF488DF5;
	Fri, 26 Jun 2020 15:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296FB88DF5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 15:43:12 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id w10so4943299oih.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 08:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZFS0A0GALa85jcwxFWd7qm3+ETIaduqsmP4v2A7mkd4=;
 b=Qj04K42OEL1U6YokrVFQSaJee/nxDtsDndF/62pnn54yCKS5Q78giTBd2/EY+gmrTl
 WMsQYPVqwcQlp6VdyB8tStx6aqjFuYQPZjcR6QftP01Uuah8gsTVLrUj1ZHeiKuoSPyt
 CIxV6qoS4U+PEGbRluf1H4bCabOi7Lm9w4DZj3N3HqCQ2WwTHhzapNDSkEI/eLktqOEf
 3TnkJcTuU5XdfWY0uuyZg6mJObBUo2RCMJrA3vbT7VlzDCc/TmMXlS4G280mVxbZYHTT
 tG9TnRcLkYMmY+mN1pfcQMxa05xurRHzL/VVFybZqxluwC9H/jpKNZypjUJlBTd3Cwdo
 1bdQ==
X-Gm-Message-State: AOAM533H1vsN3yg6R4F2mnbNFpObdmWjhq0CgYAIQrG+lGz0ovqqZfFG
 8rX3IVZOUNMm+U9qz5KjRoX5nC9d4vKDopI9x+I=
X-Google-Smtp-Source: ABdhPJypLeDV2LckMOXvyTvsspyQajm/zBr0CubHbVFZYs8R4ojC/YhlMLPDnsf5S9DcOktseIn1onDAM7HB1zN92TM=
X-Received: by 2002:a05:6808:99b:: with SMTP id
 a27mr2849111oic.68.1593186191326; 
 Fri, 26 Jun 2020 08:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200626100110eucas1p2c5b91f2c98a5c6e5739f5af3207d192e@eucas1p2.samsung.com>
 <20200626100103.18879-1-a.hajda@samsung.com>
 <20200626100103.18879-3-a.hajda@samsung.com>
In-Reply-To: <20200626100103.18879-3-a.hajda@samsung.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 26 Jun 2020 17:43:00 +0200
Message-ID: <CAJZ5v0g72gY70aKC9DZh=GH6dvGesV5ug0Dc8i0YbX_X1bkCTQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] driver core: add deferring probe reason to
 devices_deferred property
To: Andrzej Hajda <a.hajda@samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 12:01 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> /sys/kernel/debug/devices_deferred property contains list of deferred devices.
> This list does not contain reason why the driver deferred probe, the patch
> improves it.
> The natural place to set the reason is probe_err function introduced recently,
> ie. if probe_err will be called with -EPROBE_DEFER instead of printk the message
> will be attached to deferred device and printed when user read devices_deferred
> property.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>

> ---
>  drivers/base/base.h |  3 +++
>  drivers/base/core.c |  8 ++++++--
>  drivers/base/dd.c   | 23 ++++++++++++++++++++++-
>  3 files changed, 31 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index 95c22c0f9036..6954fccab3d7 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -93,6 +93,7 @@ struct device_private {
>         struct klist_node knode_class;
>         struct list_head deferred_probe;
>         struct device_driver *async_driver;
> +       char *deferred_probe_reason;
>         struct device *device;
>         u8 dead:1;
>  };
> @@ -134,6 +135,8 @@ extern void device_release_driver_internal(struct device *dev,
>  extern void driver_detach(struct device_driver *drv);
>  extern int driver_probe_device(struct device_driver *drv, struct device *dev);
>  extern void driver_deferred_probe_del(struct device *dev);
> +extern void device_set_deferred_probe_reson(const struct device *dev,
> +                                           struct va_format *vaf);
>  static inline int driver_match_device(struct device_driver *drv,
>                                       struct device *dev)
>  {
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 3a827c82933f..fee047f03681 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -3963,6 +3963,8 @@ define_dev_printk_level(_dev_info, KERN_INFO);
>   * This helper implements common pattern present in probe functions for error
>   * checking: print debug or error message depending if the error value is
>   * -EPROBE_DEFER and propagate error upwards.
> + * In case of -EPROBE_DEFER it sets also defer probe reason, which can be
> + * checked later by reading devices_deferred debugfs attribute.
>   * It replaces code sequence:
>   *     if (err != -EPROBE_DEFER)
>   *             dev_err(dev, ...);
> @@ -3984,10 +3986,12 @@ int dev_err_probe(const struct device *dev, int err, const char *fmt, ...)
>         vaf.fmt = fmt;
>         vaf.va = &args;
>
> -       if (err != -EPROBE_DEFER)
> +       if (err != -EPROBE_DEFER) {
>                 dev_err(dev, "error %d: %pV", err, &vaf);
> -       else
> +       } else {
> +               device_set_deferred_probe_reson(dev, &vaf);
>                 dev_dbg(dev, "error %d: %pV", err, &vaf);
> +       }
>
>         va_end(args);
>
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 9a1d940342ac..dd5683b61f74 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -27,6 +27,7 @@
>  #include <linux/async.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pinctrl/devinfo.h>
> +#include <linux/slab.h>
>
>  #include "base.h"
>  #include "power/power.h"
> @@ -136,6 +137,8 @@ void driver_deferred_probe_del(struct device *dev)
>         if (!list_empty(&dev->p->deferred_probe)) {
>                 dev_dbg(dev, "Removed from deferred list\n");
>                 list_del_init(&dev->p->deferred_probe);
> +               kfree(dev->p->deferred_probe_reason);
> +               dev->p->deferred_probe_reason = NULL;
>         }
>         mutex_unlock(&deferred_probe_mutex);
>  }
> @@ -211,6 +214,23 @@ void device_unblock_probing(void)
>         driver_deferred_probe_trigger();
>  }
>
> +/**
> + * device_set_deferred_probe_reson() - Set defer probe reason message for device
> + * @dev: the pointer to the struct device
> + * @vaf: the pointer to va_format structure with message
> + */
> +void device_set_deferred_probe_reson(const struct device *dev, struct va_format *vaf)
> +{
> +       const char *drv = dev_driver_string(dev);
> +
> +       mutex_lock(&deferred_probe_mutex);
> +
> +       kfree(dev->p->deferred_probe_reason);
> +       dev->p->deferred_probe_reason = kasprintf(GFP_KERNEL, "%s: %pV", drv, vaf);
> +
> +       mutex_unlock(&deferred_probe_mutex);
> +}
> +
>  /*
>   * deferred_devs_show() - Show the devices in the deferred probe pending list.
>   */
> @@ -221,7 +241,8 @@ static int deferred_devs_show(struct seq_file *s, void *data)
>         mutex_lock(&deferred_probe_mutex);
>
>         list_for_each_entry(curr, &deferred_probe_pending_list, deferred_probe)
> -               seq_printf(s, "%s\n", dev_name(curr->device));
> +               seq_printf(s, "%s\t%s", dev_name(curr->device),
> +                          curr->device->p->deferred_probe_reason ?: "\n");
>
>         mutex_unlock(&deferred_probe_mutex);
>
> --
> 2.17.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
