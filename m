Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296DB5B9D31
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 16:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6740E10EB4F;
	Thu, 15 Sep 2022 14:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC5A10EB4F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 14:33:36 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 n17-20020a05600c501100b003a84bf9b68bso13908156wmr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=wnHQKWcpBCnlgkgGEcKhjPdjmSAL7sgo8FjBnqwxuRk=;
 b=Fv+3vdzUC/FW+D3gRIqf4d/40nLZ0zbPTAiGBYbmnKQ2x5kWskEbj0ZiKXWr6V7q4t
 JrlU3+00PgYIY2OT3jM7xg2Y1g+0CLkgtCM6owx9l3Mp47n1oObxi+zYKpOjaThYeXYg
 MZ1t7kEwhXLF4mOSj5P5nWUcBQRbwwcHwsjLOpjmTxmGJNCN8eiN4aBW9+8Qfatt23jB
 BTK7al5c5lv7n52rQ3z8b3oUamHfqvs6G2bh3rha6B4/REwYzRiAH7RpUaXDnt9E5Yjb
 6ciAsg1M3dyAAgp/pkDfjWEwK/Wyh39O3t2Ylg6DlA5dC0TJB7+0s4Fn7kaWgvWJDsGd
 GRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=wnHQKWcpBCnlgkgGEcKhjPdjmSAL7sgo8FjBnqwxuRk=;
 b=Op9C4mZEU58Ev87V6AU+A6WBUH2MA9fQfUCV6lfWQyxbX2XfX9HewzyKRuVfT1nNHX
 jCfugEipLezlsWucZkchXcq99OutDfz7E4E02zW1Ws1AgtukH8m1NVhruh1xHUYSfbue
 dtibh8b3yvu4ZneIl3xKblnhsi8DyZEGnE79gSiPobQTzJobvf+e3QPeyBOKj23fMGMq
 w58nKo2+VsoT5z3ARVJnNbDFewaF3D+YXSLtPCGEAlSrZtmGvHBDNBT7Avy7MVcb5S5E
 jWKPLpc1IG4/CtS9mrm8/aOGh1eRl3DjQz1pIBPocFQ5ROL3xHNXxvq9CkDFzm+A57g+
 HOoA==
X-Gm-Message-State: ACgBeo05NZ0N+G5wEHgFD9je/2u6hWv3DqbgiyWcv/fMtU067i5ANiJK
 5QQOpVl67BqRmevTvOyZ+ggrpQ==
X-Google-Smtp-Source: AA6agR4DnsY43bvjKQeTuEmCzbwS04r06XWMjNusiQH3OTZHOoDDvEls+8tqOGfusd7I3N4mwXsNKQ==
X-Received: by 2002:a1c:721a:0:b0:3b4:641c:5d99 with SMTP id
 n26-20020a1c721a000000b003b4641c5d99mr7157814wmc.71.1663252415188; 
 Thu, 15 Sep 2022 07:33:35 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.72])
 by smtp.gmail.com with ESMTPSA id
 m188-20020a1c26c5000000b003b33943ce5esm2991082wmm.32.2022.09.15.07.33.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Sep 2022 07:33:34 -0700 (PDT)
Message-ID: <0d2490ac-f5cc-c55a-030e-a49f021f81fa@linaro.org>
Date: Thu, 15 Sep 2022 15:33:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 <dafc0231-c578-07f1-1f4b-1cf819fa349a@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <dafc0231-c578-07f1-1f4b-1cf819fa349a@linaro.org>
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

On 15/09/2022 12:50, Dmitry Baryshkov wrote:
> On 11/09/2022 22:19, Krzysztof Kozlowski wrote:
>> On 11/09/2022 20:36, Krzysztof Kozlowski wrote:
>>
>>>> If your child schema fails, the referencing schema fails as well...
>>>
>>>
>>> Although now with DSI-PHY I cannot reproduce it and I am pretty sure I
>>> reproduced it with DPU controllers after modifying the DTS to lack a
>>> property... Hmmm
>>
>> https://github.com/devicetree-org/dt-schema/pull/82
> 
> Thanks for the quick fix!
> 
> However I think I'd still stick to the compatible binding for two reasons:
>   - It doesn't evaluate schema twice for these nodes
>   - It allows us to tightly link child nodes with the parent compatible, 
> which I think, was one of the points raised several revisions ago.

Yes, true. The referenced schema sometimes accepts few compatibles and
this gives strict matching without additional complexity.


Best regards,
Krzysztof
