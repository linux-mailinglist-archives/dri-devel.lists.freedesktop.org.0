Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE28F708895
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 21:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6436710E134;
	Thu, 18 May 2023 19:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C7210E134
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 19:48:28 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9A011203E5;
 Thu, 18 May 2023 21:48:26 +0200 (CEST)
Date: Thu, 18 May 2023 21:48:25 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3] drm/msm/dpu: drop unused SSPP sub-block information
Message-ID: <fnmtcqryiibfm55tkmwg5doommdhwrsremcy4shua5ekbrbh4t@6y37ctyyqijg>
References: <20230429212512.2947245-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429212512.2947245-1-dmitry.baryshkov@linaro.org>
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

On 2023-04-30 00:25:12, Dmitry Baryshkov wrote:
> The driver  doesn't support hsic/memcolor and pcc SSPP subblocks.

Double space.

(doesn't support, hence the field members are unused allowing us to drop
them.)

> Drop corresponding definitions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
> 
> Changes since v2:
> - Fixed commit message to remove igc block mention.
> 
> Changes since v1:
>  - Rebased on top of https://patchwork.freedesktop.org/patch/534725/?series=117130&rev=1

Perhaps worth mentioning explicitly that this depends on
https://lore.kernel.org/linux-arm-msm/20230428223646.23595-1-quic_abhinavk@quicinc.com/T/#u

- Marijn

> 
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 69d1f1e59db1..b2831b45ac64 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -380,9 +380,6 @@ struct dpu_caps {
>   * @qseed_ver: qseed version
>   * @scaler_blk:
>   * @csc_blk:
> - * @hsic:
> - * @memcolor:
> - * @pcc_blk:
>   * @format_list: Pointer to list of supported formats
>   * @num_formats: Number of supported formats
>   * @virt_format_list: Pointer to list of supported formats for virtual planes
> @@ -399,9 +396,6 @@ struct dpu_sspp_sub_blks {
>  	u32 qseed_ver;
>  	struct dpu_scaler_blk scaler_blk;
>  	struct dpu_pp_blk csc_blk;
> -	struct dpu_pp_blk hsic_blk;
> -	struct dpu_pp_blk memcolor_blk;
> -	struct dpu_pp_blk pcc_blk;
>  
>  	const u32 *format_list;
>  	u32 num_formats;
> -- 
> 2.39.2
> 
