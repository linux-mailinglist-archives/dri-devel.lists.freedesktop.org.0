Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7F587501E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 14:35:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092EF10F17B;
	Thu,  7 Mar 2024 13:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="tBQjMU87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5CD10F27E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 13:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709818545;
 bh=yJP/7iXYGTXtCetl/s5JdFVY3VfriXvZsF4XeIim0M0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tBQjMU87qe5jCl2C+zdTdhdh7t0yDM8aOgJHO8jGgM8emXDFFNd9rAWl3ps1+/bco
 y68F+SqpzdCj91Pgkmet7dJ4bOo4JZgOXMfNq+JbiRPJaEleahoPkH+DEAfIIsM7tF
 MWmq+5P7XRF1AVhyHtegsJT1Ps0KqXN/yeOSEV07dPzH3oKnK154TY/lN5GJl2tu0S
 fT16QQjJHTxKaC+phUdIDZAjuph9rLOznVC4Kp7OaGO1F3V58AwFHEzaA4Ejk59gt4
 Wf0GFI8VhMzrGn6ne36ZStBybICVwChX6pe1hMdRw6MGNUM2zaRIySFX/gQheJiX3S
 tJteXZOOrXgbg==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 415F13780B5F;
 Thu,  7 Mar 2024 13:35:38 +0000 (UTC)
Message-ID: <db39d0cb-71d3-48b2-87b7-f2716c72e1a1@collabora.com>
Date: Thu, 7 Mar 2024 10:35:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] drm/ci: uprev mesa version
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 emma@anholt.net, robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, mairacanal@riseup.net, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240306030649.60269-1-vignesh.raman@collabora.com>
 <20240306030649.60269-3-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240306030649.60269-3-vignesh.raman@collabora.com>
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



On 06/03/2024 00:06, Vignesh Raman wrote:
> zlib.net is not allowing tarball download anymore and results
> in below error in kernel+rootfs_arm32 container build,
> urllib.error.HTTPError: HTTP Error 403: Forbidden
> urllib.error.HTTPError: HTTP Error 415: Unsupported Media Type
> 
> Uprev mesa which includes a fix for this issue.
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/908f444e
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks
Helen

> ---
> 
> v3:
>    - New patch in series to uprev mesa.
> 
> v4:
>    - Fix checkpatch warning.
> 
> ---
>   drivers/gpu/drm/ci/container.yml  | 6 +++---
>   drivers/gpu/drm/ci/gitlab-ci.yml  | 6 +++---
>   drivers/gpu/drm/ci/image-tags.yml | 3 ++-
>   3 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/container.yml b/drivers/gpu/drm/ci/container.yml
> index 9764e7921a4f..1060eb380b02 100644
> --- a/drivers/gpu/drm/ci/container.yml
> +++ b/drivers/gpu/drm/ci/container.yml
> @@ -40,11 +40,11 @@ debian/x86_64_test-android:
>     rules:
>       - when: never
>   
> -windows_build_vs2019:
> +windows_build_msvc:
>     rules:
>       - when: never
>   
> -windows_test_vs2019:
> +windows_test_msvc:
>     rules:
>       - when: never
>   
> @@ -56,7 +56,7 @@ rustfmt:
>      rules:
>       - when: never
>   
> -windows_vs2019:
> +windows_msvc:
>      rules:
>       - when: never
>   
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 084e3ff8e3f4..bc8cb3420476 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -1,6 +1,6 @@
>   variables:
>     DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
> -  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 9d162de9a05155e1c4041857a5848842749164cf
> +  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha c4b32f9e90b7204735e6adf1f60c178bf85752e7
>   
>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>     TARGET_BRANCH: drm-next
> @@ -26,7 +26,7 @@ variables:
>     JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
>     # default kernel for rootfs before injecting the current kernel tree
>     KERNEL_REPO: "gfx-ci/linux"
> -  KERNEL_TAG: "v6.6.4-for-mesa-ci-e4f4c500f7fb"
> +  KERNEL_TAG: "v6.6.13-mesa-9916"
>     KERNEL_IMAGE_BASE: https://${S3_HOST}/mesa-lava/${KERNEL_REPO}/${KERNEL_TAG}
>     LAVA_TAGS: subset-1-gfx
>     LAVA_JOB_PRIORITY: 30
> @@ -98,6 +98,7 @@ include:
>   stages:
>     - sanity
>     - container
> +  - code-validation
>     - git-archive
>     - build
>     - amdgpu
> @@ -107,7 +108,6 @@ stages:
>     - msm
>     - rockchip
>     - virtio-gpu
> -  - lint
>   
>   # YAML anchors for rule conditions
>   # --------------------------------
> diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
> index 7ab4f2514da8..cf07c3e09b8c 100644
> --- a/drivers/gpu/drm/ci/image-tags.yml
> +++ b/drivers/gpu/drm/ci/image-tags.yml
> @@ -1,5 +1,5 @@
>   variables:
> -   CONTAINER_TAG: "2023-10-11-mesa-uprev"
> +   CONTAINER_TAG: "2022-01-29-mesa-uprev"
>      DEBIAN_X86_64_BUILD_BASE_IMAGE: "debian/x86_64_build-base"
>      DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
>   
> @@ -7,6 +7,7 @@ variables:
>      DEBIAN_BUILD_TAG: "2023-10-08-config"
>   
>      KERNEL_ROOTFS_TAG: "2023-10-06-amd"
> +   PKG_REPO_REV: "67f2c46b"
>   
>      DEBIAN_X86_64_TEST_BASE_IMAGE: "debian/x86_64_test-base"
>      DEBIAN_X86_64_TEST_IMAGE_GL_PATH: "debian/x86_64_test-gl"
