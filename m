Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6205F3AA6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 02:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6908010E511;
	Tue,  4 Oct 2022 00:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0844410E50E;
 Tue,  4 Oct 2022 00:30:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0585BB818C2;
 Tue,  4 Oct 2022 00:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1546EC433D6;
 Tue,  4 Oct 2022 00:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664843430;
 bh=oazTfsFDNvT2Iz6N7NI+gpkBcG9p2DmNk1jSJYgpP2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQ35wMlT3S54e72vo+EytanCuWVMEhbhjQr779jzFBQXZ1k2l6lwYAugejfkTewtn
 SKVbKue79GjDtCzBGDTQaXFlDQuS7tyhViby6VveExlP9Ox2bvv3m9D4trX74NQPtU
 QenGKJj5n8PXIGTzRConO33yvAcU8tNLlTZPvpF/u7/GBM+15QDp/90xh4/5nNYEc9
 BLXjjgQPtP360/6dYn44QGQ7R0mOMwB9YhyxBg32COC4X6WXos0dkxfsPG6rg6gjZb
 KdAmpTorBSLUsQ0vSyxDhHDiVog2FBBv4sQNlnUxVXwHUEIs9q8982O5wi/erdWAWg
 3t1HS91i1dyLg==
Date: Mon, 3 Oct 2022 19:30:25 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 2/5] drm/msm/dsi: Remove repeated calculation of
 slice_per_intf
Message-ID: <20221004003025.vyd5rnswpdb5n5g3@baldur>
References: <20221001190807.358691-1-marijn.suijten@somainline.org>
 <20221001190807.358691-3-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221001190807.358691-3-marijn.suijten@somainline.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Marek Vasut <marex@denx.de>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 01, 2022 at 09:08:04PM +0200, Marijn Suijten wrote:
> slice_per_intf is already computed for intf_width, which holds the same
> value as hdisplay.
> 
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e05bae647431..cb6f2fa11f58 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -842,7 +842,7 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>  static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mode, u32 hdisplay)
>  {
>  	struct drm_dsc_config *dsc = msm_host->dsc;
> -	u32 reg, intf_width, reg_ctrl, reg_ctrl2;
> +	u32 reg, reg_ctrl, reg_ctrl2;
>  	u32 slice_per_intf, total_bytes_per_intf;
>  	u32 pkt_per_line;
>  	u32 bytes_in_slice;
> @@ -851,8 +851,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  	/* first calculate dsc parameters and then program
>  	 * compress mode registers
>  	 */
> -	intf_width = hdisplay;
> -	slice_per_intf = DIV_ROUND_UP(intf_width, dsc->slice_width);
> +	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
>  
>  	/* If slice_per_pkt is greater than slice_per_intf
>  	 * then default to 1. This can happen during partial
> @@ -861,7 +860,6 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  	if (slice_per_intf > dsc->slice_count)
>  		dsc->slice_count = 1;
>  
> -	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
>  	bytes_in_slice = DIV_ROUND_UP(dsc->slice_width * dsc->bits_per_pixel, 8);
>  
>  	dsc->slice_chunk_size = bytes_in_slice;
> -- 
> 2.37.3
> 
