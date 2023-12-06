Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCD6807327
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 15:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A06810E737;
	Wed,  6 Dec 2023 14:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B71210E737
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 14:56:53 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-5d7692542beso46685897b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Dec 2023 06:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1701874612; x=1702479412;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xu1buH3lnMDqFORohFaBBuM9NJak7+lWlXXlT1N3rgM=;
 b=EzQRgg3nZhOYwRAVVRJC2tiXha7s3ZjH/LqG0CbOjkqSOxbbLaSCJuAPR0c27pbPiU
 clQvPrfZUCyPPo1/w9oX/czFHsOdIz4J0FrFkHOSUvoCYnCKqQB7XLDz/6WjFw+Cu/Hj
 YANIyC3wZhVopI48ab5QTZkDnDTVl8B8IIFiMJfKu3tqyHLEZWBP5KEUo3YwzBlUaNyS
 x4hlpVKyMx8uY5YEGbdjDtHoqpDWzZAYWRE8EhMw2SmUG+4Usmh4ztFrk1gJBwfOvlTi
 Wg15HIl1RBtUFN7osowispYdTbsWSFX9X4bauiNEGuV17S2ncEZVtgue8cXW8tuQLANn
 QUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701874612; x=1702479412;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xu1buH3lnMDqFORohFaBBuM9NJak7+lWlXXlT1N3rgM=;
 b=EnG1aLU+WuYIFCnb40qaV2cYj5+3ep1GwZgQVsFnxLRFZU5ddO/LETg4QBFX04HQim
 x3ifbDjUzeSi6snGDnm4zV7HSaOSuvitVprhNOSBNvg2TQ9UI1TmEhaU3TYN1Hlh6qYi
 YcfTpiCUjg4QI9rogHHO59c030JO8xi3OJ3uktydJdGMGiPKUpuvmUu4W5BE57YqjvSQ
 cyoCpQXm2ka0fItlvoH0V4gbkjsk+v0oXrGs3HVrhYySk1zjxciOn58+p1lzyfdxRdex
 2sWt1p8x2Y/cVJW81aJbWhMeIGra4QzJbpBUFgjttHBGT0HI1ZwqcCTN+E2mX0IUVIhI
 wy0w==
X-Gm-Message-State: AOJu0Yxmk0HjoSoOhjFxzv5YsYEkORV+aY2al3ryvpmCOX7CgMRq7iGa
 O8NGQ0/FUcQNsT3T6JAwUPJt6HEt2GmsKjD+ElvU1w==
X-Google-Smtp-Source: AGHT+IGgsA0MehNZm3oJsLVw7XM8huEyCBgfWtoBPY5VJUsD7IuHn9CYOs2fsK8acNeFNEUfQmFmB5T6hP/cgM/Al1E=
X-Received: by 2002:a81:ad48:0:b0:5d3:7c0b:9547 with SMTP id
 l8-20020a81ad48000000b005d37c0b9547mr957756ywk.12.1701874612286; Wed, 06 Dec
 2023 06:56:52 -0800 (PST)
MIME-Version: 1.0
References: <20231124104451.44271-1-shengyang.chen@starfivetech.com>
 <dab03c60-caa9-47e3-9dac-fa499227b67b@gmx.net>
 <CAPY8ntAXYVTTfXL5HX-14t-VDe63eFgRBNKA0aG3RamKepxwDQ@mail.gmail.com>
 <5b837622-3ac9-47d5-aaf1-6b1ef5144c1c@starfivetech.com>
In-Reply-To: <5b837622-3ac9-47d5-aaf1-6b1ef5144c1c@starfivetech.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 6 Dec 2023 14:56:37 +0000
Message-ID: <CAPY8ntCw_-QG_v-KGipshq09sZ1fD3yascrHcLz3TYREmnk0sA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add waveshare 7inch touchscreen panel support
To: Keith Zhao <keith.zhao@starfivetech.com>
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "florian.fainelli@broadcom.com" <florian.fainelli@broadcom.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Keith

On Wed, 6 Dec 2023 at 08:55, Keith Zhao <keith.zhao@starfivetech.com> wrote:
>
>
>
> On 2023/11/25 0:04, Dave Stevenson wrote:
> > On Fri, 24 Nov 2023 at 15:00, Stefan Wahren <wahrenst@gmx.net> wrote:
> >>
> >> Hi Shengyang,
> >>
> >> [fix address of Emma]
> >
> > Not merged to master yet, but Emma has stepped back from maintenance.
> > https://lists.freedesktop.org/archives/dri-devel/2023-October/428829.html
> > Dropped from the cc.
> >
> >> Am 24.11.23 um 11:44 schrieb Shengyang Chen:
> >> > This patchset adds waveshare 7inch touchscreen panel support
> >> > for the StarFive JH7110 SoC.
> >> >
> >> > Patch 1 add new compatible for the raspberrypi panel driver and its dt-binding.
> >> > Patch 2 add new display mode and new probing process for raspberrypi panel driver.
> >> >
> >> > Waveshare 7inch touchscreen panel is a kind of raspberrypi panel
> >> > which can be drived by raspberrypi panel driver.
> >> >
> >> > The series has been tested on the VisionFive 2 board.
> >> surprisingly i was recently working on the official Raspberry Pi
> >> touchscreen and was able to get it running the new way.
> >>
> >> What do i mean with the new way. There is almost nothing special to the
> >> Raspberry Pi touchscreen, so we should try to use/extend existing
> >> components like:
> >>
> >> CONFIG_DRM_PANEL_SIMPLE
> >> CONFIG_TOUCHSCREEN_EDT_FT5X06
> >> CONFIG_DRM_TOSHIBA_TC358762
> >>
> >> The only special part is the Attiny on the connector PCB which requires:
> >>
> >> CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY
> >>
> >> So the whole point is to avoid writing monolitic drivers for simple
> >> panel like that.
> >>
> >> There is a WIP branch based on top of Linux 6.7-rcX, which should
> >> demonstrate this approach [1]. Unfortunately it is not ready for
> >> upstreaming, but it has been tested on a Raspberry Pi 3 B Plus. Maybe
> >> this is helpful for your case.
> >>
> >> Actually i consider panel-raspberrypi-touchscreen.c as a dead end, which
> >> shouldn't be extended.
> >
> > Agreed.
> >
> > The panel control being bound in with the Atmel control has no hook
> > for the EDT5x06 touch driver to hook in and keep the power to the
> > touch controller active. When the panel disable gets called, bye bye
> > touch overlay :-(
> >
> > And I'm reading the driver change as more of a hack to get it to work
> > on your platform, not as adding support for the Waveshare panel
> > variant.
> > Waveshare deliberately cloned the behaviour of the Pi 7" panel in
> > order to make it work with the old Pi firmware drivers, so it
> > shouldn't need any significant changes. Where did the new timings come
> > from?
> >
> >   Dave
> hi Dave :
> that's means the panel driver split into 3 sub-modules:
> panel + panel_bridge + regulator.

Correct.

You'll have a fourth device in edt_ft5x06 for the touch overlay too,
which will link to the regulator driver for power control.

> I have a question: in the
> static int rpi_touchscreen_probe(struct i2c_client *i2c)
> {
>         ......
>
>         ver = rpi_touchscreen_i2c_read(ts, REG_ID);
>         if (ver < 0) {
>                 dev_err(dev, "Atmel I2C read failed: %d\n", ver);
>                 return -ENODEV;
>         }
>
>         switch (ver) {
>         case 0xde: /* ver 1 */
>         case 0xc3: /* ver 2 */
>                 break;
>         default:
>                 dev_err(dev, "Unknown Atmel firmware revision: 0x%02x\n", ver);
>                 return -ENODEV;
>         }
>
>         ......
> }
> i think this "I2C read" can use to detect whether the panel is connected to dsi controller.
>
> and when split the panel driver into 3 sub-modules, it seems the default way is connected.
> if I drop the panel , run modetest to check the connector status , result connected.
> Is there any way to detect the connection in this case?
> Thanks

I am not aware of any DSI drivers that support hotplugging, therefore
the connector state will always be connected if the device probes.

On vc4 the relevant DSI host controller has to have been enabled in
device tree and will be a required component for binding. The DSI host
controller will be waiting on the DSI peripheral driver to call
mipi_dsi_attach, which then calls component_add. If the panel or panel
regulator isn't present, then that never happens if the panel isn't
present, so vc4 won't bind.
It is a little ugly in that you lose the whole DRM card, but that is
how I understand DRM is generally set up to work for DSI or similar
display interfaces.

> -------------------------------------
>
> Where did the new timings come from?
>
> -------------------------------------
> My platform dphy tx hardware has certain limitations.
> Only supports integer multiples of 10M bitrate:
> such as 160M ,170M, 180M,190M,...1G(max)
>
> as common dphy bitrate = pixclock*bpp/lanes.
> This value cannot match successfully in most cases.
>
> so in order to match bitrate , I choose a bitrate value around pixclock*bpp/lanes,
> Prevent overflow and underflow by fine-tuning the timing parameters:-(
> that will make the new timming value.

That isn't really a function of the panel then.

All DRM bridges have the option to define a mode_fixup in
drm_bridge_funcs, and that gives you the option to adjust the timings
as required.

vc4 has a similar constraint in that the PHY only has an integer
divider from a 2 or 3GHz PLL. It implements mode_fixup to compute the
next highest pixel clock, and then adjusts the horizontal front porch
to keep the same line timing. See
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/vc4/vc4_dsi.c#L825

  Dave

> >
> >> Btw there are already DT overlays in mainline which seems to use the
> >> Raspberry Pi 7inch panel (without touch function yet) [2].
> >>
> >> [1] - https://github.com/lategoodbye/rpi-zero/commits/v6.7-7inch-ts
> >> [2] -
> >> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx-0x-rpidsi.dtso?h=v6.6.2&id=6b4da1354fd81adace0cda448c77d8f2a47d8474
> >>
> >> >
> >> > Shengyang Chen (2):
> >> >    dt-bindings: display: panel: raspberrypi: Add compatible property for
> >> >      waveshare 7inch touchscreen panel
> >> >    gpu: drm: panel: raspberrypi: add new display mode and new probing
> >> >      process
> >> >
> >> >   .../panel/raspberrypi,7inch-touchscreen.yaml  |  4 +-
> >> >   .../drm/panel/panel-raspberrypi-touchscreen.c | 99 ++++++++++++++++---
> >> >   2 files changed, 91 insertions(+), 12 deletions(-)
> >> >
> >>
