Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE6D67950E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 11:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B9310E659;
	Tue, 24 Jan 2023 10:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3338B10E658
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 10:20:12 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id hw16so37594412ejc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 02:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eZAw4Wd/yIjakYBu/HQ1aGBARqEQv7QS64hYIpsab74=;
 b=RRAonQSeen9UFZdm5y7pb0rYTtTt3nZK8xN6CkeoZ6A6OZaR3IneFLSnZbCbFX7QqL
 sVj5B7loHSTDXP/mogaqoosuy9fohaaEwY50EE8V9LpmAtS+0uIHpYH1mg9SqWd+RjBy
 5HHw3hfi36jAbPKHRTB4Hly1hxa7d5k0L/3owxU3TtlARdw1VzgX1ozjrCgzvFM0b+Cz
 rLjRG4pyEIX++vmxstRMsjFLLtF+U9PMFvyqweS3LOnY4wDJc2+/gPXCR6EtgkYCyg6K
 y6fjKC41kV9j53J52/We9M1oWPcoMc4VJN+XhuRf9xEDKETi2Hw4wVYlMGaUcLcg5hlA
 ZPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eZAw4Wd/yIjakYBu/HQ1aGBARqEQv7QS64hYIpsab74=;
 b=Zon/IpOtyPGFHJahuJlmtzfx53U4sxn9w81kjgDlNSr1r5uvcceTiftkaoq+A1Sq67
 p8rXUVqXI2u3RW25yJOQazj4tv4+Rup4yf/wK00uOS3niTKhbPWrcwrkN09EEjIxtnU9
 e1afNjyZi60WL/LzaUwY+BkFHMCWDmyFVcmCR8QIjCpqRVxYXImt5vE+8sLSSKd2VrR5
 Y8ergTBgLNuCfqqR8ciT7i25LpDT0r3i82YGy/pdSjxnVK89rsusQQjXoYDek6LVkEx3
 D5QTAe+axuhb5XdvkvQBM/WwtP07vXkimFq3kw52AmtsitxfFfu+eARMid+0aNap51p6
 GRsw==
X-Gm-Message-State: AFqh2kqlOxCUq68Zz+anEiIokWZp7mZnQ8DnPODbZ/aQ/Fz15/J3lOeZ
 bZJa71D3eo4QUywvq/7ODHPHGw==
X-Google-Smtp-Source: AMrXdXuN1UUFLI3cQ5HGZONf6xzIfHcBdoCW3QFSYVTY1/p1lEc/mqprKVme2OUnem84eOZKKrAkFQ==
X-Received: by 2002:a17:906:1798:b0:84d:43e4:3633 with SMTP id
 t24-20020a170906179800b0084d43e43633mr27252357eje.36.1674555610686; 
 Tue, 24 Jan 2023 02:20:10 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 jr17-20020a170906515100b0084d4b8f5889sm696697ejc.102.2023.01.24.02.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 02:20:10 -0800 (PST)
Message-ID: <d4ae5354-ec53-c676-2b91-fc45cc425c68@linaro.org>
Date: Tue, 24 Jan 2023 12:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [2/2] drm/msm/dpu: don't use DPU_CLK_CTRL_CURSORn for DMA SSPP
 clocks
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230115124143.464809-2-dmitry.baryshkov@linaro.org>
 <20230124101346.gwx4z4n6sem5r72t@SoMainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230124101346.gwx4z4n6sem5r72t@SoMainline.org>
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/01/2023 12:13, Marijn Suijten wrote:
> On 2023-01-15 14:41:43, Dmitry Baryshkov wrote:
>> DPU driver has been using the DPU_CLK_CTRL_CURSOR prefix for the DMA
>> SSPP blocks used for the cursor planes. This has lead to the confusion
>> at least for the MSM8998 platform. In preparation to supporting the
>> cursor SSPP blocks, use proper enum values to index DMA SSPP clock
>> controls.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550 on top of next-20230116
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> One question follows...
> 
>> ---
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 64 +++++++++----------
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  2 +
>>   2 files changed, 34 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index ad0c55464154..b0f6e071fe4b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> <snip>
>> @@ -1199,9 +1199,9 @@ static const struct dpu_sspp_cfg sdm845_sspp[] = {
>>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
>>   		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
>>   	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> 
> Are these DMA pipes with CURSOR support, or how should I see this?  For
> MSM8998 I suggested to remove the _CURSOR bit since it has two dedicated
> cursor pipes (not yet represented in the catalog) but these SoCs don't
> seem to have those.
>

As I wrote earlier, this part just marks them to be used for HW cursor 
support.

-- 
With best wishes
Dmitry

