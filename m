Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5CE6F0D13
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 22:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D80610EBF1;
	Thu, 27 Apr 2023 20:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB7310E292;
 Thu, 27 Apr 2023 20:24:57 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6054C1F637;
 Thu, 27 Apr 2023 22:24:53 +0200 (CEST)
Date: Thu, 27 Apr 2023 22:24:52 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 4/4] drm/msm/dpu: drop DSPP_MSM8998_MASK from hw catalog
Message-ID: <ypbvme4nuc7sid65wrpbpnsianwnq2dd6iozbhg7k47gio3f3e@75bb5efa43ri>
References: <20230426192246.5517-1-quic_abhinavk@quicinc.com>
 <20230426192246.5517-4-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426192246.5517-4-quic_abhinavk@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_jesszhan@quicinc.com,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-26 12:22:46, Abhinav Kumar wrote:
> Since GC and IGC masks have now been dropped DSPP_MSM8998_MASK
> is same as DSPP_SC7180_MASK. Since DSPP_SC7180_MASK is used more
> than DSPP_MSM8998_MASK, lets drop the latter.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Fair enough, I'd use the oldest SoC but that'd require many more
unnecessary rename changes (or even better: we inline these flags at
some point, and drop .id fields from those already present in sblk).

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 2 --
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 2b3ae84057df..5f6e4715aa04 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -127,9 +127,9 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
>  };
>  
>  static const struct dpu_dspp_cfg msm8998_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
>  		 &msm8998_dspp_sblk),
> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
> +	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
>  		 &msm8998_dspp_sblk),
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index badfc3680485..2cabba0bb513 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -91,8 +91,6 @@
>  
>  #define MERGE_3D_SM8150_MASK (0)
>  
> -#define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC)
> -
>  #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
>  
>  #define INTF_SDM845_MASK (0)
> -- 
> 2.40.1
> 
