Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC09397B7B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 22:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9046E0C8;
	Tue,  1 Jun 2021 20:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED206E0C8;
 Tue,  1 Jun 2021 20:58:50 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 c31-20020a056830349fb02903a5bfa6138bso569668otu.7; 
 Tue, 01 Jun 2021 13:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mFVgXK4P9/P196d6q38oyDpnHkvZz1jGfjrbZohVPy8=;
 b=JgZa7dH3QPDcGFnKEqmNKW+75hN/Z+U0CrVpALE66VJ6k9rrKG7hvcMxcDLHKJPi9N
 SwMORZxYo1fgyq0NTASpd6wSr8bPKnB77LzpkQVBZ3yCRljj+IZlRq+EYlcnoUEVTkA4
 uLzRMnjm1bSF3wMrFNQc6lcLE6icuJQ7A1RXo+rBw29buujMP5sjx4VpRx4NpQsLZQNJ
 xzwdGBSeQYYeBnraJcr9wjzW8z4oNvEfmkUWpih+Ys13B9xNQhCzCMQ1wob3wI1wMErO
 /ltwblEUMwJweMmIO6jK3Oi7xmQKjgtFY0Itu4N88yMeJPmVc1YNxjxC/uhbceBUHhce
 Mbew==
X-Gm-Message-State: AOAM533itBa2EuBjb5TCy3UVEtUECVErXjoScJBS4xvH85cbqFpspfkY
 zE4fbRSDUUHkMzUeXSF5bA==
X-Google-Smtp-Source: ABdhPJwSDOHE2U3w/uzQOBXamMUbXVw3E+ghXWqjym71F23AjO+4al6m1BHPI6Gog/151NLhLbohIg==
X-Received: by 2002:a05:6830:611:: with SMTP id
 w17mr22894682oti.225.1622581130059; 
 Tue, 01 Jun 2021 13:58:50 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a14sm3956610otl.52.2021.06.01.13.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 13:58:49 -0700 (PDT)
Received: (nullmailer pid 1030577 invoked by uid 1000);
 Tue, 01 Jun 2021 20:58:48 -0000
Date: Tue, 1 Jun 2021 15:58:48 -0500
From: Rob Herring <robh@kernel.org>
To: Rajeev Nandan <rajeevny@codeaurora.org>
Subject: Re: [v1 1/3] dt-bindings: msm/dsi: Add yaml schema for 7nm DSI PHY
Message-ID: <20210601205848.GA1025498@robh.at.kernel.org>
References: <1622468035-8453-1-git-send-email-rajeevny@codeaurora.org>
 <1622468035-8453-2-git-send-email-rajeevny@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622468035-8453-2-git-send-email-rajeevny@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, mkrishn@codeaurora.org, jonathan@marek.ca,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 abhinavk@codeaurora.org, kalyan_t@codeaurora.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 31, 2021 at 07:03:53PM +0530, Rajeev Nandan wrote:
> Add YAML schema for the device tree bindings for MSM 7nm DSI PHY driver.
> 
> Cc: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
>  .../bindings/display/msm/dsi-phy-7nm.yaml          | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> new file mode 100644
> index 00000000..f17cfde
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DSI 7nm PHY
> +
> +maintainers:
> +  - Rajeev Nandan <rajeevny@codeaurora.org>
> +
> +allOf:
> +  - $ref: dsi-phy-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-7nm

When would one use this?

> +      - const: qcom,dsi-phy-7nm-7280
> +      - const: qcom,dsi-phy-7nm-8150

These don't look like full SoC names (sm8150?) and it's 
<vendor>,<soc>-<block>.

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
> +    description: Phandle to 0.9V power supply regulator device node.
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
> +     #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
> +     #include <dt-bindings/clock/qcom,rpmh.h>
> +
> +     dsi-phy@ae94400 {
> +         compatible = "qcom,dsi-phy-7nm-7280";
> +         reg = <0x0ae94400 0x200>,
> +               <0x0ae94600 0x280>,
> +               <0x0ae94900 0x280>;
> +         reg-names = "dsi_phy",
> +                     "dsi_phy_lane",
> +                     "dsi_pll";
> +
> +         #clock-cells = <1>;
> +         #phy-cells = <0>;
> +
> +         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                  <&rpmhcc RPMH_CXO_CLK>;
> +         clock-names = "iface", "ref";
> +
> +         vdds-supply = <&vreg_l10c_0p8>;
> +     };
> +...
> -- 
> 2.7.4
