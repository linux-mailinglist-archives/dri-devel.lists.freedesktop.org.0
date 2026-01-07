Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40075CFC864
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 09:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8041C10E262;
	Wed,  7 Jan 2026 08:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VRKfMx6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EFA10E262
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 08:09:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 59C7D6013B;
 Wed,  7 Jan 2026 08:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 832A8C19421;
 Wed,  7 Jan 2026 08:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767773395;
 bh=ajQh5xwyIUiPk6njRYV0Vzjv0iajQSfQ2ZGc3atANlE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VRKfMx6vjOo9h9yhZpDZqZdJSD70uRbJ3GK7RNu+8rRz1c6riOdQ1tix5PE6CImPj
 7oLxRouZI+GcNIsdW5o1SXm/WlHKFOaISXFKYwGLlcj7xgf0tDR5Ye5vh7ZgAlu2Zl
 TRP7bSm52duRKcVQHOy9g9bedtmCWrySS09hBjC3Ed3Yue0ERduiWTtfyTmIS/hJ2o
 KuG9FTddpis3C5DfcRWRBmV+jvyHG9tx1VJI9m1DX/HYuSnMHnWMJxluomPcSAxMFn
 6ghN6ZUGQbRIA6GMiiYijFt37KmXzJtKD4KhhD5ktbezENAT5hMP56zDQ8BPpOyRog
 QuJffmEZQfi7g==
Date: Wed, 7 Jan 2026 09:09:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] dt-bindings: ili9806e: add Rocktech
 RK050HR345-CT106A display
Message-ID: <20260107-remarkable-wildebeest-of-maturity-0aac66@quoll>
References: <20260106154446.2735701-1-dario.binacchi@amarulasolutions.com>
 <20260106154446.2735701-3-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260106154446.2735701-3-dario.binacchi@amarulasolutions.com>
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

On Tue, Jan 06, 2026 at 04:43:15PM +0100, Dario Binacchi wrote:
> @@ -29,12 +30,29 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - vdd-supply
> -  - vccio-supply
>    - reset-gpios
>    - backlight
>    - port
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - rocktech,rk050hr345-ct106a
> +then:
> +  $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +  properties:
> +    spi-max-frequency: true

This two lines are not needed.

> +
> +  required:
> +    - spi-max-frequency

How does it work without any supplies?

> +else:
> +  required:
> +    - vdd-supply
> +    - vccio-supply

Best regards,
Krzysztof

