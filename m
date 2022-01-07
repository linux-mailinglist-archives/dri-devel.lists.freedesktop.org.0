Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 229F5487F15
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 23:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B528C10F333;
	Fri,  7 Jan 2022 22:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E2410F333
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 22:49:28 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id o6so27553544edc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jan 2022 14:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0jAJoVGwKCLDgKpaY3NT5v3Vqx+TvDpkuQx8Gs0x1gs=;
 b=DmtAvonseYsCB/mOaNcr+9nV05NBD10NPqvkp30dSg0RL2Ppk4MI0R1ncIbDvgrdOz
 pH06HbrpA9kNXZzu3OsyLUiKaHDljZYG9iUYT5ihOs/BFJ4iZ4uUXUoNlx5DkwWl5heW
 9YGXJTrJ9O8jzWtOUeULIdIJUlVkCuxqVn+ekKmvTRMsrj98IwG4PCLOAXfnnsHeNhB1
 FfI/Hu5ucpsOV/SSHBjlmtM8TipBKMeqYmUS+d3iiNve7HmWJhYrb8Gy/1pCyXtbqQeD
 +zxYcX/ZqWm6lcL9EPUtEgqCfq+aG2YjOebBRvJ+/jxjSQwlgM4Wp+5Ba/ECM1thr6tB
 ZfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0jAJoVGwKCLDgKpaY3NT5v3Vqx+TvDpkuQx8Gs0x1gs=;
 b=0HmxCA6GoAINgVYINk5FqKjKfPFYiRVBGS0C6MInzufRxGPPKhZD3S+YUfC0KDacx3
 95PatFMy28lVbpWY2hFITH1LM5mGEUzkEVuj0DC5nknR7HN4nH1u4zWcTUx8cRpEWtYC
 fUXZ7qnZvzRa7FLzIS+kmu/4ZAw7EmPHXGlJ/mUB9ZcJfDnKuesVrACOmPm+ePB9EMtD
 1vYHYtqO3JhKKYJ0EGmlo0kRfK/QHqmiyhb8JhBjoyrvFM5DtYIbkrbE7bRM58ksUY1s
 wfH9zvBoSQ6kJyEPTxChrxosxhAASByESn7dQouWy2oNnqsIFSJv+e0IkDdVTLF7NvYn
 ryHg==
X-Gm-Message-State: AOAM530YkNSovMbU4SFp/iVfUZgaCkypgJTGSesNhRhglmBUD5reEmsX
 JqYpfZAdnfX4uYYytfU9Ic/yol3zmZ3cDCt4EzI=
X-Google-Smtp-Source: ABdhPJwwX9ho759ZVzvF+W55tvIMEqaGGO7Vp4Mpcx74sZoQafx4zes9X+G/lG9j1CKl/613d0xbAiXn3pl1+kmoznY=
X-Received: by 2002:aa7:d5c7:: with SMTP id d7mr7934096eds.280.1641595766362; 
 Fri, 07 Jan 2022 14:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20220107145515.613009-1-narmstrong@baylibre.com>
 <20220107145515.613009-7-narmstrong@baylibre.com>
In-Reply-To: <20220107145515.613009-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jan 2022 23:49:15 +0100
Message-ID: <CAFBinCB3+dSjQFRp5CBpGk5Qi8zoxRDRaobuCtXzU6VtM8+ryQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

some high-level comments from me below.

On Fri, Jan 7, 2022 at 3:58 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +/*  MIPI DSI Relative REGISTERs Definitions */
> +/* For MIPI_DSI_TOP_CNTL */
> +#define BIT_DPI_COLOR_MODE        20
> +#define BIT_IN_COLOR_MODE         16
> +#define BIT_CHROMA_SUBSAMPLE      14
> +#define BIT_COMP2_SEL             12
> +#define BIT_COMP1_SEL             10
> +#define BIT_COMP0_SEL              8
> +#define BIT_DE_POL                 6
> +#define BIT_HSYNC_POL              5
> +#define BIT_VSYNC_POL              4
> +#define BIT_DPICOLORM              3
> +#define BIT_DPISHUTDN              2
> +#define BIT_EDPITE_INTR_PULSE      1
> +#define BIT_ERR_INTR_PULSE         0
Why not use BIT() and GENMASK() for these and prefixing them with
MIPI_DSI_TOP_CNTL_?
That would make them consistent with other parts of the meson sub-driver.

[...]
> +static void meson_dw_mipi_dsi_hw_init(struct meson_dw_mipi_dsi *mipi_dsi)
> +{
> +       writel_relaxed((1 << 4) | (1 << 5) | (0 << 6),
> +                      mipi_dsi->base + MIPI_DSI_TOP_CNTL);
please use the macros from above

> +       writel_bits_relaxed(0xf, 0xf, mipi_dsi->base + MIPI_DSI_TOP_SW_RESET);
> +       writel_bits_relaxed(0xf, 0, mipi_dsi->base + MIPI_DSI_TOP_SW_RESET);

[...]
> +       phy_power_on(mipi_dsi->phy);
Please propagate the error code here.
Also shouldn't this go to a new dw_mipi_dsi_phy_power_on() as the PHY
driver uses the updated settings from phy_configure only in it's
.power_on callback?

[...]
> +       phy_configure(mipi_dsi->phy, &mipi_dsi->phy_opts);
please propagate the error code here as the PHY driver has some
explicit code to return an error in it's .phy_configure callback

[...]
> +       phy_init(mipi_dsi->phy);
please propagate the error code here

[...]
> +       phy_exit(mipi_dsi->phy);
please propagate the error code here

[...]
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       mipi_dsi->base = devm_ioremap_resource(&pdev->dev, res);
other parts of the meson DRM driver have been converted to use
devm_platform_ioremap_resource()
I suggest updating this as well to simplify the code here

[...]
> +       mipi_dsi->phy = devm_phy_get(&pdev->dev, "dphy");
> +       if (IS_ERR(mipi_dsi->phy)) {
> +               ret = PTR_ERR(mipi_dsi->phy);
> +               dev_err(&pdev->dev, "failed to get mipi dphy: %d\n", ret);
> +               return ret;
you can simplify this with:
  return dev_err_probe(&pdev->dev, PTR_ERR(mipi_dsi->phy, "failed to
get mipi dphy\n");

[...]
> +       mipi_dsi->px_clk = devm_clk_get(&pdev->dev, "px_clk");
> +       if (IS_ERR(mipi_dsi->px_clk)) {
> +               dev_err(&pdev->dev, "Unable to get PLL clk\n");
> +               return PTR_ERR(mipi_dsi->px_clk);
you can simplify this with:
  return dev_err_probe(&pdev->dev, PTR_ERR(mipi_dsi->px_clk, "Unable
to get PLL clk\n");
Also should it say s/PLL clk/px clock/?

[...]
> +       top_rst = devm_reset_control_get_exclusive(&pdev->dev, "top");
> +       if (IS_ERR(top_rst)) {
> +               ret = PTR_ERR(top_rst);
> +
> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(&pdev->dev, "Unable to get reset control: %d\n", ret);
> +
> +               return ret;
you can simplify this with:
  return dev_err_probe(&pdev->dev, PTR_ERR(top_rst, "Unable to get
reset control\n");

[...]
> +       mipi_dsi->dmd = dw_mipi_dsi_probe(pdev, &mipi_dsi->pdata);
> +       if (IS_ERR(mipi_dsi->dmd)) {
> +               ret = PTR_ERR(mipi_dsi->dmd);
> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(&pdev->dev,
> +                               "Failed to probe dw_mipi_dsi: %d\n", ret);
you can simplify this with:
  dev_err_probe(&pdev->dev, ret, "Failed to probe dw_mipi_dsi\n");


Best regards,
Martin
