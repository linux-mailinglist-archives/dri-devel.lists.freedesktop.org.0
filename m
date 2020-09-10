Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B27D264228
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 11:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94FBA6E8CE;
	Thu, 10 Sep 2020 09:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F4E6E8CE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 09:33:49 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id y5so4801064otg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 02:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/C47IB+M4nbaJ9760h1nUtZkhySt02neFnlZ98xNcsk=;
 b=hdTucgkUlP/DDkSEXSuNmB00xCCTBas7HOTMto+DBr61AVUzWWjm4rKUQ6CkpEllhd
 Yn4jMKeo4SKVvjZOPEJwqxYx52zlcaqObW4TBRknK+sJkd0u4wd315qD67U9Tnc7Bv87
 HDHXALxw+OB10XP4/On/rgLoiEoSPjTUSCkWWsp1qSwe8yUuDXnAbFVlG4j3Xd+lo7im
 XUkKaEVv6pkW9xbk2xxCM/1wbZGP04A2lwMi8Id1fQPAp7trDmlGuBnTm6aZMzBBK46O
 pfQsBi/h1s0Ir6UAsNoqHezuN1pS1I3ebYDhdBpkSSjWPb0PzCkenbpn6UuiLv28t/80
 yLqA==
X-Gm-Message-State: AOAM531gWYehz09CNT4UTIG56RjbaQTtv6tqRr2FbXHm8EFdfldEmoxH
 X/F3ysJTyxE8kjixeAI9Wqorzgt7m3DZ8QRmi1XY4t/0grU=
X-Google-Smtp-Source: ABdhPJyKtepHyQ3hj+VpqxVbmkIPUxk+KZPk5olzAOt0nNaXE+lJagqO0th4OOsmJLg0LdaTe+wwlek1fosVWcd6QfQ=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr3428638otb.250.1599730428650; 
 Thu, 10 Sep 2020 02:33:48 -0700 (PDT)
MIME-Version: 1.0
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87h7s9rtvl.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h7s9rtvl.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Sep 2020 11:33:37 +0200
Message-ID: <CAMuHMdWaH7eTFTxPUR6qmxV1m=GK_LW7o=ct7x+yE2UQJDy2ig@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] arm64: dts: renesas: r8a77961: Add FCP device
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
Cc: Linux-DT <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
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

On Tue, Sep 8, 2020 at 2:34 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds FCP device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch was tested on R-Car M3-W+ Salvator-XS board.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2004,6 +2004,58 @@ pciec1: pcie@ee800000 {
>                         status = "disabled";
>                 };
>
> +               fcpf0: fcp@fe950000 {
> +                       compatible = "renesas,fcpf";
> +                       reg = <0 0xfe950000 0 0x200>;
> +                       clocks = <&cpg CPG_MOD 615>;
> +                       power-domains = <&sysc R8A77961_PD_A3VC>;
> +                       resets = <&cpg 615>;

Missing "iommus = <&ipmmu_vc0 16>;"

> +               };
> +
> +               fcpvb0: fcp@fe96f000 {
> +                       compatible = "renesas,fcpv";
> +                       reg = <0 0xfe96f000 0 0x200>;
> +                       clocks = <&cpg CPG_MOD 607>;
> +                       power-domains = <&sysc R8A77961_PD_A3VC>;
> +                       resets = <&cpg 607>;

Missing "iommus = <&ipmmu_vi0 5>;"

> +               };

The rest looks good to me, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
