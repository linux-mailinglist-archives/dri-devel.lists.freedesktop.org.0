Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D934052A7A5
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 18:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8717710F814;
	Tue, 17 May 2022 16:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2665E10F180
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 16:09:25 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 nk9-20020a17090b194900b001df2fcdc165so2967557pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 09:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ifrBYPe2YtnQaY3lXxkltamF2qFHora4+SSWUHtal+g=;
 b=meKfja/RfnUFtK6LLF92V1BikRFj4Hi+k9LJ5zrY74z2qMsVN11AEKVRBwyBJDuu2p
 ks7nknIk5lHQqiYK3YxVujkyYus+vCrzwhEkTO2mjVMD9EjRI38YpnIdVJEJW6JxW/+r
 SR1mIM0lnxlErVQGXEPlnDwgiZjHH5Z+XROOnjyRCIB20w+cu8JdoJsRxR3cZIF1hi9t
 BVWQUmxDowfct4m8QT2vXOhI+UApMmgO6K+22GbeEUKHmN3HGW2FfX/wYQj1IW02fHft
 kAMirnn0OAQd+ORlSBASJ1E+6amd4Y0m2YWsUdv1GqkwnZbHUN3qFi5U30AJWGARH429
 IDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ifrBYPe2YtnQaY3lXxkltamF2qFHora4+SSWUHtal+g=;
 b=ABHU+6x2LkHwqQBQ9I/WutRBVyd4IpDYWc6fzZ7qJ5YwMp3EOOl2oBEW4iodKkwazQ
 vFe4+rnYr4jXGCxvFUsIrg0W/0RiC/xR3ALNqyyW+JJdVE8Seu/VHMnchbum8JDFzF7J
 h6tWEd4xE1tHMZYNR4BlHMTlB841ZlbzR/e2f/hGtvVa6t9Qz2rRBOnX+L4yUAuwPSPA
 rvPz3BEWfUMpcsHTswafQO2dt4K8+A+vQ1GJLapYOeobTLOnvywT+Wsz4RsO/yTj6rUg
 6iy9o+POlVpov0mNPQ8mhphtLhfeBcjDCoSwRCkoK73sTOQAM/uU0cspdgh8Fh/1nGcY
 04xA==
X-Gm-Message-State: AOAM531QmYd6rAZJKtFBzY4J5o+YsoNxF475HaPEVEqoM7xyLfcUzXqJ
 KQlYGFaqieQd2jxlmCxF16zyzm728q2yOtP/xISmtw==
X-Google-Smtp-Source: ABdhPJzwz1uqlJwkMERbAIE6HZqOnweEYejZgJePANr9Wer4P5Mw56U+tU7NKwLD4gQ6u0HnBx1I+4Nq63OKq214/i8=
X-Received: by 2002:a17:903:2350:b0:15e:93de:763a with SMTP id
 c16-20020a170903235000b0015e93de763amr23603747plh.117.1652803764549; Tue, 17
 May 2022 09:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220422084720.959271-1-xji@analogixsemi.com>
 <20220422084720.959271-4-xji@analogixsemi.com>
 <CAG3jFytWGSUM9mevHewdmEe-hq3JgB74s7_f0fsEQqkXr9VUHg@mail.gmail.com>
 <CAG3jFyvEYbwkdGtiNR-6vFEXTLjcyT_viqp9qeVxFTu0PrJEVA@mail.gmail.com>
 <CAGXv+5E1cCNWD98fMDjC38y2UztZd=PNQ+=G=wrBYfoXkswvHA@mail.gmail.com>
 <20220425091419.GA967110@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20220425091419.GA967110@anxtwsw-Precision-3640-Tower>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 17 May 2022 18:09:13 +0200
Message-ID: <CAG3jFyvTim7P_y2G1Br5j3Pwz4KzvRjWgci_qQ3m_YW=3Bog8A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/bridge: anx7625: Use DPI bus type
To: Xin Ji <xji@analogixsemi.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 qwen@analogixsemi.com, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 bliang@analogixsemi.com, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Apr 2022 at 11:14, Xin Ji <xji@analogixsemi.com> wrote:
>
> On Mon, Apr 25, 2022 at 04:24:50PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Apr 22, 2022 at 10:13 PM Robert Foss <robert.foss@linaro.org> wrote:
> > >
> > > On Fri, 22 Apr 2022 at 16:01, Robert Foss <robert.foss@linaro.org> wrote:
> > > >
> > > > On Fri, 22 Apr 2022 at 10:49, Xin Ji <xji@analogixsemi.com> wrote:
> > > > >
> > > > > As V4L2_FWNODE_BUS_TYPE_PARALLEL not properly descript for DPI
> > > > > interface, this patch use new defined V4L2_FWNODE_BUS_TYPE_DPI for it.
> > > > >
> > > > > Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > ---
> > > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
> > > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > index 376da01243a3..71df977e8f53 100644
> > > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > @@ -1623,14 +1623,14 @@ static int anx7625_parse_dt(struct device *dev,
> > > > >
> > > > >         anx7625_get_swing_setting(dev, pdata);
> > > > >
> > > > > -       pdata->is_dpi = 1; /* default dpi mode */
> > > > > +       pdata->is_dpi = 0; /* default dsi mode */
> > > > >         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
> > > > >         if (!pdata->mipi_host_node) {
> > > > >                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> > > > >                 return -ENODEV;
> > > > >         }
> > > > >
> > > > > -       bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
> > > > > +       bus_type = 0;
> > > > >         mipi_lanes = MAX_LANES_SUPPORT;
> > > > >         ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
> > > > >         if (ep0) {
> > > > > @@ -1640,8 +1640,8 @@ static int anx7625_parse_dt(struct device *dev,
> > > > >                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> > > > >         }
> > > > >
> > > > > -       if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> > > > > -               pdata->is_dpi = 0;
> > > > > +       if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
> > > > > +               pdata->is_dpi = 1;
> > > > >
> > > > >         pdata->mipi_lanes = mipi_lanes;
> > > > >         if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
> > > >
> > > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > >
> > > Acked-by: Robert Foss <robert.foss@linaro.org>
> >
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > Confirmed this fixes the display on Juniper (Acer Chromebook Spin 311) on
> > mainline (next-20220422).
> >
> > Xin, in the future, please send the whole series to all recipients of
> > all patches listed by get_maintainers.pl, not just the recipients of
> > each patch. In the case of this series, they should have been sent
> > to all of the mailing lists (media, devicetree, dri-devel) so that
> > everyone has the same, full view of the patches.
> Hi ChenYu, OK, I'll send to all media, devicetree, dri-devel next time.
> Thanks,
> Xin
> >
> > ChenYu

Applied 3/4 + 4/4 to drm-misc-next.
