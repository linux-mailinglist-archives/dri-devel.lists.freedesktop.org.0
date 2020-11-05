Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7172A917B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8C06EE2D;
	Fri,  6 Nov 2020 08:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8586E158
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 18:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1604602574;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=QF9/07bKJVwikm1msKuGv8fTcsBd1U+6AnyYpgnIpZU=;
 b=CQmhklLsUlBWwIKbB7dBGZWBGMNA9hTx2z48GARK6jJ5Zr2QuDADhYWWrHLufflx85
 vv+sOOGt2AEX73mGQY+6hHa1o4ejp6Dbu44RgpZURoOs2LX1HJiLp6aCR913L4t4r+WW
 EffM9uKoUFRh3xwBMc84pNlUVJZ1ewEML4oW0q97GlpcrRflnvOgQxYoveLoH4yb/hiH
 Pukuajw7W5lxK67QYBV1+wDVvZyv25NpjdIi7quG3Yr8Dd8lqBkyKGOXGF2V3O3NP/hC
 dNu/IwsUHjLTh4jbUqza83Qwr0V74lnL4CO5KdE+2PoBFrVx/r5wDHtCUFt0DmgsUvKI
 yX0w==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlSfXA0MwM0="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.3.2 DYNA|AUTH)
 with ESMTPSA id L07f74wA5Iu10lV
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Thu, 5 Nov 2020 19:56:01 +0100 (CET)
Subject: Re: [PATCH v3 00/56] Convert DSI code to use drm_mipi_dsi and
 drm_panel
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com>
Date: Thu, 5 Nov 2020 19:56:00 +0100
Message-Id: <837EA533-9946-43B3-B058-69060EC43981@goldelico.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <61C04176-4654-4D2D-A55B-31FBB6D2E5AA@goldelico.com>
 <fcbc8488-5861-8e51-0f86-1ed6498083f7@ti.com>
 <579243AA-014A-411B-9014-F5846C9B8137@goldelico.com>
 <ab33baff-dd8c-2ee0-6f89-35aa4df7b9cf@ti.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> Am 05.11.2020 um 19:28 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
> 
> On 05/11/2020 20:14, H. Nikolaus Schaller wrote:
>> 
>>> Am 05.11.2020 um 18:36 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
>>> 
>>> Hi,
>>> 
>>> On 05/11/2020 19:15, H. Nikolaus Schaller wrote:
>>> 
>>>> Next, I migrated my long waiting mipi_dsi/drm_panel driver conversion for
>>>> the panel of the Pyra handheld (omap 5 based) to compile on 5.10-rc2. And
>>>> I followed the latest existing panel-orisetech-otm8009a.c which uses a
>>>> similar video mode controller and mipi-dsi.
>>>> 
>>>> That one seems to be used by arch/arm/boot/dts/stm32f469-disco.dts.
>>>> 
>>>> Unfortunately my panel driver is not even loaded by drm/omap so I can't
>>>> debug. Does this set of drm/omap drivers need a modification of the device
>>>> tree? If yes, which one?
>>> 
>>> omapdrm doesn't load the panel drivers. If not even your panel's probe is called, then it hints at
>>> DT and/or driver's compatible string issue. The panel's probe should get called even if omapdrm is
>>> not loaded at all.
>> 
>> Well, I use the same device tree that loads the old driver...
> 
> Yeah, I was mistaken above. With DSI the panel (may be) a child of the DSI host, so it will affect.
> 
> Can you give pointers to the panel driver source and relevant dts files? BOE BTL507212-W677L?

Yes. It is (now) 

drivers/gpu/drm/panel/panel-boe-btl507212-w677l.c

and

arch/arm/boot/dts/omap5-letux-cortex15-common.dtsi (for the basic dsi definitions)
arch/arm/boot/dts/pyra-display.dtsi (for the specific display)

All this is merged by some arch/arm/boot/dts/omap5-letux-cortex15-v5.3+pyra-v5.2.dts

(I know there are quite a lot of variants but it is a modular system potentially able to
accomodate a non-omap processor but the same display).

BR,
Nikolaus

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
