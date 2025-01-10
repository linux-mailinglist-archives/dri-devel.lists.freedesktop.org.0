Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E61A09687
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 16:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DAD10E08B;
	Fri, 10 Jan 2025 15:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NEvyIBtR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5E410E08B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 15:57:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E42B55C0FE0;
 Fri, 10 Jan 2025 15:56:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6422CC4CED6;
 Fri, 10 Jan 2025 15:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736524629;
 bh=Zepb3Xf1LqvXqepzt+MhmKK6OG5jBl8iAJLNE0dVQPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NEvyIBtRig1NynjUKr+d72gORi8xggQKkHvmTDwaw+mxp6ygcL0HqICFfzPh84x3Z
 LsJY2EfD8qZPaOR8yGe4MxG4lwmy4wziMf4LNwY33JkuVXED7L2c+QHfb9j8A7Wq1J
 Tr6CQHqBQxP2XUEimgcLM6KrYb4Q0q/Bndd8xIW1y32DUGOGJwOKAz5EJd+YhfIpIJ
 XkrhSUFBUN6AG28zCvbRnoJYIymyJY+Pt1P68yuiveXnp2xvXXDS4jf+JkNG7/4Zxl
 du9aEo6KNrAuqISmeSYHyXfkMRZpVCxVR4ntT3PxWZvGRbF/03xLiO3dZVjvHsn+kp
 Y5qJP2Z4A3XNg==
Date: Fri, 10 Jan 2025 09:57:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, tzimmermann@suse.de,
 jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 mripard@kernel.org, ck.hu@mediatek.com, p.zabel@pengutronix.de,
 jie.qiu@mediatek.com, junzhi.zhao@mediatek.com,
 lewis.liao@mediatek.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, krzk+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 jason-jh.lin@mediatek.com, dmitry.baryshkov@linaro.org, airlied@gmail.com
Subject: Re: [PATCH v4 08/34] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
Message-ID: <173652462808.2939128.70242417447514107.robh@kernel.org>
References: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
 <20250108112744.64686-9-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108112744.64686-9-angelogioacchino.delregno@collabora.com>
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


On Wed, 08 Jan 2025 12:27:18 +0100, AngeloGioacchino Del Regno wrote:
> Add a binding for the HDMI TX v2 Encoder found in MediaTek MT8195
> and MT8188 SoCs.
> 
> This fully supports the HDMI Specification 2.0b, hence it provides
> support for 3D-HDMI, Polarity inversion, up to 16 bits Deep Color,
> color spaces including RGB444, YCBCR420/422/444 (ITU601/ITU709) and
> xvYCC, with output resolutions up to 3840x2160p@60Hz.
> 
> Moreover, it also supports HDCP 1.4 and 2.3, Variable Refresh Rate
> (VRR) and Consumer Electronics Control (CEC).
> 
> This IP also includes support for HDMI Audio, including IEC60958
> and IEC61937 SPDIF, 8-channel PCM, DSD, and other lossless audio
> according to HDMI 2.0.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8195-hdmi.yaml        | 151 ++++++++++++++++++
>  1 file changed, 151 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

