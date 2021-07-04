Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF113BACA1
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jul 2021 11:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED53889BF3;
	Sun,  4 Jul 2021 09:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B136089BF3
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jul 2021 09:57:17 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id hc16so24227378ejc.12
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jul 2021 02:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rIAN7k1yE3CXZnVw2uGvkC2xY/Rf87cMxiE7hn1R5dk=;
 b=S8WwH1MGeSvXS+aLiwvzK/ovcmqBQy1wL8NDr45QPzXdySUKRzt9pBg09cTzaqiqjS
 7BGvKQ561MhhtpUIERH7zOLs+q7Gy4fgYjfu/4+JXsF8P5ISyATyEdHngA/43kntk+tu
 42CDudibdMeGWn7GsIh1pakiGjW8RPPVqbqsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rIAN7k1yE3CXZnVw2uGvkC2xY/Rf87cMxiE7hn1R5dk=;
 b=l9+vo2pquzxuQN96VVX3oni2D4WnTx6OtBFXyLWtEqr1hGI2kRpTnBUbmlpgV576+O
 y2Fsp8Ryz4W/nqgfuMcIbwwwWiTEsJau+HOeUt4YtvlQcriJUQ9ECI35pqw7OU55Ir6z
 9pBSvls89HzkTKEQObPZ8H3YAeZTAaEvgm7hYpy48VPu/yPnR67AcbponzRSDhGwq9HI
 iPoJAoxBeE/awZeTDJdcBbEt/molaMwgB1UWswN2jYakWSuC6Hu7jCp3Bk5PaQKLjFRI
 +W7yi6kpdVq1E0C21wwKaThipkU2kGbRYtvZqzdlgri6GTgWGfPRPmzBYdq/Cli9TweG
 ytVg==
X-Gm-Message-State: AOAM532uc82AlrUPuYoPm4ztdFLkgU9i+B7KQXEMELSeerSE3EfSj1DW
 mLN1pcc7eyLZsq98Vc6uK+2oQdLQbH9CdJv8sAOMwQ==
X-Google-Smtp-Source: ABdhPJz+9+wGvTJD06ua4c8xuIE8vMYn+wSVuFbcZWyEVLTWgZTv80eOUxO0PwIUkXkn/JA58DNxrFy3xdt62xtcFk8=
X-Received: by 2002:a17:906:cc89:: with SMTP id
 oq9mr2193193ejb.418.1625392636311; 
 Sun, 04 Jul 2021 02:57:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210704093857.27961-1-jagan@amarulasolutions.com>
 <bc7f2d6f-f47b-6099-b6d0-4bdd2728dc52@denx.de>
In-Reply-To: <bc7f2d6f-f47b-6099-b6d0-4bdd2728dc52@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 4 Jul 2021 15:27:05 +0530
Message-ID: <CAMty3ZB_XoRNXLJcjVYr9odNs5+tJFSpMAv2t6dmpeX2HjzqxA@mail.gmail.com>
Subject: Re: [PATCH] drm: mxsfb: Support 24-bit SPWG, JEIDA bus formats
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Sun, Jul 4, 2021 at 3:23 PM Marek Vasut <marex@denx.de> wrote:
>
> On 7/4/21 11:38 AM, Jagan Teki wrote:
> > 24-bit SPWG, JEIDA bus formats are considered as 24-bit
> > bus widths for LCDC_CTRL register in mxsfb.
> >
> > Add support for it.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >   drivers/gpu/drm/mxsfb/mxsfb_kms.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > index 22cb749fc9bc..5657155f9633 100644
> > --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> > @@ -85,6 +85,8 @@ static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb,
> >               ctrl |= CTRL_BUS_WIDTH_18;
> >               break;
> >       case MEDIA_BUS_FMT_RGB888_1X24:
> > +     case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> > +     case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
>
> On MX8MM/MN, the bus between LCDIF and DSIM is plain parallel bus, so
> this patch is wrong.

Unsure since these flags are setting from panel side.

>
> You want to pick
> drm: mxsfb: Use bus_format from the nearest bridge if present
> and then implement .atomic_get_input_bus_fmts on all your bridges. And
> only then you will get the correct MEDIA_BUS_FMT_RGB888_1X24 here.

I did pick this patch along with all your mxsfb recent changes, but
issue still persist. It work only when I set the LCDC_CTRL explicitly
like the patch does.

Thanks,
Jagan.
