Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93D8992414
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 08:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B633810E1CE;
	Mon,  7 Oct 2024 06:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="baWekIS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781E210E1CE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 06:03:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6EFE95C5677;
 Mon,  7 Oct 2024 06:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4C2C4CEC6;
 Mon,  7 Oct 2024 06:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728280994;
 bh=T1bREH4yDLWyE4xjZyozN2Zb3J6IlRSP3pWJSlbvkmc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=baWekIS/fyExGpr5aHbhxTGF7PnGZ2UrnXL6xio6nsLVb4Pr8ZsUVp8+LJHs1Dq1A
 APcM1gKdbC0uiusVWSbPslE5gXxACFZBtaSwuSnG1seal/2LF6VmvcyhcEy4kGSInV
 OfN4aXoZom5qMAdb0LuKpuWjg2Kq9WrZp7k34JSu6Pb7L9j674xFMBLr+uOSQI0Az3
 P2yqPDlcZIHejz3If046VBcIBZalID12cfyVOgglAuK60dgUUFpJLQtFgv+XMrXdws
 IsFSkWaUQZsX3TvTt+76kNFQ/BTCCedLBfACfVxi5mmGYKosQKcPt4NufFHWToNJkz
 OlyxgPwrfpaDg==
Date: Mon, 7 Oct 2024 08:03:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH v5] dt-bindings: display: mediatek: split: add subschema
 property constraints
Message-ID: <tiduxmxji7nmlatceor2cmjy4xh7e36bvt6c6hygkkzots3kgm@ibwqoxij37g3>
References: <20241007022834.4609-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241007022834.4609-1-moudy.ho@mediatek.com>
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

On Mon, Oct 07, 2024 at 10:28:34AM +0800, Moudy Ho wrote:
> The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
> to an excessively long 'clocks' property:
>   display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long
> 
> To resolve this issue, the constraints for 'clocks' and
> other properties within the subschemas will be reinforced.
> 
> Fixes: 739058a9c5c3 ("dt-bindings: display: mediatek: split: add compatible for MT8195")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> 
> --
> This is based on [v2] dt-bindings: display: mediatek: split: add clocks count constraint for MT8195

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

