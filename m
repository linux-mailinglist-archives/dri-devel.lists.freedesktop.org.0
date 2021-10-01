Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C198E41F779
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 00:36:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89366E5A0;
	Fri,  1 Oct 2021 22:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979A16E59D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 22:36:05 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id j5so39310938lfg.8
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 15:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XXgMIfOKyq97KypYEc7j/J6+r5ZXueX7YTNTMv8Ua2k=;
 b=GP6c6KY/Hlx3hOXso9m3i2E+F1E0V2AdrpKUg8AEQxKtOaY+FO58/XnO0SKfPDMHr8
 iw+SY3OJmPMlUpQXaXWLKiprCx1hAZotQVTx82SdjQzQ1yy3jU1k/2bKNoSGNCVcQxoy
 zX3f1jIyTnXX4WW7L7D5qoP/YqCjZuo2ZbkpENj+Mdj9pZRgxgSMKMNNoaqVB8gXNXkZ
 FgwyFwAowACaKNNE6fyqzDpJVfaxn3AZzdA6K1pyzmFYNvu04m6Kev5k2MR/Uny1e/AW
 8u2TBcePVhtki9Qk+gsuNFQ/r7pvLwuDMOEfJxdrovAdX7y9QMlcntbhven5PDXzvbtk
 7yyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XXgMIfOKyq97KypYEc7j/J6+r5ZXueX7YTNTMv8Ua2k=;
 b=e1aj5eC1bA1yYq6TSQyiif+Uip0BbaTKhBfwKt7iGj0Lz26lQnOlwY5Q7dq/HMm6Bt
 scz1WWB9Y1LDzv92ePFU21mn9aw8qyLUayWA4sPNtHND/lMAbi4I78hQQqNFaInUG6vL
 TjTyIybYUeXsdOllpbXs+TyyaUO45eFSvV3EUbU4+fvucWFEDdaj1j2OpvFjUnoxnt76
 vKi6JNhlu2Z/JXtug8gtUobytV1xsDWsWL3f2zEPF6Qdb2Id4AZw+uj6HfIACH1V5in4
 bkNWhF/4j9bpQ5D1lXNsBs8TaUulqtk45sOwPogD+xPdUGzDvIkRj5nFc9XdpigJQqp+
 TdUQ==
X-Gm-Message-State: AOAM5323hkY/LgfUHUOogWws/KEd65R4AB6CC00m8jUXDfaXR68jQF93
 ccKqnvUkzytu/OiIvXUp1wuC5Q==
X-Google-Smtp-Source: ABdhPJxb7u6Y72mC3hsrEjK2CqiCaMW9Htd0Rk6JXyKdn/qJV4B/VmKbc09lODoXSU7xTEWIygYjXw==
X-Received: by 2002:a05:651c:150b:: with SMTP id
 e11mr509102ljf.289.1633127763821; 
 Fri, 01 Oct 2021 15:36:03 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x15sm584308lfe.129.2021.10.01.15.36.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 15:36:03 -0700 (PDT)
Subject: Re: [PATCH v2] drm: msm: adreno_gpu.c: Add and use pr_fmt(fmt)
To: zhaoxiao <zhaoxiao@uniontech.com>, robdclark@gmail.com, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch
Cc: jordan@cosmicpenguin.net, saiprakash.ranjan@codeaurora.org,
 jonathan@marek.ca, airlied@redhat.com, smasetty@codeaurora.org,
 konrad.dybcio@somainline.org, akhilpo@codeaurora.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210826022316.9559-1-zhaoxiao@uniontech.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <d41c34c1-cb22-25a0-2bd1-49f1ea177c21@linaro.org>
Date: Sat, 2 Oct 2021 01:36:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210826022316.9559-1-zhaoxiao@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/08/2021 05:23, zhaoxiao wrote:
> Use a more common logging style.
> 
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>

Your subject tells about pr_fmt(), while the patch itself changs 
printk()s to pr_info(). Could you please fix the commit subject and 
expand/correct commit message?

> ---
> v2:Remove the line: #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>     drivers/gpu/drm/msm/adreno/adreno_gpu.c:23:9: warning: 'pr_fmt' macro redefined [-Wmacro-redefined]
>     #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>             ^
>     include/linux/printk.h:348:9: note: previous definition is here
>     #define pr_fmt(fmt) fmt
> 
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 9f5a30234b33..f10e9e04c13b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -753,7 +753,7 @@ void adreno_dump_info(struct msm_gpu *gpu)
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>   	int i;
>   
> -	printk("revision: %d (%d.%d.%d.%d)\n",
> +	pr_info("revision: %d (%d.%d.%d.%d)\n",
>   			adreno_gpu->info->revn, adreno_gpu->rev.core,
>   			adreno_gpu->rev.major, adreno_gpu->rev.minor,
>   			adreno_gpu->rev.patchid);
> @@ -761,12 +761,12 @@ void adreno_dump_info(struct msm_gpu *gpu)
>   	for (i = 0; i < gpu->nr_rings; i++) {
>   		struct msm_ringbuffer *ring = gpu->rb[i];
>   
> -		printk("rb %d: fence:    %d/%d\n", i,
> +		pr_info("rb %d: fence:    %d/%d\n", i,
>   			ring->memptrs->fence,
>   			ring->seqno);
>   
> -		printk("rptr:     %d\n", get_rptr(adreno_gpu, ring));
> -		printk("rb wptr:  %d\n", get_wptr(ring));
> +		pr_info("rptr:     %d\n", get_rptr(adreno_gpu, ring));
> +		pr_info("rb wptr:  %d\n", get_wptr(ring));
>   	}
>   }
>   
> @@ -780,7 +780,7 @@ void adreno_dump(struct msm_gpu *gpu)
>   		return;
>   
>   	/* dump these out in a form that can be parsed by demsm: */
> -	printk("IO:region %s 00000000 00020000\n", gpu->name);
> +	pr_info("IO:region %s 00000000 00020000\n", gpu->name);
>   	for (i = 0; adreno_gpu->registers[i] != ~0; i += 2) {
>   		uint32_t start = adreno_gpu->registers[i];
>   		uint32_t end   = adreno_gpu->registers[i+1];
> @@ -788,7 +788,7 @@ void adreno_dump(struct msm_gpu *gpu)
>   
>   		for (addr = start; addr <= end; addr++) {
>   			uint32_t val = gpu_read(gpu, addr);
> -			printk("IO:R %08x %08x\n", addr<<2, val);
> +			pr_info("IO:R %08x %08x\n", addr<<2, val);
>   		}
>   	}
>   }
> 


-- 
With best wishes
Dmitry
