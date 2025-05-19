Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B48ABB717
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 10:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959B610E224;
	Mon, 19 May 2025 08:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U5qQz9lN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E5810E224
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 08:23:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CAE04A911;
 Mon, 19 May 2025 08:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F15C4CEE4;
 Mon, 19 May 2025 08:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747643037;
 bh=jPOmJuNtUtPeHXYDoq8UpiU1fLg1uJ77a4E3sjVJxEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U5qQz9lNLqp+uykE3Gz6g6L7CJRrAXbzYGYaN2AituvPUZtSU3ZLuMsv+052yLqbP
 wi6+DQX8s2nnJ8Dq4bFlxQNO2Y1G/L8J8txqx8fibr7BmN5pwMWmbLDbrnI4rU9rHj
 dhehp1GkPvrZrFdbeemWlPN+2tbR4EPvx1N8SpAatTWH1y8NZET04N45u4Q4Hbu5Sm
 l6suFuy8dbBQajdGwrCvBmHmcCitoA8oczhABPantwJH0JIZjHwPY7kEmc+nA2D0A9
 rySdHlUDG9vdaO6MQu3yGdNLuZ5LgNBAVf8EHBi0eVNSG1txUF5VbDZhlRmyRW0REB
 BbFt9Ks5Whxdw==
Date: Mon, 19 May 2025 10:23:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: display: rockchip: Convert
 cdn-dp-rockchip.txt to yaml
Message-ID: <20250519-tall-glistening-quokka-9ffa6f@kuoka>
References: <20250519012632.94-1-kernel@airkyi.com>
 <20250519012632.94-3-kernel@airkyi.com>
 <20a565da-296c-4920-b962-e9de9af464d9@kernel.org>
 <632f9f4d-ec0f-4512-a153-d2abfd9f6841@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <632f9f4d-ec0f-4512-a153-d2abfd9f6841@rock-chips.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 19, 2025 at 02:56:03PM GMT, Chaoyi Chen wrote:
> Hi Krzysztof,
> 
> On 2025/5/19 14:16, Krzysztof Kozlowski wrote:
> > On 19/05/2025 03:26, Chaoyi Chen wrote:
> > > +maintainers:
> > > +  - Andy Yan <andy.yan@rock-chip.com>
> > > +  - Heiko Stuebner <heiko@sntech.de>
> > > +  - Sandy Huang <hjc@rock-chips.com>
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/sound/dai-common.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: rockchip,rk3399-cdn-dp
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: DP core work clock
> > > +      - description: APB clock
> > > +      - description: SPDIF interface clock
> > > +      - description: GRF clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: core-clk
> > > +      - const: pclk
> > > +      - const: spdif
> > > +      - const: grf
> > > +
> > > +  extcon:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    items:
> > > +      maxItems: 1
> > > +    maxItems: 2
> > Instead of this, list the items. Old binding said only "specifier", so
> > this is technically a change, which should be explained in commit msg.
> 
> Will fix in v5.
> 
> 
> > 
> > > +    description:
> > > +      List of phandle to the extcon device providing the cable state for the DP PHY.
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  phys:
> > > +    items:
> > > +      maxItems: 1
> > > +    maxItems: 2
> > > +    description: |
> > > +      List of phandle to the PHY device for DP output.
> > > +      RK3399 have two DP-TPYEC PHY, specifying one PHY which want to use,
> > > +      or specify two PHYs here to let the driver determine which PHY to use.
> > 
> > You do not allow one phy, so your description is not accurate. OTOH,
> > original binding did not allow two phandles, so that's another change in
> > the binding. You need to document all changes done to the binding in the
> > commit msg.
> 
> Oh, the original binding example use two phandles. I think only one PHY can

Example is not the binding, just an example.

> also pass the dtb check here, or maybe I'm missing something else?

You think or you tested it? What is the minItems value? 2, so even if
this works it's rather a bug in dtschema.

Also, inner maxItems:1 is not really correct. Why can't this work with
different phy providers?

Best regards,
Krzysztof

