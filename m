Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99F7A15DE2
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2025 17:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4948D10E043;
	Sat, 18 Jan 2025 16:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZagNFP79";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369D010E043
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2025 16:01:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 402D5A4150B;
 Sat, 18 Jan 2025 15:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CCBC4CED1;
 Sat, 18 Jan 2025 16:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737216088;
 bh=ViqJWys7z7tzicOakO0vgP9wxpUd4p24cnmiSBZE57c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZagNFP791YPBCAus+Oa7lHcvFzN//dKNmA9krZYQgEHkeBoKSn8W7Wi1j72eDdgWs
 uSyY6HImdQxsqDUzqqpAQ8ncR8KjPgbHCXAvJeAhfFxKT3WO1OG0q28O+q16J1Vshw
 QYlS1YXVi34INaEhgM0FoJP0LmTyiEJQSuQ+uoPbLSVt2pWUhjplMS/kb85EVDkrog
 m+5Xj+dgnWjbhBMvtF2frabLZqDcjKA3QCZ6q+v3TvC9lxuxwhedttLS0MXfSlEekC
 PPv54XusLiDlC+I1JyYhs1YLBn/986tJeBzlKg1qbOuV5D0H6cqDzuDcXSXU1lfpDV
 hOGrlOK6L9gsw==
Date: Sat, 18 Jan 2025 17:01:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8370 SoC
Message-ID: <20250118-excellent-tarantula-of-rain-afaaaf@krzk-bin>
References: <20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com>
 <20250116-mt8370-enable-gpu-v1-1-0a6b78e925c8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250116-mt8370-enable-gpu-v1-1-0a6b78e925c8@collabora.com>
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

On Thu, Jan 16, 2025 at 03:25:57PM +0100, Louis-Alexis Eyraud wrote:
> This commit adds a compatible for the MediaTek MT8370 SoC, with an

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core).

Anyway, your commit msg explains "what" which is obvious. Say something
not obvious - e.g. not compatible with 8192? Why not?

> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 735c7f06c24e632ab738d062f15378f754c8adaf..6f6211950bb495fa6bfcdfe8d1e27e5ce7aeeae0 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -37,6 +37,7 @@ properties:
>            - enum:
>                - mediatek,mt8188-mali
>                - mediatek,mt8192-mali
> +              - mediatek,mt8370-mali
>            - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable

Best regards,
Krzysztof

