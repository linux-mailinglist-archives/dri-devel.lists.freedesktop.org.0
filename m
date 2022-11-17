Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE9D62DF6A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 16:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B842E10E628;
	Thu, 17 Nov 2022 15:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F132110E628
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 15:14:34 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id p18so1357987qkg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 07:14:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SegVnAcLQLaJX7pNjPa5EmAcFg4cHidqxjj8yBrAgQs=;
 b=ZayDHA+5ryyTlY/+1TGmTKANHIxxcWD29Ut5ZQq3GcV6NnOYOU7QDo7fWuIx1J9era
 zi8kOoPhy/GVHR4/BWScrD/AgFYaZV9Q7OCW5W9I7A4Pf7EQqU4dZ8GHGsfmu7Ow5vTd
 OhKMDG6vP+fL5I+HgzdaGGTpst6HMgCeRhCcIHA7SlkRyGjBz/NCkzyxttXk+mkToRdk
 VTx3lLWoKd4316xMVcsMZzIbHSE3Gg5IJmZTLLv5zndQP4j2kVA/JMIiZsO39xBhkRLf
 XgsF1Yh0qBb43QtQr+hN1WqJAxQiFmEzRJDwySWkqMhKeyCCoOvqIwVArNP/ZbBieZ/7
 Rj5g==
X-Gm-Message-State: ANoB5pkhYD3ammwxpU32DTv0phNB5/DANG+J/dtVQY+95/ICnJgecaMf
 iVvmYHyWdC1tzNSz1ubtfYvaD6CBWWkEpQ==
X-Google-Smtp-Source: AA0mqf7mT772JeMSWgf4U/fYhztzRRK6z/Cpb48SWCVE2qbLh6I/lxjOsZmNkC1MFNRSmPOBaOX1Qg==
X-Received: by 2002:a05:620a:b83:b0:6fb:ec6:da03 with SMTP id
 k3-20020a05620a0b8300b006fb0ec6da03mr2009227qkh.206.1668698073766; 
 Thu, 17 Nov 2022 07:14:33 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 r13-20020a05620a298d00b006eee3a09ff3sm610701qkp.69.2022.11.17.07.14.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 07:14:32 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id 205so2201844ybe.7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 07:14:32 -0800 (PST)
X-Received: by 2002:a25:9e84:0:b0:6de:6183:c5c3 with SMTP id
 p4-20020a259e84000000b006de6183c5c3mr2545467ybq.89.1668698072311; Thu, 17 Nov
 2022 07:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-3-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221117122547.809644-3-tomi.valkeinen@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Nov 2022 16:14:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWUvLzCtFRXvUpCxczpkpaunb==gjBMwdniXY4UBVuMUw@mail.gmail.com>
Message-ID: <CAMuHMdWUvLzCtFRXvUpCxczpkpaunb==gjBMwdniXY4UBVuMUw@mail.gmail.com>
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

On Thu, Nov 17, 2022 at 1:26 PM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> Extend the Renesas DSI display bindings to support the r8a779g0 V4H.
>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  .../bindings/display/bridge/renesas,dsi-csi2-tx.yaml           | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> index afeeb967393d..bc3101f77e5a 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> @@ -11,13 +11,14 @@ maintainers:
>
>  description: |
>    This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
> -  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
> +  R-Car V3U/V4H SoC. The encoder can operate in either DSI or CSI-2 mode, with up

Perhaps "R-Car Gen4 SoCs", so we stay within 80 chars, and don't have
to update this when the next member of the family is around the block?

Is there anything that might be SoC-specific?
If not, perhaps the time is ripe for a family-specific compatible value?

>    to four data lanes.
>
>  properties:
>    compatible:
>      enum:
>        - renesas,r8a779a0-dsi-csi2-tx    # for V3U
> +      - renesas,r8a779g0-dsi-csi2-tx    # for V4H
>
>    reg:
>      maxItems: 1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
