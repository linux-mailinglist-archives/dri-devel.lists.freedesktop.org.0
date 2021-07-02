Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B82013B9C02
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 07:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505B66E046;
	Fri,  2 Jul 2021 05:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E53DF6E046
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 05:27:07 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 202fc727-daf6-11eb-9082-0050568c148b;
 Fri, 02 Jul 2021 05:27:00 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 1B5D2194B00;
 Fri,  2 Jul 2021 07:27:10 +0200 (CEST)
Date: Fri, 2 Jul 2021 07:27:03 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/panel: Fix up DT bindings for Samsung lms397kf04
Message-ID: <YN6jpyVpw/viLt2g@ravnborg.org>
References: <20210701213618.3818821-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210701213618.3818821-1-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Thu, Jul 01, 2021 at 11:36:18PM +0200, Linus Walleij wrote:
> Improve the bindings and make them more usable:
> 
> - Pick in spi-cpha and spi-cpol from the SPI node parent,
>   this will specify that we are "type 3" in the device tree
>   rather than hardcoding it in the operating system.
> - Drop the u32 ref from the SPI frequency: comes in from
>   the SPI host bindings.
> - Make spi-cpha, spi-cpol and port compulsory.
> - Update the example with a real-world SPI controller,
>   spi-gpio.
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Looks good,
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
