Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1945A77688
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 10:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23C9510E2C1;
	Tue,  1 Apr 2025 08:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X3hRe0Tu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB6010E2C1
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 08:34:05 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3912387cf48so231199f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 01:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743496444; x=1744101244; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Es91/Fmi3Z5RjbLhOFvYU3nKjRD7ALX9CP22nn9A9Mg=;
 b=X3hRe0Tu0EYtCP0/B88xWg//DwcfksiXZcW/XKXiOy1NnzFkhThm3XN9zB1aqCURhb
 J/VEcAWEDiF4MqIYa0WKxVaEPvquSacuUwS5RHkOQR1j5Jcj2UYB5ph3ns+RZMNdwWcm
 58ttmyas/PsiJz+OOHDC2n8/da3uMA6K225+2SeSe8H/Q12eOXGk2/E83WEuH2zRmnkm
 1ajUSY5YmHrn6ja+V9e3gFAw52/fICXBRXhwBVUW+JCz2jbwqKUNnBcGDZ3wtT0MMjdA
 DDmZRXNJYTvUCFC5k/+dqrpx8sXZkfaUgResAaNe3WnlcNU/qy+od+7qvepGnk0wiU0g
 CHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743496444; x=1744101244;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Es91/Fmi3Z5RjbLhOFvYU3nKjRD7ALX9CP22nn9A9Mg=;
 b=L1mHgPJ61bfKiI8pLH1TvGffxkOofwWHXD7SU7z+nZZTezveaNTrHHDtH2FlzaVwza
 jlneQiHJQCC1izwys7swUPpKoJS0+09Pgevz42l1ZQg3H6pOthX/6+DvgXrKwlBSw2sb
 fhhaNmiXHCq00UBXOwkty1cN5BTpvBoDqoG2rCsTLKnSp3EDWdrt92IxKF1E1TLm0zLD
 AvcaeWZrJ1vDVk6QmlQEsjkowAtrruWqLHRsMnj/OEVQ0W9+QBMTzOCwe0Oub2990J3J
 lenELhhbr2jf1v62axLkjH9/ZE7E90C8aeSBUmgAB26nDpo2drzZ+kZHpeM3limmfZgi
 cOZw==
X-Gm-Message-State: AOJu0Yzoh0SS4fywHJ/h9/Kco1+b/DWfWM1M66YlHAjaKj4pZc4oJxx6
 EIlrl59Y3WYUXCm3eZTJwXiJW6PnZy8+Hs6u72b4AkMlZ5VGKoEyHI+d6DLSWRI=
X-Gm-Gg: ASbGncscEaA+zbKUeqoeCilzzK7cMkj0EZJA9Ry32FK84ewMBPIyQXcFjzRsk1NlycU
 VZLP6/4xnr5fJUGNyjCfB19pXOJ0KxAGr0wHcvsyNKa7S1dJy8D/XOK6EbQ+xP7AWohvyPOAb4O
 AMOnyPj996ZKKjnkIQ7PNwbT1D7m/RBG8MKDRay0JGcSD+ySy9SPN7P5LHItQoqll81zwc4rDz0
 I7NSNtkWyvaaUgyZuOtrolZu7UmSqg+IkFzwwK1nNMRPKHT4abAm0bGShBzMK8d1Oai7CP0beam
 zER+mZqha2i4c2J3qAqMtDutuGYWh6vab/8HAFVEr4QU/b23srHhn2Hxp+d9ohs=
X-Google-Smtp-Source: AGHT+IGCGiiiYCIUaLZcb5s98tRnmPNuSHQrGIsm5DOWVPlytR6KcVfUJCMQWo0HpevAIXioEGpZ+g==
X-Received: by 2002:a05:6000:2210:b0:39c:e0b:c621 with SMTP id
 ffacd0b85a97d-39c246f26e8mr350768f8f.1.1743496444201; 
 Tue, 01 Apr 2025 01:34:04 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d90000f48sm147463665e9.37.2025.04.01.01.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 01:34:03 -0700 (PDT)
Message-ID: <abfea9d8-9992-44e6-975e-a18b01753aa5@linaro.org>
Date: Tue, 1 Apr 2025 10:34:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: display: Add Clockwork CWD686 panel
To: =?UTF-8?B?Q2hhcmxvdHRlIO+/vWxlxYRrZWM=?= <lotte@chir.rs>,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, max@maxfierke.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250401081852.283532-1-lotte@chir.rs>
 <20250401081852.283532-3-lotte@chir.rs>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250401081852.283532-3-lotte@chir.rs>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/04/2025 10:18, Charlotte �leńkec wrote:
> From: Max Fierke <max@maxfierke.com>
> 
> The CWD686 is a 6.86" IPS LCD panel used as the primary
> display in the ClockworkPi DevTerm portable (all cores)
> 
> Co-authored-by: Charlotte Deleńkec <lotte@chir.rs>
> Signed-off-by: Charlotte Deleńkec <lotte@chir.rs>
> Signed-off-by: Max Fierke <max@maxfierke.com>

That's not a correct chain. If you co-authored, how can you sign off
before max did?

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Best regards,
Krzysztof
