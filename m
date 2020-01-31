Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FD814F3EB
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 22:43:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058FE6FBFE;
	Fri, 31 Jan 2020 21:43:21 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7556FBFC
 for <dri-devel@freedesktop.org>; Fri, 31 Jan 2020 21:43:20 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id b79so5307861vsd.9
 for <dri-devel@freedesktop.org>; Fri, 31 Jan 2020 13:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=77iC328Ix55f8VFyzEfO2GMt08mqvFscC4bjbzzCOZU=;
 b=EAnJcYHOR3ksx1xu/pw65w6JGYMh2xej0Mc4zDb3jtP78rR15ykv/sZtF0FkjJbSak
 b37qkQE2D14Y3z8vOROlg2MYyd005jIT3q29AlSTbjIBx/pCRxYehOaJ/wQjimcgSSxe
 6M65uD4rgYGAFuPGbXKpa7AjCV3oL5q6ZOezM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=77iC328Ix55f8VFyzEfO2GMt08mqvFscC4bjbzzCOZU=;
 b=o5MROTPHUFW/OoOlm23cRXw15PnVJMt/TFKPdOp0TE4Cm01ESM3jUvN1a1lq0hTYBA
 qQ+TTdvNLH3J85W4xO6jC+v48q1uq58mfzvlgTRzuuGV9XAiFmazoxoxawxgGqpnNzzJ
 9GRVo0bJPYhajc9zfEGnhlA7eEYno2IrkUR8ilWNCc7vJmwvbuxVzpHAywTSk6U0k6YC
 hhShcRxrbezCsNehbP45RpGId8AsMBsr73Na59jkA2CKXrp1MEev+SnOaIS8WrOwdSIh
 2uibZ+l7y7H7O1fQNeP9yFSiOpRSbycWdFg1GrWPRrc8Y15+A1XTiBFx+KTa54kVTlhd
 GI5Q==
X-Gm-Message-State: APjAAAXloEMfMKciKP93KE1KaYIH9VLtH4yTOoPuNrEJbEqiLsyZAG6L
 50es8Q63IA7wSwuPjQDuLQwl5mAcIpk=
X-Google-Smtp-Source: APXvYqwciUQcmveRmkgih97qKeHIyKqY7tkDBMjVRikZRM2vJOSoqcB1p7ZLvmT1rULcXsTVr6sUig==
X-Received: by 2002:a05:6102:31a3:: with SMTP id
 d3mr8253063vsh.60.1580506998859; 
 Fri, 31 Jan 2020 13:43:18 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id p18sm2990134vke.23.2020.01.31.13.43.17
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2020 13:43:18 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id 59so3119732uap.12
 for <dri-devel@freedesktop.org>; Fri, 31 Jan 2020 13:43:17 -0800 (PST)
X-Received: by 2002:ab0:724c:: with SMTP id d12mr7797680uap.0.1580506997224;
 Fri, 31 Jan 2020 13:43:17 -0800 (PST)
MIME-Version: 1.0
References: <1580472220-3453-1-git-send-email-smasetty@codeaurora.org>
 <1580472220-3453-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580472220-3453-2-git-send-email-smasetty@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 Jan 2020 13:43:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XJF4KworkHFLoNtxB7d+VyGqZSZkDUdie+09ur1g5thw@mail.gmail.com>
Message-ID: <CAD=FV=XJF4KworkHFLoNtxB7d+VyGqZSZkDUdie+09ur1g5thw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
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

On Fri, Jan 31, 2020 at 4:04 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> +               adreno_smmu: iommu@5040000 {
> +                       compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";
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

Repeated comment from v2 feedback:

Please send a patch to:

Documentation/devicetree/bindings/iommu/arm,smmu.yaml

...adding 'qcom,sc7180-smmu-v2'.  If you do this it will point out
that you've added a new clock: "mem_iface_clk".  Is this truly a new
clock in sc7180 compared to previous IOMMUs?  ...or is it not really
needed?


> +               gmu: gmu@506a000 {
> +                       compatible="qcom,adreno-gmu-618.0", "qcom,adreno-gmu";
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
> +                       power-domain-names = "cx";

As per continued comments on v2, please see if this works for you:

  power-domains = <&gpucc CX_GDSC>, <0>;
  power-domain-names = "cx", "gx";

...and work to get something more real for "gx" ASAP.  It did seem to
boot for me and (unless someone disagrees) it seems better than
totally leaving it out / violating the bindings?


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
