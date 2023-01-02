Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE58865B478
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 16:52:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A5310E35C;
	Mon,  2 Jan 2023 15:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F4610E366
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 15:52:39 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id bt23so25394661lfb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Jan 2023 07:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uIB/5bHUrZzNsC9yit8NcJgWuAABAvHpydAaIbNKh6w=;
 b=n2pEoBXz3GS/RUK1I0VXyzBtJyBv2kqEUYb0KGV/n02XADMcUn+U9U+9t49LEeGlk9
 fWY3e7NwYNnpWPVFUbttFjYH+OP/IwinONFnjC9sYzMuswUASugLtEVm5jOm0eXwxSxz
 hDaeSBilAOTzVbZiVjwWruR61eQ/mHsOV/zOYQJHj+cWWTd2CFynAsmcjiu9ldjrK8qD
 O2O7KxD9MCDa0XSD8GoVABc148fZ7w2i0FlqSU6Cj9rvrUgNjoNioZ7yUdZGwHH1HKfy
 8Q6y24tbqPbg99UxgYgRMF4ZVRzBs0YpXWzZW6qOzbnMP3zvN/4mV0R9ufY4oZNApI5U
 5tpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uIB/5bHUrZzNsC9yit8NcJgWuAABAvHpydAaIbNKh6w=;
 b=YGk9RG5IjW5YC9IH0bn15NBQfNtO+ya88v3Nlx+4lcMadEFdG1o0QDg7rasL+JgcSH
 eCCRg1dfTzOlGaoGz8nP2HRnefdSFd3+T9U55jJwA6cTjNBsS4wnVb6K/K/mQK8ZSNPE
 ljEUZbkanuGDIEqTmrbMCz4EEudCQa6KmqR3olmZascdy+ubXJfLJ10+lEUQ5gzYlQz6
 bsaMLtkZDc2cidgJlBM2JqEyvAAWYM4UtsDvgYDzWZCqK71FPd8rjhQ0ULuhIUYNJ4PK
 kKX0WSFsLzMNcxeUBuMgamefrjcup4ad/eMTYM4mQ7KTe1q3I6r8R5nEEHQwqMlNHJcb
 z2nw==
X-Gm-Message-State: AFqh2kqC9l+ASLB9AZ2rnltB1RGmSTh0Q9wgg//ONtcrv//GeVevE+GD
 DszvHVzw3eSMuzkKcXT7mfjiBg==
X-Google-Smtp-Source: AMrXdXvddvHdzrpXQdwSWx/8hQ2XjKT9aAox5/Kx1PUttalQ4jgtb007U9JOYEQ20Ke8g8BnAwgwlQ==
X-Received: by 2002:a05:6512:3194:b0:4b0:2a2f:ea6d with SMTP id
 i20-20020a056512319400b004b02a2fea6dmr13769966lfe.35.1672674757361; 
 Mon, 02 Jan 2023 07:52:37 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m28-20020a056512015c00b004b580a526c3sm4514903lfo.295.2023.01.02.07.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 07:52:36 -0800 (PST)
Message-ID: <0db74f94-e385-6329-c1e6-7c94805b718f@linaro.org>
Date: Mon, 2 Jan 2023 17:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/msm/a2xx: support loading legacy (iMX) firmware
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>
References: <20230101155753.779176-1-dmitry.baryshkov@linaro.org>
 <CAF6AEGvG9UJzvjvvfBeO6tC+APqOStAHBgeRwsuHUFSozyE8oA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGvG9UJzvjvvfBeO6tC+APqOStAHBgeRwsuHUFSozyE8oA@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/01/2023 03:39, Rob Clark wrote:
> On Sun, Jan 1, 2023 at 7:57 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Support loading A200 firmware generated from the iMX firmware header
>> files. The firmware lacks protection support, however it allows GPU to
>> function properly while using the firmware files with clear license
>> which allows redistribution.
>>
>> Cc: Jonathan Marek <jonathan@marek.ca>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 27 +++++++++++++++++++++++----
>>   drivers/gpu/drm/msm/adreno/a2xx_gpu.h |  1 +
>>   2 files changed, 24 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
>> index 6c9a747eb4ad..c67089a7ebc1 100644
>> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
>> @@ -53,6 +53,8 @@ static void a2xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>
>>   static bool a2xx_me_init(struct msm_gpu *gpu)
>>   {
>> +       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +       struct a2xx_gpu *a2xx_gpu = to_a2xx_gpu(adreno_gpu);
>>          struct msm_ringbuffer *ring = gpu->rb[0];
>>
>>          OUT_PKT3(ring, CP_ME_INIT, 18);
>> @@ -84,15 +86,20 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
>>          /* NQ and External Memory Swap */
>>          OUT_RING(ring, 0x00000000);
>>          /* protected mode error checking (0x1f2 is REG_AXXX_CP_INT_CNTL) */
>> -       OUT_RING(ring, 0x200001f2);
>> +       if (a2xx_gpu->protection_disabled)
>> +               OUT_RING(ring, 0x00000000);
>> +       else
>> +               OUT_RING(ring, 0x200001f2);
>>          /* Disable header dumping and Header dump address */
>>          OUT_RING(ring, 0x00000000);
>>          /* Header dump size */
>>          OUT_RING(ring, 0x00000000);
>>
>> -       /* enable protected mode */
>> -       OUT_PKT3(ring, CP_SET_PROTECTED_MODE, 1);
>> -       OUT_RING(ring, 1);
>> +       if (!a2xx_gpu->protection_disabled) {
>> +               /* enable protected mode */
>> +               OUT_PKT3(ring, CP_SET_PROTECTED_MODE, 1);
>> +               OUT_RING(ring, 1);
>> +       }
>>
>>          adreno_flush(gpu, ring, REG_AXXX_CP_RB_WPTR);
>>          return a2xx_idle(gpu);
>> @@ -101,6 +108,7 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
>>   static int a2xx_hw_init(struct msm_gpu *gpu)
>>   {
>>          struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +       struct a2xx_gpu *a2xx_gpu = to_a2xx_gpu(adreno_gpu);
>>          dma_addr_t pt_base, tran_error;
>>          uint32_t *ptr, len;
>>          int i, ret;
>> @@ -221,6 +229,17 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
>>          len = adreno_gpu->fw[ADRENO_FW_PM4]->size / 4;
>>          DBG("loading PM4 ucode version: %x", ptr[1]);
>>
>> +       /*
>> +        * New firmware files seem to have GPU and firmware version in this
>> +        * word (0x20xxxx for A200, 0x220xxx for A220, 0x225xxx for A225).
>> +        * Older firmware files, which lack protection support, have 0 instead.
>> +        */
>> +       if (ptr[1] == 0) {
> 
> I don't really have a good enough picture about all the possible fw
> versions floating around out there, esp back to the pre-qc days, to
> know if this is a good enough check.  But I guess we can go with it,
> and in the worst case later add an allowlist table of fw checksums (or
> similar) if this doesn't turn out to be sufficient, so the overall
> approach isn't painting us into a corner.
> 
> Reviewed-by: Rob Clark <robdclark@gmail.com>

For the reference. I have pushed existing redistributable firmware files 
to https://github.com/lumag/yamato-firmware.git (I can move the repo to 
some other location, e.g. to gitlab.fdo.org/msm if that's a better place).

I've also sent a patch to linux-firmware, so at some point we should be 
able to use a200 with the default setup.

> 
>> +               dev_warn(gpu->dev->dev,
>> +                        "Legacy firmware detected, disabling protection support\n");
>> +               a2xx_gpu->protection_disabled = true;
>> +       }
>> +
>>          gpu_write(gpu, REG_AXXX_CP_DEBUG,
>>                          AXXX_CP_DEBUG_MIU_128BIT_WRITE_ENABLE);
>>          gpu_write(gpu, REG_AXXX_CP_ME_RAM_WADDR, 0);
>> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
>> index 02fba2cb8932..161a075f94af 100644
>> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
>> @@ -15,6 +15,7 @@
>>   struct a2xx_gpu {
>>          struct adreno_gpu base;
>>          bool pm_enabled;
>> +       bool protection_disabled;
>>   };
>>   #define to_a2xx_gpu(x) container_of(x, struct a2xx_gpu, base)
>>
>> --
>> 2.39.0
>>

-- 
With best wishes
Dmitry

