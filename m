Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B05EACC779
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D9710E5E9;
	Tue,  3 Jun 2025 13:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eqF5A5mX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBFD10E5E9
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 13:16:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 20185A501FF;
 Tue,  3 Jun 2025 13:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42B93C4CEED;
 Tue,  3 Jun 2025 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748956576;
 bh=nstVo8eSXrU+/4uZGunLaKdaHwxK+tYzrOakrG9UyJA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eqF5A5mXEgvowYk9pJ3rD7fX2QllYIVcA2u/tvhbO5/LHLZHII9snpzvmQeV00pAG
 gcuMnDuvpWuWVNLNODRTP43dWcpQ+Ly13FwHtEcRaEfT/sFF3aZjKm3BiuEgWr7obe
 rdXcRF+siS9fxgA7XEQAESFyFBBVS38IzwUjtRMK8yzBgSEI10Mk2G7tCGfaprPe3y
 JnoaRsuV8a244UTag7slrbnuS1zyGnWGpwrNqJt37DpuPFzxh34yKcAqZcaiyYh8ls
 HF69WN1BNycfIhoRFc8Kw5Y+hxGBsguSO1O4apT6Ii1+PGx1ecT0p2qzlNqtcf4nO9
 S/bZVYIrhl9mQ==
Date: Tue, 3 Jun 2025 15:16:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/8] dt-bindings: gpu: Add TH1520 GPU compatible to
 Imagination bindings
Message-ID: <20250603-sparkling-cryptic-pony-218cf0@kuoka>
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222406eucas1p117082ce4f06921f71bbc442c47e58574@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-4-83d5744d997c@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530-apr_14_for_sending-v3-4-83d5744d997c@samsung.com>
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

On Fri, May 30, 2025 at 12:23:51AM GMT, Michal Wilczynski wrote:
> Update the img,powervr-rogue.yaml device tree bindings to include the
> T-HEAD TH1520 SoC's specific GPU compatible string.
> 
> The thead,th1520-gpu compatible, along with its full chain
> img,img-bxm-4-64, and img,img-rogue, is added to the
> list of recognized GPU types. This allows the Imagination DRM driver
> to correctly bind to the GPU node defined in the TH1520 device tree.

If there is going to be any new version:

Last sentence feels redundant or obvious. That's the point of DT anyway,
so not need to state that. I suggest dropping it or replacing with some
hardware description.

A nit, subject: drop second/last, redundant "to Imagination bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
Use proper prefix, so:
dt-bindings: gpu: img,powervr-rogue: Add foo bar

> 
> The power-domains property requirement for img,img-bxm-4-64 is also
> ensured by adding it to the relevant allOf condition.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 4450e2e73b3ccf74d29f0e31e2e6687d7cbe5d65..c12837a0d39b8c3043b9133d444cc33a59135c33 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -26,6 +26,11 @@ properties:
>                - ti,j721s2-gpu
>            - const: img,img-bxs-4-64
>            - const: img,img-rogue
> +      - items:
> +          - enum:
> +              - thead,th1520-gpu
> +          - const: img,img-bxm-4-64

We keep ordering by fallbacks, so this should go above items with
img,img-bxs-4-64 fallback (m < s).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

