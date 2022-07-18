Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B808577D76
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 10:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D5FACF8A;
	Mon, 18 Jul 2022 08:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539F5ACF87
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 08:27:30 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 78F986601A08;
 Mon, 18 Jul 2022 09:27:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658132848;
 bh=3wSuhWp2P2ZyIQrwtaWVzGC8uMFmX+0xQ1Qp+Gq760s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MEYN6sSMnl1b1jGZam3vGPUhszK6Kka5I6EgC7NQr3Q36fJmBTBNdXMzktsez5qIj
 y+s+XdM0YgKFkp9EXPOn+L1Cz+Oxd1XhKLcE2IBo0ISLE3PVkCNEzlzehYjysaiuWG
 Zo51GGkWRKk8PczsWqR8TmMapo+ER+hjgV4sjVLPFHsPVY4Qf/tMhapXsuArRIxERi
 5Mf2Iqmq2tvvOG65/uZIKGF7a1cWG0Qn+VqDzTx0mD+1qYHnorumujxfSLaFnON56Z
 IAxKex2js5tEg95LQVFjSdehcwbr2FzRLtQrHYbNSh7clnBnGfAggQdU5fxiHr3DM+
 lRudS6QdbjYdQ==
Message-ID: <ee88aec0-f6f8-c554-6752-447cb0f34e16@collabora.com>
Date: Mon, 18 Jul 2022 10:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 13/13] video: backlight: mt6370: Add MediaTek MT6370
 support
Content-Language: en-US
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-14-peterwu.pub@gmail.com>
 <ec3bdfb8-0e42-a772-28b1-165811872afa@collabora.com>
 <20220715162913.5ewxwhv6jtdgt3c2@maple.lan>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220715162913.5ewxwhv6jtdgt3c2@maple.lan>
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

Il 15/07/22 18:29, Daniel Thompson ha scritto:
> On Fri, Jul 15, 2022 at 02:38:45PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 15/07/22 13:26, ChiaEn Wu ha scritto:
>>> From: ChiaEn Wu <chiaen_wu@richtek.com>
>>>
>>> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
>>> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
>>> driver, display bias voltage supply, one general purpose LDO, and the
>>> USB Type-C & PD controller complies with the latest USB Type-C and PD
>>> standards.
>>>
>>> This adds support for MediaTek MT6370 Backlight driver. It's commonly used
>>> to drive the display WLED. There are 4 channels inside, and each channel
>>> supports up to 30mA of current capability with 2048 current steps in
>>> exponential or linear mapping curves.
>>>
>>> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
>>
>> Hello ChiaEn,
>>
>> I propose to move this one to drivers/leds (or drivers/pwm) and, instead of
>> registering a backlight device, register a PWM device.
>>
>> This way you will be able to reuse the generic backlight-pwm driver, as you'd
>> be feeding the PWM device exposed by this driver to the generic one: this will
>> most importantly make it easy to chain it with MTK_DISP_PWM (mtk-pwm-disp)
>> with a devicetree that looks like...
> 
> Out of interest, does MT6370 have the same structure for backlights as the prior
> systems using mtk-pwm-disp or was mtk-pwm-disp simply a normal(-ish) PWM
> that relied on something on the board for all the constant current
> driver hardware?
> 
> 

As per my understanding, mtk-pwm-disp is chained to other multimedia features of
the display block of MediaTek SoCs, such as the AAL (adaptive ambient light),
CABC (content adaptive backlight control) etc, other than being a normal(ish)
PWM... that's the reason of my request.

Moreover, in the end, this PMIC's backlight controller is just a "fancy" PWM
controller, with OCP/OVP.

>>
>> 	pwmleds-disp {
>> 		compatible = "pwm-leds";
>>
>> 		disp_led: disp-pwm {
>> 			label = "backlight-pwm";
>> 			pwms = <&pwm0 0 500000>;
>> 			max-brightness = <1024>;
>> 		};
>> 	};
>>
>> 	backlight_lcd0: backlight {
>> 		compatible = "led-backlight";
>> 		leds = <&disp_led>, <&pmic_bl_led>;
>> 		default-brightness-level = <300>;
>> 	};
> 
> I think this proposal has to start with the devicetree bindings rather
> than the driver. Instead I think the question is: does this proposal
> result in DT bindings that better describe the underlying hardware?
> 

 From how I understand it - yes: we have a fancy PWM (&pwm0) that we use
to control display backlight (backlight-pwm)...

Obviously, here we're not talking about OLEDs, but LCDs, where the backlight
is made of multiple strings of WhiteLED (effectively, a "pwm-leds" controlled
"led-backlight").

Using PWM will also allow for a little more fine-grained board specific
configuration, as I think that this PMIC (and/or variants of it) will be
used in completely different form factors: I think that's going to be both
smartphones and tablets/laptops... and I want to avoid vendor properties
to configure the PWM part in a somehow different way.

> This device has lots of backlight centric features (OCP, OVP, single
> control with multiple outputs, exponential curves, etc) and its not
> clear where they would fit into the "PWM" bindings.
> 

For OCP and OVP, the only bindings that fit would be regulators, but that's
not a regulator... and that's about it - I don't really have arguments for
that.

What I really want to see here is usage of "generic" drivers like led_bl
and/or pwm_bl as to get some "standardization" around with all the benefits
that this carries.

> Come to think of it I'm also a little worried also about the whole linear
> versus exponential curve thing since I thought LED drivers were required
> to use exponential curves.
> 

That probably depends on how the controller interprets the data, I guess,
but I agree with you on this thought.

Regards,
Angelo
