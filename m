Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 280956D08BB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 16:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D448910EE98;
	Thu, 30 Mar 2023 14:52:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3188710EE98
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 14:52:34 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g17so24882884lfv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680187952;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kFDNA5O4BRFjY00+Z1LJW119elAYOYVUw4CBAie71cg=;
 b=eJWBU//eJrHG5mc3MWkqYZSyeiQVk3i4eaOJaS41ZDWBEDAUymCfUZpzw4Pa3onpqz
 fxSBz4CVxHV4C26hz68gTIB7+KPV6LMDDuTcrf9WHS6GBTTtSBLyNjrobEakV77CPSXb
 hnCSvLwk9tDgMA1LICJA9RS1zI5gShpEJev6LHd3x+QMwBgh1IwH2mkaxalD7ekwD6rG
 94FcZ9oMOdJEF4173i0w4lthkEKj+E7ny6cjXPk5/NYfW0Kp6A6rdQLXII9w43spK3Lg
 3px+6MCY3Ev88K6PUL95C1q2ctf/xYudq4ASG49tVVzgCEzMygzgtNL7cL0Ri1WwABfV
 jhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680187952;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kFDNA5O4BRFjY00+Z1LJW119elAYOYVUw4CBAie71cg=;
 b=jJ7/MHNL9jlLtOIarVwWLYNZ9akyLjFdbjFqmSWz8ZXnkAu4Hm+HtPBVziozgX0ywa
 GbGm/gt4CjN8JLIVPCX68Mh5xJkTv8G3yjs6nBc1K+65+F9eRX/CfNXcbEa0kWhuaAe9
 nEkcaDMvu7JF5I9WDlvj64KLR75H5B1tiUoQWOh/9/8EcVfhvVlctSFfB26YNX2MJa2x
 YlxnLw7xb1ZBXqwpxYwPOv+j9AVWxRBiiDcsEbEA+pnZiqSb9EW+d7TJDlPMQJxpv+oA
 JUPYB16BuLVmnusc3ghhaEEuD/iVbzH0athC06YoFLumxAqM2nM70EXPMQuDKLPl78D8
 bhhA==
X-Gm-Message-State: AAQBX9eEEZQJq5AnjUFMeTiFfqmnQBDYgc7enKWwuT1T7WuRY8gO34Xb
 gjo2HoUj+oYxylfxy6d8NVtIqg==
X-Google-Smtp-Source: AKy350bV2TIdi9zQe23PfA/0zCWQl3PFtYMIVplNdHrQIPV+NXfL02RAP+7MfBDh5lc4xKsVFwO3VQ==
X-Received: by 2002:a19:7919:0:b0:4e8:3cfe:98c7 with SMTP id
 u25-20020a197919000000b004e83cfe98c7mr1915967lfc.4.1680187952252; 
 Thu, 30 Mar 2023 07:52:32 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q29-20020ac2511d000000b004eb09820adbsm2385504lfb.105.2023.03.30.07.52.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 07:52:31 -0700 (PDT)
Message-ID: <2eff49b1-f0ad-8d44-5902-93937867178b@linaro.org>
Date: Thu, 30 Mar 2023 17:52:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/msm/adreno: adreno_gpu: Use suspend() instead of
 idle() on load error
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230329140445.2180662-1-konrad.dybcio@linaro.org>
 <ZCRNFitcrAeH27Pn@hovoldconsulting.com>
 <83986fa9-c9eb-ae5a-b239-584092f2cea5@linaro.org>
 <CAA8EJpohEo+kMw7fx5112m+z7JHSLDmsqOL4T7hmyvr2fPP8vQ@mail.gmail.com>
 <b985e536-227d-df86-0f23-b58882e9654b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b985e536-227d-df86-0f23-b58882e9654b@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Nathan Chancellor <nathan@kernel.org>, agross@kernel.org,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/03/2023 17:34, Konrad Dybcio wrote:
> 
> 
> On 29.03.2023 21:45, Dmitry Baryshkov wrote:
>> On Wed, 29 Mar 2023 at 18:48, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>
>>>
>>>
>>> On 29.03.2023 16:37, Johan Hovold wrote:
>>>> On Wed, Mar 29, 2023 at 04:04:44PM +0200, Konrad Dybcio wrote:
>>>>> If we fail to initialize the GPU for whatever reason (say we don't
>>>>> embed the GPU firmware files in the initrd), the error path involves
>>>>> pm_runtime_put_sync() which then calls idle() instead of suspend().
>>>>>
>>>>> This is suboptimal, as it means that we're not going through the
>>>>> clean shutdown sequence. With at least A619_holi, this makes the GPU
>>>>> not wake up until it goes through at least one more start-fail-stop
>>>>> cycle. Fix that by using pm_runtime_put_sync_suspend to force a clean
>>>>> shutdown.
>>>>
>>>> This does not sound right. If pm_runtime_put_sync() fails to suspend the
>>>> device when the usage count drops to zero, then you have a bug somewhere
>>>> else.
>>> I was surprised to see that it was not called as well, but I wasn't able
>>> to track it down before..
>>
>> Could you please check that it's autosuspend who kicks in? In other
>> words, if we disable autosuspend, the pm_runtime_put_sync is enough()?
>>
>> That would probably mean that we lack some kind of reset in the hw_init path.
>>
>> On the other hand, I do not know how the device will react to the
>> error-in-the-middle state. Modems for example, can enter the state
>> where you can not properly turn it off once it starts the boot
>> process.
>>
>> And if we remember the efforts that Akhil has put into making sure
>> that the GPU is properly reset in case of an _error_, it might be
>> nearly impossible to shut it down in a proper way.
>>
>> Thus said, I think that unless there is an obvious way to restart the
>> init process, Korad's pm_runtime_put_sync_suspend() looks like a
>> correct fix to me.
> On the GPU side, when you cut GX and CX GDSCs, the hardware is off.
> Some clock / gdsc logic may be retained, but the GPU itself gets
> cut off. Parking the clocks and shuttting down VDD_GX (if exists)
> only makes that stronger.

If I remember correctly, GX and CX GPU GDSCs might be voted by other 
users. Again, I'd direct you here to the series at [1]

[1]: https://patchwork.freedesktop.org/series/111966/

-- 
With best wishes
Dmitry

