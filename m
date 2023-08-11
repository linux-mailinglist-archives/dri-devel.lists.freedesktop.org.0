Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86047793FE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8821A10E6B2;
	Fri, 11 Aug 2023 16:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D1010E6B1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:11:38 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so33593011fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 09:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691770296; x=1692375096;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s9ZAMNQoymALcBO/YXbYxLOGCttwEzlATxN39tlKZ04=;
 b=fNa+PgzzPdYbITjpJAUXp2GrOx+clAFsasfMkdYezWUZCvAEQuWtSZBojr8jxVnvPk
 Ws9f8X/xizsi5nN1+T4MRBgX1rSG/elFH+a31SoIY1szS76XtAv2ELyWLKIzn10eF9TF
 niVOzRSzfP5oCnoavgevMwdMfF/Id7UhdURjMyS2rWidUDiA+R7sO8+BWC+dsHjEWos/
 KmqzadzN7CszS8nG2uemtr0heBYLt2vMmZdNjGJ2S4T9z7RqzgLI3nTT7lyC6czv+hgG
 00g1A7CaMMnfhZUMaSMel1nvO2ATsIyf8G3Bvf2Jz43UutxPQam8QUo6bf+2vlZKbPPV
 Cl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691770296; x=1692375096;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s9ZAMNQoymALcBO/YXbYxLOGCttwEzlATxN39tlKZ04=;
 b=JWmYlhRMzh5eGhikeIQeZ290jTUwxCU3l74tQ8bKu/fCU6amOh0joDCjns4Ydg2fhc
 mwNhnAPULkalMu1JnDVSJmvnOHor6y1BuG8R+GZpYhQr5aRz1g7R5LB0G1lf5oHmx4Yv
 nk08Mnnb7XDw9poEOXIDXZH1gKyy5y7KKvMExS+ZmgtOebjIkcIgAYt//yhirKOvtN15
 tYw1K3fLCyx3ptQRrgSars4SeQHez/vH+MK4NrunJ+oaTANfVnu2mftu2JlEIDTPe4X2
 08Xh/vfGcITQbcnj66bXci6y5KAD6eAczEW7tZts3ar6nzWvKSKzkV9n9/WW/70Laobr
 p2dA==
X-Gm-Message-State: AOJu0Yxl+czRezAg9ucGTlAlKdhgk5bluX8YpwMw62yM5TMOkCC5Dvqj
 /kWH3z6smquKQu3VJE7ZP4ZbcA==
X-Google-Smtp-Source: AGHT+IGD4iru4OlZyO5VyYD4jF4S5cGBNWpAly//GJxDIREQZP5T3IlLN48pB9ByIbg+DjpW8Ef/8A==
X-Received: by 2002:a2e:7c03:0:b0:2b9:e93e:65e6 with SMTP id
 x3-20020a2e7c03000000b002b9e93e65e6mr2003908ljc.35.1691770296329; 
 Fri, 11 Aug 2023 09:11:36 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a2e908d000000b002b70a8478ddsm932084ljg.44.2023.08.11.09.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 09:11:35 -0700 (PDT)
Message-ID: <d400c787-3c81-4e37-b541-371d6096cf7e@linaro.org>
Date: Fri, 11 Aug 2023 18:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a690: Switch to a660_gmu.bin
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230811160505.174574-1-robdclark@gmail.com>
 <CAF6AEGtNgCxsOLyF31=WCdag4Gb7+2FvFEvOWDcqd_TxiTeE3w@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <CAF6AEGtNgCxsOLyF31=WCdag4Gb7+2FvFEvOWDcqd_TxiTeE3w@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.08.2023 18:09, Rob Clark wrote:
> On Fri, Aug 11, 2023 at 9:05 AM Rob Clark <robdclark@gmail.com> wrote:
>>
>> From: Rob Clark <robdclark@chromium.org>
>>
>> There isn't actually a a690_gmu.bin.  But it appears that the normal
>> a660_gmu.bin works fine.  Normally all the devices within a sub-
>> generation (or "family") will use the same fw, and a690 is in the a660
>> family.
>>
> 
> possibly this could be considered as:
> 
> Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
For a lack of a better response, "meh"

Other than that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Perhaps we could take this further and do something like

if (failed to load gmu fw)
	try loading "gmu.bin"


Konrad
> 
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index 1ed270dae148..756a9cfe1cbf 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -478,7 +478,7 @@ static const struct adreno_info gpulist[] = {
>>                 .family = ADRENO_6XX_GEN4,
>>                 .fw = {
>>                         [ADRENO_FW_SQE] = "a660_sqe.fw",
>> -                       [ADRENO_FW_GMU] = "a690_gmu.bin",
>> +                       [ADRENO_FW_GMU] = "a660_gmu.bin",
>>                 },
>>                 .gmem = SZ_4M,
>>                 .inactive_period = DRM_MSM_INACTIVE_PERIOD,
>> --
>> 2.41.0
>>
