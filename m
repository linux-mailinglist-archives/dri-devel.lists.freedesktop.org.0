Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13BE264524
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 13:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E264C6E906;
	Thu, 10 Sep 2020 11:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C306E906
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 11:09:24 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id i17so5512779oig.10
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 04:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XHyLYBCvV/QBPG8y5LyMG37sKoWK6MV97mkGdWUv8vs=;
 b=EvsF2K3/6gvfbDgzZzGVCGuH4IOw95Yt+X1VCuJAHzIytDsrVKNaFFh3ITslImyPhd
 BiXVGuTnNDdYM/Zd79dbZn/2U/O9eLeA0ZFbzgcJPxh7Jb9SVnt7AyCi7gId1B4zHV9K
 aaAI4lnAc3Y5uD1CksapQcENriwZyJA+WQ3FmVlh2MG1l00CI3fFqkOTNIDLhe92WFYW
 x7i2a4ryIdxC5o4cbx7t1t9bhw0kYOfohfkit3YssBrW1yRYiuR8/CXl1MXlSRicNC6g
 2PdR3LFowIJAk9ubVz1ETZNo+xHlTBjOXXWFBeP2L3FRmE7wy47YEsAZAoUwtr2AOp/+
 AmkQ==
X-Gm-Message-State: AOAM531qoLO0F8geclfISo5IDs8qAlAnjrEFb7plxc7aNtGx6UYXCj7F
 RuJf1zjvhNNn7+d3O+owyo0/6bBrKpcdRVrCfCg=
X-Google-Smtp-Source: ABdhPJyRR/8Bfk+8m5dk07edfLMGgniqflKGYa4vK8RrPJXBSGfpDUqz8PGEAe2B9sDx97OhvfrRJ65SBY8tODhzOjw=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr3377102oib.54.1599736163569; 
 Thu, 10 Sep 2020 04:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
 <31ec6196-7613-8eb3-e092-07d0c874632a@ideasonboard.com>
 <CAMuHMdVHGQ0FFcLjQfXhke5PKJKnNfZ3NOF-p08v3QrQ-87npA@mail.gmail.com>
 <f1ed4b08-59eb-986e-4036-820887993f00@ideasonboard.com>
In-Reply-To: <f1ed4b08-59eb-986e-4036-820887993f00@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Sep 2020 13:09:12 +0200
Message-ID: <CAMuHMdVGFOaBFCejGDgzf8AUbHFis0TOM-DDJ3h9k0+fuu=umQ@mail.gmail.com>
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

On Thu, Sep 10, 2020 at 12:34 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> On 10/09/2020 10:44, Geert Uytterhoeven wrote:
> > On Mon, Sep 7, 2020 at 5:55 PM Kieran Bingham
> > <kieran.bingham+renesas@ideasonboard.com> wrote:
> >> On 07/09/2020 03:59, Kuninori Morimoto wrote:
> >>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >>>
> >>> This patch adds VSP device nodes for R-Car M3-W+ (r8a77961) SoC.
> >>> This patch is test on R-Car M3-W+ Salvator-XS board.
> >>>
> >>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> >>> ---
> >>>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 55 +++++++++++++++++++++++
> >>>  1 file changed, 55 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> >>> index fe0db11b9cb9..c2a6918ed5e6 100644
> >>> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> >>> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> >>> @@ -2056,6 +2056,61 @@ fcpvd2: fcp@fea37000 {
> >>>                       iommus = <&ipmmu_vi0 10>;
> >>>               };
> >>
> >> The FCP's added are:
> >>
> >>                 fcpf0: fcp@fe950000 {
> >>                 fcpf1: fcp@fe951000 {
> >>                 fcpvb0: fcp@fe96f000 {
> >>                 fcpvb1: fcp@fe92f000 {
> >>                 fcpvi0: fcp@fe9af000 {
> >>                 fcpvi1: fcp@fe9bf000 {
> >>                 fcpvd0: fcp@fea27000 {
> >>                 fcpvd1: fcp@fea2f000 {
> >>                 fcpvd2: fcp@fea37000 {
> >>
> >> So indeed, the first fcpf0 comes before fe960000.
> >>
> >> Do we keep the items grouped by the first occurrence? or sort the nodes
> >> based on address?
> >>
> >> for some reason I thought we were ordering based on address, but I see
> >> other situations where we group too - so I'm confused (and wishing there
> >> was an automatic tool to get the sorting correct without fuss).
> >>
> >> Is there a set policy?
> >
> > For nodes with a unit-address, we usually[*] sort by unit-address, but we keep
> > similar nodes grouped.  Hence I prefer this v1 over v2.
>
> I assume then the groups are sorted by the first entry,
>
> I.e. hypothetically:
>
> fdp@0
> fcp@1
> vsp@2
> fdp@3
> fcp@4
> vsp@5
> cmm@6
> cmm@7
>
> would become
>
> fdp@0
> fdp@3
> fcp@1
> fcp@4
> vsp@2
> vsp@5
> cmm@6
> cmm@7

Exactly.  That's how we (Reneas SoCs) have been (trying to) doing it.
I am aware there are some deviations (e.g. do you keep all 4 possible
SCIF types together (they're all serial@), or do you group them per
type? And some nodes (ipmmu) may be sorted alphabetically by label).

> Has anyone already created any scripting/validation to automate the
> sorting requirements?

Not yet, AFAIK. I've been thinking about doing that several times,
though ;-)

> > [*] Seems like FCP/VSP are interleaved in r8a77990.dsi, doh.
> >
>
> Personally I prefer that - but my opinion doesn't matter here - so as
> long as the rules are defined (or even better, automatically
> enforceable) that's fine.

Indeed.

Perhaps creating rules is something to be handled at a higher level
(i.e. common for all DTS files)?

Summarizing "our" rules:
  1. Nodes without unit-address are sorted alphabetically, by node name,
  2. Nodes with unit-address are sorted numerically, by unit-address,
       a. Nodes of the same type are grouped together, i.e. the whole
          group is sorted w.r.t. to other nodes/groups based on the
          unit-address of the first member of the group.
  3. Anchors are sorted alphabetically, but anchor name.

Do they make sense?

> >>> +             vspb: vsp@fe960000 {
> >>> +                     compatible = "renesas,vsp2";
> >>> +                     reg = <0 0xfe960000 0 0x8000>;
> >>> +                     interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> >>> +                     clocks = <&cpg CPG_MOD 626>;
> >>> +                     power-domains = <&sysc R8A77961_PD_A3VC>;
> >>> +                     resets = <&cpg 626>;
> >>> +
> >>> +                     renesas,fcp = <&fcpvb0>;
> >>> +             };

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
