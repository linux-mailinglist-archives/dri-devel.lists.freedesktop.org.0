Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E5837626F
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 10:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577DE6EDEC;
	Fri,  7 May 2021 08:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85516EDEC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 08:55:54 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id l13so8344675wru.11
 for <dri-devel@lists.freedesktop.org>; Fri, 07 May 2021 01:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Iq3uJU9TOeiyMydwk6OyARrPntvrYi7p007+sTF/kjY=;
 b=bxOHQKfbPHqVJ4/cb3rpCgQB44dCVW396Hh0cbEeVG+0+7mwsQ26Ky10lhA5nsfSDv
 nxRaZRNXiC/0RZlcLZgefU/47hvPzj2yulGI00cci3D7qS496gxzDHZk9eLX4epQ6+2v
 kq8rvdHI8XiT00FIrTjQiYnKxOPEtPbWL+F6st1SYhJR53qTcUuWmaFEOv0y844jwo14
 qEc6LJvgwmv/6sUA51m7c1Pl50LbHLCkCPtqgRd+XBqkjNrwD9BaskVwqaLhMwXQdjz0
 Wez8CGBJHiwFIbe0/xaBZOqL3THRvOPz4xrmrmILo13njFj8B+EgcWf1nDJuIcMkPu4h
 DZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Iq3uJU9TOeiyMydwk6OyARrPntvrYi7p007+sTF/kjY=;
 b=EZ64KcGPdZV0y4j2fzzlnP9130p0WTtjaaSPY6gP1i3gw1V1OpllO9wleE4gF0cjx0
 ADGehokH1xWMfN07PxaNq3VWdzZA8du9kVf7JrcIPRH75voCNI69fWLtZvQ3OVwVluav
 2L57e6zm3ChJlbDtlWvkA7cQ7h/B/jHJSvwNAojRGLQNojNPHata+w037oggobTr+VNZ
 FjXXo1fHZHCeaYLx7EC6W96SfJIQ20i9ZYwJgxFf8EAY6PeiCP+v5PpCG7B/pPKu45sC
 lyqiC6BNabSVk86B/wDpD0X19Izy4CaJWEBwPUx/dSmn/73qsxHyakgN8hmiodl6xQbz
 fACA==
X-Gm-Message-State: AOAM5304aD5Rkko8gGwCn4WoH47gKHD9uNSAeQecmZqDlrKaQw9PUKC/
 JRsItgBV+P+VhqQoHnWwOMqhjW784vZmYWma8MP+Dg==
X-Google-Smtp-Source: ABdhPJzSGEfbIrZwYct/bR9jMIvJQZDMAN1UnuTnXu4QmwExBeTTCnGVmx4NXpn7fEQ1+lmp2zxGWdKbVfB5zX4xfcU=
X-Received: by 2002:a5d:6248:: with SMTP id m8mr10889005wrv.42.1620377753460; 
 Fri, 07 May 2021 01:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210505100218.108024-1-marex@denx.de>
 <20210505100218.108024-2-marex@denx.de>
 <CAPY8ntD8T8B6y4S70vya=PBP9hJs=w2kcovYEMG8n4mFpd0APA@mail.gmail.com>
 <b806a975-352b-6755-d5b0-232d1d8ccda0@denx.de>
 <CAPY8ntDPRcK8f7fT-5kScK+amtKGB-s+tkDUXrsCkfL2xDpTYg@mail.gmail.com>
 <7a16b9db-22a3-0361-8353-1c373c2a135e@denx.de>
In-Reply-To: <7a16b9db-22a3-0361-8353-1c373c2a135e@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 7 May 2021 09:55:37 +0100
Message-ID: <CAPY8ntDDgPA_1zCS-Vx_5u1CJkp-eSJYDyJyRbeO7Pvu4xEqPw@mail.gmail.com>
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

On Thu, 6 May 2021 at 21:49, Marek Vasut <marex@denx.de> wrote:
>
> On 5/6/21 7:03 PM, Dave Stevenson wrote:
> > On Thu, 6 May 2021 at 13:48, Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 5/6/21 11:45 AM, Dave Stevenson wrote:
> >>> Hi Marek
> >>
> >> Hi,
> >>
> >>> I'm taking an interest as there are a number of Raspberry Pi users
> >>> trying to get this chip up and running (not there quite yet).
> >>> A couple of fairly minor comments
> >>
> >> Is there any readily available display unit / expansion board with thi=
s
> >> chip ?
> >
> > Not that I'm aware of. It's a forum thread[1] where two different
> > users are trying to bring up the chip, each with their own boards. One
> > has just reported they have got it working with Jagan's patch set but
> > with a load of hacks to both bridge and DSI drivers.
> > If Laurent has a board then that may be a useful further test route.
> >
> > I'm not 100% convinced that the Pi is doing exactly the right thing
> > with regard LP-11 state during initialisation, but hope to get into
> > the lab to check either tomorrow or early next week.
>
> Good
>
> > [1] https://www.raspberrypi.org/forums/viewtopic.php?f=3D44&t=3D305690
> >
> >> [...]
> >>
> >>>> +#define REG_DSI_LANE                           0x10
> >>>> +#define  REG_DSI_LANE_LVDS_LINK_CFG_DUAL       BIT(5) /* dual or 2x=
 single */
> >>>
> >>> The bit name here seems a little odd.
> >>> Bits 5&6 are the DSI channel mode on SN65DSI85, not the LVDS link
> >>> config (which appears to be reg 0x18 bit 4)
> >>> DSI_CHANNEL_MODE
> >>> 00 =E2=80=93 Dual-channel DSI receiver
> >>> 01 =E2=80=93 Single channel DSI receiver (default)
> >>> 10 =E2=80=93 Two single channel DSI receivers
> >>> 11 =E2=80=93 Reserved
> >>> SN65DSI83 and 84 require it to be set to 01. You have that end result=
,
> >>> but using an odd register name that only documents one of the 2 bits.
> >>>
> >>> Is it worth documenting bit 7 as being the '85 Dual DSI link
> >>> LEFT_RIGHT_PIXELS flag at the same time? The chip isn't supported in
> >>> dual DSI mode at present, but defining all the registers up front
> >>> seems reasonable.
> >>
> >> Yes, let's fix those.
> >>
> >> [...]
> >>
> >>>> +       /*
> >>>> +        * Reset the chip, pull EN line low for t_reset=3D10ms,
> >>>> +        * then high for t_en=3D1ms.
> >>>> +        */
> >>>> +       regcache_mark_dirty(ctx->regmap);
> >>>> +       gpiod_set_value(ctx->enable_gpio, 0);
> >>>> +       usleep_range(10000, 11000);
> >>>> +       gpiod_set_value(ctx->enable_gpio, 1);
> >>>> +       usleep_range(1000, 1100);
> >>>> +}
> >>>
> >>> Whilst section 6.6 of the SN65DSI84 datasheet does list t_en as 1ms,
> >>> the initialization sequence listed in table 7.2 states
> >>> Init seq 3 - Set EN pin to Low
> >>> Wait 10 ms
> >>> Init seq 4 - Tie EN pin to High
> >>> Wait 10 ms
> >>>
> >>> with the note that these are "Minimum recommended delay. It is fine t=
o
> >>> exceed these."
> >>>
> >>> Have you had alternate guidance from TI over that delay?
> >>
> >> No, I trusted the timing diagrams in section 6.6 of the datasheet. I
> >> would like to believe those are correct, while the init sequence listi=
ng
> >> might be a copy-paste error.
> >
> > It's a tough one to call as to which is going to be correct. I just
> > thought I'd flag it.
> >
> >> [...]
> >>
> >>>> +static void sn65dsi83_enable(struct drm_bridge *bridge)
> >>>> +{
> >>>> +       struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
> >>>> +       unsigned int pval;
> >>>> +       u16 val;
> >>>> +       int ret;
> >>>> +
> >>>> +       /* Clear reset, disable PLL */
> >>>> +       regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
> >>>> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> >>>> +
> >>>> +       /* Reference clock derived from DSI link clock. */
> >>>> +       regmap_write(ctx->regmap, REG_RC_LVDS_PLL,
> >>>> +               REG_RC_LVDS_PLL_LVDS_CLK_RANGE(sn65dsi83_get_lvds_ra=
nge(ctx)) |
> >>>> +               REG_RC_LVDS_PLL_HS_CLK_SRC_DPHY);
> >>>
> >>> (Checkpatch whinge for "Alignment should match open parenthesis" on
> >>> several lines through this function)
> >>
> >> Do you have any extra checkpatch settings somewhere ?
> >> I get this on current next:
> >>
> >> linux-2.6$ ./scripts/checkpatch.pl -f drivers/gpu/drm/bridge/ti-sn65ds=
i83.c
> >> total: 0 errors, 0 warnings, 625 lines checked
> >
> > Sorry, yes "./scripts/checkpatch.pl --strict --codespell". Too much
> > working in the linux-media realms where --strict is required :-/
>
> So I can add a variable , assign it the value of
> sn65dsi83_get_lvds_range(ctx) and then do
> REG_RC_LVDS_PLL_LVDS_CLK_RANGE(val), but that doesn't really improve the
> readability at all, it just adds extra indirection.

Unless drm is sticking hard to the older limit, "bdc48fa11e46
checkpatch/coding-style: deprecate 80-column warning" allows you up to
100 chars.
Just going with the natural indentation is therefore fine and makes
checkpatch happy even in strict mode.

  Dave
