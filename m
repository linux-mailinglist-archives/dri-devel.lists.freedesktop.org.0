Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A774775E10E
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 11:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E0B10E1FE;
	Sun, 23 Jul 2023 09:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81A810E1FE
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jul 2023 09:52:39 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9924ac01f98so586065366b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jul 2023 02:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690105958; x=1690710758;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3VrvByN/8nuSLSqkqBQiwTi662+hO3SXTsNA8vy2Xio=;
 b=g7VlPFJCUqoeAsUwdWUwZXDiwebB6RLPRNg7JFu/cg81RO+ra054ls+7M7/eJPwEOZ
 Y/YobxCG7FYjZfHxGCiKq4gv0zv0uwpLcwVZzXLsM1UkmL9xZNyfGibPVv5pccyq0ff8
 wLGwQ39cJfIsOG+H/4cBzZAHrUZz6hswq8Jm/Pw6tMsDY9EVhVgCLwcSd8OhhdnH5l80
 AwGJXD7YqocARXvzy+7Axkid95cWUZY1I6udTFf0HBivp2APV414PkYqdM/EukwYEpkL
 KMPuuOBsMa2HidWqIdjlvzj1/m64dHXcicv8PxY4iyADIotlMd8T1faEgZZPpZZs7DN7
 RXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690105958; x=1690710758;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3VrvByN/8nuSLSqkqBQiwTi662+hO3SXTsNA8vy2Xio=;
 b=GpBjZLj2at4jCeNGM3y/5OvsXgNZA7NDTOEwg5JZtSfZbwHnhJ9zxsvmxzIAIMXf+Z
 l6WkoPayfdqYCICyXsrlCtMV7dJADjf1U4LOUXrip9pWqHLNOK++cCHqQX7RdK4oNw1W
 cOB/uoopHNlAgOGJx/NA3X8cmQ2Uhig52hjBiyuw1pR++nmkqIAL5s022LlgyCngNE+a
 z8MlvOD5xDCsT9bM+5OICiept/mGJcs2ut7KsI+0+C7BCj9CygHYro2VzQg/KghJRJU/
 ESwRCbGaek0FFvc9VxKZ0mG8iwVuLUENecDmbros6LmIprhdBsHBI+eTWn5Mj374G5ZM
 +uyg==
X-Gm-Message-State: ABy/qLYYKWPblmlvW9w6a2I8O1cFFc0pN3JjCxDYQfzEezFwdXlywZ7B
 KsoCdVvRLjkTmlBWR09L7ZLqMQ==
X-Google-Smtp-Source: APBJJlGYHC/lniVtA/t7I3Ixv+3Xx7qz3wksoy9sBvq5H6hmO5tjSlYOn2P07wnrhmxZZhyNtdML8g==
X-Received: by 2002:a17:906:3f56:b0:99b:5445:10d3 with SMTP id
 f22-20020a1709063f5600b0099b544510d3mr7020881ejj.75.1690105957975; 
 Sun, 23 Jul 2023 02:52:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 jj28-20020a170907985c00b0098d93142ce1sm4891371ejc.109.2023.07.23.02.52.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jul 2023 02:52:37 -0700 (PDT)
Message-ID: <66fc3434-8cc4-3316-ffda-2ffa08cce0f6@linaro.org>
Date: Sun, 23 Jul 2023 11:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/2] dt-bindings: display: add bindings for pcd8544
 displays
Content-Language: en-US
To: Viktar Simanenka <viteosen@gmail.com>
References: <20230720124026.356603-1-viteosen@gmail.com>
 <5b9ceb0e-b7e4-d4b3-461e-c70f4a01fa5e@linaro.org>
 <CAFQqR8-O+w-RQnLUSvyL-4h78pJ1cSr67Chce03+tLCTYP7YWg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAFQqR8-O+w-RQnLUSvyL-4h78pJ1cSr67Chce03+tLCTYP7YWg@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/07/2023 14:25, Viktar Simanenka wrote:
> On Fri, Jul 21, 2023 at 11:42 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 20/07/2023 14:40, Viktar Simanenka wrote:
>>> +allOf:
>>> +  - $ref: panel/panel-common.yaml#
>>
>> This is not a panel, is it?
> 
> I can't clearly tell the difference between LCD display and panel.
> I've added panel-common because of 'backlight' and 'reset-gpios'
> properties. I've looked at 'sitronix,st7735r.yaml',
> 'ilitek,ili9486.yaml' as examples. SPI controlled LCD displays, but in

Probably your device is not a panel (datasheet says: LCD controller),
thus it should not reference panel-common.


> color.
> In fact 'reset-gpios' is already in my yaml. I might just add the
> 'backlight' property explicitly and remove this dependency. Should I?

Best regards,
Krzysztof

