Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 844AD57F68C
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jul 2022 20:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A6C8D308;
	Sun, 24 Jul 2022 18:41:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2664618BEFF;
 Sun, 24 Jul 2022 18:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1658688093; x=1690224093;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Xmqi+PtP+oX2YkbDLnX+NM8sgVqjcClrdM6yGz3dUX0=;
 b=UW/B7oKpomF6ee+bwis9tDU48pvwXLMJvGGqFZlbJIe0yQJmdS3bzu8r
 n1yd6WIw5PqkLtQQgEK9CSzPRut6umD0QbT/oHPc6jmOuppBmm80MeR77
 zjZw0O3evLO3SvglP/hXRXXzfZ2MetTdyUMffGZlvM9ivfl7XXIPGKnJx Y=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 24 Jul 2022 11:41:32 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2022 11:41:32 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Sun, 24 Jul 2022 11:41:31 -0700
Received: from [10.111.168.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Sun, 24 Jul
 2022 11:41:28 -0700
Message-ID: <31c53577-e1a2-e2fd-46a9-27b70fcee363@quicinc.com>
Date: Sun, 24 Jul 2022 11:41:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: Fix comment typo
Content-Language: en-US
To: Jason Wang <wangborong@cdjrlc.com>
References: <20220724204242.4107-1-wangborong@cdjrlc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220724204242.4107-1-wangborong@cdjrlc.com>
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
Cc: quic_kalyant@quicinc.com, freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 dmitry.baryshkov@linaro.org, quic_vpolimer@quicinc.com, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/24/2022 1:42 PM, Jason Wang wrote:
> The double `be' is duplicated in the comment, remove one.
> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 71fe4c505f5b..38aa38ab1568 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -76,7 +76,7 @@ enum {
>   
>   /**
>    * MDP TOP BLOCK features
> - * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be be done per pipe
> + * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
>    * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
>    * @DPU_MDP_BWC,           MDSS HW supports Bandwidth compression.
>    * @DPU_MDP_UBWC_1_0,      This chipsets supports Universal Bandwidth
