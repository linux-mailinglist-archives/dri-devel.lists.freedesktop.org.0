Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F63245AFB5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 00:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FE66E071;
	Tue, 23 Nov 2021 23:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A6C6E071
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 23:02:14 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id r26so1287237oiw.5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 15:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=U/YfcKuWu9IBkxXAjQ9Eru9NWliiwRlAFXbf84u64iw=;
 b=Qxx/ct/QAteIczIt6u1z/ZW2GAaejZjWOiZpUGS0Yz14806PSoc0ypAeotDWKBdgB5
 iSZU6eDDsfKo6Xv9k+NJ+UZeNUhCOzSVTPBeaT01bVwgfzXUnDacnVTBxrp8kqmlwJAX
 JsfYlrhqmJJar4p39sslfer/C/XeAqD/vxcoZF7v83XdNPeSx4ugo97leYM0YHLUUQBs
 FCG+RjnM2V0FydRVSUCNRCysVR1eboOi6owXfSQxeK9dpRIto2xOS+KKE3Lkax3DmjFm
 mK2G7X+Jn0wqTuQ9H+2DRkzsHFfKbanuY+RfLuPUbZpoIq3jUGB5IwbJismA+voJbqX4
 3Izg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U/YfcKuWu9IBkxXAjQ9Eru9NWliiwRlAFXbf84u64iw=;
 b=Wl3r3xMjMLvED1yx1Pacl5G0glC4s/Wqi2IJ9R4I7yURiFdOTIPdirb9UxP6FdXNYq
 KB2sgC8uG+P+9FmVTzcThRzTq/HReF275Krqok2xuycm30mM6tLVMaO6VBT20eLP4Y+a
 X0zfeFZ+i1D/XkRN+8a4AngiXl+6tcfOhUqAYICRdGpbkcUGQtwuO1teN0J0EuB+Pn/J
 SAeWReK1vRDJDBkv4ym+AtC9ymz0xzBqTf3Fw7sXoZKPbgYW4LH/g59Vq6uf0DeFKhuU
 upTAaeGvQ2A6B6cJN0oQGSicKE8omHn8cLrD5vXk/hN4yPkZTFYIjlo7ncLjJa/lAaPp
 F07A==
X-Gm-Message-State: AOAM532gUA/s8OY0zcFmjPbv3Jj+BR4yOBAysvGbxUmHi1OuqNFbf1fU
 S0xq0c0JZzlW5aKlX+5T+TX5FQ==
X-Google-Smtp-Source: ABdhPJzWaRUeQLHSrascFf1GNb0zer8lw+90WeJZXU4FLvAUr8grUNKxROvP8CF72Rh4EzXkv9Bn4w==
X-Received: by 2002:a05:6808:55:: with SMTP id
 v21mr1056533oic.174.1637708533242; 
 Tue, 23 Nov 2021 15:02:13 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id v12sm2450822ote.9.2021.11.23.15.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 15:02:12 -0800 (PST)
Date: Tue, 23 Nov 2021 15:03:55 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Akhil P Oommen <akhilpo@codeaurora.org>
Subject: Re: [PATCH v2 4/6] drm/msm/a6xx: Capture gmu log in devcoredump
Message-ID: <YZ1zW/9lsJNrVfqJ@ripper>
References: <20211124024436.v2.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
 <20211124024436.v2.4.Ibb71b3c64d6f98d586131a143c27fbdb233260a1@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124024436.v2.4.Ibb71b3c64d6f98d586131a143c27fbdb233260a1@changeid>
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
Cc: Sean Paul <sean@poorly.run>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, Linux Patches Robot
 <linux-patches-robot@chromeos-missing-patches.google.com.iam.gserviceaccount.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>, Matthias Kaehlcke <mka@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 St?phane Marchesin <marcheu@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 23 Nov 13:17 PST 2021, Akhil P Oommen wrote:

> Capture gmu log in coredump to enhance debugging.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
> 
> Changes in v2:
> - Fix kernel test robot's warning about size_t's format specifier
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 41 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  2 ++
>  3 files changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index e8f65cd..e6f5571 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -42,6 +42,8 @@ struct a6xx_gpu_state {
>  	struct a6xx_gpu_state_obj *cx_debugbus;
>  	int nr_cx_debugbus;
>  
> +	struct msm_gpu_state_bo *gmu_log;
> +
>  	struct list_head objs;
>  };
>  
> @@ -800,6 +802,30 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
>  		&a6xx_state->gmu_registers[2], false);
>  }
>  
> +static void a6xx_get_gmu_log(struct msm_gpu *gpu,
> +		struct a6xx_gpu_state *a6xx_state)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +	struct msm_gpu_state_bo *gmu_log;
> +
> +	gmu_log = state_kcalloc(a6xx_state,
> +		1, sizeof(*a6xx_state->gmu_log));

This line isn't even 80 chars long, so I see no reason to wrap it and if
you ran checkpatch --strict on this patch it would complain about how
you indent that second line as well.

It would also look better with sizeof(*gmu_log), even though they should
have the same size today...

> +	if (!gmu_log)
> +		return;
> +
> +	gmu_log->iova = gmu->log.iova;
> +	gmu_log->size = gmu->log.size;
> +	gmu_log->data = kvzalloc(gmu_log->size, GFP_KERNEL);
> +	if (!gmu_log->data)
> +		return;
> +
> +	memcpy(gmu_log->data, gmu->log.virt, gmu->log.size);
> +
> +	a6xx_state->gmu_log = gmu_log;
> +}
> +
>  #define A6XX_GBIF_REGLIST_SIZE   1
>  static void a6xx_get_registers(struct msm_gpu *gpu,
>  		struct a6xx_gpu_state *a6xx_state,
> @@ -937,6 +963,8 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
>  
>  	a6xx_get_gmu_registers(gpu, a6xx_state);
>  
> +	a6xx_get_gmu_log(gpu, a6xx_state);
> +
>  	/* If GX isn't on the rest of the data isn't going to be accessible */
>  	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
>  		return &a6xx_state->base;
> @@ -978,6 +1006,9 @@ static void a6xx_gpu_state_destroy(struct kref *kref)
>  	struct a6xx_gpu_state *a6xx_state = container_of(state,
>  			struct a6xx_gpu_state, base);
>  
> +	if (a6xx_state->gmu_log && a6xx_state->gmu_log->data)
> +		kvfree(a6xx_state->gmu_log->data);
> +
>  	list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node)
>  		kfree(obj);
>  
> @@ -1191,6 +1222,16 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>  
>  	adreno_show(gpu, state, p);
>  
> +	drm_puts(p, "gmu-log:\n");
> +	if (a6xx_state->gmu_log) {
> +		struct msm_gpu_state_bo *gmu_log = a6xx_state->gmu_log;
> +
> +		drm_printf(p, "    iova: 0x%016llx\n", gmu_log->iova);
> +		drm_printf(p, "    size: %zu\n", gmu_log->size);
> +		adreno_show_object(p, &gmu_log->data, gmu_log->size,
> +				&gmu_log->encoded);
> +	}
> +
>  	drm_puts(p, "registers:\n");
>  	for (i = 0; i < a6xx_state->nr_registers; i++) {
>  		struct a6xx_gpu_state_obj *obj = &a6xx_state->registers[i];
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 1539b8e..b43346e 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -638,7 +638,7 @@ static char *adreno_gpu_ascii85_encode(u32 *src, size_t len)
>  }
>  
>  /* len is expected to be in bytes */
> -static void adreno_show_object(struct drm_printer *p, void **ptr, int len,
> +void adreno_show_object(struct drm_printer *p, void **ptr, int len,
>  		bool *encoded)

Please indent your broken lines by the ( on the line before.

Regards,
Bjorn

>  {
>  	if (!*ptr || !len)
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 225c277..6762308 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -306,6 +306,8 @@ void adreno_gpu_state_destroy(struct msm_gpu_state *state);
>  
>  int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state);
>  int adreno_gpu_state_put(struct msm_gpu_state *state);
> +void adreno_show_object(struct drm_printer *p, void **ptr, int len,
> +		bool *encoded);
>  
>  /*
>   * Common helper function to initialize the default address space for arm-smmu
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation.
> 
