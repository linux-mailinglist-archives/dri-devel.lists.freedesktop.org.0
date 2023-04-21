Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E5B6EA985
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 13:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E816210E2D8;
	Fri, 21 Apr 2023 11:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D9910E2D8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 11:45:08 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-63b4a64c72bso1806626b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 04:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682077507; x=1684669507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gqJNVo1ugMPScl25MbOFNWwX6gbBlo39fajL+yXdhtA=;
 b=Ms+U9Jv9OItrSM1BgXXENvFtjqarSrIuubRqZ1mhl6oYvQ3zrYJvb4U93/qV0uIZOI
 4PmshBR2+nlGBYR+YEOJmOfifOH6vzxLxoQuYRuY3xSqtE2lL/N9kV9jAWvXVq1uULE9
 LOhsBJsB6Ln/AF3kUEWa1/ZKtCRguYnK+So9Yq7xYh3iiHueLHy1OoVnay4lHPmM817/
 pR6GCz16n5GwGcN9o82A9DeAQJ+2mtKbCw62Hh7lD53Xf/Sy6ZPy1UrO2z0yDQsMncK0
 zc0yiyH7+thS5pAbF6YgFZvNg7NNi+wFktCIjyYDbP9tONtMUgjrf3+OIPloTBgqZwec
 vMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682077507; x=1684669507;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gqJNVo1ugMPScl25MbOFNWwX6gbBlo39fajL+yXdhtA=;
 b=WKsUekRswHO77JRQ4KBgWM/C+dvOk4it+OfFEuwc8V24RTZAygkpDc9JZvjeEx8dBZ
 DvYBqhHRb7LN5I+Ahawlk0NUf2qoem8QTNgKU+mnnWwaARLledGt+mxKGWNlxve4dDTt
 5D7zbfTVBA/AThtPAYhXbpBxUc9//quGvmn3MuzKzqv3xbkkGxSYDUingIIsltYSLSx2
 vFPdXMNOqlWn3eqNYQRLtgo3QiotEO+jOGWq/fmcnW7ZtbZ49NFDgaU4Rdk0TgQ9z2zj
 gNOgkFqxpoUlaURnOqNIhYPjspvsdb4YKnyXWwC/U5yDQ+BGaLKYyhr/GgbPsDZrgPmH
 ls/A==
X-Gm-Message-State: AAQBX9e9CT0lX5628/ZxLSgywcKuwmM0Fodv6iHQk2VZdpidDavBvw21
 z0TLeyvzA1pBud8wUiJBs9jlp2dDBFuKOCCPRw8=
X-Google-Smtp-Source: AKy350YpOhenGXBe/s0poJBk6edH+aClaK5RrnBiGJXEZxlCcOkCSie5j9Yrp7SF0bq0/Raa82MiBoALCUKq+c+IHjo=
X-Received: by 2002:a05:6a20:1582:b0:f0:5920:77b1 with SMTP id
 h2-20020a056a20158200b000f0592077b1mr7291900pzj.28.1682077506868; Fri, 21 Apr
 2023 04:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104104.5537-1-aford173@gmail.com>
 <CGME20230415104123eucas1p103250c1748170354509932778b233900@eucas1p1.samsung.com>
 <20230415104104.5537-3-aford173@gmail.com>
 <28219b3d-e2cc-63b1-555b-c3845300f45a@samsung.com>
In-Reply-To: <28219b3d-e2cc-63b1-555b-c3845300f45a@samsung.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 21 Apr 2023 06:44:55 -0500
Message-ID: <CAHCN7x+EwT44BiBqyOCkt06Z7TFVt-00-S52re2RKsQaLvQuUw@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm: bridge: samsung-dsim: Fetch pll-clock-frequency
 automatically
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, marex@denx.de,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 21, 2023 at 6:25=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> On 15.04.2023 12:41, Adam Ford wrote:
> > Fetch the clock rate of "sclk_mipi" (or "pll_clk") instead of
> > having an entry in the device tree for samsung,pll-clock-frequency.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> This one breaks DSI panel operation on my Exynos-based Trats, Trats2 and
> TM2e boards. I've didn't check the details, but probably something is
> missing in the dts to make it working properly. Surprisingly the display
> is still working fine on Arndale board with DSI TC358764 bridge.

Thanks for testing!  I'm going to update this patch in V2 which will
use the device tree settings if they are present.  If they are
missing, they will fetch the clock rate instead of failing.  This way,
it should mitigate breaking your boards, but it will allow the imx8m
mini/nano/plus to eliminate hard-coding some device tree entries since
they can be fetched automatically.

adam
>
> > ---
> >   drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/br=
idge/samsung-dsim.c
> > index 9fec32b44e05..73f0c3fbbdf5 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1744,11 +1744,6 @@ static int samsung_dsim_parse_dt(struct samsung_=
dsim *dsi)
> >       struct device_node *node =3D dev->of_node;
> >       int ret;
> >
> > -     ret =3D samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequen=
cy",
> > -                                    &dsi->pll_clk_rate);
> > -     if (ret < 0)
> > -             return ret;
> > -
> >       ret =3D samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequ=
ency",
> >                                      &dsi->burst_clk_rate);
> >       if (ret < 0)
> > @@ -1823,13 +1818,18 @@ int samsung_dsim_probe(struct platform_device *=
pdev)
> >               if (IS_ERR(dsi->clks[i])) {
> >                       if (strcmp(clk_names[i], "sclk_mipi") =3D=3D 0) {
> >                               dsi->clks[i] =3D devm_clk_get(dev, OLD_SC=
LK_MIPI_CLK_NAME);
> > -                             if (!IS_ERR(dsi->clks[i]))
> > +                             if (!IS_ERR(dsi->clks[i])) {
> > +                                     dsi->pll_clk_rate =3D clk_get_rat=
e(dsi->clks[i]);
> >                                       continue;
> > +                             }
> >                       }
> >
> >                       dev_info(dev, "failed to get the clock: %s\n", cl=
k_names[i]);
> >                       return PTR_ERR(dsi->clks[i]);
> >               }
> > +
> > +             if (strcmp(clk_names[i], "sclk_mipi") =3D=3D 0)
> > +                     dsi->pll_clk_rate =3D clk_get_rate(dsi->clks[i]);
> >       }
> >
> >       dsi->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
>
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
