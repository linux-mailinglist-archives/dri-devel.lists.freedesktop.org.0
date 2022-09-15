Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF3A5B9A14
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 13:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD30710EAF3;
	Thu, 15 Sep 2022 11:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96D910EAF6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 11:50:59 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id a2so5935783lfb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 04:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=GYjBx+TTNXbw/WLp0Jvwj4Wv4yudD0lYMrMqLkpgpnU=;
 b=ebuQ4Xn1kBkl71fNdOvZVtbmfRD6z7c/EZwdTE5og57SWW4/19PtfEA5x58qmlgg3g
 m2HHetX2w6A0M1DXHxWyw8X/RNQpBuoppDDi34RCMccCKsMhJWPEgZ99kK0M4Y3lmx67
 v4ADObrCVBCzYC0fYEbzxH/OeQSfFSHO+jrM94PhsaGc7LM0ZJmfRyIo1QnnNPP7uCYO
 rMk0viXY6wb1+Ift33OggbOB0jZRTv5WYA/Hykbv+ZTEP+of8w3tPhwdqJVpu68eWBxH
 HE4DwLkbQjBzU/Czx7QUJyddvgyHQVN3/gLJxbzFj5WbZy3ufVvi/EjAiZ37L0vnCEkM
 7IXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=GYjBx+TTNXbw/WLp0Jvwj4Wv4yudD0lYMrMqLkpgpnU=;
 b=WdH7tcD8jzr5neVtq668Uvj/SMndhkW6PsIZ0LOGQdM6ibIXLJzQOsHUQ2yDYKutjL
 XmoN0YgmczPYZyfW1BDXiNRlM/G5xPtMxMTCubz4xwPVJ/Az6pLkI3NkcBlIDfTMjQvk
 t82InZoJCrAXMQaps+6E8hjDsei3T4q1eEmi7Wlc1tvpy5Hiuj0jbp3fr+3wtPzzQEsZ
 MzkB87g4poj4bEv78mOklTYxLgKyNBdoxELmmrX9eResFFUIWLwrunEN8w34UQd0rllm
 uYyCC4CFKFB6u6KWjixsl1LGwWKlCYuh0hlRSBDN4+XYxYCpU6Ug0vts8o9pgaYVoSzV
 amOQ==
X-Gm-Message-State: ACgBeo1z/Q05huHtB1qfEAQ7RwSsSMWeiAw0pAuKOxRl8649tWPvwfec
 DjYNiO7qO7mCLg+YTUGmVE1kwQ==
X-Google-Smtp-Source: AA6agR6Iecb7F3OilQtwzLiSgm2kPoDjO5aeY1iSCleldjSxJuz5CzAhEa2YTlvqJOchX48KbZcQHg==
X-Received: by 2002:a05:6512:2521:b0:497:a6e4:4e1 with SMTP id
 be33-20020a056512252100b00497a6e404e1mr13672895lfb.320.1663242658090; 
 Thu, 15 Sep 2022 04:50:58 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a197512000000b00494a11c5f52sm2935386lfe.256.2022.09.15.04.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 04:50:57 -0700 (PDT)
Message-ID: <dafc0231-c578-07f1-1f4b-1cf819fa349a@linaro.org>
Date: Thu, 15 Sep 2022 14:50:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
 <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
 <20220908193705.GA3002673-robh@kernel.org>
 <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
 <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com>
 <2204eab4-b22d-8ee7-4595-49139cb387a8@linaro.org>
 <CAA8EJpqHL-gO=zSG6Ek=-y4njGF5R66z0MwLeKZ9U4Ag1j51Og@mail.gmail.com>
 <e7a132e7-a819-ebe2-e6e5-c01cbfacef15@linaro.org>
 <CAA8EJpoPPRAQPfVQmSfrrDrroMp0bzvJ=-vHMRx72aKTBgPOTA@mail.gmail.com>
 <f013accb-96f7-a025-1d41-e2e97f8b2aa8@linaro.org>
 <CAA8EJprnrKP9Ze__KTTNGDs8sj3QhqpiHnnhf1=ipq+CFCoXsQ@mail.gmail.com>
 <272413e3-73d4-8e0d-7b5d-93007e419f76@linaro.org>
 <6e3bca5a-8b01-af12-ae69-b0044a8790f6@linaro.org>
 <2b4ab827-28aa-5e3f-951a-0bf43d1eb7b9@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2b4ab827-28aa-5e3f-951a-0bf43d1eb7b9@linaro.org>
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
Cc: Loic Poulain <loic.poulain@linaro.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/09/2022 22:19, Krzysztof Kozlowski wrote:
> On 11/09/2022 20:36, Krzysztof Kozlowski wrote:
> 
>>> If your child schema fails, the referencing schema fails as well...
>>
>>
>> Although now with DSI-PHY I cannot reproduce it and I am pretty sure I
>> reproduced it with DPU controllers after modifying the DTS to lack a
>> property... Hmmm
> 
> https://github.com/devicetree-org/dt-schema/pull/82

Thanks for the quick fix!

However I think I'd still stick to the compatible binding for two reasons:
  - It doesn't evaluate schema twice for these nodes
  - It allows us to tightly link child nodes with the parent compatible, 
which I think, was one of the points raised several revisions ago.

-- 
With best wishes
Dmitry

