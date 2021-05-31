Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D60F8395632
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 09:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44306E48B;
	Mon, 31 May 2021 07:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A126E0EE
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 07:34:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622446446; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=wDQQ376bN5sF92/v8P8tqDT6yjiu711CYrdBMl+n7Xs=;
 b=TIBWbw+ZH3HfJITLj7dVh0mHNRLCxIr2547B5LzJUTGFB4Cuj3ryKltZX2Xc0DM9Br9gH1Jz
 l4cjmDc44fPmt0XIGTS2ulvMbRbxKjFlKwFNfMsNiYVjHeo1/hOo+xXG5YckSC3VNl/iH++8
 z0CxBDhNE49tJAsL8vFbbbJFw7c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60b4916d81efe91cda353e05 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 May 2021 07:34:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2806EC433D3; Mon, 31 May 2021 07:34:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.105] (unknown [117.210.184.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 08292C43460;
 Mon, 31 May 2021 07:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 08292C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH v2 3/8] drm/msm/a6xx: fix incorrectly set uavflagprd_inv
 field for A650
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
References: <20210513171431.18632-1-jonathan@marek.ca>
 <20210513171431.18632-4-jonathan@marek.ca>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <85cd323b-90a2-9324-5696-fc80cf667827@codeaurora.org>
Date: Mon, 31 May 2021 13:03:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210513171431.18632-4-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/13/2021 10:43 PM, Jonathan Marek wrote:
> Value was shifted in the wrong direction, resulting in the field always
> being zero, which is incorrect for A650.
> 
> Fixes: d0bac4e9cd66 ("drm/msm/a6xx: set ubwc config for A640 and A650")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 727d111a413f..45a6a0fce7d7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -489,7 +489,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>   		rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
>   	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
>   	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
> -		uavflagprd_inv >> 4 | lower_bit << 1);
> +		uavflagprd_inv << 4 | lower_bit << 1);
>   	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
>   }
>   
> 
Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>

-Akhil.
