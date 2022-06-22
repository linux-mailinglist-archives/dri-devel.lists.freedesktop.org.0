Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04CE554393
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 09:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719A4113B7B;
	Wed, 22 Jun 2022 07:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED4B113B7C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 07:26:42 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id f39so10656968lfv.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 00:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nVINeQucA0hcOfl1Yl3NKcwENV+ClW7oKgC+Qvvycso=;
 b=A+bC1zR9Iyi6DtY8D0mBXn29lLBQ6l0+WcVTYf82rCLB3Tf/CekLrKRsSco0GzqToP
 TXXD+lu6JMBzvRoqrDnqWcuGOfWUDPdvJWCD5U0fM3BaWqebSVKPvnDuYFrGgWHB0BHr
 x94eLHaGWSTI/jXa4reXZS0ILn6n5qtkmVlso0YP9war5DXgh58Ev2jS9JP5E1AY3X4E
 agrVLRQH6RvaShxUuKX0agzdL582WLNOsePbY1XTEj3vyxxPhU7csSnP0ODVroLeAMkJ
 l77VY29GRznM+B3ONJ6Gt5UfGu7oPNKXHg7L5+YIRna4RJzWNhNPAznRLCmyE47PkXlm
 N/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nVINeQucA0hcOfl1Yl3NKcwENV+ClW7oKgC+Qvvycso=;
 b=RtPbVpCuDCjjFc98PPeK4oysqrc5RhDd1Gw2W8vRi66Uw0x5+XEa61XxI6fWpGd1kL
 aFmZ2bFrQhbEIPcZdN+PXKk+3KXsx1OyFRE7Am5EQyTR1G05jbZfqnWlR/ctNKwjyhNv
 Yux5WUIYY5xXR2VP3xrB6hTqyUoW1CHM52Jg9CK0ZXE3WGb+HTVRkD4fGCMvxvdYjbNb
 DAtCOJBwzVzHnVTdt+pm1Xsfvd2iGy5MaJbs1T9DHOqI4vC9ReCCUKpaOe7jH5dHeJez
 v8ySg+fFBhOazv9vD5oEJsDFMV49NUyIs0Ph3rRsW+NrR/XhVWmWUneOiR583ya3LxIo
 Ebdw==
X-Gm-Message-State: AJIora+/ZrEQUMdfbBslvKsG1rFln3Bfi55AH87Eb/gxcZR99wiJBcvf
 IM3iRV/T9uFvBgEtHZIfJ+K6oA==
X-Google-Smtp-Source: AGRyM1s9XrHyP76QQ25ODf9GWmEg2gHGYNQxgUj3tWjupzrc+W5EIBfAY6Kk3S4lbVzlo8jSPMtdsw==
X-Received: by 2002:a05:6512:39d5:b0:47f:6e9a:5bf with SMTP id
 k21-20020a05651239d500b0047f6e9a05bfmr1314275lfu.580.1655882800383; 
 Wed, 22 Jun 2022 00:26:40 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s28-20020a19771c000000b0047f84ecae2esm488904lfc.236.2022.06.22.00.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 00:26:39 -0700 (PDT)
Message-ID: <f127060a-5648-fa40-81a0-be1be05b3951@linaro.org>
Date: Wed, 22 Jun 2022 10:26:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v8 1/2] drm/msm/dp: force link training for display
 resolution change
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1655399361-10842-1-git-send-email-quic_khsieh@quicinc.com>
 <1655399361-10842-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655399361-10842-2-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/06/2022 20:09, Kuogee Hsieh wrote:
> Display resolution change is implemented through drm modeset. Older
> modeset (resolution) has to be disabled first before newer modeset
> (resolution) can be enabled. Display disable will turn off both
> pixel clock and main link clock so that main link have to be
> re-trained during display enable to have new video stream flow
> again. At current implementation, display enable function manually
> kicks up irq_hpd_handle which will read panel link status and start
> link training if link status is not in sync state.
> 
> However, there is rare case that a particular panel links status keep
> staying in sync for some period of time after main link had been shut
> down previously at display disabled. In this case, main link retraining
> will not be executed by irq_hdp_handle(). Hence video stream of newer
> display resolution will fail to be transmitted to panel due to main
> link is not in sync between host and panel.
> 
> This patch will bypass irq_hpd_handle() in favor of directly call
> dp_ctrl_on_stream() to always perform link training in regardless of
> main link status. So that no unexpected exception resolution change
> failure cases will happen. Also this implementation are more efficient
> than manual kicking off irq_hpd_handle function.
> 
> Changes in v2:
> -- set force_link_train flag on DP only (is_edp == false)
> 
> Changes in v3:
> -- revise commit  text
> -- add Fixes tag
> 
> Changes in v4:
> -- revise commit  text
> 
> Changes in v5:
> -- fix spelling at commit text
> 
> Changes in v6:
> -- split dp_ctrl_on_stream() for phy test case
> -- revise commit text for modeset
> 
> Changes in v7:
> -- drop 0 assignment at local variable (ret = 0)
> 
> Changes in v8:
> -- add patch to remove pixel_rate from dp_ctrl
> 
> Fixes: 62671d2ef24b ("drm/msm/dp: fixes wrong connection state caused by failure of link train")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 31 +++++++++++++++++++++++--------
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
>   drivers/gpu/drm/msm/dp/dp_display.c | 13 ++++++-------
>   3 files changed, 31 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index af7a80c..01028b5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1551,7 +1551,7 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>   
>   	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
>   	if (!ret)
> -		ret = dp_ctrl_on_stream(&ctrl->dp_ctrl);
> +		ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
>   	else
>   		DRM_ERROR("failed to enable DP link controller\n");
>   
> @@ -1807,7 +1807,27 @@ static int dp_ctrl_link_retrain(struct dp_ctrl_private *ctrl)
>   	return dp_ctrl_setup_main_link(ctrl, &training_step);
>   }
>   
> -int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
> +int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
> +{
> +	int ret;
> +	struct dp_ctrl_private *ctrl;
> +
> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;

Stephen has raised an interesting question. Comparing this to the 
dp_ctrl_on_stream(), he noticed that we do not halve the pixel clock 
here (if the wide bus is supported). So, the question is if this is 
correct or not.

> +
> +	ret = dp_ctrl_enable_stream_clocks(ctrl);
> +	if (ret) {
> +		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	dp_ctrl_send_phy_test_pattern(ctrl);
> +
> +	return 0;
> +}
> +
> +int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   {
>   	int ret = 0;
>   	bool mainlink_ready = false;
> @@ -1843,12 +1863,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>   		goto end;
>   	}
>   
> -	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
> -		dp_ctrl_send_phy_test_pattern(ctrl);
> -		return 0;
> -	}
> -
> -	if (!dp_ctrl_channel_eq_ok(ctrl))
> +	if (force_link_train || !dp_ctrl_channel_eq_ok(ctrl))
>   		dp_ctrl_link_retrain(ctrl);
>   
>   	/* stop txing train pattern to end link training */


-- 
With best wishes
Dmitry
