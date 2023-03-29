Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A9A6CED59
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 17:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD0A10EB5D;
	Wed, 29 Mar 2023 15:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925A310EB7B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 15:48:59 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id o20so13699330ljp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 08:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680104938;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8jD8NVqtsPudciwhm8Tk75NT4wlLoElkTtYals9Zh3s=;
 b=PKp8ZyPYUiw16H1l/Agu1Uq/X0RhJ79mp3NP7m0jlPV/StUndLoQ357goARYFgOX4F
 QrlJRI8G2izmMQ/gHL21qr1I6bKibkBLgoNaNcIIJveQRYu5Xq5R/mgu+zTeA2ztD5G5
 6JSm8iy20Z5prXFolUXL8ZOsMtmdGrbabURIklMpJVYndk6txmfVSk4Ov2XBQ99X+iiB
 1CGIqAzaO7+S1XY2n4JMrmnp3vhjhroT6PX081yUUnqBul8g0L3mxoK0nzg8HhbfLsFg
 5MQEtKVlHQrk+luDabREpnLgOI/CLsO9jH96uEt2pTty3ZacA54NZi89k0HSzMYtKbvJ
 jPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680104938;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8jD8NVqtsPudciwhm8Tk75NT4wlLoElkTtYals9Zh3s=;
 b=xGzZBGKUdnlZ3oqE0S2z0eLPcNRQd0V9Hv0ALwqAleCd+y4FgYG8m1mHajDOq7wHNs
 aQsTuGRPA3vPpcP5tZJYTrM47SUAkyhM+8+h7vzLHK9BzcmQe1xzn4Cf/a1TQZ0g9kaY
 dCx2HDMz9rm9ik+RqprV0vaz6E9tlCUxphq0Jys8o5529nIGSC8fyC6lvqLVksrqV5Th
 kW2t42F7f/1KBIMQ4Y8b1gIb841sE4fttobV95apBz0fLpoDwVjGMderSZIPyzjk5MXE
 X2llAB3Fg0m3X8gKpoR3uqFlbSlQMAP9DY1lCIZ0udV60oOLjZTW75VaDCV+q1IuI/3P
 pvpw==
X-Gm-Message-State: AAQBX9ek27GKyWpZTWbok/TKAvsQCA15ONZcaT0iCwcMr/XI2xXY++Sy
 0eIgkudCMYCKclNNBkslm78QnA==
X-Google-Smtp-Source: AKy350bZwb0nN1eKm+plrJvvRh6qWAf4xzfzhIpDrFsv1Xnvma4OkZ7P9lJEitJzajVJLNdExNnbaw==
X-Received: by 2002:a2e:8604:0:b0:290:5166:7c28 with SMTP id
 a4-20020a2e8604000000b0029051667c28mr7077535lji.20.1680104937770; 
 Wed, 29 Mar 2023 08:48:57 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a2e854e000000b00299ab2475ebsm5546763ljj.1.2023.03.29.08.48.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 08:48:57 -0700 (PDT)
Message-ID: <83986fa9-c9eb-ae5a-b239-584092f2cea5@linaro.org>
Date: Wed, 29 Mar 2023 17:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/msm/adreno: adreno_gpu: Use suspend() instead of
 idle() on load error
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
References: <20230329140445.2180662-1-konrad.dybcio@linaro.org>
 <ZCRNFitcrAeH27Pn@hovoldconsulting.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZCRNFitcrAeH27Pn@hovoldconsulting.com>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>, agross@kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29.03.2023 16:37, Johan Hovold wrote:
> On Wed, Mar 29, 2023 at 04:04:44PM +0200, Konrad Dybcio wrote:
>> If we fail to initialize the GPU for whatever reason (say we don't
>> embed the GPU firmware files in the initrd), the error path involves
>> pm_runtime_put_sync() which then calls idle() instead of suspend().
>>
>> This is suboptimal, as it means that we're not going through the
>> clean shutdown sequence. With at least A619_holi, this makes the GPU
>> not wake up until it goes through at least one more start-fail-stop
>> cycle. Fix that by using pm_runtime_put_sync_suspend to force a clean
>> shutdown.
> 
> This does not sound right. If pm_runtime_put_sync() fails to suspend the
> device when the usage count drops to zero, then you have a bug somewhere
> else.
I was surprised to see that it was not called as well, but I wasn't able
to track it down before..

> 
> Also since commit 2c087a336676 ("drm/msm/adreno: Load the firmware
> before bringing up the hardware") the firmware is loaded before even
> hitting these paths so the above description does not sound right in
> that respect either (or is missing some details).
..but I did some more digging and I found that the precise "firmware"
that fails is the ZAP blob, which is not checked like SQE in the
commit you mentioned!

Now I don't think that we can easily check for it as-is since
zap_shader_load_mdt() does the entire find-load-authenticate
dance which is required with secure assets, but it's obviously
possible to rip out the find-load part of that and go on from
there.

Do you think that would be a better solution?

Konrad

> 
>> Test cases:
>> 1. firmware baked into kernel
>> 2. error loading fw in initrd -> load from rootfs at DE start
>>
>> Both succeed on A619_holi (SM6375) and A630 (SDM845).
>>
>> Fixes: 0d997f95b70f ("drm/msm/adreno: fix runtime PM imbalance at gpu load")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index f61896629be6..59f3302e8167 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -477,7 +477,7 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
>>  	return gpu;
>>  
>>  err_put_rpm:
>> -	pm_runtime_put_sync(&pdev->dev);
>> +	pm_runtime_put_sync_suspend(&pdev->dev);
>>  err_disable_rpm:
>>  	pm_runtime_disable(&pdev->dev);
> 
> Johan
