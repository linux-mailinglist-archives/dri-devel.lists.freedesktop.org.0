Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51EF570A31
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 20:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C3490AF2;
	Mon, 11 Jul 2022 18:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C1290AEF
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 18:57:07 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id va17so10430690ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 11:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j3H6UF/wYZoISxFo/BpRL1cGTs7tnJilZxILHGEsbB8=;
 b=d3oNNOOY4WGXCB9HBp6WmQfR7brZhrrQxFHdyv0DYgTPnX67a5wq9diwzn1yIMFIfT
 uYy4RJR375nR3GDU2k0acEEEma6TZRK1IdHHCUF9xmz5WBPKQhh4d5TGTCz0Y4y407vI
 0/A9Z38rGYQrvbhsdEN7AXTrSvCvdKSkUKhHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j3H6UF/wYZoISxFo/BpRL1cGTs7tnJilZxILHGEsbB8=;
 b=ujmf0WWIKXlFFZjIKd9egISL8wsvnDI44kM0A0DtcLxXPU4HA3/zOj0s7Nt4jp/Sqy
 YQvXTNrJdu1nxKCbCNZLHkMk4cc19G6E1DUitrU0PWVFh77BFnsaWFa1zSLuYNcNT9R4
 89HGyM6S2j1UbxPADDMH4y1hpQ/HtePgpVNHvvlvuvxkur1+agrGtvhLSFTnzU7RDJCS
 2RjVBqCHycmyguSkWaWprI0kYYNXZuYQwy0drkI0y1PV9hnox4MTTMdPsdED8g1MQRW0
 CCPtXXiSI2SV6rpqunaNcZp7pHN+QIyr6hhoJyXI27ll6lqKEKT8RGSgPo+unXzYtZ6L
 V+ww==
X-Gm-Message-State: AJIora++2sAhvDM2I4gwUYb9Q7lrAs4yqpSBQb93cZFlk+3bUl3f7GTj
 z19aX3Egy+HnpmHobWyN1XOrXbG1xCf0aNh1nuk=
X-Google-Smtp-Source: AGRyM1uMIX2fHiYCgXT3fAkojMOGPDb9amchmZ65yJDaz+xQYp1V0oEzt/1Y2C2h0w0Bwxp6ht1Rig==
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr19938109ejc.64.1657565825872; 
 Mon, 11 Jul 2022 11:57:05 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42]) by smtp.gmail.com with ESMTPSA id
 d1-20020a170906304100b00706242d297fsm2925851ejd.212.2022.07.11.11.57.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 11:57:05 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id o4so8218495wrh.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 11:57:05 -0700 (PDT)
X-Received: by 2002:adf:ead2:0:b0:21d:8b49:6138 with SMTP id
 o18-20020adfead2000000b0021d8b496138mr18724251wrn.138.1657565824636; Mon, 11
 Jul 2022 11:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <0f803b7c-d004-1302-6ef8-205e5b177918@prevas.dk>
 <165703382008.2228597.17239168312569308180@Monstersaurus>
In-Reply-To: <165703382008.2228597.17239168312569308180@Monstersaurus>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Jul 2022 11:56:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VJy_hwxW=SX=F0OhmGOPx+2S1u=qJQ7YXEO-F=VaLK8Q@mail.gmail.com>
Message-ID: <CAD=FV=VJy_hwxW=SX=F0OhmGOPx+2S1u=qJQ7YXEO-F=VaLK8Q@mail.gmail.com>
Subject: Re: connecting a sn65dsi86 to displayport connector
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jul 5, 2022 at 8:10 AM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> Hi Rasmus,
>
> Quoting Rasmus Villemoes (2022-07-05 10:08:37)
> > Hi
> >
> > I have an imx8mp board with a sn65dsi86 and a (full-size) DisplayPort
> > connector, which I'm trying to get up and running.
> >
> > The display connector registers itself as a bridge; I do get
> > successfully to the end of display_connector_probe(). But
> > ti_sn_bridge_probe() only looks for a panel (passing NULL for the
> > drm_bridge** argument), so always fails with -EPROBE_DEFER.
> >
> > This text
> >
> >   At the moment, this binding only handles the eDP case. It is
> >   possible it will be extended in the future to handle the DP case.
> >   For DP, presumably a connector would be listed under the DP AUX
> >   bus instead of a panel.
> >
> > in dp-aux-bus.yaml suggests that what I'm trying to do is simply not
> > supported yet. But then I stumbled on commit 5a6bca1ff7a5 (arm64: dts:
> > renesas: falcon-cpu: Add DSI display output), which seems to do exactly
> > what I'm trying to, except with a mini dp connector. So I must be
> > missing something; maybe ti_sn_bridge_probe() failing is not actually a
> > problem and I could be looking at the wrong place.
> >
> > Snippets from my .dts; the dp connector is currently placed at top
> > level, i.e. not within an aux-bus node below the sn65dsi86:
> >
> >         display_port0: connector {
> >                 compatible = "dp-connector";
> >                 label = "DP0";
> >                 type = "full-size";
> >                 dp-pwr-supply = <&reg_DP_PWR>;
> >
> >                 port {
> >                         dp_connector_in: endpoint {
> >                                 remote-endpoint = <&sn65dsi86_out>;
> >                         };
> >                 };
> >         };
> >
> > &i2c5 {
> > ...
> >         eDP: bridge@2c {
> >                 compatible = "ti,sn65dsi86";
> >                 reg = <0x2c>;
> >                 pinctrl-names = "default";
> >                 pinctrl-0 = <&pinctrl_eDP>;
> >
> >                 interrupts-extended = <&gpio3 14 IRQ_TYPE_LEVEL_HIGH>;
> >                 enable-gpios = <&gpio3 9 GPIO_ACTIVE_HIGH>;
> >
> >                 vpll-supply = <&VDD_1V8>;
> >                 vccio-supply = <&VDD_1V8>;
> >                 vcca-supply = <&reg_1V2>;
> >                 vcc-supply = <&reg_1V2>;
> >
> >                 clocks = <&clk_38_4MHz>;
> >                 clock-names = "refclk";
> >
> >                 ports {
> >                         #address-cells = <1>;
> >                         #size-cells = <0>;
> >
> >                         port@0 {
> >                                 reg = <0>;
> >                                 sn65dsi86_in_a: endpoint {
> >                                         remote-endpoint = <&mipi_dsi_out>;
> >                                 };
> >                         };
> >
> >                         port@1 {
> >                                 reg = <1>;
> >                                 sn65dsi86_out: endpoint {
> >                                         remote-endpoint = <&dp_connector_in>;
> >                                         data-lanes = <3 2 1 0>;
> >                                 };
> >                         };
> >                 };
> >         };
> > };
> >
> > When I manually set the enable-gpio high in U-Boot, I can talk to the
> > device and e.g. read out the 8 device_id bytes which match what I expect.
> >
> > Any hints would be highly appreciated.
>
> If it helps, this is an area I've been working to support one of our
> boards. I have a branch at:
>
>  git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git
>  kbingham/drm-misc/next/sn65dsi86/hpd
>
> But it's still a work in progress, and now needs rebasing to account for
> Sam's latest updates.
>
> I intend to resume this in a few weeks, but hopefully that branch may
> have some helpful pointers to get things progressing for you too.

In case you didn't notice, Dmitry's latest series is probably
interesting to you.

https://lore.kernel.org/r/20220711092117.360797-1-dmitry.baryshkov@linaro.org/


-Doug
