Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E0BB82636
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 02:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6966A10E0BC;
	Thu, 18 Sep 2025 00:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="phoUyoSI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE9010E0BC
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 00:38:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A2AEF6000A;
 Thu, 18 Sep 2025 00:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15C7C4CEE7;
 Thu, 18 Sep 2025 00:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758155504;
 bh=iIdI2nVYChT/3mg+w2hb4SPCTU6Zg+BJCAlX2qIxdvI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=phoUyoSIsHrZEp6LjQPs6tpELvmBp1F/OF8DNkAF6mX+9iz49xnhMFKH5GIIJByin
 DfDEQ9zCNVpDYz1bW7XCUm2Ew9AOpex6Qf4xkJOApkRA44A0RHRc8QQkrJOB4rY5Q9
 2jI1XAaM7aMZs974De+dE42iEnmQTXzH+B+qheaE5/U55esheQbE0WFdm6mUv0VMw5
 L7L4CqmJFo3QUojPzCXh6BUfGWwZZzyLRU7PIKA1+8CntOCQEOTwXHQobP9RHHiy/n
 RYS4psHc6q+7Vkb/Zwhsk96jKWhpHVOJi0Z0yHg2DG17I3xLX46KIa3byYRA4M7z3D
 tDIAdFUVDiROg==
Date: Thu, 18 Sep 2025 09:31:42 +0900
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 02/10] dt-bindings: devfreq: add mt8196-gpufreq binding
Message-ID: <20250918-silent-dragon-of-gaiety-fdbfe3@kuoka>
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
 <20250917-mt8196-gpufreq-v3-2-c4ede4b4399e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250917-mt8196-gpufreq-v3-2-c4ede4b4399e@collabora.com>
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

On Wed, Sep 17, 2025 at 02:22:33PM +0200, Nicolas Frattaroli wrote:
 +
> +  shmem:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the shared memory region of the GPUEB MCU
> +
> +  "#performance-domain-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - mboxes
> +  - mbox-names
> +  - shmem
> +  - "#performance-domain-cells"

Keep same order as in "properties:" block.

> +
> +additionalProperties: false

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

