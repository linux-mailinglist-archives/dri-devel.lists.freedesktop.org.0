Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EAA9F0881
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6F010EF7E;
	Fri, 13 Dec 2024 09:52:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XpU82KBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640AD10EF7E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:52:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 875D4A405FB;
 Fri, 13 Dec 2024 09:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2FEC4CED0;
 Fri, 13 Dec 2024 09:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734083530;
 bh=BU/J16Ct4CwkI88Ev0nVluHMhJ7hjnowLd7wIxggf4M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XpU82KBfxjjRWfMsNAY4DdgnA0/pQPGsdZG4rPLMTh4hEb4kOXYKKqj3b+4MOg78/
 tRu+VhuRVOHuFerRLkA2FNKGrxRonw0Yt/+sJvxQ1PrgSE5efYjfU2mOlmszQ5sZ3M
 ehjWxCiJlhCx2H/ycld1AGF/50FBD3YWNYoe77GrnEjUKWudhI2UFKb7qBklwN817l
 d0CzhlbjGta7d67iylDTQ3qHs2UsAqJ4VElcZFCgFXKvjEe7uSXB6za3vclhDTIWq2
 qwAFMBTfXCjwLcExb5lDXuXKOFQAORlytg9s3z8c5nGQEICnxQlzcHA0KjBop0Stwd
 EvNWACQj9X6Ig==
Date: Fri, 13 Dec 2024 10:52:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Andy Yan <andyshrk@163.com>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: Add Raydium RM67200
Message-ID: <7uoc7higbx772dabs6k5zvrvgfmp2otai3bz2z62wnpv6pfa5s@jpe45f3qzyu2>
References: <20241210164333.121253-1-sebastian.reichel@collabora.com>
 <20241210164333.121253-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210164333.121253-2-sebastian.reichel@collabora.com>
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

On Tue, Dec 10, 2024 at 05:41:30PM +0100, Sebastian Reichel wrote:
> The Rockchip W552793DBA-V10 display/touchscreen board contains a
> Wanchanglong W552793BAA panel, which in turn is using a Raydium
> RM67200 MIPI-DSI controller. Add a DT binding for the DSI panel.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../display/panel/raydium,rm67200.yaml        | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
> new file mode 100644
> index 000000000000..d0a6d3207811
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/raydium,rm67200.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Raydium RM67200 based MIPI-DSI panels
> +
> +maintainers:
> +  - Sebastian Reichel <sebastian.reichel@collabora.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - wanchanglong,w552793baa
> +      - const: raydium,rm67200
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: 2.8V Logic voltage
> +
> +  iovcc-supply:
> +    description: 1.8V IO voltage
> +
> +  vsp-supply:
> +    description: positive 5.5V voltage
> +
> +  vsn-supply:
> +    description: negative 5.5V voltage
> +
> +  backlight: true
> +  port: true
> +  reset-gpios: true
> +
> +additionalProperties: false

This goes after required: field, as expressed in example-schema.

With this change:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

