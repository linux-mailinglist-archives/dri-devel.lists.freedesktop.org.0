Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B159210AB5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 14:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B226E456;
	Wed,  1 Jul 2020 12:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE78E6E456
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 12:03:45 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id c11so13408879lfh.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 05:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OSGjwWsHm86FcHB9pYMpc/iXM6ZedYAlleUq5mq09D4=;
 b=fnzUkSTw/BvKjdH+K3hAGmGcnf4ZDfuZCZRjH0oEe1vnrncLdAgmwX/5Mfpnos6WrJ
 sRWuNiIS+OpfiOped+nfK0F8VROC/bz56VqVWa93x88mQogd1w2vBh2IVU7Tpjlq0rYh
 WNKDbPXjNNQ41TfHjGpCzZ1O7H5C40aOAjGuzmpKk4hiakoI8jyW79XXvRRppY9RMRbc
 jYBpgu4f6ksy3O3WH3SlofF0vLMc9fCVMu3kgxyAIM7tKtmX+8+Or1wZ6f7BMj2Pm1nk
 +lpPEIPFAn137+REKmsLPVnhyhKf/uqGtXXZortLNEgRa+Lcqn/4PmWmjrTds8WFWfbi
 Fv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OSGjwWsHm86FcHB9pYMpc/iXM6ZedYAlleUq5mq09D4=;
 b=scYgPmDYoWRxw1LZwpBY4CtbWvMGAZr0IiGfl+fsuVu4oruMeQwDMnDewGJYwfHz5J
 10TP9KPZj0JNDb+CRSNz/2hlzuy3tZES1EPtxtsLQe5sCV656xAIW0dpRosMfuMj5jHi
 8FwIrhdwnvEP28DYBXxbs9WFUJ/Bbfwjnd+uKi8VTIH40SnLo9BuXbC+R3zh0ma8sFE1
 HTv6zoNpm9Y2Uk387NAthugSUSXWx3qGvjpcOfH0Jq6hqg7SGxCTRXTDpK4LB/mt/skU
 GVZDIUYWaFYBF+fksWOBOQLmq0BQQlRsTvLpd6Xmq/CqDZZdVFrNtMqtsYb34wlXTlwS
 7HeA==
X-Gm-Message-State: AOAM530JB1cYUHd+ZaZIkPvCxeYdz5nof7mX7YqIm6oYeJLoiowJxsmC
 Tko53fxbf2DBSTOdG4eUuN4H+WuDqg2WBUEs2PI=
X-Google-Smtp-Source: ABdhPJycTEl5wLhzIo3ZM0/yi45nwInLAo9PP0aeZbwujUeW64zdRpaGGyADv8V3Y46fqNgsYkbVbahZYMWreksey0A=
X-Received: by 2002:a19:6b15:: with SMTP id d21mr14889096lfa.42.1593605023927; 
 Wed, 01 Jul 2020 05:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200627232928.696195-1-linus.walleij@linaro.org>
In-Reply-To: <20200627232928.696195-1-linus.walleij@linaro.org>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Wed, 1 Jul 2020 14:03:32 +0200
Message-ID: <CAMeQTsanb3OTML2fymvjCya3Qzhr2nTEFe8JL4Uo=Qku2GK0WQ@mail.gmail.com>
Subject: Re: [PATCH] drm: gma500: Convert to GPIO descriptors
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 28, 2020 at 1:29 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Finalize he conversion of GMA500 to use only GPIO descriptors.
> The GPIO look-up-table is associated with the device directly
> in the GMA500 Medfield chip driver since no explicit platform
> type device (such as in x86/platform/intel-mid) exists: the
> GMA500 probes directly from the PCI device. Apparently GPIOs
> 88 and 34 are used on all of these so just go ahead and

Is 88 meant to be 128 here?

> register those for resetting the DSI pipes.
>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/gma500/mdfld_device.c     | 20 +++++++++
>  drivers/gpu/drm/gma500/mdfld_dsi_dpi.c    |  2 +-
>  drivers/gpu/drm/gma500/mdfld_dsi_output.c | 51 ++++++++++++-----------
>  drivers/gpu/drm/gma500/mdfld_dsi_output.h |  2 +-
>  drivers/gpu/drm/gma500/mdfld_output.h     |  2 +-
>  drivers/gpu/drm/gma500/psb_intel_drv.h    |  1 -
>  6 files changed, 49 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/mdfld_device.c b/drivers/gpu/drm/gma500/mdfld_device.c
> index b718efccdcf2..be9cf6b1e3b3 100644
> --- a/drivers/gpu/drm/gma500/mdfld_device.c
> +++ b/drivers/gpu/drm/gma500/mdfld_device.c
> @@ -6,6 +6,7 @@
>   **************************************************************************/
>
>  #include <linux/delay.h>
> +#include <linux/gpio/machine.h>
>
>  #include <asm/intel_scu_ipc.h>
>
> @@ -505,12 +506,31 @@ static const struct psb_offset mdfld_regmap[3] = {
>         },
>  };
>
> +/*
> + * The GPIO lines for resetting DSI pipe 0 and 2 are available in the
> + * PCI device 0000:00:0c.0 on the Medfield.
> + */
> +static struct gpiod_lookup_table mdfld_dsi_pipe_gpio_table = {
> +       .table  = {
> +               GPIO_LOOKUP("0000:00:0c.0", 128, "dsi-pipe0-reset",
> +                           GPIO_ACTIVE_HIGH),
> +               GPIO_LOOKUP("0000:00:0c.0", 34, "dsi-pipe2-reset",
> +                           GPIO_ACTIVE_HIGH),
> +               { },
> +       },
> +};
> +
>  static int mdfld_chip_setup(struct drm_device *dev)
>  {
>         struct drm_psb_private *dev_priv = dev->dev_private;
>         if (pci_enable_msi(dev->pdev))
>                 dev_warn(dev->dev, "Enabling MSI failed!\n");
>         dev_priv->regmap = mdfld_regmap;
> +
> +       /* Associate the GPIO lines with the DRM device */
> +       mdfld_dsi_pipe_gpio_table.dev_id = dev_name(dev->dev);
> +       gpiod_add_lookup_table(&mdfld_dsi_pipe_gpio_table);
> +
>         return mid_chip_setup(dev);
>  }
>
> diff --git a/drivers/gpu/drm/gma500/mdfld_dsi_dpi.c b/drivers/gpu/drm/gma500/mdfld_dsi_dpi.c
> index c976a9dd9240..ae1223f631a7 100644
> --- a/drivers/gpu/drm/gma500/mdfld_dsi_dpi.c
> +++ b/drivers/gpu/drm/gma500/mdfld_dsi_dpi.c
> @@ -955,7 +955,7 @@ struct mdfld_dsi_encoder *mdfld_dsi_dpi_init(struct drm_device *dev,
>
>                 /* panel hard-reset */
>                 if (p_funcs->reset) {
> -                       ret = p_funcs->reset(pipe);
> +                       ret = p_funcs->reset(dev, pipe);
>                         if (ret) {
>                                 DRM_ERROR("Panel %d hard-reset failed\n", pipe);
>                                 return NULL;
> diff --git a/drivers/gpu/drm/gma500/mdfld_dsi_output.c b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
> index f350ac1ead18..c9478261964a 100644
> --- a/drivers/gpu/drm/gma500/mdfld_dsi_output.c
> +++ b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
> @@ -28,6 +28,7 @@
>  #include <linux/delay.h>
>  #include <linux/moduleparam.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/gpio/consumer.h>
>
>  #include <asm/intel_scu_ipc.h>
>
> @@ -432,42 +433,42 @@ static int mdfld_dsi_get_default_config(struct drm_device *dev,
>         return 0;
>  }
>
> -int mdfld_dsi_panel_reset(int pipe)
> +int mdfld_dsi_panel_reset(struct drm_device *ddev, int pipe)
>  {
> -       unsigned gpio;
> -       int ret = 0;
> -
> +       struct device *dev = ddev->dev;
> +       struct gpio_desc *gpiod;
> +
> +       /*
> +        * Raise the GPIO reset line for the corresponding pipe to HIGH,
> +        * this is probably because it is active low so this takes the
> +        * respective pipe out of reset. (We have no code to put it back
> +        * into reset in this driver.)
> +        */
>         switch (pipe) {
>         case 0:
> -               gpio = 128;
> +               gpiod = gpiod_get(dev, "dsi-pipe0-reset", GPIOD_OUT_HIGH);
> +               if (IS_ERR(gpiod))
> +                       return PTR_ERR(gpiod);
>                 break;
>         case 2:
> -               gpio = 34;
> +               gpiod = gpiod_get(dev, "dsi-pipe2-reset", GPIOD_OUT_HIGH);
> +               if (IS_ERR(gpiod))
> +                       return PTR_ERR(gpiod);
>                 break;
>         default:
> -               DRM_ERROR("Invalid output\n");
> +               DRM_DEV_ERROR(dev, "Invalid output pipe\n");
>                 return -EINVAL;
>         }
> +       gpiod_put(gpiod);
>
> -       ret = gpio_request(gpio, "gfx");
> -       if (ret) {
> -               DRM_ERROR("gpio_rqueset failed\n");
> -               return ret;
> -       }
> -
> -       ret = gpio_direction_output(gpio, 1);
> -       if (ret) {
> -               DRM_ERROR("gpio_direction_output failed\n");
> -               goto gpio_error;
> -       }
> +       /* Always read the pipe0 GPIO line, FIXME: explain why! */

Probably needed for flushing the posted write. If I understand PCI
specs correctly, reading pipe0 will flush all posted writes on the
device so both pipes would get flushed.

How about:
/* Flush posted writes on device */

If you address the above:
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> +       gpiod = gpiod_get(dev, "dsi-pipe0-reset", GPIOD_ASIS);
> +       if (IS_ERR(gpiod))
> +               return PTR_ERR(gpiod);
> +       gpiod_get_value(gpiod);
> +       gpiod_put(gpiod);
>
> -       gpio_get_value(128);
> -
> -gpio_error:
> -       if (gpio_is_valid(gpio))
> -               gpio_free(gpio);
> -
> -       return ret;
> +       return 0;
>  }
>
>  /*
> diff --git a/drivers/gpu/drm/gma500/mdfld_dsi_output.h b/drivers/gpu/drm/gma500/mdfld_dsi_output.h
> index 0cccfe400a98..5c0db3c2903f 100644
> --- a/drivers/gpu/drm/gma500/mdfld_dsi_output.h
> +++ b/drivers/gpu/drm/gma500/mdfld_dsi_output.h
> @@ -372,6 +372,6 @@ extern void mdfld_dsi_controller_init(struct mdfld_dsi_config *dsi_config,
>
>  extern int mdfld_dsi_get_power_mode(struct mdfld_dsi_config *dsi_config,
>                                         u32 *mode, bool hs);
> -extern int mdfld_dsi_panel_reset(int pipe);
> +extern int mdfld_dsi_panel_reset(struct drm_device *dev, int pipe);
>
>  #endif /*__MDFLD_DSI_OUTPUT_H__*/
> diff --git a/drivers/gpu/drm/gma500/mdfld_output.h b/drivers/gpu/drm/gma500/mdfld_output.h
> index 17a944d70add..37a516cc56be 100644
> --- a/drivers/gpu/drm/gma500/mdfld_output.h
> +++ b/drivers/gpu/drm/gma500/mdfld_output.h
> @@ -54,7 +54,7 @@ struct panel_funcs {
>         const struct drm_encoder_helper_funcs *encoder_helper_funcs;
>         struct drm_display_mode * (*get_config_mode)(struct drm_device *);
>         int (*get_panel_info)(struct drm_device *, int, struct panel_info *);
> -       int (*reset)(int pipe);
> +       int (*reset)(struct drm_device *, int);
>         void (*drv_ic_init)(struct mdfld_dsi_config *dsi_config, int pipe);
>  };
>
> diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
> index fb601983cef0..9221d1f545b0 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_drv.h
> +++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
> @@ -13,7 +13,6 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> -#include <linux/gpio.h>
>  #include "gma_display.h"
>
>  /*
> --
> 2.25.4
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
