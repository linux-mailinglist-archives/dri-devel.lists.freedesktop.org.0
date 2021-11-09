Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A787E44B3B5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 21:05:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396AA6E406;
	Tue,  9 Nov 2021 20:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27766E406
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 20:05:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636488329; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Ot9X0qCj7h9GyA8arQKHs+mukN4ItwqE8S5U3d0JvbY=;
 b=LxDTCcRmtxkY35rpQqGFT9hS0V9XG2XL1wmjJ8+Zz0DK5kn8WEg3vVNuNd0CM3POwoA0FYSt
 lByADLLXBweduOFw/iOahnvCINuLQ0O6/OblwrhKTUqUfw2J2OfoLMCqp4O76QDl/WGUYMOX
 RGM6K88SDjXs67hXU3UYJECKfoc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 618ad47663ce33d69b92bcf4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Nov 2021 20:05:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0C1BEC43618; Tue,  9 Nov 2021 20:05:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DA343C4338F;
 Tue,  9 Nov 2021 20:05:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 09 Nov 2021 12:05:06 -0800
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 14/22] drm/msm/dpu: add list of supported
 formats to the DPU caps
In-Reply-To: <20210705012115.4179824-15-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
 <20210705012115.4179824-15-dmitry.baryshkov@linaro.org>
Message-ID: <6de0375f60e442f301cb4e735d3ca2e6@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-04 18:21, Dmitry Baryshkov wrote:
> As we are going to add virtual planes, add the list of supported 
> formats
> to the hw catalog entry. It will be used to setup universal planes, 
> with
> later selecting a pipe depending on whether the YUV format is used for
> the framebuffer.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I dont see an issue with exposing the format_list in the catalog, hence
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 ++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d01c4c919504..b8e0fece1f0b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -195,6 +195,8 @@ static const struct dpu_caps sdm845_dpu_caps = {
>  	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>  	.max_hdeci_exp = MAX_HORZ_DECIMATION,
>  	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>  };
> 
>  static const struct dpu_caps sc7180_dpu_caps = {
> @@ -207,6 +209,8 @@ static const struct dpu_caps sc7180_dpu_caps = {
>  	.has_idle_pc = true,
>  	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>  };
> 
>  static const struct dpu_caps sm8150_dpu_caps = {
> @@ -223,6 +227,8 @@ static const struct dpu_caps sm8150_dpu_caps = {
>  	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>  	.max_hdeci_exp = MAX_HORZ_DECIMATION,
>  	.max_vdeci_exp = MAX_VERT_DECIMATION,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>  };
> 
>  static const struct dpu_caps sm8250_dpu_caps = {
> @@ -237,6 +243,8 @@ static const struct dpu_caps sm8250_dpu_caps = {
>  	.has_3d_merge = true,
>  	.max_linewidth = 4096,
>  	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>  };
> 
>  static const struct dpu_caps sc7280_dpu_caps = {
> @@ -249,6 +257,8 @@ static const struct dpu_caps sc7280_dpu_caps = {
>  	.has_idle_pc = true,
>  	.max_linewidth = 2400,
>  	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +	.format_list = plane_formats_yuv,
> +	.num_formats = ARRAY_SIZE(plane_formats_yuv),
>  };
> 
>  static const struct dpu_mdp_cfg sdm845_mdp[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index d2a945a27cfa..f3c5aa3f4b3f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -324,6 +324,8 @@ struct dpu_qos_lut_tbl {
>   * @pixel_ram_size     size of latency hiding and de-tiling buffer in 
> bytes
>   * @max_hdeci_exp      max horizontal decimation supported (max is 
> 2^value)
>   * @max_vdeci_exp      max vertical decimation supported (max is 
> 2^value)
> + * @format_list: Pointer to list of supported formats
> + * @num_formats: Number of supported formats
>   */
>  struct dpu_caps {
>  	u32 max_mixer_width;
> @@ -340,6 +342,8 @@ struct dpu_caps {
>  	u32 pixel_ram_size;
>  	u32 max_hdeci_exp;
>  	u32 max_vdeci_exp;
> +	const u32 *format_list;
> +	u32 num_formats;
>  };
> 
>  /**
