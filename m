Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD173762AC
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 11:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378F26EDFD;
	Fri,  7 May 2021 09:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC766EDFD
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 09:17:47 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id s8so8426211wrw.10
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 02:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lfxItkdVnoc13BxEvQdeq3I27+ajecgnw1LBeIDGaSw=;
 b=twlRH2aLtPGOcEbXN2/wq/42iWViiUH7Pc1Y8ZrQidyHaZoo5OwCQ0D7xJ6yfmuIZj
 YibyODHsDWdeclP9GusnwkRhz1JkHFIMZjHX44WxpWMxMh99EYW71Pvcx3jbcmSNrpJ5
 hQ4drvEhjJaK8SUpmh3L3qcPrVWO6QFE6ItrxCY1qgA1nmTqqoLKEx7kg3MCbc73k74n
 fCJhtJeKLD+DMJ8aGUdaWSHPAyhYh7xwV5JruTmNrwi423zHKeaZMlV8MunDn4DcUWpq
 Sloxat944ytG5oFdIN0asFVe5UsDN+sA/mB/CcQDawuZJc/AqzRLDlDkrBstEbX3vLUU
 459A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lfxItkdVnoc13BxEvQdeq3I27+ajecgnw1LBeIDGaSw=;
 b=H24oViD6Si7sbUZI2GmGDO1Rekfsol8B3KIlZ+R7SOQt7fwd7JKRBchQ0Ni9gxiokX
 JfS+J93cOlWN3VdU4oW4ebokPYRle6C9lEZmORGMv+6YHYMA2R7GDblLYJYbGiIx8vML
 q2LxZtgLAjtOm8lp4tU0lyIBpM4rjHjsFLuhBuuReePoJT16oQ27DilAZ6zGlFbzMUqZ
 uktY7BsGrmQB34opXQLhgKr2Lvi91s1O+S4k57/jhUo9mqiXDYOwNl0jBqKtdrKDVXJ7
 +fzn8im176zm8xcCXs2bERx4+6qbwMA8mgAv4FFqPYQYqwEwHPpmSl0NkV2I38ESTSHw
 N8Gw==
X-Gm-Message-State: AOAM5338uXOsQtgdKv83H2l4STyHtqVn3aT77dQXCUxDVesPHSizH8uG
 fYBj+DNRD3tV7vJdHEMEugdNna5lLF/v+K0y/RUA3Dg3+dzBxA==
X-Google-Smtp-Source: ABdhPJysKz+I7XFeCu8JfCZnK3IQEgLjIZHF2eHSkHHxE08SdvPBTVVMGBVuRO4fW3UrmLPVbXmPCnHe3g3K+Rq1o2A=
X-Received: by 2002:a5d:48c3:: with SMTP id p3mr10374590wrs.150.1620379066603; 
 Fri, 07 May 2021 02:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
 <2655a86a-d371-6a5a-715a-53b73a696d28@kontron.de>
 <7da2c2d2-fb02-0a1b-d853-bfd756a0cd9b@denx.de>
 <61e269b7-870a-01a8-722b-15c9aecf9bf9@kontron.de>
 <8985230f-cb0a-43ca-f8f7-66898f85dc2b@denx.de>
In-Reply-To: <8985230f-cb0a-43ca-f8f7-66898f85dc2b@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 7 May 2021 10:17:30 +0100
Message-ID: <CAPY8ntAra-sOXKTrifammiAwH+PuGmnC0AD4oQ4bPiD+HR857Q@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and
 SN65DSI84 driver
To: Marek Vasut <marex@denx.de>
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
Cc: Loic Poulain <loic.poulain@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 May 2021 at 21:51, Marek Vasut <marex@denx.de> wrote:
>
> On 5/6/21 6:03 PM, Frieder Schrempf wrote:
> > On 06.05.21 17:46, Marek Vasut wrote:
> >> On 5/6/21 5:38 PM, Frieder Schrempf wrote:
> >> [...]
> >>> Works on i.MX8MM with SN65DSI84 and a single link LVDS display (1024x=
600) and from my perspective everything else also looks good. Thanks for yo=
ur work!
> >>>
> >>> I have two remarks:
> >>>
> >>> 1. In my test I couldn't get it to work with four DSI lanes enabled (=
only with two) but I'm quite sure that the DSIM driver is to blame as every=
thing on the bridge level looks good (also setting the DSI EQ register didn=
't help as you suggested, Marek).
> >>
> >> I suspect there is indeed something with the DSIM going on, I'll keep =
you posted if I find something out.
> >>
> >>> 2. When I set MEDIA_BUS_FMT_RGB888_1X7X4_SPWG in the panel driver I g=
et distorted colors. I need to use MEDIA_BUS_FMT_RGB888_1X24 to make it wor=
k, but this is not valid for LVDS. Again I don't think this driver is to bl=
ame as I can't see where it does anything wrong, but my experience here is =
very limited so I still want to mention it.
> >>
> >> Hmm, in that conversion supposed to happen in this bridge driver or sh=
ould MXSFB handle the SPWG pixel format ? Or should the DSIM bridge do some=
thing about that ?
> >
> > As far as I understand it the conversion is already done by the DSI84 w=
ithout any extra configuration necessary. The only thing that needs to be d=
one is selecting the LVDS output format via CHx_24BPP_MODE and CHx_24BPP_FO=
RMAT1 which the driver currently hardcodes to 24bpp aka MEDIA_BUS_FMT_RGB88=
8_1X7X4_SPWG. I think the DSI input format is always 24bpp aka MEDIA_BUS_FM=
T_RGB888_1X24.
>
> The DSI is MEDIA_BUS_FMT_RGB888_1X24, yes.
>
> So maybe this bridge driver has to somehow deal with
> MEDIA_BUS_FMT_RGB888_1X7X4_SPWG ? Except I haven't seen such a thing
> implemented in other bridge drivers, so input would be welcome on this.

I'm claiming no knowledge of whether this is the correct approach or
not, but Toshiba TC358775 is also a DSI to LVDS bridge which appears
to handle both formats.
https://elixir.free-electrons.com/linux/latest/source/drivers/gpu/drm/bridg=
e/tc358775.c#L457

> > So I wonder where the format actually is evaluated. Could it be that it=
 is passed down to the LCDIF and changes its output format which causes the=
 data passed by DSIM to the DSI84 to already be in the SPWG format? If that=
's the case we maybe need a way to specify MEDIA_BUS_FMT_RGB888_1X24 as inp=
ut bus format for the DSI84 so it doesn't pass on the panel's format? Only =
a wild guess, no idea if it really works like that.
>
> I _think_ the bridge must somehow handle the
> MEDIA_BUS_FMT_RGB888_1X7X4_SPWG <-> MEDIA_BUS_FMT_RGB888_1X24 conversion.

I've not looked at where the interchange happens, but as you're
setting the DSI format in struct mipi_dsi_device to
MIPI_DSI_FMT_RGB888 doesn't that provide the configuration side to the
DSI transmitter?
Otherwise presumably it needs to support the atomic_get_input_bus_fmts
and/or atomic_get_output_bus_fmts functions in drm_bridge_funcs.

  Dave
