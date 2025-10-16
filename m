Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFCDBE2283
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 10:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F57710E2DE;
	Thu, 16 Oct 2025 08:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A9210E2DE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 08:30:45 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-88ff65374f3so23372285a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 01:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760603444; x=1761208244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IxMxNXtMy6Jnm1vHPFEexy61mNhacC+YBJiirqBC3iQ=;
 b=aeziEnpyZ2UXJ6KC85KeNRt38c9h7hpajHos+NmQQDLknKW5CuDlhlj+pRReETGihs
 0ou7iCzqQD8SG+w9hHRMgTUHUnVC9FWQkrdcUGUkbaC1Ib67O/atoCjs1IGSb4BSwoys
 zKi0oov8P0Cocz3NDeRbRtP5oNHaDa3v1u7CMRZGFMyBGqM/NjntYImam5wcXHyJF6zO
 dxOe9gGMpzo8rNHwXi4/dqSsKafq4gt8xCuCm7swyBtQFhVnF/fo3uAR2Ddgx1W4+sni
 PdgRxISb+cOMbwk9PKbr24o3PYP6mES3dAmmdCeNiMc2HjBD0iPRCc7KiloXDQPwSSn2
 EcGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO9Cmbjbi4q2lDLMtqxyhgvQ0WlU8vMZcxB3dn4Q/YrKrwXXqY/X8bEn9AVf7yLK7v/CokOuGW4TM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX/6CXm7jpZpg6sM0JP5KSVlqg599hM3eHrQGl1aYPnqZaW0Md
 7RO1TvwmMpJ8RDZ8+GjaA4kct/WGwf8wo6xAIS0Ywpt72F/OmxKLNqDmCOgG+L05
X-Gm-Gg: ASbGncsblb0dlH14YlJlTrzUZ3NmsmtLCbOE8VOWGBZ0I9XPVKQY9UcjKMnBuYP7OhX
 JV/hhdT6dLLAQ2RKv1Ee+cugo+hnn1YHXo+D3KxWGH7duP4KppP0Wc+6+ciG4dagf3ue7V0Xopm
 5Gae46DyhWQd0lXFm6xnSP6Vqn97OGvusuIRUc7/noPzjHRHoPkfoEj0ML4AFQDpb2aQuVv1vQk
 7FzWBOOsTM/Xnn+dcRk1h+0+dwOw6FizsmEc7/eBlN+pCB4bMdO7u6pYOKYa/qmy+xnSLrcv3wF
 9eHC+/4aQ75yRfBxouJ+WSG/ZyL/DAxQeyLd2xAKZo0VgJSX/19ljDIj8CqVx7+vm+arE/1TYGO
 rT+u+56XHW31WEViGBlkS/GEPsbYFtwC69BVf/qV/MSRSTe1UGz9r11Chue8Vk/xjcsAv9FvFgk
 cuvH91//xykY51Pi5XO1u3Clal/h8ovvShWa/BlafQ+saUrjI+Bv9J/h4OuHyJF5w=
X-Google-Smtp-Source: AGHT+IEE4R5/ibWQKqMFYanDOwrpEg0T4tfcLEiJIm+YJlZunR1Xi3CQuYTC0KlcFQgx+wkzU5xZ0w==
X-Received: by 2002:a05:620a:2807:b0:856:9f48:c57c with SMTP id
 af79cd13be357-88f0f7352e2mr369654085a.10.1760603443923; 
 Thu, 16 Oct 2025 01:30:43 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com.
 [209.85.222.171]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-88f3861ae61sm152110585a.46.2025.10.16.01.30.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 01:30:43 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-88ff65374f3so23368985a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 01:30:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU21raTHcpF4doLqSQ+vW7z4rr2AfYSidJrQlBM6YFe8KDhNX6rfIr9llaUMOUVqi41h5LtvV28kxo=@lists.freedesktop.org
X-Received: by 2002:a05:6102:801b:b0:59e:73d5:8b57 with SMTP id
 ada2fe7eead31-5d7ce7bd161mr1324148137.16.1760602942005; Thu, 16 Oct 2025
 01:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 10:22:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
X-Gm-Features: AS18NWDLIWGJb_IOoRvlCMu35mq1PVX8494ciH6v3rxbYpQaD3fQbpHBOXBZzcQ
Message-ID: <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Wed, 15 Oct 2025 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W SoC.
>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: - Add RB from Niklas
>     - Fill in all three clock and two power domains
>     - Use renesas,r8a7796-gpu for R8A77960 compatible string

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> @@ -2575,6 +2575,22 @@ gic: interrupt-controller@f1010000 {
>                         resets =3D <&cpg 408>;
>                 };
>
> +               gpu: gpu@fd000000 {
> +                       compatible =3D "renesas,r8a7796-gpu",
> +                                    "img,img-gx6250",
> +                                    "img,img-rogue";
> +                       reg =3D <0 0xfd000000 0 0x40000>;
> +                       interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_CORE R8A7796_CLK_ZG>,
> +                                <&cpg CPG_CORE R8A7796_CLK_S2D1>,
> +                                <&cpg CPG_MOD 112>;
> +                       clock-names =3D "core", "mem", "sys";
> +                       power-domains =3D <&sysc R8A7796_PD_3DG_A>,
> +                                       <&sysc R8A7796_PD_3DG_B>;
> +                       power-domain-names =3D "a", "b";
> +                       resets =3D <&cpg 112>;

status =3D "disabled"; ?

> +               };
> +
>                 pciec0: pcie@fe000000 {
>                         compatible =3D "renesas,pcie-r8a7796",
>                                      "renesas,pcie-rcar-gen3";

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
