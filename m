Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 359FC81A211
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 16:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED84C10E5C1;
	Wed, 20 Dec 2023 15:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A6610E5C1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 15:18:54 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d38f03712so4171505e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 07:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703085533; x=1703690333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQznE3T4sDko9wo85ONtxZv9jJ6ZRKGfTKvps55TZXU=;
 b=mxVziUwhLFhUUTAkpOx/SA2IzqLoBNNZDdw7oOBpDmL0KtfK8aBq3olHsGg5URSQx6
 4SBKcy3N+b+PLMh+rHD4lyPXIbGEf0HVG9xyy4XWmAmTSlNR8YsKPERWArGK1nUnmf9j
 hYjvhzttFkLKz/eR5MTjNzRkFxwl2cGMmHVfGGnA0yQ06N7JIivSGYOP7gM1MgjuKpI7
 u7M762b3AeJXnxh6xYPgB2gIeJpXE2eHwqlurnr+zRBtUKhqKnvVzbPi6uDu7ftrCKc3
 KOiXmAtYEwT83FIsVl1bzDf2ej1g7G/KeLvlP0J9pCXHfKzgTfjPTd1hWTaluX7Tqmuq
 Njiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703085533; x=1703690333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQznE3T4sDko9wo85ONtxZv9jJ6ZRKGfTKvps55TZXU=;
 b=dYLdhc4W2O4df0N3vxszhKYTKl4jHuFbe7VMH4pxSZMyXQ5HmU5x3iZp3QLYoYZq/8
 mXVRaIeU96BAEiAZGDPmjQmJCYyowVv/DueFshF9yumnc3HwnjTBbh1z60Slilbdrrdi
 JadcvEtf0Hf0AsDT70aWQKrQjGQ2ZGUDg7yT5vNQBU8dZZ1HnP7LY/Rn4auHQh+I43wo
 eE1m7acsVwhPdGE64BLkXWVFmh+fXySic0xQlT6mAETBIz0m5/LES8/IITtpXEaav2a2
 J98MWq1eghKhHGpix7gnHIQlOIt/IPfzjjL0LowDzcLS8AVwsMOzRLnuvcsZFXw1zy+r
 25ZQ==
X-Gm-Message-State: AOJu0YzCwOTicCNdBqB5vOJCn7+dl/G8EA8sSzRddhSkbUko0FSrnfyZ
 p90prsSOTt/N1qOwRXXHCOQ=
X-Google-Smtp-Source: AGHT+IHpTRb9ZsNlOdTaOnmxWls02DlZ24RU1byhkjNqQfZJBGR9fk7exiKPi9UZ9wdarAw/oWoKfA==
X-Received: by 2002:a05:600c:c10:b0:40d:33cb:b577 with SMTP id
 fm16-20020a05600c0c1000b0040d33cbb577mr716095wmb.3.1703085532684; 
 Wed, 20 Dec 2023 07:18:52 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net.
 [82.149.12.148]) by smtp.gmail.com with ESMTPSA id
 j35-20020a05600c1c2300b0040b3515cdf8sm3593917wms.7.2023.12.20.07.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 07:18:52 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH 5/5] drm/panel: st7703: Drive XBD599 panel at higher clock
 rate
Date: Wed, 20 Dec 2023 16:18:49 +0100
Message-ID: <1845418.atdPhlSkOF@jernej-laptop>
In-Reply-To: <87edfh9ud8.fsf@oltmanns.dev>
References: <20231218-pinephone-pll-fixes-v1-0-e238b6ed6dc1@oltmanns.dev>
 <10386431.nUPlyArG6x@jernej-laptop> <87edfh9ud8.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
 Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne sreda, 20. december 2023 ob 08:14:27 CET je Frank Oltmanns napisal(a):
>=20
> On 2023-12-19 at 18:04:29 +0100, Jernej =C5=A0krabec <jernej.skrabec@gmai=
l.com> wrote:
> > Dne ponedeljek, 18. december 2023 ob 14:35:23 CET je Frank Oltmanns nap=
isal(a):
> >> This panel is used in the pinephone that runs on a Allwinner A64 SOC.
> >> Acoording to it's datasheet, the SOC requires PLL-MIPI to run at more
> >> than 500 MHz.
> >>
> >> Therefore, change [hv]sync_(start|end) so that we reach a clock rate
> >> that is high enough to drive PLL-MIPI within its limits.
> >>
> >> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> >
> > I'm not too sure about this patch. I see that PLL_MIPI doesn't have set
> > minimum frequency limit in clock driver. If you add it, clock framework
> > should find rate that is high enough and divisible with target rate.
>=20
> This one is really a tough nut. Unfortunately, the PLL_MIPI clock for
> this panel has to run exactly at 6 * panel clock. Let me start by
> showing the relevant part of the clock tree (this is on the pinephone
> after applying the patches):
>     pll-video0                 393600000
>        pll-mipi                500945454
>           tcon0                500945454
>              tcon-data-clock   125236363
>=20
> To elaborate, tcon-data-clock has to run at 1/4 the DSI per-lane bit
> rate [1]. It's a fixed divisor
>=20
> The panel I'm proposing to change is defined as this:
>=20
>     static const struct st7703_panel_desc xbd599_desc =3D {
>     	.mode =3D &xbd599_mode,
>     	.lanes =3D 4,
>     	.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
>     	.format =3D MIPI_DSI_FMT_RGB888,
>     	.init_sequence =3D xbd599_init_sequence,
>     };
>=20
> So, we have 24 bpp and 4 lanes. Therefore, the resulting requested
> tcon-data-clock rate is
>     crtc_clock * 1000 * (24 / 4) / 4
>=20
> tcon-data-clock therefore requests a parent rate of
>     4 * (crtc_clock * 1000 * (24 / 4) / 4)
>=20
> The initial 4 is the fixed divisor between tcon0 and tcon-data-clock.
> Since tcon0 is a ccu_mux, the rate of tcon0 equals the rate of pll-mipi.
>=20
> Since PLL-MIPI has to run at at least at 500MHz this forces us to have a
> crtc_clock >=3D 83.333 MHz. The mode I'm prorposing results in a rate of
> 83.502 MHz.

This is much better explanation why this change is needed. Still, I think
adding min and max rate to PLL_MIPI would make sense, so proper rates
are guaranteed.

Anyway, do you know where are all those old values come from? And how did
you come up with new ones? I guess you can't just simply change timings,
there are probably some HW limitations? Do you know if BSP kernel support
this panel and how this situation is solved there?

>=20
> If we only changed the constraints on the PLL_MIPI without changing the
> panel mode, we end up with a mismatch. This, in turn, would result in
> dropped frames, right?

=46rom what I read, I think frame rate would be higher than 60 fps. What
exactly would happen depends on the panel.

Best regards,
Jernej

>=20
> Best regards,
>   Frank
>=20
> [1] Source:
> https://elixir.bootlin.com/linux/v6.6.7/source/drivers/gpu/drm/sun4i/sun4=
i_tcon.c#L346
>=20
> >
> > Best regards,
> > Jernej
> >
> >> ---
> >>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 14 +++++++-------
> >>  1 file changed, 7 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/g=
pu/drm/panel/panel-sitronix-st7703.c
> >> index b55bafd1a8be..6886fd7f765e 100644
> >> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> >> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> >> @@ -320,14 +320,14 @@ static int xbd599_init_sequence(struct st7703 *c=
tx)
> >>
> >>  static const struct drm_display_mode xbd599_mode =3D {
> >>  	.hdisplay    =3D 720,
> >> -	.hsync_start =3D 720 + 40,
> >> -	.hsync_end   =3D 720 + 40 + 40,
> >> -	.htotal	     =3D 720 + 40 + 40 + 40,
> >> +	.hsync_start =3D 720 + 65,
> >> +	.hsync_end   =3D 720 + 65 + 65,
> >> +	.htotal      =3D 720 + 65 + 65 + 65,
> >>  	.vdisplay    =3D 1440,
> >> -	.vsync_start =3D 1440 + 18,
> >> -	.vsync_end   =3D 1440 + 18 + 10,
> >> -	.vtotal	     =3D 1440 + 18 + 10 + 17,
> >> -	.clock	     =3D 69000,
> >> +	.vsync_start =3D 1440 + 30,
> >> +	.vsync_end   =3D 1440 + 30 + 22,
> >> +	.vtotal	     =3D 1440 + 30 + 22 + 29,
> >> +	.clock	     =3D (720 + 65 + 65 + 65) * (1440 + 30 + 22 + 29) * 60 / =
1000,
> >>  	.flags	     =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> >>  	.width_mm    =3D 68,
> >>  	.height_mm   =3D 136,
> >>
> >>
>=20




