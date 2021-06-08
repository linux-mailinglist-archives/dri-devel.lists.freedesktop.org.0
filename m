Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 950A839FCEB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 18:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABF56E10B;
	Tue,  8 Jun 2021 16:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC2E6E10B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 16:55:29 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id u30so20831397qke.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 09:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u0jkiDRYCG9tDKJ5bWYS1XDj3QKmjRotfMyh8Z3wS/8=;
 b=A5JfgkNIXbw7zRFkCQvIO7v0/mtkxi+fmo+QnohaqF2ZVD9FOYLVvx37F/fINlIt7U
 IUhslFH3Q9p0bAyz2sjljW5BZE9qoSUtMFiG+tNzeFL6P1doG3yJDeVJJZl5w/m46n4j
 K1Blp0UxBcATeQHcNooWc5Jc8QetEa169iQrHKhPhqMUiD/Yx+LOc9gmn/kYmYThJcK5
 QHkkwGuIz4reZ0citIlB+tRh4QEymvX/R5qaLVS0LL7upgmuSgF7cdObCyguqYbSnbyn
 FUgHFL8qabZUglarZxie3yMRqr5x2KX1vGoCdyPp35YzDoK3tX7sCr4SLC+k1ERg2G6t
 GqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u0jkiDRYCG9tDKJ5bWYS1XDj3QKmjRotfMyh8Z3wS/8=;
 b=ooFmyvhWTED31gzH9mvJe1hajLwt84UOcNeHXxMprCrUsnr7jlhSj8j2dNbH/ac3bn
 xuCcfecFe5dD1uFBbtL3d1+8BVXmN6ZnM2x9KEVjBuSAhnf70GzTKzPtAnJXiq10tnYM
 heOAlaJWAcNcbC6L3KEBh4k3/DzdAkDGqQs2hbV7p/Nkk3H8ODNTeA96JeqhbRWKoOCC
 iQ+mS/YuM3VtmRCsNQ8qcRwntTkkjO7wVe8iQIOZyC0GQxZWv8eTjW9zTB//wPdvqK3g
 v28J+uXdn3DN6e/N8vt6PwL0EizmC3qnl5kskrBIdSb8QOS0klvEnbXbyZYSXP2aCc1d
 Qe6g==
X-Gm-Message-State: AOAM530BmHvDvfFlZOVygAJBQbtTlI1M5tkNja87wJHN8lSmBWedBbnK
 YAF6HAU5Td6X4abBN6rbAnMYWA==
X-Google-Smtp-Source: ABdhPJzsgmTE+FYjCjQ89/qlYNd7CK3mU8AEGjcZnqOY3tWmhR+skZOgk9rTfy7cVDsI+1rBwYiq9g==
X-Received: by 2002:a37:6884:: with SMTP id
 d126mr22160972qkc.497.1623171328720; 
 Tue, 08 Jun 2021 09:55:28 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id h19sm9936019qtq.5.2021.06.08.09.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 09:55:28 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] drm/msm/a6xx: add support for Adreno 660 GPU
To: Akhil P Oommen <akhilpo@codeaurora.org>, freedreno@lists.freedesktop.org
References: <20210513171431.18632-1-jonathan@marek.ca>
 <20210513171431.18632-7-jonathan@marek.ca>
 <055b924e-43fe-1b2b-7292-43a88f9798c2@codeaurora.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <8dd37a7b-b58f-3cf6-346e-ca5add2a163c@marek.ca>
Date: Tue, 8 Jun 2021 12:53:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <055b924e-43fe-1b2b-7292-43a88f9798c2@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 kbuild test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/31/21 11:05 AM, Akhil P Oommen wrote:
> On 5/13/2021 10:44 PM, Jonathan Marek wrote:

...

>> @@ -519,7 +519,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>>       if (!pdcptr)
>>           goto err;
>> -    if (adreno_is_a650(adreno_gpu))
>> +    if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
> 
> why not adreno_is_a650_family() here?
> 

Based on downstream, a620 is part of a650_family but does not have 
pdc_in_aop flag.

>> @@ -751,7 +751,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, 
>> unsigned int state)
>>       int ret;
>>       u32 chipid;
> We need to program this register here:
> gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FALNEXT_INTF, 1);
> 

msm-4.19 does not have this write for a650, but msm-5.4 then adds it. 
Will make it a separate change since it affects a650 and not just a660.

>> -    if (adreno_is_a650(adreno_gpu))
>> +    if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
>>           gmu_write(gmu, REG_A6XX_GPU_GMU_CX_GMU_CX_FAL_INTF, 1);
>>       if (state == GMU_WARM_BOOT) {
>> @@ -1494,12 +1494,28 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, 
>> struct device_node *node)
>>       if (ret)
>>           goto err_put_device;
>> +
>> +    /* A660 now requires handling "prealloc requests" in GMU firmware
>> +     * For now just hardcode allocations based on the known firmware.
>> +     * note: there is no indication that these correspond to "dummy" or
>> +     * "debug" regions, but this "guess" allows reusing these BOs which
>> +     * are otherwise unused by a660.
>> +     */
>> +    gmu->dummy.size = SZ_4K;
>> +    if (adreno_is_a660(adreno_gpu)) {
>> +        ret = a6xx_gmu_memory_alloc(gmu, &gmu->debug, SZ_4K * 7, 
>> 0x60400000);
>> +        if (ret)
>> +            goto err_memory;
> 
> I think we can simply ignore this allocation for a660 because it was 
> required for an unused feature. Do you see any issue if you ignore this 
> allocation?
> 

Yes, without it there will be an error:

arm-smmu 3da0000.iommu: Unhandled context fault: fsr=0x402, 
iova=0x60400000, fsynr=0x32, cbfrsynra=0x5, cb=2

>> +
>> +        gmu->dummy.size = SZ_8K;
>> +    }
>> +
>>       /* Allocate memory for the GMU dummy page */
>> -    ret = a6xx_gmu_memory_alloc(gmu, &gmu->dummy, SZ_4K, 0x60000000);
>> +    ret = a6xx_gmu_memory_alloc(gmu, &gmu->dummy, gmu->dummy.size, 
>> 0x60000000);
>>       if (ret)
>>           goto err_memory;
>> -    if (adreno_is_a650(adreno_gpu)) {
>> +    if (adreno_is_a650_family(adreno_gpu)) {
>>           ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
>>               SZ_16M - SZ_16K, 0x04000);
>>           if (ret)
>> @@ -885,6 +937,13 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>>       /* Protect registers from the CP */
>>       a6xx_set_cp_protect(gpu);
>> +    if (adreno_is_a660(adreno_gpu)) {
>> +        gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x1);
>> +        gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x0);
>> +        /* Set dualQ + disable afull for A660 GPU but not for A635 */
>> +        gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
>> +    }
>> +
> gpu_rmw(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0, (1 << 9));
> We need this for a640, a650 and a660.
> 

Will make this a separate patch too, since it affects non-a660 GPUs too.

>>       /* Enable expanded apriv for targets that support it */
>>       if (gpu->hw_apriv) {
>>           gpu_write(gpu, REG_A6XX_CP_APRIV_CNTL,
>> +/* check for a650, a660, or any derivatives */
>> +static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
>> +{
>> +       return gpu->revn == 650 || gpu->revn == 620 ||
>> +              gpu->revn == 660 || gpu->revn == 635;
> We can remove 635 references throughout since that is not a valid adreno 
> chipid anymore.
> 
> -Akhil

I will remove it for my patch (it can discussed when adding 635 support, 
but I think you will need to have a 6xx ID for the GPU)

>> +}
>> +
>>   int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t 
>> *value);
>>   const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
>>           const char *fwname);
>>
