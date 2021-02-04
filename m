Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FEB30FF19
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 22:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A18C6EE42;
	Thu,  4 Feb 2021 21:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD2A6EE42
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 21:10:52 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id r20so3531554qtm.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 13:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4/wUL23CJq8pMys5MsrMUP3OmNDRT4rfRHnWrS0dssI=;
 b=WaHxDdeTrGjKUCorsF0Gow2VJLSIX1Jr6i4XG8cb9zQf0kKDGi4d6/y2KTOtlpvTql
 sQO7Xw1WWecmkzDeOAzJ/ywT4wklCEa2s2cQyr1ORYTlVruvFnv+kI6kifXQGRi1g8/n
 fxdAGZyqqEwR15d2yaOJzzMp4xxe30bRtBeNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4/wUL23CJq8pMys5MsrMUP3OmNDRT4rfRHnWrS0dssI=;
 b=Yo/uJDv4yl7Zp72xSe9nEKfvBZ6/0pRzazfIYGHNZq09YO5tUUa4KtqNO9eyLnNrqA
 39SaqoCVEn27711BVb59OtoKuXoc+dn8Dn8zvUr++eaOKGE1UMyBjUFSFxQo+v+c85Om
 Fu32cUEgMnlf2l/CG3e6yE68QYUibAnrAuNxjPIiy/ofy2DKL1tlvmmHRbgJt2r1vgPP
 cF97HJY1+TRcOJu2F9FQQT/xov4d8i8lEUJKstL0jWWJUun5LBooJT8/FNzBC7sewE/a
 SOgQvVk1nG10QTwVqMmxV9ICUE+uo4eq/ebUcRzm++ZSz3eOIcd5dmXeNlZAHgZVChYf
 BeNw==
X-Gm-Message-State: AOAM533+ZrTAlT9cIJd9gaMZtbg1MYh5jh/Hg0z3lh9VUlqcy2BW/FQU
 +OJkMsR7PPkMi/uZLRoWBS2PqCSggOq0pA==
X-Google-Smtp-Source: ABdhPJyb6M8BybNVkBdkdYQBBqY+GpK/WIz4wfDkqUvFuvnfQvx27Gju6yx/yi+zy+Mr5hY7CyJASw==
X-Received: by 2002:ac8:5a43:: with SMTP id o3mr1495312qta.222.1612473050883; 
 Thu, 04 Feb 2021 13:10:50 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169])
 by smtp.gmail.com with ESMTPSA id u45sm2753856qte.3.2021.02.04.13.10.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 13:10:49 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id r2so4581765ybk.11
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 13:10:49 -0800 (PST)
X-Received: by 2002:a25:b74d:: with SMTP id e13mr1620342ybm.405.1612473049231; 
 Thu, 04 Feb 2021 13:10:49 -0800 (PST)
MIME-Version: 1.0
References: <20210130181014.161457-1-marex@denx.de>
 <20210130181014.161457-2-marex@denx.de>
 <CAD=FV=WzW1L=nwcnhagCXfX5SStE0jr0bqRrEOi-46g4huD4Sw@mail.gmail.com>
 <49db7ef3-fa53-a274-7c69-c2d840b13058@denx.de>
In-Reply-To: <49db7ef3-fa53-a274-7c69-c2d840b13058@denx.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Feb 2021 13:10:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ve3hj8YOSRnJn7kzULPaPqyWCT9_qDHU+LZi=C+69+Xw@mail.gmail.com>
Message-ID: <CAD=FV=Ve3hj8YOSRnJn7kzULPaPqyWCT9_qDHU+LZi=C+69+Xw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 driver
To: Marek Vasut <marex@denx.de>
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
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 4, 2021 at 10:41 AM Marek Vasut <marex@denx.de> wrote:
>
> >> +static const struct regmap_range sn65dsi83_volatile_ranges[] = {
> >> +       regmap_reg_range(REG_RC_LVDS_PLL, REG_RC_LVDS_PLL),
> >
> > Why is REG_RC_LVDS_PLL volatile?
>
> See register 0xa bit 7, PLL_EN_STAT .

Wow, I looked at it a few times and still didn't see it.  OK, fair enough.


> >> +       regmap_reg_range(REG_IRQ_STAT, REG_IRQ_STAT),
> >
> > Do you need to list REG_RC_RESET as volatile?  Specifically you need
> > to make sure it's not cached...
>
> Isn't volatile table exactly for this purpose -- to make sure the reg is
> not cached ?

Sorry, I was unclear I guess.  I'm suggesting that you add
REG_RC_RESET to the list of volatile ones since I don't see it there.


> >> +static const struct regmap_config sn65dsi83_regmap_config = {
> >> +       .reg_bits = 8,
> >> +       .val_bits = 8,
> >> +       .rd_table = &sn65dsi83_readable_table,
> >> +       .wr_table = &sn65dsi83_writeable_table,
> >> +       .volatile_table = &sn65dsi83_volatile_table,
> >> +       .cache_type = REGCACHE_RBTREE,
> >> +       .max_register = REG_IRQ_STAT,
> >> +};
> >
> > I'm curious how much the "readable" and "writable" sections get you.
> > In theory only the "volatile" should really matter, right?
>
> They are useful when dumping the regs from debugfs regmap registers .

OK, fair enough.  When I thought about doing this on sn65dsi86, it
came to be that a better way might be something like:

#define ACC_RO BIT(0)
#define ACC_RW BIT(1)
#define ACC_W1C BIT(2)
#define ACC_WO BIT(3)

u8 reg_acceess[] = {
  [0x00] = ACC_RO,
  [0x01] = ACC_RO,
  ...
  [0x0a] = ACC_RO | ACC_RW,
  [0x0b] = ACC_RW,
  [0x0d] = ACC_RW
  ...
};

The above maps really nicely to the public datasheet and is easy to
validate.  Then you can just look up in that array in a constant time
lookup.  In other words, "readable" if either RO or RW is set.
"writable" if any of RW, W1C, or WO is set.  Everything that's not RW
is volatile (technically you could differentiate between RO things
that are hardcoded and ones that aren't, but you probably don't need
to).

Anyway, feel free to ignore...  What you have is fine too.


> >> +static void sn65dsi83_pre_enable(struct drm_bridge *bridge)
> >> +{
> >> +       struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
> >> +
> >> +       /*
> >> +        * Reset the chip, pull EN line low for t_reset=10ms,
> >> +        * then high for t_en=1ms.
> >> +        */
> >> +       gpiod_set_value(ctx->enable_gpio, 0);
> >
> > Why not use the "cansleep" version to give some flexibility?
>
> Does that make a difference in non-interrupt context ?

As I understand it:

* If a client calls gpiod_set_value() then the underlying GPIO can
only be one that doesn't sleep.

* If a client calls gpiod_set_value_cansleep() then the underlying
GPIO can be either one that does or doesn't sleep.

* A client is only allowed to call gpiod_set_value_cansleep() if it's
not in interrupt context.

You are definitely not in an interrupt context (right?), so calling
the "cansleep" version has no downsides but allows board designers to
hook up an enable that can sleep.


> >> +       usleep_range(10000, 11000);
> >
> > It seems like it would be worth it to read the enable_gpio first?  If
> > it was already 0 maybe you can skip the 10 ms delay?  I would imagine
> > that most of the time the bridge would already be disabled to start?
>
> How do you guarantee the GPIO was LO for 10 mS here? You can sample that
> it is LO, but you won't know how long it was LO before this code was
> executed.

Ah, true.  I guess the best we could do would be keep track of the
GPIO ourselves so that if we were the one to last turn it off we could
avoid the delay.


> >> +       regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
> >
> > Probably you don't need this?  It's the default and in pre-enable you
> > just reset the chip.  Maybe it was needed since you don't flush the
> > cache in pre-enable?
>
> Have a look at the Example Script in the DSI83 datasheet, this PLL part
> is needed.

I think that script is written without the assumption that you have
just reset the chip using the enable GPIO.  If you have just reset
with the enable GPIO it shouldn't be needed.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
