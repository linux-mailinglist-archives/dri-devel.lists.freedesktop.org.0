Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0800539958F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 23:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3119B6EE5B;
	Wed,  2 Jun 2021 21:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A166EE77
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 21:44:23 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id i10so5642057lfj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 14:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZCY+568MVSGvjT+7poACtfhiCq62TpxLzXfU4H/PG1A=;
 b=J24S+30G4HqpRD45/gRq6+oZ7LSf6/8vaT+32gHcY27Tf+RY/W67SeZi9WU7vOJT+M
 vP3ZmLGxmdouyJ1mGViFEPiAzl7h7tqC0CkUffs3QCCyZL2QRR02+wJ0rB4KP8cNO4zo
 W2CM7s+JAjq3AYJK/vjJjnW7rau2D4iA+yoIKuPhnH/oU6rwm5QrYKtYyCIfq+7FX4vA
 Kk+M1ugjZDOIKSJuUOyVmHoF/lTsTS/uq+P/ekihn90Wo0DfPb95aTb08qEe5qPUbrTY
 4xHpzxycwcBpIRBdlPIdbQynUbevg51r4yfuS86n1p56djXQ6D0GRRzGPJPq2eVuBjo+
 CHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZCY+568MVSGvjT+7poACtfhiCq62TpxLzXfU4H/PG1A=;
 b=btXkXilrq39+fxdcQ2enaURJmtHfizIBVAKXpgNgoNu0srX7cEeSCOitZ5ZOXQ80ih
 llp9YYjhvzVz66UVqxw/U23LRm5z8J7aPxDY9wNk2EYoKgr4AIVu2Wv4VyBFoEk7bW+t
 YSjDRZcYhHQQE9G4BODwWOIFK05t2Xwb1PUvz9EYC50jP43UspLMotU+weneeVJVrhQc
 B/nLa+C7vUTZE3I7hyWhwAHFiZEPZbFN9bKdf9xFU5CejdX7tQcqo/sKgf3DfWcqQvs9
 n4jKecjoAl8cUCkGSq1aP9ewscYrO+HmPSOju/QjkcbxYYk4Q3etdCxgBXKWt4XqzIVC
 wZuw==
X-Gm-Message-State: AOAM532qk7SVhoFqgbq7sOtZc8XeBzXj1aZURP96tBn1VDk4BAZ9m1IC
 1nNkH8qGVwQ81VmfaQBHjtHFGA==
X-Google-Smtp-Source: ABdhPJz7ZnQkutNs0D9yhynyPCtUwpuRuz2nbNSHLTMlLc7lbcMcd77KF6odb98MtRHdD51BerqPcg==
X-Received: by 2002:a19:690f:: with SMTP id e15mr8959094lfc.192.1622670261718; 
 Wed, 02 Jun 2021 14:44:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y13sm109198lfa.11.2021.06.02.14.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 14:44:21 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH v2 5/6] drm/msm/dpu: drop unused lm_max_width
 from RM
To: Arnaud Vrac <rawoul@gmail.com>
References: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
 <20210515225757.1989955-6-dmitry.baryshkov@linaro.org>
 <CAN5H-g7hWgyqtFbUpzesyKXmWr=FtFtXBKDSbCKx+1dUjxP10w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <7b9aa146-3cb3-8164-5f26-388171230100@linaro.org>
Date: Thu, 3 Jun 2021 00:44:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAN5H-g7hWgyqtFbUpzesyKXmWr=FtFtXBKDSbCKx+1dUjxP10w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
 Stephen Boyd <sboyd@kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/05/2021 04:21, Arnaud Vrac wrote:
> Hi Dmitry,
> 
> Le dim. 16 mai 2021 à 00:58, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> a écrit :
>>
>> No code uses lm_max_width from resource manager, so drop it.
> 
> I have a pending patch which uses this value to properly determine the
> number of LMs to use in the topology. Currently the code uses a
> hardcoded value of MAX_HDISPLAY_SPLIT (1080), but in reality I believe
> it should be the lm max width (typically 2560). This will avoid using
> two LMs to render resolutions like 1280x720 or 1920x1080.

As a second thought, I think we better have this value in the hw_catalog 
itself rather than calculating it in the dpu_rm. WDYT?

> 
> I haven't managed to make hdmi work yet on DPU (testing on MSM8998) so
> I'm not ready to send the patch yet, but it doesn't seem to trigger
> any error.
> 
> -Arnaud
> 
> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  4 ----
>>   2 files changed, 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> index c36700a06ff2..ec4387ad1182 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>> @@ -88,18 +88,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>>                          goto fail;
>>                  }
>>                  rm->mixer_blks[lm->id - LM_0] = &hw->base;
>> -
>> -               if (!rm->lm_max_width) {
>> -                       rm->lm_max_width = lm->sblk->maxwidth;
>> -               } else if (rm->lm_max_width != lm->sblk->maxwidth) {
>> -                       /*
>> -                        * Don't expect to have hw where lm max widths differ.
>> -                        * If found, take the min.
>> -                        */
>> -                       DPU_ERROR("unsupported: lm maxwidth differs\n");
>> -                       if (rm->lm_max_width > lm->sblk->maxwidth)
>> -                               rm->lm_max_width = lm->sblk->maxwidth;
>> -               }
>>          }
>>
>>          for (i = 0; i < cat->ctl_count; i++) {
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> index ee90b1233430..0c9113581d71 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
>> @@ -17,14 +17,10 @@ struct dpu_global_state;
>>    * struct dpu_rm - DPU dynamic hardware resource manager
>>    * @mixer_blks: array of layer mixer hardware resources
>>    * @ctl_blks: array of ctl hardware resources
>> - * @lm_max_width: cached layer mixer maximum width
>> - * @rm_lock: resource manager mutex
>>    */
>>   struct dpu_rm {
>>          struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
>>          struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
>> -
>> -       uint32_t lm_max_width;
>>   };
>>
>>   struct dpu_kms;
>> --
>> 2.30.2
>>
>> _______________________________________________
>> Freedreno mailing list
>> Freedreno@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/freedreno


-- 
With best wishes
Dmitry
