Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDDB8C0FCE
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 14:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D751C10E5A3;
	Thu,  9 May 2024 12:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a7jy+1Cf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E900310E5A3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 12:43:37 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-41c1b75ca31so5966385e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 05:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715258616; x=1715863416; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ukFRa6jd0YhZA7RQLCPnJfFHsXtdSwr8V5mOexEjdho=;
 b=a7jy+1Cf9pvkJPvQdF6JRSMtDbTNAjqnMaTU+zMEP+VzoBq+Al0slc2nqfMPlSQc8q
 UlaWqhx+Em+lysSE2DFFTaFtUskT+Y8C2FwmSxM92wQX+WtRaOTF/ctRKxLckoJy0rGI
 0Q/tD/T9DyPg1FVv3TNw2ngKyk++q9ElvikuRgohiuJDUs3v9avYnyzMt0KPzp0p7i0b
 AlnBO+pEx9dO7+MEWajcXrcr8ekdx8MmrS1CkJcjZ2el+VB+LfuqnuVFE4mfp63WQZZ3
 zO+y8e9Ha8NXHbwkpNdVDgvyRfSkiP6Rys4gQHrmURGAxwrezH4NVoKEGOcYgCKYlNRX
 i0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715258616; x=1715863416;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ukFRa6jd0YhZA7RQLCPnJfFHsXtdSwr8V5mOexEjdho=;
 b=PT4qQ+wK2PzaTg7ARXZhVKyc4qLwIS2e7o3EgotaHTl0MO+BmkIiszJypM+QTxSQ/9
 LxwHDWHpz15T1ahieu/Ii3X4Rb1SbBAalEebYHLnuEiTDlGMaMnp+ySblZnZpP+N2xTn
 xC4VHE/fSxkoaBYATgyu9Tjlm89t8WYvc6DuBHf5SJSn8l6liMYCLr3C6P6AZL2knuB/
 kC5k0wahvsxnnmpos0XrybejPEj64l/vjZQ7ACRm4J+Old4GNHZF17B1z+qt7BVcyAL3
 0e52rhfIPWInjv+rJGCQcjI/Yjv5Bni8Juh+iWp6CS/BB2XNIx9dsIf15FF09EjTuqE4
 Cj6Q==
X-Gm-Message-State: AOJu0Yy37JCnKFRdzWHXwsqr4T1AWXnMe5fWNQ6CcTKqevUqR4vynaBS
 Cui5s/gXFvnw+UQSMTeG09GiuJUbmskg+hnx8fb5SfkIpoYgQDhBTb47
X-Google-Smtp-Source: AGHT+IH91edNyT90V4bTzKolAoCvVxJlY9gxXvUn7JsOUYnFiQrJLSLCJeZJDn8SANfleGSnxvbfFw==
X-Received: by 2002:a05:600c:450c:b0:418:fb6f:5f59 with SMTP id
 5b1f17b1804b1-41f71cc25a8mr45229895e9.2.1715258616089; 
 Thu, 09 May 2024 05:43:36 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:b44:d8c3:6fa8:c46f?
 ([2a02:810b:f40:4600:b44:d8c3:6fa8:c46f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f87b26675sm59904325e9.2.2024.05.09.05.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 05:43:35 -0700 (PDT)
Message-ID: <1190cfb6-e2d1-4910-ad57-f7566343ff19@gmail.com>
Date: Thu, 9 May 2024 14:43:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Add DSI support for RK3128
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
 <38423821.XM6RcZxFsP@diego>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <38423821.XM6RcZxFsP@diego>
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

Hi Heiko

Am 09.05.24 um 14:21 schrieb Heiko Stübner:
> Hi Alex,
>
> Am Donnerstag, 9. Mai 2024, 14:07:08 CEST schrieb Alex Bee:
>> This series aims to add support for the DesignWare MIPI DSI controller and
>> the Innoslicon D-PHY found in RK3128 SoCs. The code additions are rather
>> tiny: It only need some code in the Rockchip dw-mipi-dsi glue layer for
>> this SoC, add support for an additional clock and do some changes in the
>> SoC's clock driver. Support for the phy was already added when the
>> Innosilicon D-PHY driver was initially submitted. I tested it with a
>> 800x1280 DSI panel where all 4 lanes that are supported are used.
>>
>> changes in v2:
>>    To improve power-efficiency when the DSI controller is not in use, I
>>    dropped the patch which made hclk_vio_h2p a critical clock and instead
>>    added support for an AHB clock to the DSI controller driver and updated
>>    the bindings and the addition to the SoC DT accordingly.
> The naming already suggests that hclk_vio_h2p is not a clock-part of
> the actual dsi controller, but more an internal thing inside the clock
> controller.
>
> At least naming and perceived functionality would suggest a chain of
> 	hclk_vio -> hclk_vio_h2p -> pclk_mipi
I personally wouldn't give to much on naming when it comes to Rockchip
CRUs. Actually looking at "Fig. 2-5 Chip Clock Architecture Diagram 4" of
RK312x its:


... -> hclk_vio

                    -> hclk_h2p (clock in question)
                    -> pclk_mipi (DSI APB clock)
                    -> hclk_rga
                    -> hclk_vop
                    ....

Also there is no other display output path (HDMI, LVDS) which requires this
clock to be enabled. They all work when it's disabled. That really makes me
think it's just the AHB clock line for the DSI controller. Maybe Andy can
share some details?

Alex

> In any case, I really don't see hclk_vio_h2p to be in the realm of the
> actual DSI controller, but more a part of clock-controller / interconnect.
> Similar to the NIU clocks for the interconnect.
>
> rk3588 actually tries to implement this already and while the
> gate-link clocks are described as "recent", I think this definitly the same
> concept used a most/all older Rockchip SoCs, just nobody cared about that
> till now ;-) [0] .
>
> So TL;DR I'd really prefer to not leak CRU-details into the DSI controller.
>
>
> Heiko
>
> [0] Which reminds me that I should look at Sebastian's make GATE-LINK
> actually-work-patch.
>
>
>
>
