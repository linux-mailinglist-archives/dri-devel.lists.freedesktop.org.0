Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4E3917CA2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 11:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F008C10E2EF;
	Wed, 26 Jun 2024 09:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iBRC2vpg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A0C10E808
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:37:06 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a72604c8c5bso355674566b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 02:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719394625; x=1719999425; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=AEVD+w0TTAAVvcUXpjCC9r3Xtde98FGUdgCPdfiAa2c=;
 b=iBRC2vpg7dut+IEvcYsPAL7gj0k5RaKoI/l/9Deor038LbFL4llbIhRKuVgxEwdLZN
 wHvkPATSNv0g8zWjOKoWYeXlek9jN+zd/Y0FfIQV5ckV0H587eE08dnW0gG1xjgkhB7y
 TGyHxApZa3ofLTpVdJhgiApqlHBADU0Xt/lrH1zcnoNcO5NtZWszakVI8kHvma02Fy8c
 Duw1tzS+0A9Ssj6u8S6xwUGmycp1pYKvjDS67s2RCvGp8ASCnw+xY3hlmh1iAo0HALbw
 ENBOIRQsPr/mQ6zMHk/lYaQRhbr/ZG14x3nEeZwYsK6ezdcsiEJ4rdT+ghGhWSqpq8ny
 VDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719394625; x=1719999425;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AEVD+w0TTAAVvcUXpjCC9r3Xtde98FGUdgCPdfiAa2c=;
 b=fHrL/P7WWpAhc3vTkuLusUYroWusymXcptjG+JA6nLMxB4ZEGIl6LxR8VkeI3LruWg
 I+3xbmxvuqqj+PnfHVA+yN8ZR6pqbSNWNRfSITIXjCOovPSu47C3Njl0a3ubeAzlojnx
 JkLpLrbIxZy4aHUkbCyKNiOOoNKx5BPonSf2DplnEan361FHCCtfiNJgOWqYGyh2Z1YJ
 8LLXWzNLU+kLlTpiVCgxZ4oNZVnonycNTVF0vQhP7Q/BHksasCRG01l7beVdDl0vnW8G
 VVKuxAyDuivF/2SnZVjKoTnDc2hwA+1t/NA283hXQhjHkslQD9KlwjOCqzCV1WvxuVfd
 yHBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZW88nDsR93oGSJ6E1nvErt/UVIeCY7B/jU47p/t9dn2rw3oTkq69h55B42HiWC+Nt9DsShNTI8anbeJDzRE1eaL5VcH2MLdMKTZQhpiJT
X-Gm-Message-State: AOJu0YxfNQJ2A0zg72D2ogxdD6Rx1wRwoHvJ77uOo9lW/2prREHy1Tb4
 eOewKoSN3iXe7HV5L9K6O29zhB0DSDES17hH5UKbdI/zkSRFuMpGR3E5yEr0qEo=
X-Google-Smtp-Source: AGHT+IHMd5gcTGXG0btMMetTthXNYoimPBO8ehjkfI6u1J6Ceh0RTvs6sjMc+EPy7NGvsHh8ni7voA==
X-Received: by 2002:a17:906:a8d:b0:a6f:4c10:8da6 with SMTP id
 a640c23a62f3a-a7245b45a69mr587403866b.2.1719394624617; 
 Wed, 26 Jun 2024 02:37:04 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a725cc93794sm246743566b.170.2024.06.26.02.37.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 02:37:04 -0700 (PDT)
Message-ID: <a33ac27f-ab88-40a7-9cb0-9d27342fed09@linaro.org>
Date: Wed, 26 Jun 2024 11:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com>
 <5947559d-30dd-4da1-93cc-a15dc65cb77d@linaro.org>
 <20240626082422.zcsari27yoskayuo@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240626082422.zcsari27yoskayuo@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
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

On 26.06.2024 10:24 AM, Akhil P Oommen wrote:
> On Mon, Jun 24, 2024 at 03:53:48PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 6/23/24 13:06, Akhil P Oommen wrote:
>>> Add support in drm/msm driver for the Adreno X185 gpu found in
>>> Snapdragon X1 Elite chipset.
>>>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> ---
>>>
>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++----
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
>>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
>>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
>>>   4 files changed, 36 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> index 0e3dfd4c2bc8..168a4bddfaf2 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>>>   	 */
>>>   	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
>>> +	if (adreno_is_x185(adreno_gpu)) {
>>> +		chipid = 0x7050001;
>>
>> What's wrong with using the logic below?
> 
> patchid is BITS(7, 0), not (15, 8) in the case of x185. Due to the
> changes in the chipid scheme within the a7x family, this is a bit
> confusing. I will try to improve here in another series.

Ohh I overlooked this.. sounds a bit unfortunate.. 

Seems like it doesn't really fit the "else" branch anyway, let's
keep it for now then

Konrad
