Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2E6AAC82E
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 16:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F13210E6A7;
	Tue,  6 May 2025 14:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC3D10E6A7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 14:36:39 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id EC610404DA;
 Tue,  6 May 2025 16:36:36 +0200 (CEST)
Date: Tue, 6 May 2025 16:36:35 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from SAR2130P
 CTL blocks
Message-ID: <k4npgl5v3qqdzqytiwesqgs3v362mr27mtvzfbvp6ugm3mn4qr@dxquxscqjqme>
References: <20250506-dpu-sar2130p-no-split-display-v1-1-b619c0fddea5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-dpu-sar2130p-no-split-display-v1-1-b619c0fddea5@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2025-05-06 15:53:48, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <lumag@kernel.org>
> 
> Follow the changes in the commit a2649952f66e ("drm/msm/dpu: remove
> DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0") and remove
> DPU_CTL_SPLIT_DISPLAY from the CTL blocks on the SAR2130P platform.
> Single CTL is used for all interfaces used by a single path
> 
> Fixes: 178575173472 ("drm/msm/dpu: add catalog entry for SAR2130P")

This was probably more of a "developed and merged in parallel" problem than a
faulty patch, because a2649952f66e was merged first. Regardless:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> index 22dd16c6e210e9520ecb7a851bee402032fa1ee2..5667d055fbd1d8125c3231302daa3e05de5944c9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> @@ -27,17 +27,16 @@ static const struct dpu_mdp_cfg sar2130p_mdp = {
>  	},
>  };
>  
> -/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sar2130p_ctl[] = {
>  	{
>  		.name = "ctl_0", .id = CTL_0,
>  		.base = 0x15000, .len = 0x290,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	}, {
>  		.name = "ctl_1", .id = CTL_1,
>  		.base = 0x16000, .len = 0x290,
> -		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
> +		.features = CTL_SM8550_MASK,
>  		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	}, {
>  		.name = "ctl_2", .id = CTL_2,
> 
> ---
> base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
> change-id: 20250506-dpu-sar2130p-no-split-display-442eb0b85165
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
