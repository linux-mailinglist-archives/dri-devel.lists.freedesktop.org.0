Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6890EC13A9B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 10:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF1410E5C3;
	Tue, 28 Oct 2025 09:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fWKmH91f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9AC10E5C3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 09:00:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F1E3C443C8;
 Tue, 28 Oct 2025 09:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49AD3C4CEE7;
 Tue, 28 Oct 2025 09:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761642033;
 bh=rZ4NQKQCLrbiX4zUi8bRocWHIWn3QwuUM+myMdN/DI4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fWKmH91fKqGtdl9lsayw35svBXtixc0YgYQVpuIVL9pV3DyVI4ORJsSFIQJ6+TAjL
 mwtHeqgdSesSUYZPa8eQPhQ+WLFLpDNuRwGR8zjohAwM4FDUvR4zwfjjk5WqMkrMfP
 /0ie3QweE1xAT7iov3Jl8fEMazj1vSI85Km1nxoi18ebyoueCbsmN+3FFRYPiDwguS
 Es/Vka2CmLvy5ZsCb90LXqp7lTuXfy5lscQa8tnB5hkoRnt3II2VVOouuHkmVfzB0e
 wU4QETD4dROrAf25zaUsYknU6tnD4fPGfXr03WMdBuJJlyVF4HPXCnfGPcVxDl5BX5
 vSHxEvZG/OzvQ==
Date: Tue, 28 Oct 2025 10:00:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/10] dt-bindings: arm: fsl: Add binding for various
 solidrun imx8 boards
Message-ID: <20251028-truthful-dexterous-hyena-d3d4c5@kuoka>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-1-683f86357818@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027-imx8mp-hb-iiot-v1-1-683f86357818@solid-run.com>
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

On Mon, Oct 27, 2025 at 06:48:10PM +0100, Josua Mayer wrote:
> Add bindings for various SolidRun boards:
> 

A nit, subject: drop second/last, redundant "binding for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

> - i.MX8MP HummingBoard IIoT - based on the SolidRun i.MX8M Plus SoM
> - SolidSense N8 - single-board design with i.MX8M Nano
> - i.MX8M Mini System on Module
> - i.MX8M Mini HummingBoard Ripple
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

