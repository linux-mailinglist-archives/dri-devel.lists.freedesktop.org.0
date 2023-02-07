Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3B268DCED
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 16:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C22410E53E;
	Tue,  7 Feb 2023 15:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673B710E1C5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 15:24:33 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id qw12so44032279ejc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 07:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E4mcdO4GpGeKLuTlOjNBh4mETE9qrYBfrhlJsygbBeU=;
 b=V2/UFreSqT0sDfRJ0PD1H7glVVJRqSxyNrhyxCRKRjuDV242Y4gANFkwYovSMEU2OM
 1hSbjMymRW/U3ISn0k7YW6r5izjyyMrNy2hCxvk0l39NG9ODdI+u4R1pwQPXwH9c1GHQ
 ue8yemYY0skZn1uv00er7Wct6TODInhLqlf60puVsfU2xzJ1tfNu8IhC6ZfBX+aRk8FB
 KHhrQJoUkGNiRDtqDsYqDSuUx5ftwJImPnZciiRL/+s6YSuAR9N8kLGHMoSvhVKYvRVN
 w+bDr1kbdD+wsZc7jvyS6EB2aRxwztDrvY+uimv+1LyPRPtTM4oZ4sLqlAzEvdnJQXKr
 +Dwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E4mcdO4GpGeKLuTlOjNBh4mETE9qrYBfrhlJsygbBeU=;
 b=t34SLULwlpeW5Hh2JaBtBAqfjDcfXz/OsBni8JjGch3EkWEHjlGMnFdXSqmwRybKlV
 flOVdnZ1frnLU7In3A192d42SurIizFPj569jivBmxr/SPdfGCFmcsgSJpZO2JtK/1n0
 peQ2bJHWApH+XjpacTWx2BhAdKDjI6Eac8iGfC1Ssd6adDXOwiDdMWQ/v2L8CQbguCzR
 E6hpYBV3bkTT/KcXFKike9dmUZwT0XqzIT868OlZ+7JmHGrcH+W8e52aLxTH0TWK5orn
 fR5gvR68M6JbXDj177B27NBpCoX+5sd1tpYcwRriyJ/56YkKeNyHsEC0vS2iPIi1acxj
 y2Zw==
X-Gm-Message-State: AO0yUKUvpImv4VktnUCpSCHntbQT1SrAQYgPVRvnGySobhQOFh1pKmFx
 mYxtEW7tflIpbC9VP/COb2KRtw==
X-Google-Smtp-Source: AK7set9STfsFCp07aOqg2rbvX4m0E1kxYNITo05IiStJ8XTFgNLQCUyi7uqyBZFTCn8DfPCbPNbHJg==
X-Received: by 2002:a17:906:adb:b0:889:f989:d8ee with SMTP id
 z27-20020a1709060adb00b00889f989d8eemr4137878ejf.22.1675783472019; 
 Tue, 07 Feb 2023 07:24:32 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170906318c00b0088b93bfa765sm6948232ejy.138.2023.02.07.07.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 07:24:31 -0800 (PST)
Message-ID: <ca9be4ea-a174-dc28-b98c-c6c90f972392@linaro.org>
Date: Tue, 7 Feb 2023 17:24:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v12 09/14] drm/msm/dp: disable self_refresh_aware after
 entering psr
Content-Language: en-GB
To: Vinod Polimera <vpolimer@qti.qualcomm.com>,
 "Vinod Polimera (QUIC)" <quic_vpolimer@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <1675091494-13988-1-git-send-email-quic_vpolimer@quicinc.com>
 <1675091494-13988-10-git-send-email-quic_vpolimer@quicinc.com>
 <670d0a87-a932-6f33-b363-5499dc7ff29f@linaro.org>
 <BN0PR02MB8173FF10EF6F1522C52F30E4E4DB9@BN0PR02MB8173.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <BN0PR02MB8173FF10EF6F1522C52F30E4E4DB9@BN0PR02MB8173.namprd02.prod.outlook.com>
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "Sankeerth Billakanti \(QUIC\)" <quic_sbillaka@quicinc.com>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Bjorn Andersson \(QUIC\)" <quic_bjorande@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Vishnuvardhan Prodduturi \(QUIC\)" <quic_vproddut@quicinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2023 16:28, Vinod Polimera wrote:
> 
> 
>> -----Original Message-----
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Sent: Tuesday, January 31, 2023 6:19 PM
>> To: Vinod Polimera (QUIC) <quic_vpolimer@quicinc.com>; dri-
>> devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
>> freedreno@lists.freedesktop.org; devicetree@vger.kernel.org
>> Cc: Sankeerth Billakanti (QUIC) <quic_sbillaka@quicinc.com>; linux-
>> kernel@vger.kernel.org; robdclark@gmail.com; dianders@chromium.org;
>> swboyd@chromium.org; Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>;
>> Kuogee Hsieh (QUIC) <quic_khsieh@quicinc.com>; Vishnuvardhan
>> Prodduturi (QUIC) <quic_vproddut@quicinc.com>; Bjorn Andersson (QUIC)
>> <quic_bjorande@quicinc.com>; Abhinav Kumar (QUIC)
>> <quic_abhinavk@quicinc.com>
>> Subject: Re: [PATCH v12 09/14] drm/msm/dp: disable self_refresh_aware
>> after entering psr

Can we please get rid of this somehow?

>>   
>> On 30/01/2023 17:11, Vinod Polimera wrote:
>>> From: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>>>
>>> Updated frames get queued if self_refresh_aware is set when the
>>> sink is in psr. To support bridge enable and avoid queuing of update
>>> frames, reset the self_refresh_aware state after entering psr.
>>>
>>> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>>> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
>>> ---
>>>    drivers/gpu/drm/msm/dp/dp_drm.c | 25 ++++++++++++++++++++++++-
>>>    1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> As I stated in v11's discussion, I do not like the way this change plays
>> with the self_refresh_aware. Please find another way to work around the
>> timing issue (let's probably continue the discussion back in v11).
>>
> Currently we are not able to reproduce the issue with KASAN enabled and minimum cpu frequency builds.
> We can revisit this patch if it is reproduced in future. Meanwhile I think on handling it in a different way.
> Can we not consider this patch for current merge?

Ack.

-- 
With best wishes
Dmitry

