Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA29D938B25
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2024 10:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD68810E402;
	Mon, 22 Jul 2024 08:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fKGOFitp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1150C10E404
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 08:25:45 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a77cbb5e987so357383866b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 01:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721636743; x=1722241543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=XtqEPWiIr5vp/nAZ6HNI8AOL/dWbCPA+lfoLLgou6Hw=;
 b=fKGOFitp6Iz/i9v+MOrHB3WZRGVX4SiGa8OEID+YT0QqM71YOMlL/9J/NcLLG/lNpX
 RWAORy7KNqfr8FW2ZeTcP7VbGjXV++cElSohZMnKC0OTikGhLXH0YfqmBcskcF/O+SGp
 Wm+Q4EYCeErddCRF3ZOUA2uJpDXLeG03otMXLAbxfhEETAY6j6LrCVUk/0JQXlGmJMS/
 cu4MIS/YJ3cFXsifp80FNLQMGD6Swcsbbtgqr441ftt3GsBiFrVh/KMusMTD4Zi7Cwyn
 Uwmwlzm5EUNMC7zBDsoZLqbAQqaPHsWAQRen8v26LWu6TMG0OyBaM+r0n7OZDWFsYstO
 IPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721636743; x=1722241543;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XtqEPWiIr5vp/nAZ6HNI8AOL/dWbCPA+lfoLLgou6Hw=;
 b=R6XWhruJhqepLgd9L93WYPjBVwjQHPx5cPITfeOjqLBibDEbjrV/+ZvpZpB3AKu/Rq
 3EGqVVZaroqvepZDFyd/MFj9oTl29DXloCZAsi8niklSyIR+ZDex6oGC7kqfqH/stKpp
 DTOO+yI69608C9jcyNx84F89prWT/4zMNYSf4Fxq0c7zRmvFYM+LeWNbBb/vPnjHhFN0
 0R0GLdgb7kpQE5HfhhYgfuXb84oundPhEl2oqT8va9Gc0vOczIyjwRRfMGDrqKAtYUP5
 6kWPXWdbUlseW+he5Jnt5x8QER9hgMoWmYZ6J/28FjI/AEmILDuSCL1V6kkE1K2ZHW8X
 Xhrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOUu3vv9qrAjyudMfPssBfLnhcHift7YJ6pA+zipVEg8FzSmVIPR+/Fzzj+T7Np+Gy93vvVMrmLvk3D3cDEQBoOxdnEH/38fXz3PL4rxGY
X-Gm-Message-State: AOJu0YzAWdkn4+MzzWWfQyurZScbsTHCo5kMfe7kTUAu5WIGlvgwgCkJ
 UyYB0N411e+OuZJ9xmQCSvtihf/Qczzijg0EixmTxNm92ECWLG/leVbNHQw/vdU=
X-Google-Smtp-Source: AGHT+IGKb0DMJLTWAhEF9XWfE2qhv3NGVnXyLBAa4TmYYsM6+WNSBb7kb393XBb48PWxntzfh8uogg==
X-Received: by 2002:a17:907:968e:b0:a72:8d40:52b8 with SMTP id
 a640c23a62f3a-a7a4bfa38fdmr404781966b.3.1721636742993; 
 Mon, 22 Jul 2024 01:25:42 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7be6f8sm393121666b.76.2024.07.22.01.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 01:25:42 -0700 (PDT)
Message-ID: <2b078266-c5be-427e-bb82-264ed31094e1@linaro.org>
Date: Mon, 22 Jul 2024 10:25:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/adreno: Add A306A support
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <trabarni@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 20240618164303.66615-1-robdclark@gmail.com
References: <20240620-a306a-v2-1-0d388e1deebf@gmail.com>
 <2f10d70a-aed6-4687-8e12-4d649f6a2a5e@linaro.org>
 <CAGsSOWUoSkDooRx+QUrucj517pBFxwDMiCwoA6tah5o2=q2oGw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAGsSOWUoSkDooRx+QUrucj517pBFxwDMiCwoA6tah5o2=q2oGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 21.07.2024 11:43 PM, Barnabás Czémán wrote:
> On Sat, Jun 22, 2024 at 1:36 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 20.06.2024 11:52 PM, Barnabás Czémán wrote:
>>> From: Otto Pflüger <otto.pflueger@abscue.de>
>>>
>>> Add support for Adreno 306A GPU what is found in MSM8917 SoC.
>>> This GPU marketing name is Adreno 308.
>>>
>>> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
>>> [use internal name of the GPU, reword the commit message]
>>> Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
>>> ---
>>> Changes in v2:
>>> - Rebase on https://patchwork.freedesktop.org/series/127393/
>>> - Link to v1: https://lore.kernel.org/r/20240528-a306a-v1-1-03a66dacd8c7@gmail.com
>>> ---

[...]

>>>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c | 11 +++++++++++
>>>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c     | 14 +++++++++++---
>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++++++
>>>  3 files changed, 28 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
>>> index 0de8465b6cf0..61aeac5054a2 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
>>> @@ -41,6 +41,17 @@ static const struct adreno_info a3xx_gpus[] = {
>>>               .gmem  = SZ_128K,
>>>               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>>>               .init  = a3xx_gpu_init,
>>> +     }, {
>>> +             .chip_ids = ADRENO_CHIP_IDS(0x03000620),
>>> +             .family = ADRENO_3XX,
>>> +             .revn  = 308,
>>
>> Double space
> It is similar like other blocks.

Feel free to correct it there as well

[...]

>>>
>>> +static inline bool adreno_is_a306a(const struct adreno_gpu *gpu)
>>> +{
>>> +     /* a306a marketing name is a308 */
>>
>> "marketing name is a308" could use a (), but it's me being picky..
> /* a306a (marketing name is a308) */ ?

yes

Konrad
