Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD61576F14
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CD610FD2C;
	Sat, 16 Jul 2022 14:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414E710E461
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 16:29:18 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b26so7433000wrc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 09:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=g4utnIEpgUH8SrFacOeGCRYGCTX0362lTOZoYsGdnLU=;
 b=OzC/9QXaaDqxoCP/B7s3PFEoW1r/3BL4QbU0Itu4yM/SSqwTf9zl3vnXpqm6D9/wLg
 u9IULLjrR/XGDkdPfCpFCJs5/QboFpLuQOffp2IKLY+TcH8l8BzzHthtTM5hML+jlRHO
 FG6Cxp7CivJKWEJLvCIuG26LkXP6sxJbO1IKctA1ERVcnJsmcMUdeLVDCwMA4onz9+H1
 1MNjc+56N5uGO0uP7FpLmEqEBd9LvV4yyBSj2q2kCVBKFG5yQDPjhzHOHdM+unWA77AD
 SzvLrlWu0scXmQGI3iWJ+50TPqZt4sVHUFRyHKBkMNQSgWZ1mUzUSIa7VQPGG7NvSDCO
 TFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=g4utnIEpgUH8SrFacOeGCRYGCTX0362lTOZoYsGdnLU=;
 b=KK4lhrkzMg1tmdA5F5lVo52QGjYxpQjlUCyRVxlDixRm6mdxMugkLEcqn4RYbExv8E
 rEHuJhsNWKVk/FCCNYwG03QPrChPyJiDnkTW44eBpyNpkN4UH7tviWFq4PJlSlPlDhpR
 grv8D1ObZCQEd1NZlL+I1cJyhC57kWaL2NHhL8GMaOFN9y0BD6Vcd/xTs34Fjf60wbBA
 oRSi4hgK/FooQRWPimicQxsqsrmMEWYcN3Xh3M67b4BnucGu+lqDvQjPrQ1C5d1vfnmG
 U2aTxW0+QU1i/gVYr6K5L/F6hlowW3rD4QJ6NScNKBoxO+T25H56bx7GNmj7AYLErlF1
 0yKQ==
X-Gm-Message-State: AJIora9VJWTkHzDhHEFsjIkx6FANKynCuZ5QRP2kFHdjzo3G2nAHPXfJ
 oiS8aVK6W4kwF50KOobdWWtGCw==
X-Google-Smtp-Source: AGRyM1tSF48yUDKFkMabG1ZK0Ufn2HDShLc1rfkqldFR9s050thAUB7FUGwV6hpIfcU96gErNHiZ9Q==
X-Received: by 2002:a05:6000:16cb:b0:21d:7b9e:d0af with SMTP id
 h11-20020a05600016cb00b0021d7b9ed0afmr13306509wrf.139.1657902556488; 
 Fri, 15 Jul 2022 09:29:16 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 h7-20020adffd47000000b0021d650e4df4sm4283198wrs.87.2022.07.15.09.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 09:29:16 -0700 (PDT)
Date: Fri, 15 Jul 2022 17:29:13 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 13/13] video: backlight: mt6370: Add MediaTek MT6370
 support
Message-ID: <20220715162913.5ewxwhv6jtdgt3c2@maple.lan>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-14-peterwu.pub@gmail.com>
 <ec3bdfb8-0e42-a772-28b1-165811872afa@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec3bdfb8-0e42-a772-28b1-165811872afa@collabora.com>
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
 lgirdwood@gmail.com, cy_huang@richtek.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, deller@gmx.de, robh+dt@kernel.org,
 chunfeng.yun@mediatek.com, linux@roeck-us.net, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, szunichen@gmail.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 ChiaEn Wu <peterwu.pub@gmail.com>, linux-arm-kernel@lists.infradead.org,
 jingoohan1@gmail.com, linux-usb@vger.kernel.org, sre@kernel.org,
 linux-kernel@vger.kernel.org, chiaen_wu@richtek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 15, 2022 at 02:38:45PM +0200, AngeloGioacchino Del Regno wrote:
> Il 15/07/22 13:26, ChiaEn Wu ha scritto:
> > From: ChiaEn Wu <chiaen_wu@richtek.com>
> >
> > MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> > with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> > driver, display bias voltage supply, one general purpose LDO, and the
> > USB Type-C & PD controller complies with the latest USB Type-C and PD
> > standards.
> >
> > This adds support for MediaTek MT6370 Backlight driver. It's commonly used
> > to drive the display WLED. There are 4 channels inside, and each channel
> > supports up to 30mA of current capability with 2048 current steps in
> > exponential or linear mapping curves.
> >
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
>
> Hello ChiaEn,
>
> I propose to move this one to drivers/leds (or drivers/pwm) and, instead of
> registering a backlight device, register a PWM device.
>
> This way you will be able to reuse the generic backlight-pwm driver, as you'd
> be feeding the PWM device exposed by this driver to the generic one: this will
> most importantly make it easy to chain it with MTK_DISP_PWM (mtk-pwm-disp)
> with a devicetree that looks like...

Out of interest, does MT6370 have the same structure for backlights as the prior
systems using mtk-pwm-disp or was mtk-pwm-disp simply a normal(-ish) PWM
that relied on something on the board for all the constant current
driver hardware?


>
> 	pwmleds-disp {
> 		compatible = "pwm-leds";
>
> 		disp_led: disp-pwm {
> 			label = "backlight-pwm";
> 			pwms = <&pwm0 0 500000>;
> 			max-brightness = <1024>;
> 		};
> 	};
>
> 	backlight_lcd0: backlight {
> 		compatible = "led-backlight";
> 		leds = <&disp_led>, <&pmic_bl_led>;
> 		default-brightness-level = <300>;
> 	};

I think this proposal has to start with the devicetree bindings rather
than the driver. Instead I think the question is: does this proposal
result in DT bindings that better describe the underlying hardware?

This device has lots of backlight centric features (OCP, OVP, single
control with multiple outputs, exponential curves, etc) and its not
clear where they would fit into the "PWM" bindings.

Come to think of it I'm also a little worried also about the whole linear
versus exponential curve thing since I thought LED drivers were required
to use exponential curves.


Daniel.
