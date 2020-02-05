Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F181538E5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 20:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0626E9DE;
	Wed,  5 Feb 2020 19:19:49 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E756E9DE
 for <dri-devel@freedesktop.org>; Wed,  5 Feb 2020 19:19:47 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id k188so2104731vsc.8
 for <dri-devel@freedesktop.org>; Wed, 05 Feb 2020 11:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mevmQ6k3Ihmv8r7EI3IwBN79KI6v2gp2UE5ATwyofr0=;
 b=BuyExxOHNOnGw0g31bLqy0gVGWAXxG3djserMGkbzccG82zvt+a2/8Sqzj9jTg+Asa
 2upuVHfTuyxd4DU4e3VS+64pnwjwhNe/J8UtYPtwP/hwbQ2Of2yNZIjQyTe42b6laPAb
 Oa7DZNT5TuIoIpdt1rU89W3v4zmQUoQWR0r1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mevmQ6k3Ihmv8r7EI3IwBN79KI6v2gp2UE5ATwyofr0=;
 b=FI8PDMfxcSFrKN1hkQu1EnGIVrEJzQDzZxrStJMT/FZjpfqI22JGKrMGYvLsCDQywO
 /R5np3DAwXtt7V7QSYNmS8kKHBpwyncinRHblf8FiOa3mSp1tAEiK5WJaD46eNO3aXgz
 FluewVRCEyupVzT9vOCPl3Yos19k4KCrt37oECsD5kk47vZDRZMF3PQFPzZIdxJnp4mD
 FelUNOey3h7KkCxir5fqbxdYmLcPWUATISCU6vvBvEEScGqsXzdkhhWTvg+7I3beFx6U
 0xGoyfWkj4XWoQKzewin2f5kQCQ6sLnb1HrMHpdXyyOWr+PZe7AsT0yyg0rfGsocYGQH
 v8gA==
X-Gm-Message-State: APjAAAX8h413K/NqXyUCT+9SjaTqhkNAOEEbiN6tHnbcXOTPXIpXNBBp
 pMu9J88Mg1lo+ROl1jTvki6Vfk+zpAI=
X-Google-Smtp-Source: APXvYqyE95mYgxcgXmxqDIaSOqLX9Jky9gg1q8geAsJs10r56CQp5K3WYZIiB2g0FJCAToq1uiB/Jw==
X-Received: by 2002:a05:6102:757:: with SMTP id
 v23mr23645194vsg.35.1580930386157; 
 Wed, 05 Feb 2020 11:19:46 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id p7sm258104vsd.32.2020.02.05.11.19.44
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 11:19:45 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id h32so1297895uah.4
 for <dri-devel@freedesktop.org>; Wed, 05 Feb 2020 11:19:44 -0800 (PST)
X-Received: by 2002:a9f:300a:: with SMTP id h10mr14335806uab.91.1580930384495; 
 Wed, 05 Feb 2020 11:19:44 -0800 (PST)
MIME-Version: 1.0
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org>
 <1580886097-6312-4-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580886097-6312-4-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 5 Feb 2020 11:19:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UEQ0mOXuDrSZrcJ8g6jb0eLf1Ttn+Mn7T6d2TpCMUcuA@mail.gmail.com>
Message-ID: <CAD=FV=UEQ0mOXuDrSZrcJ8g6jb0eLf1Ttn+Mn7T6d2TpCMUcuA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
To: Sharat Masetty <smasetty@codeaurora.org>
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
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Feb 4, 2020 at 11:02 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch adds the required dt nodes and properties
> to enabled A618 GPU.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 102 +++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index f3fcc5c..63fff15 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1043,6 +1043,108 @@
>                         };
>                 };
>
> +               gpu: gpu@5000000 {
> +                       compatible = "qcom,adreno-618.0", "qcom,adreno";
> +                       #stream-id-cells = <16>;
> +                       reg = <0 0x05000000 0 0x40000>, <0 0x0509e000 0 0x1000>,
> +                               <0 0x05061000 0 0x800>;
> +                       reg-names = "kgsl_3d0_reg_memory", "cx_mem", "cx_dbgc";
> +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +                       iommus = <&adreno_smmu 0>;
> +                       operating-points-v2 = <&gpu_opp_table>;
> +                       qcom,gmu = <&gmu>;
> +
> +                       gpu_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-800000000 {
> +                                       opp-hz = /bits/ 64 <800000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
> +                               };
> +
> +                               opp-650000000 {
> +                                       opp-hz = /bits/ 64 <650000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
> +                               };
> +
> +                               opp-565000000 {
> +                                       opp-hz = /bits/ 64 <565000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
> +                               };
> +
> +                               opp-430000000 {
> +                                       opp-hz = /bits/ 64 <430000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
> +                               };
> +
> +                               opp-355000000 {
> +                                       opp-hz = /bits/ 64 <355000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +                               };
> +
> +                               opp-267000000 {
> +                                       opp-hz = /bits/ 64 <267000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> +                               };
> +
> +                               opp-180000000 {
> +                                       opp-hz = /bits/ 64 <180000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +                               };
> +                       };
> +               };
> +
> +               adreno_smmu: iommu@5040000 {
> +                       compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";

As per prior discussion "qcom,sc7180-smmu-v2" needs to be added to the bindings.


> +                       reg = <0 0x05040000 0 0x10000>;
> +                       #iommu-cells = <1>;
> +                       #global-interrupts = <2>;
> +                       interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 364 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 365 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 366 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 367 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 368 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 369 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 370 IRQ_TYPE_EDGE_RISING>,
> +                                       <GIC_SPI 371 IRQ_TYPE_EDGE_RISING>;
> +                       clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
> +                               <&gcc GCC_GPU_CFG_AHB_CLK>,
> +                               <&gcc GCC_DDRSS_GPU_AXI_CLK>;
> +
> +                       clock-names = "bus", "iface", "mem_iface_clk";

As per discussion in v3 [1], "mem_iface_clk" is new and needs to be
added to the bindings. Presumably that patch should be posted / Acked
by Rob before we land this dts.

Other than relying on un-posted bindings, this looks sane to me and
this patch lets me bring the GPU up on my sc7180-based board.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>


-Doug

[1] https://lore.kernel.org/r/1e29097cc1cdf18671379f6420f872b0@codeaurora.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
