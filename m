Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC8DA5E9A5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 03:11:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1196310E10E;
	Thu, 13 Mar 2025 02:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="K96VwPv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B500010E10E;
 Thu, 13 Mar 2025 02:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741831881;
 bh=FpC/vTuwIK5xIUgyQayYXS0BC2eQhbdB7objGTLAYV0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=K96VwPv+aIwjbtzVY9PiUbxOZEX7YVvF3CNB/wJzqT34HrNwMBSIY6172lqADQjVk
 xqGE8H7jqxTScepZPCRIBTlOI5eIVnZ55BOhvUHMMux8yRR2FSSlxtpg1Hnr4h1nHG
 7rR+Fpdjnn7k3GVKPKhZ52mYWzfQiaXAHNlMjfrDrx9Lab6deu+lD980tlczpHtm+J
 dBhB2uksMY+FsynP2gf+lom+DEzd6bsBwHZcGP9gCUrNLgqKYV2ZUaoxCYjmDRPsyF
 MAThuelWlIXJzj6Z3OR1ZGvcbN4pH5xamSzylh6Ca/BK7fBiF63S1OR5/Bb01Xm5oq
 YcxJQwdEchJVg==
Received: from [192.168.50.250] (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D09C17E1134;
 Thu, 13 Mar 2025 03:11:18 +0100 (CET)
Message-ID: <cc9501d1-c779-4728-a609-ce83a73f46f6@collabora.com>
Date: Thu, 13 Mar 2025 07:40:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ci: add kms_cursor_legacy@torture-bo to apq8016
 flakes
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 lumag@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20241204-cursor_tor_skip-v2-1-f03bcbc4b455@quicinc.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <20241204-cursor_tor_skip-v2-1-f03bcbc4b455@quicinc.com>
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

Hi Abhinav,

On 05/12/24 01:29, Abhinav Kumar wrote:
>  From the jobs [1] and [2] of pipeline [3], its clear that
> kms_cursor_legacy@torture-bo is most certainly a flake and
> not a fail for apq8016. Mark the test accordingly to match the results.
> 
> [1] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67676481
> [2] : https://gitlab.freedesktop.org/drm/msm/-/jobs/67677430
> [3]: https://gitlab.freedesktop.org/drm/msm/-/pipelines/1322770
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Changes in v2:
> - Fix the failure rate from 100 to 33 as thats the accurate one
> - Link to v1: https://lore.kernel.org/r/20241204-cursor_tor_skip-v1-1-f5f0bba5df7b@quicinc.com
> ---
>   drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> new file mode 100644
> index 000000000000..2fb192c92559
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> @@ -0,0 +1,5 @@
> +# Board Name: msm-apq8016-db410c
> +# Failure Rate: 33
> +# IGT Version: 1.28-ga73311079
> +# Linux Version: 6.12.0-rc2
> +kms_cursor_legacy@torture-bo

Reviewed-by: Vignesh Raman <vignesh.raman@collabora.com>

Regards,
Vignesh

> 
> ---
> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
> change-id: 20241204-cursor_tor_skip-9d128dd62c4f
> 
> Best regards,

