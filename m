Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA3F6E273B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 17:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D6910ED74;
	Fri, 14 Apr 2023 15:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6034A10ED74
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 15:46:25 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso16750033wmq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 08:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681487183; x=1684079183;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4YvFDcXCxH0IHAlEOnTr7X8C2ZaoaLvqC8PQViNwb+0=;
 b=CGo8j1W2FmAqMnJH4qAKnNiqxbf8gAuLuQXj3WINrZZa2nZXrtKScsRfz+ZfBs9CJu
 MstNB5C5MjYfLqx24lPYBblayV3WVt+GN1vWPW01aBZVxvxBw5r4ib8Zz1hDE2aqM/Ru
 BoLvB6Nn6II6x/0EBKVFKSgjHR4yB9IODMTVz1Uw+YsgEDSzyLVvnJ4pH+dlKuFJ8p3J
 VHg5q6CWFrUmLJuFQUV4+K9vZefK0Qc0huP8lmoyJiSIN8YJ/Gq0l0b+4tjwm+gsPfc2
 eWJLWXDMnQ2cflu3GD3SF2QCB2aYePTtkw9lpn0G+jRsKYxRZDRjkH7YiBeMfXg04ooF
 f9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681487183; x=1684079183;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4YvFDcXCxH0IHAlEOnTr7X8C2ZaoaLvqC8PQViNwb+0=;
 b=fnYLYjcYnA659j3pdQZTABvngcSmrC3ydKNoIxfLVQQ7is8E2mlli7DC2+nxRKIUyD
 vZ4oe2oADMgzs2kGVXl90B8HmnjomoJwNalJKnM0hEecPrrx/OskQ//Ksb5IrfCndFHl
 jUpR8/g2BPe9SPlWxO4q+rILx4STddiUshzsZ7Z7XiDQtpmKXZ2oVjTub+VTl2QXnSuR
 UH8P/TPME+dtzLponED/tLBGs16wlAKA+iDlHqQzaN8kOuexDk2sggmvf7mybUjHjSUp
 vRYWfCjdHR3E6qbPrvKts6NghjZoQKFuplVY2lTIhgmlPWojB+vtRs6CnuaIal/STomY
 4t7Q==
X-Gm-Message-State: AAQBX9dgtvrH0p5xAEL7fjZOQxYU3VT5YkZzUzADb+7eeHYa/AOmRpRF
 hQzgx0OlCztCzt2BN5z/i/Y=
X-Google-Smtp-Source: AKy350ax94Q0q1onTnwQMV5EE3TpgRfQw3R3Ni+6sgIb+LfrPtBcUh9No7WTr/RfBPPvrV2RcFkbIA==
X-Received: by 2002:a05:600c:231a:b0:3ef:1745:518e with SMTP id
 26-20020a05600c231a00b003ef1745518emr4976351wmo.26.1681487183309; 
 Fri, 14 Apr 2023 08:46:23 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a7bc5d5000000b003e91b9a92c9sm4607383wmk.24.2023.04.14.08.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 08:46:22 -0700 (PDT)
Message-ID: <40cf026f-61db-2fe0-f941-bfe5c9aa20e7@gmail.com>
Date: Fri, 14 Apr 2023 17:46:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, angelogioacchino.delregno@collabora.com,
 nathan@kernel.org, ndesaulniers@google.com, granquet@baylibre.com
References: <20230414122253.3171524-1-trix@redhat.com>
 <3242b862-0e7c-b7e9-14cd-3fbcbb87ba04@gmail.com>
In-Reply-To: <3242b862-0e7c-b7e9-14cd-3fbcbb87ba04@gmail.com>
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/04/2023 17:43, Matthias Brugger wrote:
> 
> 
> On 14/04/2023 14:22, Tom Rix wrote:
>> clang reports
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
>>    'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>>          if (ret)
>>              ^~~
>> ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
>>
>> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
>> Signed-off-by: Tom Rix <trix@redhat.com>
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 

Please also add
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

see CA+G9fYu4o0-ZKSthi7kdCjz_kFazZS-rn17Z2NPz3=1Oayr9cw@mail.gmail.com

Regards,
Matthias

>> ---
>>   drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c 
>> b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> index abfc077fb0a8..c63294e451d6 100644
>> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
>> @@ -292,9 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy 
>> *hdmi_phy, struct clk_hw *hw,
>>       if (!(digital_div <= 32 && digital_div >= 1))
>>           return -EINVAL;
>> -    mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
>> -                PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
>> -                txposdiv, digital_div);
>> +    ret = mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
>> +                  PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
>> +                  txposdiv, digital_div);
>>       if (ret)
>>           return -EINVAL;
