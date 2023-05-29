Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8AE71479A
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 12:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA0710E0AC;
	Mon, 29 May 2023 10:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A66E10E0AC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 10:01:17 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2af29e51722so33061551fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 03:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685354475; x=1687946475;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NnjxsqeBUt3nN6IEIFcMokb1FE2z6yxCiutSi12fIMw=;
 b=Zam50bsfGCeAd+Q4HbMgubwGcnEpql+KsjM/23AhbtzJIILsYkkVddgYpFlg3q6JeF
 xPiy7PxJLnXjRCn/0UBBzSDxx++ggSzm23TrygJ6CX4ykUKsaXTGlVjNWKqh6UcW+bSf
 gtXeTN/hyEmTXWqBdxh5AOLVZDuIbPe28n8FBM2StjpIGdXfGpm8Qyc2Y9YRXbXpC89S
 YZyMdocDpieHb3ogMuleFdR+x+S+PfaIZdl/aIa93tRURNUJlPrRYPhjDzQTENlzozWf
 yyNV6F3WxJoHImcYu28PArW0rhjX0gpgVdrulNMchTuvJ4nu49Og5n6PFWB5fEgW9v9a
 Pnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685354475; x=1687946475;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NnjxsqeBUt3nN6IEIFcMokb1FE2z6yxCiutSi12fIMw=;
 b=i1jDlBi4Pif+WHO/9cO2Z1FmmSlyCCdRB59D3UbTLwKSVOh6vbHvN1VO9gvcR9EqQE
 pc6Z1TYwp2SGKLp0LrTVle1Nzp85yHbKsqFzxyoIfZugVP+SDe5uZZen8I6INOFoPVwa
 f5+D6y/juxeJl6aiPJgdZdJkgmYnNCE6jLCyutb4L+E8jBOUvJNyN8C+DasguSNRWRcW
 e/TLvGLEPreFQ+JgsoEFs0Oyh42Nw0CGlAaESQAnBA2KjRePnEdfnwxoTaG64AHDcdKK
 +vIoiRHfOeL0KcFWatYCkQXHyGyp14Qqqg6zy9hhD/Jr4KIfRA8joTHpHvc2smnNWHuf
 GWxw==
X-Gm-Message-State: AC+VfDxUd+OHdVoSRO1nP2j3erbK6adovT5b3Z0me/D5t669ZSS7JRiV
 5cN99xOUFJha6yjIvqBW7VFNhA==
X-Google-Smtp-Source: ACHHUZ614GmzOwkADdb0cx2/sLyZX4qloMdouIYDIHIuIU3ETpYVay2HnEGMkLMZCvonJyeyWejbcg==
X-Received: by 2002:ac2:44c9:0:b0:4e8:4412:1d95 with SMTP id
 d9-20020ac244c9000000b004e844121d95mr3096049lfm.29.1685354475042; 
 Mon, 29 May 2023 03:01:15 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y19-20020ac24473000000b004f3bb9f1068sm1915381lfl.225.2023.05.29.03.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 03:01:14 -0700 (PDT)
Message-ID: <3b5b6271-9611-9884-f0de-5b3f7c3d7b72@linaro.org>
Date: Mon, 29 May 2023 13:01:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/5] MDSS reg bus interconnect
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <CAA8EJpo8X7KrrXoButyW0d1Lz=a5Stw2inFGt2R7KJ+2NTX6wA@mail.gmail.com>
 <74a817ff-5850-330d-8cac-f551be6fa35c@linaro.org>
 <254cd131-4ad1-44c9-2653-862580503c15@linaro.org>
 <e99a9fe9-21e4-fc56-d400-4f6e9df2eaed@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e99a9fe9-21e4-fc56-d400-4f6e9df2eaed@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/05/2023 12:08, Konrad Dybcio wrote:
> 
> 
> On 29.05.2023 10:47, Dmitry Baryshkov wrote:
>> On 29/05/2023 10:42, Konrad Dybcio wrote:
>>>
>>>
>>> On 29.05.2023 04:42, Dmitry Baryshkov wrote:
>>>> On Mon, 17 Apr 2023 at 18:30, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>>>
>>>>> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
>>>>> another path that needs to be handled to ensure MDSS functions properly,
>>>>> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
>>>>>
>>>>> Gating that path may have a variety of effects.. from none to otherwise
>>>>> inexplicable DSI timeouts..
>>>>>
>>>>> This series tries to address the lack of that.
>>>>>
>>>>> Example path:
>>>>>
>>>>> interconnects = <&bimc MASTER_AMPSS_M0 0 &config_noc SLAVE_DISPLAY_CFG 0>;
>>>>
>>>> If we are going to touch the MDSS interconnects, could you please also
>>>> add the rotator interconnect to the bindings?
>>>> We do not need to touch it at this time, but let's not have to change
>>>> bindings later again.
>>>>
>>> Ack
>>
>> Also, several points noted from the mdss fbdev driver:
>>
>> - All possible clents vote for the low bw setting. This includes DSI, HDMI, MDSS itself and INTF
> As in, "you need NUM_CLIENTS * MIN_VOTE" or as in "any client necessitates
> a vote"?

Each client has separate vote

> 
>> - SMMU also casts such vote, which I do not think should be necessary, unless there is a separate MDSS SMMU?
> There's one on 8996, pre-845 SoCs often have a MMSS MMU, 845 and
> later have a MMSS-specific TBU which (theoretically) requires a
> vote for access to 0x400-0x7ff SIDs

Ack.

> 
>> - PINGPONG cacsts high bw setting for the sake of speeding up the LUT tables if required.
> Hm, I think is would be a separate topic.

I think so. I'd do a single vote from mdp5/dpu1. Then we can cast higher 
vote from PP/DSPP/etc.

-- 
With best wishes
Dmitry

