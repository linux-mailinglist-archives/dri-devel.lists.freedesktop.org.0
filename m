Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DFD1FC745
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E326E523;
	Wed, 17 Jun 2020 07:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7816E040
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 10:55:32 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id b7so1077713pju.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 03:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=P0rgsD9Ct3sLOZeZyHD1bcKF15pZ4X0Ei5Mx+pWd/mE=;
 b=cBsuKjhLkk1YAPB7IC/X7x2KOOKUVv74p6wbbgrNn2JTfuq18XCdwqJyCWw++F2IzP
 JuI0h9NIrPM+DIvEQvk3oL6QP06TuIZbGoca4/oVtHisrsbqt3wA7YbjQnZqPnw9b/F+
 WbPuH9UTZHbsPLWtIuJ4xuPU9Y6qNi0DhSKpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=P0rgsD9Ct3sLOZeZyHD1bcKF15pZ4X0Ei5Mx+pWd/mE=;
 b=KlJd9sSU9pcKdaQ5j5vRZCuThqR/QNzhGddGd4V8Mk6Fmeg7qc25BXuXI6Hmwns51n
 95OstSsDZVxQNKxQiKtuHWt6Xo4EZvniNhn0ZbDqUN/xoEMGEWmM3IUUH8t+OuAoAOCk
 eLTh0jZi6hBFsmm5im0O0K4RiutqRua+jRscDkmH9F808v7264zTPp3ZvbjXuco6VySI
 nAqN4SAu+0Vm0PgfUn/mDLCG4zPWSDsmvBLjKThTmGvwlrTtdqfzlJFpKw3EFVjl5iAo
 jXLq4LK/UYst8hxjqatOdEEeij3AWH7O1hrGneDerHAtdEVqR8kPG5ZVi9rdODCseygc
 CZkg==
X-Gm-Message-State: AOAM5311kNTVZa6W3gPhzmvkcIaJBt3Pf7lCqeT8wdtut/kOr1az1H5/
 j/cNtCvmK0+/AxtpkmmvvBh7CA==
X-Google-Smtp-Source: ABdhPJzuT0DcmntlVBwDdeDpH39DGEE13XccI71h8P1IxymNV+mNcmeovPxHUeQTw13PqWjyh0ScDw==
X-Received: by 2002:a17:90a:c5:: with SMTP id v5mr2281693pjd.226.1592304930604; 
 Tue, 16 Jun 2020 03:55:30 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id p30sm14059553pgn.58.2020.06.16.03.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 03:55:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d6db52a33ac787c0fe6134ca32c06007@codeaurora.org>
References: <20200609033818.9028-1-tanmay@codeaurora.org>
 <159175530931.242598.4696487926885071106@swboyd.mtv.corp.google.com>
 <d6db52a33ac787c0fe6134ca32c06007@codeaurora.org>
Subject: Re: [PATCH v6 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL
 driver for Snapdragon
From: Stephen Boyd <swboyd@chromium.org>
To: tanmay@codeaurora.org
Date: Tue, 16 Jun 2020 03:55:28 -0700
Message-ID: <159230492894.62212.17830740055624171310@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:03 +0000
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, abhinavk@codeaurora.org,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Vara Reddy <varar@codeaurora.org>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org,
 chandanu@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting tanmay@codeaurora.org (2020-06-11 13:07:09)
> On 2020-06-09 19:15, Stephen Boyd wrote:
> > Quoting Tanmay Shah (2020-06-08 20:38:18)
> >> diff --git 
> >> a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml 
> >> b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> >> new file mode 100644
> >> index 0000000..5fdb915
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> > 
> > Typically the file name matches the compatible string. But the
> > compatible string is just qcom,dp-display. Maybe the compatible string
> > should be qcom,sc7180-dp? Notice that the SoC number comes first as is
> > preferred.
> > 
> These bindings will be similar for upcoming SOC as well.
> So just for understanding, when we add new SOC do we create new file 
> with same bidings
> with SOC number in new file name?
> Instead we can keep this file's name as qcom,dp-display.yaml (same as 
> compatible const) and we can include SOC number in compatible enum ?
> some examples:
> https://patchwork.kernel.org/patch/11448357/
> https://patchwork.kernel.org/patch/11164619/

Yes that works too. It's really up to robh here.

> > 
> >> @@ -0,0 +1,142 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only  OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/msm/dp-sc7180.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Qualcomm Display Port Controller.
> >> +
> >> +maintainers:
> >> +  - Chandan Uddaraju <chandanu@codeaurora.org>
> >> +  - Vara Reddy <varar@codeaurora.org>
> >> +  - Tanmay Shah <tanmay@codeaurora.org>
> >> +
> >> +description: |
> >> +  Device tree bindings for MSM Display Port which supports DP host 
> >> controllers
> >> +  that are compatible with VESA Display Port interface specification.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    items:
> >> +      - const: qcom,dp-display
> >> +
> >> +  cell-index:
> >> +    description: Specifies the controller instance.
> >> +
> >> +  reg:
> >> +    items:
> >> +      - description: DP controller registers
> >> +
> >> +  interrupts:
> >> +    description: The interrupt signal from the DP block.
> >> +
> >> +  clocks:
> >> +    description: List of clock specifiers for clocks needed by the 
> >> device.
> >> +    items:
> >> +      - description: Display Port AUX clock
> >> +      - description: Display Port Link clock
> >> +      - description: Link interface clock between DP and PHY
> >> +      - description: Display Port Pixel clock
> >> +      - description: Root clock generator for pixel clock
> >> +
> >> +  clock-names:
> >> +    description: |
> >> +      Device clock names in the same order as mentioned in clocks 
> >> property.
> >> +      The required clocks are mentioned below.
> >> +    items:
> >> +      - const: core_aux
> >> +      - const: ctrl_link
> >> +      - const: ctrl_link_iface
> >> +      - const: stream_pixel
> >> +      - const: pixel_rcg
> > 
> > Why not just 'pixel'? And why is the root clk generator important? It
> > looks like this binding should be using the assigned clock parents
> > property instead so that it doesn't have to call clk_set_parent()
> > explicitly.
> > 
> Are we talking about renaming stream_pixel to pixel only?
> We divide clocks in categories: core, control and stream clock.
> Similar terminology will be used in subsequent driver patches as well.
> 
> We can remove pixel_rcg use assigned clock parents property and remove 
> clk_set_parent
> from driver.

Cool. Using assigned clock parents is good.

> 
> >> +  "#clock-cells":
> >> +    const: 1
> >> +
> >> +  vdda-1p2-supply:
> >> +    description: phandle to vdda 1.2V regulator node.
> >> +
> >> +  vdda-0p9-supply:
> >> +    description: phandle to vdda 0.9V regulator node.
> >> +
> >> +  data-lanes = <0 1>:
> > 
> > Is this correct? We can have = <value> in the property name? Also feels
> > generic and possibly should come from the phy binding instead of from
> > the controller binding.
> > 
> We are using this property in DP controller programming sequence such as 
> link training.
> So I think we can keep this here.
> You are right about <value>. <0 1> part should be in example only. It 
> was passing through dt_binding_check though.
> Here it should be like:
> data-lanes:
> minItems:1
> maxItems:4

Ok.

> 
> >> +    type: object
> >> +    description: Maximum number of lanes that can be used for Display 
> >> port.
> >> +
> >> +  ports:
> >> +    description: |
> >> +       Contains display port controller endpoint subnode.
> >> +       remote-endpoint: |
> >> +         For port@0, set to phandle of the connected panel/bridge's
> >> +         input endpoint. For port@1, set to the DPU interface output.
> >> +         Documentation/devicetree/bindings/graph.txt and
> >> +         
> >> Documentation/devicetree/bindings/media/video-interfaces.txt.
> >> +
> >> +patternProperties:
> >> +  "^aux-cfg([0-9])-settings$":
> >> +    type: object
> >> +    description: |
> >> +      Specifies the DP AUX configuration [0-9] settings.
> >> +      The first entry in this array corresponds to the register 
> >> offset
> >> +      within DP AUX, while the remaining entries indicate the
> >> +      programmable values.
> > 
> > I'd prefer this was removed from the binding and hardcoded in the 
> > driver
> > until we can understand what the values are. If they're not
> > understandable then they most likely don't change and should be done in
> > the driver.
> > 
> Typically customers tune these values by working with vendor. So for 
> different boards it can be different. Even though it is hard for 
> customers to do this themselves, these are still board specific and 
> belong to dts. As requested earlier, we have added default values 
> already and made these properties optional but, we would like to keep it 
> in bindings so we can have option to tune them as required.

If they're in the binding then they should make sense instead of just
being random values. So please move the defaults to the driver and
have human understandable DT properties to tune these settings. This has
been done for the qcom USB phy already (see things like
qcom,hstx-trim-value for example).

> >> +
> >> +required:
> >> +  - compatible
> >> +  - cell-index
> >> +  - reg
> >> +  - interrupts
> >> +  - clocks
> >> +  - clock-names
> >> +  - vdda-1p2-supply
> >> +  - vdda-0p9-supply
> >> +  - data-lanes
> >> +  - ports
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> >> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> >> +    msm_dp: displayport-controller@ae90000{
> >> +        compatible = "qcom,dp-display";
> >> +        cell-index = <0>;
> >> +        reg = <0 0xae90000 0 0x1400>;
> >> +        reg-names = "dp_controller";
> >> +
> >> +        interrupt-parent = <&display_subsystem>;
> >> +        interrupts = <12 0>;
> >> +
> >> +        clocks = <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> >> +                 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> >> +                 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> >> +                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
> >> +                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> >> +        clock-names = "core_aux",
> >> +                      "ctrl_link",
> >> +                      "ctrl_link_iface", "stream_pixel",
> >> +                      "pixel_rcg";
> >> +        #clock-cells = <1>;
> >> +
> >> +        vdda-1p2-supply = <&vreg_l3c_1p2>;
> >> +        vdda-0p9-supply = <&vreg_l4a_0p8>;
> >> +
> >> +        data-lanes = <0 1>;
> >> +
> >> +        ports {
> >> +            #address-cells = <1>;
> >> +            #size-cells = <0>;
> >> +
> >> +            port@0 {
> >> +                reg = <0>;
> >> +                dp_in: endpoint {
> >> +                    remote-endpoint = <&dpu_intf0_out>;
> >> +                };
> >> +            };
> >> +
> >> +            port@1 {
> >> +                reg = <1>;
> >> +                dp_out: endpoint {
> >> +                };
> >> +            };
> >> +        };
> >> +    };
> > 
> > I believe there should be a '...' here.
> I think you mean signature is missing? If not could you please explain?

No I mean there should be a triple dot at the end.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
