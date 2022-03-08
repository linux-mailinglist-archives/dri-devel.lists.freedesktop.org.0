Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D844D1440
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 11:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9689F10E34B;
	Tue,  8 Mar 2022 10:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA5410E34F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 10:07:58 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id qt6so37983951ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 02:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wjq5d37nDqkRC7sNFuDZ5VhqK60r/cIBXSzUP4l+0VM=;
 b=j5DfEcIHPg9855vtFAKEp1b90EfmdUbMHejc4faC0p/1JANu+o+ey1O9YMyLCI8akL
 KH5+C0J5gbFcwboWqGwS2Dnuyil97uu3vftEGVy7GQpR1I2yq4tNSDp9BtQl7Oj/LMZU
 7X850PP9u8TDLELdXxP3rosMymSCBRyF5X1x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wjq5d37nDqkRC7sNFuDZ5VhqK60r/cIBXSzUP4l+0VM=;
 b=g435zsukiOorv+H4vO/OqtGhrHx9Ue1hQk1sMWxPGWvQV5I5GbLfZ6s4icO3voBlHM
 /eZrZkOcMUBlmMbyr334Pud2JiUtl6Ndz7efPaLw8Xxsq3u1rqMZxXRyixLRRi7APbeL
 gkuX3fF9sevPPLKSpVF/1nNfMqjCCGDkeqhyLbsHiJjO8ZnA9tCJOlNLtZc+tbNcwjk+
 1gXuOcM3d7szzVtGDB4rudsFyzbagUoRur+M3Eb3VpIaXokiQVPXMvKAdMkIV+qZBQUQ
 ipavgBaYf8KuWE9oKm+lb4p/dj813Suv9YCGFQ06fv5/EIKTinTzW8ztniYmBcIZcjcg
 u/8A==
X-Gm-Message-State: AOAM532/OuEwBFEdSoGWswYHftOggk+y5PPNHOScZt3G7lz9yc/8udxZ
 c2HIWEu/S4+kkv2UmIl/FIrkp/aeqPDXa/tWCxYVHw==
X-Google-Smtp-Source: ABdhPJxZTnLDNJCysnV2dsH8GogneTgGvG9QzSkujmPMSoBqlmSx9JbeYOE4+G1zdSC2DxI1t5f6CESsQcyKzSyxQuo=
X-Received: by 2002:a17:906:4ccd:b0:6b7:75ca:3eac with SMTP id
 q13-20020a1709064ccd00b006b775ca3eacmr12442004ejt.167.1646734076539; Tue, 08
 Mar 2022 02:07:56 -0800 (PST)
MIME-Version: 1.0
References: <20220304002508.75676-1-marex@denx.de>
 <20220304002508.75676-6-marex@denx.de>
 <CAMty3ZATJ56i0BEHh=MH=RHCtDL2bCWUDFniYL0OCf8RpZnaLg@mail.gmail.com>
 <a660a280-0130-3ca1-d849-db3e49626bfb@denx.de>
In-Reply-To: <a660a280-0130-3ca1-d849-db3e49626bfb@denx.de>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 8 Mar 2022 15:37:45 +0530
Message-ID: <CAMty3ZAog47EsU4L15zytgWSpU6DgBBX4wBhzKDOGRL2qgpqiw@mail.gmail.com>
Subject: Re: [PATCH V3 05/13] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 8, 2022 at 3:19 PM Marek Vasut <marex@denx.de> wrote:
>
> On 3/8/22 09:03, Jagan Teki wrote:
>
> Hi,
>
> [...]
>
> >> @@ -314,7 +321,9 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
> >>   static int chipone_parse_dt(struct chipone *icn)
> >>   {
> >>          struct device *dev = icn->dev;
> >> +       struct device_node *endpoint;
> >>          struct drm_panel *panel;
> >> +       int dsi_lanes;
> >>          int ret;
> >>
> >>          icn->vdd1 = devm_regulator_get_optional(dev, "vdd1");
> >> @@ -350,15 +359,42 @@ static int chipone_parse_dt(struct chipone *icn)
> >>                  return PTR_ERR(icn->enable_gpio);
> >>          }
> >>
> >> +       endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> >> +       dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> >> +       icn->host_node = of_graph_get_remote_port_parent(endpoint);
> >> +       of_node_put(endpoint);
> >> +
> >> +       if (!icn->host_node)
> >> +               return -ENODEV;
> >
> > The non-ports-based OF graph returns a -19 example on the Allwinner
> > Display pipeline in R16 [1].
> >
> > We need to have a helper to return host_node for non-ports as I have
> > done it for drm_of_find_bridge.
> >
> > [1] https://patchwork.amarulasolutions.com/patch/1805/
>
> The link points to a patch marked "DO NOT MERGE", maybe that patch is
> missing the DSI host port@0 OF graph link ? Both port@0 and port@1 are
> required, see:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml#n53
>
> What is "non-ports-based OF graph" ?
>
> I don't see drm_of_find_bridge() in linux-next , what is that ?

port@0 is optional as some of the DSI host OF-graph represent the
bridge or panel as child nodes instead of ports. (i think dt-binding
has to fix it to make port@0 optional)

Example OF-graph is on the commit message.
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/drm_of.c?id=80253168dbfd256bca97cf7f13312863c5a7f2e5

Jagan.
