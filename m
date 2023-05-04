Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 419A46F719A
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 19:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2FA10E133;
	Thu,  4 May 2023 17:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3223C10E0D7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 17:53:29 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4ec8eca56cfso930513e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 May 2023 10:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683222807; x=1685814807;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bGWBY1EvDvANzNRRgwGxSmKWI6IUXnWqKsKUclR7gkQ=;
 b=O7tJapyRA5EEcqABi7Nh/CClOsJA/wnxeZdzgLxx9xd3J7V0pUtimZUq1IDgyoieoe
 nDRBJaUwlDmSdXpZ89/eAWAV6O72vWgi9CKcIzyyBm+EIrbDLhav1JVOCyIB3qOQbabI
 +xT96KqZlLgEri0fessiDW9CQx+/xw1sXsb8hIuyjrIcU4pNXX9tDuPVpypnOVdEqqXP
 d5BmNdUvgUFUVC6CCbijPiMsCyR1cP9/ZW9tbdSW+e9OSvpPE3R48hzV8NK+NhxKs6bt
 7jQ6r5zJ4pOzpkaFaV76Lw+7CxHTKNvShqnIN2Y3TDGoE1DqROw8GAd/ojuo+b7N5IHK
 wkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683222807; x=1685814807;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bGWBY1EvDvANzNRRgwGxSmKWI6IUXnWqKsKUclR7gkQ=;
 b=XTYMKwx+GzowhzFUO0+R2mt8IMrZFlfYS6rzQGV0u+3DFvaY8qCWPfGS6y6BEYSKqH
 QWFDiGFToJA0KfpHWKgf2GG6AGSIB+D6399AOPRTVwbEhuH8ier+IncX8vqmRZu1L1Ir
 kVsOYFJcdB7M2fvU5NGniqpgs21CgVaxA7tT8jnHbADZmC1PtNojAP7FqSBFIXbicTfH
 XxXviMiHPX3yxFCQ6+dWt1dvpZbpVpGg80Q0hg1g3FXdly3LtcduVZ0z9xj+DEZVRH7L
 GjJKSzJ+08A57cZ7lLZnJV657HPr6YHblahpgkIKCNVqx/HIyfMtkDTVkHq9cHIPeoJy
 SdGA==
X-Gm-Message-State: AC+VfDxbGWwQnCK8rUA/47VA1T35fP+yw2a6+AlHsAwesH3j3qJC6NUq
 Q+qXSqOF4B5YBi/iWwyuPYd8OA==
X-Google-Smtp-Source: ACHHUZ4ApDCXmWIWNwbgdjtaqu0LEdo9Ew0BnReh4X/HY9fc/UeOVfK44tMXnjaOD46dvFSSIjcxzA==
X-Received: by 2002:ac2:5fc3:0:b0:4ed:c757:bc3e with SMTP id
 q3-20020ac25fc3000000b004edc757bc3emr1672464lfg.38.1683222807328; 
 Thu, 04 May 2023 10:53:27 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 v6-20020ac25586000000b004eff1163c37sm5347448lfg.308.2023.05.04.10.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 10:53:26 -0700 (PDT)
Message-ID: <fc4caddf-b393-8f27-2217-82bbe300c0f9@linaro.org>
Date: Thu, 4 May 2023 19:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] arm64: dts: qcom: enable dual ("bonded") DSI mode for
 DB845c
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230504160430.4014206-1-dmitry.baryshkov@linaro.org>
 <723f23b2-c4d8-d688-b261-4198537eefe4@linaro.org>
 <CAA8EJpoHBtxMg559WdG+G=+BEJPiVo4agGEfxCORjWDwMTC5Ow@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpoHBtxMg559WdG+G=+BEJPiVo4agGEfxCORjWDwMTC5Ow@mail.gmail.com>
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4.05.2023 19:47, Dmitry Baryshkov wrote:
> On Thu, 4 May 2023 at 20:11, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 4.05.2023 18:04, Dmitry Baryshkov wrote:
>>> Now as both lt9611 and drm/msm drivers were updated to handle the 4k
>>> modes over DSI, enable "bonded" DSI mode on DB845c. This way the board
>>> utilizes both DSI links and thus can support 4k on the HDMI output.
>>>
>>> Cc: Amit Pundir <amit.pundir@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Konrad
>>>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 36 ++++++++++++++++++++++
>>>  1 file changed, 36 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>>> index e14fe9bbb386..4dea2c04b22f 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>>> @@ -419,6 +419,9 @@ &dsi0 {
>>>       status = "okay";
>> P.S. wanna move status last by chance?
> 
> Not within this patch, it is not relevant to bonded DSI mode.
Of course.

Konrad
> 
>>
>> Konrad
>>>       vdda-supply = <&vreg_l26a_1p2>;
>>>
>>> +     qcom,dual-dsi-mode;
>>> +     qcom,master-dsi;
>>> +
>>>       ports {
>>>               port@1 {
>>>                       endpoint {
>>> @@ -434,6 +437,31 @@ &dsi0_phy {
>>>       vdds-supply = <&vreg_l1a_0p875>;
>>>  };
>>>
>>> +&dsi1 {
>>> +     vdda-supply = <&vreg_l26a_1p2>;
>>> +
>>> +     qcom,dual-dsi-mode;
>>> +
>>> +     /* DSI1 is slave, so use DSI0 clocks */
>>> +     assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
>>> +
>>> +     status = "okay";
>>> +
>>> +     ports {
>>> +             port@1 {
>>> +                     endpoint {
>>> +                             remote-endpoint = <&lt9611_b>;
>>> +                             data-lanes = <0 1 2 3>;
>>> +                     };
>>> +             };
>>> +     };
>>> +};
>>> +
>>> +&dsi1_phy {
>>> +     vdds-supply = <&vreg_l1a_0p875>;
>>> +     status = "okay";
>>> +};
>>> +
>>>  &gcc {
>>>       protected-clocks = <GCC_QSPI_CORE_CLK>,
>>>                          <GCC_QSPI_CORE_CLK_SRC>,
>>> @@ -493,6 +521,14 @@ lt9611_a: endpoint {
>>>                               };
>>>                       };
>>>
>>> +                     port@1 {
>>> +                             reg = <1>;
>>> +
>>> +                             lt9611_b: endpoint {
>>> +                                     remote-endpoint = <&dsi1_out>;
>>> +                             };
>>> +                     };
>>> +
>>>                       port@2 {
>>>                               reg = <2>;
>>>
> 
> 
> 
