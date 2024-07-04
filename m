Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E72927B8B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 19:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C8E10EB5C;
	Thu,  4 Jul 2024 17:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="exUV6ud7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B65D10EB5C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 17:04:44 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-42565cdf99cso7187815e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 10:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1720112683; x=1720717483;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VhEKXBgCk8YcI/We+H9vMpuHE/Wchhz3UGLxkuxH2GI=;
 b=exUV6ud7jMoCgLaeHc6Sh+LSvb/P2uXEI/bTCfBMwu+E/OE1+g0k/UGxcJr+InHKKd
 3gvmJ8Kts0i8Vz7/cSA3Nc9lvksBPi4FJwK4YMqYBxh8rYQzpgh6Am5xceMQQCzeqctb
 Bbn4gUpG/0rMW0F2iKl1GVPSCWyyj/NWCypSon8e1en6XQkS1z62d/cOl6Uz8vKYLrMS
 I7I8zC5bKYDlNYAB2LV50yomf95RMQkWus2eoL0AEEF7iERdM4AH7xmiXAvgo54/Vn3K
 gNtXtYL024Yp1/zxHCdZQhqVtJH26kggx2b0xcrmnQ5xcDtMibEHVMX/gmRiOleXs7MW
 1u3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720112683; x=1720717483;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VhEKXBgCk8YcI/We+H9vMpuHE/Wchhz3UGLxkuxH2GI=;
 b=r/4REU/EfLpgtMHvjGCQELm8mUvP3wc4aW9GmADvbDeoB/LJUbtB+Uv6OSpSCOBuZJ
 SztCV2TkYbNspAQGElM98X+Z8EYiXVzHnJ2HBogNlJtohiLeWklIbjS4glFCFIhXymvT
 B1aw09B25HIcemWaO5xQ+XC8G8nMFayxfSfYzVJmE3L/r5AeAscDL1sP/IF2hj4oUw/v
 wdVIJ9upEy7xgaigVyGF6o0Ul7Hv7tEkkl1g/COUxPqG9Bhb7xFyzgMtvPvqA2zMBR1z
 p3tBpu21tFJxznLEivDDF/O1lF+wcfS/S6XGtEhJfqirx0bJ4eQTmcga89od7rhSnGk/
 Ulig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV8UHZdltqg/mlRm1Fk/LTkI/40kZ5/B1dCgunquBQVKAi8GSftL7pBAFGRJdY+6ZnHyDh4LzFKE+VZLEuTZFdfTbvSRNtmz8+lJGgIfsN
X-Gm-Message-State: AOJu0YxA7FoGgaMUBeJy8j05JAAERFWfWNqHTNs86yBg3Llm7gRn3b8Q
 GD4/gifcPFDd/8iBRFbO5zLJXRZORo+vEAZAjDh6AqbthF8WKzF3IKmpuQ690Nk=
X-Google-Smtp-Source: AGHT+IFcq4eZY0ByhNRonxN57ZbQ4denoA/srdaVmLq6HfGOy2pmX+pLKLzxcImWqmQ5tilcL6/aXA==
X-Received: by 2002:a05:600c:1790:b0:424:784c:b134 with SMTP id
 5b1f17b1804b1-4264a3bc345mr20946965e9.6.1720112682605; 
 Thu, 04 Jul 2024 10:04:42 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d165bsm31107415e9.4.2024.07.04.10.04.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 10:04:42 -0700 (PDT)
Message-ID: <e55d0f0e-a104-4790-b832-120dbddd93ad@freebox.fr>
Date: Thu, 4 Jul 2024 19:04:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240701-bug-of-great-honeydew-cfb6ef@houat>
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

On 01/07/2024 15:50, Maxime Ripard wrote:

> The i2c register access (and the whole behaviour of the device) is
> constrained on the I2C_EN pin status, and you can't read it from the
> device, so it's also something we need to have in the DT.

I think the purpose of the I2C_EN pin might have been misunderstood.

I2C_EN is not meant to be toggled, ever, by anyone from this planet.

I2C_EN is a layout-time setting, decided by a board manufacturer:

- If the TDP158 is fully configured once-and-for-all at layout-time,
then no I2C bus is required, and I2C_EN is pulled down forever.

- If the board manufacturer wants to keep open the possibility
to adjust some parameters at run-time, then they must connect
the device to an I2C bus, and I2C_EN is pulled up forever.

The only reason I see to expose I2C_EN in a binding is:
if we want to support the fully static setup, AND it is not acceptable
to support it from an i2c_driver, then there might need to be a way to
say "you are not an i2c client, you must fail in probe".

Or I don't understand anything about device tree bindings
(which is entirely possible).

Regards

