Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFBD6E7794
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 12:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3105110E92C;
	Wed, 19 Apr 2023 10:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B37CE10E92D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 10:42:02 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-63b4960b015so2614133b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 03:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681900922; x=1684492922;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5MdNpSS+OOI19jq0uYTZJnCcJQUPASUIXiKZhUZv1Dk=;
 b=qPRkEGyJsDCSaZp4ogPYKDiohjMXJ0vzEVw3ywT3uU/GKNXrfLhJZ6WO/RujYYRmnF
 PIWdYM8XUTae0Uwqo7K/BsM/m71gYS2qAaYZAovPC1ozzLxvbFBxNBj2itCjIfsdCZJz
 oYXRbDEc4jvuxTsiYF9N+36SWDKzN6YFkfpmByLMKoupMARS4SESLcF10sB+s5JNHtH+
 eU6mOiWuF6DAzFXziTij97EURj0NDOKUoNwtwn7c6F8otf7HQY66n+v+ABnb1PuUo9vp
 1st/sxXJ8d2dMZe0h1UZDcj5KiM9BY58WSMtHv03DVWR0PY6UdrnmgJzZ4HyJLaQfrvf
 4SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681900922; x=1684492922;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5MdNpSS+OOI19jq0uYTZJnCcJQUPASUIXiKZhUZv1Dk=;
 b=RkfO+UbmI/YOQ3ALAixpSGgE7HjqsCU2P9UgHHuUcLbYfYyiBz+BwI83Ex68MED/Lr
 BB7clVjLy+nv1tk9YRJfbBLJx3WEMGqyXWe0JFCGEZhCW1a8fWBD6L8m5N5QOdMwnY73
 ZNGZTvLRB2BE69stFwDGlVlh/moFEXw+m4hIGPQOR++KOWIeT/T5CdSxD/Hz67ScYZJl
 JlbS/HirSFJhTh661Qn3Cz88sKbshcKuXGs9pmvD++Mn0PkRDy2EJPUiJnJs+qYQRgqj
 S8A+P1ro1zEjDBy9EufxRUvLvlW3Wm0MCiDERD3gebrukPO29QxQwjNWkIM7hMUULu6X
 7z5g==
X-Gm-Message-State: AAQBX9fBEiGRUF4D0vdMnhzyuLDZnR3YSKy0Yh4Meg6ry2pGuwFUM6XY
 q4dyCwMMYt7WqQokkCIZdS1U6wpXl4IcW9X5K3o=
X-Google-Smtp-Source: AKy350YK8qcAcZopioCgqzrCcc04oP+3g3LHqjy7As6Hr0znMSBB+LYIyMZez9fjGSi2RP7eMP/QK1WXZ/RF5wuQ8GQ=
X-Received: by 2002:a17:90a:9802:b0:247:160d:3a8e with SMTP id
 z2-20020a17090a980200b00247160d3a8emr2278200pjo.22.1681900921522; Wed, 19 Apr
 2023 03:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230415104104.5537-1-aford173@gmail.com>
 <20230415104104.5537-3-aford173@gmail.com>
 <7eed74e8-9f67-a410-3cec-f61a6db85238@denx.de>
 <CAHCN7xKw26TQ=t75TEDbEkA0mb9rnEwNW=7ei1=WFBZjiJMf=g@mail.gmail.com>
 <56085a0f-02f7-6f45-f351-1f9ee612b748@denx.de>
 <426e901f14254cfcff87ba1747534f9b856ef738.camel@pengutronix.de>
In-Reply-To: <426e901f14254cfcff87ba1747534f9b856ef738.camel@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 19 Apr 2023 05:41:49 -0500
Message-ID: <CAHCN7xLL+VBYfL_si07zhdLgV431H7XSxf6U_50mtAH-BZL=SA@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm: bridge: samsung-dsim: Fetch pll-clock-frequency
 automatically
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 3:47=E2=80=AFAM Lucas Stach <l.stach@pengutronix.de=
> wrote:
>
> Am Dienstag, dem 18.04.2023 um 10:30 +0200 schrieb Marek Vasut:
> > On 4/18/23 04:29, Adam Ford wrote:
> > > On Sun, Apr 16, 2023 at 5:08=E2=80=AFPM Marek Vasut <marex@denx.de> w=
rote:
> > > >
> > > > On 4/15/23 12:41, Adam Ford wrote:
> > > > > Fetch the clock rate of "sclk_mipi" (or "pll_clk") instead of
> > > > > having an entry in the device tree for samsung,pll-clock-frequenc=
y.
> > > > >
> > > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > > ---
> > > > >    drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++------
> > > > >    1 file changed, 6 insertions(+), 6 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/=
drm/bridge/samsung-dsim.c
> > > > > index 9fec32b44e05..73f0c3fbbdf5 100644
> > > > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > > > @@ -1744,11 +1744,6 @@ static int samsung_dsim_parse_dt(struct sa=
msung_dsim *dsi)
> > > > >        struct device_node *node =3D dev->of_node;
> > > > >        int ret;
> > > > >
> > > > > -     ret =3D samsung_dsim_of_read_u32(node, "samsung,pll-clock-f=
requency",
> > > > > -                                    &dsi->pll_clk_rate);
> > > > > -     if (ret < 0)
> > > > > -             return ret;
> > > > > -
> > > > >        ret =3D samsung_dsim_of_read_u32(node, "samsung,burst-cloc=
k-frequency",
> > > > >                                       &dsi->burst_clk_rate);
> > > > >        if (ret < 0)
> > > >
> > > > Does this break compatibility with old samsung DTs ?
> > >
> > > My goal here was to declutter the device tree stuff and fetch data
> > > automatically if possible. What if I changed this to make them
> > > optional?  If they exist, we can use them, if they don't exist, we
> > > could read the clock rate.  Would that be acceptable?
> >
> > If you do not see any potential problem with ignoring the DT property
> > altogether, that would be better of course, but I think you cannot do
> > that with old DTs, so you should retain backward compatibility fallback=
,
> > yes. What do you think ?
>
> I'm very much in favor of this patch, but I also think we shouldn't
> risk breaking Samsung devices, where we don't now 100% that the input
> clock rate provided by the clock driver is correct.
>
> So I think the right approach is to use "samsung,pll-clock-frequency"
> when present in DT and get it from the clock provider otherwise. Then
> just remove the property from the DTs where we can validate that the
> input clock rate is correct, i.e. all i.MX8M*.

I'll update this accordingly when I do a V2 of this series.

adam
>
> Regards,
> Lucas
