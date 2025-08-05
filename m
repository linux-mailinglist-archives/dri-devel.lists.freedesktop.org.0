Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F780B1AE6F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 08:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1202710E5E2;
	Tue,  5 Aug 2025 06:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vOetwG6w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D4A10E5E2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 06:36:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 01DC25C646D;
 Tue,  5 Aug 2025 06:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB18C4CEF4;
 Tue,  5 Aug 2025 06:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754375760;
 bh=sIHPITH9zG/L0PbzCUmZDWaszbXx38hkA/bHt1tkCsY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vOetwG6wjPaFORrkROIrDOatq5ormVU2vdtjv/cTfRt7ABu2cGpYaG7vuXplt88PO
 eKnp/n+o346f6/YG8oB0r+bYIfWKNkbsnmX+moad9d9FBnPPpmHy/EUXFx4NgLHNtx
 ucu3PxmCL14qKSC1XJlI9SENNJMRxUivtYlWFKW+ongQ7WgRYC9uAtSV41x2PE8zHP
 m/Lz5HNXUpJPaTn7ZgTHnrUFAF8qwvfwH4HGRn7Vrm+Z+7NUxXbpxVBjhaL/zzqzdc
 IQfC4RvRWmK8w2Hq2+tZKGZ9PNcDLQCQ/t08gO4s/GcwGBq4BWIthFB+6lAEzlJ+jY
 BGGAuyxnJFixg==
Date: Tue, 5 Aug 2025 08:35:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, victor.liu@nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 
 p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
 shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: display: imx: add HDMI PAI for i.MX8MP
Message-ID: <20250805-realistic-hawk-of-merriment-f84ef2@kuoka>
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250804104722.601440-2-shengjiu.wang@nxp.com>
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

On Mon, Aug 04, 2025 at 06:47:17PM +0800, Shengjiu Wang wrote:
> Add binding for the i.MX8MP HDMI parallel Audio interface block.
> 
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
> 
> Aud2htx module in Audio Subsystem, HDMI PAI module and HDMI TX
> Controller compose the HDMI audio pipeline.
> 
> In fsl,imx8mp-hdmi-tx.yaml, add port@2 that is linked to pai_to_hdmi_tx.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

