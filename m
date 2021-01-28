Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB44307869
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 15:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D046E980;
	Thu, 28 Jan 2021 14:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9966E980
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 14:44:19 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id s24so3965689pjp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 06:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=avzsR9HHm+QL99Sb8COQafM2D/UB+zvy2SDex57jg+0=;
 b=eXPiZkGMap/Z5070F49FN5G/JWvZTAyrzydO7aluQ4YdPKVTMjqoQAhTijEoidHgT2
 gnL3A6lvV0vgnmsdRENwEFqU8LUBpyg2T8tQHJy2qGiFpfIl7jLZcutY6shsYVDK1iO3
 +i9wott36RmTUX7SUEKypiTDIHvZ55/OB6SeO9y3vV4hHz9r5SjGS/9aU8qzp6Y6FTMZ
 4tuvoUXs5SA5d0C42SQWInTx1fbKvT+Qf6gNOPXoT8J0QVmqhB7kzXifklcnxn8PO8fB
 VZeVpLHbKWU2xliR4ivEVyUe+jkg2zFjJpRdFzq9LlNzj9m57aj/pB07yjhPr1qg3Yio
 xLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=avzsR9HHm+QL99Sb8COQafM2D/UB+zvy2SDex57jg+0=;
 b=QKl2gjU2YGLZlYn99UYpquwGJzCB9fytOUXYqNNKL1SmNQT8hjl2fFgXhadvdNtF7q
 Ohs2IJkqWoMAL7ZrA7aLLQROuYQFioxIi4q5DO54BMqByn82S4mbyKqEjMet0Ff3YLB1
 DkYOkNijW/f7ZvEaKfpBoVuKaY2Z+3HWbRJx5lXTAi3uP/ouPwR449tLcfFm3r0kVu5o
 YFaw1HoPlzJTp75X2nj8Hf2UUwzFTvh5BEskxqa/BFGLOAK7S6rP/eH0ecDUbqSch91z
 GF3OQCWQZW3HTQTHladzvxhjPfYiiO8W9yetqor6Z12vD3Q9irkxr6a2Fk2o5AUMMS8f
 i9EQ==
X-Gm-Message-State: AOAM532K74j20lIMJ8By51m9lwWET3lyD8E95auBcqeS1BfQ9zRvBh8D
 nY6y2r4zOABAf4FXDT1ik2qzq7l3x5W4S62DJD4hMbxQ5u5CDnaM
X-Google-Smtp-Source: ABdhPJxdWZlfKzAXL6EI4mZXjZ6Qyag0y/Kfcll/RaipN/m7rOKpPNtVy7DUEFkxq10YSC0k4n+LayvZfsvZxen34VA=
X-Received: by 2002:a17:902:758b:b029:df:d1f6:9af9 with SMTP id
 j11-20020a170902758bb02900dfd1f69af9mr16603032pll.21.1611845058615; Thu, 28
 Jan 2021 06:44:18 -0800 (PST)
MIME-Version: 1.0
References: <1611838435-151774-1-git-send-email-zhangxuezhi3@gmail.com>
 <CAHp75Vd=ijxnamuSYuxNLeyhGMCod=HaXWrQ0W0+3QCsQAychg@mail.gmail.com>
In-Reply-To: <CAHp75Vd=ijxnamuSYuxNLeyhGMCod=HaXWrQ0W0+3QCsQAychg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 28 Jan 2021 16:44:02 +0200
Message-ID: <CAHp75VcRxPVs0KHwaY8QZima489D2_hntuW0eUqdfK8HJ-gnKA@mail.gmail.com>
Subject: Re: [PATCH v12] staging: fbtft: add tearing signal detect
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

On Thu, Jan 28, 2021 at 4:33 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jan 28, 2021 at 2:58 PM Carlis <zhangxuezhi3@gmail.com> wrote:

...

> Taking all together you probably need to create a helper and use it
> inside init_display(), like
>
> static int init_tearing_effect_line(struct fbtft_par *par)
> {
>   struct device *dev = par->info->device;
>   struct gpio_desc *te;
>   int irq, rc;
>
>   te = gpiod_get_optional(dev, "te", GPIOD_IN);
>   if (IS_ERR(te))
>            return dev_err_probe(dev, PTR_ERR(te), "Failed to request
> te GPIO\n");

Sorry, here I missed the following:

  /* Absence of TE IRQ is not critical */
  if (!te)
    return 0;

>   irq = gpiod_to_irq(te); // this value you have to save in the
> driver's (per device) data structure.
>
>   /* GPIO is locked as an IRQ, we may drop the reference */
>   gpiod_put(te);

...and here:

  if (irq < 0)
    return irq;

>   init_completion(&spi_panel_te); // should be in the (per device)
> data structure
>   rc = devm_request_irq(dev, irq,  spi_panel_te_handler,
> IRQF_TRIGGER_RISING, "TE_GPIO", par);
>   if (rc)
>                 return dev_err_probe(dev, rc, "TE IRQ request failed.\n");
>   disable_irq_nosync(irq);
>   return irq;
> }

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
