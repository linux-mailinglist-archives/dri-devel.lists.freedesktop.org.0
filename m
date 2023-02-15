Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3071A6972CD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 01:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E27B10E9FD;
	Wed, 15 Feb 2023 00:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD4C10E9F9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 00:38:53 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id t24so4061606eji.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 16:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DErVdwsy+3xw2GwkFW/1jP8o0hXZca4+3mMVdiVqO0g=;
 b=FtXlYQuaQwjPUMXlRr1vGDA6uOOxl2acYjEpOiX8O/IfY6xybcVCbrja3quEX5WEtd
 tDeHcLl8KhQYNZrbaTtNmsbzAQ4RBqoLp0MotI/yT9Kfipkz8hYuXBrebCSzfsz22qn0
 gFyBBO3m9/akpjE25FysCAPzriP3+giUaD1ygSDLT7ppawyVwSnBAPfwCDK25AP5CSXg
 uR6zBQ/9/OQ+XFliSIdq/akdqN5t4K8LaBOE/EZVCpVOIh2GvDA7ohK69oPswRLu77fu
 FBCqnyckT1YSX6gRK1yvLk5viF97Zt2QxjlYRWH3k8VItf/0WGHY8NPK6hdbu5fhcele
 fFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DErVdwsy+3xw2GwkFW/1jP8o0hXZca4+3mMVdiVqO0g=;
 b=VL+wdVp799C535JgnaCq/DsSxYxhQj/Uq8L91NpvzXYTl6bej7NJKamazkd61iK1m4
 c2ntKXP6zik3E2pBPSIeXXYBgxmxIQaQQLEfH1OPkCIBv+0a9NE3OcjG2V8NtEiGobxu
 Vp6Q7oqxgjXS5eEqtDvHSAlJ9JIAr9gM7MLeAYy1ZPP4Z9MIj0IzGfQhXxayx1K9wk1V
 gka1SV034qCx2VUuWNYb8GftEj198psFVqpWzvIvTXcwnplN8nx+8sr5htAIEWOd4aRb
 8nzn++Sc6DiWK8fvMyurPo0rk5AnY1Ek/AmTf9PGsiG7JLQ/dZFdUmNHbpJb+rNn10aq
 rC2A==
X-Gm-Message-State: AO0yUKWQU7NVtT9LQV7mqFeEVjThpASf88WeeN/BMKqyu3fM/r7vFO/p
 plOzAksX+9rLNHs1A1jZfBbWCw==
X-Google-Smtp-Source: AK7set/Pf8YmPNmxd7Fuo6gurGgDxLsWDmYD262e9PepNFs42+X34FypQ04DMvhoJpnxOin0grMz2A==
X-Received: by 2002:a17:907:2c65:b0:883:b1b4:e798 with SMTP id
 ib5-20020a1709072c6500b00883b1b4e798mr391411ejc.10.1676421531499; 
 Tue, 14 Feb 2023 16:38:51 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 ci4-20020a170906c34400b0087873afb1b4sm8888438ejb.41.2023.02.14.16.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 16:38:51 -0800 (PST)
Message-ID: <1c57fcfd-8e94-649b-df6f-655626f94454@linaro.org>
Date: Wed, 15 Feb 2023 01:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 10/14] drm/msm/a6xx: Fix up A6XX protected registers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-11-konrad.dybcio@linaro.org>
 <CAF6AEGva3ecxTOx3Yb+Wh-1K=jYA3tDo_aXg09jS9pzJupYExQ@mail.gmail.com>
 <a4627ca5-46e6-2f32-c0e2-a85990e02f54@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <a4627ca5-46e6-2f32-c0e2-a85990e02f54@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 agross@kernel.org, marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 15.02.2023 01:10, Dmitry Baryshkov wrote:
> On 14/02/2023 23:56, Rob Clark wrote:
>> On Tue, Feb 14, 2023 at 9:32 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>
>>> One of the protected ranges was too small (compared to the data we
>>> have downstream). Fix it.
>>>
>>> Fixes: 408434036958 ("drm/msm/a6xx: update/fix CP_PROTECT initialization")
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 503c750216e6..d6b38bfdb3b4 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -690,7 +690,7 @@ static const u32 a6xx_protect[] = {
>>>          A6XX_PROTECT_NORDWR(0x00800, 0x0082),
>>>          A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
>>>          A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
>>> -       A6XX_PROTECT_RDONLY(0x008de, 0x00ae),
>>> +       A6XX_PROTECT_RDONLY(0x008d0, 0x00bc),
>>
>> Nak, this is intentional, we need userspace to be able to configure
>> the CP counters.  Otherwise this would break fdperf, perfetto, etc
>>
>> (although maybe we should comment where we diverge from downstream)
> 
> Yes, please. Otherwise it is extremely hard to understand the reason for diversion between the vendor driver and our one.
+1

I am content with dropping this patch from this series, so long
as you leave a clue for others to not scratch their heads on this!

Konrad
> 
>>
>> BR,
>> -R
>>
>>>          A6XX_PROTECT_NORDWR(0x00900, 0x004d),
>>>          A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
>>>          A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
>>> -- 
>>> 2.39.1
>>>
> 
