Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44692B10250
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 09:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EF910E8B1;
	Thu, 24 Jul 2025 07:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tENqBHs8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D3A10E8B1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 07:51:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3414A61126;
 Thu, 24 Jul 2025 07:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D03C4CEF1;
 Thu, 24 Jul 2025 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753343508;
 bh=ErnTdWvBlsIk3cNIsW0L5yIKseGJrQ0UPFbxni/vZzQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tENqBHs8828cUQ4ui2dUhyyHuBSZRH4nYKG35YZNzxtwZPo2zq5e4y65IkrhZc/Y3
 i/zHPxqyhn5d0tLSbHEotT5feLe11dIWUpaEynleGuBmbjHWNuddHU+dp73nzl3jzV
 NGgPJfT6P7CwsmDjYnqO5KzELN1k/MtULB1NBQA2yhicP9qhxSaki5cOzRDYnYoSRs
 w1XQLYMpiCoW8BPkoSANfAyx1YhOAGWOND538pHjpHDWuWjLRm+x23GVR2JvxntuVN
 iFxSJULwKBbWcI0+JkeqQNHQOIzCiFxuUXKRmtYWbeRF31QNI1+Ay045eqCQx1BHpV
 f0LrzcUe9vy7w==
Date: Thu, 24 Jul 2025 09:51:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alicja Michalska <alicja.michalska@9elements.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: panel: Add Samsung EA8076 panel
Message-ID: <20250724-ancient-stork-of-youth-e56533@kuoka>
References: <20250723145208.338162-2-alicja.michalska@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723145208.338162-2-alicja.michalska@9elements.com>
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

On Wed, Jul 23, 2025 at 04:52:08PM +0200, Alicja Michalska wrote:
> Add bindings for Samsung EA8076 LCD panel.
> This panel was usually used in mid-high end smartphones manufactured by
> Xiaomi in 2018 and 2019 (Mi 9 Lite and Mi Mix 3, with codenames
> "xiaomi-pyxis" and "xiaomi-perseus", respectively).
> 
> Signed-off-by: Alicja Michalska <alicja.michalska@9elements.com>
> ---
>  .../display/panel/samsung,ea8076.yaml         | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml b/Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml
> new file mode 100644
> index 000000000000..7ea0c9fedfa4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,ea8076.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,ea8076.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung EA8076 1080x2340 AMOLED panel
> +
> +description: EA8076 panel manufactured by Samsung Display. It's used in some Xiaomi smartphones from 2018 and 2019, such as xiaomi-pyxis or xiaomi-perseus.

Please carefully follow Linux kernel coding style.

> +
> +maintainers:
> +  - Alicja Michalska <alicja.michalska@9elements.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,ea8076
> +
> +  reg:
> +    maxItems: 1
> +
> +  te-gpios: VSync GPIO pin, usually GPIO_ACTIVE_LOW.
> +  reset-gpios: Reset GPIO pin, usually GPIO_ACTIVE_LOW.
> +
> +  port: Required on platforms using MDSS DSI (Qualcomm).

None of above look like anything else in the bindings. Obviously also
never tested. Please don't write code which is completely different than
everything else.

Best regards,
Krzysztof

