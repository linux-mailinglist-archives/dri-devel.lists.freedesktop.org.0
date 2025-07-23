Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D13B0EC5E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 09:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA0210E776;
	Wed, 23 Jul 2025 07:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cVEtdzHa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B9E10E787
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:51:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 784B640BE9;
 Wed, 23 Jul 2025 07:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C35FEC4CEE7;
 Wed, 23 Jul 2025 07:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753257070;
 bh=Q+DZzLQeXq9JXIC7GX8o7Zi0O1QtJSxeVxGbny17CiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cVEtdzHa6vNWTBGZKer3PPPXvD5VZup9OSpAd1JD4c5bW5wCj6qCb5a07jVH4D5qP
 YGGGpIoMsMSYFdjlvxpRwQ/ZCELSMWfp3C8EIgcaT280VjSosK5dz9omkNyXjAmIsf
 aEQUJ3V0trc9yuderfBi25edGI3ZdWx+Ln4upGifkcH1na2JLIT4M1dV1Rbt9vXU9U
 tg2LboijtSOvV1f3jeLjj+o0oBnDRZYDCdfoR2Fb/mE/osa5bMOG9DcpN2psqDKreu
 x7OALIIPwT7j+QRtX+07PsRLa+SKLgcghZcnwCp8yAWHgqZAn08Nty2oVIP5qXcUEO
 RkUkso6RYs9Rw==
Date: Wed, 23 Jul 2025 09:51:07 +0200
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
Subject: Re: [PATCH v2 02/15] dt-bindings: display: sprd: add memory-region
 property
Message-ID: <20250723-resilient-prophetic-termite-be9f2e@kuoka>
References: <20250722-ums9230-drm-v2-0-054276ec213d@abscue.de>
 <20250722-ums9230-drm-v2-2-054276ec213d@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250722-ums9230-drm-v2-2-054276ec213d@abscue.de>
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

On Tue, Jul 22, 2025 at 04:41:04PM +0200, Otto Pfl=C3=BCger wrote:
> Explain that the DPU node supports a memory-region property that can be
> used to describe an initial framebuffer set up by the bootloader,
> usually in order to create a passthrough mapping for this framebuffer
> when the IOMMU is used.
>=20
> Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>
> ---
>  .../devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml        | 8 ++=
++++++
>  1 file changed, 8 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

