Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 984777A91E0
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 09:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC7310E56D;
	Thu, 21 Sep 2023 07:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C9310E56D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 07:04:40 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c0179f9043so9086061fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 00:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695279879; x=1695884679; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vwmvG5vLsSx5qVJpIDAQauKd5SFkomPYwP2Gxr7JRg4=;
 b=GHH5/DzRjlH8VLf64u+fkfkKmhpO+Y+8z7bm/pPcN3M/OfoLgfHC+kAdx0nlxC2hoD
 zbbM7z3Bl7Vl06Yoti1ZGF9mLQjTHIeQUYFfDDJpHJ4gy4cP8B5ix7QfY+oc0qe0Esol
 zRBpi0/WJcRgFCk4T7EekaA0Sm9e/c6Q9uj/7Jlv15rmtPpEEgdwohebheps7IobYk35
 rLRIvSDTrZIVMhx2JaOI+xeiKA0qvIR+vOMLxTev/WSk4t7R7JfzBWpBlJ1dSgKPFhjy
 GGpViKIrG6jTUTccLFJUY6r/6fQs2Rryuj2IjUFOj9atWK4hm2onHmf5ppRRnol6asaD
 Yq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695279879; x=1695884679;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vwmvG5vLsSx5qVJpIDAQauKd5SFkomPYwP2Gxr7JRg4=;
 b=fvNuBQsuOLTY9Acn9cC++Pz2W6tjYY/8D/dozoS3cpjzjYQGOfmWJj9ugASSws4MKi
 B4sYsx2S8om0ZF8f2QOZPTUS0E8I7Gkmvom3UJnpcEi0YXK5hYn7pZ7o1B1JnlUoABRr
 8bEsaIYgivby1BXct2sf8AyReJ0udyEul/4xmduQ/6KHyeiY/Z5UWYO9/7JkHjUFqJVR
 KebX/VqaoJBoLb7dayKM6n6OJvPRdH4b9lCz2l4RjlEy7yr+Mm26DoXmRTk0w6Oe9Yer
 basl/JHBzJJnUiBGZ0o3Av4oGbNnwVsC4UkHpFZQ2T2Hyul8dzt5t4gaCy9nHKsa/yPb
 yg8Q==
X-Gm-Message-State: AOJu0YwzCeOv2KOzn45ze48hdTLpIfsrOzRNY7khG0mkbil0+f6tcVSI
 GNoaCrTMe+EBUaI6CERHMRnlzg==
X-Google-Smtp-Source: AGHT+IFhVm19T+LegUcKx3F6tIXfI3FFKdbMKTy0n/7EXfRWUf6QpqiIp9wLl2V2H4TrPU4Mt8A7rQ==
X-Received: by 2002:a2e:b608:0:b0:2bc:b54b:c03f with SMTP id
 r8-20020a2eb608000000b002bcb54bc03fmr4204197ljn.5.1695279878602; 
 Thu, 21 Sep 2023 00:04:38 -0700 (PDT)
Received: from [172.20.15.189] (static-212-193-78-212.thenetworkfactory.nl.
 [212.78.193.212]) by smtp.gmail.com with ESMTPSA id
 b18-20020a170906039200b009ae5674825asm590222eja.47.2023.09.21.00.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 00:04:38 -0700 (PDT)
Message-ID: <ce67c10d-a589-dc2e-76cf-fb5cfaa48c66@linaro.org>
Date: Thu, 21 Sep 2023 09:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] drm/msm/dpu: Add missing DPU_DSC_OUTPUT_CTRL to SC7280
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
 <20230921-topic-7280_dpu-v1-2-6912a97183d5@linaro.org>
 <444d125c-2a87-3bae-6ea0-b76dffeb63ef@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <444d125c-2a87-3bae-6ea0-b76dffeb63ef@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/21/23 02:01, Abhinav Kumar wrote:
> 
> 
> On 9/20/2023 3:46 PM, Konrad Dybcio wrote:
>> DPU_DSC_OUTPUT_CTRL should be enabled for all platforms with a CTL
>> CFG 1.0.0. SC7280 is one of them. Add it.
>>
> 
> sc7280 and all other chipsets using DSC 1.2 use dpu_hw_dsc_init_1_2 and 
> not dpu_hw_dsc_init.
> 
> dpu_hw_dsc_init_1_2 assigns the dsc_bind_pingpong_blk op by default.
> 
> So this change is not needed.
Gah, I don't like that we do it behind the scenes but I agree it's a NOP..

Konrad
