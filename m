Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 948774E6836
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 18:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6247010E307;
	Thu, 24 Mar 2022 17:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5AD10E193;
 Thu, 24 Mar 2022 17:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648144701; x=1679680701;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mrbgLvlsjdW9rx9HY/2WDm9oF7weTNiBspzAy++1AVA=;
 b=TzTFHEZOy8FoYnN7HPs5eNBpL/c0bgZ38K8K5Fzms63fSVtWRD0YQOu5
 sFTzs5N9tDgDyxeYACb7/FOwXXaIACJQ8FtBmg9Z24x4yUxlAfM+FfPMy
 EKha75HVH9qHXoQdvin2BKXMPiWexH/5k09I8IIPcWxCVJSxhzwe7WwkK c=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Mar 2022 10:58:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 10:58:18 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 24 Mar 2022 10:58:18 -0700
Received: from [10.110.52.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 24 Mar
 2022 10:58:18 -0700
Message-ID: <4a23c6a6-737a-c910-588b-8d4827d9560c@quicinc.com>
Date: Thu, 24 Mar 2022 10:58:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/mdp5: check the return of kzalloc()
Content-Language: en-US
To: <xkernel.wang@foxmail.com>, <robdclark@gmail.com>, <sean@poorly.run>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
References: <tencent_F71D40EE9851737338A6289EC3A3942EFE09@qq.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <tencent_F71D40EE9851737338A6289EC3A3942EFE09@qq.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/24/2022 1:36 AM, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> kzalloc() is a memory allocation function which can return NULL when
> some internal memory errors happen. So it is better to check it to
> prevent potential wrong memory access.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index c6b69af..5f914cc 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -90,15 +90,18 @@ static void mdp5_plane_reset(struct drm_plane *plane)
>   		__drm_atomic_helper_plane_destroy_state(plane->state);
>   
>   	kfree(to_mdp5_plane_state(plane->state));
> -	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
> +	plane->state = NULL;
>   
> -	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
> -		mdp5_state->base.zpos = STAGE_BASE;
> -	else
> -		mdp5_state->base.zpos = STAGE0 + drm_plane_index(plane);
> -	mdp5_state->base.normalized_zpos = mdp5_state->base.zpos;
> +	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
> +	if (mdp5_state) {
> +		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
> +			mdp5_state->base.zpos = STAGE_BASE;
> +		else
> +			mdp5_state->base.zpos = STAGE0 + drm_plane_index(plane);
> +		mdp5_state->base.normalized_zpos = mdp5_state->base.zpos;
>   
> -	__drm_atomic_helper_plane_reset(plane, &mdp5_state->base);
> +		__drm_atomic_helper_plane_reset(plane, &mdp5_state->base);
> +	}
>   }
>   
>   static struct drm_plane_state *
