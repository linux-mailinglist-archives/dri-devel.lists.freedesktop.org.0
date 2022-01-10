Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 833154893E0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 09:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA6B12AD6D;
	Mon, 10 Jan 2022 08:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5663612AD6D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 08:44:12 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id m90so6813017uam.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 00:44:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j8L7Ts6Y/3w7PZcX5mTRn1c1+l5sen9Q1rKBXZdOEiQ=;
 b=MxnfIQHYqjkcLX8TQc91c9Z8H9Sz9S4T0QPwybzHduiTM28mM0szlX12zMxnwUUJOx
 7y0lj2ghq2ut181/Z1NlSTszTUgFb4sBnWjCWtJMjv/cQFfTI1RBlrheZtUK9i0R5I2l
 PeiW0bZHGjiFabG2xfKr99UcJWeU9AypwUEHi6M88VW7aqtUufyPVT67F+Y4shPltRS3
 daOYL3w/b9HPu4HZwXH7iuTn8Fdi7RilEijoh04n8/fit9H5VEsDoeUUqSjPx283Qwkt
 ytzk29Qr7iaTsJgtcz59mlCiPSV2KPsxJJxcLstTlpdDmcSC6TypEod9Hh4ow2/WSuXP
 NUoA==
X-Gm-Message-State: AOAM530MITSy4H8ixoYYfAiUhrdwXJ/M3uLOpXcQq+wpVhYZxKXKcmgD
 s6LVCwEkXLHUjvIls+F6IflD2AREEK6rjg==
X-Google-Smtp-Source: ABdhPJy3eIYBxtaYrufggFuGOhSA++db30xn84nMJA3dr7bn9BZeDh+DtbKgpvlre4BX87Ibnxp+/Q==
X-Received: by 2002:a67:6142:: with SMTP id v63mr3003818vsb.8.1641804251130;
 Mon, 10 Jan 2022 00:44:11 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com.
 [209.85.221.174])
 by smtp.gmail.com with ESMTPSA id x190sm3348247vkf.56.2022.01.10.00.44.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 00:44:10 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id g5so3822233vkg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 00:44:10 -0800 (PST)
X-Received: by 2002:a05:6122:21a6:: with SMTP id
 j38mr27491098vkd.39.1641804249990; 
 Mon, 10 Jan 2022 00:44:09 -0800 (PST)
MIME-Version: 1.0
References: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
 <20211224052309.1997096-3-nikita.yoush@cogentembedded.com>
 <YcyTV4fJqMHIeyYB@pendragon.ideasonboard.com>
In-Reply-To: <YcyTV4fJqMHIeyYB@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Jan 2022 09:43:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVqUcjRQHD898Ja4R0X3QpXvTODE8=pG7UjJ-NtHTFSDA@mail.gmail.com>
Message-ID: <CAMuHMdVqUcjRQHD898Ja4R0X3QpXvTODE8=pG7UjJ-NtHTFSDA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77961: Add lvds0 device node
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Dec 29, 2021 at 5:56 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Dec 24, 2021 at 08:23:08AM +0300, Nikita Yushchenko wrote:
> > Add the missing lvds0 node for the R-Car M3-W+ SoC.
> >
> > Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 27 +++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> > index 86d59e7e1a87..a34d5b1d6431 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> > @@ -2718,6 +2718,33 @@ du_out_hdmi0: endpoint {
> >                               port@2 {
> >                                       reg = <2>;
> >                                       du_out_lvds0: endpoint {
> > +                                             remote-endpoint = <&lvds0_in>;
> > +                                     };
> > +                             };
> > +                     };
> > +             };
> > +
> > +             lvds0: lvds@feb90000 {
> > +                     compatible = "renesas,r8a77961-lvds";
> > +                     reg = <0 0xfeb90000 0 0x14>;
> > +                     clocks = <&cpg CPG_MOD 727>;
> > +                     power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> > +                     resets = <&cpg 727>;
> > +                     status = "disabled";
> > +
> > +                     ports {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
> > +
> > +                             port@0 {
> > +                                     reg = <0>;
> > +                                     lvds0_in: endpoint {
> > +                                             remote-endpoint = <&du_out_lvds0>;
> > +                                     };
> > +                             };
> > +                             port@1 {
> > +                                     reg = <1>;
> > +                                     lvds0_out: endpoint {
> >                                       };
>
> Endpoints must have a remote-endpoint property. Let's drop the endpoint
> here and keep the port only, the endpoint can be declared in board
> files.
>
> If you're fine with this change I can make it when applying the patch.

Isn't this patch for me to apply to renesas-devel?

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
