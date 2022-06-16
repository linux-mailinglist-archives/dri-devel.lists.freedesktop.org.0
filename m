Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E59DF54DAD2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 08:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16BC10F111;
	Thu, 16 Jun 2022 06:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C9710F111;
 Thu, 16 Jun 2022 06:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655361559; x=1686897559;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=J4D+lzNfTLikG8wWJ++Wu7CZ6chaUPMyBbaxvNfq1/I=;
 b=y8n7ivE0oGLP1ategt0mbPHHFsG0wkyYQ+i4FQN525jv3l+LKpdnxc6D
 csWV8JhcLVswPNo+3advfvq+tTSpxf8EUV8C+rvC4l7IVqz4f5UMtvfVI
 WW0KnbD8oQiH0kSS+fnOQAV/03dWn9MN1bCZn0ONm+Vet6GIViIKTPe1R w=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Jun 2022 23:39:19 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 23:39:19 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 23:39:18 -0700
Received: from [10.111.175.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 23:39:16 -0700
Message-ID: <4d334492-0c43-47ae-b8f6-9242fc2ae6bf@quicinc.com>
Date: Wed, 15 Jun 2022 23:39:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] drm/msm/dpu: dont_use IS_ERR_OR_NULL for encoder phys
 backends
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220507115942.1705872-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220507115942.1705872-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/7/2022 4:59 AM, Dmitry Baryshkov wrote:
> The functions dpu_encoder_phys_foo_init() can not return NULL. Replace
> corresponding IS_ERR_OR_NULL() checks with just IS_ERR().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 52516eb20cb8..07de0c0506d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2144,10 +2144,10 @@ static int dpu_encoder_virt_add_phys_encs(
>   	if (disp_info->capabilities & MSM_DISPLAY_CAP_VID_MODE) {
>   		enc = dpu_encoder_phys_vid_init(params);
>   
> -		if (IS_ERR_OR_NULL(enc)) {
> +		if (IS_ERR(enc)) {
>   			DPU_ERROR_ENC(dpu_enc, "failed to init vid enc: %ld\n",
>   				PTR_ERR(enc));
> -			return enc == NULL ? -EINVAL : PTR_ERR(enc);
> +			return PTR_ERR(enc);
>   		}
>   
>   		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
> @@ -2157,10 +2157,10 @@ static int dpu_encoder_virt_add_phys_encs(
>   	if (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE) {
>   		enc = dpu_encoder_phys_cmd_init(params);
>   
> -		if (IS_ERR_OR_NULL(enc)) {
> +		if (IS_ERR(enc)) {
>   			DPU_ERROR_ENC(dpu_enc, "failed to init cmd enc: %ld\n",
>   				PTR_ERR(enc));
> -			return enc == NULL ? -EINVAL : PTR_ERR(enc);
> +			return PTR_ERR(enc);
>   		}
>   
>   		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
> @@ -2170,10 +2170,10 @@ static int dpu_encoder_virt_add_phys_encs(
>   	if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
>   		enc = dpu_encoder_phys_wb_init(params);
>   
> -		if (IS_ERR_OR_NULL(enc)) {
> +		if (IS_ERR(enc)) {
>   			DPU_ERROR_ENC(dpu_enc, "failed to init wb enc: %ld\n",
>   					PTR_ERR(enc));
> -			return enc == NULL ? -EINVAL : PTR_ERR(enc);
> +			return PTR_ERR(enc);
>   		}
>   
>   		dpu_enc->phys_encs[dpu_enc->num_phys_encs] = enc;
