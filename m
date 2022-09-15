Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCD55B996C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 13:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ACE10EAE4;
	Thu, 15 Sep 2022 11:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBC310EAE5
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 11:15:42 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id f26so10722563qto.11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 04:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=qYu5hvXmZLhzcr/3mBvznfG69oYYMu1yl0KBbN7ILZU=;
 b=cWsKynBqOpd/UReZcPbAIYDZ8c4HScGpY4aqUYMI37HuXdBM1TCqZyadFblI88rS29
 FNXq9B5YyTmzZuEMrliGvs8mCjmmWn5/M9iNdOnpRHIy4w3zQZd7endg15X3EHPr6Ts9
 fqR3arVr0sZHCoaGVaU3DtEXyafjdXZgOiyFqDpPxvrpj63gvDQc+PDryXYcxsct/fmx
 afUFZRJ0+aE8fvbjHblNjA1+CimL9tq/pSx0CzT/10dWz9kAavhVldfteGsQnfww5rLC
 RQVUjSzKvSog+If+drV83fWG0HOhdb2Tvs14Nq2unBbOP+0GBK3JmIK2vjbkZL3DLWjs
 K3GQ==
X-Gm-Message-State: ACgBeo0LWcTRQs1QuY+uiPZGpIIG7Cu2CohndyaWUQzdOjuqaxpofMHx
 pfZNpOzFDJf0zMmBF/096SU7ODmz9Jm2Y6dw
X-Google-Smtp-Source: AA6agR693VjPCaG5FkLHkWmuzu+fDYWf/2vDgY8ko1buRi+63IndbCwQxvA0CrLDFRj/f25So+pyaA==
X-Received: by 2002:ac8:5dd2:0:b0:35c:68cd:e1d1 with SMTP id
 e18-20020ac85dd2000000b0035c68cde1d1mr10204237qtx.298.1663240541264; 
 Thu, 15 Sep 2022 04:15:41 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 y4-20020a379604000000b006bbe6e89bdcsm3630181qkd.31.2022.09.15.04.15.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 04:15:40 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id f131so27123987ybf.7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 04:15:39 -0700 (PDT)
X-Received: by 2002:a25:e6d4:0:b0:6a8:da17:8eb7 with SMTP id
 d203-20020a25e6d4000000b006a8da178eb7mr34427524ybh.202.1663240539655; Thu, 15
 Sep 2022 04:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1663165552.git.geert+renesas@glider.be>
 <1224e757ec958f8b29ec66e783a7ee805c339d84.1663165552.git.geert+renesas@glider.be>
 <20220915092649.moyd6j6jm7dk6vmh@krzk-bin>
In-Reply-To: <20220915092649.moyd6j6jm7dk6vmh@krzk-bin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Sep 2022 12:15:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWqQXm66kbbKdK0O2qQFM_3oGEWEGmh4LxBZwR-PDc_Hg@mail.gmail.com>
Message-ID: <CAMuHMdWqQXm66kbbKdK0O2qQFM_3oGEWEGmh4LxBZwR-PDc_Hg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: display: bridge: nxp, tda998x: Convert
 to json-schema
To: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
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
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Robert Foss <robert.foss@linaro.org>,
 linux-renesas-soc@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

On Thu, Sep 15, 2022 at 10:26 AM Krzysztof Kozlowski
<k.kozlowski.k@gmail.com> wrote:
> On Wed, 14 Sep 2022 16:33:22 +0200, Geert Uytterhoeven wrote:
> > Convert the NXP TDA998x HDMI transmitter Device Tree binding
> > documentation to json-schema.
> >
> > Add missing "#sound-dai-cells" property.
> > Add ports hierarchy, as an alternative to port.
> > Drop pinctrl properties, as they do not belong here.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Add maximum to video-ports,
> >   - Drop unneeded maxItems for audio-ports,
> >   - Complete port descriptions.
> > ---
> >  .../bindings/display/bridge/nxp,tda998x.yaml  | 109 ++++++++++++++++++
> >  .../bindings/display/bridge/tda998x.txt       |  54 ---------
> >  2 files changed, 109 insertions(+), 54 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/nxp,tda998x.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/bridge/tda998x.txt
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/patch/
>
>
> tda19988@70: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
>         arch/arm64/boot/dts/renesas/r8a774c0-cat874.dtb
>         arch/arm64/boot/dts/renesas/r8a774c0-ek874.dtb
>         arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dtb
>         arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb
>
> tda19988@70: ports: 'oneOf' conditional failed, one must be fixed:
>         arch/arm/boot/dts/am335x-boneblack.dtb
>         arch/arm/boot/dts/am335x-boneblack-wireless.dtb
>         arch/arm/boot/dts/am335x-sancloud-bbe.dtb
>
> tda19988@70: ports:port@0: 'reg' is a required property
>         arch/arm/boot/dts/am335x-boneblack.dtb
>         arch/arm/boot/dts/am335x-boneblack-wireless.dtb
>         arch/arm/boot/dts/am335x-sancloud-bbe.dtb
>
> tda9988@70: ports: 'oneOf' conditional failed, one must be fixed:
>         arch/arm/boot/dts/am335x-myirtech-myd.dtb
>
> tda9988@70: ports:port@0: 'reg' is a required property
>         arch/arm/boot/dts/am335x-myirtech-myd.dtb

Please test this with the earlier patches in the same series applied ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
