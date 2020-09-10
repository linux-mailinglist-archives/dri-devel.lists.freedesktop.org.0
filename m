Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC732642A6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 11:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7366E8D8;
	Thu, 10 Sep 2020 09:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D2C6E8D8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 09:44:42 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id q34so1275505ooi.13
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 02:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bme4dCuLQz1jNtKozCKrKV/qMMzTtbQIKl8SOBrnIpY=;
 b=ZLxYK6zEJs7oikhsM/JMHDZ/CifVqwF6J2RgZiz2zZVIQzCfZGYbbzGon5FJMG4TFz
 3qWwXoIlIMNxgi+j0tkQohxzJ+MOTU6RXmgPE5GNB12PWJq9rGLSwqaRUpcekwuSMS2y
 1bly64jMrSjKI8ufJ+Ff6uiIwHRpsFR5SZ8PU8Do/JfrQq9lzR/1xnQud5MfRXHe54Yq
 ZJzqkpqsIK4OZV0AlIu7kt9vmfdV4bYIW+1VmNxTSXf5n9k0wmIi1NFTn9wsoyjKmkn0
 KnU26Q7/dADoysfmiCt0tzvLmGAs+jmMZ8FfzdJNSwIPjcQs/ZdDSo7c3mwduerHeeRU
 zy0Q==
X-Gm-Message-State: AOAM531Vv8rzRPBGJ4cKVM9+196FEws1YN7ucFwIFn1qtF6z5CizLuYe
 C9zjpapxSd9VP0u1C1nNuZiTuP5P1a8QDVyH/ww=
X-Google-Smtp-Source: ABdhPJx/YwFaGebZ9WNscKSjKZjyL215smGi7wQIDspuYwOwQujoXq+ek3zx2mrKm058JDDmK0imBOa/5Ycsl0/cbLE=
X-Received: by 2002:a4a:da4e:: with SMTP id f14mr3811962oou.40.1599731082021; 
 Thu, 10 Sep 2020 02:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
 <31ec6196-7613-8eb3-e092-07d0c874632a@ideasonboard.com>
In-Reply-To: <31ec6196-7613-8eb3-e092-07d0c874632a@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Sep 2020 11:44:30 +0200
Message-ID: <CAMuHMdVHGQ0FFcLjQfXhke5PKJKnNfZ3NOF-p08v3QrQ-87npA@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: renesas: r8a77961: Add VSP device nodes
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
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
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 David Airlie <airlied@linux.ie>,
 "\(Renesas\) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
 Magnus <magnus.damm@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Laurent <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

On Mon, Sep 7, 2020 at 5:55 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 07/09/2020 03:59, Kuninori Morimoto wrote:
> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >
> > This patch adds VSP device nodes for R-Car M3-W+ (r8a77961) SoC.
> > This patch is test on R-Car M3-W+ Salvator-XS board.
> >
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 55 +++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> > index fe0db11b9cb9..c2a6918ed5e6 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> > @@ -2056,6 +2056,61 @@ fcpvd2: fcp@fea37000 {
> >                       iommus = <&ipmmu_vi0 10>;
> >               };
>
> The FCP's added are:
>
>                 fcpf0: fcp@fe950000 {
>                 fcpf1: fcp@fe951000 {
>                 fcpvb0: fcp@fe96f000 {
>                 fcpvb1: fcp@fe92f000 {
>                 fcpvi0: fcp@fe9af000 {
>                 fcpvi1: fcp@fe9bf000 {
>                 fcpvd0: fcp@fea27000 {
>                 fcpvd1: fcp@fea2f000 {
>                 fcpvd2: fcp@fea37000 {
>
> So indeed, the first fcpf0 comes before fe960000.
>
> Do we keep the items grouped by the first occurrence? or sort the nodes
> based on address?
>
> for some reason I thought we were ordering based on address, but I see
> other situations where we group too - so I'm confused (and wishing there
> was an automatic tool to get the sorting correct without fuss).
>
> Is there a set policy?

For nodes with a unit-address, we usually[*] sort by unit-address, but we keep
similar nodes grouped.  Hence I prefer this v1 over v2.

[*] Seems like FCP/VSP are interleaved in r8a77990.dsi, doh.

> > +             vspb: vsp@fe960000 {
> > +                     compatible = "renesas,vsp2";
> > +                     reg = <0 0xfe960000 0 0x8000>;
> > +                     interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&cpg CPG_MOD 626>;
> > +                     power-domains = <&sysc R8A77961_PD_A3VC>;
> > +                     resets = <&cpg 626>;
> > +
> > +                     renesas,fcp = <&fcpvb0>;
> > +             };

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
