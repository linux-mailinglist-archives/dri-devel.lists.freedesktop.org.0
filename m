Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A653164928C
	for <lists+dri-devel@lfdr.de>; Sun, 11 Dec 2022 06:42:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7404410E056;
	Sun, 11 Dec 2022 05:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF33F10E056
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Dec 2022 05:42:37 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-3bf4ade3364so104595657b3.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Dec 2022 21:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NFxawhL0KfDzuzdjctBHI9Ha+b92IrPz3S8apbaIAuw=;
 b=n4xri01w9mgE1NGrQAztjwvfE9iV3uWuueuIXpbo7KZk5QIt/7wHDEo0EozqtsddWQ
 QE9CryX4yy27NDoOyxLed3YjtmiWnyozfpODdcqHqGbHkNaN7medJEGdIMQch34L8o7B
 a4efIUKf7em/YpUoslNIif0gjmy3BVPCNdfq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NFxawhL0KfDzuzdjctBHI9Ha+b92IrPz3S8apbaIAuw=;
 b=tSE11MeRsCxJjbFFOhUzcHs71zzDz57NbT2SfOvyx6rtS84lSKhh02pdr3YsbpdcYv
 N9nKhVr9eTeYZavBrjBB+Bg5DvbgUoJUIS+G7vE0TYKS/dk1Juu+xsD6gdjovevPVEvJ
 qKJuZCeLqLjmW37by+0+F8ueQhSiXpJ1EYtvXIt5z6sjvVLNkMd22i2vyfMvOBuM5d+K
 g5k7srSvD2IWrZANBAJMPv4Wv5vyfuJnpcsmyjhRtZa/NctJe4K6VMPAW14yTY+EVrBs
 gfdyfmgUt61MIRft8l6HASZAmr+lyeUw4S3YXg9eX/sa+pLE+Kd+f58ff+xuoQRkMu4D
 Vzng==
X-Gm-Message-State: ANoB5plKqKwQVb15Cr7vb+MzEKdDx9jKBLY9YKbwHCPzj3dKjAk87qc3
 iByTyXHPqu+hnNYzlDr+9zB/QklYwR0lAdMo8fj8gg==
X-Google-Smtp-Source: AA0mqf7thi1tNlYFTPA6vPcT/C7J48KFPQeC2m6uwVTSUSWtmYDnaf5i22q4xvbZwndDQQq6XZzQcMJ23MZKlKlKhAE=
X-Received: by 2002:a0d:d595:0:b0:3c4:df92:a3d2 with SMTP id
 x143-20020a0dd595000000b003c4df92a3d2mr49499665ywd.487.1670737356880; Sat, 10
 Dec 2022 21:42:36 -0800 (PST)
MIME-Version: 1.0
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <20221209152343.180139-8-jagan@amarulasolutions.com>
 <4396da63-d9c0-a9b4-3953-67e6bcfb1bf1@denx.de>
In-Reply-To: <4396da63-d9c0-a9b4-3953-67e6bcfb1bf1@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Sun, 11 Dec 2022 11:12:25 +0530
Message-ID: <CAMty3ZBOR_Bif9PUdiFgVzFLANhFn57pQTrn5=aFXgHEnA1=rA@mail.gmail.com>
Subject: Re: [PATCH v9 07/18] drm: bridge: samsung-dsim: Lookup OF-graph or
 Child node devices
To: Marek Vasut <marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 11, 2022 at 7:58 AM Marek Vasut <marex@denx.de> wrote:
>
> On 12/9/22 16:23, Jagan Teki wrote:
> > The child devices in MIPI DSI can be binding with OF-graph
> > and also via child nodes.
> >
> > The OF-graph interface represents the child devices via
> > remote and associated endpoint numbers like
> >
> > dsi {
> >     compatible = "fsl,imx8mm-mipi-dsim";
> >
> >     ports {
> >       port@0 {
> >            reg = <0>;
> >
> >            dsi_in_lcdif: endpoint@0 {
> >                 reg = <0>;
> >                 remote-endpoint = <&lcdif_out_dsi>;
> >            };
> >       };
> >
> >       port@1 {
> >            reg = <1>;
> >
> >            dsi_out_bridge: endpoint {
> >                 remote-endpoint = <&bridge_in_dsi>;
> >            };
> >       };
> > };
> >
> > The child node interface represents the child devices via
> > conventional child nodes on given DSI parent like
> >
> > dsi {
> >     compatible = "samsung,exynos5433-mipi-dsi";
> >
> >     ports {
> >          port@0 {
> >               reg = <0>;
> >
> >               dsi_to_mic: endpoint {
> >                    remote-endpoint = <&mic_to_dsi>;
> >               };
> >          };
> >     };
> >
> >     panel@0 {
> >          reg = <0>;
> >     };
> > };
> >
> > As Samsung DSIM bridge is common DSI IP across all Exynos DSI
> > and NXP i.MX8M host controllers, this patch adds support to
> > lookup the child devices whether its bindings on the associated
> > host represent OF-graph or child node interfaces.
> >
> > v9, v8, v7, v6, v5, v4, v3:
> > * none
> >
> > v2:
> > * new patch
>
> This looks like a good candidate for common/helper code which can be
> reused by other similar drivers.

Yes, I have responded to the same comment of yours in v7 [1]. It is
hard to make this code work in a generic way.

[1] https://lore.kernel.org/all/CAMty3ZBtRZ-vDPQYX+m8uWmsD+vmbFOnCGVba8swQ8GWtWaKJQ@mail.gmail.com/
