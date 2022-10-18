Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE84C603300
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 21:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B515110E332;
	Tue, 18 Oct 2022 19:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB4310E332
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 19:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zofAadwxpAzXJPXxR/P8kjncD8CkuriQ0fwZK+76TSo=; b=fYtrHdjPb6AiOt5LNaIpuNumq6
 dpbAaEwZCfuh7Y8p5GQRQgHCc4JbqffsVncPI4gOVMHPUU6hlNHv5mfNbs3XCTg9OMkj+WNO3T3eE
 s3fFyTUKoTUJ8R6sif/siyqPwhsmw4yDu13KUUUDJ64nVP8TXwtKGxCYAZB4/y72AsgtBVvVm2wCw
 O4stYVsR4V4yzmNsibZTRBOoL4cRl1XvZz7EzC7asDV/KdDcUQshMI/PsnCiUzMkqE2FpYW9zVvEZ
 GShMXaP82ZvicT2sUuK3f4wQoQa5XZjjOdg3DwrIbeI8BgKmjYcwn8Zx/hpbDMTgSJDpzNABmdNg9
 am3x8kkw==;
Received: from [2a01:799:95a:cb00:cc2f:df30:b81e:38c0] (port=63305)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1okrvA-0008E6-BC; Tue, 18 Oct 2022 21:06:36 +0200
Message-ID: <544c35c3-d87f-30e7-5f6b-a64ab7f894ec@tronnes.org>
Date: Tue, 18 Oct 2022 21:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 0/2] drm/tiny: add support tft display based on
 ilitek,ili9488
To: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
References: <20221018164532.1705215-1-tommaso.merciai@amarulasolutions.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221018164532.1705215-1-tommaso.merciai@amarulasolutions.com>
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
Cc: michael@amarulasolutions.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, linuxfancy@googlegroups.com,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, kamlesh.gurudasani@gmail.com,
 linux-amarula@amarulasolutions.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 18.10.2022 18.45, skrev Tommaso Merciai:
> Hi All,
> This series  support for ilitek,ili9488 based displays like
> Waveshare-ResTouch-LCD-3.5 display. Tested on Waveshare-ResTouch-LCD-3.5
> connected to px30-evb via SPI.

There's a generic MIPI DBI SPI driver now that should work with all
these panels: drivers/gpu/drm/tiny/panel-mipi-dbi.c

More info: https://github.com/notro/panel-mipi-dbi/wiki

Noralf.

> This series is based on work done by Kamlesh Gurudasani in 2020:
> 
>  - "drm/tiny: add support for tft displays based on ilitek, ili9488"
> 
> (Thanks Kamlesh for your starting point)
> 
> Tests are done using the following tools coming from Yocto fs:
> 
>  - modetest -M "ili9488" -s 31:320x480@RG16 -v
>  - fb-test
>  - fb-rect
> 
> References:
>  - https://patchwork.kernel.org/project/dri-devel/patch/00719f68aca488a6476b0dda634617606b592823.1592055494.git.kamlesh.gurudasani@gmail.com/
>  - https://www.hpinfotech.ro/ILI9488.pdf
>  - https://www.waveshare.com/wiki/Pico-ResTouch-LCD-3.5
> 
> Regards,
> Tommaso
> 
> Tommaso Merciai (2):
>   dt-bindings: add binding for tft displays based on ilitek,ili9488
>   drm/tiny: add support for tft displays based on ilitek,ili9488
> 
>  .../bindings/display/ilitek,ili9488.yaml      |  72 +++
>  drivers/gpu/drm/tiny/Kconfig                  |  13 +
>  drivers/gpu/drm/tiny/Makefile                 |   1 +
>  drivers/gpu/drm/tiny/ili9488.c                | 440 ++++++++++++++++++
>  4 files changed, 526 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ilitek,ili9488.yaml
>  create mode 100644 drivers/gpu/drm/tiny/ili9488.c
> 
