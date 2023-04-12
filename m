Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3C46DF5A9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 14:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEE810E7C2;
	Wed, 12 Apr 2023 12:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5048F10E7C2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 12:41:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v27so1535384wra.13
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 05:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681303285; x=1683895285;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AEHj125fFUHVqVSYxI2Iu4R8mwBu9xLsNlhlcbmp5rM=;
 b=llEetynzd9UPHbqm2DuZ2+4h9Q3PCWFOLHFsb0vOSnJYPAfCAO1R3XNmoKZJMwhBQC
 vILAF7oLkx35oAn4QQZ8feiPlgHUZyVqzYlVPvviSyOOaIXVD6/sdEW7kIDfuIu36t1Q
 BV3+QEpyAceCpr/CqnR2DQTdlps3ia+YVy+hXsNBIjJNSOnwwno7+vnUilo8JJuidsOx
 xF+jP1kAslYKyhJ65RH2Wh4UWQ0PDszOh+n7iT3D099hxVe/Dh5QPmuLZJA9ADqi/Egk
 +t+fgzr6O2apGbnbPnFhV3cikLdph/xyWZXNgCgnQXK6rogqkwqP0NQ4UEO/PLWc0wmV
 xnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681303285; x=1683895285;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AEHj125fFUHVqVSYxI2Iu4R8mwBu9xLsNlhlcbmp5rM=;
 b=V6u6mVVXYhuyYv0QrdQ0XXJw1hWmuWly/OaU6KpdEnOppBzbA4t0tKcVQ6IuQU4G2M
 JaWVz/6a05CW6OsIfxWiHTbSYUdEe5SxMd0pwpAGynY7HlRXxUNcQG+MTayF4bJ2tjDD
 e8eCv6FNcS9xfbeJOn+q7nNpebQWUzzoUGn4bAhYpU3Z6x1p4YLhNETT1KFlMArSyaS4
 ReEc1v/TgZtNi5YPoOBHdliplF2et4jYJycmmemmVtOnqXSK5hXALCDaSdY4Gk/1qZYy
 VISE3WuyN+HCwQTUk7KwdMVN7QNJQMK2ISpQpqtYtuK7US+UKBGH00tBHFHW4k3423J5
 5GcA==
X-Gm-Message-State: AAQBX9dBhgh0x7MBQqnvYpgriJwWQkLKhsaRPZbHVoqU/djDQt6rzuq1
 2IlHCSbAEKULIafZWKtz0Ck=
X-Google-Smtp-Source: AKy350aT31kI3WrPlyJemwrlllp01mZSGvhWt0uUtaz7CCjWzacgDuOrFbxL5IdxxVlheLDNfhc0UA==
X-Received: by 2002:a05:6000:11d1:b0:2f4:e8e3:ef62 with SMTP id
 i17-20020a05600011d100b002f4e8e3ef62mr1002128wrx.65.1681303285246; 
 Wed, 12 Apr 2023 05:41:25 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a5d514b000000b002cefcac0c62sm17220111wrt.9.2023.04.12.05.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 05:41:24 -0700 (PDT)
Message-ID: <7466cf12-9411-cb35-8e8b-fa50f5efe492@gmail.com>
Date: Wed, 12 Apr 2023 14:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 22/27] arm64: dts: mediatek: mt6795: Copyright header
 additions
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-23-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-23-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, jitao.shi@mediatek.com, houlong.wei@mediatek.com,
 chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> I have added more than 800 lines to this devicetree: adding myself to
> the copyright header.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 29ca9a7bf0b3..a4c950b65006 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -2,6 +2,9 @@
>   /*
>    * Copyright (c) 2015 MediaTek Inc.
>    * Author: Mars.C <mars.cheng@mediatek.com>
> + *
> + * Copyright (C) 2023 Collabora Ltd.
> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Indentation?

BTW from what I understand the copyright will be by your employer, Collabora not 
you, but I'm not an legal expert :)

>    */
>   
>   #include <dt-bindings/interrupt-controller/irq.h>
