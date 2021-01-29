Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 333C8308985
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 15:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5433C6EB48;
	Fri, 29 Jan 2021 14:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EC76EB48
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 14:26:29 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id t25so6798718pga.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 06:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gKot+C+cg9+Ev01rXvdXGRqtLzrKZ52Ei9azuadVGM0=;
 b=cb3sJYS3AAfqMFJCaxm189bXwU9JelSPPPfrbabQVUOnvVfVbq+aWPrpaIlSUT3bxK
 yfUqS8ONtfTLFnxvbcGCWjrWUHtg9wv+g1iKXsf7mO64p5EzBch2dGEBja01VaXwXusl
 SoW0JCnbWWt2YQXSusEFVa4BSE+KHjMVHcdjKB2LZyKeMdUtH3N0Ue126NqKuZ596Dpk
 idogO8YhA1EUer1ZdXv8ItElSGFgdBqZznkVi7aFp2510rSr8n8GG05UYd1Awm493NVe
 OSI+VnTnqgOAsdfxABHcrE+tqrxtVuGD/xbRO8kwD9ce4ZM84HaggsyJjDFj9MvXyGbD
 tttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gKot+C+cg9+Ev01rXvdXGRqtLzrKZ52Ei9azuadVGM0=;
 b=GdSwwpNiIfI9bz+9i2mG2WnNebfCc+EB6cYuelWtwFBlsIKbZBgS1+HnVpQEHXpxvz
 4QUDJd3R+hLhE2bhyVlYGMQ8fZrRWaiV2vT9ERu45yrNbdCKSDzeAKbJ/fEoxFDtuwRx
 GQHlekB8NYxfIRjbfrC1+7Sv7EU2S1mpeX8e0jjElehdWgl+omyBoxFcVN4ZkPKOvT6U
 jaNiKKQQyTDXS96WQ8u6ailn/pQPuOuVHjSE7weVWpkU8Y9KqazOnjh7h2TBWziTVg9W
 bbrQ3HE3UPVP4OxIDWik+Xzg0uA02NlTQettf0lqloXjYCesWlQME1EcBDm8+lLPIVDZ
 VvQw==
X-Gm-Message-State: AOAM531KjrBfTkvabvBspy27DtjBjvL0OOVtCz30wu1wEIjHJ4CTKHK7
 Sy+G10RgIoYiXs5HP0OXRm7lJHjnLd1/iHi8Q2U=
X-Google-Smtp-Source: ABdhPJzJzWgnRosOtmIuUA7/LBUAIjwTZ2XBI5qt5CZfUrKcAqfeRuHPYgCyKUYhqEAxYFypiWQyKKnQjTKwybA/ios=
X-Received: by 2002:a63:e50:: with SMTP id 16mr5000762pgo.74.1611930389189;
 Fri, 29 Jan 2021 06:26:29 -0800 (PST)
MIME-Version: 1.0
References: <1611838435-151774-1-git-send-email-zhangxuezhi3@gmail.com>
 <CAHp75Vd=ijxnamuSYuxNLeyhGMCod=HaXWrQ0W0+3QCsQAychg@mail.gmail.com>
 <20210129130110.00003bb1@gmail.com>
 <CAHp75Vdi4H_zY3+QPSq_wmdf20B9xPeqsOT10JHfMLJESX77gA@mail.gmail.com>
 <20210129215638.000047b0@gmail.com>
In-Reply-To: <20210129215638.000047b0@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 29 Jan 2021 16:26:12 +0200
Message-ID: <CAHp75VcdOibSRuSBZYhFtEcVxuammYMfcnrUQGvS6ttArFxj6g@mail.gmail.com>
Subject: Re: [PATCH v12] staging: fbtft: add tearing signal detect
To: carlis <zhangxuezhi3@gmail.com>
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
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Deepak R Varma <mh12gx2825@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 oliver.graute@kococonnector.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stefano Brivio <sbrivio@redhat.com>, Colin King <colin.king@canonical.com>,
 zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 3:56 PM carlis <zhangxuezhi3@gmail.com> wrote:
> On Fri, 29 Jan 2021 12:23:08 +0200
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

We are almost there, I have no idea what Noralf or others are going to
say though.

...

> Hi, I apologize for what I said in the previous two emails. I missed
> one email you sent before, and now I probably understand what you
> meant. Here is a version I modified according to your suggestion:
>
> From 399e7fb91d1dcba4924cd38cc8283393c80b97e4 Mon Sep 17 00:00:00 2001
> From: Carlis <zhangxuezhi1@yulong.com>
> Date: Sun, 24 Jan 2021 22:43:21 +0800
> Subject: [PATCH v13] staging: fbtft: add tearing signal detect
>
> For st7789v IC,when we need continuous full screen refresh, it is best

Missed space after comma.

> to wait for the tearing effect line signal arrive to avoid screen

to arrive

> tearing.

...

> +#define PANEL_TE_TIMEOUT_MS  34 /* 60Hz for 16.6ms, configured as
> 2*16.6ms */ +

Move comment before the definition
/* comment */
#define DEFINITION

Also consider to use 33 ms as closest to what you mentioned in the comment.
Or leave it with mention that you are using ceil() value.

...

> +/**
> + * init_tearing_effect_line() - init tearing effect line

> + *

As per a few previous reviews.
Okay, I have noticed that the existing kernel-doc is written like
this, but it doesn't prevent you from avoiding this little mistake.

> + * @par: FBTFT parameter object
> + *
> + * Return: 0 on success, or a negative error code otherwise.
> + */
> +static int init_tearing_effect_line(struct fbtft_par *par)
> +{
> +       struct device *dev = par->info->device;
> +       struct gpio_desc *te;
> +       int rc;
> +
> +       te = gpiod_get_optional(dev, "te", GPIOD_IN);
> +       if (IS_ERR(te))
> +               return dev_err_probe(dev, PTR_ERR(te), "Failed to
> request te GPIO\n"); +

Below is okay, but needs a comment explaining why we return a success.

> +       if (!te)
> +               return 0;
> +
> +       par->irq_te = gpiod_to_irq(te);
> +
> +       /* GPIO is locked as an IRQ, we may drop the reference */
> +       gpiod_put(te);
> +
> +       if (par->irq_te < 0)
> +               return par->irq_te;

I recommend using a temporary variable. In such a case you won't need
to specifically check for negative error code. So, something like

int irq;

irq = ...

if (irq < 0)
  return irq;

->irq_te = irq;

> +       init_completion(&par->panel_te);
> +       rc = devm_request_irq(dev, par->irq_te, panel_te_handler,
> +                             IRQF_TRIGGER_RISING, "TE_GPIO", par);

Right. Now it needs a comment explaining the choice of rising edge type of IRQ.

> +       if (rc)
> +               return dev_err_probe(dev, rc, "TE IRQ request
> failed.\n"); +
> +       disable_irq_nosync(par->irq_te);
> +
> +       return 0;
> +}

...

> +       rc = init_tearing_effect_line(par);

> +       if (rc < 0)

Here is no need to specifically check against less than 0,
  if (ret)
will work nicely.

> +               return rc;

...

> +       if (par->irq_te)
> +               write_reg(par, MIPI_DCS_SET_TEAR_ON, 0x00);

Do you need to call MIPI_DCS_SET_TEAR_SCANLINE in this case?

Alos, when there is no IRQ, shouldn't we explicitly call
               write_reg(par, MIPI_DCS_SET_TEAR_OFF);
?

...

>  /**
> + * st7789v_write_vmem16_bus8() - write data to display

> + *

Redundant.

> + * @par: FBTFT parameter object
> + * @offset: offset from screen_buffer
> + * @len: the length of data to be written
> + *

> + * 16 bit pixel over 8-bit databus

Write 16-bit pixels over 8-bit data bus.

> + * Return: 0 on success, or a negative error code otherwise.
> + */

...

> +       if (par->irq_te) {
> +               enable_irq(par->irq_te);
> +               reinit_completion(&par->panel_te);
> +               ret = wait_for_completion_timeout(&par->panel_te,
> +
> msecs_to_jiffies(PANEL_TE_TIMEOUT_MS));
> +               if (ret == 0)
> +                       dev_err(dev, "wait panel TE time out\n");

timeout

> +
> +               disable_irq(par->irq_te);
> +       }

...

> + * @panel_te: completion for panel te line

TE line

> + * @irq_te: LCD Chip tearing effect line

"Linux IRQ for LCD..."

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
