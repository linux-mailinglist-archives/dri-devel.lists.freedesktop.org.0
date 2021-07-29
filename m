Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D8D3DAA39
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 19:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7031F6EDFF;
	Thu, 29 Jul 2021 17:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A992B6EE1E;
 Thu, 29 Jul 2021 17:31:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id b7so7880231wri.8;
 Thu, 29 Jul 2021 10:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pnVzhT/kHdPgZUP65cfJqBoONaapfo5r8e0MrAlb984=;
 b=jaC3QwjjviykfCntbsWoFJDNF21xu8yghmN2KvvaAwVUR4mtfATAQuHMPuqadbtwUo
 enKV2slTVRgfCP9UgZzJYDTlQzdrKjzXg40LcjUTktctC59CEkWGBuKgJOqn3kcVELDN
 Gqxm5cr4MEyeN4XO3INSQNXopzzpjPCRuzeAqoaougPd45yqEiG0QSflJ4YmoIPr+AG2
 C19SzpImiBO3ayVtb+QZgtJZkr/k/yLA40n2jxJGvVR/esMJm87HNs/Zm41DwU8GfwaN
 egcbUqeuxrXgU6aRr8UnTTrN6e03v1GHu4m4OBgMNOkR0Q8S9CR9s+XfGM23/WP7MRAM
 7eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pnVzhT/kHdPgZUP65cfJqBoONaapfo5r8e0MrAlb984=;
 b=bmZBEKbEMqOHIE3BWrDu1iZwfak5rMMCXZ97oJ+VoXoJeT6XpL7sOT93CjSPfBJXpP
 jyKT4vg1Wgks5+PzBUkE6zKbR8eMc0iBAjg5EW44F7jLPDq4zzr/U+LSNVHaQclBzaYW
 gjdLacpWPmJB6EJnYewybNxdg17jr6LP7w/z/tDY9Sd6whSdiL99ao7/iyLrwW5zwmob
 rmtS4w8yFcatAlEJL96oB+x34tF4S5Wvre3+yIshMM5QmLLLBGuxxiEGGeMisVOjqQHW
 YpJeapzbkqRvgMIdGM+UiinzMeF+45zbPbghhE/Auw+64btBXEtdrl5NUksqH2eYvWbc
 Bn7A==
X-Gm-Message-State: AOAM532XLa448Wq/Y64mKSjAhVT9GqllgUGyT54hoetH6R3aL6wyGXjr
 X1YScl492oKClfu3pgnPJLzyqnDylosLSeHEjaM=
X-Google-Smtp-Source: ABdhPJzB3zZoxPwWPnZQvco4cbgtwKh7tKLWjYB2qIguBecvjgdSw2VQJQ94SIm5agk39ycqx5XjveJvKou3TG92Cro=
X-Received: by 2002:a5d:4348:: with SMTP id u8mr6400529wrr.28.1627579884127;
 Thu, 29 Jul 2021 10:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <1627473242-35926-1-git-send-email-akhilpo@codeaurora.org>
 <CAE-0n53xMHudWaL7gdnN7jEPE1uLmetZaxYiqToO1AzTZ2R0Mw@mail.gmail.com>
In-Reply-To: <CAE-0n53xMHudWaL7gdnN7jEPE1uLmetZaxYiqToO1AzTZ2R0Mw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 29 Jul 2021 10:35:32 -0700
Message-ID: <CAF6AEGv9G99YqEixdUZCLxEgXX1+EqcjgQP-v5CCuj64sv_bTA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sc7280: Add gpu support
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>,
 freedreno <freedreno@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 10:19 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Akhil P Oommen (2021-07-28 04:54:01)
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > index 029723a..c88f366 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > @@ -592,6 +593,85 @@
> >                         qcom,bcm-voters = <&apps_bcm_voter>;
> >                 };
> >
> > +               gpu@3d00000 {
> > +                       compatible = "qcom,adreno-635.0", "qcom,adreno";
> > +                       #stream-id-cells = <16>;
> > +                       reg = <0 0x03d00000 0 0x40000>,
> > +                             <0 0x03d9e000 0 0x1000>,
> > +                             <0 0x03d61000 0 0x800>;
> > +                       reg-names = "kgsl_3d0_reg_memory",
> > +                                   "cx_mem",
> > +                                   "cx_dbgc";
> > +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> > +                       iommus = <&adreno_smmu 0 0x401>;
> > +                       operating-points-v2 = <&gpu_opp_table>;
> > +                       qcom,gmu = <&gmu>;
> > +                       interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> > +                       interconnect-names = "gfx-mem";
> > +
> > +                       gpu_opp_table: opp-table {
> > +                               compatible = "operating-points-v2";
> > +
> > +                               opp-550000000 {
> > +                                       opp-hz = /bits/ 64 <550000000>;
> > +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> > +                                       opp-peak-kBps = <6832000>;
> > +                               };
> > +
> > +                               opp-450000000 {
>
> Why is 450000000 after 550000000? Is it on purpose? If not intended
> please sort by frequency.

We've used descending order, at least for gpu opp table, on other
gens, fwiw.. not sure if that just means we were doing it wrong
previously

BR,
-R

>
> > +                                       opp-hz = /bits/ 64 <450000000>;
> > +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> > +                                       opp-peak-kBps = <4068000>;
> > +                               };
> > +
> > +                               opp-315000000 {
> > +                                       opp-hz = /bits/ 64 <315000000>;
> > +                                       opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> > +                                       opp-peak-kBps = <1804000>;
> > +                               };
> > +                       };
> > +               };
> > +
