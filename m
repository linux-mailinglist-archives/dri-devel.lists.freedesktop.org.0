Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FFE7BD16C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 02:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F367F10E19F;
	Mon,  9 Oct 2023 00:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EBA10E19F;
 Mon,  9 Oct 2023 00:22:12 +0000 (UTC)
Received: from [192.168.0.206] (unknown [179.221.49.143])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AC51A660708F;
 Mon,  9 Oct 2023 01:22:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696810931;
 bh=nkas8mbOCQXxhRukFI/jwF8URSIbu2B26St5BjLCUaQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KU5lnaNCqvtuF4FAwWCmpVP5ASbf3jWbE7rHblLkht+QCGbU/eZDhRTz3QH0Awtk+
 wDfSm6Ot4eG7No1FvBOrt/T0SU9iKkmC1GRAB6+3u508PIiUrc5FVsP5dIrTHc7PP7
 X6yPGo945ZdUy+Zq1APS7vDPQzrPDwM2VDZBYqL4KVMx0+N5+lRmTVXeVqQdp5xh3U
 V8bvqSIuXHOb+biOmZiUvfyfAllZSJQ9o/osEwjgN9YnBAYLbFibj0ASRe4De+TgCG
 yJONXnOLp4I+fcO33fPPba2CJbzVcU0mwsDGJChwB20IY4qwfRO/eyJiq1URe0RM86
 CmDLAsAys5ECg==
Message-ID: <938af28b-23c3-4725-8ed5-a054bf2fa142@collabora.com>
Date: Sun, 8 Oct 2023 21:22:02 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/ci: force-enable CONFIG_MSM_MMCC_8996 as built-in
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231008132320.762542-1-dmitry.baryshkov@linaro.org>
 <20231008132320.762542-2-dmitry.baryshkov@linaro.org>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20231008132320.762542-2-dmitry.baryshkov@linaro.org>
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
> Enable CONFIG_MSM_MMCC_8996, the multimedia clock controller on Qualcomm
> MSM8996 to prevent the the board from hitting the probe deferral
> timeouts in CI run.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested-by: Helen Koike <helen.koike@collabora.com>

Pipeline: 
https://gitlab.freedesktop.org/helen.fornazier/linux/-/jobs/50031700

I saw that msm:apq8096 driver wasn't loading without this patch, thanks!

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>   drivers/gpu/drm/ci/arm64.config | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
> index 45f9deb7c4f6..b4f653417883 100644
> --- a/drivers/gpu/drm/ci/arm64.config
> +++ b/drivers/gpu/drm/ci/arm64.config
> @@ -62,6 +62,7 @@ CONFIG_PHY_QCOM_QUSB2=y
>   CONFIG_PHY_QCOM_QMP=y
>   CONFIG_MSM_GCC_8996=y
>   CONFIG_QCOM_CLK_APCC_MSM8996=y
> +CONFIG_MSM_MMCC_8996=y
>   CONFIG_QCOM_LLCC=y
>   CONFIG_QCOM_LMH=y
>   CONFIG_QCOM_SPMI_TEMP_ALARM=y
