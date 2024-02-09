Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4492284F0E6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 08:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF3D10E519;
	Fri,  9 Feb 2024 07:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yWbt7Ib0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E184310E519
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 07:38:08 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-410585542b3so5052835e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Feb 2024 23:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707464282; x=1708069082; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xGj8lniF7y1kB7M+jeT1hWXXuSmgx61DIvb+nsqPmKU=;
 b=yWbt7Ib0ioHnaLQbiuTqCblZObyGm1UrJ6vdbW2qAieEMNYirWx/3nk0TZbohOf6sb
 H9ZTmrAuHYrZsOmO3jpWIoRZ07ivpXPszjZWXm/ZpNPj+vxBAGpSdcr8nvrE5wkBJDpr
 3N70YegXW87o85pU6kl6BhKEIDme++VhOj4OTlFk3Xf9wozCqnWVvSG5XzYsN/sWnCCM
 268kT3KYjnBOcjPdyAWsgdy89yJQ+p/o0LsN2xhPlSN169jLw053JoANomln1a1ke9SP
 mn7iqe6N+TOZ340EpCSe9Kd433esoMNFMi/qX4lkA6XyAtn7g1Pp5ApulesWwEnH9uQ3
 VzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707464282; x=1708069082;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xGj8lniF7y1kB7M+jeT1hWXXuSmgx61DIvb+nsqPmKU=;
 b=wMnviGjX1rNVJDaP9d5s046kHGFGbCmaLe2/Ki6IXhxLnbWTjijgjJSTN7MWcDDwhO
 G2OI2BvXkWHpDOupFkrWBHouSWNpM0iOVWlRS/iEKrOZRuPZ+G5X20jUQVlEN7YcNsGC
 AFsFAnvbpdiSE4mo2CFrR9uLV/8lUlB/iaUxjPNiRaO1OVBwQRwa3YxaJXkjQEHlkZVS
 apUFIiA4oZrND60qQkhL4jjKy9W6c7awz2s38RkkyxPMzFSOl+3LC6NM0+AHdVZKb3Yk
 1Zpr2d9BRr0gEW9oEtK51fAQLXfW8My3z4d0CcN+O0FU6AUR+64Vv0QYaJbTtacYw4eG
 RLUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJiCi7wZkOn4/MhZ1yroJyHDfslFsHfi65Iy3jyhrAzSxOiO3YGPbDONUHFuhgIZlH/ynPsygFywy85lEhrsNrXhsdwofF9/k3wfKsZGWG
X-Gm-Message-State: AOJu0YwgDLyBjrcDjLts3gq2+60LLoHp3PxjXZZ41Dw4gUjH5W/2qneO
 P2cDP4EryOKip76aH7wRbKorf0lydVzIV838kQPDNqq3mCMQHoAC7c4HGxl2SSI=
X-Google-Smtp-Source: AGHT+IGQP3xvMYZS0UtEKaCQT/ZtEFqKS+97HteKlVP638IrPWDJVIRaF6fx9AWzx8+Ww4lRFAQNCQ==
X-Received: by 2002:a05:600c:4f04:b0:40f:dc4e:69e8 with SMTP id
 l4-20020a05600c4f0400b0040fdc4e69e8mr586519wmq.27.1707464281087; 
 Thu, 08 Feb 2024 23:38:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUb8GClKLtNAplNPGLLDcr7QlxDexdrKvvFP9M/GkqwmNpCsqFB2egNk9+NE26Q/0jBOhuvE/mxLqyQCAjRqIbvRpprWpSeU0JsEfyhLzSJAwSiZrJ1GSEFg8ldRR64jOOKV7/hgNU0F2PmN76vgd0SSsYD/wTGGXTNBRs08y1A0Gh8s0DHTUvoBhZC5L0fMUfEVj+fCKiCrXaLkuv1X1tZKimukCYRAbYkQljPeqyxDneEiuPIzSQpytB4Rgr/pTaPl17vJ28QdYS/UFqvBW+yAT/rQXMUE5/2c2KbObjCJrkJk+vKxdplpuM1M/nI2gf89hMW79h8MMvNZk+FaZYqCKSAjrVEAAffMzWdybnDErrtaiVmDoLOzXANBLcjmwN6Wz37VXeVnsHFJk/BVrtu3Wtxe8q4c/vMxdcKlsMmD5NzM5q6PMRnGV0B7gm8nNiYf8b/pBg2nfF/+oHXEgmo/u/7O1GP5EmwhGvbZckbqNqvoYNXxTYzdi/1dq6Py4bxlcJgFjBVIPhowcQWSCwRQVhIQtIBPl5cAsiJFlrsUbSF4RwyNn5cPGWFo2GpG3qyrqgQd7RFGf1yLWKEtcvh7SS2/wbcmyTO2j13nNHc6ERxO7CY
Received: from [192.168.1.20] ([178.197.222.62])
 by smtp.gmail.com with ESMTPSA id
 bg10-20020a05600c3c8a00b0041061f094a2sm1432961wmb.11.2024.02.08.23.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 23:38:00 -0800 (PST)
Message-ID: <0e94dbbe-698d-43e2-8b27-1e0a2017f9ba@linaro.org>
Date: Fri, 9 Feb 2024 08:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: panel-simple-dsi: add s6e3fa7
 ams559nk06 compat
Content-Language: en-US
To: Richard Acayan <mailingradian@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20240209001639.387374-6-mailingradian@gmail.com>
 <20240209001639.387374-7-mailingradian@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240209001639.387374-7-mailingradian@gmail.com>
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

On 09/02/2024 01:16, Richard Acayan wrote:
> The Samsung S6E3FA7 display controller and AMS559NK06 panel are used for
> the display in Pixel 3a devices. Add the compatible for it.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

