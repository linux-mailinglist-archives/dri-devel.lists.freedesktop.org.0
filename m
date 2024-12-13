Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 820CA9F07A0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 10:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E7E10EF75;
	Fri, 13 Dec 2024 09:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jqLxO4sz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB51510EF75
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 09:20:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E4C11A41E78;
 Fri, 13 Dec 2024 09:18:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361ACC4CED0;
 Fri, 13 Dec 2024 09:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734081623;
 bh=ZrfHL5HK6XFy4TpWd82potK2Py8Ecz/VGgykKzhsFKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jqLxO4szVs6ix1PWHfB67O1rL4ZdPrzP79AuhYQpNz5FnwfN4Cop3mwTx+5VYWf43
 2FuRKi8gX4DFF+Eo524VWdvb9EFA47aVXOsDG0TQCdORFy5BmvIVk/iCkLa1Prj1tx
 2PXdn4GdweXr9skLN/sJnu6rXvxbASfZyjQvTzqpCt56ehl6a7L5LkuEmMO9TEkjRB
 5upyrcbO3g51Oduq511RIbZzQE96ExFZ6BN5mmHzMGhEs5mlsy2/bxxf6Vvmgh+WEA
 8UmXuTtSbR/OC9bwUKLupW/kxRTWR4F9bDxQSBq8SLdLXBkncKL6KX2d3rhflOHvKB
 5Rk2yl8+kv1BA==
Date: Fri, 13 Dec 2024 10:20:21 +0100
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
Subject: Re: [PATCH v3 4/7] dt-bindings: interrupt-controller:
 brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
Message-ID: <n2ib4ofkijx36hak54i2vv5y5gh6pycsicnvjx4bzinsfoxr4l@ipefwfyxrpqa>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-4-44a7f3390331@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-4-44a7f3390331@raspberrypi.com>
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

On Thu, Dec 12, 2024 at 06:36:31PM +0000, Dave Stevenson wrote:
> Since commit 88bbe85dcd37 ("irqchip: bcm2836: Move SMP startup code to
> arch/arm (v2)") the bcm2836-l1-intc block on bcm2711 is only used as a
> base address for the smp_boot_secondary hook on 32 bit kernels. It is
> not used as an interrupt controller.
> 
> Drop the binding requirement for interrupt-controller and interrupt-cells
> to satisfy validation on this platform.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../devicetree/bindings/interrupt-controller/brcm,bcm2836-l1-intc.yaml  | 2 --
>  1 file changed, 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

