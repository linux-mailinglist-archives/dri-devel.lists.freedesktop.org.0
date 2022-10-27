Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD4A60EDC1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 04:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED3C10E0FA;
	Thu, 27 Oct 2022 02:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BD710E0AC;
 Thu, 27 Oct 2022 02:05:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 901A4B82423;
 Thu, 27 Oct 2022 02:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00857C433C1;
 Thu, 27 Oct 2022 02:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666836340;
 bh=5o6vzyzw4kORXcSRUKvFDhkuq4BIPdiBtHVU0vbK5yE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I+eysOf5i6RobjJnbx9xeokOxOGXzrsLztxLU77iMaXFGg9Mw6Q8dsclig1GsSvkH
 BkzpTb77Tn005uIAyR9QMsJkXZ0ZLldrinf3JhF2EHtvwNBHE195IDQGofai0cv/5q
 8xH6BElZOaWcSqV2fB2psm9f1tcPjzsThVsjTomwuU5d1NXfHFQHNcNMzLt//OWlYW
 vyEV39nKbB7tOmAl+oukKUSWZ2QkJVPv/0HR2BbuhrQpHrYOF7PCr3fNYYmD9gDK63
 9G3y93r3wjUOdAmzr/GNRNrCwqfJdQyuPlHbbtzepP6DanwujEdWcdcWgiEsz7pxRI
 0S6VEimAOGBkQ==
Date: Wed, 26 Oct 2022 21:05:37 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 01/12] dt-bindings: display/msm: Add binding for
 SC8280XP MDSS
Message-ID: <20221027020537.li6nzkrtolsnya4x@builder.lan>
References: <20221026032624.30871-1-quic_bjorande@quicinc.com>
 <20221026032624.30871-2-quic_bjorande@quicinc.com>
 <20221026175441.GA812056-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026175441.GA812056-robh@kernel.org>
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
Cc: freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 26, 2022 at 12:54:41PM -0500, Rob Herring wrote:
> On Tue, Oct 25, 2022 at 08:26:13PM -0700, Bjorn Andersson wrote:
> > From: Bjorn Andersson <bjorn.andersson@linaro.org>
> > 
> > Add binding for the display subsystem and display processing unit in the
> > Qualcomm SC8280XP platform.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> > 
> > Changes since v2:
> > - Cleaned up description and interconnect definitions
> > - Added opp-table
> > 
> >  .../bindings/display/msm/dpu-sc8280xp.yaml    | 287 ++++++++++++++++++
> >  1 file changed, 287 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml
> 
> Doesn't this need to be reworked to match Dmitry's restructuring?
> 

I based my patches on linux-next, missed Dmitry's in-flight series.
Seems like this should be rebased on top of his series and hope it lands
soon.

Thanks,
Bjorn

> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml
> > new file mode 100644
> > index 000000000000..24e7a1562fe7
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml
> > @@ -0,0 +1,287 @@
> > +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/msm/dpu-sc8280xp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Display Processing Unit for SC8280XP
> > +
> > +maintainers:
> > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > +
> > +description:
> > +  Device tree bindings for MSM Mobile Display Subsystem (MDSS) that encapsulates
> > +  sub-blocks like DPU display controller, DSI and DP interfaces etc.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sc8280xp-mdss
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  reg-names:
> > +    const: mdss
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Display AHB clock from gcc
> > +      - description: Display AHB clock from dispcc
> > +      - description: Display core clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: iface
> > +      - const: ahb
> > +      - const: core
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> 
> > +  "#address-cells": true
> > +
> > +  "#size-cells": true
> 
> enum: [ 1, 2 ]
> 
> (Nothing else sets that)
> 
> Rob
