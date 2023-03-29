Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D01006CF3F8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 22:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466BC10EC05;
	Wed, 29 Mar 2023 20:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB1B10EC05
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 20:01:04 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id k37so21773692lfv.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 13:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680120062;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QOz2LnBeoR0UsX1ajFY+JsP7ZZvmsV9hCjLXu958Cw4=;
 b=bvnD+S2+ONOEkOKYd9Sua4486Us6nUvXP1T7Av/0SNOnmG5sC9rX7LYqJQH4aFbIIk
 d16Igh19Bdy1nRd8FXa7wbVzZIHgH0efIYEa55zZOI1lubyzPRv0SYYv/irQsNR9P35R
 PU5x23FQMlg2MCg+1WsA3JdRBa3sgcSivfFTuSBXOb+ktYK8TplB0tG3pq6E1Pyfk/8n
 /FS9JII8RSU3T3+BL7K9tkXYiYWwJDjJJHlyatB1TRYbis9K51clA5Ayr0FSwev9wtAa
 lTJ0G9zwkQ4a80pZg4bDROA6+wNOwGxUEolcG+HhVkY+DFsDkXLtaDfLgj4ya8H8vGqT
 phyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680120062;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QOz2LnBeoR0UsX1ajFY+JsP7ZZvmsV9hCjLXu958Cw4=;
 b=RaE1hfiNtWnT3Fkk8HEsJ8JrNiWiYfhli6Yvz9pXpbWP/7JxV2ixX6yXpLJi/PWsJt
 qPLx+QboxOrBYKs3rVI9eYX1xiXwJSflFtnn6FxLTmb9yjevNoIx2QMUwkZeoXJW0OG2
 anjC49GX3IrcGYhr+XSUzw6zwH64G79BrYtls9VUYW1ZssGdO/EQWPYyN3ZUtaYKqR+M
 IUx7dMDmefHIhHrJBaMeYnMQQSPtBXCym11tE6+qzqSuJV4r/7ZuN/5zkTPsXmmHXfPU
 tPjeQ7qdaAplomscWP4TgGyjxtarglNxYRmkZPfPku8NfKMID0dhkskjJmMNQOCWVwGE
 qA+g==
X-Gm-Message-State: AAQBX9fZD2AvgRai7vmKXajmt2QhecOo1tEr3KYr1HSF/XI0CXBcxBLd
 a77lk2d2lURyxLDsG5BO8Uj6Cw==
X-Google-Smtp-Source: AKy350bhm+8M87yTF9xXkPrCxrIC+ScPXmtLGPFwZX0Q9oEVNcpmxE6UwcLGLVfQlyHI7IY27XqsUw==
X-Received: by 2002:ac2:5969:0:b0:4b5:2cf4:cc1d with SMTP id
 h9-20020ac25969000000b004b52cf4cc1dmr6002100lfp.68.1680120062582; 
 Wed, 29 Mar 2023 13:01:02 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l17-20020ac25551000000b004cc9042c9cfsm5545322lfk.158.2023.03.29.13.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 13:01:02 -0700 (PDT)
Message-ID: <9fbda2ac-d611-ed3a-bbd5-4fa58f39c713@linaro.org>
Date: Wed, 29 Mar 2023 23:01:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 14/50] drm/msm/dpu: Allow variable SSPP/INTF_BLK size
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-15-dmitry.baryshkov@linaro.org>
 <f0cc19ec-83ee-151d-e4d2-83a2cd5dc7f7@linaro.org>
 <526734f4-d2a6-b8b3-d300-dbf0bcfde91f@linaro.org>
In-Reply-To: <526734f4-d2a6-b8b3-d300-dbf0bcfde91f@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2023 13:18, Dmitry Baryshkov wrote:
> On 13/02/2023 13:01, Konrad Dybcio wrote:
>>
>>
>> On 12.02.2023 00:12, Dmitry Baryshkov wrote:
>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>
>>> These blocks are of variable length on different SoCs. Set the
>>> correct values where I was able to retrieve it from downstream
>>> DTs and leave the old defaults (0x1c8 for sspp and 0x280 for
>>> intf) otherwise.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> [DB: fixed some of lengths]
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Oh you fixed it quicker than I could respond!
> 
> Yes, I wanted to include it into this patchset, so I had to fix it.
> 
>>
>> Still, I think the 8280 sspp size should not be
>> 2x the norm..
> 
> Let's doublecheck this with somebody having access to docs.

The additional research shows that all of us were wrong here. I'll 
update it to 0x2ac for the next revision of the patchset.

-- 
With best wishes
Dmitry

