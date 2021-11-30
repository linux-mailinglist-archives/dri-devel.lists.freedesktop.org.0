Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A51A2462DA6
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 08:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507946EE9D;
	Tue, 30 Nov 2021 07:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5134E6EE9D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 07:39:57 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id r11so82989641edd.9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 23:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0rnlhHdgq2600l887zI7rosnkpRGMu5POSH9CCMZhpw=;
 b=fbr3ceBlt7DPsMW66zwQcNFM/qBsP3jRC4xbJd+P9CBPzYSUVzsiYaiPtqE5gXO6Yi
 hMvUlEaUUqZd7gToNbBO2AjP67nxpkbAUW/QlniB+chdWaJnzorF4pN0lZh67MkCS3pq
 dyyjAYXgjRNi8nuV59ShgiQ/8e7T8lYj+3f2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0rnlhHdgq2600l887zI7rosnkpRGMu5POSH9CCMZhpw=;
 b=xJUQABUkB23YP7k2+2mnXLykcIk2sZrvDiYQkKKWV5VV3+D5V7Huq+XWwempD6tw6l
 tUyqvHTrrC2EldCO+jqagQeIP4dwBpRbfCZ7POxhymjb/hkqxnpceH8txFRWQnNT+dMu
 wXv5Vw46sv2j6OaRhteMRQh5mSydrBqmRpL5WGUIWI8qKFQbJFvxoKGbCseak5XduvBr
 0SwodyBHh9IMoGR7KbPNpu41JO8Iat+p5KoXAcfqXODonTo6occcOrlSDPL2nM6oDGuu
 roYCXl+WebIJmlj06S/tb6TF4rFB8i5PjcOpc+1aQb9nDzxuuezEqW+xwP03JkHjfn4S
 /v7Q==
X-Gm-Message-State: AOAM531dQ21T2J+6VOpdXOYaCrS5jlycrfeZVHkaFB7U4qcdisgwiaHd
 xa/LG+GSUR4otdSg9bim6H5hdLWs0/Zjk2EeZ480ivObmC4=
X-Google-Smtp-Source: ABdhPJyz0gE+Mm1FNMLvQfIZGSEZKaDOu1AzMxo0c4jpdYbM2+cjfh9Lv1BYw9YeWs5d7RfPCU3/6awXU+VmPm4icBA=
X-Received: by 2002:a05:6402:5cb:: with SMTP id
 n11mr82609822edx.279.1638257995857; 
 Mon, 29 Nov 2021 23:39:55 -0800 (PST)
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
In-Reply-To: <20211126160406.5634xkgmzihngotz@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 30 Nov 2021 13:09:44 +0530
Message-ID: <CAMty3ZD5hWDrw59A7NhS39YZZa0daXbhJs=2PrrdJWOnGnRCmA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
To: Maxime Ripard <maxime@cerno.tech>
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
 Robert Foss <robert.foss@linaro.org>, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 26, 2021 at 9:34 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Thu, Nov 25, 2021 at 09:44:14PM +0530, Jagan Teki wrote:
> > On Thu, Nov 25, 2021 at 9:40 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Thu, Nov 25, 2021 at 07:55:41PM +0530, Jagan Teki wrote:
> > > > Hi,
> > > >
> > > > On Thu, Nov 25, 2021 at 7:45 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > >
> > > > > On Wed, Nov 24, 2021 at 12:02:47AM +0530, Jagan Teki wrote:
> > > > > > > > > > > +     dsi->panel = of_drm_find_panel(remote);
> > > > > > > > > > > +     if (IS_ERR(dsi->panel)) {
> > > > > > > > > > > +             dsi->panel = NULL;
> > > > > > > > > > > +
> > > > > > > > > > > +             dsi->next_bridge = of_drm_find_bridge(remote);
> > > > > > > > > > > +             if (IS_ERR(dsi->next_bridge)) {
> > > > > > > > > > > +                     dev_err(dsi->dev, "failed to find bridge\n");
> > > > > > > > > > > +                     return PTR_ERR(dsi->next_bridge);
> > > > > > > > > > > +             }
> > > > > > > > > > > +     } else {
> > > > > > > > > > > +             dsi->next_bridge = NULL;
> > > > > > > > > > > +     }
> > > > > > > > > > > +
> > > > > > > > > > > +     of_node_put(remote);
> > > > > > > > > >
> > > > > > > > > > Using devm_drm_of_get_bridge would greatly simplify the driver
> > > > > > > > >
> > > > > > > > > I'm aware of this and this would break the existing sunxi dsi binding,
> > > > > > > > > we are not using ports based pipeline in dsi node. Of-course you have
> > > > > > > > > pointed the same before, please check below
> > > > > > > > > https://patchwork.kernel.org/project/dri-devel/patch/20210322140152.101709-2-jagan@amarulasolutions.com/
> > > > > > > >
> > > > > > > > Then drm_of_find_panel_or_bridge needs to be adjusted to handle the DSI
> > > > > > > > bindings and look for a panel or bridge not only through the OF graph,
> > > > > > > > but also on the child nodes
> > > > > > >
> > > > > > > Okay. I need to check this.
> > > > > >
> > > > > > devm_drm_of_get_bridge is not working with legacy binding like the one
> > > > > > used in sun6i dsi
> > > > >
> > > > > There's nothing legacy about it.
> > > >
> > > > What I'm mean legacy here with current binding used in sun6i-dsi like this.
> > > >
> > > > &dsi {
> > > >           vcc-dsi-supply = <&reg_dcdc1>; /* VCC-DSI */
> > > >           status = "okay";
> > > >
> > > >          panel@0 {
> > > >                    compatible = "bananapi,s070wv20-ct16-icn6211";
> > > >                    reg = <0>;
> > > >                    reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /*
> > > > LCD-RST: PL5 */
> > > >                   enable-gpios = <&pio 1 7 GPIO_ACTIVE_HIGH>; /*
> > > > LCD-PWR-EN: PB7 */
> > > >                   backlight = <&backlight>;
> > > >         };
> > > > };
> > >
> > > Yes, I know, it's the generic DSI binding. It's still not legacy.
> > >
> > > > devm_drm_of_get_bridge cannot find the device with above binding and
> > > > able to find the device with below binding.
> > > >
> > > > &dsi {
> > > >        vcc-dsi-supply = <&reg_dcdc1>; /* VCC-DSI */
> > > >        status = "okay";
> > > >
> > > >       ports {
> > > >             #address-cells = <1>;
> > > >             #size-cells = <0>;
> > > >
> > > >            dsi_out: port@0 {
> > > >                    reg = <0>;
> > > >
> > > >                   dsi_out_bridge: endpoint {
> > > >                             remote-endpoint = <&bridge_out_dsi>;
> > > >                   };
> > > >            };
> > > >       };
> > > >
> > > >       panel@0 {
> > > >              compatible = "bananapi,s070wv20-ct16-icn6211";
> > > >              reg = <0>;
> > > >              reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: PL5 */
> > > >              enable-gpios = <&pio 1 7 GPIO_ACTIVE_HIGH>; /* LCD-PWR-EN: PB7 */
> > > >              backlight = <&backlight>;
> > > >
> > > >               port {
> > > >                         bridge_out_dsi: endpoint {
> > > >                                 remote-endpoint = <&dsi_out_bridge>;
> > > >                         };
> > > >                 };
> > > >        };
> > > > };
> > >
> > > Yes, I know, and that's because ...
> >
> > Okay. I will use find panel and bridge separately instead of
> > devm_drm_of_get_bridge in version patches.
>
> That's not been my point, at all?
>
> I mean, that whole discussion has been because you shouldn't do that.
>
> > >
> > > > >
> > > > > > https://patchwork.kernel.org/project/dri-devel/patch/20211122065223.88059-6-jagan@amarulasolutions.com/
> > > > > >
> > > > > > dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 0, 0);
> > > > > > if (IS_ERR(dsi->next_bridge))
> > > > > >            return PTR_ERR(dsi->next_bridge);
> > > > > >
> > > > > > It is only working if we have ports on the pipeline, something like this
> > > > > > https://patchwork.kernel.org/project/dri-devel/patch/20210214194102.126146-8-jagan@amarulasolutions.com/
> > > > > >
> > > > > > Please have a look and let me know if I miss anything?
> > > > >
> > > > > Yes, you're missing the answer you quoted earlier:
> > > >
> > > > Yes, I'm trying to resolve the comment one after another. Will get back.
> > >
> > > ... You've ignored that comment.
> >
> > Not understand which comment you mean. There are few about bridge
> > conversion details, I will send my comments.
>
> The one that got quoted there and you removed. For reference:
>
> > Then drm_of_find_panel_or_bridge needs to be adjusted to handle the DSI
> > bindings and look for a panel or bridge not only through the OF graph,
> > but also on the child nodes
>
> devm_drm_of_get_bridge uses drm_of_find_panel_or_bridge under the hood,
> so of course it won't find it if drm_of_find_panel_or_bridge doesn't.
> You need to modify drm_of_find_panel_or_bridge to also look for child
> devices and see if there's a panel or bridge registered for that child
> node. Then devm_drm_of_get_bridge will work as you intend it to.

Got it now, I will make necessary changes.

Thanks,
Jagan.
