Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2178451FA28
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 12:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F3B10EA2F;
	Mon,  9 May 2022 10:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABAA10EA2F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 10:44:47 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id p4so15801782edx.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 03:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=M2N9dAOBTm5M6ZFIRAQY9u+xLQ0LwoCVpAUO7hGxwek=;
 b=Pk61C9v83GjAFziN/8+zsxk25G08lVx7cudhCioDNnXyrKIV1KL4djTZVp1DChfx5p
 FcWhQhBnsOAoooH2GOHBO8y+b5gmnYM8odQNXrQhYNxHTYOQi+WHI88u0Du0Fs77HD5A
 HbqcS7wB3CVVilddsZh45uc1iu1GSP6fDMRjYfoK0Mp9G6/Cw1qpGJP23+cUTOUBSMuN
 EVU+x8T8/cT/LL02P0M9oWcT8go75notJSjcBirQkdAt8Jegk1EbMEzBnBdiExmn+RuY
 WwEBLj5ehki+d0K/MTG8ep6LT9iuLqfT8LcjJGXlEaWzS5zi3GnytzfmpMn5jup/xEcI
 Xp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M2N9dAOBTm5M6ZFIRAQY9u+xLQ0LwoCVpAUO7hGxwek=;
 b=qPcxZ373noVpkcpNNpJdnyudyM6Ofo8hLLXrVr0RTVwtEw9HP2eW2GOOj+mNVDk6aA
 9c4zX0zvxkjefwSSZfDpwwsHG4RJYYhREu883Ocgv5a+RFp3xOKuGHiHNXml9LPp0l6P
 0ay7WPdCpQqbrfqJvHlh5TI/qaflhBgmJhDhRKB3GA7Bu46ztP7zLGQ6Gzwu/HEuyzhE
 a2HVywYK61PCQS0jVqIwsNaC6wNWJ19u9pud+OITlRJC5kzNItfKbEYNWxCFCLpirPzr
 QbzQw+wi0tqauf+ivTIRZTkC6RT7KNFiF8wKy7K94OFlmSzt0HlWdrkcmS0mWSDLtGpn
 vvDA==
X-Gm-Message-State: AOAM532F3BnPpZdRhMGGEe30kCJdXZvqnlR7a1Gv0hnwZjKUVdR5xuiK
 N9imEAk9u+vtObgbo/JonFd0zg==
X-Google-Smtp-Source: ABdhPJzzU6EC/aUpRD8D0fRRVVTzWv0vos1RTFGbs9TdRMKFyYlif1jkB+mJxvflJy3XSnfkDqFDeA==
X-Received: by 2002:a05:6402:2397:b0:426:4967:8574 with SMTP id
 j23-20020a056402239700b0042649678574mr15621823eda.197.1652093085832; 
 Mon, 09 May 2022 03:44:45 -0700 (PDT)
Received: from [192.168.0.243] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 e15-20020a50e44f000000b0042617ba63c7sm6152351edm.81.2022.05.09.03.44.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 03:44:45 -0700 (PDT)
Message-ID: <98505974-afad-9639-d4f2-814097b0523b@linaro.org>
Date: Mon, 9 May 2022 12:44:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 3/3] dt-bindings: mediatek: add ethdr definition for
 mt8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-4-rex-bc.chen@mediatek.com>
 <46bc32df-e4e8-ac47-426d-8056714f0d5c@linaro.org>
 <5462209c5afb0a638ed777ec1829bb2717c8d76e.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5462209c5afb0a638ed777ec1829bb2717c8d76e.camel@mediatek.com>
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
 "airlied@linux.ie" <airlied@linux.ie>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/05/2022 10:54, Rex-BC Chen wrote:
>>> +    soc {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        disp_ethdr@1c114000 {
>>
>> No underscores in node name. Generic node names, so display-
>> controller?
>>
> 
> OK, we will change the node name to ethdr like in dts
> like this:
> ethdr0: ethdr@1c114000 {
> ...
> }

Is "ethdr" a generic name? Is it an abbreviation of "EnergyTrace™ High
Dynamic Range"? If yes, it also looks specific to Texas Instruments...

Best regards,
Krzysztof
