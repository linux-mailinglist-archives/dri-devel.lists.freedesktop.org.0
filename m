Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273326940B7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 10:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22A1C10E4FE;
	Mon, 13 Feb 2023 09:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC57310E4FE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 09:19:16 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id hx15so30113049ejc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 01:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bHu3VWFPa2PUiv+M72nCmChN6FXiZwy+qBIZ5VWBZE0=;
 b=KG8fgOMPNDK047xvYS1/VEJVbemoOZQvkAV3IPeaWR0bvYmXnsgRLJi7vk35FQ+ME8
 DJOrvut2VPNNW50AkKiQxsUmahgEuIXO2Xlv7re1cMGomi/Y4uDJWDEgBLYkGGaDTeCC
 vGEQ11zVw3WHqtR6VE/PF7hLx0dFpr0gnB6ekkWJUEnYtnW16H2uZ61um4Z9vW1/eZuj
 FfoQnuatswot/s1QgSVnD713vGJg/UfJrt6TiXES6hdv5r5i+XWm6F4sjKtoVN9CUptZ
 AeqLbmk6tA/sEHWIlROlatdQLkpQoF8Gtzlf+gi/hrXggZ20IVhQPs05KZr41oLOpW2J
 T8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bHu3VWFPa2PUiv+M72nCmChN6FXiZwy+qBIZ5VWBZE0=;
 b=w9yshhWDB2yqe9PJ0Jc5cYs09enGrodTNJbtIJBZCtCoCjsWKJPKO7KpJVvpkaF3AI
 AJpbtPNyWgWpwtGPeW8qDFJYZ+iUgNZbDUICOokoq3eGGMLbEoh+DAbs16nAUD1L+ksy
 FbK3vK5/aoy0UGIEkr9RXdhOhXLJSqYsCJXEv/kAHpx17mbEITNVBg3/LP2nUfHtQwt0
 QpkljEp60sHVxhlYJzAW284xEme9C8K3wWasbphs5tt2jpZl8n3etHVkcNBCuZgSrses
 bIsEpjqEQj3oR3bsPbpJslohFKmj7BWBdmIP1UJJ5EmQYsHS3wBK/FfuaNrCVlAFOdm0
 13YQ==
X-Gm-Message-State: AO0yUKXSIYXuCD08EJshR+yNTqzzo43CV0zsAk2owqHL4Eow3wGYu0dQ
 quJWbDNsY4WpfQxZuKAr4VKg2w==
X-Google-Smtp-Source: AK7set91u0gCsDmBKfkG639YOdzJKkWrdP5/ou8pgOviXHIwPofwVIBaN5T432BG8EKX4+H6QaDJqg==
X-Received: by 2002:a17:907:3201:b0:8ae:b7a4:4cf5 with SMTP id
 xg1-20020a170907320100b008aeb7a44cf5mr24409539ejb.37.1676279955345; 
 Mon, 13 Feb 2023 01:19:15 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a1709061ed000b0088f8a61eb48sm6498699ejj.154.2023.02.13.01.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 01:19:15 -0800 (PST)
Message-ID: <4eed93cd-e5dd-9988-fd8a-4070922aab28@linaro.org>
Date: Mon, 13 Feb 2023 10:19:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 04/10] drm/msm/dsi: dsi_host: Fix DSI index detection when
 version clash occurs
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
 <20230211115110.1462920-5-konrad.dybcio@linaro.org>
 <94882ab1-1eb0-b9f1-af70-dc070c96fd11@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <94882ab1-1eb0-b9f1-af70-dc070c96fd11@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Archit Taneja <architt@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11.02.2023 14:26, Dmitry Baryshkov wrote:
> On 11/02/2023 13:51, Konrad Dybcio wrote:
>> Now that msm_dsi_config is ready to accept multiple sets of registers
>> (where array[n][idx] holds the base registers of DSI(idx) for the nth
>> entry), loop through all available configs to resolve hw version
>> clashes.
>>
>> Fixes: 32280d66fd44 ("drm/msm/dsi: Don't get DSI index from DT")
> 
> Do we really want to backport this patch (and other patches from this series to older kernels?)
> 
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/dsi_cfg.h  |  1 +
>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 12 +++++++-----
>>   2 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> index 03493cc6b772..4a47705234bd 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
>> @@ -43,6 +43,7 @@ struct msm_dsi_config {
>>       const int num_bus_clks;
>>       /* Allow + 1 entry for the zero-terminator */
>>       const resource_size_t io_start[VARIANTS_MAX][DSI_MAX + 1];
>> +    const int num_variants;
>>   };
>>     struct msm_dsi_host_cfg_ops {
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> index f5092b4d0757..8dfa69bcff77 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>> @@ -1862,16 +1862,18 @@ static int dsi_host_get_id(struct msm_dsi_host *msm_host)
>>       struct platform_device *pdev = msm_host->pdev;
>>       const struct msm_dsi_config *cfg = msm_host->cfg_hnd->cfg;
>>       struct resource *res;
>> -    int i;
>> +    int i, j, num_variants;
>>         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dsi_ctrl");
>>       if (!res)
>>           return -EINVAL;
>>   -    for (i = 0; cfg->io_start[0][i]; i++) {
>> -        if (cfg->io_start[0][i] == res->start)
>> -            return i;
>> -    }
>> +    num_variants = cfg->num_variants ? cfg->num_variants : 1;
>> +
>> +    for (i = 0; i < num_variants; i++)
>> +        for (j = 0; cfg->io_start[i][j]; j++)
>> +            if (cfg->io_start[i][j] == res->start)
>> +                return j;
>>         return -EINVAL;
>>   }
> 
> Please squash this together with the patch 'drm/msm/dsi: Turn msm_dsi_config::io_start into a 2d array'.
Ack

Konrad
> 
