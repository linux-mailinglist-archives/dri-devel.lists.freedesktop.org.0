Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5B093B607
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 19:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC45C10E77F;
	Wed, 24 Jul 2024 17:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="dQ9wRaEm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E2510E77E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 17:34:08 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-426717a2d12so744725e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 10:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1721842447; x=1722447247;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3CF8kwNX6NMY/WwdtTRjKXajD0RVVOOrPiCE63zSxOE=;
 b=dQ9wRaEmX7CwJ/GHsdmR4v+wEJQsOxvRQnT7UWYjdvRgkQ4JWS9V6G7O5SsfQ7goy6
 yTcKX9FbOBKgOIxkrPOaPCk6w4l114NZCbhN2IdBDi1EkBGIqsCYxnwK80aeYPn0dzD2
 NXJzh6/sg/YnOiO7i3+qSj8gP28cvwX9H77xTxnnkXD84N8NVepgK4ZTLMp6+MvQ5DSS
 g7B/hFLkaaffA5EtOec/MyqStdrISa9nxx/ydkP3tZ7wFgy5MuipF9a/5g5OkuMUZXv6
 aKTTvsIZlY1gsbr5CqFrGfK7q/KLrtLMa80q5tnO7BT/1kD3WN55UrD797DA2N8pqsSA
 7kYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721842447; x=1722447247;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3CF8kwNX6NMY/WwdtTRjKXajD0RVVOOrPiCE63zSxOE=;
 b=IRtaqsSH1jsCnryekVumx9NBlGKnHFTQMBQu5q8ta+iE2cZO5zWS8D6s0B9SIH+LR5
 dOveaupDwA9dbsu/Ox4fiQrsdivWE1+lPi0JWlQiNOD6LvrrGoPArPhR6F6ytZUOPq7j
 csn5p2YKqFIUStSXYoELDtckbdxb/Fl+qUi6Ub0d9MuRtMcUvr1DWTQjZxyhfk4NKxee
 ynbtjKJZrOvppdh5FFmJz2Dw4n0tKxnRPVdun/s4wMuX+ncw3RAOQtYW5x5rRHWTtKhq
 HCwMkge7Upm4IRbChB9XiBrPQ2B3vrY4N3s1hOAZrxNNLAmB3kYjW23+9srYiGIpWwF9
 W+iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB1owO5Na7T+T92d/K/mFTjcrllka2W3swnjz8YFwzVgD3w20z15pi7A6utYNH6iqBjAnVACDIVVB4j6hyI5CODr0d9XpANlbFy5voi14H
X-Gm-Message-State: AOJu0YxtEvNTI4ABvc40g+AP72vyEvlGGsCdKHDnyjCZ7sfPnf0MdDAH
 EZNH9jgemuLR0EnDqx6vgC8XSPhGWidVCS8wZuSyI4usok4/U07D3fnT1e2SKKw=
X-Google-Smtp-Source: AGHT+IFtTWi5rpFaTtER/Gz2ezWjweNVTL+H8GRpQpl1oXpGygMuuhcgu8RgoZHqAmmSVbrkhBv0Fw==
X-Received: by 2002:a05:600c:4fc9:b0:426:6fb1:6b64 with SMTP id
 5b1f17b1804b1-427f99f99f5mr21820095e9.7.1721842446996; 
 Wed, 24 Jul 2024 10:34:06 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:fcff:6f45:dab:b3a8?
 ([2a01:e34:ec24:52e0:fcff:6f45:dab:b3a8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-368787ced33sm15029927f8f.86.2024.07.24.10.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 10:34:06 -0700 (PDT)
Message-ID: <330ee34c-5a31-4232-8811-32a25a34fb5e@freebox.fr>
Date: Wed, 24 Jul 2024 19:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e7bbbe4e-7deb-46c3-9cce-1922f9b6b3a2@freebox.fr>
 <20240708-ethereal-romantic-piculet-d4ae66@houat>
 <pp3rc5zob3xeghlatw4vnpzplc4yjpjadkea465zmhft55dyl5@3cpoc2zovftv>
 <20240715-shiny-enigmatic-firefly-2a6dec@houat>
 <CAA8EJpoJ0132ZYGCO=8xQt8J4Z9w5jDON1H-VRCemFdyV-9nUw@mail.gmail.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <CAA8EJpoJ0132ZYGCO=8xQt8J4Z9w5jDON1H-VRCemFdyV-9nUw@mail.gmail.com>
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

On 15/07/2024 18:38, Dmitry Baryshkov wrote:

> Please correct me if I'm wrong. We have following usecases.
> 
> 1. I2C_EN pulled low. TI158 is in the pin strap mode, it is not
> connected to the I2C bus. A0, A1, SDA and SCL pins are used for
> strapping the settings.
>     board DT file should describe the bridge as a platform device
> sitting directly under the root node.
> 
> 2. I2C_EN pulled high. TI158 is in the I2C mode. It is connected to
> the I2C bus, A0/A1 pins set the I2C bus address. The device is
> controlled over the I2C bus
> 
> 2.a. The same as 2, but the device is not controlled at all, default
> settings are fine.
> 
> The driver covers usecase 2.a. The bindings allow extending the driver
> to the usecase 2 (e.g. via optional properties which specify
> board-specific settings)

OK, I think I understand (maybe).

You're saying: the current binding doesn't specify any
particular setting because the default settings are OK.
We can switch to use-case 2. simply by adding a prop
that will change one specific setting (backward compatible)

> The usecase 1 is a completely separate topic, it requires a different
> schema file, specifying no i2c address, only voltages supplies and
> enable-gpios.

I have tested this.

We can support use-case 1. by registering a module_platform_driver
with the same compatible property. The probe function gets called
only for a node that is a child of root. No different binding required.

Regards

