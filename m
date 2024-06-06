Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E17B8FEA81
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 16:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842AA10E984;
	Thu,  6 Jun 2024 14:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="r7BAfZHj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59C710E96C;
 Thu,  6 Jun 2024 14:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717683616;
 bh=zl8eenjF8axi0TjToHHC1WFVOpk/lRB+7SvAzh0uTpk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=r7BAfZHjzt3EsaNP6MIavVp790kypBU38mJ6+ADpd+btQibB6Ivdao/TenF73zSeC
 RrziFWUMzKhIgAzAqqiproCPJXyMEs7JxHxIt9gXlZIp0AwtSUIcV1DT4q4hMpk2wl
 3AhfBSHW+PbdUU7SoiJIVZ/m+Z2Ijpeu29/X1d67O/AyyCTofghKm41nQBofqBQnV6
 OAjWKwEA7Sk4HOmkkVhMV87oOzpMrrihT9CZLqC5RhgoTv89A0KP2mTJyv5kVy0yD7
 jr2tEiQRsQPaAgCahTXBK5W1I080C3DAcrejYPrW+xlN4wbMiyxmRNw5f5A7WDSlNb
 6J6hgbnSto7CA==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id AC6D737821DF;
 Thu,  6 Jun 2024 14:20:09 +0000 (UTC)
Message-ID: <06547f0b-3512-4194-b9ff-22710cb203b6@collabora.com>
Date: Thu, 6 Jun 2024 11:20:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/ci: uprev IGT
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dmitry.baryshkov@linaro.org, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-5-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240529024049.356327-5-vignesh.raman@collabora.com>
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



On 28/05/2024 23:40, Vignesh Raman wrote:
> test-list.txt and test-list-full.txt are not generated for
> cross-builds and they are required by drm-ci for testing
> arm32 targets. This is fixed in igt-gpu-tools. So uprev
> IGT to include the commit which fixes this issue. Also
> disable building xe driver tests for non-intel platforms.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>


> ---
> 
> v2:
>    - Split IGT uprev to seperate patch.
> 
> v3:
>    - No changes.
> 
> ---
>   drivers/gpu/drm/ci/build-igt.sh  | 4 ++++
>   drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
> index b7d2a49a6db3..eddb5f782a5e 100644
> --- a/drivers/gpu/drm/ci/build-igt.sh
> +++ b/drivers/gpu/drm/ci/build-igt.sh
> @@ -45,6 +45,10 @@ MESON_OPTIONS="-Doverlay=disabled                    \
>                  -Dlibunwind=enabled                   \
>                  -Dprefix=/igt"
>   
> +if [[ "$KERNEL_ARCH" = "arm64" ]] || [[ "$KERNEL_ARCH" = "arm" ]]; then
> +    MESON_OPTIONS="$MESON_OPTIONS -Dxe_driver=disabled"
> +fi
> +
>   mkdir -p /igt
>   meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
>   ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 8f32de63d92e..1b29c3b6406b 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>     TARGET_BRANCH: drm-next
>   
> -  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
> +  IGT_VERSION: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56
>   
>     DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>     DEQP_RUNNER_GIT_TAG: v0.15.0
