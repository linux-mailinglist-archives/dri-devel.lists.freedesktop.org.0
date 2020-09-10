Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B482642D1
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 11:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854F26E8DD;
	Thu, 10 Sep 2020 09:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com
 [209.85.161.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3936E8DD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 09:50:41 +0000 (UTC)
Received: by mail-oo1-f68.google.com with SMTP id q34so1279224ooi.13
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 02:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uc+Xr2qe6UKlIcR63NA2C0Yz5MS8E3knGkDIrPYmc20=;
 b=AqB3KuDkSE21mCutb3x1yC2Rkz8jNCaBB3PLoXMKOOfI8PkyeXO/ZX220p+jAw/ZFx
 7uqzmWTcrrn25xhQ87V3fZAQP/6XRLtyUK/i/p3RoO6ICm+gbZKZihCsCCfHr2KnTt5A
 8hZJ3xnT1Q2rX30IrQR+6J7fhTFL0Z4x6N8LKiaecUZe6IzkqXEVNZw9BRavuXm7nWCL
 eGSOl6y/YuGTvOL/QUjkiEsuxOttJbRpmDbhUA4DSzdMKZ0YV7QCBCW31pWnEb1oqJJJ
 Sx65TknrrIOiFk79rdsVgPLMGLplUwI7IcnExxBIchF3KOMBlC+V+1TL5cykbC63Ei6e
 XVGA==
X-Gm-Message-State: AOAM531UxcwERuiYk+XsWftWgQZrAnv76DOw+TZ0EVVq1RWV0GwCrJEd
 7iOy9xRTNVaOTtL7Rk3yodsENDcWviVc5iJqlSM=
X-Google-Smtp-Source: ABdhPJxaQStxO5cKKQfQBE/p7ZmWrN6b1+2E8A3IeQaauYLymMsfJHdQAz9a20ZC/kOLfe0B7ViQ/Qd1cpOyMO1M3MU=
X-Received: by 2002:a4a:5403:: with SMTP id t3mr3892746ooa.11.1599731441118;
 Thu, 10 Sep 2020 02:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87eendrtv1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eendrtv1.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Sep 2020 11:50:30 +0200
Message-ID: <CAMuHMdUmfavKH03LRj4WNoOEbu+oY64_Mic74zCfFbK4rO9KSw@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] arm64: dts: renesas: r8a77961: Add DU device
 nodes
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
Cc: Linux-DT <devicetree@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus <magnus.damm@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Laurent <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Morimoto-san,

On Tue, Sep 8, 2020 at 2:35 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds DU device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch was tested on R-Car M3-W+ Salvator-XS board.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index 423808b6cd58..c7fabd9e875b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2165,8 +2165,19 @@ port@2 {
>                 };
>
>                 du: display@feb00000 {
> +                       compatible = "renesas,du-r8a77961";
>                         reg = <0 0xfeb00000 0 0x70000>;
> -                       /* placeholder */
> +                       interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
> +                                <&cpg CPG_MOD 722>;
> +                       clock-names = "du.0", "du.1", "du.2";
> +                       resets = <&cpg 724>, <&cpg 722>;
> +                       reset-names = "du.0", "du.2";
> +
> +                       renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
> +                       status = "disabled";

Do you want support for CMMs?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
