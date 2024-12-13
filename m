Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6E79F0799
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAFF10EF73;
	Fri, 13 Dec 2024 09:20:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vF+KM5OU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D28B10EF73
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:20:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A8865C68E5;
 Fri, 13 Dec 2024 09:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B2CC4CED0;
 Fri, 13 Dec 2024 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734081602;
 bh=LZTssH/ZHKTvEutuJtTjkmecZUTVtynRxVs9i48YWr0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vF+KM5OUjhNimxXTCodSJDmpIOrab7qO73ZSbulEhwBCbF8TMZrYRmOk6ulg3UuHK
 luhGa9Er4B64KWPwj1HpaVm7nnx2vyJbQ/H1VZnS4g44lK9BOcgKTk0LK+ViAGUaDD
 HDIPLfLWRHyMT1pIC78q2I2I2VJlTQJ5sn61oFK2pSOfpcmN2u/zV4Z2Le7rTb2C3P
 2lMs6SI3ZcmZg6bjW298otZ/kzlh8PmgIPJv/wFrE9fc5zgSFwBUdXGwoWyLrqXhjk
 7DAC5HWztrvL4udgF0nZpR1dJyLAboDD7K+zw0q2nj3KUmq5z1KbVDOKWL329g+GlC
 it3rFPbfTRQ6Q==
Date: Fri, 13 Dec 2024 10:19:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Eric Anholt <eric@anholt.net>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
 Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 3/7] dt-bindings: gpio: brcmstb: permit
 gpio-line-names property
Message-ID: <atzraxqm7z7trpagw2kj4xraghb323zry5cztwadqsowfafkmm@gejykzp4hjoo>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
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

On Thu, Dec 12, 2024 at 06:36:30PM +0000, Dave Stevenson wrote:
> gpio-line-names is a generic property that can be supported by any
> GPIO controller, so permit it through the binding.
> 
> It is permitted to have a variable number of GPIOs per node based
> on brcm,gpio-bank-widths, so define an arbitrary maximum number of
> items based on current users.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

