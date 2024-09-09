Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A31970CF7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 07:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A2C10E2B3;
	Mon,  9 Sep 2024 05:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b="01/HNSFT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCD310E2B3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 05:30:03 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2f75aa08a96so23068041fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Sep 2024 22:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1725859802; x=1726464602;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2ngmaSXcBqewvYTJxzeO329sFBXri/yhAj5w7/Inig=;
 b=01/HNSFTiT9/racmIpN1sMJ+qjZ6oitT5kwASRk+tLm6tMgHd2q+weNWsGfXp9xRTj
 jOJsb4SDAcGntY1IhiJr5WQ3dXzCwXtPku1/KOtKGC5nEAZPf86OBsRt5DSL+FJKnGsV
 3D6oWLkD4wDZ9VQOw9g7MCMa+N0HG1rX3swRc4RRiJgPw6G7Vqr72kM35jz8iZm6EEIZ
 jPZVkt/fGgmVr6yKCcYR4yNE4AWaK5oy1A6QFVgvpu48+0mZ0qMljJ62e7wkBQfTsayd
 vnLhpwOispNlDl8qYNH9cKmrkDgIhedOpDs7/yRxz5cq0BFOG0tEb8JvcwLl2m63ptSB
 l+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725859802; x=1726464602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M2ngmaSXcBqewvYTJxzeO329sFBXri/yhAj5w7/Inig=;
 b=bi+3SdhQXaUKjsQUPlsR6Qyu5ier66CGqU33VJcYZv5J4nVhh+J5aEQfeWQlrfY2Ye
 2SoQom6ANrqs1pX/H6RJns5ckp3oF7N1WLfXCOrlDdy7/z3urcgdtHcgFbemdmJ9LcxZ
 ddgi5int6KQBTfN1LbYii7Ldjy0zxzYYKG/+3wFTBdzMJvWP8g4SabCgIagLMtkAriZY
 6JM2zSffLnPZJbTRXxeF0yia/LcBKKR9BtkVb0U0eYuVZAOuTDhZjTGGmBiC3ZwHb/N+
 jz1uJN6BgBLqsX7mzsKmQAgeKtLRQEktDkwGM3UQbtw+34O7t1brEBENt8ijeFTzOZ6Z
 7AcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPpwYt6tST2t9fQpNSQwZRDVNCK0SBhJdzQP2GC6xKNTqaE8/o4mYYMK9IV5J9Eors/AEgQnZnLOA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0MktwJgPDylzhP5Pn05DsepXCBDlbhxbw3fe3AmFtOuUPugt5
 3TDHgOxsyELaHtivUws3P9PNNhOmIe93GoMrvbwjYQwUFaadgqpMlJ48662D2PZMCA3LbZxZn+i
 QSYBaoyNyiPVu6l0ZM2znA1Lx0p48sDPP83k++g==
X-Google-Smtp-Source: AGHT+IHltu72PrN7ncZlY52C7Xqomq1WLsnBRUjIxxx0pxPEleRO1qqrTtBPbeEkK9A2Oz54wKSGz/uiIYvo9FfCW9o=
X-Received: by 2002:a2e:be0b:0:b0:2f7:5cf9:46dd with SMTP id
 38308e7fff4ca-2f75cf94792mr37355141fa.45.1725859801484; Sun, 08 Sep 2024
 22:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
 <20240506-tc358775-fix-powerup-v1-9-545dcf00b8dd@kernel.org>
 <CAHgnY3=KCD4gyJ4nL6nN1tvWcsiRQL+Oz11RNOniDdyMoEPcSg@mail.gmail.com>
 <D3Z9XTBHSUEN.2GW0UCIPLR6HY@kernel.org>
In-Reply-To: <D3Z9XTBHSUEN.2GW0UCIPLR6HY@kernel.org>
From: Daniel Semkowicz <dse@thaumatec.com>
Date: Mon, 9 Sep 2024 07:29:50 +0200
Message-ID: <CAHgnY3=bRyAoDDm8dCuT0z7MaF_LzCa-MDYRqQgKVqgVhFcJjw@mail.gmail.com>
Subject: Re: [PATCH 09/20] drm/bridge: tc358775: remove complex vsdelay
 calculation
To: Michael Walle <mwalle@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Vinay Simha BN <simhavcs@gmail.com>, Tony Lindgren <tony@atomide.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 6, 2024 at 4:34=E2=80=AFPM Michael Walle <mwalle@kernel.org> wr=
ote:
>
> Hi Daniel,
>
> > > To cite the datasheet on VSDELAY:
> > >   During DSI link speed is slower than that of LVDS link=E2=80=99s, d=
ata needs
> > >   to be buffer within 775XBG before outputting to prevent data from
> > >   underflow. Register field VPCTRL[VSDELAY] is used to for this purpo=
se
> > >
> > > This driver assumes that the DSI link speed is the pixel clock (as do=
es
> > > every DSI bridge driver), after all the LVDS clock is derived from th=
e
> > > DSI clock. Thus we know for a fact, that the DSI link is not slower t=
han
> > > the LVDS side. Just use the (sane) default value of the bridge and dr=
op
> > > the complicated calculation here.
> >
> > I am not convinced this is a good idea to revert to a default
> > VSdelay value. I tested your patch series with RK3399 platform
> > and default value (5) was not enough there. There was small data
> > underflow visible, resulting in display offset. Removing this patch
> > and using the original calculation formula fixed the problem.
> > The calculated VSDELAY value seems to be a lot bigger than required,
> > but keeps us on the safe side.
>
> Did you use just parts of this series or did you port the "lp11
> notify" mechanism to the rk3399 platform? Please keep in mind, that
> this bridge doesn't really work if the reset isn't deasserted during
> lp-11 mode and lots of odd things happen.

I pulled in your complete series and ported "lp11 notify" to RK3399.
Both reset and standby pins are connected to the bridge on my board.

>
> Also, do you know if you have an EEPROM attached to the bridge or
> does any firmware part initialize that bridge?

The initialization is done only by Linux kernel driver with your patches.

>
> > It looks that hback-porch value for panel is used also on DSI link,
> > effectively delaying hactive data delivered to TC358775 bridge.
> > I suspect this causes the requirement for higher VSDELAY.
>
> It was ages ago since I've worked on this bridge and extensively
> tested and even measured and decoded the DSI link and the LVDS
> stream. But IIRC this delay was only to compensate the difference
> between the DSI clock and the LVDS clock, that is, if you push the
> pixel stream slower into the bridge than the bridge is pushing it
> out to the LVDS panel.
>
> So the back porch should be irrelevant here (?!).

That was also my initial understanding, but for some reason original algori=
thm
for VSDELAY in tc358775 driver, takes blanking period into calculation.
It does not base only on DSI and LVDS clocks.
Additionally, my experiments show that the default value is too low
in my configuration.

>
> -michael

Kind regards
Daniel
