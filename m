Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F324F4C4268
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 11:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29C010E890;
	Fri, 25 Feb 2022 10:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCF310E88F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 10:35:37 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id AF8B93F6C8;
 Fri, 25 Feb 2022 11:35:32 +0100 (CET)
Date: Fri, 25 Feb 2022 11:35:31 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: wire up MSM8998's DSPP blocks
Message-ID: <20220225103531.sczny6wtlgomvdxd@SoMainline.org>
References: <20220222031948.228727-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222031948.228727-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-22 06:19:48, Dmitry Baryshkov wrote:
> The commit adding msm8998 support didn't added msm8998's DSPP blocks

You might have meant: [did*] add(ed) msm8998's DSPP blocks configuration
[to the source /code file], but did not...

Or however you wish to word this :)

- Marijn

> configuration, but did not use them in msm8998_cfg_init(). Wire them up
> to be used for display post processing.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Cc: Jami Kettunen <jami.kettunen@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index aa4d20762ccb..f74bc7acd901 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1496,6 +1496,8 @@ static void msm8998_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>  		.sspp = msm8998_sspp,
>  		.mixer_count = ARRAY_SIZE(msm8998_lm),
>  		.mixer = msm8998_lm,
> +		.dspp_count = ARRAY_SIZE(msm8998_dspp),
> +		.dspp = msm8998_dspp,
>  		.pingpong_count = ARRAY_SIZE(sdm845_pp),
>  		.pingpong = sdm845_pp,
>  		.intf_count = ARRAY_SIZE(msm8998_intf),
> -- 
> 2.34.1
> 
