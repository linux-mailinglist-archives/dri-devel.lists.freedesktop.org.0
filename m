Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D44480DDF
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 00:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CF510E11A;
	Tue, 28 Dec 2021 23:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6AD10E12A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 23:11:27 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so26159847otj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 15:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QJatUqtrqh2u+VQ/YEVsxnrHJlj+/BrTRHbzfVft99w=;
 b=lqkilty6YJQ1GjHtPQzpLJtQ3DiUkzKB4wNlcIoixTL8Bi1PYowZY6V0KjQh60SlXi
 NWIzka+giCnGfLHgBA12GV0CMRk48HAlTIPHP4viQV8K8lfwWYZ3hwpWTKf1ZE5TYzX/
 2pikMyyMySkKvU+eG9JFxmYMKaw/phzBKQ46NU0QWPGB4HK8B30lVgIoa7JgUMHCFZot
 F6e7/7uRG9Z9SA6v4ztKE6RHQOs2t4icWTZ7fAgHrAWfzXK9oRvS42wfdXHImPgLdRWc
 UOYpr8PFxM81Yz6fXQLh3bfd0zOjOt3ZQcj8EoODoMt/GUjboz6SD1tLcoNTRttnIqdL
 NwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QJatUqtrqh2u+VQ/YEVsxnrHJlj+/BrTRHbzfVft99w=;
 b=Rbwpbk7Us6zPwtK2BKliKS2D7rE1JFC3IsEO9TF+pVSiVdiswDlEl/SCRHgrDwdP8J
 IJL+s692K91IapqsVMAYfXxW/zWYvaEV5lOOXdH/uX4vh4uxD+B/oUNUWUu83Kb71NbQ
 0CBVUHfZFV9Eq/7QI0xYMBkP5Gkq1NVIf0Fwvm9bmc0Dto0tLjXasz8Vk4cPMfygpf1c
 Ifgr9QNq3aL7JmzEoe6ZHGIN5D0d1PAqjSOlDzCVByYm+h3OcZke6+yI2QTYVAaftL77
 NdTSV6qZoNDHZz3TAwmZObUq+KkwfutaT7JXu49MM2b3VnZjzfB3t49dpR0FRTM91YKW
 RBeg==
X-Gm-Message-State: AOAM533Sll0mHa9m0LWqxG4F8ZQcGK4uEVX1vIXWN0zurMIraw8fLlEQ
 0S7qQNVvHM0rmcGCkNW6ku/rvw==
X-Google-Smtp-Source: ABdhPJwH8iu/90QsiUNBVr78Y45xQO15a26mtV1pK6pLYmCJ5Ecawo2PscMep3kzBxC6RJzSDRQwdA==
X-Received: by 2002:a9d:200f:: with SMTP id n15mr16820098ota.66.1640733087117; 
 Tue, 28 Dec 2021 15:11:27 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id a6sm4198301oil.6.2021.12.28.15.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 15:11:26 -0800 (PST)
Date: Tue, 28 Dec 2021 15:12:27 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH] drm/msm/dp: add support of tps4 (training pattern 4) for
 HBR3
Message-ID: <YcuZ29QV+hfJprSl@ripper>
References: <1640717489-7366-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1640717489-7366-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 aravindh@codeaurora.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 28 Dec 10:51 PST 2021, Kuogee Hsieh wrote:

> From: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> Some DP sinkers prefer to use tps4 instead of tps3 during training #2.
> This patch will use tps4 to perform link training #2 if sinker's DPCD
> supports it.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 39558a2..c7b0657 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1181,7 +1181,7 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
>  			int *training_step)
>  {
>  	int tries = 0, ret = 0;
> -	char pattern;
> +	char pattern, state_ctrl_bit;
>  	int const maximum_retries = 5;
>  	u8 link_status[DP_LINK_STATUS_SIZE];
>  
> @@ -1189,12 +1189,20 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
>  
>  	*training_step = DP_TRAINING_2;
>  
> -	if (drm_dp_tps3_supported(ctrl->panel->dpcd))
> +	if (drm_dp_tps4_supported(ctrl->panel->dpcd)) {
> +		pattern = DP_TRAINING_PATTERN_4;
> +		state_ctrl_bit = 4;
> +	}
> +	else if (drm_dp_tps3_supported(ctrl->panel->dpcd)) {
>  		pattern = DP_TRAINING_PATTERN_3;
> -	else
> +		state_ctrl_bit = 3;
> +	}
> +	else {
>  		pattern = DP_TRAINING_PATTERN_2;
> +		state_ctrl_bit = 2;
> +	}
>  
> -	ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, pattern);
> +	ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, state_ctrl_bit);

The patch looks good, but as the state_ctrl_bit is no longer equal to
DP_PATTERN_n the function and argument names are misleading.

Please rename it to something like
"dp_catalog_ctrl_set_pattern_state_bit()" and the "pattern" argument
within that function to "state_bit".

Thanks,
Bjorn

>  	if (ret)
>  		return ret;
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
