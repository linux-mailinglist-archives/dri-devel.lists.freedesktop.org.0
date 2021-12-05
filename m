Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D1E4693E8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDB173EEB;
	Mon,  6 Dec 2021 10:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4222C6F54E
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Dec 2021 17:39:43 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id x5so8052236pfr.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Dec 2021 09:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8k1Mi/CWgvGzT8825G508wIIyVfYt30GnRRZ1bQDxxg=;
 b=kH05+KMxla1RZMp5XgzCwC19g3ulrSOvp1JCv1/kpLPpKmUcWXv09OaPAfoJna46XZ
 rtUNv3kHVhcMgRoy9vOZDCakkL/hHg7TUBcgvEBgHbqm6h7c8Q8yMWQn0Gjw/1CuTVJ4
 E9ogXiRbxnlCIbbpGpRCEAYdDBETQUQJXlrSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8k1Mi/CWgvGzT8825G508wIIyVfYt30GnRRZ1bQDxxg=;
 b=nsmhv/MAvhgWqh1TLN5b73BDRgBYuvGlwfDpWQdCwh33iGA+GYp6VXuFrOxWSBgjYI
 kXaOV0rLQNWPFKf/sRPK+LjR75X/ukC/IFd/VjDtzbqzZlOwuXdhZCA7GkrLwqyU4s3W
 caHoz8ChhcEWUd4NZOstEpSBhqyINexPE0CvsDQSizLB0RXocnu+2nS1UX859+8CQI/B
 wggGfCpdvYd0iOAtoaLig5u6s7ehHljfR9zN4PEwctXnPrcnFBCvjf6E9wpwXcgoUpxD
 O9yL1qUu9OetBl3F0jnypbcJByBQSwQBEhPW46/iclR8FbnuoaFDq4NunnsDkI1Mxz9D
 B0Jw==
X-Gm-Message-State: AOAM530XhBos+AfK/5c2A75n+6P27F6P6sPR+yRKfxKWv0QgzrNpEGNV
 VdiTNG9whzocFyfbIm/AsXMQ8u+PeNQJHhjaMHH44g==
X-Google-Smtp-Source: ABdhPJw6D8Rm4lgoFcrbhJzZVz4mYjd2CyCaow2QItU/GCD8FoVDg+hKoQQay32DWZbQfaXs8JvKfo9Y5yzr8tUE8zA=
X-Received: by 2002:a05:6a00:1a8e:b0:49f:a4a9:8f1e with SMTP id
 e14-20020a056a001a8e00b0049fa4a98f1emr31834482pfv.67.1638725982485; Sun, 05
 Dec 2021 09:39:42 -0800 (PST)
MIME-Version: 1.0
References: <20211122065223.88059-4-jagan@amarulasolutions.com>
 <20211122100712.dls4eqsu6o5gcc5k@gilmour>
 <CAMty3ZDkUSfW_+PosjgY_GQB3wSvNRaCjwq_nOwWHo-RGQUVFw@mail.gmail.com>
 <20211122140457.jm7cwpp2h3fkf2nd@gilmour>
 <CAMty3ZByw=ZjN3z2UsKj5X5kvrpwCFNUohAnO=O1d29jLPR1Yw@mail.gmail.com>
 <CAMty3ZBizr0uw6VrKBQ9AEYe48_QJKb0QC=pGEcA3OGK_CfQkw@mail.gmail.com>
 <20211125141516.oymscgs3xcjqmgce@gilmour>
 <CAMty3ZC0KOUxr2rComOCfC70wGS_aSXzjFGS4f=pEB6MQHRGFw@mail.gmail.com>
 <20211125161026.ndfygaa6c4nnst4i@gilmour>
 <CAMty3ZBT9ZgwUs3g+5kjcp2DcWryA02YADAS_Kt8-EGe85VSZg@mail.gmail.com>
 <20211126160406.5634xkgmzihngotz@houat>
 <CAMty3ZD5hWDrw59A7NhS39YZZa0daXbhJs=2PrrdJWOnGnRCmA@mail.gmail.com>
In-Reply-To: <CAMty3ZD5hWDrw59A7NhS39YZZa0daXbhJs=2PrrdJWOnGnRCmA@mail.gmail.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sun, 5 Dec 2021 18:39:30 +0100
Message-ID: <CAOf5uw=QF7XMbYT4pyZBTTO87TRLzVmYH2HvX=jCg_QpNGN1LA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 linux-sunxi@googlegroups.com, Robert Foss <robert.foss@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan

@@ -1503,28 +1506,18 @@ static int samsung_dsim_panel_or_bridge(struct
samsung_dsim *dsi,
 {
        struct drm_bridge *panel_bridge;
        struct drm_panel *panel;
-       struct device_node *remote;
-
-       if (of_graph_is_present(node)) {
-               remote = of_graph_get_remote_node(node, DSI_PORT_OUT, 0);
-               if (!remote)
-                       return -ENODEV;
+       int ret;

-               node = remote;
-       }
+       ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
+                                         &panel_bridge);
+       if (ret)
+               return ret;

-       panel_bridge = of_drm_find_bridge(node);
-       if (!panel_bridge) {
-               panel = of_drm_find_panel(node);
-               if (!IS_ERR(panel)) {
-                       panel_bridge = drm_panel_bridge_add(panel);
-                       if (IS_ERR(panel_bridge))
-                               return PTR_ERR(panel_bridge);
-               }
+       if (panel) {
+               panel_bridge = drm_panel_bridge_add(panel);
+               if (IS_ERR(panel_bridge))
+                       return PTR_ERR(panel_bridge);
        }
-
-       of_node_put(node);
-
        dsi->out_bridge = panel_bridge;

I need to apply this change to register my panel on imx8mn even mode I
found that
@@ -1594,11 +1587,15 @@ static int samsung_dsim_host_attach(struct
mipi_dsi_host *host,
                        return ret;
        }

-       mutex_lock(&drm->mode_config.mutex);

        dsi->lanes = device->lanes;
        dsi->format = device->format;
        dsi->mode_flags = device->mode_flags;
+
+       if (!drm)
+               return 0;
+
+       mutex_lock(&drm->mode_config.mutex);

mode_config is not initialized in this path.

Michael



On Tue, Nov 30, 2021 at 8:39 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Fri, Nov 26, 2021 at 9:34 PM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Thu, Nov 25, 2021 at 09:44:14PM +0530, Jagan Teki wrote:
> > > On Thu, Nov 25, 2021 at 9:40 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > On Thu, Nov 25, 2021 at 07:55:41PM +0530, Jagan Teki wrote:
> > > > > Hi,
> > > > >
> > > > > On Thu, Nov 25, 2021 at 7:45 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > > >
> > > > > > On Wed, Nov 24, 2021 at 12:02:47AM +0530, Jagan Teki wrote:
> > > > > > > > > > > > +     dsi->panel = of_drm_find_panel(remote);
> > > > > > > > > > > > +     if (IS_ERR(dsi->panel)) {
> > > > > > > > > > > > +             dsi->panel = NULL;
> > > > > > > > > > > > +
> > > > > > > > > > > > +             dsi->next_bridge = of_drm_find_bridge(remote);
> > > > > > > > > > > > +             if (IS_ERR(dsi->next_bridge)) {
> > > > > > > > > > > > +                     dev_err(dsi->dev, "failed to find bridge\n");
> > > > > > > > > > > > +                     return PTR_ERR(dsi->next_bridge);
> > > > > > > > > > > > +             }
> > > > > > > > > > > > +     } else {
> > > > > > > > > > > > +             dsi->next_bridge = NULL;
> > > > > > > > > > > > +     }
> > > > > > > > > > > > +
> > > > > > > > > > > > +     of_node_put(remote);
> > > > > > > > > > >
> > > > > > > > > > > Using devm_drm_of_get_bridge would greatly simplify the driver
> > > > > > > > > >
> > > > > > > > > > I'm aware of this and this would break the existing sunxi dsi binding,
> > > > > > > > > > we are not using ports based pipeline in dsi node. Of-course you have
> > > > > > > > > > pointed the same before, please check below
> > > > > > > > > > https://patchwork.kernel.org/project/dri-devel/patch/20210322140152.101709-2-jagan@amarulasolutions.com/
> > > > > > > > >
> > > > > > > > > Then drm_of_find_panel_or_bridge needs to be adjusted to handle the DSI
> > > > > > > > > bindings and look for a panel or bridge not only through the OF graph,
> > > > > > > > > but also on the child nodes
> > > > > > > >
> > > > > > > > Okay. I need to check this.
> > > > > > >
> > > > > > > devm_drm_of_get_bridge is not working with legacy binding like the one
> > > > > > > used in sun6i dsi
> > > > > >
> > > > > > There's nothing legacy about it.
> > > > >
> > > > > What I'm mean legacy here with current binding used in sun6i-dsi like this.
> > > > >
> > > > > &dsi {
> > > > >           vcc-dsi-supply = <&reg_dcdc1>; /* VCC-DSI */
> > > > >           status = "okay";
> > > > >
> > > > >          panel@0 {
> > > > >                    compatible = "bananapi,s070wv20-ct16-icn6211";
> > > > >                    reg = <0>;
> > > > >                    reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /*
> > > > > LCD-RST: PL5 */
> > > > >                   enable-gpios = <&pio 1 7 GPIO_ACTIVE_HIGH>; /*
> > > > > LCD-PWR-EN: PB7 */
> > > > >                   backlight = <&backlight>;
> > > > >         };
> > > > > };
> > > >
> > > > Yes, I know, it's the generic DSI binding. It's still not legacy.
> > > >
> > > > > devm_drm_of_get_bridge cannot find the device with above binding and
> > > > > able to find the device with below binding.
> > > > >
> > > > > &dsi {
> > > > >        vcc-dsi-supply = <&reg_dcdc1>; /* VCC-DSI */
> > > > >        status = "okay";
> > > > >
> > > > >       ports {
> > > > >             #address-cells = <1>;
> > > > >             #size-cells = <0>;
> > > > >
> > > > >            dsi_out: port@0 {
> > > > >                    reg = <0>;
> > > > >
> > > > >                   dsi_out_bridge: endpoint {
> > > > >                             remote-endpoint = <&bridge_out_dsi>;
> > > > >                   };
> > > > >            };
> > > > >       };
> > > > >
> > > > >       panel@0 {
> > > > >              compatible = "bananapi,s070wv20-ct16-icn6211";
> > > > >              reg = <0>;
> > > > >              reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: PL5 */
> > > > >              enable-gpios = <&pio 1 7 GPIO_ACTIVE_HIGH>; /* LCD-PWR-EN: PB7 */
> > > > >              backlight = <&backlight>;
> > > > >
> > > > >               port {
> > > > >                         bridge_out_dsi: endpoint {
> > > > >                                 remote-endpoint = <&dsi_out_bridge>;
> > > > >                         };
> > > > >                 };
> > > > >        };
> > > > > };
> > > >
> > > > Yes, I know, and that's because ...
> > >
> > > Okay. I will use find panel and bridge separately instead of
> > > devm_drm_of_get_bridge in version patches.
> >
> > That's not been my point, at all?
> >
> > I mean, that whole discussion has been because you shouldn't do that.
> >
> > > >
> > > > > >
> > > > > > > https://patchwork.kernel.org/project/dri-devel/patch/20211122065223.88059-6-jagan@amarulasolutions.com/
> > > > > > >
> > > > > > > dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 0, 0);
> > > > > > > if (IS_ERR(dsi->next_bridge))
> > > > > > >            return PTR_ERR(dsi->next_bridge);
> > > > > > >
> > > > > > > It is only working if we have ports on the pipeline, something like this
> > > > > > > https://patchwork.kernel.org/project/dri-devel/patch/20210214194102.126146-8-jagan@amarulasolutions.com/
> > > > > > >
> > > > > > > Please have a look and let me know if I miss anything?
> > > > > >
> > > > > > Yes, you're missing the answer you quoted earlier:
> > > > >
> > > > > Yes, I'm trying to resolve the comment one after another. Will get back.
> > > >
> > > > ... You've ignored that comment.
> > >
> > > Not understand which comment you mean. There are few about bridge
> > > conversion details, I will send my comments.
> >
> > The one that got quoted there and you removed. For reference:
> >
> > > Then drm_of_find_panel_or_bridge needs to be adjusted to handle the DSI
> > > bindings and look for a panel or bridge not only through the OF graph,
> > > but also on the child nodes
> >
> > devm_drm_of_get_bridge uses drm_of_find_panel_or_bridge under the hood,
> > so of course it won't find it if drm_of_find_panel_or_bridge doesn't.
> > You need to modify drm_of_find_panel_or_bridge to also look for child
> > devices and see if there's a panel or bridge registered for that child
> > node. Then devm_drm_of_get_bridge will work as you intend it to.
>
> Got it now, I will make necessary changes.
>
> Thanks,
> Jagan.
>
>


-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
