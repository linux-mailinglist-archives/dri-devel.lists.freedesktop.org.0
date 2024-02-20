Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4AE85BECF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE92110E448;
	Tue, 20 Feb 2024 14:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lFHkbs+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6348310E435;
 Tue, 20 Feb 2024 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708439508;
 bh=UB9n+2vXmx8kSjWpZUtThzJ8/Wjk4SVOdwSVTMPgOJ4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lFHkbs+aPr2vz+EUKwa8ItHSSBP/sE0Dn2pHgOw2NFQd2Hpibq9zDdmFds8qIgDiZ
 jeLT6IndiVLJmUF1fgEhRjCJwI3EYu1UrhTcH5KaLSpdL1MxQDT5OsvexXCXt5FBBo
 R9CfhBklKwDIrDXfNAfkfZBrnBSrplt8D58S4ESE8LBbpTua1o6FNgPgL9cxaXxWJE
 VcYef0VqS3x5XccnmsSlGFwYwGJBMMdyjfnccdBMVyWOsoGQO1VXTogu4zkNYfmgGp
 tXl+wExwfdHOlfMdrOQfX2Fh8USsUUEGlLVeirz8VbtRhngxW7fBJdvRPrIFmCiA+s
 K8fSVM0sesbfw==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 89C2F3780627;
 Tue, 20 Feb 2024 14:31:44 +0000 (UTC)
Message-ID: <54a3f3d9-ad3e-4828-96c0-61dd81c61d76@collabora.com>
Date: Tue, 20 Feb 2024 11:31:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: ci: uprev IGT
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20240220121741.2994222-1-dmitry.baryshkov@linaro.org>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240220121741.2994222-1-dmitry.baryshkov@linaro.org>
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



On 20/02/2024 09:17, Dmitry Baryshkov wrote:
> Bump IGT revision to pick up Rob Clark's fixes for the msm driver:
> 
> - msm_submit@invalid-duplicate-bo-submit,Fail
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Do you have a gitlab pipeline link I can check?

Thanks
Helen

> ---
>   drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 8b82e6656924..47e567b4f7a7 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>     UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>     TARGET_BRANCH: drm-next
>   
> -  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
> +  IGT_VERSION: 3f2879fef93c0c546a2f1c0aa48a9cc2a594b9d2
>   
>     DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>     DEQP_RUNNER_GIT_TAG: v0.15.0
