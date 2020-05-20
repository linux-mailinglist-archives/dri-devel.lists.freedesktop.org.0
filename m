Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262C51DB7C8
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 17:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6B089DEC;
	Wed, 20 May 2020 15:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F6589DEC
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 15:11:05 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w64so3253691wmg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 08:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=06NUZT5oLkpj/XtrzauexC0pCoY/y9Ccf9pqJFj0T/w=;
 b=XeXcnSDzB20IzMYYaQc9pOwritNDhN6imrcAkJ4CQWTpEH4aPAeQSPDPNLbV92j0SA
 oAawwf0ELlavBL5WcYpoYotPxq3q80A0ycLUmleNIPklD/w0z2hOGmGw3g2l64l0ZcBa
 +eNoVGxtdarKvXxzaEpRw1bHNhwynO8pkMUwPDu2f7CK39ziSKfFLo4IUJfS5BuGXWQR
 nUl14WTVTeIchrBTfxakLBZ48pHDzKI1mtdnT6gerck5nHBfTtwAGvbpTOBmcAwxkbGh
 zO4UXftbsmhDety8B3sp1iDmZItDGTm/tZFBNsRvL0tBlDTZ61eOTckjW8Jx6yh4zDK5
 DlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=06NUZT5oLkpj/XtrzauexC0pCoY/y9Ccf9pqJFj0T/w=;
 b=B6zrt1KWbEsYH1bVQjCoOIf4SvuuTHRiV5WbkuUODnohVDWI6+/jdWn2eshNRcEtBo
 FvXhrr0VfVtKX1tZI36X0iHsyrT7kB4YTPmhHO7OioKRAmHiiJdTV/4TODIjJF4pDipi
 fA0Vi2Nt+4eQXAzrcqSpEFvN0z9K0YjZoXGf4u/YaLHZUf3ffuPZ2YBdHmCthqc83XH/
 C/ajgRflOfYDFndgrZyqvnQMpg3pnbp/Ow51Dijawf9+mfOFacx/uCgdy6qbNQvVBAgu
 UwgXzZBJdtDaWjAI6M0dUVd0cLNwigID+zgbM+9x5QtooraJKoY/a3VyDuI50TxOse8G
 90sw==
X-Gm-Message-State: AOAM5309QRVPUz4KwWHyUeTD4LRNv+ZIlYvIYttjKPXnXZHXWQQ46Jq4
 LNeitZ4zdpfxbcYRx9ObPgAhNg==
X-Google-Smtp-Source: ABdhPJyXMBtgIyVHWRYhaf2yK4ztGsyMk20Pe4z2hkQyG7pzqRrGTcnZZ8hRIeRanLf0UxioF5MHfg==
X-Received: by 2002:a1c:740e:: with SMTP id p14mr5281698wmc.137.1589987464578; 
 Wed, 20 May 2020 08:11:04 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id p10sm3297653wra.78.2020.05.20.08.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 08:11:03 -0700 (PDT)
Date: Wed, 20 May 2020 16:11:01 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 16/16] backlight: use backlight_is_blank() in all
 backlight drivers
Message-ID: <20200520151101.tp4eaiadqq36wyy7@holly.lan>
References: <20200517190139.740249-1-sam@ravnborg.org>
 <20200517190139.740249-17-sam@ravnborg.org>
 <CACvgo51C6zb_K3DBwG-xhf9=baoxmcp8YeCFEyB3XvqA5p7r2A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo51C6zb_K3DBwG-xhf9=baoxmcp8YeCFEyB3XvqA5p7r2A@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jonathan Corbet <corbet@lwn.net>, Lee Jones <lee.jones@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andy Gross <agross@kernel.org>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 20, 2020 at 11:56:43AM +0100, Emil Velikov wrote:
> Hi Sam,
> 
> On Sun, 17 May 2020 at 20:02, Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> > --- a/drivers/video/backlight/88pm860x_bl.c
> > +++ b/drivers/video/backlight/88pm860x_bl.c
> > @@ -123,13 +123,7 @@ static int pm860x_backlight_update_status(struct backlight_device *bl)
> >  {
> >         int brightness = bl->props.brightness;
> >
> > -       if (bl->props.power != FB_BLANK_UNBLANK)
> > -               brightness = 0;
> > -
> > -       if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> > -               brightness = 0;
> > -
> > -       if (bl->props.state & BL_CORE_SUSPENDED)
> > +       if (backlight_is_blank(bl))
> >                 brightness = 0;
> Off the top of my head, the above two lines should really be in backlight core.
> There's nothing driver specific to them, plus it minimises the chances
> of next-driver getting it wrong.
> 
> 
> > --- a/drivers/video/backlight/as3711_bl.c
> > +++ b/drivers/video/backlight/as3711_bl.c
> > @@ -107,13 +107,11 @@ static int as3711_bl_update_status(struct backlight_device *bl)
> >         int brightness = bl->props.brightness;
> >         int ret = 0;
> >
> > -       dev_dbg(&bl->dev, "%s(): brightness %u, pwr %x, blank %x, state %x\n",
> > +       dev_dbg(&bl->dev, "%s(): brightness %u, pwr %x, state %x\n",
> >                 __func__, bl->props.brightness, bl->props.power,
> > -               bl->props.fb_blank, bl->props.state);
> > +               bl->props.state);
> >
> Let's also move this to backlight core.

Or just nuke it ;-)


Daniel.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
