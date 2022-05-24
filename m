Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D979A532F81
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 19:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E34C10F8BB;
	Tue, 24 May 2022 17:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681E810F8BB;
 Tue, 24 May 2022 17:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1653412663; x=1684948663;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DoOUN0UTfeRv6bBPpzkewrxRvmKM7X4VuHkvCLosprE=;
 b=dRPixB/sGuNhhlfYQBjpz5cuj11p7RMLLAPbLQ6C5iAo1NFHX63bk2qA
 vRZeEXi18trx93kcxrPYBSWDzJitknHB3/+W0KoFAVJp/hgEYhAALUa30
 3bocG7oknCPr1jnMdMbzSyNmQXd3tqhLac3Xakbn+YWhOOeoBR/dskcaH E=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 May 2022 10:17:42 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 10:17:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 24 May 2022 10:17:41 -0700
Received: from [10.38.240.101] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 24 May
 2022 10:17:39 -0700
Message-ID: <83713f0b-2fcc-afe8-899a-4e3e634543bb@quicinc.com>
Date: Tue, 24 May 2022 10:17:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/disp/dpu1: remove supoerflous init
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
References: <20220524103534.2520439-1-vkoul@kernel.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220524103534.2520439-1-vkoul@kernel.org>
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
 kernel test robot <yujie.liu@intel.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/24/2022 3:35 AM, Vinod Koul wrote:
> Commit 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in
> encoder") added dsc_common_mode variable which was set to zero but then
> again programmed, so drop the supoerflous init.
Both in the subject line and here, typo
supoerflous ---> superfluous

Other than that,
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

> 
> Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 51f24ba68375..388125c8bda1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1798,7 +1798,6 @@ static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
>   		}
>   	}
>   
> -	dsc_common_mode = 0;
>   	pic_width = dsc->drm->pic_width;
>   
>   	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
