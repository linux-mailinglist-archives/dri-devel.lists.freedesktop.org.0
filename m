Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72013EF889
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 05:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65AF6E32F;
	Wed, 18 Aug 2021 03:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4806E32F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 03:31:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629257466; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jT9vAJrXeAs90INAmemWptbPAP4ag0i3i9/El8V0x0w=;
 b=O/12NJsNdpEBiMGdxGA5u0Qbpjom8M0ZX6PD3qH53x8rhfSUypJUxCDLL+3LoDlFHtUOV+XN
 YaoEw2hbnhoObf21UlaKf4Tw23Dd0gOOBuR5C7N+cSEOrS6jS6yzf+FcxeBtOz5OSwoLUFVr
 bxotQv3J605LK4x1+ITTnXKv5Lw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 611c7eee66ff10790465e5b2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 18 Aug 2021 03:30:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3E7D5C43617; Wed, 18 Aug 2021 03:30:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D815C4338F;
 Wed, 18 Aug 2021 03:30:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 17 Aug 2021 20:30:51 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 5/7] drm/msm/dpu: remove extra wrappers
 around dpu_core_irq
In-Reply-To: <20210617222029.463045-6-dmitry.baryshkov@linaro.org>
References: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
 <20210617222029.463045-6-dmitry.baryshkov@linaro.org>
Message-ID: <683503488b598a2023456f081b1d77df@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-17 15:20, Dmitry Baryshkov wrote:
> Remove extra dpu_irq_* wrappers from dpu_kms.c, merge them directly 
> into
> dpu_core_irq_* functions.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  | 12 ++++-----
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  9 ++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 27 +++----------------
>  3 files changed, 15 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> index 44ab97fb2964..afc8cd546368 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> @@ -10,24 +10,24 @@
> 
>  /**
>   * dpu_core_irq_preinstall - perform pre-installation of core IRQ 
> handler
> - * @dpu_kms:		DPU handle
> + * @kms:		MSM KMS handle
>   * @return:		none
>   */
> -void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms);
> +void dpu_core_irq_preinstall(struct msm_kms *kms);
> 
>  /**
>   * dpu_core_irq_uninstall - uninstall core IRQ handler
> - * @dpu_kms:		DPU handle
> + * @kms:		MSM KMS handle
>   * @return:		none
>   */
> -void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms);
> +void dpu_core_irq_uninstall(struct msm_kms *kms);
> 
>  /**
>   * dpu_core_irq - core IRQ handler
> - * @dpu_kms:		DPU handle
> + * @kms:		MSM KMS handle
>   * @return:		interrupt handling status
>   */
> -irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms);
> +irqreturn_t dpu_core_irq(struct msm_kms *kms);
> 
>  /**
>   * dpu_core_irq_read - IRQ helper function for reading IRQ status
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 7062e7f0e860..9b74cfdf5355 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -140,8 +140,9 @@ static void dpu_core_irq_callback_handler(struct
> dpu_kms *dpu_kms, int irq_idx)
> 
> 	dpu_kms->hw_intr->irq_tbl[irq_idx].cb(dpu_kms->hw_intr->irq_tbl[irq_idx].arg,
> irq_idx);
>  }
> 
> -irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
> +irqreturn_t dpu_core_irq(struct msm_kms *kms)
>  {
> +	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>  	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
>  	int reg_idx;
>  	int irq_idx;
> @@ -526,8 +527,9 @@ void dpu_debugfs_core_irq_init(struct dpu_kms 
> *dpu_kms,
>  }
>  #endif
> 
> -void dpu_core_irq_preinstall(struct dpu_kms *dpu_kms)
> +void dpu_core_irq_preinstall(struct msm_kms *kms)
>  {
> +	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>  	int i;
> 
>  	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> @@ -539,8 +541,9 @@ void dpu_core_irq_preinstall(struct dpu_kms 
> *dpu_kms)
>  		atomic_set(&dpu_kms->hw_intr->irq_tbl[i].count, 0);
>  }
> 
> -void dpu_core_irq_uninstall(struct dpu_kms *dpu_kms)
> +void dpu_core_irq_uninstall(struct msm_kms *kms)
>  {
> +	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
>  	int i;
> 
>  	pm_runtime_get_sync(&dpu_kms->pdev->dev);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 1d3a4f395e74..c1706205a514 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -761,20 +761,6 @@ static void _dpu_kms_set_encoder_mode(struct 
> msm_kms *kms,
>  			encoder->base.id, rc);
>  }
> 
> -static irqreturn_t dpu_irq(struct msm_kms *kms)
> -{
> -	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> -
> -	return dpu_core_irq(dpu_kms);
> -}
> -
> -static void dpu_irq_preinstall(struct msm_kms *kms)
> -{
> -	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> -
> -	dpu_core_irq_preinstall(dpu_kms);
> -}
> -
>  static int dpu_irq_postinstall(struct msm_kms *kms)
>  {
>  	struct msm_drm_private *priv;
> @@ -792,13 +778,6 @@ static int dpu_irq_postinstall(struct msm_kms 
> *kms)
>  	return 0;
>  }
> 
> -static void dpu_irq_uninstall(struct msm_kms *kms)
> -{
> -	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> -
> -	dpu_core_irq_uninstall(dpu_kms);
> -}
> -
>  static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state,
> struct msm_kms *kms)
>  {
>  	int i;
> @@ -846,10 +825,10 @@ static void dpu_kms_mdp_snapshot(struct
> msm_disp_state *disp_state, struct msm_k
> 
>  static const struct msm_kms_funcs kms_funcs = {
>  	.hw_init         = dpu_kms_hw_init,
> -	.irq_preinstall  = dpu_irq_preinstall,
> +	.irq_preinstall  = dpu_core_irq_preinstall,
>  	.irq_postinstall = dpu_irq_postinstall,
> -	.irq_uninstall   = dpu_irq_uninstall,
> -	.irq             = dpu_irq,
> +	.irq_uninstall   = dpu_core_irq_uninstall,
> +	.irq             = dpu_core_irq,
>  	.enable_commit   = dpu_kms_enable_commit,
>  	.disable_commit  = dpu_kms_disable_commit,
>  	.vsync_time      = dpu_kms_vsync_time,
