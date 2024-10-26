Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2079B1813
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 14:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730D710E0A3;
	Sat, 26 Oct 2024 12:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M966C2s3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA4C10E0A3
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 12:29:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 72ABDA404FF;
 Sat, 26 Oct 2024 12:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E8BC4CEC6;
 Sat, 26 Oct 2024 12:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729945771;
 bh=VClkAG3c65E/gr35A/dNFa0Wc2zsZ7kJuGAtv35fRzg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M966C2s38U2mEEPkXjC/f2JaVJaQHs+2nFHVy2lZ9GlIea9bDTn7rOzCzW67KPUBH
 H2emhzV1Jj6of1DgHx/1z6kgQwfxE9nWHbmIDsSHL4IZgr6EOkF2kC/1cLGpp0dXmP
 QBXHTB5xc1nvyjuvc07Yd2q3lmdATdcGr0WeuR6UJMEtNbdUjHM1BgDuxkX2qL+vst
 dJzp/k3CLwJaexhZs9UP3KS0I8KRu+nxVx1Kyhr0Q7bgHdWt0nwU9VxKQjlItVK7Hy
 ESw6W6lEb0B5tsVpO49KeaCF0vKpGX2ES94YJl9kT+seVwjBcWerqeb3u6XDl6XwSg
 w6zGpb13afOhw==
Date: Sat, 26 Oct 2024 14:29:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Neil Armstrong <neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: add YAML schema for
 LXD M9189A
Message-ID: <m2jrr3stleuals5iadxn6yu5j77wxufavvdqo3e7244ckefrk5@kbvo6fbsref2>
References: <20241025141130.3179166-1-r.czerwinski@pengutronix.de>
 <20241025141130.3179166-2-r.czerwinski@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025141130.3179166-2-r.czerwinski@pengutronix.de>
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

On Fri, Oct 25, 2024 at 04:11:28PM +0200, Rouven Czerwinski wrote:

A nit, subject: drop second/last, redundant "YAML schema for". The
"dt-bindings" prefix is already stating that these are bindings in
schema and YAML.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> +++ b/Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/lxd,m9189a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LXD M9189A DSI Display Panel
> +
> +maintainers:
> +  - Rouven Czerwinski <r.czerwinski@pengutronix.de>
> +
> +properties:
> +  compatible:
> +    const: lxd,m9189a
> +
> +  reg:
> +    maxItems: 1
> +
> +  standby-gpios:
> +    description: GPIO used for the standby pin
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO used for the reset pin
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Power regulator
> +
> +  backlight:
> +    description: Backlight used by the panel
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  port: true

This misses it's definition. You should reference proper panel schema in
top-level.

Best regards,
Krzysztof

