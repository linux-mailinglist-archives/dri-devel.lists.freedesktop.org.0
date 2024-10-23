Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8D19ABFF6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 09:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AB510E76B;
	Wed, 23 Oct 2024 07:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uFpJiThV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8E310E76B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 07:16:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5740C5C5CFE;
 Wed, 23 Oct 2024 07:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2659CC4CEC6;
 Wed, 23 Oct 2024 07:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729667805;
 bh=DCuXBhNSmpJbKPA1H6hyuILhm8VSuGuorecsJgBpq6o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uFpJiThVkih+4uWPi5B0JyYxg7/P2O523Ym6MKGoWnHZcyFwZkrDNXsOtr755HX2w
 Fe0NNH/BkyVjlAvgHhjy7xdP7+0O+Rit+wxkF/NvuT0eCOgy7U9V9GNlSmZnQ3Uu9p
 /aEJZ0qhkl1NoX6pmdpkwTJJSqAs6LD5W0hMR3+ubGCmCC1ZNoe3L3q2mTGvqEs/t0
 d/o16iZUlBqHkj9VOIwnkBkdNVhVV04LeUd6TrEG/ZsyhCj1VqowV6M4w1UeQbiHii
 DjkuHzQGBpqItkFCQfPrtgEN4GAXfKX+RAyRmt5HHnQ0XdI0JnK0RDU9+6dxuxFlLx
 tm/4/g8i9D/tw==
Date: Wed, 23 Oct 2024 09:16:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jakob Hauser <jahau@rocketmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 2/5] dt-bindings: display: panel: Add Samsung
 S6E88A0-AMS427AP24 bindings
Message-ID: <yvuur7pa2msafmh4my4ojtrlir3nenvyqqr2fbb5jt2bevlbm4@iqh5iokm3knx>
References: <cover.1729630039.git.jahau@rocketmail.com>
 <25370285451d9c22204dfbaa368d48c22efd1eef.1729630039.git.jahau@rocketmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <25370285451d9c22204dfbaa368d48c22efd1eef.1729630039.git.jahau@rocketmail.com>
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

On Tue, Oct 22, 2024 at 11:33:36PM +0200, Jakob Hauser wrote:
> Add bindings for Samsung AMS427AP24 panel with S6E88A0 controller.
> 
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> ---
> Patch is based on current branch drm-misc-next.
> 
> Changes in v2:
>  - Adapted property "flip-horizontal" to being moved to "panel-common.yaml".
> ---
>  .../panel/samsung,s6e88a0-ams427ap24.yaml     | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e88a0-ams427ap24.yaml
> 


A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +            #address-cells = <1>;
> +            #size-cells = <0>;

Use 4 spaces for example indentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

