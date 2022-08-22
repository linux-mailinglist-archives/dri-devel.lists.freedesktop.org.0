Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B53359C6E7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 20:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F191A10E6DF;
	Mon, 22 Aug 2022 18:46:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA81497E4F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 18:46:42 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id bn9so3916155ljb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 11:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=rvqBR+MqWw6osirnvKxuZH0TWTk+3bKndNATN0ZQht0=;
 b=VaFBcoYnBgImf8ma6nDsr2IR4PMJFbP6tYtbYCZuEdxP4cGUCFrY/1dVGfMkBve951
 n4P1mfweqp/mn9HAxjpru9xJNguC7QaNmMjn2GTPKasPSqwVnZJEJ54upg/vBglOShiC
 vCIwGfm0kD63TMLOligYX93P/3+bSHajqR9pq/Nz+wtwhBFnP8foGcGSRoWHxMgZOiq9
 fzUVqc0Erq4uK5vuItooiY8X0sax32csi7zdnBJdVUW6lfjHiPa+fwnlg149ZFjjqU9o
 ck/yWJAp+VG15Ktxr0xHj7BVxRdIsN8korYm/rO+cRGnZZF0FTBqa+prEZpHsF3Rx3hQ
 +41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=rvqBR+MqWw6osirnvKxuZH0TWTk+3bKndNATN0ZQht0=;
 b=HJXt1YWFgiJtg8aFf+3HU9jdZ/IMHOCbDci7t8ZDYGu7YWJFB/Bc9wEGGAkwfF4WPP
 Dv/R9VEmE8vvUf+vAKy+sS2mXKSA5RupK2weQrmBhAPnHHPSISRrDKZfX+kkuwyU/l8x
 YtSGTXqfWXUhsnepNXTwwnb2AuacDChm9sS2JmMqXK3k45PxALBUS4dE12BvL6HHcCUs
 CF2e12CHZa3XLvvd1Y0aLIwtlz9zzBrv8YoOjtjPRINl3aWl9TrRPjkpJcw9jIRHTDBO
 xlO4CXYiNw+xbIDRIVMIADmmRtFgfKO2rLmqAIq7D7hLsvfq0r0MndLurLlCzGVhkCCr
 msVA==
X-Gm-Message-State: ACgBeo0dDzXCj+0onCvWcIqBHIUsvQ3zvKEF9c01Et0IzwbSUcfyTxbo
 48i8emNsAq5t7wnJUG75qUnL/Q==
X-Google-Smtp-Source: AA6agR4ZNMRCEOaFZ/wplgkfOzH12OuW0OGUwpNx1C8V+ySdF9HCd/NkFeqZesY0VjTgGBO8Jv08Ew==
X-Received: by 2002:a2e:bf0c:0:b0:260:3df:1bce with SMTP id
 c12-20020a2ebf0c000000b0026003df1bcemr6648253ljr.117.1661194001003; 
 Mon, 22 Aug 2022 11:46:41 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 x43-20020a2ea9ab000000b0025d5eb5dde7sm1863077ljq.104.2022.08.22.11.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 11:46:40 -0700 (PDT)
Message-ID: <e9760ee4-421a-5c87-4370-50262930aea1@linaro.org>
Date: Mon, 22 Aug 2022 21:46:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 8/9] dt-bindings: msm/dp: add missing properties
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
 <20220711231638.GA449827-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220711231638.GA449827-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/07/2022 02:16, Rob Herring wrote:
> On Sun, Jul 10, 2022 at 11:41:32AM +0300, Dmitry Baryshkov wrote:
>> Document missing definitions for opp-table (DP controller OPPs), aux-bus
>> (DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.
>>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index 391910d91e43..52cbf00df0ba 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -70,9 +70,21 @@ properties:
>>     operating-points-v2:
>>       maxItems: 1
>>   
>> +  opp-table: true
>> +
>>     power-domains:
>>       maxItems: 1
>>   
>> +  aux-bus:
>> +    $ref: /schemas/display/dp-aux-bus.yaml#
>> +
>> +  data-lanes:
> 
> But this is the wrong location for 'data-lanes'. It belongs in an
> endpoint node.

I rechecked the existing device trees (sc7280-herobrine.dtsi). The 
data-lanes are already inside the main dp controller node. I'll take a 
glance on fixing the driver to check the dp_out endpoint (and update 
existing DT to move the property to the endpoint node), but to make 
schema compatible with the existing device trees we'd probably still 
need this property (which can be marked as deprecated once the proper 
endpoint property is supported). Does that sound plausible?

> 
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 4
>> +    items:
>> +      maximum: 3
>> +
>>     "#sound-dai-cells":
>>       const: 0
>>   
>> -- 
>> 2.35.1
>>
>>

-- 
With best wishes
Dmitry

