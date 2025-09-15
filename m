Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757CEB57641
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D319310E3E6;
	Mon, 15 Sep 2025 10:28:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="REVdteII";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B32510E3E6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757932119;
 bh=8n9FqdKAgrwmYf0BHJUpaUHH3bU99zzrrCZ0GEcFdS0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=REVdteIIvx54Df7GqfJTCin3R50a91VyELGvPhw7tHe6qWEzrveD6LJlN4JqltnjJ
 KYPhBfIS17eOPbR8E9V/89V18k82k2kz5z4evGXrAbdmXbc5ljH4fViuxVLZozxaF2
 c7ZzaCLGY1FrK74cxC/d3z5kVGW0wBO+IbjobV3thkWm1pOY3+EtUdzadbGPlWqGaj
 Xy4LrJvB7JYnK5CPyRsi/Py9rN67cASTnB8k7GtXS+7vpo49HNXooVCsmwUa4xh+ZV
 N5qC3H+gg7BIoZ0GwG4OOFELmf3T1IHdhsG/HuzPWRDB54cWVflbqPxxa5myrtC+hm
 GSqV0RFH/ml5Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 411EA17E0109;
 Mon, 15 Sep 2025 12:28:38 +0200 (CEST)
Message-ID: <4deaa48e-adbf-4072-93a2-499a065965da@collabora.com>
Date: Mon, 15 Sep 2025 12:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] dt-bindings: devfreq: add mt8196-gpufreq binding
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
 <20250912-mt8196-gpufreq-v2-2-779a8a3729d9@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250912-mt8196-gpufreq-v2-2-779a8a3729d9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 12/09/25 20:37, Nicolas Frattaroli ha scritto:
> On the MediaTek MT8196 SoC, the GPU has its power and frequency
> dynamically controlled by an embedded special-purpose MCU. This MCU is
> in charge of powering up the GPU silicon. It also provides us with a
> list of available OPPs at runtime, and is fully in control of all the
> regulator and clock fiddling it takes to reach a certain level of
> performance. It's also in charge of enforcing limits on power draw or
> temperature.
> 
> Add a binding for this device in the devfreq subdirectory, where it
> seems to fit in best considering its tasks.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   .../bindings/devfreq/mediatek,mt8196-gpufreq.yaml  | 113 +++++++++++++++++++++
>   1 file changed, 113 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/devfreq/mediatek,mt8196-gpufreq.yaml b/Documentation/devicetree/bindings/devfreq/mediatek,mt8196-gpufreq.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9d9efd4e70f1ef7ae446c833c15144beb9641b16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/devfreq/mediatek,mt8196-gpufreq.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/devfreq/mediatek,mt8196-gpufreq.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MFlexGraphics Performance Controller
> +
> +maintainers:
> +  - Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> +
> +description: |
> +  A special-purpose embedded MCU to control power and frequency of GPU devices
> +  using MediaTek Flexible Graphics integration hardware.
> +
> +properties:
> +  $nodename:
> +    pattern: '^performance-controller@[a-f0-9]+$'
> +
> +  compatible:
> +    enum:
> +      - mediatek,mt8196-gpufreq
> +
> +  reg:
> +    items:
> +      - description: GPR memory area
> +      - description: RPC memory area
> +      - description: SoC variant ID register
> +
> +  reg-names:
> +    items:
> +      - const: gpr
> +      - const: rpc
> +      - const: hw_revision

hw-revision

> +
> +  clocks:
> +    items:
> +      - description: main clock of the embedded controller (EB)
> +      - description: core PLL
> +      - description: stack 0 PLL
> +      - description: stack 1 PLL
> +
> +  clock-names:
> +    items:
> +      - const: eb
> +      - const: mfgpll
> +      - const: mfgpll_sc0

What about using a bit more generic clock names?

main, gpu-core, gpu-stack0, gpu-stack1

...or something along that line :-)

> +      - const: mfgpll_sc1
> +
> +  mboxes:
> +    items:
> +      - description: FastDVFS events
> +      - description: frequency control
> +      - description: sleep control
> +      - description: timer control
> +      - description: frequency hopping control
> +      - description: hardware voter control
> +      - description: FastDVFS control
> +
> +  mbox-names:
> +    items:
> +      - const: fast-dvfs-event
> +      - const: gpufreq
> +      - const: sleep
> +      - const: timer
> +      - const: fhctl
> +      - const: ccf
> +      - const: fast-dvfs
> +
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
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mediatek,mt8196-clock.h>
> +
> +    gpufreq: performance-controller@4b09fd00 {

You're not using any phandle to gpufreq in this example, are you?

Drop that `gpufreq: ` :-)

> +        compatible = "mediatek,mt8196-gpufreq";
> +        reg = <0x4b09fd00 0x80>,
> +              <0x4b800000 0x1000>,
> +              <0x4b860128 0x4>;
> +        reg-names = "gpr", "rpc", "hw_revision";
> +        clocks = <&topckgen CLK_TOP_MFG_EB>,
> +                 <&mfgpll CLK_MFG_AO_MFGPLL>,
> +                 <&mfgpll_sc0 CLK_MFGSC0_AO_MFGPLL_SC0>,
> +                 <&mfgpll_sc1 CLK_MFGSC1_AO_MFGPLL_SC1>;
> +        clock-names = "eb", "mfgpll", "mfgpll_sc0",
> +                      "mfgpll_sc1";
> +        mboxes = <&gpueb_mbox 0>, <&gpueb_mbox 1>, <&gpueb_mbox 2>,
> +                 <&gpueb_mbox 3>, <&gpueb_mbox 4>, <&gpueb_mbox 5>,
> +                 <&gpueb_mbox 7>;
> +        mbox-names = "fast-dvfs-event", "gpufreq", "sleep", "timer", "fhctl",
> +                     "ccf", "fast-dvfs";
> +        shmem = <&gpufreq_shmem>;
> +        #performance-domain-cells = <0>;
> +    };
> 

