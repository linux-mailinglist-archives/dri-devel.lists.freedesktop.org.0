Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228265BB2CD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 21:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A48D10E0DC;
	Fri, 16 Sep 2022 19:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F56910E0DC
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 19:29:54 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 w10-20020a056830410a00b00655d70a1aeaso3143748ott.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 12:29:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=OB5NCz64cDZ4/Yf4QpF2872Y4Qqzscs/5jTTATIjmnM=;
 b=FAkEx8OqwGG5uh1qR21CVq+ejHg9VvzRN6lBdcVnUQMbzGVYhY2CBR0kz5t0OvgHY6
 7ff9SbFQjPBKtBunqg3bajjDFSM08OgYTvpoDBIfy28o04LCBYcYF9C5UDmrxQ4v8L+i
 g32dxb3CXnGm1mhKurwZMbrMC3dBM9PIW3ecRypO32nIBgyNxZO1FgVk+iDynDconCvw
 urBhW5QDHdHqVZUsYr4S+FuPUie55WSG6qtlRNGYymwpxc906miNbgv+QjwUSv+4Jzsc
 UBJlrPWT+LJgqXz7xS8VtjHLrardNGYZtYvpDdfpBQJGp3X8trPTgzlfRnJE1HhKk9h1
 o06g==
X-Gm-Message-State: ACrzQf1K5xbNK+9Hc0bZmk0fNPvj1hDvTWk0pPhR8nkxEqcsORr5s9bJ
 zkjsS3qTxUm2Rsb7JtL3RA==
X-Google-Smtp-Source: AMsMyM4H95t5Igw8deTnTowfnD2pJt70FJKnkiKmQGDXKRQ1kNqYPD86UfFnWiUF0xTtj0cjOFe76g==
X-Received: by 2002:a05:6830:6605:b0:656:c1b3:5d0a with SMTP id
 cp5-20020a056830660500b00656c1b35d0amr2978466otb.180.1663356593394; 
 Fri, 16 Sep 2022 12:29:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a65-20020a9d2647000000b006391bdbb361sm10168430otb.31.2022.09.16.12.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 12:29:53 -0700 (PDT)
Received: (nullmailer pid 1130396 invoked by uid 1000);
 Fri, 16 Sep 2022 19:29:52 -0000
Date: Fri, 16 Sep 2022 14:29:52 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
Message-ID: <20220916192952.GA1130333-robh@kernel.org>
References: <cover.1663165552.git.geert+renesas@glider.be>
 <1224e757ec958f8b29ec66e783a7ee805c339d84.1663165552.git.geert+renesas@glider.be>
 <20220915092649.moyd6j6jm7dk6vmh@krzk-bin>
 <CAMuHMdWqQXm66kbbKdK0O2qQFM_3oGEWEGmh4LxBZwR-PDc_Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWqQXm66kbbKdK0O2qQFM_3oGEWEGmh4LxBZwR-PDc_Hg@mail.gmail.com>
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Sep 2022 12:15:28 +0100, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Thu, Sep 15, 2022 at 10:26 AM Krzysztof Kozlowski
> <k.kozlowski.k@gmail.com> wrote:
> > On Wed, 14 Sep 2022 16:33:22 +0200, Geert Uytterhoeven wrote:
> > > Convert the NXP TDA998x HDMI transmitter Device Tree binding
> > > documentation to json-schema.
> > >
> > > Add missing "#sound-dai-cells" property.
> > > Add ports hierarchy, as an alternative to port.
> > > Drop pinctrl properties, as they do not belong here.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > v2:
> > >   - Add maximum to video-ports,
> > >   - Drop unneeded maxItems for audio-ports,
> > >   - Complete port descriptions.
> > > ---
> > >  .../bindings/display/bridge/nxp,tda998x.yaml  | 109 ++++++++++++++++++
> > >  .../bindings/display/bridge/tda998x.txt       |  54 ---------
> > >  2 files changed, 109 insertions(+), 54 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/tda998x.txt
> > >
> >
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> >
> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.
> >
> > Full log is available here: https://patchwork.ozlabs.org/patch/
> >
> >
> > tda19988@70: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
> >         arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb
> >         arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb
> >         arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb
> >         arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb
> >
> > tda19988@70: ports: 'oneOf' conditional failed, one must be fixed:
> >         arch/arm/boot/dts/am335x-boneblack.dtb
> >         arch/arm/boot/dts/am335x-boneblack-wireless.dtb
> >         arch/arm/boot/dts/am335x-sancloud-bbe.dtb
> >
> > tda19988@70: ports:port@0: 'reg' is a required property
> >         arch/arm/boot/dts/am335x-boneblack.dtb
> >         arch/arm/boot/dts/am335x-boneblack-wireless.dtb
> >         arch/arm/boot/dts/am335x-sancloud-bbe.dtb
> >
> > tda9988@70: ports: 'oneOf' conditional failed, one must be fixed:
> >         arch/arm/boot/dts/am335x-myirtech-myd.dtb
> >
> > tda9988@70: ports:port@0: 'reg' is a required property
> >         arch/arm/boot/dts/am335x-myirtech-myd.dtb
> 
> Please test this with the earlier patches in the same series applied ;-)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
> 
> From git@z Thu Jan  1 00:00:00 1970
> Return-Path: <devicetree-owner@kernel.org>
> X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
> 	aws-us-west-2-korg-lkml-1.web.codeaurora.org
> Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
> 	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EEEC6FA8B
> 	for <linux-devicetree@archiver.kernel.org>;
>  Wed, 14 Sep 2022 14:34:04 +0000 (UTC)
> Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
>         id S230118AbiINOeC (ORCPT
>         <rfc822;linux-devicetree@archiver.kernel.org>);
>         Wed, 14 Sep 2022 10:34:02 -0400
> Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57410 "EHLO
>         lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
>         with ESMTP id S230133AbiINOeA (ORCPT
>         <rfc822;devicetree@vger.kernel.org>); Wed, 14 Sep 2022 10:34:00 -0400
> Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
>  [IPv6:2a02:1800:120:4::f00:13])
>         by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC42B7C301
>         for <devicetree@vger.kernel.org>;
>  Wed, 14 Sep 2022 07:33:57 -0700 (PDT)
> Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:e925:8cbe:2e99:b03b])
>         by baptiste.telenet-ops.be with bizsmtp
>         id KqZi2800s3vs4GX01qZiPV; Wed, 14 Sep 2022 16:33:55 +0200
> Received: from rox.of.borg ([192.168.97.57])
>         by ramsan.of.borg with esmtps  (TLS1.3) tls
>  TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
>         (Exim 4.93)
>         (envelope-from <geert@linux-m68k.org>)
>         id 1oYTSP-005B5L-Rc; Wed, 14 Sep 2022 16:33:41 +0200
> Received: from geert by rox.of.borg with local (Exim 4.93)
>         (envelope-from <geert@linux-m68k.org>)
>         id 1oYTS7-000zXm-2p; Wed, 14 Sep 2022 16:33:23 +0200
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> To: Russell King <linux@armlinux.org.uk>,
>         Rob Herring <robh+dt@kernel.org>,
>         Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
>         Tony Lindgren <tony@atomide.com>,
>         Andrzej Hajda <andrzej.hajda@intel.com>,
>         Neil Armstrong <narmstrong@baylibre.com>,
>         Robert Foss <robert.foss@linaro.org>,
>         Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
>         Jonas Karlman <jonas@kwiboo.se>,
>         Jernej Skrabec <jernej.skrabec@gmail.com>,
>         David Airlie <airlied@linux.ie>,
>         Daniel Vetter <daniel@ffwll.ch>,
>         =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
>         Magnus Damm <magnus.damm@gmail.com>,
>         Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
>         linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
>         Geert Uytterhoeven <geert+renesas@glider.be>
> Subject: [PATCH v2 3/3] dt-bindings: display: bridge: nxp,tda998x: Convert to
>  json-schema
> Date: Wed, 14 Sep 2022 16:33:22 +0200
> Message-Id:
>  <1224e757ec958f8b29ec66e783a7ee805c339d84.1663165552.git.geert+renesas@glider.be>
> X-Mailer: git-send-email 2.25.1
> In-Reply-To: <cover.1663165552.git.geert+renesas@glider.be>
> References: <cover.1663165552.git.geert+renesas@glider.be>
> MIME-Version: 1.0
> Content-Transfer-Encoding: 8bit
> Precedence: bulk
> List-ID: <devicetree.vger.kernel.org>
> X-Mailing-List: devicetree@vger.kernel.org
> 
> Convert the NXP TDA998x HDMI transmitter Device Tree binding
> documentation to json-schema.
> 
> Add missing "#sound-dai-cells" property.
> Add ports hierarchy, as an alternative to port.
> Drop pinctrl properties, as they do not belong here.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Add maximum to video-ports,
>   - Drop unneeded maxItems for audio-ports,
>   - Complete port descriptions.
> ---
>  .../bindings/display/bridge/nxp,tda998x.yaml  | 109 ++++++++++++++++++
>  .../bindings/display/bridge/tda998x.txt       |  54 ---------
>  2 files changed, 109 insertions(+), 54 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/tda998x.txt
> 

Applied, thanks!
