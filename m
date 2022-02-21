Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A9F4BD986
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 12:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D558410E2DF;
	Mon, 21 Feb 2022 11:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A4510E2DB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 11:56:46 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id r13so9590232ejd.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 03:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=IYaGmw5HhY3ZPZ6B2F+fs3lYhHd9RpLMt4fLVtxtpMI=;
 b=OIx77UmaWMOFIqXL5pqfcpwsFnXgPGZSuKK9tzcZoXWV8hUIdoq4QHUimH58Q63Tgr
 QbGxAxECoIBSPuq2dhsLIGpT/OyIsCiZgiu5qML3guVJx+6laxQxJgy1NaHUFy8WajTv
 hb8/yCanv2bJfpy+n5S5tlrPxX6kMurlH2nym+6VMQdQVfNP/FAHfHd5gLiDjzhEmnIc
 3XgJ4S7n+QH81Pa4CqlXDmKDPlm1eUoNidghl+CosTW/4vdX+EuPrteGX8KUnWx58mgJ
 KA+LbQ+gud0BLyoWx9S+jxHhhM4swoWR1YwvkXHrOyV1CiVLxP/4dbnxH7CFCUCgGsBK
 gBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=IYaGmw5HhY3ZPZ6B2F+fs3lYhHd9RpLMt4fLVtxtpMI=;
 b=QlMO0HXcG2sLJnf8Qg3Fr44WmAL0/O8MIwjaBRnSOK6CpXpxUQkncKZcJsfrq+yNog
 +9HsY+ldwyXbUFBZs+FBJLA8u/Zd0cyjy32aYWWPmOVnio6vy7bpjtKpaRedEaJPbako
 wozeAnKaXrwsLO/2GgYgElsZVb4UB+QOge7PHP7LNFj8qSpfCxN1XPCJ+HlQTJuV0NeQ
 /XgkD32OMjkLeMMuod4eFz70L2AEKRVdQBQMiF20oVgEQdl02BCI8b9v3PdbBZ2j55IO
 +M17+mZABOdVlXjs2kAA/UZkqw9Hk26xocp8TQ/zQIw0xYR1ESeyTXvbpso4micXOnyo
 6i/g==
X-Gm-Message-State: AOAM530bJG47b3oKTTy5IkRhKUM8Iq3HTbmuLfw6vNCd7WtWGu7wUepH
 2Ae+dR3M6y5RWv5QHSSNrGY=
X-Google-Smtp-Source: ABdhPJy9HIy61MCE3Zo1zWN5XDIlL9nsgJTqQLhtypEvtocr3fCt0ZL/3yHdGv7aqfkxMWAzBq7zOQ==
X-Received: by 2002:a17:906:d7aa:b0:6cf:1fb3:2986 with SMTP id
 pk10-20020a170906d7aa00b006cf1fb32986mr15757502ejb.594.1645444604977; 
 Mon, 21 Feb 2022 03:56:44 -0800 (PST)
Received: from Saturn.fritz.box ([194.191.225.82])
 by smtp.googlemail.com with ESMTPSA id gj7sm5045531ejc.90.2022.02.21.03.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 03:56:44 -0800 (PST)
Message-ID: <c91e56b7d56381722c923455a78435fe130a2182.camel@gmail.com>
Subject: Re: [PATCH V2] drm/imx: parallel-display: Remove bus flags check in
 imx_pd_bridge_atomic_check()
From: Max Krummenacher <max.oss.09@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, Christoph Niedermaier
 <cniedermaier@dh-electronics.com>
Date: Mon, 21 Feb 2022 12:56:43 +0100
In-Reply-To: <20220221092908.6d8d18c5@collabora.com>
References: <20220201113643.4638-1-cniedermaier@dh-electronics.com>
 <36f517300a15b2460a02512ef3c5814ad0ed2290.camel@gmail.com>
 <e00e00585b9945e396bdc3bbd8f30f7e@dh-electronics.com>
 <20220221092908.6d8d18c5@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: "Marek MV. Vasut" <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Montag, den 21.02.2022, 09:29 +0100 schrieb Boris Brezillon:
> Hello Christoph,
> 
> On Sat, 19 Feb 2022 09:28:44 +0000
> Christoph Niedermaier <cniedermaier@dh-electronics.com> wrote:
> 
> > From: Max Krummenacher [mailto:max.oss.09@gmail.com]
> > Sent: Wednesday, February 9, 2022 10:38 AM
> > > > If display timings were read from the devicetree using
> > > > of_get_display_timing() and pixelclk-active is defined
> > > > there, the flag DISPLAY_FLAGS_SYNC_POSEDGE/NEGEDGE is
> > > > automatically generated. Through the function
> > > > drm_bus_flags_from_videomode() e.g. called in the
> > > > panel-simple driver this flag got into the bus flags,
> > > > but then in imx_pd_bridge_atomic_check() the bus flag
> > > > check failed and will not initialize the display. The
> > > > original commit fe141cedc433 does not explain why this
> > > > check was introduced. So remove the bus flags check,
> > > > because it stops the initialization of the display with
> > > > valid bus flags.
> > > > 
> > > > Fixes: fe141cedc433 ("drm/imx: pd: Use bus format/flags provided by the bridge when
> > > > available")
> > > > Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> > > > Cc: Marek Vasut <marex@denx.de>
> > > > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > > Cc: David Airlie <airlied@linux.ie>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > > Cc: Fabio Estevam <festevam@gmail.com>
> > > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > To: dri-devel@lists.freedesktop.org
> > > > ---
> > > > V2: - Add Boris to the Cc list
> > > > ---
> > > >  drivers/gpu/drm/imx/parallel-display.c | 8 --------
> > > >  1 file changed, 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/imx/parallel-display.c b/drivers/gpu/drm/imx/parallel-display.c
> > > > index a8aba0141ce7..06cb1a59b9bc 100644
> > > > --- a/drivers/gpu/drm/imx/parallel-display.c
> > > > +++ b/drivers/gpu/drm/imx/parallel-display.c
> > > > @@ -217,14 +217,6 @@ static int imx_pd_bridge_atomic_check(struct drm_bridge *bridge,
> > > >       if (!imx_pd_format_supported(bus_fmt))
> > > >               return -EINVAL;
> > > > 
> > > > -     if (bus_flags &
> > > > -         ~(DRM_BUS_FLAG_DE_LOW | DRM_BUS_FLAG_DE_HIGH |
> > > > -           DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE |
> > > > -           DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)) {
> > > > -             dev_warn(imxpd->dev, "invalid bus_flags (%x)\n", bus_flags);
> > > > -             return -EINVAL;
> > > > -     }
> > > > -
> > > >       bridge_state->output_bus_cfg.flags = bus_flags;
> > > >       bridge_state->input_bus_cfg.flags = bus_flags;
> > > >       imx_crtc_state->bus_flags = bus_flags;  
> > > 
> > > Tested on a Colibri iMX6DL with a panel-dpi based panel.
> > > 
> > > Tested-by: Max Krummenacher <max.krummenacher@toradex.com>  
> > 
> > I still ask myself why this bus flag check is in the code.
> > Is there a reason not to remove that?
> 
> The reasoning was that DE_{LOW,HIGH} and
> FLAG_PIXDATA_DRIVE_{POS,NEG}EDGE were the only bus_flags taken into
> account by the crtc logic, so anything else is simply ignored. This was
> definitely wrong since the driver supports at least one of the VSYNC
> polarity (perhaps both if there's a way to configure it that's not
> hooked-up yet).
> 
> So I guess figuring out the default VSYNC polarity and accepting the
> according DISPLAY_FLAGS_SYNC_XXXEDGE flag is what makes most sense here.

Note that {HV}SYNC polarities are taken from the timings '.flag' field
The bus_flags do not carry
that information.
(drivers/gpu/ipu-v3/ipu-di.c:611:        if (sig->mode.flags &
DISPLAY_FLAGS_HSYNC_HIGH))

The new flags DRM_BUS_FLAG_SYNC_DRIVE_{POS,NEG}EDGE are siblings to
DRM_BUS_FLAG_PIXDATA_DRIVE_{POS,NEG}EDGE and would allow to specify
on which pixelclock edge the sync signals are to be driven.
Before that addition it was implicitly assumed that the sync signals
and data signals would be driven on the same clock edge.
The way I read the IPU driver it is not
foreseen that the data lines
and sync lines are driven by a different clock edge.

I personally would just drop the sanity test on
bus_flags. This is what
this patch proposes.

Regards,
Max
> 
> Regards,
> 
> Boris

