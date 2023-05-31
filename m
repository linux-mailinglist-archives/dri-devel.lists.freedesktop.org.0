Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44247717CD6
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 12:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030E710E4A6;
	Wed, 31 May 2023 10:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D672110E4A6
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 10:07:45 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2af177f12a5so59153761fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 03:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685527664; x=1688119664;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QKOqcdYffaPuAvsZ4cF6Kv8mBC9qOo1M+VBYAc7j870=;
 b=J0kB0QX5UrjOVkn2cqMVcboC2TQmS8mF9Y2hgaWFKaWCqM7fNLTyukyelYvZe+7Kq7
 nCTd6ar7bVwHZ5xHNdBrO9+vpp0FPt5NiNl7h8TPtLDNanVsxG32ZATJxIBcP1Z37lSJ
 IZIzHxBft4QjY0SBONwVJiw7yOx3fP163he7u6lbZUWT42MJXAvDy/DPMyMO6qi7aU//
 uXDUWaDX+XMH+8Z54SuQSijpM/ORXl7OhcKdNKU/xjL869/J4uooT45AkUr/Cn3suDsW
 UFbIN7fv6Y67vCv12Ybf/FlRidDUnlvbA6fIPqU6NuGgQ70RJ4vtO/IUFXQgOCo/0qK4
 ffVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685527664; x=1688119664;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QKOqcdYffaPuAvsZ4cF6Kv8mBC9qOo1M+VBYAc7j870=;
 b=fRobI8lBJ56XQ64GqQ4xnWyk0ARafC3tmQojrrio4+bLaj0AflO8AqvfpeB6LWImnq
 4hPCiqag4kZYb9pJ258l5AZ4uWqI4v0+mioNCnRMseF/oP/lhzOub5U7RopuaM6W6rz1
 s1F2QCmA3b7g+hyof72j8Lz3UCehjbrxTqJ9Byawd9CJxqIe7o1mq4qOtjKhWGQ/XrMC
 +jWlfHDhfJL9YV3TuNJTJkxwcr2CKb7ZtubWKoaGmMJtQ9sFdQm2yzjGd3LwxFSNfUyI
 CMkzt6ZydJq48/QqFhnhkGtKl6rFter84VPxCTI2iOsCfWUZyVh4Fq+gfyJtwol/6Sqs
 Fm7A==
X-Gm-Message-State: AC+VfDwYuPBoc4ks2Dc2ov+Ie8wQqxnwJ6mrPLPw8PD3owIBhwqPGqif
 8qNX7RgiWUkkoXumlwRqB87PHw==
X-Google-Smtp-Source: ACHHUZ6g4CDeffFfXzftaZbZSf3SKkuRD2pIillen7CiBtHzJExUDY1BKN3JLXLga47sPT7rodnd+w==
X-Received: by 2002:a2e:9457:0:b0:2ac:7d78:3465 with SMTP id
 o23-20020a2e9457000000b002ac7d783465mr2205896ljh.15.1685527663994; 
 Wed, 31 May 2023 03:07:43 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 s24-20020a2e9c18000000b002a8ae16ac8csm3236479lji.18.2023.05.31.03.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 03:07:43 -0700 (PDT)
Message-ID: <98e4bda7-19e9-09b6-f008-383adada97cb@linaro.org>
Date: Wed, 31 May 2023 13:07:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: re-introduce dpu core revision
 to the catalog
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230531005358.18090-1-quic_abhinavk@quicinc.com>
 <CAA8EJpryw0h8TgpJ+SFJ7s0=LCjkQ6oqAjCKsm60dk_Q5e+wWA@mail.gmail.com>
 <0af4df3d-8048-98cd-6c91-7cd553f4f65f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0af4df3d-8048-98cd-6c91-7cd553f4f65f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/05/2023 06:05, Abhinav Kumar wrote:
> 
> 
> On 5/30/2023 7:53 PM, Dmitry Baryshkov wrote:
>> On Wed, 31 May 2023 at 03:54, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>> With [1] dpu core revision was dropped in favor of using the
>>> compatible string from the device tree to select the dpu catalog
>>> being used in the device.
>>>
>>> This approach works well however also necessitates adding catalog
>>> entries for small register level details as dpu capabilities and/or
>>> features bloating the catalog unnecessarily. Examples include but
>>> are not limited to data_compress, interrupt register set, widebus etc.
>>>
>>> Introduce the dpu core revision back as an entry to the catalog so that
>>> we can just use dpu revision checks and enable those bits which
>>> should be enabled unconditionally and not controlled by a catalog
>>> and also simplify the changes to do something like:
>>>
>>> if (dpu_core_revision > xxxxx && dpu_core_revision < xxxxx)
>>>          enable the bit;
>>>
>>> Also, add some of the useful macros back to be able to use dpu core
>>> revision effectively.
>>>
>>> [1]: https://patchwork.freedesktop.org/patch/530891/?series=113910&rev=4
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  1 +
>>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  1 +
>>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  1 +
>>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  1 +
>>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  1 +
>>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  1 +
>>>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  1 +
>>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  1 +
>>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  1 +
>>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  1 +
>>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  1 +
>>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  1 +
>>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  1 +
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 31 ++++++++++++++++++-
>>>   14 files changed, 43 insertions(+), 1 deletion(-)
>>>
>>
>> [skipped catalog changes]
>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index 677048cc3b7d..cc4aa75a1219 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -19,6 +19,33 @@
>>>    */
>>>   #define MAX_BLOCKS    12
>>>
>>> +#define DPU_HW_VER(MAJOR, MINOR, STEP)\
>>> +                 ((((unsigned int)MAJOR & 0xF) << 28) |\
>>> +                 ((MINOR & 0xFFF) << 16) |\
>>> +                 (STEP & 0xFFFF))
>>> +
>>> +#define DPU_HW_MAJOR(rev)((rev) >> 28)
>>> +#define DPU_HW_MINOR(rev)(((rev) >> 16) & 0xFFF)
>>> +#define DPU_HW_STEP(rev)((rev) & 0xFFFF)
>>> +#define DPU_HW_MAJOR_MINOR(rev)((rev) >> 16)
>>> +
>>> +#define IS_DPU_MAJOR_MINOR_SAME(rev1, rev2)   \
>>> +(DPU_HW_MAJOR_MINOR((rev1)) == DPU_HW_MAJOR_MINOR((rev2)))
>>> +
>>> +#define DPU_HW_VER_300 DPU_HW_VER(3, 0, 0) /* 8998 v1.0 */
>>> +#define DPU_HW_VER_400 DPU_HW_VER(4, 0, 0) /* sdm845 v1.0 */
>>> +#define DPU_HW_VER_500 DPU_HW_VER(5, 0, 0) /* sm8150 v1.0 */
>>> +#define DPU_HW_VER_510 DPU_HW_VER(5, 1, 1) /* sc8180 */
>>> +#define DPU_HW_VER_600 DPU_HW_VER(6, 0, 0) /* sm8250 */
>>> +#define DPU_HW_VER_620 DPU_HW_VER(6, 2, 0) /* sc7180 v1.0 */
>>> +#define DPU_HW_VER_630 DPU_HW_VER(6, 3, 0) /* sm6115|sm4250 */
>>> +#define DPU_HW_VER_650 DPU_HW_VER(6, 5, 0) /* qcm2290|sm4125 */
>>> +#define DPU_HW_VER_700 DPU_HW_VER(7, 0, 0) /* sm8350 */
>>> +#define DPU_HW_VER_720 DPU_HW_VER(7, 2, 0) /* sc7280 */
>>> +#define DPU_HW_VER_800 DPU_HW_VER(8, 0, 0) /* sc8280xp */
>>> +#define DPU_HW_VER_810 DPU_HW_VER(8, 1, 0) /* sm8450 */
>>> +#define DPU_HW_VER_900 DPU_HW_VER(9, 0, 0) /* sm8550 */
>>
>> Instead of having defines for all SoCs (which can quickly become
>> unmanageable) and can cause merge conflicts, I'd suggest inlining all
>> the defines into respective catalog files.
>>
> 
> Sure, that can be done.
> 
>> Also, I'm not sure that the "step" should be a part of the catalog. I
>> know that this follows the hardware revision. However, please correct
>> me if I'm wrong, different step levels are used for revisions of the
>> same SoC. The original code that was reading the hw revision from the
>> hardware register, listed both 5.0.0 and 5.0.1 for sm8150.
>>
> 
> This is one of the things i noticed while making this change.
> 
> Before the catalog rework, we used to handle even steps as we used to 
> read that from the register and match it with the mdss_cfg handler. But 
> after the rework, we dont handle steps anymore. Yes, you are right that 
> different step levels are used for the revisions of the same SOC and so 
> with that, i dont expect or atleast am not aware of DPU differences 
> between steps but I am not able to rule it out.
> 
> So are you suggesting we drop step altogether and DPU_HW_VER() macro 
> shall only handle major and minor versions? With the current chipsets I 
> see, it should not make a difference . Its just that I am not sure if 
> that will never happen.

Yes. The goal of this rework would be to drop generic features and to 
replace those checks with DPU-revision lookups. Correct?
I think that from this perspective having to handle toe step revision is 
a sign of an overkill. Having to handle the step revision is a sign of 
paltform feature (or mis-feature) rather than a generic DPU bit.

In fact I suppose that even handling a minor revision would be an 
overkill. Why don't we start with .dpu_major instead of .core_rev? We 
can add .dpu_minor if/when required.

> 
>>> +
>>>   #define DPU_HW_BLK_NAME_LEN    16
>>>
>>>   #define MAX_IMG_WIDTH 0x3fff
>>> @@ -769,7 +796,7 @@ struct dpu_perf_cfg {
>>>   /**
>>>    * struct dpu_mdss_cfg - information of MDSS HW
>>>    * This is the main catalog data structure representing
>>> - * this HW version. Contains number of instances,
>>> + * this HW version. Contains dpu core revision, number of instances,
>>>    * register offsets, capabilities of the all MDSS HW sub-blocks.
>>>    *
>>>    * @dma_formats        Supported formats for dma pipe
>>> @@ -778,6 +805,8 @@ struct dpu_perf_cfg {
>>>    * @mdss_irqs:         Bitmap with the irqs supported by the target
>>>    */
>>>   struct dpu_mdss_cfg {
>>> +       u32 core_rev;
>>> +
>>>          const struct dpu_caps *caps;
>>>
>>>          const struct dpu_ubwc_cfg *ubwc;
>>> -- 
>>> 2.40.1
>>>
>>
>>

-- 
With best wishes
Dmitry

