Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4C53758D8
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 19:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7086ECBA;
	Thu,  6 May 2021 17:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D7D6ECBA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 17:03:21 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 j3-20020a05600c4843b02901484662c4ebso5705008wmo.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 May 2021 10:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XTgtgKKE0AxU6MrElTnbDEfTgzp6mnk5hj5rDXIjmNc=;
 b=JrtPqIg+0ZcGVLmRdUFJsPti6Wx3Jjbapo22jv0HGBoqss373jduFZHvYbSePzjQgQ
 1Wa9CGxe7DZgzW4PWL1II44bNuL0n9AWXMLkS5VCuZ5ICtcM84qBDWt7nZcQqEqdFAs1
 /nzI7/Bh9+ig6DEjhvq8gPTtCFe+xKOYyRPfpC0RPGKFreP6t+xrFUu+9cJoFGcTti6b
 MNP+kJ4JJCXLmjyUP0+zlitjxNJbpCQT+BizflScZvMvQ2RNNo1MkegUwjvvJHDhZPWu
 nAgWNzguM9gPcLHpjzKPFniLTlt6ioKvx4ij0liJ2psj8Hd8X9vN+XaADzhh424FjaDv
 DXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XTgtgKKE0AxU6MrElTnbDEfTgzp6mnk5hj5rDXIjmNc=;
 b=uVMVQE+dSzK980s0+UhX0tSikIiDe7wCmyk22148OGQEhIzxcbwxFR+n7iAN0OkwIk
 ti9em6wsfMM+O0GgDTb3bKgixbHRbiT1Bqb4XppFrvBATCdMx1AYUaenr7uvCgyRLhOM
 ka+gcLiLQbNFOg0YeTsTNx9y1AouiCMBj9YuQrKDdpyu1pI2nDtjAcNDxAR2a2A8tPVw
 FpTX6cQObh68d9VzJfJlxoC3dRvIinbs0+Ph6Ah0pQQEVOnY6nedKsI3M10doaitY/JS
 tpZdfDIcAM6LlBsgZRThcQY6NQ/Y140W1FoSr1cxhXJmPrOpeao+n0ekFDeliBoBSIUZ
 lA1Q==
X-Gm-Message-State: AOAM533mod6z4gG109m0210+5LxGAGhC1OxZ0fv5PerS8jxw1k+ZAbq5
 c9QGy9lxSMJQo+jBK/vZJwu3RnjtLVL4mZKXhBEqtw==
X-Google-Smtp-Source: ABdhPJywZoh//cIpAsL9n/uCio3+7FXLKRX7pSAjErciQc8wb0wxVoNfsP32B50e4T/L8R1vdlAx6u6rcpxbyfZK80Y=
X-Received: by 2002:a1c:2c0a:: with SMTP id s10mr16049462wms.158.1620320599938; 
 Thu, 06 May 2021 10:03:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
 <CAPY8ntD8T8B6y4S70vya=PBP9hJs=w2kcovYEMG8n4mFpd0APA@mail.gmail.com>
 <b806a975-352b-6755-d5b0-232d1d8ccda0@denx.de>
In-Reply-To: <b806a975-352b-6755-d5b0-232d1d8ccda0@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 6 May 2021 18:03:03 +0100
Message-ID: <CAPY8ntDPRcK8f7fT-5kScK+amtKGB-s+tkDUXrsCkfL2xDpTYg@mail.gmail.com>
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
Cc: Loic Poulain <loic.poulain@linaro.org>, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 6 May 2021 at 13:48, Marek Vasut <marex@denx.de> wrote:
>
> On 5/6/21 11:45 AM, Dave Stevenson wrote:
> > Hi Marek
>
> Hi,
>
> > I'm taking an interest as there are a number of Raspberry Pi users
> > trying to get this chip up and running (not there quite yet).
> > A couple of fairly minor comments
>
> Is there any readily available display unit / expansion board with this
> chip ?

Not that I'm aware of. It's a forum thread[1] where two different
users are trying to bring up the chip, each with their own boards. One
has just reported they have got it working with Jagan's patch set but
with a load of hacks to both bridge and DSI drivers.
If Laurent has a board then that may be a useful further test route.

I'm not 100% convinced that the Pi is doing exactly the right thing
with regard LP-11 state during initialisation, but hope to get into
the lab to check either tomorrow or early next week.

[1] https://www.raspberrypi.org/forums/viewtopic.php?f=3D44&t=3D305690

> [...]
>
> >> +#define REG_DSI_LANE                           0x10
> >> +#define  REG_DSI_LANE_LVDS_LINK_CFG_DUAL       BIT(5) /* dual or 2x s=
ingle */
> >
> > The bit name here seems a little odd.
> > Bits 5&6 are the DSI channel mode on SN65DSI85, not the LVDS link
> > config (which appears to be reg 0x18 bit 4)
> > DSI_CHANNEL_MODE
> > 00 =E2=80=93 Dual-channel DSI receiver
> > 01 =E2=80=93 Single channel DSI receiver (default)
> > 10 =E2=80=93 Two single channel DSI receivers
> > 11 =E2=80=93 Reserved
> > SN65DSI83 and 84 require it to be set to 01. You have that end result,
> > but using an odd register name that only documents one of the 2 bits.
> >
> > Is it worth documenting bit 7 as being the '85 Dual DSI link
> > LEFT_RIGHT_PIXELS flag at the same time? The chip isn't supported in
> > dual DSI mode at present, but defining all the registers up front
> > seems reasonable.
>
> Yes, let's fix those.
>
> [...]
>
> >> +       /*
> >> +        * Reset the chip, pull EN line low for t_reset=3D10ms,
> >> +        * then high for t_en=3D1ms.
> >> +        */
> >> +       regcache_mark_dirty(ctx->regmap);
> >> +       gpiod_set_value(ctx->enable_gpio, 0);
> >> +       usleep_range(10000, 11000);
> >> +       gpiod_set_value(ctx->enable_gpio, 1);
> >> +       usleep_range(1000, 1100);
> >> +}
> >
> > Whilst section 6.6 of the SN65DSI84 datasheet does list t_en as 1ms,
> > the initialization sequence listed in table 7.2 states
> > Init seq 3 - Set EN pin to Low
> > Wait 10 ms
> > Init seq 4 - Tie EN pin to High
> > Wait 10 ms
> >
> > with the note that these are "Minimum recommended delay. It is fine to
> > exceed these."
> >
> > Have you had alternate guidance from TI over that delay?
>
> No, I trusted the timing diagrams in section 6.6 of the datasheet. I
> would like to believe those are correct, while the init sequence listing
> might be a copy-paste error.

It's a tough one to call as to which is going to be correct. I just
thought I'd flag it.

> [...]
>
> >> +static void sn65dsi83_enable(struct drm_bridge *bridge)
> >> +{
> >> +       struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> >> +       unsigned int pval;
> >> +       u16 val;
> >> +       int ret;
> >> +
> >> +       /* Clear reset, disable PLL */
> >> +       regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
> >> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> >> +
> >> +       /* Reference clock derived from DSI link clock. */
> >> +       regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
> >> +               REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_rang=
e(ctx)) |
> >> +               REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
> >
> > (Checkpatch whinge for "Alignment should match open parenthesis" on
> > several lines through this function)
>
> Do you have any extra checkpatch settings somewhere ?
> I get this on current next:
>
> linux-2.6$ ./scripts/checkpatch.pl -f drivers/gpu/drm/bridge/ti-sn65dsi83=
.c
> total: 0 errors, 0 warnings, 625 lines checked

Sorry, yes "./scripts/checkpatch.pl --strict --codespell". Too much
working in the linux-media realms where --strict is required :-/

  Dave

> [...]
