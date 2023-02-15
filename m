Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A254F697286
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 01:10:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70AB110E9EC;
	Wed, 15 Feb 2023 00:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D193C10E9EC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 00:10:05 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id k16so12659165ejv.10
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 16:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8azonh6JuDM6yxIBz+UeUT9A+K1dkd2wXajwtSP1wNo=;
 b=M81D30xtRjOeLl0/ENzu5hw5o44r66wXeRX9tMqeqWbvV5eTiAz6wRgQsVd4/yn6fe
 SAKjUk0EPFpyoa8Dvqn3ZvIakxe7sLp0X+nspxQ5cTfv2bidV27zMg6BUMRgSsZlcuuw
 TBTKWTzkzOJqsKkIc5C5wZDSGyhoyXGFeMz0RnLqa4VU8wgXO8Bd/iaewBWTWFYhhszM
 qWRWxprx/WJG87+hRrYuXOKHioz/3aXutio53bdNErHWICAYbdDPhYY5+QcqodOBSNjs
 b1iSINmG4DeIxZnvwm4Z0RhQVVE6oPERfmVh5tunqmLPIQP6j+OyF9f+jxHo04ct4LYM
 j3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8azonh6JuDM6yxIBz+UeUT9A+K1dkd2wXajwtSP1wNo=;
 b=CuMx06qCZg2bGGMbpvKJcgzxv+kYPNIZvuRcYgIC8yfVnLKvVYx3YXdS4fJidnS1Iz
 ChjXKxtoIXxt3kt5lx5pBnQAxeUbvIWAbAAIL023a2VB/fyT290fWkhG4l0YPJ3BgZiI
 6kjsx+dlgqBuAVLYiqHWyy2nrQosiweTNsxXjADodVzxhU6iifLExJxB1FZln6RyQwzW
 /RrkT6Q12Xyh/5Hbkm9cQ98CA3wpok3SEhOl1qDwYRRLLhe+5+r1pIJfeWExR7nbYVvB
 eqTIIGaHVLdq8ASHpSDkcjgtI4a8nL7Gtveyy/VmuJ+St5Vt3+lerAz75IIFEU2HjU6Q
 tdwA==
X-Gm-Message-State: AO0yUKWTK1+uNkvVk/dxu8Lc6/b7FuvUC+8ovU9Kx0npWwnjddv03kei
 gfr35t+hKFfenBz+Dozpgi3qPA==
X-Google-Smtp-Source: AK7set/gKNIqLXNJwW+JD/xwd56nsFrvF97bkqwOd4DklH3lI/hfm72F9UxypL4PvkVMgtm0dKAn9w==
X-Received: by 2002:a17:906:9159:b0:866:6b08:946b with SMTP id
 y25-20020a170906915900b008666b08946bmr254841ejw.39.1676419804292; 
 Tue, 14 Feb 2023 16:10:04 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 kg3-20020a17090776e300b0088a2aebb146sm8848566ejc.52.2023.02.14.16.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 16:10:03 -0800 (PST)
Message-ID: <a4627ca5-46e6-2f32-c0e2-a85990e02f54@linaro.org>
Date: Wed, 15 Feb 2023 02:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 10/14] drm/msm/a6xx: Fix up A6XX protected registers
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-11-konrad.dybcio@linaro.org>
 <CAF6AEGva3ecxTOx3Yb+Wh-1K=jYA3tDo_aXg09jS9pzJupYExQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGva3ecxTOx3Yb+Wh-1K=jYA3tDo_aXg09jS9pzJupYExQ@mail.gmail.com>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 agross@kernel.org, marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/02/2023 23:56, Rob Clark wrote:
> On Tue, Feb 14, 2023 at 9:32 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> One of the protected ranges was too small (compared to the data we
>> have downstream). Fix it.
>>
>> Fixes: 408434036958 ("drm/msm/a6xx: update/fix CP_PROTECT initialization")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 503c750216e6..d6b38bfdb3b4 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -690,7 +690,7 @@ static const u32 a6xx_protect[] = {
>>          A6XX_PROTECT_NORDWR(0x00800, 0x0082),
>>          A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
>>          A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
>> -       A6XX_PROTECT_RDONLY(0x008de, 0x00ae),
>> +       A6XX_PROTECT_RDONLY(0x008d0, 0x00bc),
> 
> Nak, this is intentional, we need userspace to be able to configure
> the CP counters.  Otherwise this would break fdperf, perfetto, etc
> 
> (although maybe we should comment where we diverge from downstream)

Yes, please. Otherwise it is extremely hard to understand the reason for 
diversion between the vendor driver and our one.

> 
> BR,
> -R
> 
>>          A6XX_PROTECT_NORDWR(0x00900, 0x004d),
>>          A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
>>          A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
>> --
>> 2.39.1
>>

-- 
With best wishes
Dmitry

