Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583337BD193
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 02:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFD810E211;
	Mon,  9 Oct 2023 00:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2289810E211
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 00:58:20 +0000 (UTC)
Received: from [192.168.0.206] (unknown [179.221.49.143])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AD2D7660708F;
 Mon,  9 Oct 2023 01:58:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696813098;
 bh=iyqhwDnwF7AwvV3O9cDzUHraQOQU1oAC4hzX35F7zQM=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=MN47zg4+4104956De6zL8c1SNn/B7MmIE738bjzkHbD6edynqU4Dtgc7mgLlFrSsw
 XJFX7lSNM99wAvI8KNPfCXKiP9hGKWjhrlVdYbr/wMVlV1Ci0aE5KOcpekJi3wKsdT
 ZHamkq/tirA/TZUMCYWVPa+km7wVDykZvoWLzx5maXwGQ9y52ORmSlLUSJc/mVjG9s
 kUTLR/z0JjuizfKbnJ2BVpbb9ftA25FuCMdmcqBRg13+2X/YlxZ58ThowL5OTTwC33
 W0+Ab6S1S1PUfw1DDHHJqlERBBnqyn3nZpz2qbPsn4OX5pAbeWn3u943yzbRJqRLD1
 BdEUW+HHC1bHQ==
Message-ID: <b29d0a17-b7cb-4b41-b23c-7e26e363ca5f@collabora.com>
Date: Sun, 8 Oct 2023 21:58:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/ci: uprev mesa version - fix container build
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org
References: <20230922171237.550762-1-helen.koike@collabora.com>
 <20230922171237.550762-2-helen.koike@collabora.com>
In-Reply-To: <20230922171237.550762-2-helen.koike@collabora.com>
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
Cc: rodrigosiqueiramelo@gmail.com, michel.daenzer@mailbox.org,
 vignesh.raman@collabora.com, quic_abhinavk@quicinc.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, melissa.srw@gmail.com, mairacanal@riseup.net,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear maintainers,

Do not pick this patch, I re-sent it as part of the series
	[PATCH 0/9] drm/ci: fixes and improvements

https://lists.freedesktop.org/archives/dri-devel/2023-October/425909.html

Thanks
Regards,
Helen

On 22/09/2023 14:12, Helen Koike wrote:
> When building containers, some rust packages were installed without
> locking the dependencies version, which got updated and started giving
> errors like:
> 
> error: failed to compile `bindgen-cli v0.62.0`, intermediate artifacts can be found at `/tmp/cargo-installkNKRwf`
> Caused by:
>    package `rustix v0.38.13` cannot be built because it requires rustc 1.63 or newer, while the currently active rustc version is 1.60.0
> 
> A patch to Mesa was recently added fixing this error, so update it.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---
> 
> v2:
> - point to upstream mesa/mesa (solved the TODO and removed RFC tag)
> ---
>   drivers/gpu/drm/ci/gitlab-ci.yml  | 15 ++++++++++++++-
>   drivers/gpu/drm/ci/lava-submit.sh |  2 +-
>   2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 2c4df53f5dfe..522f83db1a07 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -1,6 +1,6 @@
>   variables:
>     DRM_CI_PROJECT_PATH: &drm-ci-project-path mesa/mesa
> -  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 0dc961645c4f0241f8512cb0ec3ad59635842072
> +  DRM_CI_COMMIT_SHA: &drm-ci-commit-sha 1cdc4be14b66108ae0e8069686ac3efe52bef3cb
>   
>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>     TARGET_BRANCH: drm-next
> @@ -24,6 +24,8 @@ variables:
>     PIPELINE_ARTIFACTS_BASE: ${S3_HOST}/artifacts/${CI_PROJECT_PATH}/${CI_PIPELINE_ID}
>     # per-job artifact storage on MinIO
>     JOB_ARTIFACTS_BASE: ${PIPELINE_ARTIFACTS_BASE}/${CI_JOB_ID}
> +  # default kernel for rootfs before injecting the current kernel tree
> +  KERNEL_IMAGE_BASE: https://${S3_HOST}/mesa-lava/gfx-ci/linux/v6.4.12-for-mesa-ci-f6b4ad45f48d
>   
>     LAVA_JOB_PRIORITY: 30
>   
> @@ -86,6 +88,17 @@ include:
>         - '/.gitlab-ci/container/gitlab-ci.yml'
>         - '/.gitlab-ci/test/gitlab-ci.yml'
>         - '/.gitlab-ci/lava/lava-gitlab-ci.yml'
> +      - '/src/microsoft/ci/gitlab-ci-inc.yml'
> +      - '/src/gallium/drivers/zink/ci/gitlab-ci-inc.yml'
> +      - '/src/gallium/drivers/crocus/ci/gitlab-ci-inc.yml'
> +      - '/src/gallium/drivers/softpipe/ci/gitlab-ci-inc.yml'
> +      - '/src/gallium/drivers/llvmpipe/ci/gitlab-ci-inc.yml'
> +      - '/src/gallium/drivers/virgl/ci/gitlab-ci-inc.yml'
> +      - '/src/gallium/drivers/nouveau/ci/gitlab-ci-inc.yml'
> +      - '/src/gallium/frontends/lavapipe/ci/gitlab-ci-inc.yml'
> +      - '/src/intel/ci/gitlab-ci-inc.yml'
> +      - '/src/freedreno/ci/gitlab-ci-inc.yml'
> +      - '/src/amd/ci/gitlab-ci-inc.yml'
>     - drivers/gpu/drm/ci/image-tags.yml
>     - drivers/gpu/drm/ci/container.yml
>     - drivers/gpu/drm/ci/static-checks.yml
> diff --git a/drivers/gpu/drm/ci/lava-submit.sh b/drivers/gpu/drm/ci/lava-submit.sh
> index 0c4456b21b0f..379f26ea87cc 100755
> --- a/drivers/gpu/drm/ci/lava-submit.sh
> +++ b/drivers/gpu/drm/ci/lava-submit.sh
> @@ -22,7 +22,7 @@ cp "$SCRIPTS_DIR"/setup-test-env.sh results/job-rootfs-overlay/
>   
>   # Prepare env vars for upload.
>   section_start variables "Variables passed through:"
> -KERNEL_IMAGE_BASE_URL="https://${BASE_SYSTEM_HOST_PATH}" \
> +KERNEL_IMAGE_BASE="https://${BASE_SYSTEM_HOST_PATH}" \
>   	artifacts/ci-common/generate-env.sh | tee results/job-rootfs-overlay/set-job-env-vars.sh
>   section_end variables
>   
