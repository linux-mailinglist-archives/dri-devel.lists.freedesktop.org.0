Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997FA4696F4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 14:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AFB7AA94;
	Mon,  6 Dec 2021 13:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5035A7AA94
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 13:24:54 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id j14so19402316uan.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Dec 2021 05:24:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hUTPaB3i0du6uvmwX41ota+aoFFQiaoFa1Jt/8inJiQ=;
 b=x+YyC0fuLFfRJurssAFwLu4C/d+jmxx6bDYaEX11LXi3wuvUkf/7IAPfoh2olRywjy
 E2a5w19GgrKzUh9nYCM27NuGIfFWu2yPYU5AeRktqGo3DTtO/z7HMddsysEjWAom5oc6
 NZNNC2QP5Z7eYID9jdq6fs6CGOTwGS7kyluuxzrayrvbc8W4FdKufzIl6TalqY2WoBj8
 NDVrN35kEkAIPzY1yhr3szimUioUtfmMtPVZgtlI/4aw9lnLDi7BMjhTKPr8de0Ilke5
 SOdubnUcBm1iu3rTIcEm4PvWbVMKy22+TLUjw71E2Kimy67Fv7GaRIA/yRsrsQzCIoSZ
 3fmA==
X-Gm-Message-State: AOAM532kvvbvQZD/PV6Au0X0HXyBrIzAcE4FyMb4qwwEgxd2XCYzolb5
 nauPq7NbyRStmer12FOOfJb2fJitov20Vw==
X-Google-Smtp-Source: ABdhPJzrAkVX1AuKKYusdeqdypOiI3M8AikLMAdleiLhGFBbpty9vouJSgm3/GmwIk9WBNJtP5miWg==
X-Received: by 2002:a05:6102:f10:: with SMTP id
 v16mr36818176vss.86.1638797093149; 
 Mon, 06 Dec 2021 05:24:53 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id y7sm4298597uac.3.2021.12.06.05.24.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 05:24:52 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id ay21so19415596uab.12
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Dec 2021 05:24:52 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr39567596uai.89.1638797092369; 
 Mon, 06 Dec 2021 05:24:52 -0800 (PST)
MIME-Version: 1.0
References: <20211203115154.31864-1-biju.das.jz@bp.renesas.com>
 <20211203115154.31864-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211203115154.31864-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Dec 2021 14:24:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+eYymZBQv8xrLKFCzORxmGe==Vc4z5qjxq+2vNfgaAw@mail.gmail.com>
Message-ID: <CAMuHMdU+eYymZBQv8xrLKFCzORxmGe==Vc4z5qjxq+2vNfgaAw@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: gpu: mali-bifrost: Document RZ/G2L
 support
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
 David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Fri, Dec 3, 2021 at 12:52 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The Renesas RZ/G2{L, LC} SoC (a.k.a R9A07G044) has a Bifrost Mali-G31 GPU,
> add a compatible string for it.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml

> @@ -52,7 +64,8 @@ properties:
>      maxItems: 3
>
>    resets:
> -    maxItems: 2
> +    minItems: 1

2, as before?

> +    maxItems: 3

Perhaps you should add reset-names?

>
>    "#cooling-cells":
>      const: 2
> @@ -113,6 +126,21 @@ allOf:
>          - sram-supply
>          - power-domains
>          - power-domain-names
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g044-mali
> +    then:
> +      properties:
> +        interrupt-names:
> +          minItems: 4
> +        clock-names:
> +          minItems: 3
> +      required:
> +        - clock-names
> +        - power-domains
> +        - resets

reset-names

>      else:
>        properties:
>          power-domains:

The rest looks good to me, but I'm no Mali expert.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
