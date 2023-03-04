Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397FF6AABB5
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 18:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D93510E0D5;
	Sat,  4 Mar 2023 17:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473E410E1A5
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Mar 2023 17:53:54 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id g3so5095650wri.6
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Mar 2023 09:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677952432;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rHEvIkFqTLgxaMd8/19YTSXz3cbo7lRJ8eKob5TrLqk=;
 b=lyOp+rYsZdKh1H2omPmNEuYyRcT9UccB7oYjQi5yr/+DkVHHK4/PcZjLk3Yq2p1nfr
 EQn7n0MeMl2KLi9W+w9xLglC+zzNEa4S8t9LOPQT8WY6VeTC8L6QW7aETVqHHTA65RXT
 c6CtWQPt+/MYzqVVbKDyop8+Nz0+xp/MAlrJ9N1dxecj+FOLCq2RjrhdXMXpMp6HshLx
 rt0EgNf4/md0neyef/NbueHsiYJGpSWrhp/kam2Qruea+V+FW7tSbTzTAaHj/aCPQuEL
 IXfJ+SxfChdhoy/Of0erRRYu5f3OcZgnXTFBf7sftSmHo8nKg6L6Ydziv4HKtEkSOUCJ
 xzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677952432;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rHEvIkFqTLgxaMd8/19YTSXz3cbo7lRJ8eKob5TrLqk=;
 b=D1P5Gmmv2bLUX1BwdIfhkq/jyiZiI8/vM5fE2hjS7CbcsKOu2Z3kA7dZ2+XDP/Hwem
 bksMQofut1VNeZOzsWKVcC440A2eBZtDaDa6RYnVgD4W9BR2vuvExFUJUKD5k0B07tak
 2gPaSoD25CTYmQpvemgrMLtPK/7RzdsIOTN4nKdtr0uStYob+xddevvxJu+kS7IdJPjY
 DJJcKEU1l9yFmh/csZ2aKiB2xceAjKVsZPG7q8/3SmTkO+KAzG3ujxE5avVqIz59mVHr
 +fTDB+ukJsCufYRSm4jf/BwoBBy/yBtITGhy7zO2FMNQELFiY1utkIRJ2P3gBEZYh/im
 5PGQ==
X-Gm-Message-State: AO0yUKX6VVHGhXXjsMpXPuab++9lmcoAKzFm7PsV2YKseHvp/rFKFllf
 cuGi3SBGYXUTeiPO/Jn5Z+AMUA==
X-Google-Smtp-Source: AK7set9WFBR5j0nxd+qqovwsRvSizgDMYkC09Qx1BKZCVE+JNDwpUEQbtysHHXgJ/uZDZfaUBrd9zw==
X-Received: by 2002:adf:e9c2:0:b0:2c7:1d75:b0cc with SMTP id
 l2-20020adfe9c2000000b002c71d75b0ccmr3766253wrn.43.1677952432543; 
 Sat, 04 Mar 2023 09:53:52 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a5d66c8000000b002c573a6216fsm5531688wrw.37.2023.03.04.09.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Mar 2023 09:53:52 -0800 (PST)
Message-ID: <35e19031-877c-329f-3bdd-4f04bc8ccc6f@linaro.org>
Date: Sat, 4 Mar 2023 17:53:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] dt-bindings: display/msm: dsi-controller-main: Fix
 deprecated compatible
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230304-topic-dsi_fixup-v3-0-b8565944d0e6@linaro.org>
 <20230304-topic-dsi_fixup-v3-1-b8565944d0e6@linaro.org>
 <c1a2ba5b-4cd9-362b-5a4e-e95a6bf27b3e@linaro.org>
 <30798bd2-5805-45e6-92d2-a9df6fb52600@linaro.org>
 <28561c8b-e9a3-b58e-429a-6dc331ad94e4@linaro.org>
In-Reply-To: <28561c8b-e9a3-b58e-429a-6dc331ad94e4@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/03/2023 17:45, Bryan O'Donoghue wrote:
> On 04/03/2023 17:35, Konrad Dybcio wrote:
>>> you'll see no error. However if you just do this
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi 
>>> b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>>> index 0733c2f4f3798..829fbe05b5713 100644
>>> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
>>> @@ -1094,8 +1094,7 @@ mdp5_intf1_out: endpoint {
>>>                          };
>>>
>>>                          dsi0: dsi@1a98000 {
>>> -                               compatible = "qcom,msm8916-dsi-ctrl",
>>> -                                            "qcom,mdss-dsi-ctrl";
>>> +                               compatible = "qcom,mdss-dsi-ctrl";
>>>                                  reg = <0x01a98000 0x25c>;
>>>                                  reg-names = "dsi_ctrl";
>>>
>>>
>>> and run the same test you get
>> Yes, correct. It's valid but it's deprecated, so the bindings are
>> sane. Keep in mind there's an ABI-like aspect to this.
>>
>> Konrad
> 
> The _driver_ will still accept "qcom,mdss-dsi-ctrl" which is ABI 
> compliant but, I don't see why the yaml should.
> 
> If you declare a new .dts with only "qcom,mdss-dsi-ctrl", that should 
> throw a yaml check error.
> 
> ---
> bod

Actually. I agree with you, I just dislike it.

- "qcom,mdss-dsi-ctrl" <- the driver will accept this
- "qcom,dsi-ctrl-6g-qcm2290" <- the driver will not accept this

bah

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
