Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D406B45AE87
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 22:36:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099EB6E104;
	Tue, 23 Nov 2021 21:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCED46E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 21:36:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637703402; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: References: Cc: To: From: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=ZxlavI9NbXcvLJaF6cvSXVVud5NqFFeoEpqcsDMej1E=;
 b=aJdskTz47nNDmFytL81B9Jp+afE209NsrvsNgALU1KA0rJIW1kkaXbujCFg6TXfNIwWpJbQk
 nlyHfcvfYEN5IeYtBpjttU5Od3hwjDwzwLrqTZHz+9idvJpQAyeGzcdLUv+FRsthWOu16mOR
 IbIq1JCNYA+765setMxrpSbyvQ4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 619d5ee74fca5da46d36d311 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 21:36:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5D8EFC43618; Tue, 23 Nov 2021 21:36:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.0
Received: from [192.168.1.5] (unknown [117.211.32.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C484FC4338F;
 Tue, 23 Nov 2021 21:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C484FC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <5c8e8c7a-46d0-62b0-e730-cc5b980cc21a@codeaurora.org>
Date: Wed, 24 Nov 2021 03:06:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 6/6] drm/msm/a6xx: Add a few gmu buffers to coredump
Content-Language: en-US
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>
References: <20211124024436.v2.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
 <20211124024436.v2.6.Ibfca354efaf274142593a6dbfbedb3de31918ff6@changeid>
In-Reply-To: <20211124024436.v2.6.Ibfca354efaf274142593a6dbfbedb3de31918ff6@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Matthias Kaehlcke <mka@chromium.org>,
 =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/24/2021 2:47 AM, Akhil P Oommen wrote:
> Add a few more gmu buffers to coredump to help debug gmu
> issues.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
> 
> (no changes since v1)
> 
>   drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 157 +++++++++++++++++++---------
>   1 file changed, 108 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index e6f5571..0cb6551 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -13,12 +13,22 @@ struct a6xx_gpu_state_obj {
>   	u32 *data;
>   };
>   
> +struct a6xx_gmu_state {
> +	struct a6xx_gpu_state_obj *registers;
> +	int nr_registers;
> +
> +	struct msm_gpu_state_bo *log_bo;
> +
> +	struct msm_gpu_state_bo *hfi_bo;
> +
> +	struct msm_gpu_state_bo *debug_bo;
> +
> +	struct msm_gpu_state_bo *mem_bin_bo[2];
> +};
> +
>   struct a6xx_gpu_state {
>   	struct msm_gpu_state base;
>   
> -	struct a6xx_gpu_state_obj *gmu_registers;
> -	int nr_gmu_registers;
> -
>   	struct a6xx_gpu_state_obj *registers;
>   	int nr_registers;
>   
> @@ -42,7 +52,7 @@ struct a6xx_gpu_state {
>   	struct a6xx_gpu_state_obj *cx_debugbus;
>   	int nr_cx_debugbus;
>   
> -	struct msm_gpu_state_bo *gmu_log;
> +	struct a6xx_gmu_state gmu_state;
>   
>   	struct list_head objs;
>   };
> @@ -777,20 +787,21 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	struct a6xx_gmu_state *gmu_state = &a6xx_state->gmu_state;
>   
> -	a6xx_state->gmu_registers = state_kcalloc(a6xx_state,
> -		2, sizeof(*a6xx_state->gmu_registers));
> +	gmu_state->registers = state_kcalloc(a6xx_state,
> +		2, sizeof(*gmu_state->registers));
>   
> -	if (!a6xx_state->gmu_registers)
> +	if (!gmu_state->registers)
>   		return;
>   
> -	a6xx_state->nr_gmu_registers = 2;
> +	gmu_state->nr_registers = 2;
>   
>   	/* Get the CX GMU registers from AHB */
>   	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[0],
> -		&a6xx_state->gmu_registers[0], false);
> +		&gmu_state->registers[0], false);
>   	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
> -		&a6xx_state->gmu_registers[1], true);
> +		&gmu_state->registers[1], true);
>   
>   	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
>   		return;
> @@ -799,31 +810,46 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
>   	gpu_write(gpu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
>   
>   	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[2],
> -		&a6xx_state->gmu_registers[2], false);
> +		&gmu_state->registers[2], false);
> +
> +	gmu_state->nr_registers = 3;

This is not required after rebasing on top of:
https://lore.kernel.org/all/20211103153049.1.Idfa574ccb529d17b69db3a1852e49b580132035c@changeid/

-Akhil.

>   }
>   
> -static void a6xx_get_gmu_log(struct msm_gpu *gpu,
> +static void a6xx_get_gmu_bo(struct a6xx_gpu_state *a6xx_state,
> +		struct a6xx_gmu_bo *gmu_bo, struct msm_gpu_state_bo **dest_bo)
> +{
> +	struct msm_gpu_state_bo *bo;
> +
> +	bo = state_kcalloc(a6xx_state, 1, sizeof(**dest_bo));
> +	if (!bo)
> +		return;
> +
> +	bo->iova = gmu_bo->iova;
> +	bo->size = gmu_bo->size;
> +	bo->data = kvzalloc(bo->size, GFP_KERNEL);
> +	if (!bo->data)
> +		return;
> +
> +	memcpy(bo->data, gmu_bo->virt, gmu_bo->size);
> +
> +	*dest_bo = bo;
> +}
> +
> +static void a6xx_get_gmu_state(struct msm_gpu *gpu,
>   		struct a6xx_gpu_state *a6xx_state)
>   {
> +	struct a6xx_gmu_state *gmu_state = &a6xx_state->gmu_state;
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>   	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> -	struct msm_gpu_state_bo *gmu_log;
>   
> -	gmu_log = state_kcalloc(a6xx_state,
> -		1, sizeof(*a6xx_state->gmu_log));
> -	if (!gmu_log)
> -		return;
> +	a6xx_get_gmu_registers(gpu, a6xx_state);
>   
> -	gmu_log->iova = gmu->log.iova;
> -	gmu_log->size = gmu->log.size;
> -	gmu_log->data = kvzalloc(gmu_log->size, GFP_KERNEL);
> -	if (!gmu_log->data)
> -		return;
> +	a6xx_get_gmu_bo(a6xx_state, &gmu->log, &gmu_state->log_bo);
>   
> -	memcpy(gmu_log->data, gmu->log.virt, gmu->log.size);
> +	a6xx_get_gmu_bo(a6xx_state, &gmu->hfi, &gmu_state->hfi_bo);
>   
> -	a6xx_state->gmu_log = gmu_log;
> +	a6xx_get_gmu_bo(a6xx_state, &gmu->debug, &gmu_state->debug_bo);
>   }
>   
>   #define A6XX_GBIF_REGLIST_SIZE   1
> @@ -961,9 +987,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
>   	/* Get the generic state from the adreno core */
>   	adreno_gpu_state_get(gpu, &a6xx_state->base);
>   
> -	a6xx_get_gmu_registers(gpu, a6xx_state);
> -
> -	a6xx_get_gmu_log(gpu, a6xx_state);
> +	a6xx_get_gmu_state(gpu, a6xx_state);
>   
>   	/* If GX isn't on the rest of the data isn't going to be accessible */
>   	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
> @@ -1005,9 +1029,16 @@ static void a6xx_gpu_state_destroy(struct kref *kref)
>   			struct msm_gpu_state, ref);
>   	struct a6xx_gpu_state *a6xx_state = container_of(state,
>   			struct a6xx_gpu_state, base);
> +	struct a6xx_gmu_state *gmu_state = &a6xx_state->gmu_state;
>   
> -	if (a6xx_state->gmu_log && a6xx_state->gmu_log->data)
> -		kvfree(a6xx_state->gmu_log->data);
> +	if (gmu_state->log_bo && gmu_state->log_bo->data)
> +		kvfree(gmu_state->log_bo->data);
> +
> +	if (gmu_state->hfi_bo && gmu_state->hfi_bo->data)
> +		kvfree(gmu_state->hfi_bo->data);
> +
> +	if (gmu_state->debug_bo && gmu_state->debug_bo->data)
> +		kvfree(gmu_state->debug_bo->data);
>   
>   	list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node)
>   		kfree(obj);
> @@ -1210,31 +1241,43 @@ static void a6xx_show_debugbus(struct a6xx_gpu_state *a6xx_state,
>   	}
>   }
>   
> -void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
> -		struct drm_printer *p)
> +void a6xx_gmu_show(struct a6xx_gmu_state *gmu_state, struct drm_printer *p)
>   {
> -	struct a6xx_gpu_state *a6xx_state = container_of(state,
> -			struct a6xx_gpu_state, base);
>   	int i;
>   
> -	if (IS_ERR_OR_NULL(state))
> -		return;
> +	drm_puts(p, "gmu-log:\n");
> +	if (gmu_state->log_bo) {
> +		struct msm_gpu_state_bo *log_bo = gmu_state->log_bo;
>   
> -	adreno_show(gpu, state, p);
> +		drm_printf(p, "    iova: 0x%016llx\n", log_bo->iova);
> +		drm_printf(p, "    size: %zu\n", log_bo->size);
> +		adreno_show_object(p, &log_bo->data, log_bo->size,
> +				&log_bo->encoded);
> +	}
>   
> -	drm_puts(p, "gmu-log:\n");
> -	if (a6xx_state->gmu_log) {
> -		struct msm_gpu_state_bo *gmu_log = a6xx_state->gmu_log;
> +	drm_puts(p, "gmu-hfi:\n");
> +	if (gmu_state->hfi_bo) {
> +		struct msm_gpu_state_bo *hfi_bo = gmu_state->hfi_bo;
>   
> -		drm_printf(p, "    iova: 0x%016llx\n", gmu_log->iova);
> -		drm_printf(p, "    size: %zu\n", gmu_log->size);
> -		adreno_show_object(p, &gmu_log->data, gmu_log->size,
> -				&gmu_log->encoded);
> +		drm_printf(p, "    iova: 0x%016llx\n", hfi_bo->iova);
> +		drm_printf(p, "    size: %zu\n", hfi_bo->size);
> +		adreno_show_object(p, &hfi_bo->data, hfi_bo->size,
> +				&hfi_bo->encoded);
>   	}
>   
> -	drm_puts(p, "registers:\n");
> -	for (i = 0; i < a6xx_state->nr_registers; i++) {
> -		struct a6xx_gpu_state_obj *obj = &a6xx_state->registers[i];
> +	drm_puts(p, "gmu-debug:\n");
> +	if (gmu_state->debug_bo) {
> +		struct msm_gpu_state_bo *debug_bo = gmu_state->debug_bo;
> +
> +		drm_printf(p, "    iova: 0x%016llx\n", debug_bo->iova);
> +		drm_printf(p, "    size: %zu\n", debug_bo->size);
> +		adreno_show_object(p, &debug_bo->data, debug_bo->size,
> +				&debug_bo->encoded);
> +	}
> +
> +	drm_puts(p, "registers-gmu:\n");
> +	for (i = 0; i < gmu_state->nr_registers; i++) {
> +		struct a6xx_gpu_state_obj *obj = &gmu_state->registers[i];
>   		const struct a6xx_registers *regs = obj->handle;
>   
>   		if (!obj->handle)
> @@ -1242,10 +1285,26 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>   
>   		a6xx_show_registers(regs->registers, obj->data, regs->count, p);
>   	}
> +}
>   
> -	drm_puts(p, "registers-gmu:\n");
> -	for (i = 0; i < a6xx_state->nr_gmu_registers; i++) {
> -		struct a6xx_gpu_state_obj *obj = &a6xx_state->gmu_registers[i];
> +
> +void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
> +		struct drm_printer *p)
> +{
> +	struct a6xx_gpu_state *a6xx_state = container_of(state,
> +			struct a6xx_gpu_state, base);
> +	int i;
> +
> +	if (IS_ERR_OR_NULL(state))
> +		return;
> +
> +	adreno_show(gpu, state, p);
> +
> +	a6xx_gmu_show(&a6xx_state->gmu_state, p);
> +
> +	drm_puts(p, "registers:\n");
> +	for (i = 0; i < a6xx_state->nr_registers; i++) {
> +		struct a6xx_gpu_state_obj *obj = &a6xx_state->registers[i];
>   		const struct a6xx_registers *regs = obj->handle;
>   
>   		if (!obj->handle)
> 

