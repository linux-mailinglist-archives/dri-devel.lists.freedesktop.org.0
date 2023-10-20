Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 188777D0609
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 03:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F3210E56E;
	Fri, 20 Oct 2023 01:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B5210E56E;
 Fri, 20 Oct 2023 01:11:02 +0000 (UTC)
Received: from [IPV6:2804:14d:e646:872b:8302:9b9b:d59b:1681] (unknown
 [IPv6:2804:14d:e646:872b:8302:9b9b:d59b:1681])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1C1D5660734B;
 Fri, 20 Oct 2023 02:10:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697764261;
 bh=ywMJzRW3dw4Ip1emXFLkn9DL28UP7yqyfBt07XAkUdI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fqngVhTGDaHGK4trzmLA4hsqTQ2b592YleV+hbSSGfKOziARe5MhGPZyTGekkxPE0
 oO48m6MRHnLU6x8NaHCbe2rGHVJfbFAEJElkYl0KwrYUmjdOqsvTRRslH9NV+mGf00
 MWKc2clZlOZUTR+zoO8vcZjpJg48JVie5LrpyMI6JhaL9RD6CUdMdS9cEhYv55BcUr
 6feXfX+AaQyHeZZAKAFpiPUL+cye3dD8Bfw1QVvUEqWWeabc6eTCK0fBfDPdf1IgcW
 ZX6byhGn96IEX1d0ggLy5IulUw7LizQxoeH9fNHgBGEMII+p82EKv7UnfA0TAEmFXS
 Ju8ZwJe6ZzF+g==
Message-ID: <9e0607dd-ffaf-4751-887c-cac1a450e6d8@collabora.com>
Date: Thu, 19 Oct 2023 22:10:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/ci: pick up -external-fixes from the merge target
 repo
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231008132320.762542-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231008132320.762542-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/10/2023 10:23, Dmitry Baryshkov wrote:
> In case of the merge requests it might be useful to push repo-specific
> fixes which have not yet propagated to the -external-fixes branch in the
> main UPSTREAM_REPO. For example, in case of drm/msm development, we are
> staging fixes locally for testing, before pushing them to the drm/drm
> repo. Thus, if the CI run was triggered by merge request, also pick up
> the -external fixes basing on the the CI_MERGE target repo / and branch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Helen Koike <helen.koike@collabora.com>

Thanks!

> ---
>   drivers/gpu/drm/ci/build.sh | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 7b014287a041..20a6ba8a7b04 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -64,10 +64,15 @@ if [ "$(git ls-remote --exit-code --heads ${UPSTREAM_REPO} ${TARGET_BRANCH}-exte
>   fi
>   
>   # Try to merge fixes from local repo if this isn't a merge request
> +# otherwise try merging the fixes from the merge target
>   if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
>       if [ "$(git ls-remote --exit-code --heads origin ${TARGET_BRANCH}-external-fixes)" ]; then
>           git pull origin ${TARGET_BRANCH}-external-fixes
>       fi
> +else
> +    if [ "$(git ls-remote --exit-code --heads ${CI_MERGE_REQUEST_PROJECT_URL} ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}-external-fixes)" ]; then
> +        git pull ${CI_MERGE_REQUEST_PROJECT_URL} ${CI_MERGE_REQUEST_TARGET_BRANCH_NAME}-external-fixes
> +    fi
>   fi
>   
>   for opt in $ENABLE_KCONFIGS; do
