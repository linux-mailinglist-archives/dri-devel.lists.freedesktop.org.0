Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 999BEA5DEEA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 15:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73FC10E786;
	Wed, 12 Mar 2025 14:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Tl3nEoNd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B140910E786
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 14:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741789559;
 bh=D30yYcLGzCKJP0xV33q/0S+ufxFtV0zBn7R8mUrRc9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tl3nEoNdxDokHqsqyV8dCb3k39ooik8vJ4denOVETXReAYKWE06x+vVqe32mEGkyM
 /dnJqbP4i//hctFThaVzNPfIFYkRpQhWFaIeAI5izl173G5cPZu9QCFq9cPgmwXaPZ
 WwXb+tH+xvAlia5PWDVFrKenP3JkcdafO5U4j3/7HRcAi0bHYfLD38zfiqpXXylWTf
 sRzFBu6uOYskRDnQadlKCPhDsII0MsENDzj6AbhfeOLYGkw2G2u++8Jq1XCGlaEugP
 Msl6PAhIu4WTkNN8nn2Yx9DsCrskwlLCttJc4S/p+BrGS9sonRFgt9Lvr3OStHraEY
 YZywoGLxZ0/ng==
Received: from notapiano (unknown [70.107.117.78])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F59517E1134;
 Wed, 12 Mar 2025 15:25:57 +0100 (CET)
Date: Wed, 12 Mar 2025 11:25:54 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: linux-mediatek@lists.infradead.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 krzk@kernel.org, daniels@collabora.com, airlied@gmail.com,
 simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: defconfig: mediatek: enable PHY drivers
Message-ID: <5706c76e-7558-4405-a4c6-cab9cb5ddf65@notapiano>
References: <20250312041943.25676-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250312041943.25676-1-vignesh.raman@collabora.com>
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

On Wed, Mar 12, 2025 at 09:49:26AM +0530, Vignesh Raman wrote:
> The mediatek display driver fails to probe on mt8173-elm-hana and
> mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
> configurations.
> 
> Enable the following PHY drivers for MediaTek platforms:
> - CONFIG_PHY_MTK_HDMI=m for HDMI display
> - CONFIG_PHY_MTK_MIPI_DSI=m for DSI display
> - CONFIG_PHY_MTK_XSPHY=m for USB
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Include board details in the commit message.  
>   - Sort newly added PHY configs in defconfig.
> 
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 1f25423de383..87e8cbd3fd26 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1572,7 +1572,10 @@ CONFIG_PHY_HI6220_USB=y
>  CONFIG_PHY_HISTB_COMBPHY=y
>  CONFIG_PHY_HISI_INNO_USB2=y
>  CONFIG_PHY_MVEBU_CP110_COMPHY=y
> +CONFIG_PHY_MTK_HDMI=m
> +CONFIG_PHY_MTK_MIPI_DSI=m

This isn't the expected ordering. I imagine you manually added these configs in
the defconfig.

To get the right ordering, after you've added the configs anywhere in this
defconfig, do a 'make defconfig', then a 'make savedefconfig', and copy the
generated 'defconfig' file at the root to this location, then you can add just
this hunk to the commit, and it'll be in the correct order.

Thanks,
Nícolas
