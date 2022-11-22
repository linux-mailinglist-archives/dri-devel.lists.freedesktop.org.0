Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A44D633797
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 09:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CD510E3B0;
	Tue, 22 Nov 2022 08:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B8D10E3B0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 08:55:23 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id cg5so8840405qtb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 00:55:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P7qk9S0cPIQ0L5zgnqXV8Oc65l49/AfnuuGAj/cKJTk=;
 b=N7I1djnPLK0Of6rf6OyxikHLYZ/O646o0udh7n+gypeYQ6oRsNrF/hJKoPGMyxRSyc
 g5Nz4cTjGE0yJlsHrfX3THGJ0Px+kv/POo+VOTz5OsakordXepEC/qgBOyVlBeBpGkR5
 niUsL/WpbRxDUipqctwmFqGNBIfVc474ZgNEe2HGLJ50LI+vitMt8hVQg05vif4EYzWC
 braSWGms9HgC/j/0onEYpwFQzsXQzj3y82hTqwLibicmHFaVMUFL0wj89SAGiwXClhps
 Lge3Cu6Staz0rkL5BEELLgjUiPGtp9F/vq9owqPkPHQZIafyZoJaex7oDRORCwMOCEaI
 IQHQ==
X-Gm-Message-State: ANoB5pma/IJO6puD5h32U+VARvaWGFCpatSSQApFVKwAwIgGAQk/xasx
 wV0ErH8ZpMCFsInl9miA9yhrOgmsbuZjxg==
X-Google-Smtp-Source: AA0mqf7L0ehNiBdAvLMb6xNJMe3xri1SAV5OZT0IpI5iHNBUYe1YAIx76mfTxeR1Ynws/ayx3fSLjw==
X-Received: by 2002:a05:622a:909:b0:3a5:7aaa:cfac with SMTP id
 bx9-20020a05622a090900b003a57aaacfacmr21178584qtb.278.1669107322570; 
 Tue, 22 Nov 2022 00:55:22 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 v14-20020a05620a440e00b006a6ebde4799sm10023071qkp.90.2022.11.22.00.55.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 00:55:21 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-3abc71aafcaso5183047b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 00:55:21 -0800 (PST)
X-Received: by 2002:a0d:fec2:0:b0:36b:56d3:71b8 with SMTP id
 o185-20020a0dfec2000000b0036b56d371b8mr20585246ywf.384.1669107321620; Tue, 22
 Nov 2022 00:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-3-tomi.valkeinen@ideasonboard.com>
 <CAMuHMdWUvLzCtFRXvUpCxczpkpaunb==gjBMwdniXY4UBVuMUw@mail.gmail.com>
 <f5df3cb8-d315-b06b-aa04-f0b4af64a1c2@ideasonboard.com>
In-Reply-To: <f5df3cb8-d315-b06b-aa04-f0b4af64a1c2@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Nov 2022 09:55:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWsvcd3_CX_dESW3EO4FoSGcMWAAyKO_5g2ch-jezdzzQ@mail.gmail.com>
Message-ID: <CAMuHMdWsvcd3_CX_dESW3EO4FoSGcMWAAyKO_5g2ch-jezdzzQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/8] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Add r8a779g0
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Tue, Nov 22, 2022 at 9:20 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 17/11/2022 17:14, Geert Uytterhoeven wrote:
> > On Thu, Nov 17, 2022 at 1:26 PM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> Extend the Renesas DSI display bindings to support the r8a779g0 V4H.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>   .../bindings/display/bridge/renesas,dsi-csi2-tx.yaml           | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> >> index afeeb967393d..bc3101f77e5a 100644
> >> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> >> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> >> @@ -11,13 +11,14 @@ maintainers:
> >>
> >>   description: |
> >>     This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
> >> -  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
> >> +  R-Car V3U/V4H SoC. The encoder can operate in either DSI or CSI-2 mode, with up
> >
> > Perhaps "R-Car Gen4 SoCs", so we stay within 80 chars, and don't have
> > to update this when the next member of the family is around the block?
>
> Is V3U gen 4? Or do you mean "R-Car V3U and Gen 4 SoCs"?

Despite the name, R-Car V3U is the first member of the R-Car Gen4 family...
https://www.renesas.com/us/en/products/automotive-products/automotive-system-chips-socs/r-car-v3u-best-class-r-car-v3u-asil-d-system-chip-automated-driving

> > Is there anything that might be SoC-specific?
> > If not, perhaps the time is ripe for a family-specific compatible value?
>
> At least v3u and v4h DSIs are slightly different. Well, the DSI IP block
> itself looks the same, but the PLL and PHY are different.

I noticed, when I saw the dsi-csi2 driver changes.
So no family-specific compatible value is needed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
