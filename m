Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDD08AD630
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 22:56:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E67A10F849;
	Mon, 22 Apr 2024 20:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QOn9diSB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34ED710F849
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 20:56:38 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-41a5b68ed5cso14380575e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 13:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713819396; x=1714424196; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=8syfjY94AuQFB0ywEx9DtqxOrNOKBkSjKFppuwXTw5I=;
 b=QOn9diSB8Mvta6KQvbvuCdzW32ccbJ3kXzsrOjKgLOpwHoj/GpMho8jFxmFb11OX2h
 CJyXi+bumyH2nvf3+LV+0GeKVCmljRhyDufCGF6Wrl2YgWYBHo1N5c62jZZMOf6R3A9V
 xMaUc48UMvxl0cMsbceN2kTsy81d6z2Phgcb9sjVblX0zi+bdFEvK1mUZE1t79IdWkSk
 3msJhHSpkp/NBMuovn4e41/5C33WyZMM41DDa1CCHwJB1GCr/v+z8Ugagf5knEIFGe5l
 ZBLx2JNl139Trc1jNlbag4sclUJc06KUp31utFchvHLNpHSO35LxxoQ9h//OgF92DWY8
 M7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713819396; x=1714424196;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8syfjY94AuQFB0ywEx9DtqxOrNOKBkSjKFppuwXTw5I=;
 b=SaBGS1cfRTaY7x/tJfStyQ9AtE2dW8IJkdmCyACSLXyPznjnA7L69Xj8Pla0vu7cNP
 NPykMbmZHYVGahwVIYsbPfCV+dvOT3dphNZ6oIAcyKdQ+NDomNT8vWTyOGpxQS+sVYAP
 rJMqoKoewoJFc7Pon21oJYJJO2Hc+ZrVJmbImAv2cmM7B2XarHMXwY1+5N+ZMsuzxUkY
 6TTOZeUwouUvRx2QcTqvayuIY0qTD7GmGV6rxLL+gNhWba/yC4vkFVISkge6+ReIKDoM
 fNepBws0ZmZsyaR9lIvM7/B6emKI/+Pe5r5/ZO0yeUJwvsQO9tKa9vQX/EFJQeKMxSx+
 DAjA==
X-Gm-Message-State: AOJu0Yx5NkjdcdkFEJo+/NjN2se++0qvHS62/pZ8379y00ggTwmfZ4yG
 PMjteNXspiVvYNJwnQ+Aa2PWlG7sYZGWEtAmjCj+pmO9m6z4lWeeVqfOPhcmB8s=
X-Google-Smtp-Source: AGHT+IHueovgOf9vNRdEw7Tq+614Umr42o/v1tdFfbZvhL4gy0JNz9ye0t7q+fbJ4l6vhEJ8KtivnA==
X-Received: by 2002:a05:600c:1f1b:b0:41a:5ea1:1aed with SMTP id
 bd27-20020a05600c1f1b00b0041a5ea11aedmr3561817wmb.9.1713819396311; 
 Mon, 22 Apr 2024 13:56:36 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c4ed200b00418729383a4sm17687007wmq.46.2024.04.22.13.56.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 13:56:35 -0700 (PDT)
Message-ID: <29352160-4943-4271-97f5-34afd6f35df9@linaro.org>
Date: Mon, 22 Apr 2024 22:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: panel-simple-dsi: Add generic panel-dsi
To: Johan Adolfsson <Johan.Adolfsson@axis.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 kernel <kernel@axis.com>
References: <20240418-foo-fix-v1-0-461bcc8f5976@axis.com>
 <20240418-foo-fix-v1-2-461bcc8f5976@axis.com>
 <c739a512-9a75-4f48-b5ef-801191c298f5@linaro.org>
 <PAWPR02MB928111F5EEB4A46B56A89B239B122@PAWPR02MB9281.eurprd02.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <PAWPR02MB928111F5EEB4A46B56A89B239B122@PAWPR02MB9281.eurprd02.prod.outlook.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/04/2024 16:34, Johan Adolfsson wrote:
> 
> 
> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 
> Sent: den 19 april 2024 01:05
> To: Johan Adolfsson <Johan.Adolfsson@axis.com>; Neil Armstrong <neil.armstrong@linaro.org>; Jessica Zhang <quic_jesszhan@quicinc.com>; Sam Ravnborg <sam@ravnborg.org>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>; Thierry Reding <thierry.reding@gmail.com>
> Cc: dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; kernel <kernel@axis.com>
> Subject: Re: [PATCH 2/2] dt-bindings: panel-simple-dsi: Add generic panel-dsi
> 
>> On 18/04/2024 16:01, Johan Adolfsson wrote:
>>> panel-dsi is similar to panel-dpi with overridable timings
>>
>> ???
> 
> I guess a more correct description would be 
> "panel-dsi is a fallback in a similar way that panel-dpi is in panel-dpi.yaml .."?

I meant how does it explain the hardware.

> 
> ...
>>> a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yam
>>> l
>>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi
>>> +++ .yaml
>>> @@ -56,6 +56,8 @@ properties:
>>>        - samsung,sofef00
>>>          # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
>>>        - tdo,tl070wsh30
>>> +        # Generic dsi panel with timing overridable
>>> +      - panel-dsi
>>
>> ? Devices are not generic. This is very confusing and commit msg does not help me. Compatibles *must* be specific, see writing-bindings.
> 
> I guess I see this a generic fallback, that handles any dsi panel as long as the correct timing etc is specified in devictree, similar to what panel-dpi is in panel-dpi.yaml
> Maybe phrasing it similar to panel-dpi.yaml is better?

But panel-dpi is quite different. You always have two compatibles. I
don't see two compatibles here.

Best regards,
Krzysztof

