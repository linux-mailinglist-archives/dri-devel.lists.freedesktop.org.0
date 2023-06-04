Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 452DF721405
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 03:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AAD10E09C;
	Sun,  4 Jun 2023 01:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFACB10E095
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 01:47:10 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f6067a9029so4357082e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Jun 2023 18:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685843228; x=1688435228;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x6uhed2cRD1eObTiku8eArjPbSJO8HLDvaDTuRDrq6w=;
 b=HKnoeDu8EixKceqBBFvpU9P+QRH3IX8FEk9TQYQDJ3iJmrbDnQyTK6252KRtnWZtWM
 QZJVYxY4zLK+zBCiLLceEp85IvFU7yx8a/4p193Yweeo3x37BVrHcVLmeKyCKSA9JxWI
 WdLGLx6LUDhlpcSADD9xD/8g76UpIYvA6NKtzjLWHN39321b0orl7QcKRqSRLOHUH1Z/
 vf0hbDSvMBE26B7OgbPvf9WEs3q2kaXoK+T7P1Pv1yJM1ukZGRftryr4ZZ0I+bM2ADP2
 qht3NBfcbgLy0MU422PpCnSSZNMp9WV1KDKvqTTxCHYDpPVvQC6nQHaK4RynWSGafQRO
 arpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685843228; x=1688435228;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x6uhed2cRD1eObTiku8eArjPbSJO8HLDvaDTuRDrq6w=;
 b=ORnRMoNY4Q0o73RX/4FiEWUXIdMEzFYxiemIordpDCo6QycnIZQHI+MNcAllJh0G7w
 gGdzNxE/yuuI5OZRliwpBW506C5zJ11CvJ2q+3Iu1S/ly0tcrAL/E8Dvpngv04jbDBH9
 FSYV09WcwwuICqe109eJ0hCVRE183fTmLVpAIvvJDwGpZu+JK3EtATmzrg7KMJW8Vmq/
 jYLq3lVSyf+yyOlFUWyeXmGReF5TnpM04IsCoRCNSXJdM9P1yvVGIOiQn184PR5BmIZE
 oEw/yU5fjYKgvTaEgV50USqcqpwaUMB0MMp6chMt6dTESEEOBxTKm3LWfZ7SBKsWn6c3
 HRjA==
X-Gm-Message-State: AC+VfDz6JG43+mjbqKL5wnmvDDv42jXCgaGC7P4LqDmYQLSSSFzBw3bJ
 QN2eR9Wx4rtVk5Pvvz3fCU92EEMiXEkUiNfjg24=
X-Google-Smtp-Source: ACHHUZ69Mr3ytCwbUFh1zGQoEbiGYyUW20IKowwatT9sHBg2KFGkbsAZRez464428oxbWJ2XCzKDRQ==
X-Received: by 2002:a2e:3318:0:b0:2b1:b68d:b10c with SMTP id
 d24-20020a2e3318000000b002b1b68db10cmr2079491ljc.32.1685843228375; 
 Sat, 03 Jun 2023 18:47:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a2e8904000000b002b1bb9a3febsm464479lji.74.2023.06.03.18.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 18:47:07 -0700 (PDT)
Message-ID: <e242509b-6602-9a70-a624-0141673fd75c@linaro.org>
Date: Sun, 4 Jun 2023 04:47:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/3] drm/msm/dp: Clean up pdev/dev duplication in dp_power
Content-Language: en-GB
To: Bjorn Andersson <andersson@kernel.org>
References: <20230515030256.300104-1-quic_bjorande@quicinc.com>
 <20230515030256.300104-3-quic_bjorande@quicinc.com>
 <d7d27051-2853-c979-b965-3cad47f2b693@linaro.org>
 <euxiqfx3q5cs3z2unai67w3h33y225whstauqezwbcx4pcqegl@jct5c7crcet7>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <euxiqfx3q5cs3z2unai67w3h33y225whstauqezwbcx4pcqegl@jct5c7crcet7>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/05/2023 06:53, Bjorn Andersson wrote:
> On Sat, May 20, 2023 at 04:26:59AM +0300, Dmitry Baryshkov wrote:
>> On 15/05/2023 06:02, Bjorn Andersson wrote:
>>> The dp_power module keeps track of both the DP controller's struct
>>> platform_device and struct device - with the prior pulled out of the
>>> dp_parser module.
>>>
>>> Clean up the duplication by dropping the platform_device reference and
>>> just track the passed struct device.
>>>
>>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>>> ---
>>>    drivers/gpu/drm/msm/dp/dp_power.c | 16 +++++++---------
>>>    1 file changed, 7 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
>>> index 031d2eefef07..9be645f91211 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_power.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
>>> @@ -14,7 +14,6 @@
>>>    struct dp_power_private {
>>>    	struct dp_parser *parser;
>>> -	struct platform_device *pdev;
>>>    	struct device *dev;
>>>    	struct drm_device *drm_dev;
>>>    	struct clk *link_clk_src;
>>> @@ -28,7 +27,7 @@ static int dp_power_clk_init(struct dp_power_private *power)
>>>    {
>>>    	int rc = 0;
>>>    	struct dss_module_power *core, *ctrl, *stream;
>>> -	struct device *dev = &power->pdev->dev;
>>> +	struct device *dev = power->dev;
>>>    	core = &power->parser->mp[DP_CORE_PM];
>>>    	ctrl = &power->parser->mp[DP_CTRL_PM];
>>> @@ -153,7 +152,7 @@ int dp_power_client_init(struct dp_power *dp_power)
>>>    	power = container_of(dp_power, struct dp_power_private, dp_power);
>>> -	pm_runtime_enable(&power->pdev->dev);
>>> +	pm_runtime_enable(power->dev);
>>>    	return dp_power_clk_init(power);
>>>    }
>>> @@ -164,7 +163,7 @@ void dp_power_client_deinit(struct dp_power *dp_power)
>>>    	power = container_of(dp_power, struct dp_power_private, dp_power);
>>> -	pm_runtime_disable(&power->pdev->dev);
>>> +	pm_runtime_disable(power->dev);
>>>    }
>>>    int dp_power_init(struct dp_power *dp_power, bool flip)
>>> @@ -174,11 +173,11 @@ int dp_power_init(struct dp_power *dp_power, bool flip)
>>>    	power = container_of(dp_power, struct dp_power_private, dp_power);
>>> -	pm_runtime_get_sync(&power->pdev->dev);
>>> +	pm_runtime_get_sync(power->dev);
>>>    	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
>>>    	if (rc)
>>> -		pm_runtime_put_sync(&power->pdev->dev);
>>> +		pm_runtime_put_sync(power->dev);
>>>    	return rc;
>>>    }
>>> @@ -190,7 +189,7 @@ int dp_power_deinit(struct dp_power *dp_power)
>>>    	power = container_of(dp_power, struct dp_power_private, dp_power);
>>>    	dp_power_clk_enable(dp_power, DP_CORE_PM, false);
>>> -	pm_runtime_put_sync(&power->pdev->dev);
>>> +	pm_runtime_put_sync(power->dev);
>>>    	return 0;
>>>    }
>>> @@ -199,12 +198,11 @@ struct dp_power *dp_power_get(struct device *dev, struct dp_parser *parser)
>>
>> Technically we don't even need to pass struct device here, we can get it
>> from parser->pdev->dev.
>>
> 
> Right, but afaict dp_init_sub_modules() passes struct device * as first
> parameter to all the "module" initializers. So it feels reasonable to
> keep it, for now, for symmetry.
> 
> What do you think?

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

