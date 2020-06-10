Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631DC1F4F39
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF88B6E434;
	Wed, 10 Jun 2020 07:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BFA6E1B9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jun 2020 02:15:11 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id k2so215205pjs.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 19:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=pA37y1CYXLgVHVrYj18ypd3F9//Xs+/YktSGFCHAW98=;
 b=ZHlIGThs2wHrI9acdaKZPm7Lb1uk9DigKh+enZyozDm5ScRT2fwq9OpuEoMGcvTbil
 RzRUerujDKwR3+V8Gbxgbil9HvBfDLsDFGazNYuoQ/XSeMQHp4kCfUXJmScKp/L18GBa
 G1QWMkVYtjvM9bNYn/0A+V8hqgq/hcvRJR57A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=pA37y1CYXLgVHVrYj18ypd3F9//Xs+/YktSGFCHAW98=;
 b=Ft4KshNq/W2n9Ktgsq4YM4gJFJjRsER7UGzfTN86mKJInUjbhb9eNLtbGoQgE996wg
 w1qrproBGZO7BVau7XhIIAuKXHARdIAxsAJ6EsBGwDTI/rDxWrxYDEqFbUb5muRpePnT
 2YQXIyy118++DuQfkuTlR4fL73+6+jphOq4ej9CrGcvffC9pfQxPPFfVuJkB8HsBgEjB
 m49tgwSHoeYcxDWM/IZGeWd7ae7qeW/dDExurG78Ei+rHlJpE2hP1nJGFH+CLHzJ7DYy
 kEJxb+hEm7Rh1nZ1ajlxtmkB/u8KcbLLzqxTnaZqHOujQe9hHez28zLInXAHb55ZtZ+x
 m3og==
X-Gm-Message-State: AOAM533em8jP8vEavHUr5KfggUaFhIvyOOsv6o0yw9YJbjuHBXepgIYE
 OuUu+ZqNAb1m+t09vx1Xj8nOV1r4xQg=
X-Google-Smtp-Source: ABdhPJzk0gQibQx+A+fhILd0h8zf1lcWr4uKRk1XIjkdSzozTHDxJTDuKLAR1DBr8VHwo9N/ttg4oQ==
X-Received: by 2002:a17:902:c40c:: with SMTP id
 k12mr1104926plk.105.1591755310849; 
 Tue, 09 Jun 2020 19:15:10 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id 140sm11113508pfv.38.2020.06.09.19.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 19:15:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200609033818.9028-1-tanmay@codeaurora.org>
References: <20200609033818.9028-1-tanmay@codeaurora.org>
Subject: Re: [PATCH v6 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL
 driver for Snapdragon
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, devicetree@vger.kernel.org
Date: Tue, 09 Jun 2020 19:15:09 -0700
Message-ID: <159175530931.242598.4696487926885071106@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: Tanmay Shah <tanmay@codeaurora.org>, sam@ravnborg.org,
 abhinavk@codeaurora.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Vara Reddy <varar@codeaurora.org>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org, chandanu@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-06-08 20:38:18)
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> new file mode 100644
> index 0000000..5fdb915
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml

Typically the file name matches the compatible string. But the
compatible string is just qcom,dp-display. Maybe the compatible string
should be qcom,sc7180-dp? Notice that the SoC number comes first as is
preferred.


> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0-only  OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dp-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display Port Controller.
> +
> +maintainers:
> +  - Chandan Uddaraju <chandanu@codeaurora.org>
> +  - Vara Reddy <varar@codeaurora.org>
> +  - Tanmay Shah <tanmay@codeaurora.org>
> +
> +description: |
> +  Device tree bindings for MSM Display Port which supports DP host controllers
> +  that are compatible with VESA Display Port interface specification.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,dp-display
> +
> +  cell-index:
> +    description: Specifies the controller instance.
> +
> +  reg:
> +    items:
> +      - description: DP controller registers
> +
> +  interrupts:
> +    description: The interrupt signal from the DP block.
> +
> +  clocks:
> +    description: List of clock specifiers for clocks needed by the device.
> +    items:
> +      - description: Display Port AUX clock
> +      - description: Display Port Link clock
> +      - description: Link interface clock between DP and PHY
> +      - description: Display Port Pixel clock
> +      - description: Root clock generator for pixel clock
> +
> +  clock-names:
> +    description: |
> +      Device clock names in the same order as mentioned in clocks property.
> +      The required clocks are mentioned below.
> +    items:
> +      - const: core_aux
> +      - const: ctrl_link
> +      - const: ctrl_link_iface
> +      - const: stream_pixel
> +      - const: pixel_rcg

Why not just 'pixel'? And why is the root clk generator important? It
looks like this binding should be using the assigned clock parents
property instead so that it doesn't have to call clk_set_parent()
explicitly.

> +  "#clock-cells":
> +    const: 1
> +
> +  vdda-1p2-supply:
> +    description: phandle to vdda 1.2V regulator node.
> +
> +  vdda-0p9-supply:
> +    description: phandle to vdda 0.9V regulator node.
> +
> +  data-lanes = <0 1>:

Is this correct? We can have = <value> in the property name? Also feels
generic and possibly should come from the phy binding instead of from
the controller binding.

> +    type: object
> +    description: Maximum number of lanes that can be used for Display port.
> +
> +  ports:
> +    description: |
> +       Contains display port controller endpoint subnode.
> +       remote-endpoint: |
> +         For port@0, set to phandle of the connected panel/bridge's
> +         input endpoint. For port@1, set to the DPU interface output.
> +         Documentation/devicetree/bindings/graph.txt and
> +         Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +patternProperties:
> +  "^aux-cfg([0-9])-settings$":
> +    type: object
> +    description: |
> +      Specifies the DP AUX configuration [0-9] settings.
> +      The first entry in this array corresponds to the register offset
> +      within DP AUX, while the remaining entries indicate the
> +      programmable values.

I'd prefer this was removed from the binding and hardcoded in the driver
until we can understand what the values are. If they're not
understandable then they most likely don't change and should be done in
the driver.

> +
> +required:
> +  - compatible
> +  - cell-index
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - vdda-1p2-supply
> +  - vdda-0p9-supply
> +  - data-lanes
> +  - ports
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    msm_dp: displayport-controller@ae90000{
> +        compatible = "qcom,dp-display";
> +        cell-index = <0>;
> +        reg = <0 0xae90000 0 0x1400>;
> +        reg-names = "dp_controller";
> +
> +        interrupt-parent = <&display_subsystem>;
> +        interrupts = <12 0>;
> +
> +        clocks = <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> +                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +        clock-names = "core_aux",
> +                      "ctrl_link",
> +                      "ctrl_link_iface", "stream_pixel",
> +                      "pixel_rcg";
> +        #clock-cells = <1>;
> +
> +        vdda-1p2-supply = <&vreg_l3c_1p2>;
> +        vdda-0p9-supply = <&vreg_l4a_0p8>;
> +
> +        data-lanes = <0 1>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                dp_in: endpoint {
> +                    remote-endpoint = <&dpu_intf0_out>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                dp_out: endpoint {
> +                };
> +            };
> +        };
> +    };

I believe there should be a '...' here.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
