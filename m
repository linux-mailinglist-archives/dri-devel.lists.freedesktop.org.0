Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1213D7794A0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314AA10E6BB;
	Fri, 11 Aug 2023 16:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B098810E6B9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:31:16 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b9a2033978so33589731fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 09:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691771475; x=1692376275;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kLkcROD0bRaahMTY5iVtJo3yNizIeUpQp+dJ24ES2Uw=;
 b=RDyb7eyEm+haK0975YQ+/4L22fz9Y6+ak8l8Bcyjf045yR2TwVHulziSP8YCS+8B18
 3ZCxXK57fS/42EDAdDJvj+ckgaSvZPGIRC0Raw3xaWXuxf9HLvJj94MWJ71NkWOOwQ69
 ozcPZUf1e4vD1SU2flS6UsZxBPwZCVHmE1tJhfz9mbvgRjnTFGFtT0qN6bmhgDAcYKT1
 wM5X3ymbk/q49tW5hNZ47BrFn6n1tB8q9nh0yRFGCWUUsnJOc0wEEwsNB4UAylOEqwFQ
 Bejr3x9j32h077Us8WJBD5WIonfix5Tw27uhHu5ex47yjshRUlxjWVxCdpVCOkEh5htI
 gCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691771475; x=1692376275;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kLkcROD0bRaahMTY5iVtJo3yNizIeUpQp+dJ24ES2Uw=;
 b=eU4HEDHdnKhFOD15SmTT6cv8m0tLdJSW8cViTnX0s5s3wEIVpONHTP5xJ8C5PEuAY9
 N9IOL74AibeiZBskSGidKRjIMe7tqxq//lq5Sx3d7Av37aVmRQ+k/YZWVyUQI/w6Fkdl
 J+ex5M8+m9zpOD3bG/9U1dDO7V4DMk2AbqfsS7jWVLzeKUSMbXFSrh2y84j1hlGFzWLc
 4J1Or60iYG1BuHvMuz0aFjct9XgsMQStE8vUIRoVYpvO3cf6lJSp1qxVwTaOBGDgHzGv
 QCyXBDK0u7SooVgNE3JxAvWRyEiqKFK9rKB4JsM3EnBE3RH/0JJT8iPq7ObGjxTmplLP
 t/FA==
X-Gm-Message-State: AOJu0Ywa/CCixv+Ujca6cUiDeo1b2x3gmUURlMR722xSHcQUagQfWgPM
 /pPREXWzX1tdxd18kxY0txMvuw==
X-Google-Smtp-Source: AGHT+IHFG9ollgImzMMdYBRWWMcnL/V7VX58KVS60uOPaSHqMPSI4Tyau4UrFJ2sGfQ9V423VK6Gig==
X-Received: by 2002:a2e:82d7:0:b0:2b9:3684:165 with SMTP id
 n23-20020a2e82d7000000b002b936840165mr1991259ljh.8.1691771474857; 
 Fri, 11 Aug 2023 09:31:14 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a2e9917000000b002b6cb40e9aasm911429lji.103.2023.08.11.09.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 09:31:14 -0700 (PDT)
Message-ID: <39ffcd61-eb56-41c5-ac43-9ace2595c11b@linaro.org>
Date: Fri, 11 Aug 2023 18:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a690: Switch to a660_gmu.bin
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230811160505.174574-1-robdclark@gmail.com>
 <CAF6AEGtNgCxsOLyF31=WCdag4Gb7+2FvFEvOWDcqd_TxiTeE3w@mail.gmail.com>
 <d400c787-3c81-4e37-b541-371d6096cf7e@linaro.org>
 <CAF6AEGuHKuW_LGYfC640fBHsf3xzxSiyqL0YVpb5HqE=HSiL4w@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAF6AEGuHKuW_LGYfC640fBHsf3xzxSiyqL0YVpb5HqE=HSiL4w@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.08.2023 18:21, Rob Clark wrote:
> On Fri, Aug 11, 2023 at 9:11 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On 11.08.2023 18:09, Rob Clark wrote:
>>> On Fri, Aug 11, 2023 at 9:05 AM Rob Clark <robdclark@gmail.com> wrote:
>>>>
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> There isn't actually a a690_gmu.bin.  But it appears that the normal
>>>> a660_gmu.bin works fine.  Normally all the devices within a sub-
>>>> generation (or "family") will use the same fw, and a690 is in the a660
>>>> family.
>>>>
>>>
>>> possibly this could be considered as:
>>>
>>> Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
>> For a lack of a better response, "meh"
> 
> It would help route the change back to 6.4.y so we can stop explaining
> to folks that they should create a symlink ;-)
Ok fair!

> 
>> Other than that:
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Perhaps we could take this further and do something like
>>
>> if (failed to load gmu fw)
>>         try loading "gmu.bin"
> 
> that (loading random fw) sounds like a bad idea.. plus gmu.bin doesn't exist
I guess we still should hear from Qualcomm on this one, but I
do believe that "aXYZ_gmu.bin" is really "gmu firmware, tagged
at aXYZ release". They're even versioned and adreno-gpulist.h
downstream contains the minimum version for each SKU.

Konrad
