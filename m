Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6104979718B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 12:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A150310E228;
	Thu,  7 Sep 2023 10:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E586410E22F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 10:46:42 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 143D166072F8;
 Thu,  7 Sep 2023 11:46:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694083601;
 bh=2hPXnQEkAUOISA9uLrJm8cZfdkF/pQpShzz3sVJQr08=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XDbzvsjyiXngBH29KcKNLuh/kqUeM1vbRDtSOTKSb8Ajfk+NEDnHE2FEdK+RpCqkz
 zaaduzHlimmMz43g+AaZoJQrIvNr/marM4fQwLjCUNahOIrEZVt5rb372yO2//kPnE
 P85dh+CkEgQFsE+h8Ao8gq5s+Fg0gzV6P2ss6wOEFpuTVidEcXz6KAhuUkBhD9S438
 AyMxKvltsDGxrz9zHhg3MAWJaISGh+0U7NrqkDH5Qr4f21Oyd13CW8/vS8GLomA86/
 yAZq7D5ZPLyDvYSywyyUnGXga0Tv381OyDxBRiZt1iv4d5losFQBa+vpmPnJ0JYDar
 i1DnriQCy/jpA==
Message-ID: <6da8136b-be1f-6867-b2af-c636877ef189@collabora.com>
Date: Thu, 7 Sep 2023 12:46:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 4/6] drm: ci: Enable configs to fix mt8173 boot hang issue
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
 <20230825122435.316272-5-vignesh.raman@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230825122435.316272-5-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, david.heidelberg@collabora.com,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com,
 corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org,
 daniels@collabora.com, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 25/08/23 14:24, Vignesh Raman ha scritto:
> Enable regulator
> Enable MT6397 RTC driver
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>   drivers/gpu/drm/ci/arm64.config | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
> index 817e18ddfd4f..ea7a6cceff40 100644
> --- a/drivers/gpu/drm/ci/arm64.config
> +++ b/drivers/gpu/drm/ci/arm64.config
> @@ -184,6 +184,8 @@ CONFIG_HW_RANDOM_MTK=y
>   CONFIG_MTK_DEVAPC=y
>   CONFIG_PWM_MTK_DISP=y
>   CONFIG_MTK_CMDQ=y
> +CONFIG_REGULATOR_DA9211=y
> +CONFIG_RTC_DRV_MT6397=y

I wonder if it'd be a better idea to simply add those to the defconfig instead as

CONFIG_REGULATOR_DA9211=m
CONFIG_RTC_DRV_MT6397=m

Any opinion on this? Matthias? Anyone else?

Cheers,
Angelo

>   
>   # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
>   CONFIG_ARCH_TEGRA=y


