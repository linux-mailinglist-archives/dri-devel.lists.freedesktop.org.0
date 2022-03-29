Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7164EA7E1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 08:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F04310EFE8;
	Tue, 29 Mar 2022 06:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C226E10E302;
 Tue, 29 Mar 2022 06:31:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5F077B80CC7;
 Tue, 29 Mar 2022 06:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD40C2BBE4;
 Tue, 29 Mar 2022 06:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648535517;
 bh=qQdEegtTay97bdLFpDoQhHXRXAb8Gb7e6nlf1kKCkVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XC8bQVeQEmhTJk/J+uyEhRZ4t4eJ4J5h0wqWTevizVDXWn0WM/OeI65K9IhfoPNoN
 W/xSTBLECpgkuX85RagScxcKu0QM6GQU305VIkG0DXsxm1UBzhrlI1J8KzgUOg7X+r
 WWX8Iq+sQjENxQt7jEzFKg9HhjAmk3lIVnPZbAlqdsx51JU4hhrUyCWmwqTHUbqQVx
 Ab7nb8ByDqBxvdE5F+Sv1BABrZjJ+BJOADiCxhioMsJehaF6xraVtQ85f7XJKCUh50
 LuXe+ALG9iGEORdqEf87r0r0dj1U8oEd8sX5JoOPp7pf1iNTsgJ9clgzrBcZ2A7rnb
 WUr0CD89snmVw==
Date: Tue, 29 Mar 2022 12:01:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: msm: dsi: remove address/size cells
Message-ID: <YkKmPSesQfS6RLCD@matsya>
References: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
 <CAA8EJprWoxWwk5EWEfWdLquPR+2=u6V0-v1-+wHMHOk8HiEyNw@mail.gmail.com>
 <YkHtY9absUjmqmW7@matsya>
 <12b0056b-8032-452b-f325-6f36037b5a80@linaro.org>
 <CAL_Jsq+6rx0UU6ryH+z_8KLQqKKuhTCnh=Oft2F03bcze+EV0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+6rx0UU6ryH+z_8KLQqKKuhTCnh=Oft2F03bcze+EV0Q@mail.gmail.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28-03-22, 13:21, Rob Herring wrote:
> On Mon, Mar 28, 2022 at 12:18 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 28/03/2022 19:16, Vinod Koul wrote:
> > > On 28-03-22, 19:43, Dmitry Baryshkov wrote:
> > >> On Mon, 28 Mar 2022 at 18:30, Krzysztof Kozlowski
> > >> <krzysztof.kozlowski@linaro.org> wrote:
> > >>>
> > >>> The DSI node is not a bus and the children do not have unit addresses.
> > >>>
> > >>> Reported-by: Vinod Koul <vkoul@kernel.org>
> > >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > >>
> > >> NAK.
> > >> DSI panels are children of the DSI device tree node with the reg = <0>; address.
> > >> This is the convention used by other platforms too (see e.g.
> > >> arch/arm64/boot/dts/freescale/imx8mq-evk.dts).
> > >
> > > So we should add reg = 0, i will update my dtsi fix
> > >
> >
> > To "ports" node? No. The reg=0 is for children of the bus, so the
> > panels. How to combine both without warnings - ports and panel@0 - I
> > don't know yet...
> 
> I don't think that should case a warning. Or at least it's one we turn off.

Well in this case I think we might need a fix:
Here is the example quoted in the binding. We have ports{} and then the
two port@0 and port@1 underneath.

So it should be okay to drop #address-cells/#size-cells from dsi node
but keep in ports node...

Thoughts...?


     dsi@ae94000 {
           compatible = "qcom,mdss-dsi-ctrl";
           reg = <0x0ae94000 0x400>;
           reg-names = "dsi_ctrl";

           #address-cells = <1>;
           #size-cells = <0>;

           interrupt-parent = <&mdss>;
           interrupts = <4>;

           clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
                    <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
                    <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
                    <&dispcc DISP_CC_MDSS_ESC0_CLK>,
                    <&dispcc DISP_CC_MDSS_AHB_CLK>,
                    <&dispcc DISP_CC_MDSS_AXI_CLK>;
           clock-names = "byte",
                         "byte_intf",
                         "pixel",
                         "core",
                         "iface",
                         "bus";

           phys = <&dsi0_phy>;
           phy-names = "dsi";

           assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
           assigned-clock-parents = <&dsi_phy 0>, <&dsi_phy 1>;

           power-domains = <&rpmhpd SC7180_CX>;
           operating-points-v2 = <&dsi_opp_table>;

           ports {
                  #address-cells = <1>;
                  #size-cells = <0>;

                  port@0 {
                          reg = <0>;
                          dsi0_in: endpoint {
                                   remote-endpoint = <&dpu_intf1_out>;
                          };
                  };

                  port@1 {
                          reg = <1>;
                          dsi0_out: endpoint {
                                   remote-endpoint = <&sn65dsi86_in>;
                                   data-lanes = <0 1 2 3>;
                          };
                  };
           };
     };

> 
> Rob

-- 
~Vinod
