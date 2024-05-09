Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A108C102B
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 15:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE9110E950;
	Thu,  9 May 2024 13:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gAP5Ae/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2319210E950
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 13:12:48 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-34e663aa217so570319f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 06:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715260366; x=1715865166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AeqYlf9c4EFhi9TNIZzRvyO42T/eA+jGpWv1NKDPZXk=;
 b=gAP5Ae/rpJ6n8zr/34WX8jl10kkjSGSqqbG+pFnwdcab0Jx2iau82VIl0Htie9+oaz
 xMwhYZE5WQJ8Sjx/rVQ4Ak9vpF4mKN3XzxDT6N9ltcR/z4eSzfgM8fBaQDCHqGh47PhS
 Cspy4W9VGcUVTwi1qgre2WyN1F4JFBU/Odz33Levxused4utfdSMVjFqHpPnD99tyBDb
 Gb/lYFm55zEWX09Swbr7iQR2huYkO47m1d+y2Ycb9iMASs1r7wr3rMI8aGa1SHaQVJd8
 ME0zMzpuHqBXQAeIyKzNf15NUhhtO1TNZjeldmlthbVYLxZUTcVVENl7+6+gtSDXyGQc
 SP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715260366; x=1715865166;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AeqYlf9c4EFhi9TNIZzRvyO42T/eA+jGpWv1NKDPZXk=;
 b=VW71j31hBVIl78jP/C6+1NafNWqJ0h54l2zwm1xqCREcQOK74y6cDZ0t3jf+j/X63X
 0EK98Es6nVNI+FOaTdmhzI8UNlvoL7aWoVplUs/qgVloQUVTt/Zvzmv8Do6EF+UQj0pM
 fg4oDf+8BtJtz3y1CCiENvZBl5dARJZzs8Sza9a9oagn8OrVhym8r3pbB/zHSqsKQ1VL
 p1yrzI6JwbRRfC3eYDV8pouuvnz6rMwQq6j60sIIwqp30W/4dBTQ8WrB0wFFxtKyfspW
 HXFUD9AOMl35qQtPV40yJ2FNnMo1qamu9Th+mkbf4Frj01+iDEb/NoaMEwrRHH07x3xg
 axfg==
X-Gm-Message-State: AOJu0Yw9zJDvct+7iyZh59mUg44GSzZ4kOqWCCEpP8LgOzCR11ICHclU
 47tANHmHcRriT/7AhXSKbu2C3D6Cs+TLnoT78Y3V6OZKOiaDum4=
X-Google-Smtp-Source: AGHT+IEC7WafECIZydYUdeAbxXAmqunwb457qqLbk5bNV+opK2hsUeI5mP0GAZJxRMOafc4vJyH5uQ==
X-Received: by 2002:adf:cd89:0:b0:343:65a8:406d with SMTP id
 ffacd0b85a97d-34fcb3acc64mr4369892f8f.64.1715260366006; 
 Thu, 09 May 2024 06:12:46 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:b44:d8c3:6fa8:c46f?
 ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b896a45sm1697584f8f.39.2024.05.09.06.12.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 06:12:45 -0700 (PDT)
Message-ID: <d5fcf678-741b-48c0-988e-4722ac756a11@gmail.com>
Date: Thu, 9 May 2024 15:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Add DSI support for RK3128
From: Alex Bee <knaerzche@gmail.com>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 sebastian.reichel@collabora.com, Sandy Huang <hjc@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <20240509120715.86694-1-knaerzche@gmail.com>
 <38423821.XM6RcZxFsP@diego> <1190cfb6-e2d1-4910-ad57-f7566343ff19@gmail.com>
Content-Language: en-US
In-Reply-To: <1190cfb6-e2d1-4910-ad57-f7566343ff19@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Am 09.05.24 um 14:43 schrieb Alex Bee:

> Hi Heiko
>
> Am 09.05.24 um 14:21 schrieb Heiko Stübner:
>> Hi Alex,
>>
>> Am Donnerstag, 9. Mai 2024, 14:07:08 CEST schrieb Alex Bee:
>>> This series aims to add support for the DesignWare MIPI DSI 
>>> controller and
>>> the Innoslicon D-PHY found in RK3128 SoCs. The code additions are 
>>> rather
>>> tiny: It only need some code in the Rockchip dw-mipi-dsi glue layer for
>>> this SoC, add support for an additional clock and do some changes in 
>>> the
>>> SoC's clock driver. Support for the phy was already added when the
>>> Innosilicon D-PHY driver was initially submitted. I tested it with a
>>> 800x1280 DSI panel where all 4 lanes that are supported are used.
>>>
>>> changes in v2:
>>>    To improve power-efficiency when the DSI controller is not in use, I
>>>    dropped the patch which made hclk_vio_h2p a critical clock and 
>>> instead
>>>    added support for an AHB clock to the DSI controller driver and 
>>> updated
>>>    the bindings and the addition to the SoC DT accordingly.
>> The naming already suggests that hclk_vio_h2p is not a clock-part of
>> the actual dsi controller, but more an internal thing inside the clock
>> controller.
>>
>> At least naming and perceived functionality would suggest a chain of
>>     hclk_vio -> hclk_vio_h2p -> pclk_mipi
> I personally wouldn't give to much on naming when it comes to Rockchip
> CRUs. Actually looking at "Fig. 2-5 Chip Clock Architecture Diagram 4" of
> RK312x its:
>
>
> ... -> hclk_vio
>
>                    -> hclk_h2p (clock in question)
>                    -> pclk_mipi (DSI APB clock)
>                    -> hclk_rga
>                    -> hclk_vop
>                    ....
>
> Also there is no other display output path (HDMI, LVDS) which requires 
> this
> clock to be enabled. They all work when it's disabled. That really 
> makes me
> think it's just the AHB clock line for the DSI controller. Maybe Andy can
> share some details?

Anyway: I just looked at the "MIPI Controller architecture" part of the 
TRM - there is not even AHB clock line, only APB. So I revert the change 
with the additional clock, make the h2p-clock critical again and resend.

Alex

>> In any case, I really don't see hclk_vio_h2p to be in the realm of the
>> actual DSI controller, but more a part of clock-controller / 
>> interconnect.
>> Similar to the NIU clocks for the interconnect.
>>
>> rk3588 actually tries to implement this already and while the
>> gate-link clocks are described as "recent", I think this definitly 
>> the same
>> concept used a most/all older Rockchip SoCs, just nobody cared about 
>> that
>> till now ;-) [0] .
>>
>> So TL;DR I'd really prefer to not leak CRU-details into the DSI 
>> controller.
>>
>>
>> Heiko
>>
>> [0] Which reminds me that I should look at Sebastian's make GATE-LINK
>> actually-work-patch.
>>
>>
>>
>>
