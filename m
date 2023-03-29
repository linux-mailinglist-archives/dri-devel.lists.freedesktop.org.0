Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEBD6CF0F0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 19:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A33A910EBD1;
	Wed, 29 Mar 2023 17:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0890C10EBDE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 17:21:43 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id x33so11885274uaf.12
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 10:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1680110503;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u/kekKZDVCcsebIf2i6yt2xwj/2zTCqcAVAvAI7dnWA=;
 b=Xh2EJMk3roX5KmogJpsL0StcrfSo0Fc06ghN/BP5hmiGqBoSHsiRFAGwF1nDAnE4S9
 s+umt70bR5p9c8w0+8BW2i6kc8o35r/8VEOi6JZTH832qFJuF+bWxWsdC8/mlAQHVMI5
 LDgWjrkEug2Mxq2v5hTHzE08VB8bOmRtBEpElwvK/9/eeYQubeslFBq90SXmLrnKgbcZ
 wAuOmaTL3ZMvUc/PtB0d/PINCdCB/9y1POZ8+TBUHqBNgyW+O15wHs69nKfVtyTlOErK
 B2ZD0KzL4DU1icDAxqNweFNOxkpDw9MBuVF0JTk4KRqXCZPHQVJR6PdnDeU4nGlKwrj4
 F4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680110503;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u/kekKZDVCcsebIf2i6yt2xwj/2zTCqcAVAvAI7dnWA=;
 b=VXueRMzUoyO3dKG/3BAkCmwA+IX0nz3i/aGga9i34UG8Q1VG9fjK/EyOBN12imqM5K
 WDHYTBOCNXNzI5KoKjDQF7zSTj56uHzumDTptzfjxVVHpIrYbXqoukX8yAwjcJZd/tA1
 teP5qjg0q/DxYS7O1J70VpgKAQajNV2AvQ+XOPomJM1aUzh1ya+AiIeSyQkP6SjbD1Ko
 Fok4gCD9mt5M3lYtRp2UxEuyQvxConNJnLp5IN9lHrq4ulN9brmupEtNiTzxPQk0J2mh
 CcWchIGqnOBWCmoLG9NZgKnqBwIEGmPmZOFycV9v4LI61fmcUb4gzyng07xUgNlzITKX
 bzsg==
X-Gm-Message-State: AAQBX9eIwY2lat989GJyU2+UWSCfcjem7PILHmns8BC7yZixMdZsLQmm
 B8O2guugXF2KdLJ5A83Fdl4uP/rYzD9/jtQuQl7CJA==
X-Google-Smtp-Source: AKy350ZW6k9lUO+uh1XIpejgSS2PYqsimgM7ESvKiOd2N++Wn3Q41Lt0aBPZ7Od1ovCCTw/L+UsD7U6WvWHS7WHGsFg=
X-Received: by 2002:a1f:3091:0:b0:43c:aa3:bf3d with SMTP id
 w139-20020a1f3091000000b0043c0aa3bf3dmr1559456vkw.1.1680110502857; Wed, 29
 Mar 2023 10:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230329131929.1328612-1-jagan@amarulasolutions.com>
 <CAPY8ntCJP53uiGNQHUZqma08Vsxfwm7KvAkgMzK=hn4AxJLS3A@mail.gmail.com>
 <20230329164638.v43la4l7rxut6hk6@penduick>
In-Reply-To: <20230329164638.v43la4l7rxut6hk6@penduick>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 29 Mar 2023 18:21:26 +0100
Message-ID: <CAPY8ntDwJLVLK2MQpsqjDVuNDeWdvjdgQcO2EuDGqZm=LL+yeQ@mail.gmail.com>
Subject: Re: [PATCH v7 10/12] drm/bridge: Implement enable_next_first to alter
 bridge init order
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 29 Mar 2023 at 17:46, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Wed, Mar 29, 2023 at 05:28:28PM +0100, Dave Stevenson wrote:
> > On Wed, 29 Mar 2023 at 14:19, Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > DSI sink devices typically send the MIPI-DCS commands to the DSI host
> > > via general MIPI_DSI_DCS read and write API.
> > >
> > > The classical DSI sequence mentioned that the DSI host receives MIPI-DCS
> > > commands from the DSI sink first in order to switch HS mode properly.
> > > Once the DSI host switches to HS mode any MIPI-DCS commands from the
> > > DSI sink are unfunctional.
> >
> > That statement contradicts the spec.
> > The DSI spec section 8.11.1 Transmission Packet Sequences says that
> > during any BLLP (Blanking or Low Power) period the host can do any of:
> > - remain in LP-11
> > - transmit one or more non-video packets from host to peripheral in escape mode
> > - transmit one or more non-video packets from host to peripheral in
> > using HS mode
> > - receive one or more packets from peripheral to host using escape mode
> > - transmit data on a different virtual channel.
> >
> > Indeed if the sink doesn't set MIPI_DSI_MODE_LPM /
> > MIPI_DSI_MSG_USE_LPM, then the expectation is that any data transfer
> > will be in HS mode.
> >
> > That makes me confused as to the need for this patch.
>
> Yeah, and it looks like that would break the expectation that, in
> enable, a bridge can expect its controller to be in HS mode.
>
> I think that was Jagan is trying to do is to work around an issue with
> the Allwinner DSI driver:
> https://elixir.bootlin.com/linux/v6.3-rc4/source/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c#L775
>
> This is working mostly fine since we only have panel support and can
> control that, but with bridge support added in the latest patch, then it
> probably doesn't work anymore.
>
> The proper way to fix this isn't to put more logic into the framework,
> it's to make the DSI driver behave as expected by KMS.
>
> Unfortunately, that controller is not documented, so it's not clear to
> me how we can fix it.
>
> IIRC, it's basically a state machine where you would encode the
> transitions between one DSI state and the next depending on what your
> expectations are.
>
> I think there's two problem with the driver that need to be addressed:
>
>   - First the driver will drop back to LP11 mode to submit commands. I
>     don't think it's needed and could even be hurtful to the video
>     stream if it was to happen during HS mode:
>     https://elixir.bootlin.com/linux/v6.3-rc4/source/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c#L877
>
>   - And then, it looks like, in HSD mode, we never get to go to the
>     state LPTX is in (LPDT). It would be interesting to test whether
>     adding a transition to that state makes it work or not.

Ooh, not fun.
I'll agree with your assessment - it looks like sunxi driver has
significant limitations on the modes of operation it supports. If
there is no information on sending HS commands, I wonder if it's
possible to note the video state in transfer and stop video, send the
command, and resume video again. Ugly as heck, but possibly the only
real option without documentation. It does raise the question of do
other blocks (eg crtc) need to be stopped as well, or does stopping
the PHY and/or DSI block stop the pixel data getting clocked out.

I can only guess at the meaning of the enum sun6i_dsi_start_inst and
enum sun6i_dsi_inst_id states. LPTX and LPRX are largely obvious, but
HSC(ommand) and HSD(ata) perhaps?
I thought on initial reading that the setup in sun6i_dsi_start made
sense as a sequence of commands, but looking closer at the bitmasking
and shifting I'm not so convinced. Are the DSI_INST_ID_xxx defines
shifts or the bitmask values to or in, as they get used for both.

  Dave
