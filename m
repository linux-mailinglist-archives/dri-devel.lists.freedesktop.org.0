Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87575B50BD
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 20:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FAB10E11B;
	Sun, 11 Sep 2022 18:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2915410E0E8
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 18:56:01 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id y18so8169488ljh.12
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 11:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=RPQy1aNVD24fj2brehWpaN5iIeVrcdsDrdD2wAGWJbw=;
 b=c75Vojp6jAAIpodeHlqPi0GJc4HMYQ5s4cTSvzo5PjQO2eaDN+Y8J294PC1o/W1Mh1
 7rJkE/pTpxM+OVoq/75nokUTo+OB5oPdKt0pd+v6NKiNM+aiHrN+0QPW7Nocpvt7Ns+X
 dixVgW8RsCGSdey2Ot5IOqy1BVePjs0mufrNarMJch+192iMV44lLqUEvsCfnKr+P8O9
 YchsFXgqg9leGJO+/nfFqxOD01IZpocXxcRjBt+TrAJ4SC7ZnnimbF3kdLHtgqVXVRtM
 LkI4b+oWGMzBUaDArYKQud1rHpXu5yk80gIVS8LklPOaGdWE/0e0Et0uD4u8r0xrt2md
 Hz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=RPQy1aNVD24fj2brehWpaN5iIeVrcdsDrdD2wAGWJbw=;
 b=WkQ/7dYZir3CMcFjw+xHPG1kOlkej04unxdLOJPNzzepj08mKBEWNdzgPNSvVuBbvo
 EFcjVoUKQWBIEgHmq/SjJJqGvyCyO6P+Hln1hp6qVwq+uBOIXBQ1c3ICFhNgnWFpBU1m
 pVLCxkwG++Ti7l2CDs9bxhCwZeat7Sr0DQgU3jtrFnxJCztkFRrN/o2uv4KFbcPRZ9qj
 lrsIQKygTrYP3ol55dY3rKlteXuvn8nfi4ynn55XaN+uG7zCY0MGQG0rdCHOglFqI3HV
 OcFUINnjYdGTJrf46YsAXikkUz3SXbQnJwl0pvNBFoDUpjhEBsBuA3X3Q61zLs31mPrN
 D3IQ==
X-Gm-Message-State: ACgBeo0WILO1V8H9spEF71i/7rogO3QBaPA9RxF31BQvw205N1QlX3kh
 NT1q3sRs2o+7J0Jrw3b1LIC6Dg==
X-Google-Smtp-Source: AA6agR5kw9mbNFc8XSl/zb4xnABTaoglXNP4qJenxxMNT/Dy+78GH+uJdblCn8w8V3fRV1ow1HficA==
X-Received: by 2002:a2e:be28:0:b0:25f:d901:16ef with SMTP id
 z40-20020a2ebe28000000b0025fd90116efmr7159410ljq.126.1662922558995; 
 Sun, 11 Sep 2022 11:55:58 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 w1-20020ac25d41000000b004991437990esm704068lfd.11.2022.09.11.11.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Sep 2022 11:55:58 -0700 (PDT)
Message-ID: <7cf581a6-0602-7d6d-1518-7ae62a89031e@linaro.org>
Date: Sun, 11 Sep 2022 20:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <6e3bca5a-8b01-af12-ae69-b0044a8790f6@linaro.org>
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

On 11/09/2022 20:36, Krzysztof Kozlowski wrote:

>> /home/krzk/dev/linux/linux/out/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb:
>> dsi@c994000: 'vdda-supply' does not match any of the regexes:
>> 'pinctrl-[0-9]+'
>>
>>
>>
>> If your child schema fails, the referencing schema fails as well...
> 
> 
> Although now with DSI-PHY I cannot reproduce it and I am pretty sure I
> reproduced it with DPU controllers after modifying the DTS to lack a
> property... Hmmm
> 
I think I have a fix for this in DT schema.

Best regards,
Krzysztof
