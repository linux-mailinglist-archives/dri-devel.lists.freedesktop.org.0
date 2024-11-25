Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C79E09D933D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 09:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C14410E08A;
	Tue, 26 Nov 2024 08:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XHwnp1Lz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E2710E087
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:24:28 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-724f1004c79so1255853b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 01:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732526668; x=1733131468; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GH47thgLGLAwhEyFYzkW0bapLRnqQvS6F+hSbhzlTX4=;
 b=XHwnp1LziL1zfbm5dKiOUrreyXDMHtNDJAKiY/86Kwb9LO7KYGh68jII8UNY/GAfT3
 LL1/hTGriu/7NpWtkfNc6QrQjg6p3YKZLT+SVE4lFqayC+OlusDF1oJH2JL/n4Y+VDB6
 0KVfPQYRqCt90dS2Eu4o1/9shumDlkKTvwO66gvG2+KKhCDaszQasR/2cTp98yfUje7g
 HdWTNGcAAaLl7YQgOsRdzyuaqQe5eBdV/seHLi25yoiPKeJBJk5sO8ith9UUrVoxdKZS
 AxjQ7YLLpV1ET/u9u3nsnyoDj8VwcuG2xzftE4dE3PI8le8Gyc7eSSZwm/o2hBZ0YlXs
 +pRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732526668; x=1733131468;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GH47thgLGLAwhEyFYzkW0bapLRnqQvS6F+hSbhzlTX4=;
 b=cGinpMWKOt4ifdQaAvYWPA0D0Qn5iwdY2FAhRw4wwgms4jLhfKAqThqbMZhPCTe4s+
 ewC7MqJpWDAkct8o9hQ6ElBPM9eNewPYBtRU1uZWGsD9B+wdURdDI78EeUHEO5zwnGD4
 VOYs82LHq/r0RFEOrRSaNp8LBrFkg2wNsDw3ufPnjmpoLu+NsR2VPzwe1v7TEyX1hg4O
 PyB7l+kZy58au1w6jOeRN1vBDmAp624O/0dY9NrjFCkj4izUWy0KT8YbQynyhrwcyXgd
 RILm8UBsQu+ilufiUo/TjBCW6mWypDLGK7vt10G0H76evXsYvrDRfzZXLflGnuI2ogAS
 RqIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWojWPT1l3BxPxIqZ5Ckx+x/aSoFp5x7y37onQgI7lrGDAP2RWc1uO2Mzplx/0D3K4fObeCpv+8dr8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrOzZjtcH/VDXQMNf2i8NXbmZaIN0QYwmBfP455By8DDUfQzXy
 jZS9L/VrWQsw1EfSeaDoP6/RW0IUcpc+iGaoNzo4aFFMGOnpC81a
X-Gm-Gg: ASbGncupm4hvGKYRdGskbivLOU3+b+0qFto+f+teTe23BfPRMTQlaNhOuT7R0NNuJSm
 W2IrBLRCWNYHHJAIHhRsxDoIdeYYEV0z0U3e1ozNcftjGRnN3BCR4VUSdRx+dtnafJe/OyQ0Dru
 xF2lwh/M4JO/RXOchFR5QW4/f+QnaCIzJ3DL05OWvHPtgXd5Ok4YFmviGJo1ayyVAL5Y8pAl9UA
 Ioq+XD7NkTsIp+ZGd1GDF2On1btQcZw2xu8LgR3JwvteZCqgOOiYrTJBT6z3ljyDF1E
X-Google-Smtp-Source: AGHT+IGH/2hu7Jr9H6sYJsbkLS36GY64EFbufco7FimN9lRF0ny00OASpXVX5qeXHk77eHloKg29MQ==
X-Received: by 2002:a05:6a00:a8f:b0:71e:410:4764 with SMTP id
 d2e1a72fcca58-724df5d453fmr19361348b3a.8.1732526667715; 
 Mon, 25 Nov 2024 01:24:27 -0800 (PST)
Received: from [192.168.0.115] ([59.188.211.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724de5762b4sm5950940b3a.179.2024.11.25.01.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 01:24:27 -0800 (PST)
Message-ID: <54759f1f-2575-4e84-b351-119cefed2b17@gmail.com>
Date: Mon, 25 Nov 2024 17:24:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] MAINTAINERS: Add entries for touchbar display driver
To: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com>
 <20241124-adpdrm-v1-5-3191d8e6e49a@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20241124-adpdrm-v1-5-3191d8e6e49a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 26 Nov 2024 08:26:46 +0000
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



Sasha Finkelstein via B4 Relay 於 2024/11/25 早上6:29 寫道:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add the MAINTAINERS entries for the driver
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e7f0170977013889ca7c39b17727ba36d32e92dc..1964bb705cae0b0f12e2174fc96c5cd123d31520 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2164,6 +2164,7 @@ F:	Documentation/devicetree/bindings/arm/apple.yaml
>  F:	Documentation/devicetree/bindings/arm/apple/*
>  F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
>  F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> +F:	Documentation/devicetree/bindings/display/apple,display-pipe.yaml

Missing F:
Documentation/devicetree/bindings/display/panel/apple,summit.yaml
>  F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
>  F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
> @@ -2183,6 +2184,7 @@ F:	drivers/bluetooth/hci_bcm4377.c
>  F:	drivers/clk/clk-apple-nco.c
>  F:	drivers/cpufreq/apple-soc-cpufreq.c
>  F:	drivers/dma/apple-admac.c
> +F:	drivers/gpu/drm/adp/
>  F:	drivers/pmdomain/apple/
>  F:	drivers/i2c/busses/i2c-pasemi-core.c
>  F:	drivers/i2c/busses/i2c-pasemi-platform.c
> 

Nick Chan
