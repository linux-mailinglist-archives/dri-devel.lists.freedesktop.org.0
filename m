Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34448BBE988
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 18:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845F910E36D;
	Mon,  6 Oct 2025 16:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="chH+CwKH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4A910E36D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 16:10:28 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-5c7fda918feso5594618137.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 09:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759767027; x=1760371827; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sns+z5Mv33hVtLxV8rlbvAVv+VeJiohyhxaGcNY7H14=;
 b=chH+CwKHk3cC1wxWDeuHuFTelglM5Kf7J+lF1h4ZsnEZV7UAon8RxpxZJ+0Lz9x2Wd
 DQmaB0msfTwlSK+L1RCS8qaBhGlKmMDr/1CxftkqoL4ag4ESQKS7Se4302HL6NPco6qx
 1UPzOrxUQyoBwrqxuWItPjNu9RS7647UtrAApNvulx1o3nqhdq3HGNDtDhNzaLff2z8o
 CFSxXOPWsdts0gwlMZri1UoDvMwTBpYW9Qkx99z6xkeceSUKsQhknedr/AsLjrSj1gwz
 9O60bbm6yWUA3NUqG0Yas+Qh7zsJdXS7tOuVduoEeqePNdTPZho2LIYdrUIne6iAYs3U
 gu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759767027; x=1760371827;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sns+z5Mv33hVtLxV8rlbvAVv+VeJiohyhxaGcNY7H14=;
 b=Zf1mJe4QTU/ZDBgEDi0gqmLCAJFP34UoY6k9Kw7ZF8cd4kE8OVpiST5vvLndTFKKQ6
 6H78/Tth+UafueEyLDs99TDOxWYVU8+Jh6tOYOz6sebW5wVmQDiVx0yDbn56RlbLPJYf
 +53HTJ5W3XL0XSriVnTPH6+Rd4/gJUIYpgpyrQdeZ2xnBh3/tv0euh/xy0XrXukhCTbj
 sObv1ye3/+No4mNByeXoApvKAbfDWF6MtbbIGULQ7EG+q72JhfPQjnAr0Q5o5sJIk4d3
 +ivktyI95Ef1mi9RYG0kobobHkPZGE+k3pVuxi+AJuLHK/ox20xV0Z1iMrpeF8ffKrQ7
 A7Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2mpjC4aMJQMIzPyH8+6910EukMXUq4CM5Q87LkcK7FGb3OK6C1YcTvGQRsyrmJ+ETqg3x0dM5hP8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf0NPnKg7Mi1JarMGr10cxc6+C+qfiBIxAg+0FSd8JKW+BOV9i
 YghzPM5mNIHR7uSNEfjPIiOg82Act8Pqcl0SNhDmeiFSiqKuI9Dol6qcIcesvcSAG6LcNC0jyYd
 Q8Wu7TfhtFYNYUp0op3Jl/Kl2O2lyim0=
X-Gm-Gg: ASbGnctHsftidUgRrNnoSwrEzy2B4N5HwuyW/QB68aV8EIDMOyFPLstHp1fWIktLTUx
 up5/MEwlHJ9brPihLNSDSUmQetft/zqPuSzwX6Ve4dEED91x6lqgMdgWdi6cRnEjYBmkbVQ6I34
 YC+xucH9vpgCmO15UzJYuPGMOR9CbL6NED/9Sna33z+dKVUMqnJKKYw4JpgcRhP3wE/JjuQE/U9
 dfRMkEuoTP2QkwaQpRaIg0MxiL9STx+o+K1R7gXpg==
X-Google-Smtp-Source: AGHT+IGx2FWJKb95FW2SfxczsReiCSn/kQDzAgvpgQVCOUkA5uaUj6QL1gZm/DDn/MBdaheqD1T6ycaBXstgwm/g/6M=
X-Received: by 2002:a05:6102:1613:b0:533:ff66:696d with SMTP id
 ada2fe7eead31-5d41d0fd7efmr5390644137.23.1759767027433; Mon, 06 Oct 2025
 09:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251005173812.1169436-1-rampxxxx@gmail.com>
 <ewca4jzmahwdl47rbojxtynbizu2vuompjxrprsz7aelovnvao@kzpxjjbjj6px>
In-Reply-To: <ewca4jzmahwdl47rbojxtynbizu2vuompjxrprsz7aelovnvao@kzpxjjbjj6px>
From: Javier Garcia <rampxxxx@gmail.com>
Date: Mon, 6 Oct 2025 18:10:16 +0200
X-Gm-Features: AS18NWB4fZelcAzqnM_-bbbpZoWXlfxaoLs_XEpCmyOIHmZJDiAtcegNgh2-OWk
Message-ID: <CABPJ0vjtr2e=PMPF7AAi-Q=CrwgdHoO6HDb+G8PWF8T6b2_6Vw@mail.gmail.com>
Subject: Re: [PATCH] fbdev: mb862xxfbdrv: Make CONFIG_FB_DEVICE optional
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: deller@gmx.de, tzimmermann@suse.de, linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hello.

On Mon, 6 Oct 2025 at 10:07, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Sun, Oct 05, 2025 at 07:38:12PM +0200, Javier Garcia wrote:
> > This patch wraps the relevant code blocks with #ifdef CONFIG_FB_DEVICE,
> > allowing the driver to be built and used even if CONFIG_FB_DEVICE is no=
t selected.
> >
> > The sysfs only give access to show some controller and cursor registers=
 so
> > it's not needed to allow driver works correctly.
> >
> > Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
>
> I don't understand this patch. CONFIG_FB_DEVICE is about legacy /dev/fb*
> stuff, and this patch make the creation of a sysfs file dependent on
> that.

This is part of the TODO
https://www.kernel.org/doc/html/latest/gpu/todo.html#remove-driver-dependen=
cies-on-fb-device

I think the idea is to make the driver independent of CONFIG_FB_DEVICE .

>
> > diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video=
/fbdev/mb862xx/mb862xxfbdrv.c
> > index ade88e7bc760..a691a5fefb25 100644
> > --- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> > +++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> > @@ -530,6 +530,7 @@ static int mb862xxfb_init_fbinfo(struct fb_info *fb=
i)
> >       return 0;
> >  }
> >
> > +#ifdef CONFIG_FB_DEVICE
> >  /*
> >   * show some display controller and cursor registers
> >   */
> > @@ -569,6 +570,7 @@ static ssize_t dispregs_show(struct device *dev,
> >  }
> >
> >  static DEVICE_ATTR_RO(dispregs);
> > +#endif
> >
> >  static irqreturn_t mb862xx_intr(int irq, void *dev_id)
> >  {
> > @@ -759,9 +761,11 @@ static int of_platform_mb862xx_probe(struct platfo=
rm_device *ofdev)
> >
> >       dev_set_drvdata(dev, info);
> >
> > +#ifdef CONFIG_FB_DEVICE
> >       if (device_create_file(dev, &dev_attr_dispregs))
> >               dev_err(dev, "Can't create sysfs regdump file\n");
> >       return 0;
> > +#endif
>
> That looks wrong. Without CONFIG_FB_DEVICE set the success return is
> removed and all resources are freed essentially making the
> CONFIG_FB_MB862XX_LIME part of the driver unusable.

Thanks, I'll fix that.

And add your suggestion instead of the `ifdef`.

>
> >  rel_cmap:
> >       fb_dealloc_cmap(&info->cmap);
> > @@ -801,7 +805,9 @@ static void of_platform_mb862xx_remove(struct platf=
orm_device *ofdev)
> >       free_irq(par->irq, (void *)par);
> >       irq_dispose_mapping(par->irq);
> >
> > +#ifdef CONFIG_FB_DEVICE
> >       device_remove_file(&ofdev->dev, &dev_attr_dispregs);
> > +#endif
> >
> >       unregister_framebuffer(fbi);
> >       fb_dealloc_cmap(&fbi->cmap);
> > @@ -1101,8 +1107,10 @@ static int mb862xx_pci_probe(struct pci_dev *pde=
v,
> >
> >       pci_set_drvdata(pdev, info);
> >
> > +#ifdef CONFIG_FB_DEVICE
> >       if (device_create_file(dev, &dev_attr_dispregs))
> >               dev_err(dev, "Can't create sysfs regdump file\n");
> > +#endif
> >
> >       if (par->type =3D=3D BT_CARMINE)
> >               outreg(ctrl, GC_CTRL_INT_MASK, GC_CARMINE_INT_EN);
> > @@ -1151,7 +1159,9 @@ static void mb862xx_pci_remove(struct pci_dev *pd=
ev)
> >
> >       mb862xx_i2c_exit(par);
> >
> > +#ifdef CONFIG_FB_DEVICE
> >       device_remove_file(&pdev->dev, &dev_attr_dispregs);
> > +#endif
> >
> >       unregister_framebuffer(fbi);
> >       fb_dealloc_cmap(&fbi->cmap);
>
> The amount of ifdefs could be greatly reduced using the following patch:
>
> diff --git a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c b/drivers/video/f=
bdev/mb862xx/mb862xxfbdrv.c
> index a691a5fefb25..3f79dfc27a53 100644
> --- a/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> +++ b/drivers/video/fbdev/mb862xx/mb862xxfbdrv.c
> @@ -530,7 +530,6 @@ static int mb862xxfb_init_fbinfo(struct fb_info *fbi)
>         return 0;
>  }
>
> -#ifdef CONFIG_FB_DEVICE
>  /*
>   * show some display controller and cursor registers
>   */
> @@ -570,7 +569,6 @@ static ssize_t dispregs_show(struct device *dev,
>  }
>
>  static DEVICE_ATTR_RO(dispregs);
> -#endif
>
>  static irqreturn_t mb862xx_intr(int irq, void *dev_id)
>  {
> @@ -761,11 +759,9 @@ static int of_platform_mb862xx_probe(struct platform=
_device *ofdev)
>
>         dev_set_drvdata(dev, info);
>
> -#ifdef CONFIG_FB_DEVICE
> -       if (device_create_file(dev, &dev_attr_dispregs))
> +       if (IS_ENABLED(CONFIG_FB_DEVICE) && device_create_file(dev, &dev_=
attr_dispregs))
>                 dev_err(dev, "Can't create sysfs regdump file\n");
>         return 0;
> -#endif
>
>  rel_cmap:
>         fb_dealloc_cmap(&info->cmap);
> @@ -805,9 +801,8 @@ static void of_platform_mb862xx_remove(struct platfor=
m_device *ofdev)
>         free_irq(par->irq, (void *)par);
>         irq_dispose_mapping(par->irq);
>
> -#ifdef CONFIG_FB_DEVICE
> -       device_remove_file(&ofdev->dev, &dev_attr_dispregs);
> -#endif
> +       if (IS_ENABLED(CONFIG_FB_DEVICE))
> +               device_remove_file(&ofdev->dev, &dev_attr_dispregs);
>
>         unregister_framebuffer(fbi);
>         fb_dealloc_cmap(&fbi->cmap);
> @@ -1107,10 +1102,8 @@ static int mb862xx_pci_probe(struct pci_dev *pdev,
>
>         pci_set_drvdata(pdev, info);
>
> -#ifdef CONFIG_FB_DEVICE
> -       if (device_create_file(dev, &dev_attr_dispregs))
> +       if (IS_ENABLED(CONFIG_FB_DEVICE) && device_create_file(dev, &dev_=
attr_dispregs))
>                 dev_err(dev, "Can't create sysfs regdump file\n");
> -#endif
>
>         if (par->type =3D=3D BT_CARMINE)
>                 outreg(ctrl, GC_CTRL_INT_MASK, GC_CARMINE_INT_EN);
> @@ -1159,9 +1152,8 @@ static void mb862xx_pci_remove(struct pci_dev *pdev=
)
>
>         mb862xx_i2c_exit(par);
>
> -#ifdef CONFIG_FB_DEVICE
> -       device_remove_file(&pdev->dev, &dev_attr_dispregs);
> -#endif
> +       if (IS_ENABLED(CONFIG_FB_DEVICE))
> +               device_remove_file(&pdev->dev, &dev_attr_dispregs);
>
>         unregister_framebuffer(fbi);
>         fb_dealloc_cmap(&fbi->cmap);
>
> (It would still be questionable however to make the device file creation
> dependent on FB_DEVICE.)

https://www.kernel.org/doc/html/latest/gpu/todo.html#remove-driver-dependen=
cies-on-fb-device

>
> Best regards
> Uwe
