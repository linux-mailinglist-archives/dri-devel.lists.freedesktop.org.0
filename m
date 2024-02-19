Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D4685A64F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 15:47:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3E8B10E321;
	Mon, 19 Feb 2024 14:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cySjdgUM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286A410E2EB;
 Mon, 19 Feb 2024 14:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708354073;
 bh=Hmaa3EnGuZHGu+zcLLz2TFZJ80IkfVjQgChNdwVLing=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cySjdgUMOZU1spJTIjh+5efu6dmrO8TTGqpBPmqIWEVQYjEPb7FfEcYjhncdh4Hd/
 PHC5vKTSPY6bYYz8inSiKC406aC8sMptI5oaaJ31JTtGLsqqrtbN97Tg+8yFnmA1wp
 0hT+YIh8aLk6BI+hmuz+qj1eDV1Jn3mRCPfMIJ5pGSYCb1dPA4eC5BVvbwMDl94f9j
 nY6UGpfj75h2aUO1ZkIWMMMBn2CkhNXn//HZ6saLiaGy9UNq8gJCVDoNeZ+2QBk4oG
 ZwTeUQXHxsO//ri48GHhU3KrOSMcThTe0XuEFwH/GwMd+KbIebRBiuS/ckTZDXKI/Q
 WRDv62oZcrhdA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DCF4237820C3;
 Mon, 19 Feb 2024 14:47:50 +0000 (UTC)
Message-ID: <0a120b86-702a-8dd2-9554-e1ccda7cee62@collabora.com>
Date: Mon, 19 Feb 2024 20:17:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/ci: skip suspend tests for both msm-sc7180 machines
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helen Koike <helen.koike@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
References: <20240216205650.2446153-1-dmitry.baryshkov@linaro.org>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20240216205650.2446153-1-dmitry.baryshkov@linaro.org>
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


On 17/02/24 02:26, Dmitry Baryshkov wrote:
> The commit ea489a3d983b ("drm/ci: add sc7180-trogdor-kingoftown")
> dropped the msm-sc7180-skips.txt file, which disabled suspend-to-RAM
> tests. However testing shows that STR tests still can fail. Restore the
> skiplist, applying it to both limozeen and kingoftown machines.
> 
> Fixes: ea489a3d983b ("drm/ci: add sc7180-trogdor-kingoftown")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt   | 2 ++
>   .../drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt   | 2 ++
>   2 files changed, 4 insertions(+)
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
> 
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
> new file mode 100644
> index 000000000000..327039f70252
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
> @@ -0,0 +1,2 @@
> +# Suspend to RAM seems to be broken on this machine
> +.*suspend.*
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
> new file mode 100644
> index 000000000000..327039f70252
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
> @@ -0,0 +1,2 @@
> +# Suspend to RAM seems to be broken on this machine
> +.*suspend.*

Acked-by: Vignesh Raman <vignesh.raman@collabora.com>

