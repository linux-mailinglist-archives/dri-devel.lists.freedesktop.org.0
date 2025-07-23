Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2CFB0EC5D
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 09:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE58810E769;
	Wed, 23 Jul 2025 07:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XCsnbH7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F93710E769
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:50:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 36F3F45484;
 Wed, 23 Jul 2025 07:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4CFC4CEE7;
 Wed, 23 Jul 2025 07:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753257049;
 bh=lzWaQkjxmsu7IqOdyc0IoMA9UA/T4fQw0xa0uVHdN5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XCsnbH7tkJ3fA55vcvIrc1x/s0cVkuZZziTsdAMGCMYQ5Sk9lsagAMWksGc5Q9Tch
 dP1HwLwUoJ8PAJdxrnjzENeuYBIsVVtZagzBlgI2nTH7T3iES288jE0/dxHS/IKJN1
 +mkCy+bF5zINWe1hL6Yh43/0NlQIoAxjhkJRun3/Ym3z/3qx2mzQDfzuI8IdPKumP0
 qmCEGS1JGZbqiDjQYVmj5LmeYdZ4JHMXC90e+ybhn/9xCGcjNR6thy8any23F19YU2
 SgP/HzoDKENFLbVQbb9UktkaZf9iNwJVBcyowZl/X/N1VdgT7T+qams/05fjiIiFHP
 5WkKqTgMmRFFg==
Date: Wed, 23 Jul 2025 09:50:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Kevin Tang <kevin.tang@unisoc.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/15] dt-bindings: display: sprd: adapt for UMS9230
 support
Message-ID: <20250723-eager-shark-of-fruition-e3237e@kuoka>
References: <20250722-ums9230-drm-v2-0-054276ec213d@abscue.de>
 <20250722-ums9230-drm-v2-1-054276ec213d@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250722-ums9230-drm-v2-1-054276ec213d@abscue.de>
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

On Tue, Jul 22, 2025 at 04:41:03PM +0200, Otto Pfl=C3=BCger wrote:
> Add the compatible strings for the display controller found in the
> UMS9230 SoC and introduce more descriptive names for the clocks.
>=20
> Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> ---
>  .../bindings/display/sprd/sprd,sharkl3-dpu.yaml    | 24 +++++++++++++++-=
------
>  .../display/sprd/sprd,sharkl3-dsi-host.yaml        | 15 ++++++++++----
>  2 files changed, 28 insertions(+), 11 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-=
dpu.yaml b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.=
yaml
> index 8c52fa0ea5f8ee2149ebf1d4b0d5b052832e3d97..7f34652080b22e7b7072a709f=
d390a72375110ef 100644
> --- a/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
> +++ b/Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
> @@ -16,7 +16,12 @@ description: |
> =20
>  properties:
>    compatible:
> -    const: sprd,sharkl3-dpu
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sprd,ums9230-dpu
> +          - const: sprd,sharkl3-dpu
> +      - const: sprd,sharkl3-dpu
> =20
>    reg:
>      maxItems: 1
> @@ -28,9 +33,14 @@ properties:
>      maxItems: 2
> =20
>    clock-names:
> -    items:
> -      - const: clk_src_128m
> -      - const: clk_src_384m
> +    oneOf:
> +      - deprecated: true
> +        items:
> +          - const: clk_src_128m
> +          - const: clk_src_384m
> +      - items:
> +          - const: core
> +          - const: dpi

This should be rather a separate change with its own explanation. You
are affecting/changing existing binding and new device bringup should
usually not affect it. Same with second file.

Changes are fine, just split to clearly see the impact on existing
binding.

Best regards,
Krzysztof

