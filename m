Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C56D8A8632
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 16:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A55C1135C0;
	Wed, 17 Apr 2024 14:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LzRBw2TK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E151135C0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 14:41:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 020B3CE1271;
 Wed, 17 Apr 2024 14:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5F6C072AA;
 Wed, 17 Apr 2024 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713364858;
 bh=cA9scemWzsFPzGRaNP28UzTwSugriMk3blVS/UdZG5I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LzRBw2TKlNf290/RbUJs5YW4I8FKBGmlxBfHu94FlQsrTRnCtbIQBYX6daCmCUTYF
 yp688MjUGxUF4Si6PNGxbw80Z28XuRCrG9hxHjicTVTui70H8X5pVofBDvmnetTGY8
 2GCc4NlMw+cG+CKNkcJkoDJQbuayL8jjIJsaNsBnsbZjezXGAMjVLKQrGBDHYaAVXW
 dN6Z1rv9GyNx0kCqgyyU+iideLd9fm9xzpoi+9IynigDdBjQvynIRhueNUnYU0lGns
 cdwAMIHvk0vhDjuwIQ2wuPy/c22Vz+T6UfPMNuqDQdtOQdCUOcIIqdOddeyBsjJE0O
 i9rAFiploTiQw==
Date: Wed, 17 Apr 2024 09:40:55 -0500
From: Rob Herring <robh@kernel.org>
To: David Wronek <david@mainlining.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: display: panel: Add Raydium RM69380
Message-ID: <20240417144055.GA2335446-robh@kernel.org>
References: <20240416-raydium-rm69380-driver-v3-0-21600ac4ce5f@mainlining.org>
 <20240416-raydium-rm69380-driver-v3-1-21600ac4ce5f@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240416-raydium-rm69380-driver-v3-1-21600ac4ce5f@mainlining.org>
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

On Tue, Apr 16, 2024 at 08:30:48PM +0200, David Wronek wrote:
> Raydium RM69380 is a display driver IC used to drive OLED DSI panels.
> Add a dt-binding for it.
> 
> Signed-off-by: David Wronek <david@mainlining.org>
> ---
> Note:
> Depends on commit 48a516363e29 ("dt-bindings: display: panel: add common dual-link schema")
> ---
>  .../bindings/display/panel/raydium,rm69380.yaml    | 91 ++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
> new file mode 100644
> index 000000000000..0ac7d033cbe0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm69380.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/raydium,rm69380.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Raydium RM6380-based DSI display panels

RM69380-based

> +
> +maintainers:
> +  - David Wronek <david@mainlining.org>
> +
> +description:
> +  The Raydium RM69380 is a generic DSI panel IC used to control
> +  OLED panels.
> +
> +allOf:
> +  - $ref: panel-common-dual.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - lenovo,j716f-edo-rm69380
> +      - const: raydium,rm69380
> +    description: This indicates the panel manufacturer of the panel
> +      that is in turn using the RM69380 panel driver. The compatible
> +      string determines how the RM69380 panel driver shall be configured
> +      to work with the indicated panel. The raydium,rm69380 compatible shall
> +      always be provided as a fallback.
> +
> +  avdd-supply:
> +    description: Analog voltage rail
> +
> +  vddio-supply:
> +    description: I/O voltage rail
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: phandle of gpio for reset line - This should be active low
> +
> +  ports: true
> +  reg: true

Drop these and change 'addtionalProperties' to 'unevaluatedProperties'. 
Other properties in panel-common.yaml should be allowed. width-mm and 
height-mm for example.

> +
> +required:
> +  - compatible
> +  - reg
> +  - avdd-supply
> +  - vddio-supply
> +  - reset-gpios

> +  - ports

Already required in panel-common-dual.yaml.

Rob
