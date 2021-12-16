Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA668477980
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 17:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10F810E26C;
	Thu, 16 Dec 2021 16:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7CE10E26C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:42:42 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bt1so8157855lfb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 08:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Px7PCFothAOblRFvnJfWYF7NmmmFM8S9W6bLvLigRYg=;
 b=TcVdm0T0058utnCm51/eiho4YTY2aa9FxA366Ntu+1FAFOcOrdyspRiNDM7PccwN2n
 ZgeuYHgW/F1Nkmch1/aEDV6MhlXXt6CRzSTXO55EkmwbPWe+1EdcVorHhmikqDrEzRaX
 BZ7ruscwf/ZsDxXXa0DK56Henrx0aep8LA9BsYj0Uflsvxt0jGVqA/2DmxjTNC9qL/oK
 PR+PPwMbae0B/R/y31X6jGJIna0ReFiGRjpXiDDju3MQtvPatO1FaE5m2v2WH61auS7T
 zr+jSXYFozziKBHkETlVzO1gqgDOuvj6a+mKu4shusgn6m+jntc+WiP0Q9k9nW121Q1T
 QcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Px7PCFothAOblRFvnJfWYF7NmmmFM8S9W6bLvLigRYg=;
 b=ZpDtfzxvw3QVIhGXFBIOfQwb/4A+QY1008k2h8Gq7MIBfJS37gC19SlfFCEYyWvnGv
 hAfsSumS/Us8+x6xHeI5MvNvtjT04mgAgua95z69puiWNvNx599Ril3u7QpdxJw54con
 KBdIGkwxWR8aELuqXdJSFeI0wSOU4uxeRLysxUFUxuvxBAhFAKudRT+R0QYxO86dmbLu
 gQCT+188Hi/AlC2e826PY1vu1SSkMBP2U5IXUeche0/1Gfg9C/2f111PCFot4Z2asZel
 5KsHnSQEfyfhWdPqHemSsvcZVbUwklZFxlAECMNqWswvJt5WkXN2eqsBUU+N889wyEyz
 TkJg==
X-Gm-Message-State: AOAM532/5eErK1T1F2ey5KcU67S5ks/TT0EKJZE8aSO88bRu11jzTA4c
 UhkJ8kf3SZ6RVMUbbzHmBlM=
X-Google-Smtp-Source: ABdhPJwQaYM3Od+uryTCmBX8+jPef7Rjl5kmnAIJ4aErjak2Z24Ruvt8b+xgWo0i7x4H1QyykexiuA==
X-Received: by 2002:a19:f10a:: with SMTP id p10mr15240358lfh.487.1639672960919; 
 Thu, 16 Dec 2021 08:42:40 -0800 (PST)
Received: from [192.168.2.145] (94-29-63-156.dynamic.spd-mgts.ru.
 [94.29.63.156])
 by smtp.googlemail.com with ESMTPSA id u21sm1223943ljl.76.2021.12.16.08.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 08:42:40 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: display: bridge: document Toshiba TC358768
 cells and panel node
To: Rob Herring <robh+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20211215152712.72502-1-david@ixit.cz>
 <CAL_JsqLyMr+apgqn31V7QPfqqxhJ1ro258WsDP=CO37zfyxVNw@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <63184edb-b758-6a3a-2eb8-9106b0ee0002@gmail.com>
Date: Thu, 16 Dec 2021 19:42:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLyMr+apgqn31V7QPfqqxhJ1ro258WsDP=CO37zfyxVNw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

16.12.2021 18:13, Rob Herring пишет:
> On Wed, Dec 15, 2021 at 9:38 AM David Heidelberg <david@ixit.cz> wrote:
>>
>> Properties #address-cells and #size-cells are valid.
>> The bridge node can also contains panel node.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>  .../bindings/display/bridge/toshiba,tc358768.yaml      | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
>> index eacfe7165083..3186d9dffd98 100644
>> --- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
>> +++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358768.yaml
>> @@ -69,6 +69,16 @@ properties:
>>        - port@0
>>        - port@1
>>
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^panel@[0-3]$":
>> +    $ref: ../panel/panel-common.yaml
> 
> It's possible to attach something that doesn't use panel-common.yaml
> and if it did, it would be applied by that schema.
> 
> What you need is to just reference dsi-controller.yaml at the top level.

It works, thank you.

Then we will also need to rename the "dsi-bridge" node to just "dsi" in
the new ASUS TF700T device-tree since dsi-controller.yaml wants that name.
