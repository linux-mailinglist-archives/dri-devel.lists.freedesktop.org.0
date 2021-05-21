Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF21138CBE4
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 19:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A7B89C3B;
	Fri, 21 May 2021 17:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0846389711
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 17:18:20 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id h9so20343014oih.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 10:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mwxoM60YVpuuxxpLWPRnHvcEPjCapnvSBgj+Dy7snG0=;
 b=jualahogEVesPIS1gieZtC1DETW5VCcI+hWyJqH0Kdjum2lD+UwbPEbKgqxu7GcmRI
 pHz3Gd6XgJQGv0HVfnMeiKuAAmPge4eHFybgu34Ra+YEqSSGRQ7w5SNmzzTlkAEn8uJT
 wSXoTlG2XmtPpOywIe803JpKMa8vjwuDJ7zTX6z1K431z68kCNBsqNKz76tKz43AxutL
 uDNyXegyJ2L9vg2x5VWLFNkw1+SJF/GTMXvWehvvKArrotqAf2ofM+M4Q1Ib+jAx0B+u
 +vo7SWqkp9zwx/QWUyhMHfr5OZfjGlHaEoUL/25wAGR0kRG9Q6vLurVTiTzPMlA/r4DF
 80zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mwxoM60YVpuuxxpLWPRnHvcEPjCapnvSBgj+Dy7snG0=;
 b=GzQqvbuaXkJsMwZRkbazR0VEnJQ9j+41yO2eCDinkBNbL7aiiWDkJsCnGUAISVfLvf
 cCaINgW9agY87wIHA5V5N0+8x81yyTb1dkjdgcg8QdKTrW+lMj4iGBAiK1kFmRArc5AL
 2hW8FoKtQGkMuw5vZ3jSDuTfrmeGJgq39o8vtaUwIV2e7MZoH5tfqGOo11iOVpPd2lr+
 4s4PfwJ0Vf1ra3KrPEApTdbxOK3ALm1d0sJN3Ttdf9TXFVQNCvrzSacu8j//F9k/WQ2Y
 6LfwUMPdz/5fgFSJcE52kC7flRyQrH7ZD+DnnSuJIs328mTQUU2bWrmqlrQxCD+tsUWD
 /vRg==
X-Gm-Message-State: AOAM532sz/7AObXh1vFxzuzhcTMjBxBQPTTT76IWMvSyYY+WVOaHLBqs
 nvo987G9m0WpWD5tT2UzYjxOyw==
X-Google-Smtp-Source: ABdhPJwgfHYqvQ5wMl38vkWZL9zz0zUQ+NMWGofTkepeO9trJy2uIAEJzA/Kkl4P5rhSVJIkkVUw9w==
X-Received: by 2002:a05:6808:4c2:: with SMTP id
 a2mr2930417oie.150.1621617499278; 
 Fri, 21 May 2021 10:18:19 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id w198sm1215089oie.26.2021.05.21.10.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 10:18:18 -0700 (PDT)
Date: Fri, 21 May 2021 12:18:16 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [PATCH v17 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 PHY bindings
Message-ID: <20210521171816.GD2484@yoga>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <1621592844-6414-3-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621592844-6414-3-git-send-email-mkrishn@codeaurora.org>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, dianders@chromium.org,
 vinod.koul@linaro.org, linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, khsieh@codeaurora.org, robh+dt@kernel.org,
 tanmay@codeaurora.org, kalyan_t@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 21 May 05:27 CDT 2021, Krishna Manikandan wrote:

> Add YAML schema for the device tree bindings for DSI PHY.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in v1:
>    - Merge dsi-phy.yaml and dsi-phy-10nm.yaml (Stephen Boyd)
>    - Remove qcom,dsi-phy-regulator-ldo-mode (Stephen Boyd)
>    - Add clock cells properly (Stephen Boyd)
>    - Remove unnecessary decription from clock names (Stephen Boyd)
>    - Add pin names for the supply entries for 10nm phy which is
>      used in sc7180 and sdm845 (Stephen Boyd)
>    - Remove unused header files from examples (Stephen Boyd)
>    - Drop labels for display nodes and correct node name (Stephen Boyd)
> 
> Changes in v2:
>    - Drop maxItems for clock (Stephen Boyd)
>    - Add vdds supply pin information for sdm845 (Stephen Boyd)
>    - Add examples for 14nm, 20nm and 28nm phy yaml files (Stephen Boyd)
>    - Keep child nodes directly under soc node (Stephen Boyd)
> 
> Changes in v3:
>    - Use a separate yaml file to describe the common properties
>      for all the dsi phy versions (Stephen Boyd)
>    - Remove soc from examples (Stephen Boyd)
>    - Add description for register property
> 
> Changes in v4:
>    - Modify the title for all the phy versions (Stephen Boyd)
>    - Drop description for all the phy versions (Stephen Boyd)
>    - Modify the description for register property (Stephen Boyd)
> 
> Changes in v5:
>    - Remove unused properties from common dsi phy file
>    - Add clock-cells and phy-cells to required property
>      list (Stephen Boyd)
> 
> Changes in v6:
>    - Add proper compatible string in example
> ---
>  .../bindings/display/msm/dsi-phy-10nm.yaml         | 68 +++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-14nm.yaml         | 66 ++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-20nm.yaml         | 71 ++++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-28nm.yaml         | 68 +++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-common.yaml       | 40 ++++++++++++
>  5 files changed, 313 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> new file mode 100644
> index 0000000..4a26bef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DSI 10nm PHY
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +allOf:
> +  - $ref: dsi-phy-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-10nm
> +      - const: qcom,dsi-phy-10nm-8998
> +
> +  reg:
> +    items:
> +      - description: dsi phy register set
> +      - description: dsi phy lane register set
> +      - description: dsi pll register set
> +
> +  reg-names:
> +    items:
> +      - const: dsi_phy
> +      - const: dsi_phy_lane
> +      - const: dsi_pll
> +
> +  vdds-supply:
> +    description: |
> +      Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
> +      connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target

"Reference to the 0.9V supply for the PLL." would have been sufficient.

But overall I think the patch looks good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
