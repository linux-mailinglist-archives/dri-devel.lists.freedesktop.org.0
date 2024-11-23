Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE39D6BA3
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 22:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDF610E289;
	Sat, 23 Nov 2024 21:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kemnade.info header.i=@kemnade.info header.b="79uBzN66";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C17710E289
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 21:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=zXUvUoL/OnaPQoLr5nrWhyhwl+PNI5Cabcfe7EiPBO0=; b=79uBzN66XDG3kLDz/RGUmS2Tfg
 KsgILZO6wuZiDIuY2XJaHEyPjrIlrh309mXHfmBxhWllYKNiHdmEeMu7ouFMPCVVHL3JNJt0NgJXA
 N/av56wGSxpZcnd8/7b2VaCGWeG15pLgKzanI+6Aq4g2+7lK9eItwqH3D8M06BXbZcn6V/bIeaU2b
 2DncUejHN/IS/oNaBgvzaLMFsqoEsR/EymHYm/nfy4BGyc0/auYaRlOxBzdxetAYCCoNzLvZqPZcI
 YqeR5CzuAUAsl6Ux78hvvPINAIXVvF7ehDopYjdXeIE42UnAhKIjvqEZyv80l2FT+Tt9hBjILl9ve
 qFKomYFg==;
Date: Sat, 23 Nov 2024 22:31:50 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Laurent.pinchart@ideasonboard.com, aaro.koskinen@iki.fi,
 airlied@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 quic_jesszhan@quicinc.com, rfoss@kernel.org, robh@kernel.org,
 rogerq@kernel.org, simona@ffwll.ch, thierry.reding@gmail.com,
 tony@atomide.com, tzimmermann@suse.de
Subject: Re: [PATCH v3 10/10] ARM: dts: ti: omap: samsung-espresso10: Add
 initial support for Galaxy Tab 2 10.1
Message-ID: <20241123223150.28d4002b@akair>
In-Reply-To: <20241123192633.2049-1-bavishimithil@gmail.com>
References: <20241123200202.684d8bc5@akair>
 <20241123192633.2049-1-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Am Sat, 23 Nov 2024 19:26:33 +0000
schrieb Mithil Bavishi <bavishimithil@gmail.com>:

> > well, look at the schematics and see how it is wired ;-)  
> 
> Schematic mentions vddtx, vdda, vdd and vbus, so unsure about that.
> VDDTX is the one with 2.8V, VDD and VBUS are at 1.8V and VDDA is grounded,
> it just gets the input from GDNA from the same touch sensor.
> 
> > As the vendor kernel seem to
> > set i2c to gpio mode, so probably because the vio-supply is powered
> > down according to the board file you posted.
> > So it might be vio-supply only or vio and vdd-supply combined.
> > In any case document what you have seen in the vendor kernel.  
> 
> https://github.com/Unlegacy-Android/android_kernel_ti_omap4/blob/3.4/common/arch/arm/mach-omap2/board-espresso-input.c
> This just makes it more confusing. Very confused on what is what now xD.
> reg_touch_ldo_en is 2.8V which goes to VDDTX, it is gpmc_nwp.gpio_54 - TSP_LDO_ON
> ldo6 is 1.8V presumably ldo6 (VAP_IO_1.8V) which goes to VDD, VBUS.
> 
well, I think I2C bus runs at 1.8V, and there is IO_1.8V in the name,
so vio-supply should be something at 1.8V, so probably ldo6 is
vio-supply. Maybe add a remark in the comments. But then it might be
not a good idea to turn that off in suspend. if the other regulator is
kept on.

> > basically says that standard touchscreen properties are accepted below
> > rmi4-f11.   
> 
> But we do not use any of those properties. If you're talking about the
> touchscreen-size-x/y, even in the examples those are out of rmi4-f11, in
> the parent node.
>
Where do you see those examples? Here touchscreen-invert-y is below
rmi4-f11.
https://elixir.bootlin.com/linux/v6.12/source/Documentation/devicetree/bindings/input/syna,rmi4.yaml#L269

We have also the warning from dtbs_check:
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb:
synaptics-rmi4-i2c@20: Unevaluated properties are not allowed
('avdd-supply', 'touchscreen-size-x', 'touchscreen-size-y' were
unexpected)

Regards,
Andreas
