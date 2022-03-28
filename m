Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B57B4E9D31
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0507710E348;
	Mon, 28 Mar 2022 17:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DF710E22F;
 Mon, 28 Mar 2022 17:16:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D6B66B81123;
 Mon, 28 Mar 2022 17:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E380C340F0;
 Mon, 28 Mar 2022 17:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648487784;
 bh=o14EgBIuBc/4hkkPdrc5dpLxJVeRUhse87xGCCnnTtE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DkVASHPDf7Lp+C5wh52bc+X1BzB4Dao314D1FoJjWLbb5s+2hb6PJh1EVKiWtNiM3
 xQeX9+olf3lt0FAL0khKzGyPPLxwkE/+WFTFs/AFjdwl2tSMFjj43ubNPugBIFXZoh
 4/BR93Plhr7H35FHGEYD3qnM8N2t7SrD58TbBrEX8WGjDaQ5vedHSNYQ8WmdLkV1qY
 xmFjxJdZhMLglZQj4jrusVBPuQeje4TjzUEbMeRxyTPg58UjgS2iAVTAQgXVZSIgqa
 4i2CBGb4qY5kC2CuFCPmOgCxOzWmLhfInCj7/D0yWzdYT2ry+OfwzrldoVYs26kxg5
 Hre5eJTpqwytA==
Date: Mon, 28 Mar 2022 22:46:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: msm: dsi: remove address/size cells
Message-ID: <YkHtY9absUjmqmW7@matsya>
References: <20220328152923.90623-1-krzysztof.kozlowski@linaro.org>
 <CAA8EJprWoxWwk5EWEfWdLquPR+2=u6V0-v1-+wHMHOk8HiEyNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprWoxWwk5EWEfWdLquPR+2=u6V0-v1-+wHMHOk8HiEyNw@mail.gmail.com>
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28-03-22, 19:43, Dmitry Baryshkov wrote:
> On Mon, 28 Mar 2022 at 18:30, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > The DSI node is not a bus and the children do not have unit addresses.
> >
> > Reported-by: Vinod Koul <vkoul@kernel.org>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> NAK.
> DSI panels are children of the DSI device tree node with the reg = <0>; address.
> This is the convention used by other platforms too (see e.g.
> arch/arm64/boot/dts/freescale/imx8mq-evk.dts).

So we should add reg = 0, i will update my dtsi fix

> With the DSI split link it is possible to attach two panels to a
> single DSI host, so addresses are necessary.
> 
> > ---
> >  .../bindings/display/msm/dsi-controller-main.yaml          | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > index 7095ec3c890d..57f238f72326 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > @@ -51,10 +51,6 @@ properties:
> >    phy-names:
> >      const: dsi
> >
> > -  "#address-cells": true
> > -
> > -  "#size-cells": true
> > -
> >    syscon-sfpb:
> >      description: A phandle to mmss_sfpb syscon node (only for DSIv2).
> >      $ref: "/schemas/types.yaml#/definitions/phandle"
> > @@ -154,9 +150,6 @@ examples:
> >             reg = <0x0ae94000 0x400>;
> >             reg-names = "dsi_ctrl";
> >
> > -           #address-cells = <1>;
> > -           #size-cells = <0>;
> > -
> >             interrupt-parent = <&mdss>;
> >             interrupts = <4>;
> >
> > --
> > 2.32.0
> >
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
~Vinod
