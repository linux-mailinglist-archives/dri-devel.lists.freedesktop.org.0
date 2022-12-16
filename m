Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B155564EB70
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 13:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274DF10E1C2;
	Fri, 16 Dec 2022 12:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BEA10E1C2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 12:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5AfmfeYESG6MeYFVHL2Ez7Gb7C7YV1p6vQcytVlvbR8=; b=oLrgUkoOMqhMmwwV+VqS3ASPiC
 avs6057eMws7Y5e1iQbK5KwlFOLLx+dHg2QUwWqcZyve0GfDElSg+ZDaZSOVqDVsrqgEXFR7gDnIt
 O8209F8KWxYWnbq4l7OJa61DAaqHgdfLteKYNRNa1giY0rvfD+KN3/USXu+fVR/jvagXuX0csSlkR
 ixagh4dfI4nohrrxl7bZXuWKAQyW90CP6P95LUt7bmvkPJM5erfHSG1hD4AEquBxluOQIJDaXb58G
 ZUYjeQHVh/jIj6AYEseGIzOlp3weKKgNNRPWr3veTlsDV/pMskqolveww5mXKGwin+vDjyyXSbYNy
 iJfXHmWQ==;
Received: from 80.81-166-174.customer.lyse.net ([81.166.174.80]:51358
 helo=[192.168.10.61]) by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1p69qn-005oZK-E9;
 Fri, 16 Dec 2022 13:30:05 +0100
Message-ID: <a4945d6e-be05-bac1-38d2-a3154a15aa8c@tronnes.org>
Date: Fri, 16 Dec 2022 13:30:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Driver for CFAF240320X0-020T display
To: Fabio Estevam <festevam@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Maxime Ripard <mripard@kernel.org>, damien.lemoal@wdc.com
References: <CAOMZO5Ba5eNCQO9GQezbEO5RX=C7EpUSz1zjO78Ki0kD3aK2uw@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <CAOMZO5Ba5eNCQO9GQezbEO5RX=C7EpUSz1zjO78Ki0kD3aK2uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 16.12.2022 12.54, skrev Fabio Estevam:
> Hi,
> 
> Does anyone know if the Crystalfontz CFAF240320X0-020T display is
> supported in Linux?
> 
> https://www.crystalfontz.com/product/cfaf240320x0020t-2inch-240x320-color-tft
> 
> It uses a Sitronix ST7789V controller.
> 
> For the ST7789V, there is a drm driver:
> drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> 
> and also an fbtft one:
> drivers/staging/fbtft/fb_st7789v.c
> 

I see they both have the same compatible string, that's unfortunate

> Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> shows a remote-endpoint property, so I assume this only works when st7789v
> is connected via RGB parallel, correct?
> 

Yes, pixels are sent over MIPI DPI, the init/setup commands are sent
over MIPI DBI (SPI).

> On my board, the CFAF240320X0-020T is connected via SPI only, so I
> guess I should try the fbtdt driver?
> 

Many of these controllers support the MIPI DCS command set and accepts
these commands over MIPI DBI (including pixels). Mostly the DBI mode is
SPI. fbtft have support for many MIPI DBI compatible controllers and the
only thing that differs between them is the initialization commands. In
fbtft this can be overridden using the DT property init=.

There is a DRM driver that can be used with all of these controllers:
drivers/gpu/drm/tiny/panel-mipi-dbi.c. It uses a firmware file for the
init commands.

Binding:
Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
Wiki: https://github.com/notro/panel-mipi-dbi/wiki

> The arch/riscv/boot/dts/canaan/sipeed_maix_* boards use compatible =
> "sitronix,st7789v"
> 
> Do these boards have st7789v functional? Are they using the fbtft or drm
> driver?
> 

Looks like they use the fbtft driver since remote-endpoint is not set.

Noralf.

> Appreciate any suggestions.
> 
> Thanks,
> 
> Fabio Estevam
