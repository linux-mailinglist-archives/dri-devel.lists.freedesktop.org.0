Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65378565B81
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:19:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE43910EDB9;
	Mon,  4 Jul 2022 16:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8223810E02D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 11:07:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBF07615F6;
 Mon,  4 Jul 2022 11:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E4F6C3411E;
 Mon,  4 Jul 2022 11:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1656932850;
 bh=ShPSNOvgzATtn2/Bsxk03dhF7u+9UjNpwSKkcGRvTT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yg7oJSBac1jklWTdfgCXuJ3ysIGEvXrqf9/zfqWj42Iyu5IX6vLXQxNYM/N8zePVv
 gl+h3HeUDHDoljmR2gePU76jeomtKSKBVHs4jLc0sVpZAXzp8rEBO43+ANIOsKdZ6Y
 UAo9IGe43RtjSE/pzqD1J5iVI+6bU5b1kL+Sse4w=
Date: Mon, 4 Jul 2022 13:07:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: szuni chen <szunichen@gmail.com>
Subject: Re: [PATCH v4 08/13] usb: typec: tcpci_mt6370: Add Mediatek MT6370
 tcpci driver
Message-ID: <YsLJ7+HiqaBTwCLg@kroah.com>
References: <20220704053901.728-1-peterwu.pub@gmail.com>
 <20220704053901.728-9-peterwu.pub@gmail.com>
 <YsKXcnys2Wa8Zz0p@kroah.com>
 <CA+hk2fYA3phYAoh+BFr0ddy9MR8Ro1WCoqBpa1UK2StwMtLyfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+hk2fYA3phYAoh+BFr0ddy9MR8Ro1WCoqBpa1UK2StwMtLyfQ@mail.gmail.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, "Krogerus,
 Heikki" <heikki.krogerus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 alice_chen@richtek.com, linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>,
 Rob Herring <robh+dt@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ChiaEn Wu <peterwu.pub@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 chiaen_wu@richtek.com, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 04, 2022 at 05:31:29PM +0800, szuni chen wrote:
> Greg KH <gregkh@linuxfoundation.org> 於 2022年7月4日 週一 下午3:32寫道：
> >
> > On Mon, Jul 04, 2022 at 01:38:56PM +0800, ChiaEn Wu wrote:
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> > >
> > > Add chip level mt6370 tcpci driver.
> >
> > What does this mean?  Please provide more information about the hardware
> > being supported here so we know how to review this.
> 
> Dear Greg,
> 
> MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery charger,
> a USB Type-C & Power Delivery (PD) controller, dual flash LED current sources,
> a RGB LED driver, a backlight WLED driver, a display bias driver and a
> general LDO for portable devices.
> 
> This driver is used for the Type-C & Power Delivery controller in
> MediaTek MT6370 IC.
> 
> If we change the commit message to
> 
> "Add MediaTek MT6370 tcpci driver.
> MediaTek MT6370 is a multi-functional IC that includes USB Type-C.
> It works with Type-C Port Controller Manager to provide USB PD and USB
> Type-C functionalities."
> 
> does this meet your requirements?

What would you want to see if you were reading a changelog text for an
unfamiliar hardware device?  More text is always better!

thanks,

greg k-h
