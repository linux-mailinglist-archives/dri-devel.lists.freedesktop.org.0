Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9805AB9DE2
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 15:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7B810EAC2;
	Fri, 16 May 2025 13:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UVDhcUvK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD17910EAC2;
 Fri, 16 May 2025 13:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hkbeh72Y0ucq/iJdWN5aU8aatswoMTC6+WwiWepvQvA=; b=UVDhcUvKoxA8PncS3akl1v1GSQ
 b34xI5NT8Q5z28EX3kAMIYvVsVmI7FhwsIf1Z7cV8lfPlW3j0Czw5KNBsxyCjGhBRb8k8i5GjhRov
 9XljFAjG4qH5+n5mdW7Yw8uxa85a6DHOlSsgXLu8H4SNoNutHNI32bCLN54ayYtUzPW5q6+Kw3drU
 PJCMKk0YdP7MBl/7+OQoqV3nwodlm7lXpswuu6qxqfro2qOq2SybpiZFHcZNWvIh2xdjAXGFy0NJW
 wiOMTOTCfteuukjPsd/dQoMIOcRCS4H09pCJ/eHMTIDKlNYM3NvSg1cNxzCxUnmePaHZsazEBn5Dp
 m+4w9jJg==;
Received: from [179.180.238.246] (helo=[192.168.68.116])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uFvKL-0096fp-4V; Fri, 16 May 2025 15:48:15 +0200
Message-ID: <80673b87-792b-49f9-a68e-657c16a9b04a@igalia.com>
Date: Fri, 16 May 2025 10:48:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: ci: skip msm_mapping@shadow on SM8350
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250513-msm-ci-fixes-v1-1-baba185529a2@oss.qualcomm.com>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <20250513-msm-ci-fixes-v1-1-baba185529a2@oss.qualcomm.com>
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



On 5/13/25 15:49, Dmitry Baryshkov wrote:
> The msm_mapping@shadow test fails on SM8350, which means that the write
> might get through (hopefully not though). Disable the test completely
> for now until we can fix the issue.
> 
> Link: https://gitlab.freedesktop.org/drm/msm/-/issues/77
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Helen Koike <koike@igalia.com>

Thanks
Helen

> ---
>   drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> index 9450f2a002fd7e68f0f674ac6ac84aeebf28347f..a8b535abc8ef0d996d0c73ece1c7a9622250928e 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-skips.txt
> @@ -210,3 +210,8 @@ msm/msm_mapping@ring
>   # [  229.752499] CPU features: 0x18,00000017,00200928,4200720b
>   # [  229.758095] Memory Limit: none
>   # [  229.761291] ---[ end Kernel panic - not syncing: softlockup: hung tasks ]---
> +
> +# Protection doesn't seem to be enforced, don't perform write which might get through
> +# https://gitlab.freedesktop.org/drm/msm/-/issues/77
> +msm/msm_mapping@shadow
> +
> 
> ---
> base-commit: 8f5264d302e803e7ef82a61f9632a0d2ef67413f
> change-id: 20250513-msm-ci-fixes-3e7ce259d1d9
> 
> Best regards,

