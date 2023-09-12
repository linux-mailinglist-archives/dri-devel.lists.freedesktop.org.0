Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19AB79D709
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 19:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CB910E44C;
	Tue, 12 Sep 2023 17:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A5310E44C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 17:02:00 +0000 (UTC)
Received: from [192.168.0.106] (unknown [186.235.7.101])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CFD3066072B4;
 Tue, 12 Sep 2023 18:01:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694538119;
 bh=sm5+is+zMEhHqe7EnrHHFL2UbWWzWkGkszkqR/V7AI0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LalD6Suk+Ksvjr+uEeVaKamf2/KVIIRDW+wLkOZj1Iu7g9MT2nSVHIFwGDcF6N5Ua
 P7EwJ6QhNOmhMxS0DOZfWAcY6sngRbfeRwdVyeS+TRPKOJAHu1svXPveHbTjiYDJlD
 0dXZ84byE0SmIZ9GyyIMXwKxDJ7nfxdh64VClNiDXQR1IHqO9RuuZkU0l4sA9L9dPE
 s1raH+ZGKw8GAXouxv3XUTfm/wHJS7YswMT0esnSAYoYBDgIxk5o6WDsaP9NtVu8E6
 Ur5FeEB/ctyIG8LYdtz84KMlh8ewDG0eW6P/AW7vpyO7ceojFdsFlEaS3szgs1CQc0
 miKMaoyVbaWmg==
Message-ID: <c7b0b363-c3cf-248b-678a-11bbb6d4503d@collabora.com>
Date: Tue, 12 Sep 2023 14:01:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 9/9] drm: ci: Use scripts/config to enable/disable
 configs
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-10-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230908152225.432139-10-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, virtualization@lists.linux-foundation.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@google.com,
 david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, agross@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, daniels@collabora.com, linux-arm-msm@vger.kernel.org,
 mripard@kernel.org, anholt@google.com, linux-mediatek@lists.infradead.org,
 robclark@freedesktop.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 dmitry.baryshkov@linaro.org, andersson@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/09/2023 12:22, Vignesh Raman wrote:
> Instead of modifying files in git to enable/disable
> configs, use scripts/config on the .config file which
> will be used for building the kernel.
> 
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> 
> v2:
>    - Added a new patch in the series to use scripts/config to enable/disable configs
> 
> v3:
>    - No changes
> 
> ---
>   drivers/gpu/drm/ci/build.sh | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 092c195af242..093929a115de 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -70,19 +70,19 @@ if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
>       fi
>   fi
>   
> -for opt in $ENABLE_KCONFIGS; do
> -  echo CONFIG_$opt=y >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
> -done
> -for opt in $DISABLE_KCONFIGS; do
> -  echo CONFIG_$opt=n >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
> -done
> -
>   if [[ -n "${MERGE_FRAGMENT}" ]]; then
>       ./scripts/kconfig/merge_config.sh ${DEFCONFIG} drivers/gpu/drm/ci/${MERGE_FRAGMENT}
>   else
>       make `basename ${DEFCONFIG}`
>   fi
>   
> +for opt in $ENABLE_KCONFIGS; do
> +    ./scripts/config --enable CONFIG_$opt
> +done
> +for opt in $DISABLE_KCONFIGS; do
> +    ./scripts/config --disable CONFIG_$opt
> +done
> +
>   make ${KERNEL_IMAGE_NAME}
>   
>   mkdir -p /lava-files/
