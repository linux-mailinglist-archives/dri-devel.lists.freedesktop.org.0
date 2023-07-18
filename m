Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C8075782D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 11:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDA9910E18C;
	Tue, 18 Jul 2023 09:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABA910E323
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 09:35:12 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5703cb4bcb4so51950177b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 02:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1689672911; x=1692264911;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZuZrSAvPEUbJd5OtEiU1JarAUP79SOnBKIQtn60jRg=;
 b=beDAomZeLIweO6s7t3IqKAXxXYKPTYoFj9fnhLBgXGFT0V5h2XGwG9aGdUy7NOvLOX
 oUl2PHLF6HdJooyRsHAL9jF2f/DluVwJ+aQ/wAu/JsZfPhiVpfNpTO+ZGISV/JKrS1F6
 IsDvVj+IgAceads0hrKYPsbT6O5fThAt2fSoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689672911; x=1692264911;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZuZrSAvPEUbJd5OtEiU1JarAUP79SOnBKIQtn60jRg=;
 b=j9Ox0eBuyK+YxcXg4f2UOhtVTrNl084sBnedZZX7EyFT3Qa2YFbrupY4jvfLfyUX3t
 +BMUISkfCYPsB+GTJKACNrYUoUBqeM4w1nki9EbgpUA0RVODnFgzjgERD4nEFZ0R9B1q
 bHM2Cz0NFyb1dFEM6eX4HBy1EE50ziLjvyHTN+Mnss6m8l1cW0YZJb8Kt6+8G5kxAW/W
 qV7ZdSpC1y1HKGU/pfQNauBVxLRvehjdZnqCKQfilFb0XN091uoB9VNUwMqeKT1lBLkt
 fSzT7B54U/wyaaC3QCicPXyRlZ95yyfgH74LSQbFDVTcECj7tTU1TBJGkUIEBqNQE2Gx
 UViQ==
X-Gm-Message-State: ABy/qLaTbQd1AW/qWYlVFyXeYN5QOYNQUqHznyD9AfO6p+92nf0gFOj5
 yhzk5HXlqD6M64mwk6/ZDBy2yM0rOMYmkNh2Din2Wg==
X-Google-Smtp-Source: APBJJlF/MxnGn8lFNIRQU/KngoAwMjYwViZydcOi2ql72YhnbZ9RzDHMFUqc3oHkB1xUdPZ6H35xN/bkucaHK93q1No=
X-Received: by 2002:a81:5e85:0:b0:57a:2e83:4daf with SMTP id
 s127-20020a815e85000000b0057a2e834dafmr15563029ywb.32.1689672911028; Tue, 18
 Jul 2023 02:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-10-victor.liu@nxp.com>
 <CAMty3ZAdzASJCz+j4iOTJ+wCXWP2Z48jFL687kxDmJLPU7T6gA@mail.gmail.com>
 <AM7PR04MB7046BF03266ED1CE21CFC3A99838A@AM7PR04MB7046.eurprd04.prod.outlook.com>
In-Reply-To: <AM7PR04MB7046BF03266ED1CE21CFC3A99838A@AM7PR04MB7046.eurprd04.prod.outlook.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 18 Jul 2023 15:04:59 +0530
Message-ID: <CAMty3ZDy7Ty2AUV+Ab60nvgBzyLB-ejM=Yij9RFyTNvJBG_EvA@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/bridge: imx: Add i.MX93 MIPI DSI support
To: Ying Liu <victor.liu@nxp.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, dl-linux-imx <linux-imx@nxp.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 8:28=E2=80=AFAM Ying Liu <victor.liu@nxp.com> wrote=
:
>
> Hi Jagan,
>
> On Monday, July 17, 2023 2:44 PM Jagan Teki <jagan@amarulasolutions.com> =
wrote:
> > On Mon, Jul 17, 2023 at 11:44=E2=80=AFAM Liu Ying <victor.liu@nxp.com> =
wrote:
> > >
> > > Freescale i.MX93 SoC embeds a Synopsys Designware MIPI DSI host
> > > controller and a Synopsys Designware MIPI DPHY.  Some configurations
> > > and extensions to them are controlled by i.MX93 media blk-ctrl.
> > >
> > > Add a DRM bridge for i.MX93 MIPI DSI by using existing DW MIPI DSI
> > > bridge helpers and implementing i.MX93 MIPI DSI specific extensions.
> >
> > I think the better way would add compatibility to be part of existing
> > dw-mipi-dsi.c with specific driver data. This way it avoids all the
> > platform-related helpers(extensions) and makes the driver generic to
> > all SoCs which use DW DSI IP. It would be a straightforward change as
> > the imx93 drm pipeline already supports bridge topology.
>
> The platform-related stuff is handed over to dw-mipi-dsi.c via struct
> dw_mipi_dsi_plat_data as an argument of dw_mipi_dsi_probe().  It looks
> ok for vendor drivers to call dw_mipi_dsi_probe() to set the platform-rel=
ated
> information(rockchip, meson and stm do that), like pdata.phy_ops and
> pdata.host_ops.

I understand this topology of having soc-platform drivers with
dw-mipi-dsi bridge. What I'm suggesting is to not add a soc-platform
driver for imx93 instead add add support directly on dw-mipi-dsi
bridge.

>
> dw-mipi-dsi.c is generic w/wo this patch series.
>
> Can you elaborate more about adding compatibility to be part of existing
> dw-mipi-dsi.c with specific driver data?  I don't see clear approach to d=
o
> that.

Please check the above comments, an example of samsung-dsim.c

Thanks,
Jagan.
