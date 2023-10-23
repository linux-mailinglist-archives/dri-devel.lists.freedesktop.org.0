Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D18EC7D4083
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 21:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1589310E238;
	Mon, 23 Oct 2023 19:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A131C10E238
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 19:56:22 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-507d1cc0538so5432170e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 12:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698090981; x=1698695781; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mYhFOHXUbUUqAX9R5BipqQxHYfvxGQDwg7kFXGU8wT0=;
 b=vhKCTIS7ZHUiYCGITlAqMVtXNpaAlhtsLG7HzkAm5eHjFKxCb/+/e4ZGcXq0OOM6AK
 dp23GNekOXwLS1ldEB4sJ63ybUa1Z3Af/Vw8BvXj80YGG0u8qpnXeDwsxHKe83Jrq9kI
 RmeOydIVobyOlHt/Ig5MBASgqHP0bWX6arSaFOp4Fh8+Yc6o26WrLZC5QXt1eOqT/4dR
 nyPhFC6SC4gislBZCrO97u5IpS5394xctxCrhL/16zqMN+dxL8efw720UmQziC3McZ6p
 n9G+yFRp4QGcIVU5REC4G3rB1yTcbAX26KEIkFT1ahfWFvp5fLj7MPUyj01sWR0nSHmY
 Golg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698090981; x=1698695781;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mYhFOHXUbUUqAX9R5BipqQxHYfvxGQDwg7kFXGU8wT0=;
 b=sIKaWgiTzS3jTIJk8C0KTLYniTiFvPd6VqS//71hyGq2FjHFUbgYC4eLJpzLoXfMvj
 viAGJ+M/tiuILp9YLOAfV8PBwDLNtGD19ibxL+rNMPy6iN3zTCbOXFjL1cFmdpCXLVpg
 IOWx6vziY9tV9xJFfNjZVEEMvf/XwS9+I7CuKHn3PfFr7PNQaRLVlBx2sMoe1wBrlHQr
 EhQSdPyk96GRGPqgHBaomIEH5xVRTu8kaCIR2/Q+AzNAH/7/gClG16lXwgW0uLFqMHAN
 rDPPePta/JF+umd0wlgE1PfokAOJ+ksLzo05uwddNepk/zsyTP5OLGs7tu/wLIP61I4E
 7KcA==
X-Gm-Message-State: AOJu0YxHIFeIcW88VV05zvAWABB6kTryeuwJzTwflpgvrVkXbHlXAn0o
 iR6iTo6ygzxe7cX+ScWbtNDuCw==
X-Google-Smtp-Source: AGHT+IEZRo53eGHUkTmV9yAU/caZEovr8bcqahgYebYJKx9jWWwMrAx2HKht91PNWIGfd2HQU1VUQQ==
X-Received: by 2002:a19:6716:0:b0:500:9a29:bcb8 with SMTP id
 b22-20020a196716000000b005009a29bcb8mr6616129lfc.4.1698090980584; 
 Mon, 23 Oct 2023 12:56:20 -0700 (PDT)
Received: from [172.30.205.82] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 a12-20020a056512200c00b005007da9f823sm1801580lfb.168.2023.10.23.12.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 12:56:20 -0700 (PDT)
Message-ID: <6a0398d1-22f4-4eb7-ba43-c448055be323@linaro.org>
Date: Mon, 23 Oct 2023 21:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Drop WARN_ON from patchid lookup for new
 GPUs
To: Rob Clark <robdclark@gmail.com>
References: <20231023-topic-adreno_warn-v1-1-bb1ee9391aa2@linaro.org>
 <CAF6AEGuS3PhNbh9Gmu1g9YpUcr3LOh1gZK-XBE+urdb5jRjorg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAF6AEGuS3PhNbh9Gmu1g9YpUcr3LOh1gZK-XBE+urdb5jRjorg@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abel Vesa <abel.vesa@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/23/23 21:42, Rob Clark wrote:
> On Mon, Oct 23, 2023 at 7:29 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> New GPUs still use the lower 2 bytes of the chip id (in whatever form
>> it comes) to signify silicon revision. Drop the warning that makes it
>> sound as if that was unintended.
>>
>> Fixes: 90b593ce1c9e ("drm/msm/adreno: Switch to chip-id for identifying GPU")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 80b3f6312116..9a1ec42155fd 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -203,11 +203,6 @@ struct adreno_platform_config {
>>
>>   static inline uint8_t adreno_patchid(const struct adreno_gpu *gpu)
>>   {
>> -       /* It is probably ok to assume legacy "adreno_rev" format
>> -        * for all a6xx devices, but probably best to limit this
>> -        * to older things.
>> -        */
>> -       WARN_ON_ONCE(gpu->info->family >= ADRENO_6XX_GEN1);
> 
> Maybe just change it to ADRENO_6XX_GEN4?
That also applies to 700

Konrad
