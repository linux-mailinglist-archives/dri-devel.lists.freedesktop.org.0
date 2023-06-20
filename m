Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E83D3736A05
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 12:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3923F10E2BD;
	Tue, 20 Jun 2023 10:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D102D10E2BD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 10:56:49 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b47bfd4e45so27463491fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 03:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687258608; x=1689850608;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oFqY3JPIOHhrCDWe7opJVMIu2iuwa1Q7D1xQRKlMgbQ=;
 b=uRLcWOUWpEIQl6vz1xWRgHsilN6LvWK3L/02cDKUqJHNnzb4hwG+pxYVHl/+VYASRF
 nC6X79mVaUbV2G3YKCFY+lC/JYjNGWR5fp2Dbn59T9gHCSXoCxjbnHE5Zl8TkDBgREVv
 Ai9Et1hrlL9UIRmTGf8A3LJCO+iXgq580QUmnWOecZ5Ve9+3vaYkjoZ5En5Z/A7RJ+48
 BTkiJojsH97sqWJdy5YbfYSZUW3r8hiOs7z7x+UfIjWe+U5Iz9TCjgQAbnF+K2FHK7GG
 4RiGrnb2D6TdyK+8NK3Qa+uDZW5RDxhdETLXy7inyxXF6T64XzUiwAqZLh8jZKONWhCp
 Oc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687258608; x=1689850608;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oFqY3JPIOHhrCDWe7opJVMIu2iuwa1Q7D1xQRKlMgbQ=;
 b=D56hmIObAExHoOncZC6lQqUqxL60+gVHhCBT5qB5eWsxz4J0XEsayspJ8/V4zm3b9K
 O8YeWrCKiZMoOwOjqKt5nfp9UOGxL3jS2dx3Cbco1Sl9Zgf4dU85I/RpIpbfkyPwQsAy
 xHSYVhHilJluFqcPI5IW0z/T4XgWpO7RlH77VTIjjlJrNyEFrteQUhI3uLdo+vwibZfr
 hpgJ3GXwmjKA0hTgD21sSoUz5epPKk+veWFgdlcizjCSNX662qH3n9XoPr2VMLSbLujf
 IetSBK9GVn7YQq5X0uNT79HwpkhDxdjrDLXJrQKAYBJJP/Zkdd8fHJcMpobKad36A96q
 CZiw==
X-Gm-Message-State: AC+VfDzgZN7riL0EM3VxpNAYe4cfKLlNMhK/h7WkhjeoamYbzZK6qerZ
 wKriVe8PISMApySfdzEkHs+WaQ==
X-Google-Smtp-Source: ACHHUZ6hCNdrCmb27LQnbm+NLckOTiA3YD8TuMMSXhmHUe5FnN3n3LlMF3AW9/tFmXxA+iXnNOXJsg==
X-Received: by 2002:a2e:a601:0:b0:2b4:4bb7:2618 with SMTP id
 v1-20020a2ea601000000b002b44bb72618mr7652691ljp.19.1687258608115; 
 Tue, 20 Jun 2023 03:56:48 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 h19-20020a2eb0f3000000b002b3318c8d6fsm359850ljl.28.2023.06.20.03.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:56:47 -0700 (PDT)
Message-ID: <331b4f84-a852-3197-f26a-4f1f0368ef70@linaro.org>
Date: Tue, 20 Jun 2023 12:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 8/8] drm/msm/dpu: remove unused fields from struct
 dpu_core_perf
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-9-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230620000846.946925-9-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.06.2023 02:08, Dmitry Baryshkov wrote:
> Remove dpu_core_perf::dev and dpu_core_perf::debugfs_root fields, they
> are not used by the code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 4 ----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 2 +-
>  3 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index f779ad544347..7f110d15b101 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -395,11 +395,9 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>  #endif
>  
>  int dpu_core_perf_init(struct dpu_core_perf *perf,
> -		struct drm_device *dev,
>  		const struct dpu_perf_cfg *perf_cfg,
>  		struct clk *core_clk)
>  {
> -	perf->dev = dev;
>  	perf->perf_cfg = perf_cfg;
>  	perf->core_clk = core_clk;
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index e1198c104b5e..623e2d058695 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -27,7 +27,6 @@ struct dpu_core_perf_params {
>  /**
>   * struct dpu_core_perf - definition of core performance context
>   * @dev: Pointer to drm device
> - * @debugfs_root: top level debug folder
>   * @perf_cfg: Platform-specific performance configuration
>   * @core_clk: Pointer to the core clock
>   * @core_clk_rate: current core clock rate
> @@ -36,8 +35,6 @@ struct dpu_core_perf_params {
>   * @enable_bw_release: debug control for bandwidth release
>   */
>  struct dpu_core_perf {
> -	struct drm_device *dev;
> -	struct dentry *debugfs_root;
>  	const struct dpu_perf_cfg *perf_cfg;
>  	struct clk *core_clk;
>  	u64 core_clk_rate;
> @@ -77,7 +74,6 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
>   * @core_clk: pointer to core clock
>   */
>  int dpu_core_perf_init(struct dpu_core_perf *perf,
> -		struct drm_device *dev,
>  		const struct dpu_perf_cfg *perf_cfg,
>  		struct clk *core_clk);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 4439147d2c35..5297cec68c9c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1115,7 +1115,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  		dpu_kms->hw_vbif[vbif->id] = hw;
>  	}
>  
> -	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog->perf,
> +	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf,
>  			msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, "core"));
>  	if (rc) {
>  		DPU_ERROR("failed to init perf %d\n", rc);
