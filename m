Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0049D9D6AF9
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 20:02:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AB610E0FA;
	Sat, 23 Nov 2024 19:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kemnade.info header.i=@kemnade.info header.b="kRjs/mEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C831810E0FA
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 19:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=3/idsCltb7XExEF3zfCfI1F96Qrzn3w6Pf9qRmMeZ88=; b=kRjs/mEI8quU8JR51yWzV6vCk9
 mwjzJZfb+f7ARjptBHmf9PxbReYerWhmgwFWPdU0k8tK6HE5/mb4vT0bf5S5rwpu+YU6nqW2p2NXf
 gMK3k5ioVQYiiDgR1c105K4r5p9p/pktb1R6a2yldjfchH9c2VIfoNexZmI3IVcFTo05BF5Li0wnd
 ZDn2PlybuUhPq3Q/WeVuzMT88Y4TTyLq1YYhZaquhUDNbC/Ggh4RqoibbDst/VTZKRifeh/9tomvo
 Yo+mwPdtUgSi7cQUtNc+CxrHUnEIG+tGfxataUsC0pQXiFcUQSMVoKszy4Xayh9xJ/04gnN64VNKz
 LQMN9KwA==;
Date: Sat, 23 Nov 2024 20:02:02 +0100
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
Message-ID: <20241123200202.684d8bc5@akair>
In-Reply-To: <20241123175259.775-1-bavishimithil@gmail.com>
References: <20241112114818.1eb238e9@akair>
 <20241123175259.775-1-bavishimithil@gmail.com>
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

Am Sat, 23 Nov 2024 17:52:58 +0000
schrieb Mithil Bavishi <bavishimithil@gmail.com>:

> > > +&i2c3 {
> > > +	touchscreen: synaptics-rmi4-i2c@20 {  
> >
> > touchscreen@20  
> Fixed, generic node names right!
> 
> > > +		avdd-supply = <&reg_touch_ldo_en>;  
> > not known in schema  
> I cannot seem to find the "vio-supply" shown in the bindings. There is
> only mention of avdd-supply and vdd-supply. I am not sure if avdd and
> vio are equivalent, hence the confusion.
> What should be the solution here?
> 
well, look at the schematics and see how it is wired ;-) 
Without schematic, it is a bit tricky. So you can look how it is used.
vdd-supply sounds like something to make the chip fully functional.
vio-supply seems to be for the io lines.  As the vendor kernel seem to
set i2c to gpio mode, so probably because the vio-supply is powered
down according to the board file you posted.
So it might be vio-supply only or vio and vdd-supply combined.
In any case document what you have seen in the vendor kernel.

> > Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml:
> > horizontal resolution of touchscreen (maximum x coordinate reported + 1)  
> 
> > So this touchscreen reports max 1278?  
> 
> Fixed it as well, 1280 and 800 respectively.
> https://github.com/Unlegacy-Android/android_kernel_ti_omap4/blob/3.4/common/arch/arm/mach-omap2/board-espresso-input.c#L264
> 
> > And these things belong below rm4-f11 according to
> > Documentation/devicetree/bindings/input/syna,rmi4.yaml  
> 
> I did not quite understand what you mean by this. I checked the bindings 
> and a few examples, there is nothing "below" rmi4-f11.
> 
this part of the binding description
patternProperties:
  "^rmi4-f1[12]@1[12]$":
    type: object
    unevaluatedProperties: false
    $ref: /schemas/input/touchscreen/touchscreen.yaml#
    description:

basically says that standard touchscreen properties are accepted below
rmi4-f11. 

In the example you have:
           rmi4-f11@11 {
                reg = <0x11>;
                touchscreen-inverted-y;
                syna,sensor-type = <2>;
            };

Regards,
Andreas
