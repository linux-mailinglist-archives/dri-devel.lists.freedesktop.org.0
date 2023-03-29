Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0216CF397
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 21:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE8810E18D;
	Wed, 29 Mar 2023 19:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6784B10E19C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 19:49:10 +0000 (UTC)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl [83.9.3.225])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DEF463EF48;
 Wed, 29 Mar 2023 21:49:03 +0200 (CEST)
Message-ID: <8ebea3bc-6f1f-e5f9-40a1-827a0b22a1ea@somainline.org>
Date: Wed, 29 Mar 2023 21:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,15/50] drm/msm/dpu: constify DSC data structures
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-16-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20230211231259.1308718-16-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> DSC hw catalog data is not supposed to be changed, so mark it as const
> data.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c     | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 2d53ed92de85..54d706dfdbec 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1829,14 +1829,14 @@ static const struct dpu_merge_3d_cfg sm8550_merge_3d[] = {
>  	.features = _features, \
>  	}
>  
> -static struct dpu_dsc_cfg sdm845_dsc[] = {
> +static const struct dpu_dsc_cfg sdm845_dsc[] = {
>  	DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
>  	DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
>  	DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
>  	DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
>  };
>  
> -static struct dpu_dsc_cfg sm8150_dsc[] = {
> +static const struct dpu_dsc_cfg sm8150_dsc[] = {
>  	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
>  	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
>  	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index e6590302b3bf..a56581b34ddf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -867,7 +867,7 @@ struct dpu_mdss_cfg {
>  	const struct dpu_merge_3d_cfg *merge_3d;
>  
>  	u32 dsc_count;
> -	struct dpu_dsc_cfg *dsc;
> +	const struct dpu_dsc_cfg *dsc;
>  
>  	u32 intf_count;
>  	const struct dpu_intf_cfg *intf;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 619926da1441..4e1396575e6a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -175,7 +175,7 @@ static void dpu_hw_dsc_bind_pingpong_blk(
>  	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
>  }
>  
> -static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
> +static const struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
>  				       const struct dpu_mdss_cfg *m,
>  				       void __iomem *addr,
>  				       struct dpu_hw_blk_reg_map *b)
> @@ -207,7 +207,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
>  				   const struct dpu_mdss_cfg *m)
>  {
>  	struct dpu_hw_dsc *c;
> -	struct dpu_dsc_cfg *cfg;
> +	const struct dpu_dsc_cfg *cfg;
>  
>  	c = kzalloc(sizeof(*c), GFP_KERNEL);
>  	if (!c)
