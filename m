Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9B36E46D9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 13:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F4110E460;
	Mon, 17 Apr 2023 11:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D9710E460
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 11:53:19 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id hg12so10788279pjb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 04:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681732399; x=1684324399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W28jZlr43n4A+R8dw3oLWIHuParHAvf3EPiECCIvalU=;
 b=qhPUmExhRfifkoU+BUpekMd1gF/UVzqbLp7FIrS0RngjO+zVlU+4wtXqvS81HXxTCH
 wXRI5D9rv6NJs6cPzwkxyvUaOqdBDHWyYDFRhROC3ZUQLD1x7IHGLBg6qpYIwBNX6pi6
 CkzwtJfULWhZeiHSwtLINQKAJqCW2VVWpHYYusPnxo0O3FBnUABeM5DxYyslSkMplp79
 yFjDrQTb1F4ofmRWcjcKbA56LrHfFKDAtqGldGIq/aZBJGHNF6bqZ/WTSIRG7RYDTKZu
 /qxGVyyeADIj23M3ae8kc4bFZ8CVaxvsVMEqJfhYfai4YD6gJkShoqPFfBzbeE2DR3/S
 lERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681732399; x=1684324399;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W28jZlr43n4A+R8dw3oLWIHuParHAvf3EPiECCIvalU=;
 b=a0bawBb4E0qXmJmpF7NYzoGuNnia0xjWI4YkuqdubNPx67p4sv/kE017XIXLZwrgtV
 Ftkbh4isL5JX6FJQY1W8TdQJQm3kvALaxkbLD15fwwSxv3vhx0ShJEraGMZUqfVsXk17
 HFiRvPIOfVLxDZV1l/lpZku4o2+/DXJ8YqntDnhK08R/O5Abm5q1oFVPHd7wtnUqbIZF
 AzI4VGHpRaNyeco4P5Gugj9200j+fvEM068/j4AXhQKUGX2YwSsZtblgdpgEAErCTsbu
 31m1XegF5rTdL0pU1n1hkTT9HIYoIgV3iIS0YtWUU74IAwGVTExFzZb1LNEYTvJvxFmd
 9JlA==
X-Gm-Message-State: AAQBX9dGiP+J+kLIXUl6eMbOuQ8U3CmI28mw5TI/r+k5pv5ary6RLgzU
 Hf0gnL28w/Yoovkz2ZTI9e3EOMuEHsYpozv1OhM=
X-Google-Smtp-Source: AKy350YurxFnXqjEiS/2z4uyi1r8p2MxvThm75LwFZcyBF9tDX0TFjTvQ5tjopuoyeXI+BEBVKAhjJ3Ze587uvT3574=
X-Received: by 2002:a17:902:f90b:b0:1a6:655f:9efe with SMTP id
 kw11-20020a170902f90b00b001a6655f9efemr3499134plb.3.1681732398572; Mon, 17
 Apr 2023 04:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104104.5537-1-aford173@gmail.com>
 <20230415104104.5537-4-aford173@gmail.com>
 <8db7ad8da4805d7eb4471051676d179e193ee399.camel@pengutronix.de>
In-Reply-To: <8db7ad8da4805d7eb4471051676d179e193ee399.camel@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 17 Apr 2023 06:53:07 -0500
Message-ID: <CAHCN7x+hFu15TM0w5DXzmWZRKEN6=MNNTVLNtpNxbirVGrapdg@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm: bridge: samsung-dsim: Dynamically configure DPHY
 timing
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 m.szyprowski@samsung.com, marex@denx.de, Robert Foss <rfoss@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 3:38=E2=80=AFAM Lucas Stach <l.stach@pengutronix.de=
> wrote:
>
> Hi Adam,
>
> Am Samstag, dem 15.04.2023 um 05:41 -0500 schrieb Adam Ford:
> > NXP uses a lookup table to determine the various values for
> > the PHY Timing based on the clock rate in their downstream
> > kernel.  Since the input clock can be variable, the phy
> > settings need to be variable too.  Add an additional variable
> > to the driver data to enable this feature to prevent breaking
> > boards that don't support it.
> >
>
> I haven't checked if this generates values close to the ones in this
> table, but I guess it should be worth a try to use
> phy_mipi_dphy_get_default_config() instead.

I didn't know that was a thing.  I like that idea much better than the
table.  I just pulled what NXP had and tweaked it to fit the mainline.
I'll give it a try in the next few days, when I have some more time.

adam
>
> Regards,
> Lucas
>
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/samsung-dsim.c |  85 +++++++--
> >  drivers/gpu/drm/bridge/samsung-dsim.h | 254 ++++++++++++++++++++++++++
> >  include/drm/bridge/samsung-dsim.h     |   1 +
> >  3 files changed, 326 insertions(+), 14 deletions(-)
> >  create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.h
> >
<snip>
>
