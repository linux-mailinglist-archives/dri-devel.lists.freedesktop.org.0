Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C4C3AB971
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 18:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368326E93C;
	Thu, 17 Jun 2021 16:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8206E93A;
 Thu, 17 Jun 2021 16:20:03 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v9so7449799wrx.6;
 Thu, 17 Jun 2021 09:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mxhQgXhjJCcr434tkXcCOzOBhk7EomSUJf4aVJZ0wu0=;
 b=ZDSVR8M7c9hwiPzVzkhJiROl5H1QooUS4TuFwB42YX8EnKKWr4aqdasm4V7p/kq2Ul
 p37uiAe/5uuSuqzQume1QfTiTKToSFYMLErGn4deZLc5Jtd5xMJgcQiCNPT1BeQ5T0rL
 olrEIonYkKBZvFVm3zMhsYfFv58SjXuMaJQedm7LPaa/BhFcIXiq2iwCvDeSu+HOaRT8
 d9sbrZOrT/i7nPLjV3ErhIcI7hXY8BO2Wg5qqIdkoX3vGXFzmycDc53lODBmI5x7CUja
 fQoDcO+YVyETYerBoMwnNWbp2BVhCoQZcWtVlqmM3pVT0Q7/ZNEbJmmR7lJ//5lrlR7D
 j0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mxhQgXhjJCcr434tkXcCOzOBhk7EomSUJf4aVJZ0wu0=;
 b=OMkiH0PpqrRVCjBO5GylAhCqceiz5E3OUBG9YiLE2V6uXJaMsXeW8dw42KSWtylDP9
 ObuXwhwkIvYOlUS0z1OuZJSnDku6ZX4qN4sLWb738UeU0A9E5qAr3KJ9uJQUrUXUmsHR
 XJAm2kO6zhWHbObBXPqUxnM5eeg465SQ7bD2Ks+BkgRfwPVSmJxRQAEqCj7OGbBcY2U8
 muHv2ee++0fQiEqt6mnL5Bid00iJbmXYUA2o9reFiv3lFYCHBTxTYHiahAF86wBoQBbW
 O4xWU0nFgjyDGCFH+YusP2yWiAS5GNJ8iCDd9n3S6gnyyqhkJR2iZ4CjNzF5K19rL7P4
 M1ZQ==
X-Gm-Message-State: AOAM531V491xVecsjNMYDNjN+mpSxSadXI2H1hIkglXViTxgKKTXdR17
 XDWLM5Z7gey7RKicEpVMgO5j5AKLrBOWkvYKCvw=
X-Google-Smtp-Source: ABdhPJwH6yGOAV8Zq/2asUXPC7c2rWQDMRFg9nKCg8VonF7EWFPVJkcadbn/fE/Noz0DAZm8/FK7wOed0dxi/3qvrJU=
X-Received: by 2002:a5d:4203:: with SMTP id n3mr6812885wrq.132.1623946801650; 
 Thu, 17 Jun 2021 09:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210617144349.28448-1-jonathan@marek.ca>
 <20210617144349.28448-2-jonathan@marek.ca>
In-Reply-To: <20210617144349.28448-2-jonathan@marek.ca>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 17 Jun 2021 09:23:56 -0700
Message-ID: <CAF6AEGsaPK4mev5o4DoE5R=tbczQB6z+Qem3gpxNW52uwf=71A@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: msm: dsi: add missing 7nm bindings
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 freedreno <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 17, 2021 at 8:09 AM Jonathan Marek <jonathan@marek.ca> wrote:
>
> These got lost when going from .txt to .yaml bindings, add them back.
>

Fixes: 8fc939e72ff8 ("dt-bindings: msm: dsi: add yaml schemas for DSI
PHY bindings")

> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/display/msm/dsi-phy-7nm.yaml     | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> new file mode 100644
> index 000000000000..c0077ca7e9e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DSI 7nm PHY
> +
> +maintainers:
> +  - Jonathan Marek <jonathan@marek.ca>
> +
> +allOf:
> +  - $ref: dsi-phy-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-7nm
> +      - const: qcom,dsi-phy-7nm-8150
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
> +      Connected to VDD_A_DSI_PLL_0P9 pin (or VDDA_DSI{0,1}_PLL_0P9 for sm8150)
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - vdds-supply
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +     #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
> +     #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +     dsi-phy@ae94400 {
> +         compatible = "qcom,dsi-phy-7nm";
> +         reg = <0x0ae94400 0x200>,
> +               <0x0ae94600 0x280>,
> +               <0x0ae94900 0x260>;
> +         reg-names = "dsi_phy",
> +                     "dsi_phy_lane",
> +                     "dsi_pll";
> +
> +         #clock-cells = <1>;
> +         #phy-cells = <0>;
> +
> +         vdds-supply = <&vreg_l5a_0p88>;
> +         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&rpmhcc RPMH_CXO_CLK>;
> +         clock-names = "iface", "ref";
> +     };
> --
> 2.26.1
>
