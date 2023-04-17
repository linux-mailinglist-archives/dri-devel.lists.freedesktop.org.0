Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C591B6E4DBE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 17:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B17710E090;
	Mon, 17 Apr 2023 15:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5AC10E14C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 15:55:28 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id o8so5933188ljp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681746926; x=1684338926;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NXnWo8ByKKEVLIBG2kCqFrQuN4bfPUrFB2sr4C9Aorw=;
 b=Nt/yc5WB22wCJ8cKSZ/CWVsECG2X3iP9z8fDQlEHdiuZGdABnOPNozY2jYZXyVFop5
 LXI4PQPBde6K6siSpgoxpr6bqvqiq80P1Wd7r/mdU0VW+eTJihtUYhhXPi1ehonFGz56
 /3F8GJSBdUKEYBRaCom8GY7JJ0VkahAXjt5dP9BYydvAsHuHpI/j4FqjQWZVux9X+MOG
 uKWWUsAgTGoC8YkxMPuiuR/lvbvBabPNsmrrkPtRU/NjozNGFGuawtrObFxCEnn+KB1i
 C4DZV/2kcJ6im4xbao3hwr5GBVIUdVl7r8jULYfF00ded7QLFJF4BiyTT9OW4gYqOwno
 7WUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681746926; x=1684338926;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NXnWo8ByKKEVLIBG2kCqFrQuN4bfPUrFB2sr4C9Aorw=;
 b=b12h3eypcRICn7BxcfXhyhfR5itqCx/u+VIpNX2V1mZ2DeWVMinRo3XTtoT/6Ts1b3
 3Ex9/F7u3Ld2XSvc+U1JLeEVLoLqd0sezwcK0FAcMTxOJXKDCQJ1kaUc7jDLgC5lOrRT
 +nVKdQ/TH4p26+RmkuSQUXjnpS08a+lK00a6jgQ8GV3YLcmAKD0Uta44/Lw9tqY3hhcN
 uZUCSeP3DSh+wCNfu2KVVW63p4tbey76zwnanyBo++QM5I/PRpDIqXQMnahZm5+/dh93
 nVz/8lSztv3HcmZRmBS1vVGSFdeq+n/j/+UviB1K4ZpfERAvrQh4ALDJxDugQAysMIpe
 co4A==
X-Gm-Message-State: AAQBX9c+BZCNBnwjGhTS8//mEAQa4pqIovO9hF557N9YRdhVPbPJe/VG
 wZ3VyzhuFLsucwL7/jNlsDU+yA==
X-Google-Smtp-Source: AKy350anA5TDyJUtYhMpMxazg0hvvJ6ro1LyKRC+oUeWms2XAVX6FzeVEgCLR58kSSKfo1GKdE9lgQ==
X-Received: by 2002:a05:651c:23b:b0:2a8:bc34:c1d3 with SMTP id
 z27-20020a05651c023b00b002a8bc34c1d3mr1901161ljn.40.1681746925970; 
 Mon, 17 Apr 2023 08:55:25 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
 by smtp.gmail.com with ESMTPSA id
 d24-20020a2e3618000000b002a8aa82654asm1804649lja.60.2023.04.17.08.55.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 08:55:25 -0700 (PDT)
Message-ID: <f77bcfdc-e50e-d27b-6634-2095033c85d6@linaro.org>
Date: Mon, 17 Apr 2023 17:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 5/5] drm/msm/dpu1: Handle the reg bus ICC path
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <20230417-topic-dpu_regbus-v1-5-06fbdc1643c0@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v1-5-06fbdc1643c0@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.04.2023 17:30, Konrad Dybcio wrote:
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects.. from none to otherwise
> inexplicable DSI timeouts..
> 
> On the DPU side, we need to keep the bus alive. The vendor driver
> kickstarts it to max (300Mbps) throughput on first commit, but in
> exchange for some battery life in rare DPU-enabled-panel-disabled
> usecases, we can request it at DPU init and gate it at suspend.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
[...]
> @@ -1261,6 +1270,15 @@ static int __maybe_unused dpu_runtime_resume(struct device *dev)
>  		return rc;
>  	}
>  
> +	/*
> +	 * The vendor driver supports setting 76.8 / 150 / 300 Mbps on this
This should have obviously been M>B<ps..

Konrad
> +	 * path, but it seems to go for the highest level when display output
> +	 * is enabled and zero otherwise. For simplicity, we can assume that
> +	 * DPU being enabled and running implies that.
> +	 */
> +	if (dpu_kms->reg_bus_path)
> +		icc_set_bw(dpu_kms->reg_bus_path, 0, MBps_to_icc(300));
> +
>  	dpu_vbif_init_memtypes(dpu_kms);
>  
>  	drm_for_each_encoder(encoder, ddev)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index d5d9bec90705..c332381d58c4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -111,6 +111,7 @@ struct dpu_kms {
>  	atomic_t bandwidth_ref;
>  	struct icc_path *mdp_path[2];
>  	u32 num_mdp_paths;
> +	struct icc_path *reg_bus_path;
>  };
>  
>  struct vsync_info {
> 
