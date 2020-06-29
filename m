Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E67C20CD72
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 11:07:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53E96E370;
	Mon, 29 Jun 2020 09:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C20D6E370
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 09:07:55 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l2so13857795wmf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mrCjsSuJyD/omtIraD265IvRkoBagbjablKS9q7/A4I=;
 b=PiZHqK9O6Ho79COyWujnGWNB2WyaMecJkZYnJ1jSsmhpp51PUKpSKkVzwfbpFlDxV9
 J2p7ETfhDEWIEI0utQwFF6iVPdiCG1mtRU6HOhh9pgZeKvtcnsBE8a1xoNlaFIR2SnwA
 2xpukQF/qZCVe9xwcqkJr5lMvYkhP1ISwJo6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mrCjsSuJyD/omtIraD265IvRkoBagbjablKS9q7/A4I=;
 b=niIMmcI/bRnoZQvS9p9ALH2YiALHyJjqBrSITXbqSCpOfBpe3S8nMAUSW3pyjg+IJ1
 jLKJPpUwltsjKXkFphkuHnN9lQIBI21adxJ1x+RzgAEhMFNPypfyo7Qq6mCutr8CKNss
 ePsRl8LdTO/jLohUQDjKYIdUUr4wvo569s0T4nfkqpgKUPcf9cS6cn9foMYHDIMtaqjA
 Y1rur1dyejY1uDcUFEU+9lnANsb+t9Ju6x5kQIJ2zePR1jdtJ3Z5r8Fbw5fhlq1IoIYO
 YlQAnW54zpHX76RzzJSJZPl0MhIg7jiD8vwgY+29w2zXbY4ZAUTvBkGS+RqX5+DlfveJ
 tG1w==
X-Gm-Message-State: AOAM5302buDEgHKReZB6kPpyiKRovXeRjNfJwJC/0hKWmVq8HsmoScW7
 BcQXCdzRtGa9i54663bx4V6AOw==
X-Google-Smtp-Source: ABdhPJydLlpJveLkY+I1no+IYgAPuuo7mi3YB++gWAiiEEzMqjkahUKefKo0ijxLGOnK9CYlExxgpQ==
X-Received: by 2002:a05:600c:4109:: with SMTP id
 j9mr15166619wmi.157.1593421674261; 
 Mon, 29 Jun 2020 02:07:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a2sm31701234wrn.68.2020.06.29.02.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 02:07:53 -0700 (PDT)
Date: Mon, 29 Jun 2020 11:07:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 6/9] drm/simplekms: Acquire clocks from DT device node
Message-ID: <20200629090751.GO3278063@phenom.ffwll.local>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-7-tzimmermann@suse.de>
 <CAMuHMdUfO5QmUHwkTXqgtr+zEsz=29og33E3wuYC7qqGE+ES4g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUfO5QmUHwkTXqgtr+zEsz=29og33E3wuYC7qqGE+ES4g@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 25, 2020 at 03:34:05PM +0200, Geert Uytterhoeven wrote:
> Hi Thomas,
> 
> On Thu, Jun 25, 2020 at 2:00 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Make sure required hardware clocks are enabled while the firmware
> > framebuffer is in use.
> >
> > The basic code has been taken from the simplefb driver and adapted
> > to DRM. Clocks are released automatically via devres helpers.
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Thanks for your patch!
> 
> > --- a/drivers/gpu/drm/tiny/simplekms.c
> > +++ b/drivers/gpu/drm/tiny/simplekms.c
> 
> > @@ -210,6 +218,103 @@ static struct simplekms_device *simplekms_device_of_dev(struct drm_device *dev)
> >         return container_of(dev, struct simplekms_device, dev);
> >  }
> >
> > +/*
> > + * Hardware
> > + */
> > +
> > +#if defined CONFIG_OF && defined CONFIG_COMMON_CLK
> > +/*
> > + * Clock handling code.
> > + *
> > + * Here we handle the clocks property of our "simple-framebuffer" dt node.
> > + * This is necessary so that we can make sure that any clocks needed by
> > + * the display engine that the bootloader set up for us (and for which it
> > + * provided a simplefb dt node), stay up, for the life of the simplefb
> > + * driver.
> > + *
> > + * When the driver unloads, we cleanly disable, and then release the clocks.
> > + *
> > + * We only complain about errors here, no action is taken as the most likely
> > + * error can only happen due to a mismatch between the bootloader which set
> > + * up simplefb, and the clock definitions in the device tree. Chances are
> > + * that there are no adverse effects, and if there are, a clean teardown of
> > + * the fb probe will not help us much either. So just complain and carry on,
> > + * and hope that the user actually gets a working fb at the end of things.
> > + */
> > +
> > +static void simplekms_device_release_clocks(void *res)
> > +{
> > +       struct simplekms_device *sdev = simplekms_device_of_dev(res);
> > +       unsigned int i;
> > +
> > +       for (i = 0; i < sdev->clk_count; ++i) {
> > +               if (sdev->clks[i]) {
> > +                       clk_disable_unprepare(sdev->clks[i]);
> > +                       clk_put(sdev->clks[i]);
> > +               }
> > +       }
> > +}
> > +
> > +static int simplekms_device_init_clocks(struct simplekms_device *sdev)
> > +{
> > +       struct drm_device *dev = &sdev->dev;
> > +       struct platform_device *pdev = sdev->pdev;
> > +       struct device_node *of_node = pdev->dev.of_node;
> > +       struct clk *clock;
> > +       unsigned int i;
> > +       int ret;
> > +
> > +       if (dev_get_platdata(&pdev->dev) || !of_node)
> > +               return 0;
> > +
> > +       sdev->clk_count = of_clk_get_parent_count(of_node);
> > +       if (!sdev->clk_count)
> > +               return 0;
> > +
> > +       sdev->clks = drmm_kzalloc(dev, sdev->clk_count * sizeof(sdev->clks[0]),
> > +                                 GFP_KERNEL);
> > +       if (!sdev->clks)
> > +               return -ENOMEM;
> > +
> > +       for (i = 0; i < sdev->clk_count; ++i) {
> > +               clock = of_clk_get(of_node, i);
> 
> clk_bulk_get_all()?

Plus then you can use devm_clk_bulk_get_all, even less code I think.
-Daniel

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
