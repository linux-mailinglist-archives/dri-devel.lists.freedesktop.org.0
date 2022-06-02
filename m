Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C84853BED5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 21:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8DA112E0A;
	Thu,  2 Jun 2022 19:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB49112E0A;
 Thu,  2 Jun 2022 19:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654198382; x=1685734382;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nQ/56R0NYpYi5TUuNxSnr1qC3joSH9bQnSMhS3X4DuU=;
 b=zpHZooo8JszEsMcj9V4nOrlxaKk4+ZfJJInYxZok7LMlcVUeGedLVIAh
 sgqDBaLCQxzgN+isBGgLttVn5SSIg/8v5iwGKPwpS219sUoZRJCRPaIWQ
 mgNMyKXn8NV1Ylj/OP6llyJ1r15rhqlu1D9oesvHvzvVEq8/tJC927AKC o=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 02 Jun 2022 12:33:02 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 12:33:01 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 12:33:01 -0700
Received: from [10.38.242.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 2 Jun 2022
 12:32:58 -0700
Message-ID: <9f147be5-085d-6459-9c8b-2471b2a30ed0@quicinc.com>
Date: Thu, 2 Jun 2022 12:32:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 6/7] drm/msm/dpu: constify struct dpu_mdss_cfg
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
 <20220602133039.1739490-7-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220602133039.1739490-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/2/2022 6:30 AM, Dmitry Baryshkov wrote:
> Mark struct dpu_mdss_cfg instance as a const pointer. This is mostly a
> preparation for the next patch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c       |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h       |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 11 +++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      |  9 ++-------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c          |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h          |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c   |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h   |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c         |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h         |  4 ++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c             |  8 +++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h             |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c           |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c              |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h              |  2 +-
>   17 files changed, 29 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 31767d0f7353..1d9d83d7b99e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -468,7 +468,7 @@ static const struct file_operations dpu_core_perf_mode_fops = {
>   int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>   {
>   	struct dpu_core_perf *perf = &dpu_kms->perf;
> -	struct dpu_mdss_cfg *catalog = perf->catalog;
> +	const struct dpu_mdss_cfg *catalog = perf->catalog;
>   	struct dentry *entry;
>   
>   	entry = debugfs_create_dir("core_perf", parent);
> @@ -517,7 +517,7 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
>   
>   int dpu_core_perf_init(struct dpu_core_perf *perf,
>   		struct drm_device *dev,
> -		struct dpu_mdss_cfg *catalog,
> +		const struct dpu_mdss_cfg *catalog,
>   		struct clk *core_clk)
>   {
>   	perf->dev = dev;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index 8dfcc6db7176..e3795995e145 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -68,7 +68,7 @@ struct dpu_core_perf_tune {
>   struct dpu_core_perf {
>   	struct drm_device *dev;
>   	struct dentry *debugfs_root;
> -	struct dpu_mdss_cfg *catalog;
> +	const struct dpu_mdss_cfg *catalog;
>   	struct clk *core_clk;
>   	u64 core_clk_rate;
>   	u64 max_core_clk_rate;
> @@ -119,7 +119,7 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
>    */
>   int dpu_core_perf_init(struct dpu_core_perf *perf,
>   		struct drm_device *dev,
> -		struct dpu_mdss_cfg *catalog,
> +		const struct dpu_mdss_cfg *catalog,
>   		struct clk *core_clk);
>   
>   struct dpu_kms;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 52516eb20cb8..460df2a4831c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1207,7 +1207,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> -static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
> +static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
>   		enum dpu_intf_type type, u32 controller_id)
>   {
>   	int i = 0;
> @@ -1224,7 +1224,7 @@ static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
>   	return INTF_MAX;
>   }
>   
> -static enum dpu_wb dpu_encoder_get_wb(struct dpu_mdss_cfg *catalog,
> +static enum dpu_wb dpu_encoder_get_wb(const struct dpu_mdss_cfg *catalog,
>   		enum dpu_intf_type type, u32 controller_id)
>   {
>   	int i = 0;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 1e4a4822fbf4..4088c9e17d50 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -103,7 +103,7 @@ static void dpu_encoder_phys_wb_set_qos(struct dpu_encoder_phys *phys_enc)
>   {
>   	struct dpu_hw_wb *hw_wb;
>   	struct dpu_hw_wb_qos_cfg qos_cfg;
> -	struct dpu_mdss_cfg *catalog;
> +	const struct dpu_mdss_cfg *catalog;
>   	const struct dpu_qos_lut_tbl *qos_lut_tb;
>   
>   	if (!phys_enc || !phys_enc->dpu_kms || !phys_enc->dpu_kms->catalog) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 5470b8b14b0a..4fa16fdae17d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -1985,17 +1985,12 @@ static const struct dpu_mdss_hw_cfg_handler cfg_handler[] = {
>   	{ .hw_rev = DPU_HW_VER_720, .cfg_init = sc7280_cfg_init},
>   };
>   
> -void dpu_hw_catalog_deinit(struct dpu_mdss_cfg *dpu_cfg)
> -{
> -	kfree(dpu_cfg);
> -}
> -
> -struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
> +const struct dpu_mdss_cfg *dpu_hw_catalog_init(struct device *dev, u32 hw_rev)
>   {
>   	int i;
>   	struct dpu_mdss_cfg *dpu_cfg;
>   
> -	dpu_cfg = kzalloc(sizeof(*dpu_cfg), GFP_KERNEL);
> +	dpu_cfg = devm_kzalloc(dev, sizeof(*dpu_cfg), GFP_KERNEL);
>   	if (!dpu_cfg)
>   		return ERR_PTR(-ENOMEM);
>   
> @@ -2007,7 +2002,7 @@ struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev)
>   	}
>   
>   	DPU_ERROR("unsupported chipset id:%X\n", hw_rev);
> -	dpu_hw_catalog_deinit(dpu_cfg);
> +
>   	return ERR_PTR(-ENODEV);
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 60b403ac9f0f..c317fa27daa0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -884,16 +884,11 @@ struct dpu_mdss_hw_cfg_handler {
>   /**
>    * dpu_hw_catalog_init - dpu hardware catalog init API retrieves
>    * hardcoded target specific catalog information in config structure
> + * @dev:          DPU device
>    * @hw_rev:       caller needs provide the hardware revision.
>    *
>    * Return: dpu config structure
>    */
> -struct dpu_mdss_cfg *dpu_hw_catalog_init(u32 hw_rev);
> -
> -/**
> - * dpu_hw_catalog_deinit - dpu hardware catalog cleanup
> - * @dpu_cfg:      pointer returned from init function
> - */
> -void dpu_hw_catalog_deinit(struct dpu_mdss_cfg *dpu_cfg);
> +const struct dpu_mdss_cfg *dpu_hw_catalog_init(struct device *dev, u32 hw_rev);
>   
>   #endif /* _DPU_HW_CATALOG_H */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index 6f20d6b6dddd..184a1b27b13d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -158,7 +158,7 @@ static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
>   }
>   
>   static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
> -				       struct dpu_mdss_cfg *m,
> +				       const struct dpu_mdss_cfg *m,
>   				       void __iomem *addr,
>   				       struct dpu_hw_blk_reg_map *b)
>   {
> @@ -186,7 +186,7 @@ static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
>   };
>   
>   struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
> -				   struct dpu_mdss_cfg *m)
> +				   const struct dpu_mdss_cfg *m)
>   {
>   	struct dpu_hw_dsc *c;
>   	struct dpu_dsc_cfg *cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> index 164e5f5b1002..5fab8bbba764 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> @@ -64,7 +64,7 @@ struct dpu_hw_dsc {
>    * Returns: Error code or allocated dpu_hw_dsc context
>    */
>   struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
> -				   struct dpu_mdss_cfg *m);
> +				   const struct dpu_mdss_cfg *m);
>   
>   /**
>    * dpu_hw_dsc_destroy - destroys dsc driver context
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 01bb2d84c3a0..d83503ea2419 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -398,7 +398,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
>   	return intr_status;
>   }
>   
> -static void __intr_offset(struct dpu_mdss_cfg *m,
> +static void __intr_offset(const struct dpu_mdss_cfg *m,
>   		void __iomem *addr, struct dpu_hw_blk_reg_map *hw)
>   {
>   	hw->base_off = addr;
> @@ -406,7 +406,7 @@ static void __intr_offset(struct dpu_mdss_cfg *m,
>   }
>   
>   struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
> -		struct dpu_mdss_cfg *m)
> +		const struct dpu_mdss_cfg *m)
>   {
>   	struct dpu_hw_intr *intr;
>   	int nirq = MDP_INTR_MAX * 32;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 4154c5e2b4ae..46443955443c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -67,7 +67,7 @@ struct dpu_hw_intr {
>    * @m :   pointer to mdss catalog data
>    */
>   struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
> -		struct dpu_mdss_cfg *m);
> +		const struct dpu_mdss_cfg *m);
>   
>   /**
>    * dpu_hw_intr_destroy(): Cleanup interrutps hw object
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index ab7f1a4cc578..da4c7e4f304b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -761,7 +761,7 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct dpu_kms *kms,
>   
>   static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
>   		void __iomem *addr,
> -		struct dpu_mdss_cfg *catalog,
> +		const struct dpu_mdss_cfg *catalog,
>   		struct dpu_hw_blk_reg_map *b)
>   {
>   	int i;
> @@ -782,7 +782,7 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
>   }
>   
>   struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
> -		void __iomem *addr, struct dpu_mdss_cfg *catalog,
> +		void __iomem *addr, const struct dpu_mdss_cfg *catalog,
>   		bool is_virtual_pipe)
>   {
>   	struct dpu_hw_pipe *hw_pipe;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index a81e16657d61..7f7338fcddeb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -360,7 +360,7 @@ struct dpu_hw_sspp_ops {
>   struct dpu_hw_pipe {
>   	struct dpu_hw_blk base;
>   	struct dpu_hw_blk_reg_map hw;
> -	struct dpu_mdss_cfg *catalog;
> +	const struct dpu_mdss_cfg *catalog;
>   	const struct dpu_mdp_cfg *mdp;
>   
>   	/* Pipe */
> @@ -381,7 +381,7 @@ struct dpu_kms;
>    * @is_virtual_pipe: is this pipe virtual pipe
>    */
>   struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
> -		void __iomem *addr, struct dpu_mdss_cfg *catalog,
> +		void __iomem *addr, const struct dpu_mdss_cfg *catalog,
>   		bool is_virtual_pipe);
>   
>   /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2b9d931474e0..bba29c31f843 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -747,7 +747,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   	unsigned int num_encoders;
>   
>   	struct msm_drm_private *priv;
> -	struct dpu_mdss_cfg *catalog;
> +	const struct dpu_mdss_cfg *catalog;
>   
>   	int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
>   	int max_crtc_count;
> @@ -844,8 +844,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
>   		dpu_rm_destroy(&dpu_kms->rm);
>   	dpu_kms->rm_init = false;
>   
> -	if (dpu_kms->catalog)
> -		dpu_hw_catalog_deinit(dpu_kms->catalog);
>   	dpu_kms->catalog = NULL;
>   
>   	if (dpu_kms->vbif[VBIF_NRT])
> @@ -907,7 +905,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   {
>   	int i;
>   	struct dpu_kms *dpu_kms;
> -	struct dpu_mdss_cfg *cat;
> +	const struct dpu_mdss_cfg *cat;
>   	struct dpu_hw_mdp *top;
>   
>   	dpu_kms = to_dpu_kms(kms);
> @@ -1095,7 +1093,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   
>   	pr_info("dpu hardware revision:0x%x\n", dpu_kms->core_rev);
>   
> -	dpu_kms->catalog = dpu_hw_catalog_init(dpu_kms->core_rev);
> +	dpu_kms->catalog = dpu_hw_catalog_init(dev->dev, dpu_kms->core_rev);
>   	if (IS_ERR_OR_NULL(dpu_kms->catalog)) {
>   		rc = PTR_ERR(dpu_kms->catalog);
>   		if (!dpu_kms->catalog)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 832a0769f2e7..ed80ed6784ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -69,7 +69,7 @@ struct dpu_kms {
>   	struct msm_kms base;
>   	struct drm_device *dev;
>   	int core_rev;
> -	struct dpu_mdss_cfg *catalog;
> +	const struct dpu_mdss_cfg *catalog;
>   
>   	/* io/register spaces: */
>   	void __iomem *mmio, *vbif[VBIF_MAX], *reg_dma;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index d8048b6862f9..71a4bdcf4ad8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -106,7 +106,7 @@ struct dpu_plane {
>   	bool is_rt_pipe;
>   	bool is_virtual;
>   	struct list_head mplane_list;
> -	struct dpu_mdss_cfg *catalog;
> +	const struct dpu_mdss_cfg *catalog;
>   };
>   
>   static const uint64_t supported_format_modifiers[] = {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 06f03e7081bc..73b3442e7467 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -95,7 +95,7 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>   }
>   
>   int dpu_rm_init(struct dpu_rm *rm,
> -		struct dpu_mdss_cfg *cat,
> +		const struct dpu_mdss_cfg *cat,
>   		void __iomem *mmio)
>   {
>   	int rc, i;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 2f34a31d8d0d..59de72b381f9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -42,7 +42,7 @@ struct dpu_rm {
>    * @Return: 0 on Success otherwise -ERROR
>    */
>   int dpu_rm_init(struct dpu_rm *rm,
> -		struct dpu_mdss_cfg *cat,
> +		const struct dpu_mdss_cfg *cat,
>   		void __iomem *mmio);
>   
>   /**
