Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B9585BED7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3C410E479;
	Tue, 20 Feb 2024 14:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="QRLC1rnb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D5910E479
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708439645;
 bh=RYFR98PZrdUW5tXnND7sE2mKBA2iup/mUCYviaYd4VI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QRLC1rnbbccmTozwvd12UFWfsqGbxSisx4PAJeB0e7y16p2daLjO1z/aE0U5D57O8
 3ERusM50WiGSA0cgpHBLpCjgQfOy/BpNSeE5i/YxCAtqaf5+DRfNNBgM4+1If9j19b
 cuEe5xuLiL24hhklyqwZ+DUjNAd6rD2LPtCdr3gAU6tJRY6uxXUhPZZVYqhFrCeunr
 cRTcKLN4fpdmAi6F0+RPS6u++kbzOXF4b4GmC3ijfQ6pyNsMzIzj6MO3J68k9RE7y4
 WVUXG89UanHwWjrYiSJbVhi3hbEdVEwooPdsG+3yzwsAywO9Op7sPsmk1uVwtNs3nH
 SDqTXaOfNEccA==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 749053780627;
 Tue, 20 Feb 2024 14:33:57 +0000 (UTC)
Message-ID: <6e542474-906d-4ad2-9564-47fd44fe6c2d@collabora.com>
Date: Tue, 20 Feb 2024 11:33:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm: ci: arm64.config: update ONBOARD_USB_HUB to
 ONBOARD_USB_DEV
Content-Language: en-US
To: Javier Carrasco <javier.carrasco@wolfvision.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
 <20240220-onboard_xvf3500-v4-3-dc1617cc5dd4@wolfvision.net>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240220-onboard_xvf3500-v4-3-dc1617cc5dd4@wolfvision.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 20/02/2024 11:05, Javier Carrasco wrote:
> The onboard_usb_hub driver has been updated to support non-hub devices,
> which has led to some renaming.
> 
> Update to the new name (ONBOARD_USB_DEV) accordingly.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Acked-by: Helen Koike <helen.koike@collabora.com>

Regards,
Helen

> ---
>   drivers/gpu/drm/ci/arm64.config | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
> index 8dbce9919a57..4140303d6260 100644
> --- a/drivers/gpu/drm/ci/arm64.config
> +++ b/drivers/gpu/drm/ci/arm64.config
> @@ -87,7 +87,7 @@ CONFIG_DRM_PARADE_PS8640=y
>   CONFIG_DRM_LONTIUM_LT9611UXC=y
>   CONFIG_PHY_QCOM_USB_HS=y
>   CONFIG_QCOM_GPI_DMA=y
> -CONFIG_USB_ONBOARD_HUB=y
> +CONFIG_USB_ONBOARD_DEV=y
>   CONFIG_NVMEM_QCOM_QFPROM=y
>   CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
>   
> @@ -97,7 +97,7 @@ CONFIG_USB_RTL8152=y
>   # db820c ethernet
>   CONFIG_ATL1C=y
>   # Chromebooks ethernet
> -CONFIG_USB_ONBOARD_HUB=y
> +CONFIG_USB_ONBOARD_DEV=y
>   # 888 HDK ethernet
>   CONFIG_USB_LAN78XX=y
>   
> 
