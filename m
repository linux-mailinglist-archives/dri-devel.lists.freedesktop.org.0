Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B2A7B58D0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 19:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3B510E07C;
	Mon,  2 Oct 2023 17:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533B510E0C8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 17:39:57 +0000 (UTC)
Received: from [192.168.68.123] (unknown [177.98.17.243])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C96EB6607079;
 Mon,  2 Oct 2023 18:39:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696268395;
 bh=pO6SXFnbuDL8KRe7IF+DPw70jf9y7/3XfB4CaFiUT+o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NfbH6euN4AD/tIGPGbm5G3jkEu2nEpyp73QHuIqQWCL/h2MkOq8ER+b6tWYGk/fSg
 /CviPxXf4XqPzQpaenCNQpm8jqiIC7r/xJx5mYsDMkklbjRubfjpbJyGduUkn9LOSh
 egMmfmOQQd6h6nq/Ck9tX+wAbLr2jRrsyHf33jeSjQKnEBGGEYFM4NJIKnfKq7q+KK
 a7oPiCiaWLExmIYMQRoEWZoR+RTtjpOm57k+ZXqOpKcGd2wwIpoBSVBeCA0/PGjXfl
 7p8+CNXR4CeB4LA+cLCuljfv2paXFWbh6XoSVCCfTfw2DTYDLWVpTp/3ckSzeVfgbs
 dlBRjy0p52Jjw==
Message-ID: <008e7532-1650-15ca-8b31-5acb88a7305b@collabora.com>
Date: Mon, 2 Oct 2023 14:39:48 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/ci: Enable CONFIG_BACKLIGHT_CLASS_DEVICE
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231002164715.157298-1-robdclark@gmail.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231002164715.157298-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 02/10/2023 13:47, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Dependency for CONFIG_DRM_PANEL_EDP.  Missing this was causing the drm
> driver to not probe on devices that use panel-edp.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Thank you a lot!

Now sc7180, apq8096 and sdm845 are probing!

Tested-by: Helen Koike <helen.koike@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>   drivers/gpu/drm/ci/arm.config   | 1 +
>   drivers/gpu/drm/ci/arm64.config | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/arm.config b/drivers/gpu/drm/ci/arm.config
> index 871f4de063ad..411e814819a8 100644
> --- a/drivers/gpu/drm/ci/arm.config
> +++ b/drivers/gpu/drm/ci/arm.config
> @@ -24,6 +24,7 @@ CONFIG_DRM_LIMA=y
>   CONFIG_DRM_PANEL_SIMPLE=y
>   CONFIG_PWM_CROS_EC=y
>   CONFIG_BACKLIGHT_PWM=y
> +CONFIG_BACKLIGHT_CLASS_DEVICE=y
>   
>   CONFIG_ROCKCHIP_CDN_DP=n
>   
> diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
> index 817e18ddfd4f..45f9deb7c4f6 100644
> --- a/drivers/gpu/drm/ci/arm64.config
> +++ b/drivers/gpu/drm/ci/arm64.config
> @@ -26,6 +26,7 @@ CONFIG_DRM_ETNAVIV=y
>   CONFIG_DRM_I2C_ADV7511=y
>   CONFIG_PWM_CROS_EC=y
>   CONFIG_BACKLIGHT_PWM=y
> +CONFIG_BACKLIGHT_CLASS_DEVICE=y
>   
>   CONFIG_ROCKCHIP_CDN_DP=n
>   
