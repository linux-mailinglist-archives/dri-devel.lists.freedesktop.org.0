Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4719B426B94
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 15:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F676E0EE;
	Fri,  8 Oct 2021 13:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7266E0EE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 13:16:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r7so29735361wrc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Oct 2021 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Gr1byabWHn1PUa1m+Lt+dKzXId3ni3LSSa9lwDSa3gk=;
 b=TJwvim7w+eQFFfurbsl40FGMPwvnfLNLF3mqkVbNUxpugKorDKYZpgJ6ppC/PTEfU/
 zOILl/qFEGzOdn6zfkCqtCzngeViZPdhvYzMHbM3IFZjQGHrra/zDS/6TMIKgTnVc55t
 FcMxubz12x29/ajr4yg/4IapyvyKUFNo3xqRhsRdQeIVc4OPAXyzrkZY81y6rOdHomht
 hqzwPEcVHx/WmerpaSHDHB18z/kd2XNccqlNpJydYkZY9xgv9A3ahUCBrPFCZeng3Ptm
 jP6ttiHbfEf7muJb0bTHpjXuPa4qjwlq/IFgZ8831A1pXDw+R+PUitOMme4fSBTH9oWk
 WxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gr1byabWHn1PUa1m+Lt+dKzXId3ni3LSSa9lwDSa3gk=;
 b=cKQ8XtTQIMTJqzlHJ//anl/HNNoeHaqxBAvxl9sh9KpiVaIDOMDVFtOjD/w8uBfZOf
 hkL7VLDbYStgxLDkPAN8WUVtEQ9dDgrWaCp25dGekiX8ORJKqO/wuaSnpvfH0ITN60OK
 qkH5TPusbguz3MeMrjY5Bz9q4GAWeuEHk/tphV6l0pKeWDyKCmLcxj2qeVG+EYkEawv6
 wN9XyUCPzBdINbPS9Pab6RnyQuyEsJP3CwCi0DUw/2lIErY1Ggm/5EkSbJDnpLaO/mx7
 gfAwiBOI1vZong6LIdYS9vOQcffpwZhqZ/H8JAa0TVcvTQwCIoFsaCv8hqLB3sISmDvt
 yzOA==
X-Gm-Message-State: AOAM533LY5e81CR0jGhbAMX+eyS6oRd5R+CyjP0OpfsG3X7/kwnjGINM
 MF+sJRjn6vUUbTM22WZkG34=
X-Google-Smtp-Source: ABdhPJwchweLQBjxy6TkxOtLDsNz1AODqVJ3fWsbZRISUfWyoArhAgv4Go21sBR80xsRmqCQwndA7w==
X-Received: by 2002:a5d:6245:: with SMTP id m5mr4099639wrv.148.1633699006563; 
 Fri, 08 Oct 2021 06:16:46 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
 by smtp.gmail.com with ESMTPSA id g2sm2642909wrb.20.2021.10.08.06.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 06:16:45 -0700 (PDT)
Message-ID: <266143bd-6135-adf6-8a80-537f9d6ea3ff@gmail.com>
Date: Fri, 8 Oct 2021 15:16:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v4 0/7] Add support to the mmsys driver to be a reset
 controller
Content-Language: en-US
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, eizan@chromium.org,
 kernel@collabora.com, drinkcat@chromium.org, jitao.shi@mediatek.com,
 chunkuang.hu@kernel.org, hsinyi@chromium.org,
 Crystal Guo <crystal.guo@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Fabien Parent <fparent@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20210930083150.3317003-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210930083150.3317003-1-enric.balletbo@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30/09/2021 10:31, Enric Balletbo i Serra wrote:
> Dear all,
> 
> The following patchset is a reimplementation of the patch sent by Jitao
> Shi [1] some time ago. As suggested by Chun-Kuang Hu, this time the
> reset is done using the reset API, where the mmsys driver is the reset
> controller and the mtk_dsi driver is the reset consumer.
> 
> Note that the first patch is kind of unrelated change, it's just a
> cleanup but is needed if you want to apply all the following patches
> cleanly.
> 
> This patchset is important in order to have the DSI panel working on some
> kukui MT8183 Chromebooks (i.e Lenovo IdeaPad Duet). Without it, you just
> get a black screen.
> 

Patch 1-5 pushed to v5.15-next/dts64
Patch 6-7 pushed to v5.15-next/soc

Thanks!
Matthias

> Best regards,
>    Enric
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20210420132614.150242-4-jitao.shi@mediatek.com/
> 
> 
> Changes in v4:
> - Remove unnused variable as pointed by Hsin-Yi
> 
> Changes in v3:
> - Based on top of the patch that converts mmsys to schema
> - Fix typo in the commit description
> 
> Changes in v2:
> - Fix build test ERROR Reported-by: kernel test robot <lkp@intel.com>
> - Added a new patch to describe the dsi reset optional property.
> 
> Enric Balletbo i Serra (7):
>    arm64: dts: mediatek: Move reset controller constants into common
>      location
>    dt-bindings: mediatek: Add #reset-cells to mmsys system controller
>    dt-bindings: display: mediatek: add dsi reset optional property
>    arm64: dts: mt8173: Add the mmsys reset bit to reset the dsi0
>    arm64: dts: mt8183: Add the mmsys reset bit to reset the dsi0
>    soc: mediatek: mmsys: Add reset controller support
>    drm/mediatek: mtk_dsi: Reset the dsi0 hardware
> 
>   .../bindings/arm/mediatek/mediatek,mmsys.yaml |  4 ++
>   .../display/mediatek/mediatek,dsi.txt         |  6 ++
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  2 +
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  5 +-
>   drivers/gpu/drm/mediatek/mtk_dsi.c            |  5 +-
>   drivers/soc/mediatek/mtk-mmsys.c              | 68 +++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.h              |  2 +
>   drivers/watchdog/mtk_wdt.c                    |  6 +-
>   .../mt2712-resets.h                           |  0
>   include/dt-bindings/reset/mt8173-resets.h     |  2 +
>   .../mt8183-resets.h                           |  3 +
>   .../mt8192-resets.h                           |  0
>   12 files changed, 97 insertions(+), 6 deletions(-)
>   rename include/dt-bindings/{reset-controller => reset}/mt2712-resets.h (100%)
>   rename include/dt-bindings/{reset-controller => reset}/mt8183-resets.h (98%)
>   rename include/dt-bindings/{reset-controller => reset}/mt8192-resets.h (100%)
> 
