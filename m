Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3683984FBCC
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 19:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A9910F913;
	Fri,  9 Feb 2024 18:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="4j8DTV+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C4310F913;
 Fri,  9 Feb 2024 18:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707502910;
 bh=F+klo6fdojqlg+YAs2CadokLdG0bO4HyDw1qUizxtOs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=4j8DTV+GTNxYkGLZ5B+b9Y6izmx8bzBAqjMWKWheDJvMXwfF2rQcY4RqUcrWnH0ja
 bMlR1gtPDoGA6eiM9bjD8yFS2QpA/i687MXj6w4L+xEvJht2lwoBvq4Pkc1xVygWKq
 TeMAG/2lIdNoR6tXVIQt3yX1nSvSvzxj+rxVXUjFAlwniLs1qlfsjDiy2CCddlUiFr
 K3N+WigVtKqeoXnXNPSe6waK4R9a0TgqLmQVs/wCay5f4pxgKzcvaIdPSUcnkhiAFG
 n6k3PGfBQBP3J+AkTKoPR606UbG3g/P0wnUMHQirdDFAx8+YR5Ww0pL16OJI31h57o
 F+wf7e1Wlv6dg==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CE55A37813FD;
 Fri,  9 Feb 2024 18:21:45 +0000 (UTC)
Message-ID: <d0cd95eb-4f16-4b48-97a4-cc74ba9f1345@collabora.com>
Date: Fri, 9 Feb 2024 15:21:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] drm/ci: arm64.config: Enable
 CONFIG_DRM_ANALOGIX_ANX7625
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniel@fooishbar.org, airlied@gmail.com, daniel@ffwll.ch,
 david.heidelberg@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240130150340.687871-1-vignesh.raman@collabora.com>
 <20240130150340.687871-2-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240130150340.687871-2-vignesh.raman@collabora.com>
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



On 30/01/2024 12:03, Vignesh Raman wrote:
> Enable CONFIG_DRM_ANALOGIX_ANX7625 in the arm64 defconfig to get
> display driver probed on the mt8183-kukui-jacuzzi-juniper machine.
> 
> arch/arm64/configs/defconfig has CONFIG_DRM_ANALOGIX_ANX7625=m,
> but drm-ci don't have initrd with modules, so add
> CONFIG_DRM_ANALOGIX_ANX7625=y in CI arm64 config.

Couldn't you load the module as it is done on
https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/ci/igt_runner.sh#n35 
?

This is not a blocker, in any case

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>    - No changes
> 
> v3:
>    - No changes
> 
> ---
>   drivers/gpu/drm/ci/arm64.config | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
> index 8dbce9919a57..37d23fd7a367 100644
> --- a/drivers/gpu/drm/ci/arm64.config
> +++ b/drivers/gpu/drm/ci/arm64.config
> @@ -187,6 +187,7 @@ CONFIG_MTK_DEVAPC=y
>   CONFIG_PWM_MTK_DISP=y
>   CONFIG_MTK_CMDQ=y
>   CONFIG_REGULATOR_DA9211=y
> +CONFIG_DRM_ANALOGIX_ANX7625=y
>   
>   # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
>   CONFIG_ARCH_TEGRA=y
