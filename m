Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B733463E669
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 01:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2BD10E519;
	Thu,  1 Dec 2022 00:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D5010E515
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 00:22:01 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id c1so29952lfi.7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 16:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5N0Mkr5HCFYGmgX8q0UkQuN/NJxjaOMGBO0cCYdERo0=;
 b=H0c7A46V8YoCWyXqfkCVF/NSBak05twg10HPQ2y6jE4aBHM2dICZMSxZU5y7+hYYbM
 wfaYH2FiaW01rB48b5f1TiGWnRKzCt3s1mH8dZgBxL4YesmoxBUVhYhOvnlZpQ21pb6S
 IA8l9DaKPNgmnmhAaUGD5o3cQs9eZtMpjjlluudNjbYeItyYiVDOLwKu5/16LdtoYES2
 /XKfbsCQuQ6hsi5Vq6XpBAiBz0NSvEQXCbSuRAACU/Acyj0TlZBLPcbxcQ5gfXaooT8e
 fpP21vdRH4bYPUjf7EWsf2giaqALbG+uLjM6FXPhWfhfWkh4rd6i5iDzDWpYkq6Sk0nB
 xvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5N0Mkr5HCFYGmgX8q0UkQuN/NJxjaOMGBO0cCYdERo0=;
 b=qrWi4/NBavSITgGSCHZkIyWJv+nlQAWn28yRsqmiyU6PonPaNtuKe97Bt+V2994rog
 AUcKTe9Hv1hFB+m6NweYjVRul6savj1Z0B3PmNimQzuUnaMkbtfHsB2Z5W7BeghNTx+t
 23QeNz/Y0XjLyQhvNrMLJwNrQAsyNVuYCbWEgFzoFCXn0KIiLnUxUTJl7lJwrcRd5hME
 c+JdzAaQ9cxPzUqgEIIPJXEH8rKVsbkFK2q6BQe8wTMqNqPnoykgvxz2hUAYGzgWz94z
 Ey9WaE3b1lEYip7RIEI8dbYxVgeeUwrOK/l68tELsmshZxsLIM/Khh+vXoLlzjNPMuEt
 8/Lg==
X-Gm-Message-State: ANoB5pmqT3kp7zkhmiQFUxp+jQ9C0yBmo5l198AIwE8yKjoYRfg/d5ds
 CYALyxXdtlJWofi750UQPO7kbQ==
X-Google-Smtp-Source: AA0mqf70FBKNRSuoWqNgqghhPvrU14vVnZJLdlDmk7QjI8o4IKxBP5EBwoiB8UXAJNy/A2PaLwDT0A==
X-Received: by 2002:ac2:5202:0:b0:4b5:1ec2:d5fb with SMTP id
 a2-20020ac25202000000b004b51ec2d5fbmr3690695lfl.48.1669854119938; 
 Wed, 30 Nov 2022 16:21:59 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a05651231d600b00498fc3d4d15sm425908lfe.190.2022.11.30.16.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 16:21:59 -0800 (PST)
Message-ID: <29d12e26-b3c8-dbf6-de1f-5c6ae4a5a705@linaro.org>
Date: Thu, 1 Dec 2022 02:21:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v6 1/4] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, bjorn.andersson@linaro.org
References: <1669852310-22360-1-git-send-email-quic_khsieh@quicinc.com>
 <1669852310-22360-2-git-send-email-quic_khsieh@quicinc.com>
 <7bf73466-e476-4a1d-5dc0-1b63ea742226@linaro.org>
In-Reply-To: <7bf73466-e476-4a1d-5dc0-1b63ea742226@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/12/2022 02:07, Dmitry Baryshkov wrote:
> On 01/12/2022 01:51, Kuogee Hsieh wrote:
>> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
>> add link-frequencies property into dp_out endpoint as well. The last
>> frequency specified at link-frequencies will be the max link rate
>> supported by DP.
>>
>> Changes in v5:
>> -- revert changes at sc7180.dtsi and sc7280.dtsi
>> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi
>>
>> Changes in v6:
>> -- add data-lanes and link-frequencies to yaml
>>
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   .../devicetree/bindings/display/msm/dp-controller.yaml  | 17 
>> +++++++++++++++++
> 
> Separate patch. Also you didn't check the get_maintainers output, so 
> required parties were not included into the distribution.
> 
> Also as you'd check the get_maintainers output, please fix other email 
> addresses too.
> 
>>   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi            |  6 +++++-
>>   arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi          |  6 +++++-
>>   3 files changed, 27 insertions(+), 2 deletions(-)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 94bc6e1..af70343 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -90,6 +90,20 @@ properties:
>>           $ref: /schemas/graph.yaml#/properties/port
>>           description: Output endpoint of the controller
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +
>> +          properties:
>> +            link-frequencies: true
>> +            data-lanes: true
> 
> No. Use $ref for both of them.
> 
>> +
>> +          required:
>> +            - link-frequencies
>> +            - data-lanes
> 
> No, they are not required.
> 
>> +
>> +          additionalProperties: false
>> +
> 
> deprecation of old data-lanes property?
> 
>>   required:
>>     - compatible
>>     - reg
>> @@ -158,6 +172,9 @@ examples:
>>                   reg = <1>;
>>                   endpoint {
>>                       remote-endpoint = <&typec>;
>> +                    data-lanes = <1 2>;
>> +                    link-frequencies = /bits/ 64 <160000000 270000000

s/1600/1620

>> +                                                  540000000 810000000>;
> 
> I guess the number of zeroes is wrong here. This is 160 MHz ... 810 Mhz, 
> rather than 1.6 GHz ... 8.1 GHz

Ok, I was wrong here. The old code definitely defaults to 570 
mega-something. Now I'd really like to read your description for the 
link-frequencies property, because the phy_configure_opts_dp::link_rate 
is clearly specified in Mb/s and it takes a fixed set of values from 
1.62 Gb/s up to 8.1 Gb/s.

I think the drm_dp_bw_code_to_link_rate() function is incorrect by 
itself, as it multiplies with 27000 (27 Mbps) rather than 270000 (0.27 
Gbps) as required by the standard. So first, we should fix the function, 
then all the rates would become logical.


> 
>>                   };
>>               };
>>           };
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> index 754d2d6..39f0844 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
>> @@ -812,7 +812,11 @@ hp_i2c: &i2c9 {
>>       status = "okay";
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&dp_hot_plug_det>;
>> -    data-lanes = <0 1>;
>> +};
>> +
>> +&dp_out {
>> +    data-lanes = <0  1>;
>> +    link-frequencies = /bits/ 64 <160000000 270000000 540000000>;
> 
> Same comment here.
> 
>>   };
>>   &pm6150_adc {
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>> index 93e39fc..b7c343d 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
>> @@ -440,7 +440,11 @@ ap_i2c_tpm: &i2c14 {
>>       status = "okay";
>>       pinctrl-names = "default";
>>       pinctrl-0 = <&dp_hot_plug_det>;
>> -    data-lanes = <0 1>;
>> +};
>> +
>> +&dp_out {
>> +    data-lanes = <0  1>;
>> +    link-frequencies = /bits/ 64 <160000000 270000000 540000000 
>> 810000000>;
> 
> And here.
> 
>>   };
>>   &mdss_mdp {
> 

-- 
With best wishes
Dmitry

