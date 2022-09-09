Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF7D5B3502
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 12:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CCC10EC5C;
	Fri,  9 Sep 2022 10:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB8210EC5C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 10:18:25 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id f9so1156223lfr.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 03:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=/VudPBuUg8Yi2H0fyp4XXItQAWSGnhKI9+QIvSj4aPo=;
 b=SjK8642m+kC7L50jtrJprb6TubEpjuGV5QEEpGgw68uKQnlmEOHp0TpvHh5bZpVNEr
 rcO5WBcWwwONmzk1ETvAo+E7YImhsx7Kc3GR8qgDXM+MtXgUCFDVynI9eSqiNbAo5j5K
 iUE5CPFt5lMkjgbRv0Ryjp2qqWKSWHtOxTy4o62eplLuFo6GDYn74kkFZEwS4kR/Y6XS
 wH6la7j11eYaOK9DXmLzs0IVy5ooCLNv8uluaXu/Z74F3Fn4Ny2epqwSXSEOH42dtmT0
 +6SgKOkTAo8m3FiBSLCprgCQ2pSDKXey2HUG1wx+EiwaeSk0jZvdfDSmWdF0z3YtYn8I
 WLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=/VudPBuUg8Yi2H0fyp4XXItQAWSGnhKI9+QIvSj4aPo=;
 b=dUhHeAJ0BkQF/H0jVDm9vqwE6FtkeOm1x8aweLI4EtQlMid0XRm9hn0GChn+/B7nPJ
 SL3qrRmrQPNRu5848LYTMaB81jyqwBCxJneO6tC0o+4efQGc1YE8CRC1KwIxeq4pUIlG
 a9ZbKI3wUTmc/EHKrOrl+2S2NytZk6C6EPU2TkNiPLAa36wZ4fUDLvvavxBoyeAncELk
 n6xXcQemcakEGdLko66zibFEMOcmvrAekJ5mNV3L6Jg+irM1BePrBjCUsZXdByaYINsS
 JFFopDY5/VqAvtBPvn4kYp4GP7xUBgT4DsFy4+A5/rsMfS0yk2sYyDZW+RtvJzSiOH22
 /0tQ==
X-Gm-Message-State: ACgBeo0IYSGDWpknPAGw9Afx/UAekrcswDcJkizl0F3PNooPSyBVXx+X
 zOTXe98iSAqKfBc9ybRfl0Om9Q==
X-Google-Smtp-Source: AA6agR7TrZ2dYc7MCPiwqkYmLv9B4ObWokWYVKngs6cXjyE23B6nKRTFuKspSwXlWLoWmEatMQ/LOg==
X-Received: by 2002:a05:6512:159a:b0:492:d0c8:aec1 with SMTP id
 bp26-20020a056512159a00b00492d0c8aec1mr4455606lfb.275.1662718703748; 
 Fri, 09 Sep 2022 03:18:23 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 h27-20020a2eb0fb000000b00261b9ccb18esm27383ljl.10.2022.09.09.03.18.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 03:18:23 -0700 (PDT)
Message-ID: <7f002ba4-1e1e-300d-062e-db93390b0461@linaro.org>
Date: Fri, 9 Sep 2022 13:18:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8996: add #clock-cells and XO
 clock to the HDMI PHY node
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
 <20220704161148.814510-4-dmitry.baryshkov@linaro.org>
 <6474b61e-69d8-dbcb-f638-7729ec3dee31@linaro.org>
In-Reply-To: <6474b61e-69d8-dbcb-f638-7729ec3dee31@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/08/2022 17:25, Dmitry Baryshkov wrote:
> On 04/07/2022 19:11, Dmitry Baryshkov wrote:
>> Add #clock-cells property to the HDMI PHY device node to let other nodes
>> resolve the hdmipll clock. While we are at it, also add the XO clock to
>> the device node.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Bjorn, I'm picking the patches 1,2 into msm-next. Could you please pick 
> this patch into your dts-for-6.1?

Again, gracious ping.

> 
>> ---
>>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi 
>> b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index 25d6b26fab60..b72385ffecc6 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> @@ -1049,9 +1049,13 @@ hdmi_phy: hdmi-phy@9a0600 {
>>                           "hdmi_phy";
>>                   clocks = <&mmcc MDSS_AHB_CLK>,
>> -                     <&gcc GCC_HDMI_CLKREF_CLK>;
>> +                     <&gcc GCC_HDMI_CLKREF_CLK>,
>> +                     <&xo_board>;
>>                   clock-names = "iface",
>> -                          "ref";
>> +                          "ref",
>> +                          "xo";
>> +
>> +                #clock-cells = <0>;
>>                   status = "disabled";
>>               };
> 

-- 
With best wishes
Dmitry

