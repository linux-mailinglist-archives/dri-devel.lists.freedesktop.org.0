Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980ED305653
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 10:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FE46E5C3;
	Wed, 27 Jan 2021 09:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF676E5BB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 09:00:25 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id p5so1410997oif.7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 01:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+6RprSXYvoMC4UVhQo7yoMn9BtMVGW5pIMAX/4sOotk=;
 b=Wr1lKpjVvhiuf8PB+6yI+HvZ5Z6QygVA7NL2nYkw+4WvXIWvNiVRS1U76RBuXAScwz
 VBthPAKjyBuMzVxjpGfuZrbVvZ7rimkPvs+a/lw6hTa+Z1i35NwEc+4ZJerqeNj148Ns
 eZDcCA9QUF/cAOKSVfGgB28EYlZhOs3nyPyWJz2HrkoMhUoPJTJPlBKEMDgXnK4RNeGZ
 9wNRnHPhXzfVKejhHqKYO6aPHH+/9p2n8uBloHetLTRefqufvq0h+RzFT7J9XfN5+P1p
 71mmdF4DeQtR2l5WUqtw3zvDAIbZYJCwGPoMQ3nBN5jyvkoVEIE50HlyI4wpGXFz5FGM
 F/nQ==
X-Gm-Message-State: AOAM530IXSZRkiHgbO0qHVKSIHF/fz9laZ+llvZd+7hzDzWfkgIIE3Uw
 BTAMJsj0k+9CZJviASGDWtqyDAEJqmXrby7Sih0=
X-Google-Smtp-Source: ABdhPJyoJzAs8/wKsxJ/K1jb7LeAbfGa10f2NI3SY3Q2AP1Px64nQ1dkLKkwuvc9IT5UbP+RktcFytWHSl+rDLQ8KQg=
X-Received: by 2002:a54:4e88:: with SMTP id c8mr2476402oiy.148.1611738024632; 
 Wed, 27 Jan 2021 01:00:24 -0800 (PST)
MIME-Version: 1.0
References: <1611732502-99639-1-git-send-email-zhangxuezhi3@gmail.com>
In-Reply-To: <1611732502-99639-1-git-send-email-zhangxuezhi3@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Jan 2021 10:00:13 +0100
Message-ID: <CAMuHMdV5VxNBNV-UMswKKZmQRFUvG+pnBbOOW8XJT8pbbvmp5Q@mail.gmail.com>
Subject: Re: [PATCH v6] fbtft: add tearing signal detect
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

On Wed, Jan 27, 2021 at 9:52 AM Carlis <zhangxuezhi3@gmail.com> wrote:
> From: zhangxuezhi <zhangxuezhi1@yulong.com>
>
> For st7789v ic,add tearing signal detect to avoid screen tearing
>
> Signed-off-by: zhangxuezhi <zhangxuezhi1@yulong.com>

Thanks for your patch!

> --- a/drivers/staging/fbtft/fb_st7789v.c
> +++ b/drivers/staging/fbtft/fb_st7789v.c

> @@ -82,6 +111,34 @@ enum st7789v_command {
>   */
>  static int init_display(struct fbtft_par *par)
>  {
> +       int rc;
> +       struct device *dev = par->info->device;
> +
> +       par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0, GPIOD_IN);
> +       if (IS_ERR(par->gpio.te)) {
> +               rc = PTR_ERR(par->gpio.te);
> +               pr_err("Failed to request te gpio: %d\n", rc);
> +               par->gpio.te = NULL;

Errors (e.g. -EPROBE_DEFER) should be propagated upstream,
not ignored.

> +       }
> +       if (par->gpio.te) {
> +               init_completion(&spi_panel_te);
> +               mutex_init(&te_mutex);
> +               rc = devm_request_irq(dev,
> +                                     gpiod_to_irq(par->gpio.te),
> +                                    spi_panel_te_handler, IRQF_TRIGGER_RISING,
> +                                    "TE_GPIO", par);
> +               if (rc) {
> +                       pr_err("TE request_irq failed.\n");
> +                       devm_gpiod_put(dev, par->gpio.te);
> +                       par->gpio.te = NULL;

Errors (e.g. -EPROBE_DEFER) should be propagated upstream,
not ignored.

> +               } else {
> +                       disable_irq_nosync(gpiod_to_irq(par->gpio.te));
> +                       pr_info("TE request_irq completion.\n");
> +               }
> +       } else {
> +               pr_info("%s:%d, TE gpio not specified\n",
> +                       __func__, __LINE__);
> +       }
>         /* turn off sleep mode */
>         write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
>         mdelay(120);

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
