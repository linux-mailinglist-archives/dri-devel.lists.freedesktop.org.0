Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7824C4F2E6F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 14:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5423510E212;
	Tue,  5 Apr 2022 12:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390D610E212
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 12:00:46 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id d10so9813125edj.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 05:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0xs4Hxc+ZxNnWFCcd2prVIIy9h77OLFAQGYf6kBQIkk=;
 b=THNbO3YvmzaFZ/lS98Z3LLuRrR6h1cy/45vFUAdAJF8DX9881V1Wbb5HxoZ6q9KzTD
 VZ8FY6lfdCYu0ScBhrtS3CePI61L7YgnFFWeNauwgkbYXUMPk4IQjWDqaAtyIot49UhO
 85jvrIaSR6xz/kq+frvRou18hhpkpZyuWARzVD10XmieSV5sF1wl45uiS6uTYP0fWZur
 xRD+xg0ZilRYjpLDnuyGv6/acY9ECbHQvk5kBAk0Qb1ttnhNPNZFAQeGqczZj2CJvYKU
 DPiNOc3ZZ+5cTGMVcGu79hjkaVqXF0dkHoq2qcR4f30hITFt0D2XUSIRkRa9d4gDixkv
 3qYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0xs4Hxc+ZxNnWFCcd2prVIIy9h77OLFAQGYf6kBQIkk=;
 b=o1TGIphJ/b0Xw8z1sg3YI4RqLrTtLRYdXDRfWrzKzmUGLMa+jQ3xLGGf94lvCbxchJ
 tpxGXB8wZxaEmJLnzgxFiupGJ6M2u4WY9Me5vQ5cfNXgw0TF6Bqa/g6hcB0/Wk7gvqpK
 4xl1tgICMnTcjT2EoXqm2CBGiVs5KbBRsxujayNNf4/USXR+4l5TWEA0+dA+ZUlK4v+E
 /WmBz6fCdRHHIRy6wPM/hrvucX6rSdcDf0F5eP/zLMmjuwY51TtaKb6Ll2n4aQxpUAh0
 U5UxKTBiZhVeMR3G7k4FxXpX9Bq3bAHfonPM97chefn77U4trkE13WJtYztY9niLu7gm
 z3/Q==
X-Gm-Message-State: AOAM533pTca5XeZRyVCS+r32N4vakk+oJhBS1i+ZbzrBJHDIkfMiLw0C
 k0+RcjOAfGopoSY0xyrPGQMmwo/czHL+/m80WGct6kprf9v3/Q==
X-Google-Smtp-Source: ABdhPJwkqO8y48iAcd8MxqtSHG83NNgBvo+n0A2MMzQy/SwBrdESDb44fyDym46AdFSK2KGa9XmzJ6BrCXmgpZAZzMs=
X-Received: by 2002:a05:6402:1e92:b0:419:76:21a6 with SMTP id
 f18-20020a0564021e9200b00419007621a6mr3220373edf.128.1649160044758; Tue, 05
 Apr 2022 05:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220213022648.495895-1-marex@denx.de>
 <YkwrDtqhY+Ru2bxG@pendragon.ideasonboard.com>
In-Reply-To: <YkwrDtqhY+Ru2bxG@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 5 Apr 2022 13:00:28 +0100
Message-ID: <CAPY8ntA+GpJ6WFwJbDcKjD5N2TdKAqv2kQPjrFbcJW=OoFL_Yg@mail.gmail.com>
Subject: Re: [PATCH][RESEND] drm/bridge: ti-sn65dsi83: Check link status
 register after enabling the bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Marek Vasut <marex@denx.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent

On Tue, 5 Apr 2022 at 12:42, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Marek,
>
> Thank you for the patch.
>
> On Sun, Feb 13, 2022 at 03:26:48AM +0100, Marek Vasut wrote:
> > In rare cases, the bridge may not start up correctly, which usually
> > leads to no display output. In case this happens, warn about it in
> > the kernel log.
>
> Do you know what this is caused by ? It's a bit annoying to add a 10+ms
> delay at start time just to be notified of rare cases.

The datasheet [1] section 7.4.2 Initialization Sequence states in step 2
"After power is applied and stable, the DSI CLK lanes MUST be in HS
state and the DSI data lanes MUST be driven
to LP11 state"
Data lanes shouldn't go to HS until step 8 after the DSI83 has been configured.

Configuration from the driver is being done from atomic_enable,
therefore the data lanes are likely in HS mode and sending video, not
LP11.

Deviate from the specified initialisation sequence at your peril!

The SN65DSI8[3|4|5] is one of the DSI devices that I'd been looking at
with the DSI ordering patches [2] so that we could initialise it in
the way specified in the datasheet. I've had no responses to v2 of
those patches though.

  Dave

[1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf
[2] https://patchwork.freedesktop.org/series/100252/#rev2

> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Jagan Teki <jagan@amarulasolutions.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: dri-devel@lists.freedesktop.org
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > index 19daaddd29a41..1d7c154ea1d79 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > @@ -488,6 +488,11 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
> >       /* Clear all errors that got asserted during initialization. */
> >       regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> >       regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
> > +
> > +     usleep_range(10000, 12000);
> > +     regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> > +     if (pval)
> > +             dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
> >  }
> >
> >  static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
>
> --
> Regards,
>
> Laurent Pinchart
