Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FA6782E09
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 18:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B719110E1E0;
	Mon, 21 Aug 2023 16:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141FB10E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 16:14:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5939B63D49;
 Mon, 21 Aug 2023 16:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C80C433C9;
 Mon, 21 Aug 2023 16:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692634483;
 bh=HaFkRLw39AyOlg5LKd8SotMyWHrCrbNB/b2ma+dX5y8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=myuDm5eSozfKEjyhuaqU7d0d4v22QuzKSsoALDNAcO0PQsZxqSM5MqFcAAmaUA3ZP
 bORAcnrX2DkATzZL14uUuXGLoAWj5fvoIeSrvawx+9hHgchfk9pwiMMNQsnbzer5Nh
 wu1lv+Y4Qqt71o7uejj6YTHKTj8tp5Z0NwKWm9/pG6ixpZF6GZ8aOSrIlqyftbpHCD
 WVVX4Y1+oiad4C/0e7D60pV/0vDsyouUgLTGHFDzwNcUlr8Ix4dtnxEG3ChJCAAqXT
 56v5gNOukSk0clim19s/DWuu4wXoGVOYeZBJcg0W5Jil88IbmRULxNAiCBiGnsV+L/
 NZq12WSVw2RXw==
Received: (nullmailer pid 1830598 invoked by uid 1000);
 Mon, 21 Aug 2023 16:14:41 -0000
Date: Mon, 21 Aug 2023 11:14:41 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: display: tegra: nvidia,tegra20-dc:
 Add parallel RGB output port node
Message-ID: <20230821161441.GA1743870-robh@kernel.org>
References: <20230807143515.7882-1-clamor95@gmail.com>
 <20230807143515.7882-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807143515.7882-3-clamor95@gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 07, 2023 at 05:35:12PM +0300, Svyatoslav Ryhel wrote:
> From: Maxim Schwalm <maxim.schwalm@gmail.com>
> 
> Either this node, which is optional, or the nvidia,panel property can be
> present.
> 
> Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-dc.yaml      | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
> index 69be95afd562..102304703062 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
> @@ -127,6 +127,37 @@ allOf:
>                $ref: /schemas/types.yaml#/definitions/phandle
>                description: phandle of a display panel
>  
> +            port:
> +              $ref: /schemas/graph.yaml#/$defs/port-base
> +              description: Parallel RGB output port
> +
> +              properties:
> +                endpoint:
> +                  $ref: /schemas/media/video-interfaces.yaml#

Just to make sure, what properties are you using from this? Usually 
we'll list them though not a hard requirement. If none, then you just 
need to ref graph.yaml#/properties/port instead and can drop the rest.

> +                  unevaluatedProperties: false
> +
> +              unevaluatedProperties: false

In the indented cases, it's easier to read if this is before 
properties/patternProperties.

> +
> +          anyOf:
> +            - if:
> +                not:
> +                  properties:
> +                    nvidia,panel: false
> +              then:
> +                not:
> +                  properties:
> +                    port: true
> +            - if:
> +                not:
> +                  properties:
> +                    port: false
> +              then:
> +                not:
> +                  properties:
> +                    nvidia,panel: true

I would prefer to drop this and mark "nvidia,panel" as deprecated. 
Eventually I plan to add a mode to the tools to warn on using deprecated 
properties. Having both could be perfectly fine too. You have the 
"nvidia,panel" for compatibility with an old OS version and 'port' to 
work with newer users.

> +
> +          additionalProperties: false

Move this up too.

Rob
