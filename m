Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C59FD9BE
	for <lists+dri-devel@lfdr.de>; Sat, 28 Dec 2024 11:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A62210E23A;
	Sat, 28 Dec 2024 10:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FePsOUxE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D467110E23A
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 10:07:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6AD5B5C45E6;
 Sat, 28 Dec 2024 10:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B8EC4CECD;
 Sat, 28 Dec 2024 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735380467;
 bh=/4bgWVBd69cDnBnv2kPWPDo7b8Wmhz/t9s4lQNfpEkg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FePsOUxEHorR0kyGbcVZsELjlzRTe9KEsN+2LD5f3YkMAmJN8Om6O+6yy3/gmrWH+
 4s9w4sfHfmp9Dgi51VThztmA1O/pT3ZniRnDjzG8IYOAToZcn3C99+xVJPgNDvzv5M
 xDa9xD7xc1zjIBYORL1DE00FqCfSkmTlO4ZoTsX0uKRpExk9jxNwuRLgOIRfCrsvBk
 c4G3FuJfTbH2V/7nbRpZ5YZ9jzFLT/tQjFYF+7F6c+qq+9bpuDXBon894BhAiYmIMs
 9vBoOG1D9tOt4FH8c91t6C6dJr+bS6diWi9iguUvM6ZJT/j1rsfJ9dUuI/pgFgVphv
 XucKQHukH/9Iw==
Date: Sat, 28 Dec 2024 11:07:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Singo Chang <singo.chang@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fei Shao <fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: mediatek: ovl: Add
 compatible strings for MT8188 MDP3
Message-ID: <364cot4pxfneirzw5cc3oazy4dpvgmze67gsncpqi7kz7sqadr@qjd2buftiwtr>
References: <20241219181531.4282-1-jason-jh.lin@mediatek.com>
 <20241219181531.4282-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219181531.4282-2-jason-jh.lin@mediatek.com>
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

On Fri, Dec 20, 2024 at 02:15:28AM +0800, Jason-JH.Lin wrote:
> Add compatible strings for the MDP3 OVL hardware components in
> MediaTek's MT8188 SoC and it is compatible with the existing
> MT8195 MDP OVL components.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml     | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

