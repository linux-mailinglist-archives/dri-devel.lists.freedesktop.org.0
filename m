Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEFF64CFCE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 19:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E505610E444;
	Wed, 14 Dec 2022 18:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA7110E444
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 18:56:33 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g7so12037268lfv.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 10:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iAXgv0FqZPp6QIE1p4AggR6c0tBhwxedxuB4UjUwAYk=;
 b=pAuFjz4IygxgeJ/oxxYilAxz9gu8rxLLD9Abptoxz/z4g5C3oh01+sDNMD4EQjHl8I
 7SffwShxzO/Yrkx10FvA4FfHt94r7pRmhR144YjqKE807AH157g3nzvv81MKPv+kS2Aa
 kNb9r2UVZ3su2RjugjW8eTrUPslchCeRVJJmSSoPxRJ0lR6YJLpin7/NCycvQQh2lFS9
 FXNr4KhaPAqsOKcy0iJDpo+6mgxQgFJagtaJInGlDaWWJj6Yt/OkYuepwDAXh279/59m
 HfhS4/e/YrJS0V8beZmuFG+Sl6K+ec6myLTFXUqR7qBWRbTetiC03RKEs6T7zkfHcTyh
 LLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iAXgv0FqZPp6QIE1p4AggR6c0tBhwxedxuB4UjUwAYk=;
 b=Al/8gIblg5ai7Fxc9vjAwQoMD2/bHOSZOA7U9BjY4KF0713I2sF7u7wqRR94Utio/n
 gwEXGMFSAgFbB65dOJAwyy5hy8sI59EsbEc6czrgAqePMEqDk+6C2hs1tMxX/PtwZCKp
 7TGL2qZaLLa+ZAljkMnNlJFv51fGWjar9vNj84FooCSUVf0x8icuI5633n3G8k/pm3ZI
 koZe1Vf7FUxvNwRWXYisCD0DfJE3Aio7ELeWWwnfFFGyBBvzS7Fc643qZqXeSTxug3SP
 5uHrPOF02o2jiCWqV1DAZ1rMDGFiAkySyE/jvVXKh7EnIsF8gFLf7DDeyUcg8aHcw73p
 nnFA==
X-Gm-Message-State: ANoB5plHzCMGItVUNzZSzB3oQvtDfKzK6qf+5h0LmEi9v8tAmDA/dqPD
 Krjkbh2V9m5AnUCswpjFRJQHlg==
X-Google-Smtp-Source: AA0mqf7tKHFcQgUDMIF6sSNxIcU2Z7dQJ6Y3iG+hcEiC2wXXGP4cyEjDdrTcg35JQSrt56nDMeQuWA==
X-Received: by 2002:a05:6512:1308:b0:4a4:68b8:9c35 with SMTP id
 x8-20020a056512130800b004a468b89c35mr8293375lfu.29.1671044191866; 
 Wed, 14 Dec 2022 10:56:31 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a19ca52000000b004b18163476esm895588lfj.112.2022.12.14.10.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 10:56:31 -0800 (PST)
Message-ID: <4b7b4fb0-b99b-1022-b0f6-e91a84e8d082@linaro.org>
Date: Wed, 14 Dec 2022 20:56:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 6/6] drm/msm/dpu: Disallow unallocated (DSC) resources
 to be returned
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Vinod Koul <vkoul@kernel.org>
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
 <20221213232207.113607-7-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221213232207.113607-7-marijn.suijten@somainline.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Haowen Bai <baihaowen@meizu.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/12/2022 01:22, Marijn Suijten wrote:
> In the event that the topology requests resources that have not been
> created by the system (because they are typically not represented in
> dpu_mdss_cfg ^1), the resource(s) in global_state (in this case DSC
> blocks) remain NULL but will still be returned out of
> dpu_rm_get_assigned_resources, where the caller expects to get an array
> containing num_blks valid pointers (but instead gets these NULLs).
> 
> To prevent this from happening, where null-pointer dereferences
> typically result in a hard-to-debug platform lockup, num_blks shouldn't
> increase past NULL blocks and will print an error and break instead.
> After all, max_blks represents the static size of the maximum number of
> blocks whereas the actual amount varies per platform.
> 
> In the specific case of DSC initial resource allocation should behave
> more like LMs and CTLs where NULL resources are skipped.  The current
> hardcoded mapping of DSC blocks should be loosened separately as DPU
> 5.0.0 introduced a crossbar where DSC blocks can be "somewhat" freely
> bound to any PP and CTL, but that hardcoding currently means that we
> will return an error when the topology reserves a DSC that isn't
> available, instead of looking for the next free one.
> 
> ^1: which can happen after a git rebase ended up moving additions to
> _dpu_cfg to a different struct which has the same patch context.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 73b3442e7467..dcbf03d2940a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -496,6 +496,11 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>   
>   	/* check if DSC required are allocated or not */
>   	for (i = 0; i < num_dsc; i++) {
> +		if (!rm->dsc_blks[i]) {
> +			DPU_ERROR("DSC %d does not exist\n", i);
> +			return -EIO;
> +		}
> +
>   		if (global_state->dsc_to_enc_id[i]) {
>   			DPU_ERROR("DSC %d is already allocated\n", i);
>   			return -EIO;
> @@ -660,6 +665,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>   				  blks_size, enc_id);
>   			break;
>   		}
> +		if (!hw_blks[i]) {
> +			DPU_ERROR("No more resource %d available to assign to enc %d\n",
> +				  type, enc_id);
> +			break;
> +		}
>   		blks[num_blks++] = hw_blks[i];
>   	}
>  

These two chunks should come as two separate patches, each having it's 
own Fixes tag.

-- 
With best wishes
Dmitry

