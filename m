Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230FE666EDF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 11:01:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6868810E8BC;
	Thu, 12 Jan 2023 10:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FE410E569
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 10:00:53 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id l129so7650007vkh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 02:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4i06mppGYiXhN0gX/mC8nb9SL6Y8d9Zg4Osy3GV9SYg=;
 b=dJJzcYTvtPtZKZ4Oo6YyvU+v7YG1bh5MFh5fAmIWm8cSjzoLbPKfvnvSgb40a1ncK1
 3SK1jAOygeZJ+JoEVrIXG1GZg0QjdenjPGpBmGmC74dJNfyvpLkyKEktPDiWxxTXo3iW
 rcuznjSZTCQVEIaAMeNCGIOUz3heRijTYPsXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4i06mppGYiXhN0gX/mC8nb9SL6Y8d9Zg4Osy3GV9SYg=;
 b=y3hY1JIRpSpaCXxxpdfp809MRfkMJCVLuZPDrKq8BJs9Hh1PwyfEUnNLPksKhZtF6l
 lw7MwCSyLXTkbuTRl+6FqWJA5EOip8e/D7Y9LW5ibaULTjH2PhCwT4Ny9z6RrClWGJb7
 ymF2eaQUO2v4pmdaogmmGmkK8x5b25ej0kJkkRngPg07+RZA0HvKRbN0wkAxuE1b0q2I
 uKIjiLK2E+hSsLN/Zt7V+xnxdLKJbWvAdKAtEXS/QMGYY4l3e+Pl+jzCM1htgXAzv7QU
 TJz3H+1jVrjwLRB3EGjVJhpYI3hhgcxlVbtKZrYUmV4N6q3TgzEr2MIDibm8IH9PEkul
 kz0g==
X-Gm-Message-State: AFqh2kpPlJ8WnOyG7B38XX4MvWtMupmz0Er53PYOLTlQHqfWF5zanKu9
 P+Fepde5o+VxF5BW7cRGAD3DLOhDBlqo6M02TZ5s2g==
X-Google-Smtp-Source: AMrXdXuwd6kfa03Fjf9jlTXF89gVtVV+1AhRmAg6v5vIaOgGq1AZS2BQHeGXdFJEDzUutm8EX+I3gEp529jY5uCS4Gs=
X-Received: by 2002:a1f:2795:0:b0:3d8:df4c:cfc4 with SMTP id
 n143-20020a1f2795000000b003d8df4ccfc4mr3797463vkn.18.1673517652955; Thu, 12
 Jan 2023 02:00:52 -0800 (PST)
MIME-Version: 1.0
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
 <20230111123711.32020-10-allen-kh.cheng@mediatek.com>
In-Reply-To: <20230111123711.32020-10-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 12 Jan 2023 18:00:41 +0800
Message-ID: <CAGXv+5HbTzyWqvn=iJDnWdWS-MM+wyc0w7F-vPXJN489eGYotQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: dts: mediatek: mt8186: Add display nodes
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Jan 11, 2023 at 8:37 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> Add display nodes and GCE info for MT8186 SoC. Also, add GCE
> (Global Command Engine) properties to the display nodes in order to
> enable the usage of the CMDQ (Command Queue), which is required for
> operating the display.
>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi | 128 +++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index eab30ab01572..8670d37970ef 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -5,6 +5,7 @@
>   */
>  /dts-v1/;
>  #include <dt-bindings/clock/mt8186-clk.h>
> +#include <dt-bindings/gce/mt8186-gce.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/memory/mt8186-memory-port.h>
> @@ -632,6 +633,15 @@
>                         clocks = <&clk13m>;
>                 };
>
> +               gce: mailbox@1022c000 {
> +                       compatible = "mediatek,mt8186-gce";
> +                       reg = <0 0X1022c000 0 0x4000>;
> +                       interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       #mbox-cells = <2>;
> +                       clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
> +                       clock-names = "gce";
> +               };
> +
>                 scp: scp@10500000 {
>                         compatible = "mediatek,mt8186-scp";
>                         reg = <0 0x10500000 0 0x40000>,
> @@ -1197,6 +1207,20 @@
>                         reg = <0 0x14000000 0 0x1000>;
>                         #clock-cells = <1>;
>                         #reset-cells = <1>;
> +                       mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> +                                <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
> +               };
> +
> +               mutex: mutex@14001000 {
> +                       compatible = "mediatek,mt8186-disp-mutex";
> +                       reg = <0 0x14001000 0 0x1000>;
> +                       clocks = <&mmsys CLK_MM_DISP_MUTEX0>;
> +                       interrupts = <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
> +                       mediatek,gce-events = <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_0>,
> +                                             <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_1>;
> +                       power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
>                 };
>
>                 smi_common: smi@14002000 {
> @@ -1230,6 +1254,49 @@
>                         power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
>                 };
>
> +               ovl0: ovl@14005000 {

If there's only one instance, you could drop the trailing zero. Same
for all the other nodes.

> +                       compatible = "mediatek,mt8186-disp-ovl",
> +                                    "mediatek,mt8192-disp-ovl";
> +                       reg = <0 0x14005000 0 0x1000>;
> +                       clocks = <&mmsys CLK_MM_DISP_OVL0>;
> +                       interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       iommus = <&iommu_mm IOMMU_PORT_L0_OVL_RDMA0>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
> +                       power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
> +               };
> +
> +               ovl0_2l: ovl@14006000 {

I think this should be "ovl_2l0" or "ovl_2l" instead?

> +                       compatible = "mediatek,mt8186-disp-ovl-2l",
> +                                    "mediatek,mt8192-disp-ovl-2l";
> +                       reg = <0 0x14006000 0 0x1000>;
> +                       power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
> +                       clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> +                       interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       iommus = <&iommu_mm IOMMU_PORT_L1_OVL_2L_RDMA0>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
> +               };

Also, this patch is missing the aliases for ovl* and rdma*. Without them
the display driver doesn't properly detect the second pipeline, and only
one CRTC is generated.

ChenYu
