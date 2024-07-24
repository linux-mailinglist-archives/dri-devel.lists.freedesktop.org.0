Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404BF93AAAF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 03:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CA410E253;
	Wed, 24 Jul 2024 01:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bIU1JCCo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A19310E1F1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 01:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721785658;
 bh=oKiy0vzmxtpMoFbrfKXC8aS7iHyuYLQXZUZy/OTXrtQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bIU1JCCo0ZjjV2oKKqf/VP10+BngWmEVEY6dYRIimvJEKWUvkip/kx+sCSCn190kb
 R6xRhXTZjtnATnEDoBFcP1eR7yHvQ7mqXJ0eGnbXKAN3v7ZWTNTeqrd33XnXca9Zim
 g+9ibXfb6ktIKD8SXB2ZRRbF4+Wr0xXA2iW+m/yLymTvjRevSyZVHWZIUNFI8kCX1Q
 hcXqMlLN9u2K5ugqisxjT+mZbcPmhxqC2VZxt/aP/pjeBiLibsIHmy8AjRe5QDORvF
 vez2LOEXgwXYj+RfWefAH3dGwJtg67gxlX8fDox7f5Ftbf9ZyfYEIX6GEE4K8FXIFu
 KB4xsTzYDuMHA==
Received: from [10.3.2.176] (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1AE91378202D;
 Wed, 24 Jul 2024 01:47:32 +0000 (UTC)
Message-ID: <e0f08def-df6a-4a29-bd56-c0449d970b44@collabora.com>
Date: Tue, 23 Jul 2024 22:47:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] drm/ci: mediatek: add tests for powervr gpu driver
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 deborah.brouwer@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240712091549.56635-1-vignesh.raman@collabora.com>
 <20240712091549.56635-4-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240712091549.56635-4-vignesh.raman@collabora.com>
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



On 12/07/2024 06:15, Vignesh Raman wrote:
> For mediatek mt8173, the display driver is mediatek, while the
> gpu driver is powervr. Currently, in drm-ci for mt8173, only the
> display driver is tested. Add support in drm-ci to test powervr
> driver for mt8173. Powervr driver was merged in linux kernel,
> but there's no mediatek support yet. So disable the powervr:mt8173
> job which uses powervr driver.
> 
> Also update the MAINTAINERS file to include xfails for powervr driver.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v6:
>    - New patch in the series. Split powervr changes into a new commit.
> 
> v7:
>    - No changes.
> 
> ---
>   MAINTAINERS                      |  1 +
>   drivers/gpu/drm/ci/gitlab-ci.yml |  1 +
>   drivers/gpu/drm/ci/test.yml      | 14 ++++++++++++++
>   3 files changed, 16 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f3783f2269ff..05f72eaf5267 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10778,6 +10778,7 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>   F:	Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
>   F:	Documentation/gpu/imagination/
> +F:	drivers/gpu/drm/ci/xfails/powervr*
>   F:	drivers/gpu/drm/imagination/
>   F:	include/uapi/drm/pvr_drm.h
>   
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 9d800f629f08..ca7f873bc2d4 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -122,6 +122,7 @@ stages:
>     - meson
>     - msm
>     - panfrost
> +  - powervr
>     - rockchip
>     - software-driver
>   
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 219eca5ef24c..86875fb96eb5 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -294,6 +294,11 @@ amdgpu:stoney:
>     variables:
>       DRIVER_NAME: mediatek
>   
> +.powervr-gpu:
> +  stage: powervr
> +  variables:
> +    DRIVER_NAME: powervr
> +
>   .panfrost-gpu:
>     stage: panfrost
>     variables:
> @@ -322,6 +327,15 @@ mediatek:mt8173:
>       - .mt8173
>       - .mediatek-display
>   
> +powervr:mt8173:
> +  extends:
> +    - .mt8173
> +    - .powervr-gpu
> +  rules:
> +    # TODO: powervr driver was merged in linux kernel, but there's no mediatek support yet
> +    # Remove the rule once mediatek support is added for powervr
> +    - when: never

well, we could leave to add it later, but I don't mind adding like this 
for now.

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> +
>   mediatek:mt8183:
>     extends:
>       - .mt8183

