Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8D9A9E960
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 09:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6066710E1D0;
	Mon, 28 Apr 2025 07:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LZuEWvj0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D3E10E3C0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 07:32:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F09D04A8BC;
 Mon, 28 Apr 2025 07:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DB8C4CEE4;
 Mon, 28 Apr 2025 07:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745825543;
 bh=6CyqCFQcZZdfCoSB63kMO88LbyI3HbOeSFbBcDO9yzc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LZuEWvj0QNt9ipzL/CRYiolgZ52wIHDlM5EghFBR6vRsdgMRlcZ0YxzTCC6j2XkX3
 9w4+SUNxPc2TJruzLgs0UqN57zAeig211SYeAFjSJkLh/PXwxbxZRw4JP0Ik7zoh86
 KYTSVuVYpLQDYiclXB5h9/yW9/jE/guxddJGfmPfyzvyRSTJ5kt0Z+R/d9TW4JM85r
 srKJ7b66GWZxdSbi7lLFWxsnk3shX/y/1X+86m5dekRSjAJQkVNYfVh+hiyUaIRB8G
 xwrWtFWKd3s0PGd6ggKaEpWU68NsJTs4WL2YCOV4JinaeaMMoS5oKaLdZzDx9Vk8ux
 r9OSmP1ycPxpw==
Date: Mon, 28 Apr 2025 09:32:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/5] dt-bindings: display: panel: Fix port binding
Message-ID: <20250428-refined-nyala-of-engineering-0556fb@kuoka>
References: <20250424-feature_sfto340xc-v2-0-ff7da6192df2@bootlin.com>
 <20250424-feature_sfto340xc-v2-1-ff7da6192df2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424-feature_sfto340xc-v2-1-ff7da6192df2@bootlin.com>
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

On Thu, Apr 24, 2025 at 05:07:39PM GMT, Kory Maincent wrote:
> Faced a binding error check while adding the data-lanes property in the
> ilitek,ili9881c binding. See the next patch for the binding changes.
> Here is the error:
> Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.example.dtb:
> panel@0: port:endpoint: Unevaluated properties are not allowed
> ('data-lanes' was unexpected)

There is no error at this point so your rationale is not correct. You
cannot use possible error as reason to fix something... You can use
instead other arguments that the binding is incomplete or incorrect.

> 
> Change the reference of properties/port to $defs/port-base to makes it
> work.
> The only difference between port and port-base is the unevaluatedProperty
> set to false. I have tried to use properties/port in both panel-common
> and ilitek,ili9881c bindings but the error is still there. The only way
> to not face the error is to use $defs/port-base reference. I don't
> really understand the ins and outs, maybe it is a issue from the binding
> check tool.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Changes in v2:
> - New patch
> ---
>  Documentation/devicetree/bindings/display/panel/panel-common.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> index 087415753d606ce67bceabaa9b0ba7d463282f92..635f67ced0cb7103684a1415ab740d83409a7dbb 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
> @@ -76,7 +76,7 @@ properties:
>  
>    # Connectivity
>    port:
> -    $ref: /schemas/graph.yaml#/properties/port
> +    $ref: /schemas/graph.yaml#/$defs/port-base

This allows anything in the port in every other binding, so is not
correct. You need to fully describe the port here with
additionalProps:false, probably. Just like every other binding with
port-base is doing.


Best regards,
Krzysztof

