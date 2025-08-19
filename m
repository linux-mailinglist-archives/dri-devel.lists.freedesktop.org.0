Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD7CB2BA15
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 09:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9CF010E537;
	Tue, 19 Aug 2025 07:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RoKW1Wu3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40B2410E53B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 07:03:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 46672613AE;
 Tue, 19 Aug 2025 07:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DAAC4CEF1;
 Tue, 19 Aug 2025 07:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755586997;
 bh=S4IyDFs7hEifzpd1r/UNQubC95KrtZm4g/kMrDKhJog=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RoKW1Wu3W6HRRvUn79l3AoXgAIiBS94KAHSVS+Pmg+G63Hmo8pd4sHf3kvoIU5/yI
 yXLe8fDf8tG2zR7XUi61syAajNVWoi5podcBh2k5RfyX4IgwspzHQezgaiEeS8NLg8
 JnjyLEz4MjoJGiwqp8K25knN8O6WJZaqdfLhr7lm9mSqRet20O+QeYTT4bfwOq0FPU
 nBY6ysErioFskxvyafDOBLlrzgZ6LJwo+R7Xhuv1pVE1hmik1sU+QW8wRxDNYrrTrq
 I9dcJ7GFqKK5OOp0zzti/oJDMMFVPki/lX9G9H9rWBDj+uRrpDz1LM6/DjHf2s83WV
 TlGaV6QoAgqhg==
Date: Tue, 19 Aug 2025 09:03:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI
 TMDS181 and SN65DP159 bindings
Message-ID: <20250819-mandrill-of-imminent-hurricane-a3c6d8@kuoka>
References: <20250819053205.9976-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.f1878466-8551-4b5d-bf2e-1706e377d436@emailsignatures365.codetwo.com>
 <20250819053205.9976-2-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250819053205.9976-2-mike.looijmans@topic.nl>
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

On Tue, Aug 19, 2025 at 07:31:14AM +0200, Mike Looijmans wrote:
> Add DT binding document for TI TMDS181 and SN65DP159 HDMI retimers.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> 
> ---
> 
> Changes in v2:
> Document driver specific bindings like slew-rate and threshold
> 
>  .../bindings/display/bridge/ti,tmds181.yaml   | 143 ++++++++++++++++++
>  1 file changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
> new file mode 100644
> index 000000000000..816bea54846f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
> @@ -0,0 +1,143 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,tmds181.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TMDS181 and SN65DP159 HDMI retimer/redriver chips
> +
> +maintainers:
> +  - Mike Looijmans <mike.looijmans@topic.nl>
> +
> +description: |
> +  Texas Instruments TMDS181 and SN65DP159 retimer and redriver chips.
> +  https://www.ti.com/product/TMDS181
> +  https://www.ti.com/product/TMDS181
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tmds181
> +      - ti,sn65dp159

Nothing improved, you did not respond to review, you did not say why it
is not implemented in changelog. You did not explain that choice in
commit msg, either.

Best regards,
Krzysztof

