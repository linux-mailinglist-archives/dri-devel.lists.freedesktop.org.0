Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38768A40EA4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2025 12:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784F710E298;
	Sun, 23 Feb 2025 11:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cI+ElpLL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73DB10E298
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 11:54:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3EF8C61132;
 Sun, 23 Feb 2025 11:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE79CC4CEDD;
 Sun, 23 Feb 2025 11:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740311647;
 bh=0rnegyoPhqtqI/UJ60gCJqaehQ7iPihQkGs6eKBlSN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cI+ElpLL/qJfgJxNnUNOmBczNjq9lWIGYZFthMAmWkmcpI6GHvhelbY6hqi9j7kKI
 20IeqTzUQSxtDfSqL77T1rvXI2EiULA0ZuzsuVJPU/SrvDG7T7qcxXY0gMT9YF3BKb
 CsWooQguIOtQ/nh3DZfCjIKXbT4vgR1+v/3hjjtXrUUwSlJWKXmp+79zj8VSRtpKX7
 U0lENZofBwmErHzIckb61qmMripfXj6WLG8o+N1KM/S+aXoU687ZXq1bI/JwFsWrt8
 5WSJ79xhqaIgbjAHvZZ8BZgq+B/JzNUST+yHbGikHkZRzE/O2l5CIzNuY8k2BAMUlD
 KDgYPe9YXBQhg==
Date: Sun, 23 Feb 2025 12:54:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: panel: Add Himax HX83112B
Message-ID: <20250223-tricky-saffron-rattlesnake-aaad63@krzk-bin>
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
 <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>
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

On Sat, Feb 22, 2025 at 06:58:05PM +0100, Luca Weiss wrote:
> Himax HX83112B is a display driver IC used to drive LCD DSI panels.
> Describe it and the Fairphone 3 panel from DJN using it.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e6bd4b33d40be98e479d84617aea6d2af0df70e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/himax,hx83112b.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Himax HX83112B-based DSI display panels
> +
> +maintainers:
> +  - Luca Weiss <luca@lucaweiss.eu>
> +
> +description:
> +  The Himax HX83112B is a generic DSI Panel IC used to control
> +  LCD panels.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: djn,fairphone-fp3-panel

Why no himax,hx83112b fallback?

Best regards,
Krzysztof

