Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 700BA6FBC1C
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 02:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F8410E0AC;
	Tue,  9 May 2023 00:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529D710E31D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 00:48:43 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ac89e6a5a1so45630281fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 17:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683593321; x=1686185321;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1lzmlWPoQrGWW/oFjCS6ule6bte9k1/D4wXcMLKMj98=;
 b=Lw3hqCrXauny7MRb6KpT8X5icjyE2GQ2FgZACC1KIrFbogeFB5gXLo1WRVyhmPCDaq
 FNrDzmsI1QyFeiXdUC2iCAYSFaZLXVsiRuXT4dZXAR7hPon2jyjkwZ44cv4iXDGcHvvY
 ZJ8onHUPXH/frl5OnAY/7KQdrr+PILipxcqBMzgcftbmB8WuECICjPS2BKk1VnBYfhud
 QmulsGek8dGWlRv8/Ym6X+etHuE/rrOo+pFnBqvgeL0uvHj/x1r4o73vYQZLeQ5O72NK
 pbE6/Iv8RiLDrbHtEMYqs52Isc3N3xTqsFpn2x9BWhgGtG3pUGTsnTtlpU93OM86mu/d
 Ms6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683593321; x=1686185321;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1lzmlWPoQrGWW/oFjCS6ule6bte9k1/D4wXcMLKMj98=;
 b=g6GxE3RFPhPjiafC+x5CcFIhbxXOuB/3x5ZN9CvKKNJxL66wp1Lj5bah7uL9k/xJSD
 J59/ug7XhLK3NkGGt7KkOHsp5TzLx8Uy9xWOVUlQZ8WDCjcYTHRt7bN5+JWqsc++Fp9u
 iju4NVkle15pBFftNRZUA+Sf9weqARwfWQUCuHY8rFNfBzpnBUMzI7rpBZxdY+Qqjd+D
 yG88evG8ybYA1u211hgw3DDZEEqL0zK9fRHKu+V5b/Xc7iBI2NAqKKyWP29eAvWmV2Fo
 9lbIC4eKr1nsCFEFWSPck6DbJ19rtA1Xk4Swiv7r8/pTbKWlOXQZXM4dHqip1rxuotdq
 B4Xw==
X-Gm-Message-State: AC+VfDyYgYFConfYHV2D04NmrGgPpMjBb9ViO8shGs9hpUr6weBIpx5N
 gGRkKz+bUUOkRsl50+lh4RM2qQ==
X-Google-Smtp-Source: ACHHUZ6i07bnhuq04+qehKFZ7QRGgdUS6dRas5Gbp6pbeTQ7xm9zMQ78UveUpoLUc6OsFUtceb5yLA==
X-Received: by 2002:a2e:6e18:0:b0:2ad:9783:bca with SMTP id
 j24-20020a2e6e18000000b002ad97830bcamr245610ljc.27.1683593321027; 
 Mon, 08 May 2023 17:48:41 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a05651c010f00b002ad988efd73sm343073ljb.14.2023.05.08.17.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 17:48:40 -0700 (PDT)
Message-ID: <db0ec6eb-578a-9684-6caa-559abe27015c@linaro.org>
Date: Tue, 9 May 2023 03:48:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature
 flag
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-3-1072c70e9786@quicinc.com>
 <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
 <1d7ccb5f-55c2-3b3a-df97-2c17beffabfc@quicinc.com>
 <0aa4130d-bb37-4743-10e5-fd518276f4a2@linaro.org>
 <9aad0f0a-f168-5162-68a0-9e9cde21c1f6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9aad0f0a-f168-5162-68a0-9e9cde21c1f6@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/05/2023 03:28, Abhinav Kumar wrote:
> 
> 
> On 5/8/2023 4:08 PM, Dmitry Baryshkov wrote:
>> On 09/05/2023 00:46, Jessica Zhang wrote:
>>>
>>>
>>> On 5/7/2023 9:00 AM, Marijn Suijten wrote:
>>>> On 2023-05-05 14:23:50, Jessica Zhang wrote:
>>>>> Add DATA_COMPRESS feature flag to DPU INTF block.
>>>>>
>>>>> In DPU 7.x and later, DSC/DCE enablement registers have been moved 
>>>>> from
>>>>> PINGPONG to INTF.
>>>>>
>>>>> As core_rev (and related macros) was removed from the dpu_kms 
>>>>> struct, the
>>>>> most straightforward way to indicate the presence of this register 
>>>>> would be
>>>>> to have a feature flag.
>>>>
>>>> Irrelevant.  Even though core_rev was still in mainline until recently,
>>>> we always hardcoded the features in the catalog and only used core_rev
>>>> to select a dpu_mdss_cfg catalog entry.  There is no "if version >= X
>>>> then enable feature Y" logic, this manually-enabled feature flag is the
>>>> only, correct way to do it.
>>>
>>> Hi Marijn,
>>>
>>> Understood. FWIW, if we do find more register bit-level differences 
>>> between HW versions in the future, it might make more sense to keep 
>>> the HW catalog small and bring core_rev back, rather than keep adding 
>>> these kinds of small differences to caps.
>>
>> Let's see how it goes. Abhinav suggested that there might be feature 
>> differences inside the DPU generations (and even inside the single DPU 
>> major/minor combo). So I'm not sure what core_rev will bring us.
>>
> 
> It allows us to have if MDSS_REV() checks which are convenient for some 
> calculations / bit programming which we dont want to expose in the 
> catalog as they cannot be classified as a hw cap as such or atleast we 
> dont want them to be classified as such.
> 
>> Let's land the platforms which are ready (or if there is anything 
>> close to be submitted). I'll post the next proposal for the catalog 
>> cleanups close to -rc4, when the dust settles then we can have one or 
>> two weaks for the discussion and polishing.
>>
>> I'd like to consider:
>> - inlining foo_BLK macros, if that makes adding new features easier
>> - reformat of clk_ctrls
>> - maybe reintroduction of per-generation feature masks instead of 
>> keeping them named after the random SoC
>> - maybe a rework of mdss_irqs / INTFn_INTR. We already have this info 
>> in hw catalog.
>>
>> Comments are appreciated.
>>
> 
> I would say, lets wait for DSC to settle. Atleast the parts already on 
> the list. Continuous rebase of features already on the list is becoming 
> time consuming because of overlapping catalog reworks.

As I wrote, -rc4. Until that time, I'd expect DSC to be settled and 
accepted.

-- 
With best wishes
Dmitry

