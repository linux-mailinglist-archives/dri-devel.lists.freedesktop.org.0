Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D27D8FBAA5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 19:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6519E10E388;
	Tue,  4 Jun 2024 17:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qxSVidg2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB31210E59C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 17:38:48 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2ea9386cde0so59389301fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 10:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717522727; x=1718127527; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6GeqWLi7NNbGWYRb6N4n2qfBVPfozE0EINuphnmhX3g=;
 b=qxSVidg2sXZyuAQwUDDe/wgPZVdcftudoUqTmTbWQzh+i9XFLaOHQtNgcBWOOYrYMO
 P3SppHvVnncWqc6ACCO5AphIRMCArrFjxqnVhP5qgZM+PEzwt0ypA69ZYX8STEVkwuCY
 6ojiKQqKLJKEvT81E+X4vuKqWsnNR91xU6VJ9033XeBLemTonp3gu53QRcNl9dX0Y9Kc
 Fb0S0/Asq9WFL1MSTx5SNGY/qsI6LKTYxp2IvnVuz92B7yfx91CbYWv3xrCXlQmpZqkt
 CH3zwXaUx1QA1ULuoxGoqpX6olXKFNNNVvPbYCQTK07D0GMB85faPbIvexzw2ekI3oLo
 aJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717522727; x=1718127527;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6GeqWLi7NNbGWYRb6N4n2qfBVPfozE0EINuphnmhX3g=;
 b=I5Z9YYbJqfVkV3tmVx2jXQYHO0yzSglavbCAJEFjIPGN1oLjYM2XbMvvPjm+Dn54kP
 KbySzWnTGzU0YSqZbE84x7HwAsgcCpgn7MZ9X0zmy2AIv0PC2OM2Btjdr6DYyax3NXUo
 WMfuxjTNkzx41NS2RFxSW3Pd+WKiUZydjDx79BBeVp/jcE0GtkaoPBStEGMEOitIlpNr
 b9EFO83xvR46NZdhAiMRpkE5JhLa9RADHbIAFEOfgRJhR0pOlLbKIiGO0q7tZgXTzv1s
 D6KIfEBq/u4kRiLnzYktCpFCNv+ovb1K3DRl7ZI/MG3NGa2h5vIHv1QKrL4qsZ3kHUZ4
 gPLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPoMQrkGvrTYWkkPlFXgco6MW8BuOmjUL9dJrQiN8EuOq6QZtxUIGOmXDfTh/Swmp+OY1/L4aC+l4Eno0Ykn4ki0T20IIgWLy+YW3NNYRp
X-Gm-Message-State: AOJu0Yz+LUQWM3sVmwXzka3MiC9EfJNXOssLsNW/nPYIOHSA4qcoK33w
 6Cde4GO9BcN5uLo/+Lm0k+jKKb1GT9xzpYMVgGKaD4cjz07AadIDWUSmJunZUPE=
X-Google-Smtp-Source: AGHT+IGHKIQb1LEwTvENZPss+PNdcktLsu+2+zv+ciguUyYJZdKE3p48fX9lg5yWjQ2KXlMpoi2ZSQ==
X-Received: by 2002:a05:6512:3f14:b0:52a:4217:d6e1 with SMTP id
 2adb3069b0e04-52bab4b7c13mr184790e87.4.1717522726713; 
 Tue, 04 Jun 2024 10:38:46 -0700 (PDT)
Received: from ?IPV6:2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8?
 ([2a00:f41:909a:a11e:b2c0:1360:9a97:b2b8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6919c82af3sm275604866b.120.2024.06.04.10.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 10:38:46 -0700 (PDT)
Message-ID: <d7cf1848-d39b-43f1-bcd5-b917e0289fcf@linaro.org>
Date: Tue, 4 Jun 2024 19:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Add support for Adreno 505 GPU
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniil Titov <daniilt971@gmail.com>
References: <20240604-a505-v1-1-82ee1c04d200@gmail.com>
 <49fe3b01-4f00-4ffc-80cf-2a0add1ebaad@linaro.org>
 <CAGsSOWV=i2JHsYNvi5EC6q=NoD8v7SiTjbVQhTDLNw35+irTCQ@mail.gmail.com>
 <CAGsSOWV9SRK1VUJiQfavEM1hL0PapxUBG6CNeD+Q=0qPT5ZnSA@mail.gmail.com>
 <37b0404d-bba5-4a77-ad86-62c6dd308d37@linaro.org>
 <CAGsSOWUNN-PRvojvJR-i7wBDz8QRNnaTt19-6G41g7Hdt6RyTQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAGsSOWUNN-PRvojvJR-i7wBDz8QRNnaTt19-6G41g7Hdt6RyTQ@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/4/24 19:33, Barnabás Czémán wrote:
> On Tue, Jun 4, 2024 at 7:06 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 6/4/24 18:45, Barnabás Czémán wrote:
>>> On Tue, Jun 4, 2024 at 2:27 PM Barnabás Czémán <trabarni@gmail.com> wrote:
>>>>
>>>> On Tue, Jun 4, 2024 at 1:55 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 6/4/24 02:20, Barnabás Czémán wrote:
>>>>>> From: Daniil Titov <daniilt971@gmail.com>
>>>>>>
>>>>>> This GPU is found on SoCs such as MSM8937 (450 MHz), MSM8940 (475 MHz),
>>>>>> SDM439 (650 MHz).
>>>>>>
>>>>>> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
>>>>>> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
>>>>>> ---
>>>>>
>>>>> This all looks very good, just a nit
>>>>>
>>>>> [...]
>>>>>
>>>>>> +             /*
>>>>>> +              * Increase inactive period to 250 to avoid bouncing
>>>>>> +              * the GDSC which appears to make it grumpy
>>>>>> +              */
>>>>>> +             .inactive_period = 250,
>>>>>
>>>>> Are you sure this is actually necessary?
>>>> Every A5XX GPU is using the same value, but i have never tried with
>>>> DRM_MSM_INACTIVE_PERIOD.
>>> This was the original patch
>>> https://lore.kernel.org/all/20180507224750.9383-1-jcrouse@codeaurora.org/
>>> where the inactive period was increased for a530. I cannot test
>>> suspend on msm8937 yet.
>>
>> The suspend here refers to device suspend, not system suspend. Adreno
>> goes into device suspend every time you stop using it, i.e. after the
>> rendering is done and there's no more work to do.
>>
>> I suppose a good test scenario here would be to keep running and closing
>> kmscube in a rapid fashion and checking if the GPU starts crashing for
>> unknown reasons (the dmesg would denote that)
>>
> I have checked on a505 and a506 with this small script
> while true; do kmscube; kill kmscube; done
> none of them crashing, so i am going to change it.

Hmm.. not sure if it actually idled when tested in a tight loop.. If you're
running bash, try "while true; do kmscube &; sleep 0.08; pkill -f kmscube; sleep 0.08;done"

Konrad
