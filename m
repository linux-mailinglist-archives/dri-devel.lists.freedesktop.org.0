Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032CB667138
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 12:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12DB10E1A0;
	Thu, 12 Jan 2023 11:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ED5910E1A0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 11:49:10 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id u3so4436600uae.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 03:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Nc90MP0lO5NabKtarT67wAhel1LbFD1g72FNi8Kcmco=;
 b=Yl4EI4pWEgqt9ywJRpKAJkTPHZ/G6JZI899Id1waManNh6rr1948RRx9EqT9tgD5H5
 0Fh1H+AMG/3VsmPENHCYilSRmFW9feZyBn9DyRxWOJekUc37VM1yMiKwAkJgmtkmC9vv
 SFwU4AGjhBQ/CuWHa32sVYMCkfQ6ktX28hCF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nc90MP0lO5NabKtarT67wAhel1LbFD1g72FNi8Kcmco=;
 b=gHOTUsFyPWaYEytIetVEw5DVwo0otei5ySrU2L6RWf0QhQh3VB8w9xWl9r6FXG2dH+
 kJGoAnotatgkCPpDa69ZJn0ki4jS3I/nu9OCiY+xcD2NJAYCzwpJxy4XXkobsDxtxT/y
 Li9VQeO4JpBkVuUmN+nUvc9JWVFT8gubnCGXmO9f1mK6O//GocIHQnvFsyyBO37Ls9q4
 cZpmnoQg03MB/Gwo66+FHcQH0kJL8qmWurVbBo9eyH7e/MFFeA26hfRU85TbhAeU8lWv
 zNjaq5QpHGduhfjqTjL9SrYtRSSBUshvq6+4PKL2Ix+7213DdzUKwjU844GobhzuTOqt
 Lq5w==
X-Gm-Message-State: AFqh2kqJeMBLN8QbgEVZbyTHg0sVovTH1HW+HooX8efJV+AG7AbPPPAn
 3TjUL31vZ0IkZn5K+9BbhlHzEIaYB4pU2hMeJODzRQ==
X-Google-Smtp-Source: AMrXdXuItCuiLhRlSwBuSQxSx2uJ8oOcDFtg4BL5xBWj9NfAfa5/6Fit2CP85TF5iq9Cpoxi5wxTi1BTvSSFUBclgq0=
X-Received: by 2002:ab0:738b:0:b0:469:f0ea:c1f7 with SMTP id
 l11-20020ab0738b000000b00469f0eac1f7mr7626458uap.0.1673524149333; Thu, 12 Jan
 2023 03:49:09 -0800 (PST)
MIME-Version: 1.0
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
 <20230111123711.32020-8-allen-kh.cheng@mediatek.com>
In-Reply-To: <20230111123711.32020-8-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 12 Jan 2023 19:48:58 +0800
Message-ID: <CAGXv+5EDW9jZxWZW-9nYeK+2UnMR6UE28wASNFZ8MfdDhVKhxg@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: mediatek: mt8186: Add DPI node
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

On Wed, Jan 11, 2023 at 8:37 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> Add DPI node for MT8186 SoC.
>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index c52f9be1e750..eab30ab01572 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -1230,6 +1230,23 @@
>                         power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
>                 };
>
> +               dpi0: dpi@1400a000 {

You could drop the trailing 0 in the label, since there is only one
instance.

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

> +                       compatible = "mediatek,mt8186-dpi";
> +                       reg = <0 0x1400a000 0 0x1000>;
> +                       clocks = <&topckgen CLK_TOP_DPI>,
> +                                <&mmsys CLK_MM_DISP_DPI>,
> +                                <&apmixedsys CLK_APMIXED_TVDPLL>;
> +                       clock-names = "pixel", "engine", "pll";
> +                       assigned-clocks = <&topckgen CLK_TOP_DPI>;
> +                       assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;
> +                       interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_LOW 0>;
> +                       status = "disabled";
> +
> +                       port {
> +                               dpi_out: endpoint { };
> +                       };
> +               };
> +
>                 dsi0: dsi@14013000 {
>                         compatible = "mediatek,mt8186-dsi";
>                         reg = <0 0x14013000 0 0x1000>;
> --
> 2.18.0
>
