Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FFC4BBE56
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 18:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B2610EE29;
	Fri, 18 Feb 2022 17:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEBF10EE29
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 17:26:42 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id c10so5293748ljr.9
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 09:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZYe2t/FMZ93x2Kic1ao1JKybApih1A56RL1y9i2FhLE=;
 b=gOzR/3gjf7/yY5lV5TZ57e/x1QHxbFE+SzLfqHEUg96Sgohxk75AEOBey92ZQc0yen
 4aThrlFgnRNf9Z68Q3QFatelLW9CVGwuBcW36NUiY4xO1gMmIPMkP+kho7g8aOG8ifL/
 yJkCIbLgpPXbQ3o35h4BggnBXVBhURaMExrK8uukcO82l+LdThbMAp/h+DKVZ+grqSh9
 s8l9HHb/JNFM5ttGIW9a1vz10ButIC84JkWcSsHyr2BEA40yNmf/Ig37ndCdp5XWrs2N
 JzB4n7vom3dKNRvlqiuYWluuxWMgOykrBmx9eq8BE49uM0RSwVgS8NQdOUpMzkpuCBi1
 PNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZYe2t/FMZ93x2Kic1ao1JKybApih1A56RL1y9i2FhLE=;
 b=oifJS5qzM0vU4Q5YQIGkv/2JQlUtDQS2VHYBrY33dsqvgr5jv1MGpgU2R9Q3d5LMPN
 ft757vwf5EqNK2435K142t8AgfICvg8KyjoiITHU8RtqBRPAdhs+n5Oqad5s2bsAjhzH
 FuvKC/i7n6vrjawq3E2+8n8XwXDe39mY6Lf1HWXBFkHmYt8fpXJdxBO79Dk5ggBRkx/k
 h13k/k7bNNQnOPzv8i6oiFM+x10ne9amrlW5n0eQ1yEpRuKuuWkkCg1C8pQNwAXgU/cQ
 V5T64M02eIz17ScaHAHf8h0ERGadJKri+C0V4QOXNy4DUrtKuhlp0V/+q6ZelMw995cN
 PjCg==
X-Gm-Message-State: AOAM531E3oqjd9RNZGuYp9JjNnpUK066dFn7+lM4jpQm355EbzEjs3Ul
 huy3YfebeJ7nsaOdMZtUaiGffQ==
X-Google-Smtp-Source: ABdhPJzF6KsEJtgTA6aUDgNsa2gJAo/6KzTixWf4JHc5zKVLW0gmtaXhNhMuSUe6ZlrOXZsTogAVWQ==
X-Received: by 2002:a2e:99d1:0:b0:244:bad9:4ab7 with SMTP id
 l17-20020a2e99d1000000b00244bad94ab7mr6398922ljj.269.1645205200824; 
 Fri, 18 Feb 2022 09:26:40 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id r3sm272173lfi.260.2022.02.18.09.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 09:26:40 -0800 (PST)
Message-ID: <fab2ccb6-9c00-90cb-5986-8e1544c14596@linaro.org>
Date: Fri, 18 Feb 2022 20:26:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Fix timeout issues on command mode
 panels
Content-Language: en-GB
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 robdclark@gmail.com
References: <20210911163919.47173-1-angelogioacchino.delregno@somainline.org>
 <20210911163919.47173-2-angelogioacchino.delregno@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20210911163919.47173-2-angelogioacchino.delregno@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 paul.bouchara@somainline.org, martin.botka@somainline.org,
 abhinavk@codeaurora.org, marijn.suijten@somainline.org,
 phone-devel@vger.kernel.org, sean@poorly.run,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/09/2021 19:39, AngeloGioacchino Del Regno wrote:
> In function dpu_encoder_phys_cmd_wait_for_commit_done we are always
> checking if the relative CTL is started by waiting for an interrupt
> to fire: it is fine to do that, but then sometimes we call this
> function while the CTL is up and has never been put down, but that
> interrupt gets raised only when the CTL gets a state change from
> 0 to 1 (disabled to enabled), so we're going to wait for something
> that will never happen on its own.
> 
> Solving this while avoiding to restart the CTL is actually possible
> and can be done by just checking if it is already up and running
> when the wait_for_commit_done function is called: in this case, so,
> if the CTL was already running, we can say that the commit is done
> if the command transmission is complete (in other terms, if the
> interface has been flushed).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index aa01698d6b25..aa5d3b3cef15 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -682,6 +682,9 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
>   	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
>   		return 0;
>   
> +	if (phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
> +		return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
> +
>   	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
>   }
>   


-- 
With best wishes
Dmitry
