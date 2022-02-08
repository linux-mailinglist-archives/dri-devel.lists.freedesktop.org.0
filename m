Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4782D4ACE6A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 02:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B6410E438;
	Tue,  8 Feb 2022 01:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E043B10E316;
 Tue,  8 Feb 2022 01:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644285103; x=1675821103;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XYGnDAcg+DtyGKZQPv6wzPHMGMw0imYE5zSgdyrOqag=;
 b=VSwf/bSeWuAhs1tFaxncOH6xRrRdpAtuKOuMKv0iDdRukbznSLebNDDS
 eJfoK00ZSVclrgL437WIyWwmPwqTDqnsu6CbEiInaRn0CQ/wRbpzy3ijS
 oMHjCc4lMRHW3H+KNTMOzWJs5uLmCxutYmi+rixMjLOcTuYhf4XlSqUha s=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 07 Feb 2022 17:51:42 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 17:51:42 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 7 Feb 2022 17:51:41 -0800
Received: from [10.38.243.172] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Mon, 7 Feb 2022
 17:51:39 -0800
Message-ID: <8a2ce43f-f5b9-62bf-f169-ccbe3f4b8c49@quicinc.com>
Date: Mon, 7 Feb 2022 17:51:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH -next] drm/msm/dpu: clean up some inconsistent indenting
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, <daniel@ffwll.ch>
References: <20220208012321.43587-1-yang.lee@linux.alibaba.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220208012321.43587-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: sean@poorly.run, airlied@linux.ie, linux-arm-msm@vger.kernel.org, Abaci
 Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/7/2022 5:23 PM, Yang Li wrote:
> Eliminate the follow smatch warning:
> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:411
> _dpu_crtc_blend_setup_mixer() warn: inconsistent indenting
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index e7c9fe1a250f..662b7bc9c219 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -408,7 +408,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   	if (ctl->ops.set_active_pipes)
>   		ctl->ops.set_active_pipes(ctl, fetch_active);
>   
> -	 _dpu_crtc_program_lm_output_roi(crtc);
> +	_dpu_crtc_program_lm_output_roi(crtc);
>   }
>   
>   /**
