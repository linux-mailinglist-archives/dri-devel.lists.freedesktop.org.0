Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E2150674A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 10:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3646D10E8F0;
	Tue, 19 Apr 2022 08:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598BE10E8F0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 08:56:32 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id x24so3282102qtq.11
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 01:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LjOeqfSZ1Rvs+3TDyOnSQqOYBJijn66+09FuaSFiHvE=;
 b=VuTaN5N0a//ISboX4QP6Dzfbb2cQtLFILNkjYYZYs9OJD1OqmGyBHzpAGZzbGy8POe
 1yTwoMv7rIpUuooW2MbRwPHJdE26+x0H6NZkbn1DcUFSRZ8U+fG3nfFKisZdbMlX7xvc
 p5eRiFLNtkSLLisKPQEOoRDrbockAgnchORg3/dwdXAcN+gj7iA+flFjeTrCJHHdpzL/
 9k0xH3UxVU+tadOwEPicE3qoj5rrjyZFnEmXcSdWDUUDn+oFnHsDlfOaZH1n3xYZY2fw
 lMiuqWARlhArSvSIq6X0UiI64aHjvXK5DpwNNKe/+DTc8fByYb9p3pnrAN3AiI04coB0
 ka3A==
X-Gm-Message-State: AOAM531vUqBpQr9b+26BEWU9tP5VNz2eb43q4iLqGlHdJTTsriYwAvRO
 THPkXCvmERMqowtPCdWrjsPHCTURToyAMg==
X-Google-Smtp-Source: ABdhPJypQ7bbuI0sUtsTetwuP4Eygq2D890idzsb/n+IIVRfYXGnnu/nN4Ug2ICdIYCs6CbMBZcPlA==
X-Received: by 2002:ac8:5d8c:0:b0:2e1:e196:326a with SMTP id
 d12-20020ac85d8c000000b002e1e196326amr9517738qtx.475.1650358591027; 
 Tue, 19 Apr 2022 01:56:31 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 d22-20020a05622a101600b002f1f139d83bsm6096870qte.84.2022.04.19.01.56.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 01:56:30 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2ebf4b91212so164713367b3.8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Apr 2022 01:56:30 -0700 (PDT)
X-Received: by 2002:a0d:e743:0:b0:2eb:3106:9b32 with SMTP id
 q64-20020a0de743000000b002eb31069b32mr14815567ywe.512.1650358590048; Tue, 19
 Apr 2022 01:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220328064931.11612-1-biju.das.jz@bp.renesas.com>
 <20220328064931.11612-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220328064931.11612-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Apr 2022 10:56:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWcsJDbbVrh9Uoe7Fv4o55_T=yNKh_ZGxzRgLzwURmYrQ@mail.gmail.com>
Message-ID: <CAMuHMdWcsJDbbVrh9Uoe7Fv4o55_T=yNKh_ZGxzRgLzwURmYrQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Document RZ/G2L MIPI
 DSI TX bindings
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Mon, Mar 28, 2022 at 8:49 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The RZ/G2L MIPI DSI TX is embedded in the Renesas RZ/G2L family SoC's. It
> can operate in DSI mode, with up to four data lanes.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
> @@ -0,0 +1,175 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L MIPI DSI Encoder
> +
> +maintainers:
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |
> +  This binding describes the MIPI DSI encoder embedded in the Renesas
> +  RZ/G2L alike family of SoC's. The encoder can operate in DSI mode, with
> +  up to four data lanes.
> +
> +allOf:
> +  - $ref: /schemas/display/dsi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,rzg2l-mipi-dsi # RZ/G2L and RZ/V2L

Do you want to define SoC-specific compatible values, or can the
IP revision be read from the hardware?

The rest LGTM (I'm no MIPI-DSI expert), so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
