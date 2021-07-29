Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349583DA9F4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 19:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E417B6EE13;
	Thu, 29 Jul 2021 17:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 155206EE14
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 17:19:34 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 x15-20020a05683000cfb02904d1f8b9db81so6575493oto.12
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=JcuPL2E0yGh3YMQ5Ryjgd8htxcjiWk/JLPxwWfyTTEI=;
 b=KLCY003udwzbwW5s6LyNduchb1uN48eo8fIMzMQLlYES2R18futSNL9RxxsZHwnYbd
 /b5ktnC/xdeo/sJ5ZpltOyfNxiFZiBjHJlGRUh7CFaOpRJGZeE42o5mq2Ex2oELSBlCN
 IGYOONXVZ2/HJiKfQ9cKd2unJKWBj40fZ1+3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=JcuPL2E0yGh3YMQ5Ryjgd8htxcjiWk/JLPxwWfyTTEI=;
 b=XY+o4Zr6xr8IrwhvavVK2+a3piQoU2ABEMqORY0IubJMLCw+KMN+6IdpfsFYNQPXxE
 exrWoePsDGjh//dX+/+Pe7zrRU8+HVHStkfXVmIBFDuW/rxjqPODiRIIpWQopL0LsaNW
 JLiDlZI9ckjkEsugi5yn2N8b9weTHz0FwUNeL7ZC8Ldd+ZyZ09tC9JbGiPyUwvHhiCEG
 2vb+CNpzwkw1rAeUwPxKSo5IfHK4QEMIZ2xmFp1uItqvUrKkRKmB5SCHeEGDPkAEtMOr
 3lNKWHznDr8PeWrzmghkgpu4a9IuBo9ikDPeMeaBuD/hFVdwchyhG/A9fFhdVxc1NNkq
 aaoA==
X-Gm-Message-State: AOAM533YYUGC+QpATsGdfd9SHCQs9va5DeEKET4UjWSsGFh9twM1+5Yq
 wflipqFI1b3fafaVFletuUCXnAZ0N3q3KNN5Lr8ilw==
X-Google-Smtp-Source: ABdhPJxm3TNkTt83zHPFaTJ+JLOdxmNPIABd6fWr/eYibpJ0bq8EyQFF2n6jRlWgUra5oNFfYz42SdCYS/JjQAGbOPI=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr4267279otl.233.1627579173391; 
 Thu, 29 Jul 2021 10:19:33 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Jul 2021 12:19:33 -0500
MIME-Version: 1.0
In-Reply-To: <1627473242-35926-1-git-send-email-akhilpo@codeaurora.org>
References: <1627473242-35926-1-git-send-email-akhilpo@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 29 Jul 2021 12:19:32 -0500
Message-ID: <CAE-0n53xMHudWaL7gdnN7jEPE1uLmetZaxYiqToO1AzTZ2R0Mw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sc7280: Add gpu support
To: Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Manaf Meethalavalappu Pallikunhi <manafm@codeaurora.org>, 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm@vger.kernel.org
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Andy Gross <agross@kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Akhil P Oommen (2021-07-28 04:54:01)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 029723a..c88f366 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -592,6 +593,85 @@
>                         qcom,bcm-voters = <&apps_bcm_voter>;
>                 };
>
> +               gpu@3d00000 {
> +                       compatible = "qcom,adreno-635.0", "qcom,adreno";
> +                       #stream-id-cells = <16>;
> +                       reg = <0 0x03d00000 0 0x40000>,
> +                             <0 0x03d9e000 0 0x1000>,
> +                             <0 0x03d61000 0 0x800>;
> +                       reg-names = "kgsl_3d0_reg_memory",
> +                                   "cx_mem",
> +                                   "cx_dbgc";
> +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +                       iommus = <&adreno_smmu 0 0x401>;
> +                       operating-points-v2 = <&gpu_opp_table>;
> +                       qcom,gmu = <&gmu>;
> +                       interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> +                       interconnect-names = "gfx-mem";
> +
> +                       gpu_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-550000000 {
> +                                       opp-hz = /bits/ 64 <550000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +                                       opp-peak-kBps = <6832000>;
> +                               };
> +
> +                               opp-450000000 {

Why is 450000000 after 550000000? Is it on purpose? If not intended
please sort by frequency.

> +                                       opp-hz = /bits/ 64 <450000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +                                       opp-peak-kBps = <4068000>;
> +                               };
> +
> +                               opp-315000000 {
> +                                       opp-hz = /bits/ 64 <315000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +                                       opp-peak-kBps = <1804000>;
> +                               };
> +                       };
> +               };
> +
