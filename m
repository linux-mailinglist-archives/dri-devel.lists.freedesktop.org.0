Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C054593EA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 18:20:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F84C89CC1;
	Mon, 22 Nov 2021 17:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81D089CC1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 17:19:57 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d27so34098426wrb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 09:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lcZ8VSA2peamg8otggi2v12qGX4N2sq3PbdIa4Bqop4=;
 b=VItexI+fxkBlux3Xyt+S7+RsV4jslfO5UX36xNZBlNi6jdIMRsAGf5txjeydgZhwnC
 kVP8I+jCww0lzJ3WyHP8aSj6CcF/IkAy8Z34SFU9Hr/a+uY+5/e9T584r5vyP3KoRFv0
 sCWz7fJFJvYWLaDGOOBrl1goQBjTnR0Yx/4vw7R5sIhXVuE2Pz15esR8Gg2n6QCqDOgr
 P6rb4PP8QwUiBJJi+39VlB0n4gp8pg8B6CPmxDylV1kKDLICKiEOcJXm38EUZaBOnhUJ
 1sPu8fNVCV02CpURFeuAdVuXXLqP7KJQ7qzXg5FmbRwElveOB+VsLxCQX2j1+7B6RqR3
 D/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lcZ8VSA2peamg8otggi2v12qGX4N2sq3PbdIa4Bqop4=;
 b=splLWHnRl/iuskWZfVANpXxFGD8wAn3bxDfOaBvuUDVm1wwRS2gxRsLoim62wXABiP
 hEnylZGzUc+4KzKDykdiGQyjB3Gi1/ZBsmeIN6SInI21K2WsZMGYjWS6kzN/NkmVWduD
 B0OhdS6FWEzw4Q+CsOJlmbPtGnkC/sRtnTf/lojaUW0B3KMyA4FHBisS4+Idr8S6fNaY
 sQV742sJN+eht3xOu9Y2kDyUDVkOxVxCu7yunY0q4BWOd4BisFel5U8+LDvraYUGIKmq
 VzlS41UoUj1HPwIZzmeQ8cqyk99yFPPS9LMT5GTqaq2dmapTZDiwBIx5GEdr6KWgJiVC
 C4KQ==
X-Gm-Message-State: AOAM533dI5JKHMmB6WsorCCOgvsvmtH6yj27sask035Abf6V2PxFmUek
 25mHg26QgdZXU9A+FNRJ+KusgvcAK+TK9/zvGlHf+Q==
X-Google-Smtp-Source: ABdhPJyma2XyetUoJBdnG8qyOT3VXMXUstlpZYUADb8ILAaFQaAHFX19JyIEiBFCs92ZGv9gq5X530BiaHSTjOp8DwE=
X-Received: by 2002:a05:6000:1869:: with SMTP id
 d9mr39370967wri.416.1637601596319; 
 Mon, 22 Nov 2021 09:19:56 -0800 (PST)
MIME-Version: 1.0
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-4-jagan@amarulasolutions.com>
 <35a25992-741b-b3f1-c3cd-695a19b9a413@baylibre.com>
 <CAMty3ZDATTKoJq7aLOe5i=RPo2UHzqnLs8j8sT-EBNdpC7=3DQ@mail.gmail.com>
 <9aa3d19d-4378-aaf3-6857-c40be5d252c7@baylibre.com>
In-Reply-To: <9aa3d19d-4378-aaf3-6857-c40be5d252c7@baylibre.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 22 Nov 2021 17:19:39 +0000
Message-ID: <CAPY8ntBFhz4KXFML_+12He+z57eiO1+iLTgt9hWX75s0yKn-sQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>, Robert Foss <robert.foss@linaro.org>,
 linux-sunxi@googlegroups.com, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Mon, 22 Nov 2021 at 15:35, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 22/11/2021 14:16, Jagan Teki wrote:
> > Hi Neil,
> >
> > On Mon, Nov 22, 2021 at 6:22 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> On 22/11/2021 07:52, Jagan Teki wrote:
> >>> Some display panels would come up with a non-DSI output, those
> >>> can have an option to connect the DSI host by means of interface
> >>> bridge converter.
> >>>
> >>> This DSI to non-DSI interface bridge converter would requires
> >>> DSI Host to handle drm bridge functionalities in order to DSI
> >>> Host to Interface bridge.
> >>>
> >>> This patch convert the existing to a drm bridge driver with a
> >>> built-in encoder support for compatibility with existing
> >>> component drivers.
> >>>
> >>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>> ---
> >>> Changes for v5:
> >>> - add atomic APIs
> >>> - find host and device variant DSI devices.
> >>> Changes for v4, v3:
> >>> - none
> >>>
> >>>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 112 ++++++++++++++++++++-----
> >>>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |   7 ++
> >>>  2 files changed, 96 insertions(+), 23 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> >>> index 43d9c9e5198d..a6a272b55f77 100644
> >>> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> >>> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> >>> @@ -21,6 +21,7 @@
> >>>
> >>>  #include <drm/drm_atomic_helper.h>
> >>>  #include <drm/drm_mipi_dsi.h>
> >>> +#include <drm/drm_of.h>
> >>>  #include <drm/drm_panel.h>
> >>>  #include <drm/drm_print.h>
> >>>  #include <drm/drm_probe_helper.h>
> >>> @@ -713,10 +714,11 @@ static int sun6i_dsi_start(struct sun6i_dsi *dsi,
> >>>       return 0;
> >>>  }
> >>>
> >>> -static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> >>> +static void sun6i_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
> >>> +                                        struct drm_bridge_state *old_bridge_state)
> >>>  {
> >>> -     struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> >>> -     struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
> >>> +     struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
> >>> +     struct drm_display_mode *mode = &bridge->encoder->crtc->state->adjusted_mode;
> >>>       struct mipi_dsi_device *device = dsi->device;
> >>>       union phy_configure_opts opts = { };
> >>>       struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
> >>> @@ -772,6 +774,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> >>>       if (dsi->panel)
> >>>               drm_panel_prepare(dsi->panel);
> >>>
> >>> +     if (dsi->next_bridge)
> >>> +             dsi->next_bridge->funcs->atomic_pre_enable(dsi->next_bridge, old_bridge_state);
> >>> +
> >>>       /*
> >>>        * FIXME: This should be moved after the switch to HS mode.
> >>>        *
> >>> @@ -787,6 +792,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
> >>>       if (dsi->panel)
> >>>               drm_panel_enable(dsi->panel);
> >>>
> >>> +     if (dsi->next_bridge)
> >>> +             dsi->next_bridge->funcs->atomic_enable(dsi->next_bridge, old_bridge_state);
> >>> +
> >>
> >>
> >> No need to call the next bridge atomic pre_enable/enable/disable/post_disable since they will
> >> be called automatically on the bridge chain.
> >
> > Correct, but the existing bridge chain (stack) is not compatible with
> > sun6i DSI start sequence. We cannot send any DCS once we start HS
> > mode.
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c#n775
>
> It's a classical DSI sequence init issue, look at dw-mipi-dsi:
> https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>
> We setup the "command-mode" (low-speed) withing mode_set so when the next bridge dsi_pre_enable is called,
> low-speed DCS can be sent, then the bridge enable() sets video mode (high-speed).
> The disable still needs to call the next_bridge post_disable :
> https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L893

Doesn't that mean the post_disable gets called twice? Once by the
dw-mipi-dsi driver and once by the framework.

> You can send any low-speed DCS once HS mode is started if the HW supports it and the driver handles it, look
> at the https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L397
> The MIPI_DSI_MODE_LPM and MIPI_DSI_MSG_USE_LPM is used for that.

This seems to be the same question as I was asking back in [1] and
continued in [2].

vc4 and Exynos break the chain apart so that they can initialise the
DSI host before the panel.
That doesn't work if the DSI host is an encoder, as the encoder
mode_valid call is missing the struct drm_display_info needed for
calling the bridge mode_valid function.
It also fails with the atomic operations as the framework can't see
the bridges/panels beyond the DSI host, and therefore doesn't create
the state for them.
This is why I've been trying to reinstate the chain as a whole for
vc4, however we then hit the issue of the downstream bridge/panel
pre_enables being called before the DSI host (be it a bridge or
encoder), therefore it's unlikely to have been powered up or
configured. The DSI bus is also generally going to be powered down
during the pre_enables, when many displays want it at LP-11.

It sounds like dw-mipi-dsi has a hack to the bridge operations and
powers up in mode_set (not what the docs say). sun6i sounds to have
some similar restrictions that these patches are trying to work
around.

The documentation for struct mipi_dsi_host_ops transfer [3] states:
 * Also note that those callbacks can be called no matter the state the
 * host is in. Drivers that need the underlying device to be powered to
 * perform these operations will first need to make sure it's been
 * properly enabled.

It sounds like neither of the above drivers do this.
As stated it would be valid to request a transfer from attach, at
which point mode_set hasn't been called, so dw-mipi-dsi falls down
there. sun4i can't send commands once in HS mode.
What's the correct behaviour if the hardware can't support sending the
transfer due to the state? Returning an error would be an obvious
step.


Is it time to actually thrash out the specifics of how DSI should be
implemented, and fix the DSI framework where it doesn't currently
work?

Previously proposed have been:
- a pre_pre_enable (called from encoder outwards) and a matching
post_post_disable (towards the encoder).
- a mechanism for the panel/bridge to request that the PHY is powered
up, so the bus is at LP-11, and the clock lane running if
!MIPI_DSI_CLOCK_NON_CONTINUOUS, before powering up the bridge.
(Powering up for transfers would be internal to the DSI host driver).

Do either or both of those solve the problem in this case? The first
is the easiest to implement, but does it cover all the current use
cases?
I don't quite see why dw-mipi-dsi calls the downstream post_disable
early. Are there really devices that want to send DSI DCS transfers
during shutdown? I'm guessing that's the reasoning, same as the power
up via mode_set.

There are already bridge drivers such as SN65DSI83 which don't follow
the requirements specified in the datasheet for power up sequences due
to issues in the framework. Hacking the bridge seems wrong.
(It configures the bridge from enable because it needs the DSI clock
lane running and LP-11 on the data lanes, but actually enable has the
data lanes active too. It should be in pre_enable, but the clock lane
isn't running then.)

Also undefined in DRM is how DSI burst mode parameters should be
configured, and the exact meaning of half the MIPI_DSI_MODE_* defines
and their interactions (eg MIPI_DSI_VIDEO_MODE_BURST, but not
MIPI_DSI_VIDEO [4]?).

Cheers
 Dave

[1] https://lists.freedesktop.org/archives/dri-devel/2021-July/313576.html
[2] https://lists.freedesktop.org/archives/dri-devel/2021-October/325853.html
[3] https://elixir.bootlin.com/linux/latest/source/include/drm/drm_mipi_dsi.h#L84
[4] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c#L226


> >
> > This specific problem can be fixed only if we change the bridge chain
> > from stack to queue. Please check this series
> > https://patchwork.kernel.org/project/dri-devel/patch/20210214194102.126146-6-jagan@amarulasolutions.com/
> >
> > Jagan.
> >
>
