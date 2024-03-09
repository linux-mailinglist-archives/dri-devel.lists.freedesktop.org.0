Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60D187736B
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 19:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4222C112323;
	Sat,  9 Mar 2024 18:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H13NajMk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDC5112323
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 18:52:22 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-413161dae46so15744455e9.3
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 10:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710010340; x=1710615140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kvMYCtrSN6RntJWgY25brHBXsAYkKqkya5I6DZzP5+0=;
 b=H13NajMkrKiSLtoJ8huPOQwXS5maDg4OcI8JVF7umLgCDt6ZEiMUdoE8DL/urFIqZh
 ErvIpPZiGpnzDrgbm5pNeSswN7hCne2KctjVDIranvBo9PPomHmyuExnLZSgjgCoQDYA
 F9n5LVkYVa5Ugk/6+dw9sPdzJzSPqajbehO2gpF5nKF/ewbguONShizGm/GyjYBh96GU
 U7zEq3TAKtxgN9f6LBaHJgH5bhVLndRoWVmZ7tCggpBgJ3XKe+qjysYuN8UnLTxxKaDO
 Ap1anCaYM54lQSgiDk89+gGRbR5AnlYk7DgAkUIctHFK5Lfz9y0K5N1HQys8yIAvjNQY
 cq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710010340; x=1710615140;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kvMYCtrSN6RntJWgY25brHBXsAYkKqkya5I6DZzP5+0=;
 b=h/JXxcMLxSBi6UvYrnGoizm6XWCo7rieBQ0ushRsG7BDP03fj0ye70XbzXEqiWmeBs
 bpzIQ9jxQ3I3J5BHvYPSEXOVtIx2K5FAuf6sE+KiXMwAgoUJlOpOZK5TOllofeAdZecj
 d/F2th1nxb2f59eLvzuVAYk2poHnDY8aAnCUUqWLkEIrc2OyJZB1XLGT3JhKUMBsGR2o
 HTzLnD0zVDhjBsSmq6DCsRBw4bA2/dXfNgJw2GnA4N6TGCTLAHLEGCrn896C0jTp8G19
 RIJpH+5rsMdb3WQpTV5jj2V0Fr6XWFknQdCkWaZzRsXxFquZv+sg5vew0sAr3i9j0ux7
 1zIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfQQtBzefU+sYwNtMZ/M0pd9k/d8S1m7gsiqFdgk7geCXGIzT8Aeh1pQDXS3HpUOAwrVPwklrE3O4gy8xK3X1cTqrNeNXs2b3hEe46kvZ4
X-Gm-Message-State: AOJu0YyZ0Gd4j8Z7ZY0LW+ab+fjO7TcqDy78ZUx/4qdYW7InKlEX2V9h
 x/zr45CjF0Q9WZG70PU9+o0LSun+ZaU7GEG0Lc4lNKS0Sh0JF5ea2jaB0AR+UHI=
X-Google-Smtp-Source: AGHT+IHrTz1RzB3h4kOfd5NR+5I9D/R1U3OHR4K9rOGsc0wg0Kk/NLW2B4mJlvxYxHpuNmBub/bNjg==
X-Received: by 2002:a05:600c:46ce:b0:412:e847:a346 with SMTP id
 q14-20020a05600c46ce00b00412e847a346mr1963274wmo.33.1710010340523; 
 Sat, 09 Mar 2024 10:52:20 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
 by smtp.gmail.com with ESMTPSA id
 iv17-20020a05600c549100b00413160baa9bsm7026270wmb.10.2024.03.09.10.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Mar 2024 10:52:19 -0800 (PST)
Message-ID: <24c63f34-43d3-48f8-a171-22971218f4aa@linaro.org>
Date: Sat, 9 Mar 2024 19:52:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: Add Texas Instruments
 LM3509
Content-Language: en-US
To: Sebastian Reichel <sre@kernel.org>
Cc: Patrick Gansterer <paroga@paroga.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240308215617.1729664-1-paroga@paroga.com>
 <cb220c6f-086c-4995-b2e2-bce78b9a4b04@linaro.org>
 <f97b4a8e-7944-496d-9bed-20e8076a327b@paroga.com>
 <4f3cf3c2-c5ff-475b-af5b-3fb698325c60@linaro.org>
 <iuhmiozrfeepftq2hyvt3i6fcwgtllw7imex2tkxmvyrph6qmu@bpygt3i3awoh>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <iuhmiozrfeepftq2hyvt3i6fcwgtllw7imex2tkxmvyrph6qmu@bpygt3i3awoh>
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

On 09/03/2024 19:49, Sebastian Reichel wrote:
> Hi,
> 
> On Sat, Mar 09, 2024 at 01:22:28PM +0100, Krzysztof Kozlowski wrote:
>> LED strings are true in case of... well, LED strings, but I just
>> wonder if such setup is applicable for backlight. Anyway, if you
>> think it is, I don't mind.
> 
> LED strings are being used as backlight. Either from the edge, like
> shown here:
> 
> https://en.wikipedia.org/wiki/File:IPod_Touch_2G_Backlight.JPG
> 
> or like this:
> 
> https://de.wikipedia.org/wiki/Datei:DiodyTV.jpg

Indeed, thanks for sharing!

Best regards,
Krzysztof

