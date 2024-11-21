Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AAD9D48FD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 09:39:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3071A10E895;
	Thu, 21 Nov 2024 08:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AKsvwfjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7902810E898
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 08:39:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 10096A40311;
 Thu, 21 Nov 2024 08:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E740C4CECC;
 Thu, 21 Nov 2024 08:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732178373;
 bh=SUvWzbHGe7kApkeBmO6P2id2KlN/J7nuQhPn4eL2GIA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AKsvwfjAZ6SGQoFQEVeGNmAIkbQkY477sov7z1nGhsTVAXulxrk7umXUn1ZbJDzha
 e5YoQG1nbBXnmLiBCX6ASPmve/V5n3WjfecR2IO8hDKD9M0l4zmVk+iE1DOVaANvUr
 A2pHOMwTsvZRVr+/A/LK1XVstnPv+1cm06LIaGicbSL2uVIItj3HaVGtwVdpQT2DlT
 JtaizkXMAwgtphjzkdHVqijdl/q08BiE6MO4TfPraoP/zBgYWICw+bVE9iFumkAN+k
 2ZFsN93OCPMBkuJgnLxmpvxgVCd3z4l0b5/i4yToeGONZoLtxKTO2IiqCv7iFArc2l
 1Oog9ipylULig==
Date: Thu, 21 Nov 2024 09:39:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject: Re: [PATCH v1 1/6] dt-bindings: display: mediatek: dpi: Add MT8195
 and MT8188 compat
Message-ID: <tutddhqzp37frzi7fkvljrjemfwfmcfgv44eetaalodc5pmauc@h4hklzisfyfk>
References: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
 <20241120124420.133914-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241120124420.133914-2-angelogioacchino.delregno@collabora.com>
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

On Wed, Nov 20, 2024 at 01:44:15PM +0100, AngeloGioacchino Del Regno wrote:
> Add compatibles for the Digital Parallel Interface (DPI) block
> found in the MT8195 and MT8188 SoCs: inside of the chip, this one
> is directly connected to the HDMI block.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

