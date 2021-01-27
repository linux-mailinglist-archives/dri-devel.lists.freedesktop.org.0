Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1875305D80
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 14:47:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADAC6E118;
	Wed, 27 Jan 2021 13:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7EF6E118
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 13:47:16 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id g46so522052ooi.9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 05:47:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQgqmYKIWC6RCQCPkaoQYniBmuiPu1Qb0bETCD5PFVs=;
 b=dvGEV79j3e94zcWNzu7CvDyFSE2tElS0Y3wI7vD4zHAmJFQqdoE7mJYJGknifUZZl/
 s+av8+poK7oxoL36hc7kjnGn5NU4GJPEJt36D9MEV+Exaocj2hdH7OI/S8KTS12Gvw+u
 KEJZGWg8iqzwiYLPGXaVg/ePaC0e9vBK49xulDuFyer6zK6G7lDU78SmZw3WeS+R2hu2
 c/e+DLE2WycQnIh++ydDiWTPXKWFMgX6VGzObOeRlCcNGsa1HHEj9SjGRImB9nTT2Xry
 D3pMO72KAqlSF350iCETeDj6nScxJl/5adxtlRwrND5VWY2B4n8qlIIcx26Sni9FUooc
 oH4A==
X-Gm-Message-State: AOAM533mNpr9bDO9s+ZfzEPTQaNOOQ1dhsTrrJ0YSGhWIGYvUs6Aynis
 3GHSLNMYroypO5N6nXngvnhJsKtdti0MLpNs4Ow=
X-Google-Smtp-Source: ABdhPJwSBSRY8K8eRc/vVhWXi4XvsglGvFgh3RRklMjnRPma72wjmjskEwRrffFLt766yMz7sL3rrB5AlzghXmsbSPw=
X-Received: by 2002:a4a:96b3:: with SMTP id s48mr7749758ooi.11.1611755235898; 
 Wed, 27 Jan 2021 05:47:15 -0800 (PST)
MIME-Version: 1.0
References: <1611752257-150851-1-git-send-email-zhangxuezhi3@gmail.com>
In-Reply-To: <1611752257-150851-1-git-send-email-zhangxuezhi3@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Jan 2021 14:47:04 +0100
Message-ID: <CAMuHMdV=dsLv0stGa8OThOYLz2xG0Gg7EOYuFcKBeu+T_wANuw@mail.gmail.com>
Subject: Re: [PATCH v9] staging: fbtft: add tearing signal detect
To: Carlis <zhangxuezhi3@gmail.com>
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
Cc: driverdevel <devel@driverdev.osuosl.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 mh12gx2825@gmail.com, Greg KH <gregkh@linuxfoundation.org>,
 oliver.graute@kococonnector.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stefano Brivio <sbrivio@redhat.com>, Colin King <colin.king@canonical.com>,
 zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Carlis,

On Wed, Jan 27, 2021 at 2:03 PM Carlis <zhangxuezhi3@gmail.com> wrote:
> From: zhangxuezhi <zhangxuezhi1@yulong.com>
>
> For st7789v ic,add tearing signal detect to avoid screen tearing
>
> Signed-off-by: zhangxuezhi <zhangxuezhi1@yulong.com>
> ---
> v9: change pr_* to dev_*

Thanks for the update!

> --- a/drivers/staging/fbtft/fb_st7789v.c
> +++ b/drivers/staging/fbtft/fb_st7789v.c
> @@ -9,9 +9,12 @@
>  #include <linux/delay.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/mutex.h>
> +#include <linux/interrupt.h>
> +#include <linux/completion.h>
>  #include <linux/module.h>
>  #include <video/mipi_display.h>
> -
> +#include <linux/gpio/consumer.h>
>  #include "fbtft.h"
>
>  #define DRVNAME "fb_st7789v"
> @@ -66,6 +69,32 @@ enum st7789v_command {
>  #define MADCTL_MX BIT(6) /* bitmask for column address order */
>  #define MADCTL_MY BIT(7) /* bitmask for page address order */
>
> +#define SPI_PANEL_TE_TIMEOUT   400
> +static struct mutex te_mutex;/*mutex for tearing line*/
> +static struct completion spi_panel_te;
> +
> +static irqreturn_t spi_panel_te_handler(int irq, void *data)
> +{
> +       complete(&spi_panel_te);
> +       return IRQ_HANDLED;
> +}
> +
> +static void set_spi_panel_te_irq_status(struct fbtft_par *par, bool enable)
> +{
> +       static int te_irq_count;
> +
> +       mutex_lock(&te_mutex);
> +
> +       if (enable) {
> +               if (++te_irq_count == 1)
> +                       enable_irq(gpiod_to_irq(par->gpio.te));
> +       } else {
> +               if (--te_irq_count == 0)
> +                       disable_irq(gpiod_to_irq(par->gpio.te));
> +       }
> +       mutex_unlock(&te_mutex);
> +}
> +
>  /**
>   * init_display() - initialize the display controller
>   *
> @@ -82,6 +111,33 @@ enum st7789v_command {
>   */
>  static int init_display(struct fbtft_par *par)
>  {
> +       int rc;
> +       struct device *dev = par->info->device;
> +
> +       par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0, GPIOD_IN);
> +       if (IS_ERR(par->gpio.te)) {
> +               rc = PTR_ERR(par->gpio.te);
> +               dev_err(par->info->device, "Failed to request te gpio: %d\n", rc);

This also prints an error in case of -EPROBE_DEFER.
dev_err_probe()?

> +               return rc;
> +       }
> +       if (par->gpio.te) {
> +               init_completion(&spi_panel_te);
> +               mutex_init(&te_mutex);
> +               rc = devm_request_irq(dev,
> +                                     gpiod_to_irq(par->gpio.te),
> +                                    spi_panel_te_handler, IRQF_TRIGGER_RISING,
> +                                    "TE_GPIO", par);
> +               if (rc) {
> +                       dev_err(par->info->device, "TE request_irq failed.\n");
> +                       devm_gpiod_put(dev, par->gpio.te);

No need to call devm_gpiod_put() here, as it's managed automatically.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
