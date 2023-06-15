Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE657322BC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 00:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A93010E55E;
	Thu, 15 Jun 2023 22:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA4110E55E;
 Thu, 15 Jun 2023 22:26:56 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0421F20512;
 Fri, 16 Jun 2023 00:26:53 +0200 (CEST)
Date: Fri, 16 Jun 2023 00:26:52 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 04/22] drm/msm: enumerate DSI interfaces
Message-ID: <wozcijpgqmpyavcfkvtkmtvho3jenjswx32djzv7wq7r7ko6xb@ejncq7zfm7un>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <20230613001004.3426676-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613001004.3426676-5-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-13 03:09:43, Dmitry Baryshkov wrote:
> Follow the DP example and define MSM_DSI_CONTROLLER_n enumeration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nice, that'll be cleaner.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/msm_drv.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index e13a8cbd61c9..ad4fad2bcdc8 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -65,6 +65,12 @@ enum msm_dp_controller {
>  	MSM_DP_CONTROLLER_COUNT,
>  };
>  
> +enum msm_dsi_controller {
> +	MSM_DSI_CONTROLLER_0,
> +	MSM_DSI_CONTROLLER_1,
> +	MSM_DSI_CONTROLLER_COUNT,
> +};
> +
>  #define MSM_GPU_MAX_RINGS 4
>  #define MAX_H_TILES_PER_DISPLAY 2
>  
> @@ -117,7 +123,7 @@ struct msm_drm_private {
>  	struct hdmi *hdmi;
>  
>  	/* DSI is shared by mdp4 and mdp5 */
> -	struct msm_dsi *dsi[2];
> +	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
>  
>  	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
>  
> -- 
> 2.39.2
> 
