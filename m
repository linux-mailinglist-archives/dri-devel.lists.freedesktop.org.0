Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01944B300E0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 19:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BA210E049;
	Thu, 21 Aug 2025 17:19:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XlLnFvpg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E461910E049
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 17:19:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7ADEC44070;
 Thu, 21 Aug 2025 17:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCE3C4CEF4;
 Thu, 21 Aug 2025 17:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755796786;
 bh=IkEM90j9AB9fEVUaubBHggr7J8lF+yeDnZnqMajK8Pc=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=XlLnFvpguszjxbVQMQmmvQr18rAXlaCwrmPQn1BBthnaf0Nii2oICZx8GgMZoyu7W
 R0IPqBkYfHW5JpotaqQ7fLDwbei2ttpwVs0fYw2pVoKfCV+PtUeXTyKEk6W+w1ydcn
 1MJXg7djUXA7jlGcIlRY0VNEoyP3bdPw+GLzaI7qGgqJKhtYdzU8N6JwFAJoLHKG9B
 +xq0M2ZhC2DypCTCExctIizJyiol05dA+8wzxrd4ShgWCtYb5InkldWB40j/4gBCws
 06G+PJcgTbD8TPYrBul2rWtYDNolXOQm8jAott4kr8FYeioXsNJqu3wI0TY6T10IGw
 3xmysks9SZIGw==
Date: Thu, 21 Aug 2025 12:19:45 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>, 
 imx@lists.linux.dev, David Airlie <airlied@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Fabio Estevam <festevam@gmail.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
In-Reply-To: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
References: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
Message-Id: <175579643516.37357.10852050615304641702.robh@kernel.org>
Subject: Re: [PATCH 0/5] arm64: dts: imx8mp-skov: add new 10" variant
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


On Thu, 21 Aug 2025 09:55:27 +0200, Steffen Trumtrar wrote:
> Add a new board variant for the Skov i.MX8MP based family of boards.
> 
> This variant uses a different 10" panel than the existing ones.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
> Steffen Trumtrar (5):
>       dt-bindings: vendor-prefixes: Add JuTouch Technology Co, Ltd
>       dt-bindings: display: simple: Add JuTouch JT101TM023 panel
>       drm/panel: simple: add JuTouch JT101TM023
>       dt-bindings: arm: fsl: add compatible for Skov i.MX8MP variant
>       arm64: dts: imx8mp-skov: support new 10" panel board
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
>  .../bindings/display/panel/panel-simple.yaml       |  2 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
>  arch/arm64/boot/dts/freescale/Makefile             |  1 +
>  .../imx8mp-skov-revc-jutouch-jt101tm023.dts        | 79 ++++++++++++++++++++++
>  drivers/gpu/drm/panel/panel-simple.c               | 35 ++++++++++
>  6 files changed, 120 insertions(+)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-9ef9faa75514
> 
> Best regards,
> --
> Steffen Trumtrar <s.trumtrar@pengutronix.de>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de:

arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtb: touchscreen@2a (eeti,exc81w32): compatible: 'oneOf' conditional failed, one must be fixed:
	['eeti,exc81w32'] is too short
	'eeti,exc3000' was expected
	'eeti,exc80h60' was expected
	'eeti,exc80h84' was expected
	from schema $id: http://devicetree.org/schemas/input/touchscreen/eeti,exc3000.yaml#





