Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA13245DC49
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 15:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB08D6F407;
	Thu, 25 Nov 2021 14:25:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8093B6F407
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 14:25:54 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id t5so26662844edd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 06:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jY5w+KRUHMlWPK+riigupIhlkzMSu2CglKe5YFuAxaU=;
 b=VcZWLZtPXqSWcNeXXy1kM7j+v5Bh11mWxIser54qAhJthqM4wF0W5Qmx/O4tVjhipt
 8wCwu5LpoCz4sNs66JNebtTacut4rxbXCulNHOJ/LLw89+3pKhCHrs1kaxHMZ97FjAjA
 LIqsOMWzE8Q/nmkB270ZGiZ0DldYBWQhkYh6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jY5w+KRUHMlWPK+riigupIhlkzMSu2CglKe5YFuAxaU=;
 b=rVur7vXToVsb57z6GhpNv4FIurYv0pJ2NDf6kQiO/Fc+3cOTN0SZTrOqNt3IU44er3
 Wk99YK5d2BlygFXV/DFqCCeYHQtYaFSfFbw/Y01LXZj/wV/EOhJJqT6quYddGT1BjScK
 3D9W4N0QyXUX3NSVWO0VO4tRfWgOFqEmUkFoUu1PwUamhV4UZSUP/JEIzSSp17/3SIxO
 JATLHaxOtJ1GBlOioO8i94MIlr+xRGM9/HsvgqbZDf8qTt0lMbTCVvR6sEZCmOSAo7ov
 07iT7wxMugoukG6Fo/N7YOCunLy0atPFGj3aJ97qVRLvTb3FVS1qfzk6D25T/QZCG8vt
 q7IQ==
X-Gm-Message-State: AOAM531qmTJQtR2CNIT/xbHTra9SYz/1QiQnJto6lCEdxCMX0tujWKv1
 oBEWHr6z1P2RKPYBwzelCB43poCl7uW8s9ABn7giVw==
X-Google-Smtp-Source: ABdhPJzqBcQBAC15M/mWOKirR6uhM3tn3+jgOBlP5aj+jKtHT04FWKT5/D81UO1guhSKLiQ3xigK1u96yEu2k6OIZAU=
X-Received: by 2002:a05:6402:445:: with SMTP id
 p5mr39875774edw.110.1637850352992; 
 Thu, 25 Nov 2021 06:25:52 -0800 (PST)
MIME-Version: 1.0
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-4-jagan@amarulasolutions.com>
 <20211122100712.dls4eqsu6o5gcc5k@gilmour>
 <CAMty3ZDkUSfW_+PosjgY_GQB3wSvNRaCjwq_nOwWHo-RGQUVFw@mail.gmail.com>
 <20211122140457.jm7cwpp2h3fkf2nd@gilmour>
 <CAMty3ZByw=ZjN3z2UsKj5X5kvrpwCFNUohAnO=O1d29jLPR1Yw@mail.gmail.com>
 <CAMty3ZBizr0uw6VrKBQ9AEYe48_QJKb0QC=pGEcA3OGK_CfQkw@mail.gmail.com>
 <20211125141516.oymscgs3xcjqmgce@gilmour>
In-Reply-To: <20211125141516.oymscgs3xcjqmgce@gilmour>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 25 Nov 2021 19:55:41 +0530
Message-ID: <CAMty3ZC0KOUxr2rComOCfC70wGS_aSXzjFGS4f=pEB6MQHRGFw@mail.gmail.com>
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

Hi,

On Thu, Nov 25, 2021 at 7:45 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Wed, Nov 24, 2021 at 12:02:47AM +0530, Jagan Teki wrote:
> > > > > > > +     dsi->panel = of_drm_find_panel(remote);
> > > > > > > +     if (IS_ERR(dsi->panel)) {
> > > > > > > +             dsi->panel = NULL;
> > > > > > > +
> > > > > > > +             dsi->next_bridge = of_drm_find_bridge(remote);
> > > > > > > +             if (IS_ERR(dsi->next_bridge)) {
> > > > > > > +                     dev_err(dsi->dev, "failed to find bridge\n");
> > > > > > > +                     return PTR_ERR(dsi->next_bridge);
> > > > > > > +             }
> > > > > > > +     } else {
> > > > > > > +             dsi->next_bridge = NULL;
> > > > > > > +     }
> > > > > > > +
> > > > > > > +     of_node_put(remote);
> > > > > >
> > > > > > Using devm_drm_of_get_bridge would greatly simplify the driver
> > > > >
> > > > > I'm aware of this and this would break the existing sunxi dsi binding,
> > > > > we are not using ports based pipeline in dsi node. Of-course you have
> > > > > pointed the same before, please check below
> > > > > https://patchwork.kernel.org/project/dri-devel/patch/20210322140152.101709-2-jagan@amarulasolutions.com/
> > > >
> > > > Then drm_of_find_panel_or_bridge needs to be adjusted to handle the DSI
> > > > bindings and look for a panel or bridge not only through the OF graph,
> > > > but also on the child nodes
> > >
> > > Okay. I need to check this.
> >
> > devm_drm_of_get_bridge is not working with legacy binding like the one
> > used in sun6i dsi
>
> There's nothing legacy about it.

What I'm mean legacy here with current binding used in sun6i-dsi like this.

&dsi {
          vcc-dsi-supply = <&reg_dcdc1>; /* VCC-DSI */
          status = "okay";

         panel@0 {
                   compatible = "bananapi,s070wv20-ct16-icn6211";
                   reg = <0>;
                   reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /*
LCD-RST: PL5 */
                  enable-gpios = <&pio 1 7 GPIO_ACTIVE_HIGH>; /*
LCD-PWR-EN: PB7 */
                  backlight = <&backlight>;
        };
};

devm_drm_of_get_bridge cannot find the device with above binding and
able to find the device with below binding.

&dsi {
       vcc-dsi-supply = <&reg_dcdc1>; /* VCC-DSI */
       status = "okay";

      ports {
            #address-cells = <1>;
            #size-cells = <0>;

           dsi_out: port@0 {
                   reg = <0>;

                  dsi_out_bridge: endpoint {
                            remote-endpoint = <&bridge_out_dsi>;
                  };
           };
      };

      panel@0 {
             compatible = "bananapi,s070wv20-ct16-icn6211";
             reg = <0>;
             reset-gpios = <&r_pio 0 5 GPIO_ACTIVE_HIGH>; /* LCD-RST: PL5 */
             enable-gpios = <&pio 1 7 GPIO_ACTIVE_HIGH>; /* LCD-PWR-EN: PB7 */
             backlight = <&backlight>;

              port {
                        bridge_out_dsi: endpoint {
                                remote-endpoint = <&dsi_out_bridge>;
                        };
                };
       };
};

>
> > https://patchwork.kernel.org/project/dri-devel/patch/20211122065223.88059-6-jagan@amarulasolutions.com/
> >
> > dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node, 0, 0);
> > if (IS_ERR(dsi->next_bridge))
> >            return PTR_ERR(dsi->next_bridge);
> >
> > It is only working if we have ports on the pipeline, something like this
> > https://patchwork.kernel.org/project/dri-devel/patch/20210214194102.126146-8-jagan@amarulasolutions.com/
> >
> > Please have a look and let me know if I miss anything?
>
> Yes, you're missing the answer you quoted earlier:

Yes, I'm trying to resolve the comment one after another. Will get back.

Thanks,
Jagan.
