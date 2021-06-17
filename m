Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F55D3ABC3C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 21:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3A689ABE;
	Thu, 17 Jun 2021 19:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9506689ABE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 19:01:26 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 67-20020a4a01460000b0290245b81f6261so1839560oor.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 12:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=E++DQOt77szh/fmlN/PQYj42i6qU3Xa7n/OzxH5cSgk=;
 b=a9obQjk8sUlvRY+Yr2yL3cTIwGypZu4T8SO2M7zx8F2mMqIQKAvzNjPrF9ATGneCA7
 y2OdydonrN72f7RPAR+x41X6vCjHbJmrZ8Bvbxj940fBKXBKMuQbLfQHCVnrMxDxiZn1
 rrfNl+1ZHYWtMkywdYOWnCEpftyVET8zDjK8IgnO4Yzd0mY9UQWrPkivdKO0fiOgYeCI
 MrRg7HMrG8hfviXPRPGjEv9drReeWL+KHRDX0YOYR/k8I1U5X9MRfjjqzk7GOnWGezBU
 69BNhGIVKvOaLxfcYgvOmoHZuu67AVt3xxKiIFda3mjyDaA3kSILyH/+F3hVCNxFE/n1
 3FNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E++DQOt77szh/fmlN/PQYj42i6qU3Xa7n/OzxH5cSgk=;
 b=fg0CU31OCdbyKKfbUQyqcr4S9IugtITmp7oi90Bm545VtuW6bVz/MuqNR9S6gIzQE+
 o2JGylvjuEViSa5AIzIckZ7bDL18RK5f/mwUCGsQsKI+fueoh7E2ZwxcxCzCkzhg5pX+
 fto+fJMX6IUdpqEIHqO8JC8KpBSqmQtE286YSENo5r8TZqQD/o/aPj+3HAtk4gKSeU12
 3zYW0p9GXjaTxVrvWo+TMwhKrWx/KeNexYoYZbl4YNupUdoEOLjLUbwVnAF42IWGYoUd
 x4nNP5iUsao45mjClXYr4FAcTWyVmXEUBH+X6/ChWjTWLk3G/WeZXloRA36F5sqRGP+T
 Xy6w==
X-Gm-Message-State: AOAM531B9jUS3hjvN02Az3M8UtmJTUZEvQQO9PRECqSSihxqwoogrCMU
 +ZbIExUVh4NH3OW6PToe9p462A==
X-Google-Smtp-Source: ABdhPJyCeAA+qCRRzFCyO89b4CWpIr+0fRiH8b0DBTnyiffjcBeBDE4leiHx5ACLaSP79vjCs4vLWw==
X-Received: by 2002:a4a:952b:: with SMTP id m40mr5688926ooi.69.1623956485692; 
 Thu, 17 Jun 2021 12:01:25 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 15sm1272482oij.26.2021.06.17.12.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:01:25 -0700 (PDT)
Date: Thu, 17 Jun 2021 14:01:23 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 4/7] drm/msm/dpu: hide struct dpu_irq_callback
Message-ID: <YMucAx2I4px12wgQ@yoga>
References: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
 <20210617140908.412298-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617140908.412298-5-dmitry.baryshkov@linaro.org>
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
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 17 Jun 09:09 CDT 2021, Dmitry Baryshkov wrote:

> The struct dpu_irq_callbacks looks internal to IRQ handling code. Hide
> it from the rest of the DPU driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  | 18 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  6 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 10 ++-
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  6 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 62 ++++++++++++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       | 12 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  8 +--
>  8 files changed, 69 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> index 90ae6c9ccc95..44ab97fb2964 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
> @@ -46,10 +46,8 @@ u32 dpu_core_irq_read(
>   *                             interrupt
>   * @dpu_kms:		DPU handle
>   * @irq_idx:		irq index
> - * @irq_cb:		IRQ callback structure, containing callback function
> - *			and argument. Passing NULL for irq_cb will unregister
> - *			the callback for the given irq_idx
> - *			This must exist until un-registration.
> + * @irq_cb:		IRQ callback funcion.
> + * @irq_arg:		IRQ callback argument.
>   * @return:		0 for success registering callback, otherwise failure
>   *
>   * This function supports registration of multiple callbacks for each interrupt.
> @@ -57,17 +55,16 @@ u32 dpu_core_irq_read(
>  int dpu_core_irq_register_callback(
>  		struct dpu_kms *dpu_kms,
>  		int irq_idx,
> -		struct dpu_irq_callback *irq_cb);
> +		void (*irq_cb)(void *arg, int irq_idx),
> +		void *irq_arg);
>  
>  /**
>   * dpu_core_irq_unregister_callback - For unregistering callback function on IRQ
>   *                             interrupt
>   * @dpu_kms:		DPU handle
>   * @irq_idx:		irq index
> - * @irq_cb:		IRQ callback structure, containing callback function
> - *			and argument. Passing NULL for irq_cb will unregister
> - *			the callback for the given irq_idx
> - *			This must match with registration.
> + * @irq_cb:		IRQ callback funcion.
> + * @irq_arg:		IRQ callback argument.
>   * @return:		0 for success registering callback, otherwise failure
>   *
>   * This function supports registration of multiple callbacks for each interrupt.
> @@ -75,7 +72,8 @@ int dpu_core_irq_register_callback(
>  int dpu_core_irq_unregister_callback(
>  		struct dpu_kms *dpu_kms,
>  		int irq_idx,
> -		struct dpu_irq_callback *irq_cb);
> +		void (*irq_cb)(void *arg, int irq_idx),
> +		void *irq_arg);
>  
>  /**
>   * dpu_debugfs_core_irq_init - register core irq debugfs
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 7f06238a7c64..186b2f87d193 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -310,7 +310,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>  				      phys_enc->hw_pp->idx - PINGPONG_0,
>  				      atomic_read(wait_info->atomic_cnt));
>  			local_irq_save(flags);
> -			irq->cb.func(phys_enc, irq->irq_idx);
> +			irq->func(phys_enc, irq->irq_idx);
>  			local_irq_restore(flags);
>  			ret = 0;
>  		} else {
> @@ -352,7 +352,7 @@ int dpu_encoder_helper_register_irq(struct dpu_encoder_phys *phys_enc,
>  	}
>  
>  	ret = dpu_core_irq_register_callback(phys_enc->dpu_kms, irq->irq_idx,
> -			&irq->cb);
> +			irq->func, phys_enc);
>  	if (ret) {
>  		DPU_ERROR_PHYS(phys_enc,
>  			"failed to register IRQ callback for %s\n",
> @@ -384,7 +384,7 @@ int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
>  	}
>  
>  	ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms, irq->irq_idx,
> -			&irq->cb);
> +			irq->func, phys_enc);
>  	if (ret) {
>  		DRM_ERROR("unreg cb fail id=%u, intr=%d, irq=%d ret=%d",
>  			  DRMID(phys_enc->parent), intr_idx,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index e7270eb6b84b..80d87871fd94 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -174,7 +174,7 @@ struct dpu_encoder_irq {
>  	const char *name;
>  	enum dpu_intr_idx intr_idx;
>  	int irq_idx;
> -	struct dpu_irq_callback cb;
> +	void (*func)(void *arg, int irq_idx);
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index dba1219c6f1b..dbc8f0811dd1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -786,30 +786,28 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>  	phys_enc->enable_state = DPU_ENC_DISABLED;
>  	for (i = 0; i < INTR_IDX_MAX; i++) {
>  		irq = &phys_enc->irq[i];
> -		INIT_LIST_HEAD(&irq->cb.list);
>  		irq->irq_idx = -EINVAL;
> -		irq->cb.arg = phys_enc;
>  	}
>  
>  	irq = &phys_enc->irq[INTR_IDX_CTL_START];
>  	irq->name = "ctl_start";
>  	irq->intr_idx = INTR_IDX_CTL_START;
> -	irq->cb.func = dpu_encoder_phys_cmd_ctl_start_irq;
> +	irq->func = dpu_encoder_phys_cmd_ctl_start_irq;
>  
>  	irq = &phys_enc->irq[INTR_IDX_PINGPONG];
>  	irq->name = "pp_done";
>  	irq->intr_idx = INTR_IDX_PINGPONG;
> -	irq->cb.func = dpu_encoder_phys_cmd_pp_tx_done_irq;
> +	irq->func = dpu_encoder_phys_cmd_pp_tx_done_irq;
>  
>  	irq = &phys_enc->irq[INTR_IDX_RDPTR];
>  	irq->name = "pp_rd_ptr";
>  	irq->intr_idx = INTR_IDX_RDPTR;
> -	irq->cb.func = dpu_encoder_phys_cmd_pp_rd_ptr_irq;
> +	irq->func = dpu_encoder_phys_cmd_pp_rd_ptr_irq;
>  
>  	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
>  	irq->name = "underrun";
>  	irq->intr_idx = INTR_IDX_UNDERRUN;
> -	irq->cb.func = dpu_encoder_phys_cmd_underrun_irq;
> +	irq->func = dpu_encoder_phys_cmd_underrun_irq;
>  
>  	atomic_set(&phys_enc->vblank_refcount, 0);
>  	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 391b13b99c01..21722cdfaaf7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -728,20 +728,18 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>  	phys_enc->enc_spinlock = p->enc_spinlock;
>  	for (i = 0; i < INTR_IDX_MAX; i++) {
>  		irq = &phys_enc->irq[i];
> -		INIT_LIST_HEAD(&irq->cb.list);
>  		irq->irq_idx = -EINVAL;
> -		irq->cb.arg = phys_enc;
>  	}
>  
>  	irq = &phys_enc->irq[INTR_IDX_VSYNC];
>  	irq->name = "vsync_irq";
>  	irq->intr_idx = INTR_IDX_VSYNC;
> -	irq->cb.func = dpu_encoder_phys_vid_vblank_irq;
> +	irq->func = dpu_encoder_phys_vid_vblank_irq;
>  
>  	irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
>  	irq->name = "underrun";
>  	irq->intr_idx = INTR_IDX_UNDERRUN;
> -	irq->cb.func = dpu_encoder_phys_vid_underrun_irq;
> +	irq->func = dpu_encoder_phys_vid_underrun_irq;
>  
>  	atomic_set(&phys_enc->vblank_refcount, 0);
>  	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index e5dce884e7c0..73a20fc5c766 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -32,6 +32,18 @@
>  #define MDP_INTF_1_OFF_REV_7xxx             0x35000
>  #define MDP_INTF_5_OFF_REV_7xxx             0x39000
>  
> +/*
> + * struct dpu_irq_callback - IRQ callback handlers
> + * @list: list to callback
> + * @func: intr handler
> + * @arg: argument for the handler
> + */
> +struct dpu_irq_callback {
> +	struct list_head list;
> +	void (*func)(void *arg, int irq_idx);
> +	void *arg;
> +};
> +
>  /**
>   * struct dpu_intr_reg - array of DPU register sets
>   * @clr_off:	offset to CLEAR reg
> @@ -428,20 +440,19 @@ void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
>  }
>  
>  int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
> -		struct dpu_irq_callback *register_irq_cb)
> +		void (*irq_cb)(void *arg, int irq_idx),
> +		void *irq_arg)
>  {
>  	unsigned long irq_flags;
> +	struct dpu_irq_callback *register_irq_cb;
>  
>  	if (!dpu_kms->hw_intr->irq_cb_tbl) {
>  		DPU_ERROR("invalid params\n");
>  		return -EINVAL;
>  	}
>  
> -	if (!register_irq_cb || !register_irq_cb->func) {
> -		DPU_ERROR("invalid irq_cb:%d func:%d\n",
> -				register_irq_cb != NULL,
> -				register_irq_cb ?
> -					register_irq_cb->func != NULL : -1);
> +	if (!irq_cb) {
> +		DPU_ERROR("invalid ird_idx:%d irq_cb:%ps\n", irq_idx, irq_cb);
>  		return -EINVAL;
>  	}
>  
> @@ -452,9 +463,16 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,

At least the callbacks related to the interfaces are registered and
unregistered for every frame, so I would prefer that we don't
kzalloc()/kfree() in this code path.

I've unfortunately not been able to backtrack this fully, but I was
expecting something like that register the callbacks once and then
mask/unmask the interrupts as needed - in which case this patch looks
good.

Regards,
Bjorn
