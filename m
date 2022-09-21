Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 523D65C0302
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9008C10E2F2;
	Wed, 21 Sep 2022 15:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C1910E2F2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 15:58:03 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id s6so9969099lfo.7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 08:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=KUDU0doBWvkSMsSeaP+OU5Myg0FSSIaMLAg/J6BRRrQ=;
 b=slv4NKCqb/zqgJH7M3nKlgQg7LgbWHoZe5T/pPNeRXbgMm/Qwm1EpZb2Eg1Jj44imN
 aOa5Z2jYm2HUsJlTUGffkoZY2uH5iN46QV2M9/WHIspQnZkFSzrq/J/A95E0j5u69Un9
 WgekrImX8IUeP0badlm8CQdb6xr4nqTwSoFYDixJMtgXxxpiPsADqp2Zo87pO1ajmG7j
 mwYzk0CdwztEBK7XiP8IJ25ILOtCQvPtQ2OuMn/A6UJBfH10AebW3WfFwz6AM+PpVLOf
 EGug1gt+zgiIptzhs/ifeW479thnyoU/Ql+nl9lU5Jfs9jv0p/qf/UE8pmK1VP37MI7K
 uq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=KUDU0doBWvkSMsSeaP+OU5Myg0FSSIaMLAg/J6BRRrQ=;
 b=vXCwHJTfsYSMfy26/fEhZrZPOEZY74epqbVzqTYDeF2UFshbU4iAW3m8GSRoWTStj0
 NHnnciZJW9DkZPpB13Qh2ymRCg8fZ+4EEfH23+STZm9OWXqQgsc0sOh3ZBSWp0KQArh/
 EpCQSBz+HkJzMWiTSKup8KYo6xB5WrinEoXetZETaqDhGX+J3Qe0QBJUVz4JmVp0BxwN
 tBb92WOftACk0Lkr1oprmg15lPD/8CwIsK0sisQyR+h5D0hlNj6z+ObHcanm/xPFE+mv
 9cSnMMLuaT6hAaGpfGiJOCdnbkRu2hUpGwaJIc2IQ4UcZqYdH4PoTcjxPOJJTrLlQNLe
 BGGA==
X-Gm-Message-State: ACrzQf1CaM9f7vq2dilblJUcH+5jLb0E18zkzZC5IY63JUy9mJ1UiWoP
 ldY1XHrtdB2dJ/ue77iezIUbig==
X-Google-Smtp-Source: AMsMyM75m4N7MPBKvWthG+pu/YTa8pTbMdbwS4u/waTgyPE6eW8LRVa+KHqN6TUHDKl7neUPzVouXg==
X-Received: by 2002:a05:6512:1153:b0:49e:805:b473 with SMTP id
 m19-20020a056512115300b0049e0805b473mr10515858lfg.450.1663775881892; 
 Wed, 21 Sep 2022 08:58:01 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 h6-20020a19ca46000000b0048b26d4bb64sm494752lfj.40.2022.09.21.08.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 08:58:01 -0700 (PDT)
Message-ID: <24190160-53f2-810d-bd23-c02958517c80@linaro.org>
Date: Wed, 21 Sep 2022 17:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH V2 2/3] dt-bindings: display: panel: Add NewVision NV3051D
 bindings
Content-Language: en-US
To: Chris Morgan <macromorgan@hotmail.com>
References: <20220920145905.20595-1-macroalpha82@gmail.com>
 <20220920145905.20595-3-macroalpha82@gmail.com>
 <e5de0c74-3ece-56c6-6c31-042e1117c10a@linaro.org>
 <SN6PR06MB534220AB227AA3BC5DB58741A54F9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <ff2ee392-0f78-37d4-56b5-443e6e998443@linaro.org>
 <SN6PR06MB53420E8B1245EDFCB7547C69A54F9@SN6PR06MB5342.namprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SN6PR06MB53420E8B1245EDFCB7547C69A54F9@SN6PR06MB5342.namprd06.prod.outlook.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/09/2022 17:50, Chris Morgan wrote:
> On Wed, Sep 21, 2022 at 05:21:19PM +0200, Krzysztof Kozlowski wrote:
>> On 21/09/2022 16:38, Chris Morgan wrote:
>>>>> +  compatible:
>>>>> +    items:
>>>>> +      - enum:
>>>>> +          - anbernic,rg353p-panel
>>>>
>>>> Are these vendor prefixs documented?
>>>
>>> Yes, they are in another patch series referenced in the cover letter.
>>> They were added for the Anbernic devicetrees and should (I believe)
>>> land in 6.1.
>>
>> OK... you still need to test your bindings. Your patch was clearly not
>> tested before sending. :(
> 
> I did: yamllint, make dt_binding_check (with DT_SCHEMA_FILES specified), and
> make dtbs_check (with DT_SCHEMA_FILES specified again). 

I have doubts. So if you say you did it, then you probably did not look
at the results... or whatever other reason the test was not effective,
because your binding cannot pass the dt_binding_check.

> That's the proper
> testing flow correct? In this case it's the pre-requisite that's causing
> the issue as I see on a pristine master tree I'm warned about the missing
> vendor prefix for anbernic. Should I wait for that to go upstream before
> I submit this again?

Not really. The testing fails on wrong compatible in example.

Best regards,
Krzysztof

