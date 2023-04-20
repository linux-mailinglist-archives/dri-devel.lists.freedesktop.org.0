Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A32CD6E97F9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 17:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623B810EC81;
	Thu, 20 Apr 2023 15:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B889D10EC81
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 15:05:24 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id z38so3094117ljq.12
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 08:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682003122; x=1684595122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZjATNR9xN0TX4Afa/FkjvELVtb7InkL6+l1hWMyUq0g=;
 b=jLSVg6bylRpkrl/qFqxz59skUqr4UOEp6SVDpqOak2gD3HtsCGHVS/wmYRKiakL9Ub
 Cwi9meyjY1aB0Ot7FrpIW3b0/0sidb7zkeh+R1Bm74SPaYjADn6OA3EeqmnqRI+77zLM
 +pYQCSjWl2ZY8bGWc6wSqeoUpsEoyh1NsjJn5P6lmBhOzZrikN5p2HnaSewCbOkZByC0
 /ej6bfmBSLC+fkDvAkCyzSvinDRTxQLM13CHcl1+lyaIRcwkkf/1BjxZDnF/oI8+zhMu
 Rh08CFDSfbnMv5QWC97xcmuo45ioARZGn+aNv4zL+/PEwNEqDNENfbrx7WkKdKKh80Hc
 9F7A==
X-Gm-Message-State: AAQBX9cMHUXZjHzdeNQk/m4tygyXRvrgO8hpLmTJ/ka/zSW36ZmtChjJ
 fIO40LOVv3s8gSIk47SezyJCCryD7A0mkJHV
X-Google-Smtp-Source: AKy350YXgF8SQ+/+DABvhWeShZqsr47dfK/JQ9DsI+I0O6G0Nq9ZXwdAk3MBfa2xTG+5YRq38QpIcQ==
X-Received: by 2002:a2e:a724:0:b0:2a8:bbb8:dd61 with SMTP id
 s36-20020a2ea724000000b002a8bbb8dd61mr1783626lje.5.1682003121687; 
 Thu, 20 Apr 2023 08:05:21 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 z4-20020a2e3504000000b002a77792f2dbsm267682ljz.36.2023.04.20.08.05.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 08:05:14 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2a8dc00ade2so5830121fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 08:05:14 -0700 (PDT)
X-Received: by 2002:a19:700a:0:b0:4e9:d8ba:169 with SMTP id
 h10-20020a19700a000000b004e9d8ba0169mr496300lfc.1.1682003114061; Thu, 20 Apr
 2023 08:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230411120810.368437-1-biju.das.jz@bp.renesas.com>
 <20230411120810.368437-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230411120810.368437-7-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Apr 2023 17:04:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuC9T35G=Dn2jCyBkJm4Eopgv9KQ-SpyVx+KiX1fe=NA@mail.gmail.com>
Message-ID: <CAMuHMdVuC9T35G=Dn2jCyBkJm4Eopgv9KQ-SpyVx+KiX1fe=NA@mail.gmail.com>
Subject: Re: [PATCH v7 6/8] arm64: dts: renesas: r9a07g054: Add DU node
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Tue, Apr 11, 2023 at 2:12=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add DU node to RZ/V2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v7:
>  * New patch.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
> @@ -677,6 +677,20 @@ fcpvd: fcp@10880000 {
>                         resets =3D <&cpg R9A07G054_LCDC_RESET_N>;
>                 };
>
> +               du: display@10890000 {
> +                       compatible =3D "renesas,r9a07g054-du";

I think you have to make your mind up about using a fallback compatible
value or not. As the VSP has one, I think the DU should have one, too.

> +                       reg =3D <0 0x10890000 0 0x10000>;
> +                       interrupts =3D <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_MOD R9A07G054_LCDC_CLK_A>,
> +                                <&cpg CPG_MOD R9A07G054_LCDC_CLK_P>,
> +                                <&cpg CPG_MOD R9A07G054_LCDC_CLK_D>;
> +                       clock-names =3D "aclk", "pclk", "vclk";
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg R9A07G054_LCDC_RESET_N>;
> +                       renesas,vsps =3D <&vspd 0>;
> +                       status =3D "disabled";
> +               };
> +
>                 cpg: clock-controller@11010000 {
>                         compatible =3D "renesas,r9a07g054-cpg";
>                         reg =3D <0 0x11010000 0 0x10000>;

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
