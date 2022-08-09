Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE4958D944
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 15:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC5A9769A;
	Tue,  9 Aug 2022 13:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFBD9630B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 13:14:49 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 ay36-20020a05600c1e2400b003a4e30d7995so8933619wmb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 06:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=dBqbYW9tbViwcewTo3bCPmvXW6SZtS25kUYhTbQNV8c=;
 b=y571nheINae9LUI/SJMNbLrGWhVOjCeCDgW1FZioe3HjacILCjd6QSMQsqQLVaf6ej
 vIu1F57XpVYbcP4KdE2zpOJXTaoTzu0BV5waTrO9VkrQKOyXdOdHigwSkiT1LSg0yEfz
 nvdTRa0VyWxUrvttnpZhPUA2nBjZ/UYCUgqZlOsmZMdY2108t+OmfmbTT7+us90g5Rf7
 i+0hxV16SiU7p7aTM7uSA6Cuj2vHo6O5Nm6ss3AEfscFNblCFzDGlPa/sHFBVbaj0T6l
 oTJx8MwwHSJtrMvKNV8wSIpolrJVA+vV6dbRo2MUkzEksKk8omCBBBIFWfQN8hYxzd/P
 OFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=dBqbYW9tbViwcewTo3bCPmvXW6SZtS25kUYhTbQNV8c=;
 b=7yg1NW3BqzQyjQT/B5Yt1zVGy7Ttx5S9gRA7sHJxpJ4bqFLC6cx8p0Vg7EEVXnE0hi
 lDP/Jy9DEIRXuKGrAmk8v4zMqJGQoPqSwrO6Baxn4jlirXcmSFUqSlk4QeGqkmPccRSj
 rKbAkkat9wX8J6FbSLuMucPhTMgxN/gNtaP/6C2mVt5hAqUPamSMbMG3xXhYqwcvNQI4
 Di7bgfMSdZ0pWZXiO/kiiAFKWsYTR4L8Sp6+OStfifo7C/AncWHvAp1g/ww/whVxFYKw
 TjRaQTIVVL8AV8vnfF7GhnOoSGVdhgBXLMBnz4kxrp1YVUtn7qgv8ecyKi4d6Sb2TqqV
 ICsA==
X-Gm-Message-State: ACgBeo36uKkzsqjk11jI02Uk/VknxYTKaPlEV/N+v+/VB1D77deXW/ut
 2wg2MMFXUOwuF6VZXH22CbLLBA==
X-Google-Smtp-Source: AA6agR6TpJGcLGt3ec1JQE9loH2/RHUpfI8WY60Mc8fNQRrRSfAKatUW5XphGdaQl8HnNqdDadGXhA==
X-Received: by 2002:a05:600c:3790:b0:3a5:435d:b2d3 with SMTP id
 o16-20020a05600c379000b003a5435db2d3mr5591567wmr.134.1660050887523; 
 Tue, 09 Aug 2022 06:14:47 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 w8-20020a5d6088000000b002185631adf0sm13519557wrt.23.2022.08.09.06.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 06:14:47 -0700 (PDT)
Date: Tue, 9 Aug 2022 14:14:44 +0100
From: Lee Jones <lee.jones@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v7 07/13] mfd: mt6370: Add MediaTek MT6370 support
Message-ID: <YvJdxEpC2cB58Bq9@google.com>
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
 <20220805070610.3516-8-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805070610.3516-8-peterwu.pub@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 Lee Jones <lee@kernel.org>, robh+dt@kernel.org, andy.shevchenko@gmail.com,
 chunfeng.yun@mediatek.com, linux@roeck-us.net, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, szunichen@gmail.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 chiaen_wu@richtek.com, gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 05 Aug 2022, ChiaEn Wu wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> This adds support for the MediaTek MT6370 SubPMIC. MediaTek MT6370 is a
> SubPMIC consisting of a single cell battery charger with ADC monitoring,
> RGB LEDs, dual channel flashlight, WLED backlight driver, display bias
> voltage supply, one general purpose LDO, and the USB Type-C & PD controller
> complies with the latest USB Type-C and PD standards.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> 
> v7
> - Move '#define MT6370_REG_MAXADDR' to the next line of
>   '#define MT6370_REG_CHG_MASK1'
> - Rename 'MT6370_REG_ADDRLEN' to 'MT6370_MAX_ADDRLEN'
> ---
>  drivers/mfd/Kconfig  |  16 +++
>  drivers/mfd/Makefile |   1 +
>  drivers/mfd/mt6370.c | 312 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/mfd/mt6370.h |  99 ++++++++++++++++
>  4 files changed, 428 insertions(+)
>  create mode 100644 drivers/mfd/mt6370.c
>  create mode 100644 drivers/mfd/mt6370.h

Applied, thanks.

-- 
DEPRECATED: Please use lee@kernel.org
