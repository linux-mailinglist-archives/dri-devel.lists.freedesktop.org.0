Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA72771578E
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 09:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534D510E36F;
	Tue, 30 May 2023 07:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69C510E36D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 07:48:53 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5149aafef44so3232527a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 00:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685432932; x=1688024932;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hD/u8KvctJNZ9Q6wgoPTwjsd10fbyNIfr6gIoMYFm8k=;
 b=KhbpEb5ujpWhqfksp2CBPV4rcQPsr903YtN0YRWnnc84rzCpIYhZ6kiUX9Z/TLGX9T
 n9a2MekI+c3SzHD+uecC6SayG9whs9240GFuBGLJoiHeFbWv9bFiEFpHH1qLDAWUh+yb
 d2hhA2jMCCtaniqG0l3hPWT7BkBe5k/uMpjeW+TxqkVG2VEW82C+8EGi3aBxtiG78LeR
 58oZ9P1Zl9MJuBTeiy9c4Cijnx1NZSlNTcBksMtgcw9fbtdxfBSjuj2KfhjSvTGpDtls
 hKHAILnXNnl8V758NVRDNSTNWq4v/9GgJ0r6y8RErN8gcK+p1l38VffH2FT9m/NHp+Z9
 23gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685432932; x=1688024932;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hD/u8KvctJNZ9Q6wgoPTwjsd10fbyNIfr6gIoMYFm8k=;
 b=fh5HruXDabs4FFLRCg9MCAtNOQ7HdvtIJ6VCOnUnRcMm1Ivf64OyTwkIEcQvYQxg3R
 CljGZCzpf5cBE0JP4Iz6WMtT8TbA9dy0lwjEOFYI+tSw4NgBWWtyGXUEhkEPbY0QsKm+
 AGSR67UCxvveAqnh93QHI//ynyWg4z+VAlqCAwzhOMudekKUNC/ymcXLu22tOuQaDgdl
 zw9Y7PF1X6j3TZiYN/Xur+gZ/k8uB12MG8ADWJgKpe80TISZi472+c1xDHZOeDcCDdQk
 9iL7Oid1WVW/qZI9uRW5cMeTfEWHWUBEHOYG7b6tBWlKIrxPY4xIQczM6NNGQFGOZePV
 xwjw==
X-Gm-Message-State: AC+VfDyx/sl/gkXBvfDaVYqXpLH41Onj31JXSNc15Y4jd418ML/yZKnB
 PcBoS4bole3DopsfzmwAPPj1wQ==
X-Google-Smtp-Source: ACHHUZ7O8LfbLyaKQcZlRXwpwrnwZEfFVKCOKwVDTDCFB+1bWeIDzE8NQ0wsIzHShQIqw8DR35SAIQ==
X-Received: by 2002:aa7:ce04:0:b0:514:75ff:6a86 with SMTP id
 d4-20020aa7ce04000000b0051475ff6a86mr955152edv.29.1685432931881; 
 Tue, 30 May 2023 00:48:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 c5-20020aa7d605000000b005149cb5ee2dsm2373329edr.82.2023.05.30.00.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 00:48:51 -0700 (PDT)
Message-ID: <8c28ea3a-68f5-1233-9e79-bd9e09d4f485@linaro.org>
Date: Tue, 30 May 2023 09:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V8 7/7] dt-bindings: bridge: samsung-dsim: Make some flags
 optional
To: Conor Dooley <conor@kernel.org>, Adam Ford <aford173@gmail.com>
References: <20230526030559.326566-1-aford173@gmail.com>
 <20230526030559.326566-8-aford173@gmail.com>
 <20230526-cabana-humble-81e44944e378@spud>
 <CAHCN7xJdfO4+q071sur7wpVg+gU_Fzw9zfXvM9NDBFCN=Axiog@mail.gmail.com>
 <20230526-lily-underwent-1dc0be746be0@spud>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230526-lily-underwent-1dc0be746be0@spud>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/05/2023 21:30, Conor Dooley wrote:
> On Fri, May 26, 2023 at 02:24:21PM -0500, Adam Ford wrote:
>> On Fri, May 26, 2023 at 1:19 PM Conor Dooley <conor@kernel.org> wrote:
>>> On Thu, May 25, 2023 at 10:05:59PM -0500, Adam Ford wrote:
> 
>>>>      description:
>>>> -      DSIM high speed burst mode frequency.
>>>> +      DSIM high speed burst mode frequency when connected to devices
>>>> +      that support burst mode. If absent, the driver will use the pixel
>>>> +      clock from the attached device or bridge.
>>>
>>> I'd rather this description did not say anything about drivers.
>>> How about:
>>>         If absent, the pixel clock from the attached device or bridge
>>>         will be used instead.
>>
>> That makes sense.  I can do that.
>>
>> "DSIM high speed burst mode frequency (optional). If absent, the pixel
>> clock from the attached device or bridge will be used instead."
>>
>>> Or perhaps "must be used"? Ditto below.
>>
>> "Must be" implies to me that the user needs to set something.  Are you
>> ok with the proposed suggestion above?
>>>
>>> Description aside, the removal seems to be backwards compatible - but
>>> can every device that this binding supports work using an "attached
>>> device or bridge", or are these properties going to be required for
>>> certain compatibles?
>>
>> From what I can tell, the assumption is that the DSIM driver was
>> expecting it to attach to panels in the past.  With the additional
>> patch series, the DSIM can attach to bridge parts without a hard-coded
>> set of clocks.  I don't expect the existing Exynos devices to change,
>> but I also don't know what would preclude those SoC's from attaching
>> to a bridge should someone want to design a new product around them.
> 
> Okay, that seems fair. With your revised wording,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
>>
>> I'll wait a couple days for more feedback and send patch V2 with just
>> this patch since the rest of the series has been applied to the drm
>> branch.
> 
> Sounds good. Krzysztof will hopefully be able to take a look then too to
> make sure I am not making a hames of things.

We should avoid references to driver, because bindings are used also in
other projects where driver can behave differently. Also "driver" is
then ambiguous - which driver do you mean? Please re-phrase.

Best regards,
Krzysztof

