Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 960E06BA8DB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 08:16:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009BB10E938;
	Wed, 15 Mar 2023 07:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF37610E938
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 07:16:27 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id cy23so71534632edb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 00:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678864586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=15UYhlhz1IXSQqcZGCs4zzHqQAACKYlRVryD8U2iAvc=;
 b=iJGj0anLJQkuJMX4vMtkDO26mqykPTiqpS9NWhtdw2gyZxN5hMBZJiWyeJoM0tTSrC
 zlK2ApSWx8RpxH+0C+1moEh7djeyr+ie0jm+zay4Oujr/P8EDRl/guD/K0e+qbZY47Kt
 s4viZh8F8vShYfQDEx5IXsu9EfdExiWDh1xscFGQx5uv7MgtZIvXM8bGspf6CWOLRCyn
 ZeBs3MLk39+m19oqBfMQNv4/IS3w8siPnKHoBMTCxKSKLt4q2cyAYPoJVcwExH9XoIKJ
 AKKQEMSBRSYmncs5DmEpzH3Z2ENBnmamY+JtbBKZfEckwsOhm/EHNXDca8LScpNuGD9y
 2Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678864586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=15UYhlhz1IXSQqcZGCs4zzHqQAACKYlRVryD8U2iAvc=;
 b=LnxIv1K6ZJFwAMJrQvFAooHsz6j5NoNuS/eUIwJO0UAmgcBbmbZSZkZlsdJA1dvyKx
 Pca8fjqztRI9UcLv+yV2Tupa0aLBwUiKTGepl4suoZUPXuWoVfe9Srt+Rud38H2umUMf
 2bY79yRsonFXqgFFA78o8+uEiFoW2L5ZAxJSy4PcEM4ohSaAAqT+ieSywg8r18AdIUqu
 1T9zAs0D7u8G6+rp7DdhpDJGfbwstnz40trq7vnqLPwKwX+dzLMhHG9aOWbf5Xuduy++
 lVtRxluv/FKLo0Sv3Q1lDVb/aVlhBeZqVv/KeNP8PhOtR91D7/2ocVTOfSMfTrXoDpEj
 kjxw==
X-Gm-Message-State: AO0yUKUhBRYPuqxjyp8pqTWQ3wLd4htlXYWLK8GfmWci7lmhsvWv5y1j
 yuerUIre2clM1RT8I7vwq9PaVQ==
X-Google-Smtp-Source: AK7set/MhHrEStcc+CxV1ZdoTopYFKMl0VHdR7lOekmtggRtHS1J1cAYKNfERbssDeuOYmFJnClbOQ==
X-Received: by 2002:a17:906:b7d8:b0:927:d9ad:804d with SMTP id
 fy24-20020a170906b7d800b00927d9ad804dmr5539572ejb.7.1678864586285; 
 Wed, 15 Mar 2023 00:16:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd?
 ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a50c401000000b004acbda55f6bsm1929246edf.27.2023.03.15.00.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 00:16:25 -0700 (PDT)
Message-ID: <2700bd6c-f00d-fa99-b730-2fcdf89089fa@linaro.org>
Date: Wed, 15 Mar 2023 08:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v29 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
References: <20221227081011.6426-1-nancy.lin@mediatek.com>
 <20221227081011.6426-2-nancy.lin@mediatek.com>
 <4aff6a7a3b606f26ec793192d9c75774276935e0.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4aff6a7a3b606f26ec793192d9c75774276935e0.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/03/2023 04:45, Nancy Lin (林欣螢) wrote:

Trim the replies and remove unneeded context. You want to get the
attention of other people, not force them to read entire email.

>> +  mediatek,gce-client-reg:>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: The register of display function block to be set by
>> gce.
>> +      There are 4 arguments in this property, gce node, subsys id,
>> offset and
>> +      register size. The subsys id is defined in the gce header of
>> each chips
>> +      include/dt-bindings/gce/<chip>-gce.h, mapping to the register
>> of display
>> +      function block.
>> +    items:
>> +      items:
>> +        - description: phandle of GCE
>> +        - description: GCE subsys id
>> +        - description: register offset
>> +        - description: register size
>> +    minItems: 7
>> +    maxItems: 7
>> +
> 
> Hi Rob and krzysztof,
> 
> I got the two messages when running dt_binding_check [1]. This binding
> patch was sent previously in [2]. 
> 
> If I remove the following items/minItems/maxItems in the mediatek,gce-
> client property, the two message disappear. I don't know what's wrong
> with the original syntax. Do you have any suggestions for this?
> 
> -    items:
> -      items:
> -        - description: phandle of GCE
> -        - description: GCE subsys id
> -        - description: register offset
> -        - description: register size
> -    minItems: 7
> -    maxItems: 7
> 
> 
> [1].
> Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.examp
> le.dtb
> /proj/mtk19347/cros/src/third_party/kernel/v5.10/Documentation/devicetr
> ee/bindings/display/mediatek/mediatek,ethdr.example.dtb: 
> hdr-engine@1c114000: mediatek,gce-client-reg:0: [4294967295, 7, 16384,
> 4096, 4294967295, 7, 20480, 4096, 4294967295, 7, 28672, 4096,
> 4294967295, 7, 36864, 4096, 4294967295, 7, 40960, 4096, 4294967295, 7,
> 45056, 4096, 4294967295, 7, 49152, 4096] is too long
>         From schema:

This looks like known issue with phandles with variable number of
arguments. Either we add it to the exceptions or just define it in
reduced way like in other cases - only maxItems: 1 without describing items.


Best regards,
Krzysztof

