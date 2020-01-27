Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B7D14AC04
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 23:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A566EC00;
	Mon, 27 Jan 2020 22:30:08 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2646EC03
 for <dri-devel@freedesktop.org>; Mon, 27 Jan 2020 22:30:07 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id u17so4102079uap.9
 for <dri-devel@freedesktop.org>; Mon, 27 Jan 2020 14:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OkNUIHe+JYKTBEW9K2q9Taed66d4fQFMxRvOrRh8Cd0=;
 b=NUqqrs7HXhFSJFsiNrXJm0ONYmionCm3iYaOyFIe4L6NBxV8KGLwKqmdNsdd1bizOG
 oXerz+XKVLKfxf0zbLskquZlA3QPICBEPW1gib9XIsd2nFErH3ZKV4v19aqguZuFqxH7
 8IHt1s2WYt5gtQA/uZLlFZcgGA+g8HyMRwbfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OkNUIHe+JYKTBEW9K2q9Taed66d4fQFMxRvOrRh8Cd0=;
 b=tbVB2laUCWaDZEpdHP7fHzcFq7BjgdFfbVNE0OZlkd8wphj3N2gF2fixn5ZbKL3e+B
 7BOV8N42MJn1FVkimR0egEXnH2xUhW0YLnwfTRWeKLA/flxm+T9yCPi/XwJZgEFR1YKf
 ammAUeig12ZHD9uM8oOvr8ZCIeIzlFKKpk0kroiZ3VPqFMBxLnlUBt4u27qvIcpPXaeW
 p3BR/VHiwosuH5/BQbyrdUis1knLLa5foa6xvcO8/T9tppCYebZZjLfnQtzkNUwDTf1r
 OPqe1FxnlQ013StUBi1xRZiGvLp5J+3m7AJ5HcytLQbLaiPqiEt+aqtaTfqRXIaPzQCI
 h/OQ==
X-Gm-Message-State: APjAAAVcmU+/eVvoRzdOtbdT6iyVSMo2OGlZGCoZpaGygG+RUGsCwY/M
 U6AxGS1fqAdPBw0XwvVlQXdZzxJ/qk4=
X-Google-Smtp-Source: APXvYqxWD6kVvUlONRKmTo4jp98qLnp/KddO4nzSsxPCF8OO14fAz9di/sJqXqr5TnbsglvobZ7N/g==
X-Received: by 2002:ab0:6341:: with SMTP id f1mr11895337uap.74.1580164205976; 
 Mon, 27 Jan 2020 14:30:05 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com.
 [209.85.217.43])
 by smtp.gmail.com with ESMTPSA id w4sm4011724vsq.18.2020.01.27.14.30.04
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 14:30:05 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id g15so6839143vsf.1
 for <dri-devel@freedesktop.org>; Mon, 27 Jan 2020 14:30:04 -0800 (PST)
X-Received: by 2002:a67:1ec5:: with SMTP id e188mr5904944vse.169.1580164204376; 
 Mon, 27 Jan 2020 14:30:04 -0800 (PST)
MIME-Version: 1.0
References: <1580117390-6057-1-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580117390-6057-1-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Jan 2020 14:29:53 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VFVC6XJ=OXJCSd2_oij5vggKnTedGP0Gj4KHC50QH0SQ@mail.gmail.com>
Message-ID: <CAD=FV=VFVC6XJ=OXJCSd2_oij5vggKnTedGP0Gj4KHC50QH0SQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
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

On Mon, Jan 27, 2020 at 1:30 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch adds the required dt nodes and properties
> to enabled A618 GPU.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 103 +++++++++++++++++++++++++++++++++++
>  1 file changed, 103 insertions(+)

Note that +Matthias Kaehlcke commented on v1 your patch:

https://lore.kernel.org/r/20191204220033.GH228856@google.com/

...so he should have been CCed on v2.  I would also note that some of
the comments below are echos of what Matthias already said in the
previous version but just weren't addressed.


> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index b859431..277d84d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -7,6 +7,7 @@
>
>  #include <dt-bindings/clock/qcom,gcc-sc7180.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,gpucc-sc7180.h>

Header files should be sorted alphabetically.  ...or, even better,
base your patch atop mine:

https://lore.kernel.org/r/20200124144154.v2.10.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid/

...which adds the gpucc header file so you don't have to.  ...and when
you do so, email out a Reviewed-by and/or Tested-by for my patch.  ;-)


>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interconnect/qcom,sc7180.h>
>  #include <dt-bindings/phy/phy-qcom-qusb2.h>
> @@ -1619,6 +1620,108 @@
>                         #interconnect-cells = <1>;
>                         qcom,bcm-voters = <&apps_bcm_voter>;
>                 };
> +
> +               gpu: gpu@5000000 {
> +                       compatible = "qcom,adreno-618.0", "qcom,adreno";

Though it's not controversial, please send a patch to:

Documentation/devicetree/bindings/display/msm/gmu.txt

...to add 'qcom,adreno-618.0', like:

    for example:
      "qcom,adreno-gmu-618.0", "qcom,adreno-gmu"
      "qcom,adreno-gmu-630.2", "qcom,adreno-gmu"

Probably as part of this you will be asked to convert this file to
yaml.  IMO we don't need to block landing this patch on the effort to
convert it to yaml, but you should still work on it.  ...or maybe
Jordan wants to work on it?


> +                       #stream-id-cells = <16>;
> +                       reg = <0 0x05000000 0 0x40000>, <0 0x0509e000 0 0x1000>,
> +                               <0 0x05061000 0 0x800>;
> +                       reg-names = "kgsl_3d0_reg_memory", "cx_mem", "cx_dbgc";
> +                       interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
> +                       iommus = <&adreno_smmu 0>;
> +                       operating-points-v2 = <&gpu_opp_table>;
> +                       interconnects = <&gem_noc MASTER_GFX3D &mc_virt SLAVE_EBI1>;

Running:
$ git fetch git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
for-next
$ git grep gem_noc FETCH_HEAD
$ git fetch git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
arm64-for-5.7-to-be-rebased
$ git grep gem_noc FETCH_HEAD

...shows no hits.  That's because the interconnect patches haven't
landed in the tree that you're targeting.  In the very least you
should mention somewhere in your email that your patch depends on the
interconnect patches landing, perhaps pointing at:

https://lore.kernel.org/r/1577782737-32068-4-git-send-email-okukatla@codeaurora.org

...but even better would be to split your patch into two parts.  The
first patch would be exactly like your patch except without the
"interconnects" line.  The 2nd patch would add the interconnects line.
This would allow Bjorn/Andy to land the first patch now and then land
the second patch when the interconnect series is ready.  I can confirm
that you can still get basic GPU functionality even without the
interconnects bit so it would be worth landing earlier.


I will also note that by basing on a tree that has private patches to
the same file you're touching you make it very hard for a maintainer
to apply.  When I try this:

$ curl https://patchwork.kernel.org/patch/11352261/mbox/ | git am -3

I get:

error: sha1 information is lacking or useless
(arch/arm64/boot/dts/qcom/sc7180.dtsi).
error: could not build fake ancestor
Patch failed at 0001 arm64: dts: qcom: sc7180: Add A618 gpu dt blob

...yes, I can apply it with 'git am --show-current-patch | patch -p1'
but it's ugly (and it ends up making things sort in the wrong order).


> +               adreno_smmu: iommu@5040000 {
> +                       compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";

Please send a patch to:

Documentation/devicetree/bindings/iommu/arm,smmu.yaml

...adding 'qcom,sc7180-smmu-v2'.  If you do this it will point out
that you've added a new clock: "mem_iface_clk".  Is this truly a new
clock in sc7180 compared to previous IOMMUs?  ...or is it not really
needed?


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

nit: keep clocks and clock-names next to each other (no blank line).
If you really feel like it needs more space add it between the
clock-names and power-domains.

> +                       power-domains = <&gpucc CX_GDSC>;

Similar to interconnects, gpucc hasn't landed yet.  Somewhere you
should point out this fact and ideally point to:

https://lore.kernel.org/r/20200124144154.v2.10.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid/

...unlike interconnects, your patch can't land without gpucc, so you
should point this out as a hard dependency.


> +               };
> +
> +               gmu: gmu@506a000 {
> +                       compatible="qcom,adreno-gmu-618", "qcom,adreno-gmu";

As per the bindings, "qcom,adreno-gmu-618" should be
"qcom,adreno-gmu-618.0", right?

...and I bet you'd never have guessed that I'll request that you add
"qcom,adreno-gmu-618" to:

Documentation/devicetree/bindings/display/msm/gmu.txt

...and that you'll probably be asked to convert to yaml.  Again, maybe
Jordan wants to attempt this?


> +                       reg = <0 0x0506a000 0 0x31000>, <0 0x0b290000 0 0x10000>,
> +                               <0 0x0b490000 0 0x10000>;
> +                       reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
> +                       interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +                                  <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "hfi", "gmu";
> +                       clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> +                              <&gpucc GPU_CC_CXO_CLK>,
> +                              <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> +                              <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
> +                       clock-names = "gmu", "cxo", "axi", "memnoc";
> +                       power-domains = <&gpucc CX_GDSC>;

Bindings claim that you need both CX and GC.  Is sc7180 somehow
different?  Bindings also claim that you should be providing
power-domain-names.



> +                       iommus = <&adreno_smmu 5>;
> +                       operating-points-v2 = <&gmu_opp_table>;
> +
> +                       gmu_opp_table: opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-200000000 {
> +                                       opp-hz = /bits/ 64 <200000000>;
> +                                       opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
> +                               };
> +                       };
> +               };
>         };
>
>         thermal-zones {

Using the "thermal-zones" as context, it looks as if you're asserting
that your new nodes belong at the very end of the pile of nodes with
addresses.  This is not true.  Looking at the branch
'arm64-for-5.7-to-be-rebased' on the Qualcomm tree, I see:

cpufreq_hw: cpufreq@18323000

...which has a larger address than your 0x0506a000.  Please sort your
nodes numerically.


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
