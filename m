Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF23A4634E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 15:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FEB10E339;
	Wed, 26 Feb 2025 14:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Y3O8nXPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF9810E339
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 14:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1740581050;
 bh=uivpGYnMITpEj35IWFS3e6SZBEcAepq6IYr/jgT8xxA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y3O8nXPlFuMbbm2lLP04DxJMw0UiY4ZTQTx3Xqt8LLAyYCwg+UyeMA0Yw7eGBqBke
 HrWY1m67MzuFUiyGMlY5stNfZftX3uLSZ7Szi0xFuALlzAbWFmq5CQ0Eb5F6QASKEz
 HYhEeOSO6UrJlb6sQgEQC3uTJ7F40wCC7VqliJm+tZx4mRRz4ymjBSkVsFNHbwPNY4
 kNJtTO7VrEqgRKCDBSqmwUVqOlS9jxUlstNWTDq40QdwStcbnDvg7borXdvxqBwoI/
 hQQ/Cem4UFNo5ZG1Uuc4LqWwAwu6tTdE2qUVz2Mh6Cs1mCIX98loWQA6AO6tl9qErn
 yKZOcY1VzpJoA==
Received: from [192.168.50.250] (unknown [171.76.83.32])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0EFEE17E065E;
 Wed, 26 Feb 2025 15:44:06 +0100 (CET)
Message-ID: <be797713-3d0e-410b-988f-dbeb45d630de@collabora.com>
Date: Wed, 26 Feb 2025 20:14:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ci: extend python-artifacts timeout
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 daniels <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250226-ci-python-timeout-v1-1-0a9092a3d6fb@linaro.org>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20250226-ci-python-timeout-v1-1-0a9092a3d6fb@linaro.org>
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

Hi,

On 26/02/25 14:05, Dmitry Baryshkov wrote:
> The job has a timeout of 10 minutes, which causes a build failures as it
> is even unable to clone the repo within the specified limits. Extend
> the job's timeout to 1 hour.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/ci/build.yml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/build.yml b/drivers/gpu/drm/ci/build.yml
> index 274f118533a7a1a0a4b8a768298fec624bfe67c2..e8d466c319275724687b8581c086b5ab352c3cd1 100644
> --- a/drivers/gpu/drm/ci/build.yml
> +++ b/drivers/gpu/drm/ci/build.yml
> @@ -210,3 +210,6 @@ windows-msvc:
>   yaml-toml-shell-py-test:
>     rules:
>       - when: never
> +
> +python-artifacts:
> +  timeout: 1h

Acked-by: Vignesh Raman <vignesh.raman@collabora.com>

Regards,
Vignesh

> 
> ---
> base-commit: 130377304ed09e54ff35a8974372498aad7059f3
> change-id: 20250226-ci-python-timeout-7167d2c2985a
> 
> Best regards,

