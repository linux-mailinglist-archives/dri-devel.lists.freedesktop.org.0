Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CABCA475C8B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 17:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF5D10ED98;
	Wed, 15 Dec 2021 16:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D9F10ED98
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 16:02:24 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso25543949otf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 08:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=uA2KhFYcevw7cK46df7blsP3ULwVs9hRDmqZ8ATlwYM=;
 b=50vf27h/+7SHBuXTs7wn3JrzdM2Bx2k8lP7rLK/ioW7uENjkS38EHsQ8stw1JM2fzD
 1prjNZ1s+oghjQX9OQT3BCvGNXzXdcDdPI6SgHnuLOnwGhTn40ss3tQCtUHBX3l5LHUm
 We9uM5fZUuF/Ksv7oeMCdvhO+dhJnbhPwWSQiXb8EqACIXQMhbzO5EO/tuIMXYMc0g+z
 dDg2cLVyR4+vKQT6zSpEXWDwqgI0c6ljzs2QoH5WYKOT5pkqSH+Ju3i/Z1r11E+iYqKQ
 hduQKrUXYooWGRyBJoZ1GSupKYSehnFu6MqFMpJqsP7pxac8vKZpKZNnV82JY3SfLyi/
 5Djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=uA2KhFYcevw7cK46df7blsP3ULwVs9hRDmqZ8ATlwYM=;
 b=tccTfsNbX10ZYWnXuwQwd7aIlQcy3VzUxzUJtAGvLTYYSWRjdTlnDhcAgguDHxp3Mc
 hF4cwXWLtuEgLHbw68up0MZJxnPXDVN2T5p4qTzkdbTy90voZWpDqzpunBxh2nJBbtq4
 tYnYDDTwyDHV12J+BrF7+RwkYWlHQGXlLnigGeVb7hjSdzY/BO2xC13IhifHtTyRoF5F
 9C3FmMLzvN+pBt/ea2BlTOsYEwQd1Bff8WG4iS5f197pksE8m5cWo+Iw4tGcbxj4uGZQ
 /r/Cew5+3u9MzzUlONQW52DyOl+G8scps8UxkBfuOFwJzNiKODV2mrCD1TEchqxCT91x
 UPeQ==
X-Gm-Message-State: AOAM531KNIqyXf/kCWdx2uHrhPfYzXtcdLgRoXwrd30xZkgT8JUoOcX1
 YnXnQqycG9sPpzl9mxaZNI76kG/25zZTiJdmOEUVOg==
X-Google-Smtp-Source: ABdhPJwxxRpk1cgb4wMcK04Gw9ydCCAT1lQQWC+7WX63vONE0Q9ZWE5D11fUCaiaPeyn2pvQVfg5RfCReYfJ7DSRwO4=
X-Received: by 2002:a9d:2aa3:: with SMTP id e32mr9141632otb.6.1639584143080;
 Wed, 15 Dec 2021 08:02:23 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 10:02:22 -0600
MIME-Version: 1.0
In-Reply-To: <20211215151508.hc7blhh7p3wrjili@houat>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211115101129.lyxxmb6i7paaonwi@gilmour>
 <CABnWg9tNPGZSi1RLqF5+Qs1GHtynyVoOzAyw+i9mPRYEoByk8g@mail.gmail.com>
 <20211116145112.xyoxzfll6exysnvt@gilmour>
 <CABnWg9uhuchdWyBeTacR6Cy0A9OHziUi051BQ5wsZVU0ajYjyA@mail.gmail.com>
 <20211125143034.tzikvlxxl6fdhsif@gilmour>
 <CABnWg9tcWdfPQwNtFhqVZxCriT848fy42VHoQZs3X2UmL4LYSA@mail.gmail.com>
 <20211213165422.54n3oh72tjcb3a67@houat>
 <CABnWg9uyoK0TkRZRJXstmtB4u2-UUCi-x_frosKhhQerNmFT=A@mail.gmail.com>
 <20211215151508.hc7blhh7p3wrjili@houat>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Wed, 15 Dec 2021 10:02:22 -0600
Message-ID: <CABnWg9s0GpTPWH=2HcD5j6F23=0rvkG9KrFpen-qKO4RpQoH1g@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2021-12-15 16:15:08)
> Hi,
>
> On Wed, Dec 15, 2021 at 09:03:01AM -0600, Guillaume Ranquet wrote:
> > Quoting Maxime Ripard (2021-12-13 17:54:22)
> > > On Thu, Dec 02, 2021 at 06:48:12AM -0800, Guillaume Ranquet wrote:
> > > > Hi,
> > > >
> > > > Quoting Maxime Ripard (2021-11-25 15:30:34)
> > > > > On Wed, Nov 24, 2021 at 01:45:21PM +0000, Guillaume Ranquet wrote:
> > > > > > Hi,
> > > > > > Thanks for all your input, really appreciated.
> > > > > >
> > > > > > Quoting Maxime Ripard (2021-11-16 15:51:12)
> > > > > > > Hi,
> > > > > > >
> > > > > > > On Mon, Nov 15, 2021 at 09:33:52AM -0500, Guillaume Ranquet wrote:
> > > > > > > > Quoting Maxime Ripard (2021-11-15 11:11:29)
> > > > > > > > > > The driver creates a child device for the phy. The child device will
> > > > > > > > > > never exist without the parent being active. As they are sharing a
> > > > > > > > > > register range, the parent passes a regmap pointer to the child so that
> > > > > > > > > > both can work with the same register range. The phy driver sets device
> > > > > > > > > > data that is read by the parent to get the phy device that can be used
> > > > > > > > > > to control the phy properties.
> > > > > > > > >
> > > > > > > > > If the PHY is in the same register space than the DP controller, why do
> > > > > > > > > you need a separate PHY driver in the first place?
> > > > > > > >
> > > > > > > > This has been asked by Chun-Kuang Hu in a previous revision of the series:
> > > > > > > >
> > > > > > > > https://lore.kernel.org/linux-mediatek/CAAOTY_-+T-wRCH2yw2XSm=ZbaBbqBQ4EqpU2P0TF90gAWQeRsg@mail.gmail.com/
> > > > > > >
> > > > > > > It's a bit of a circular argument though :)
> > > > > > >
> > > > > > > It's a separate phy driver because it needs to go through another
> > > > > > > maintainer's tree, but it needs to go through another maintainer's tree
> > > > > > > because it's a separate phy driver.
> > > > > > >
> > > > > > > It doesn't explain why it needs to be a separate phy driver? Why can't
> > > > > > > the phy setup be done directly in the DP driver, if it's essentially a
> > > > > > > single device?
> > > > > > >
> > > > > > > That being said, usually what those kind of questions mean is that
> > > > > > > you're missing a comment or something in the commit log to provide that
> > > > > > > context in the first place, so it would be great to add that context
> > > > > > > here.
> > > > > > >
> > > > > > > And it will avoid the situation we're now in where multiple reviewers
> > > > > > > ask the same questions over and over again :)
> > > > > > >
> > > > > > At first I didn't understand your reply, then I realized I gave you
> > > > > > the wrong link...
> > > > > > my bad! I'm struggling a bit with mail reviews, but I'll get there eventually.
> > > > > >
> > > > > > The driver and phy were a single driver until v2 of this patch series
> > > > > > and the phy setup
> > > > > > was done directly in the driver (single driver, single C file).
> > > > > > Here's the relevant link to the discussion between Chun-Kuang and Markus
> > > > > >
> > > > > > https://lore.kernel.org/linux-mediatek/CAAOTY__cJMqcAieEraJ2sz4gi0Zs-aiNXz38_x7dPQea6HvYEg@mail.gmail.com/#t
> > > > > >
> > > > > > I'll try to find a way to make it clearer for v7.
> > > > >
> > > > > OK, it makes sense then :)
> > > > >
> > > > > There's something weird though: the devices definitely look like they're
> > > > > in a separate register range, yet you mention a regmap to handle the
> > > > > shared register range. That range doesn't seem described anywhere in the
> > > > > device tree though? What is it for?
> > > >
> > > > My understanding is that 0x1000 to 0x1fff controls the phy
> > > > functionalities and 0x2000 to 0x4fff controls "non-phy"
> > > > functionalities. And you are right, there's no description of that in
> > > > the device tree whatsoever. The ranges are in the same actual device
> > > > and thus it has been decided to not have dt-bindings for the phy
> > > > device.
> > >
> > > Sure, that last part makes sense, but then I'm not sure why you don't
> > > have the full register range in the device node you have in the DT?
> > >
> > > > The phy driver is a child of the DP driver that we register using
> > > > platform_device_register_data() and we pass along the same regmap as
> > > > the DP driver in its platform data.
> > >
> > > Especially if it's used by something, it should be described in the DT
> > > somewhere.
> > >
> > > Maxime
> >
> >
> > So, to make things crystal clear to a newbie (like me).
> > Would you describe it like this:
> > compatible = "mediatek,mt8195-dp-tx";
> > reg = <0 0x1c501000 0 0x0fff>,
> >       <0 0x1c502000 0 0x2fff>;
> >
> > instead of the current description:
> > compatible = "mediatek,mt8195-dp-tx";
> > reg = <0 0x1c500000 0 0x8000>;
> >
> > I haven't checked what the rest of the 0x8000 range is used for though...
>
> I'm confused, is that what you had before?
>
> I recall you had a DTSI somewhere where you have two devices, and the
> dp-tx device not having the phy range?
>
> If the latter is what you have, and there's no overlapping ranges over
> multiple nodes, then it's fine already.
>
> Maxime

This is what I have today in the mt8195.dtsi I'm using for testing purpose.
Provided by mediatek on their vendor branch, not sure if it has been submitted
to the list yet:

        edp_tx: edp_tx@1c500000 {
            status = "disabled";
            compatible = "mediatek,mt8195-dp-tx";
            reg = <0 0x1c500000 0 0x8000>;
            nvmem-cells = <&dp_calibration>;
            nvmem-cell-names = "dp_calibration_data";
            power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
            interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
        };

        dp_tx: dp_tx@1c600000 {
            compatible = "mediatek,mt8195-dp-tx";
            reg = <0 0x1c600000 0 0x8000>;
            nvmem-cells = <&dp_calibration>;
            nvmem-cell-names = "dp_calibration_data";
            power-domains = <&spm MT8195_POWER_DOMAIN_DP_TX>;
            interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
            status = "disabled";
        };

With no device tree node for the dp-phy.
The phy range is included in the reg range of the dp-tx device.
