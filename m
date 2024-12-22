Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE989FA4B7
	for <lists+dri-devel@lfdr.de>; Sun, 22 Dec 2024 09:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBB210E1D5;
	Sun, 22 Dec 2024 08:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M7rl/SuX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BE110E1D5
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Dec 2024 08:34:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3F214A40568;
 Sun, 22 Dec 2024 08:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE59C4CECD;
 Sun, 22 Dec 2024 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734856442;
 bh=yDbyvGBdhFbBbtYL7NrJkhEr0MAnlnSnZYd3unoDI28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M7rl/SuXPGhlaYVxYM+DrLi8GTmYNY3vwGUg+9HhvSx9IM0OeHyxZsGtHTyCQDg1+
 tuP0TfHKSs36Blj+KVVhGrRkMXosOhVS4THMA/9gwh2pWI7rv1oQKbQpWYjybyyE2T
 dfCREPG4BscrsRk55zDGHn4AvOFMdIzE+W6Q8aCKwlm8EyIWFo2yE63g01xyc1Hbbg
 lkaOJSLAFLksulbrhlZgprKvrCvcXi6zEZpFjczSrkmNBZ7jrX+mfULRSDHkaUZsfG
 oTftkjd6nNbCt2ghgVP7OOrAiVkGFHQFm1KcqJxea+KsuwUFVTE1Ii9UQ/1QkD0h2I
 B01KqEA/BAJtw==
Date: Sun, 22 Dec 2024 09:33:59 +0100
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
Subject: Re: [PATCH v5 1/3] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
Message-ID: <mnvl24bydpajn7dyumq7cqt6dl6iyrzk6e7rksojt3ig2f7qbc@uytpnoa4t76o>
References: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
 <20241220-dt-bcm2712-fixes-v5-1-cbbf13d2e97a@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220-dt-bcm2712-fixes-v5-1-cbbf13d2e97a@raspberrypi.com>
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

On Fri, Dec 20, 2024 at 06:11:11PM +0000, Dave Stevenson wrote:
> Commit 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> added the compatible strings for BCM2712, but missed out that the
> number of interrupts changed, and for BCM2712 the driver changes[1]
> required that the interrupts are named.

I dopn't get what "interrupts are named" means here and I kept asking
about it, so the explanation is supposed to be in commit msg. Do you
mean that driver requires it? If so, then "the driver requires
interrupt-names since commit foo ("bar")" (and use Linux commit style of
referencing commits).


>  
> Update the schema to correct the interrupt requirements for BCM2712.
> (Requirements for BCM2711 should be unchanged).
> 
> [1] Commit 0b1dbe82e051 ("drm/vc4: hdmi: Add support for BCM2712 HDMI
> controllers")

I cannot find in this commit requirement of interrupt names. There is no
call to anything requiring names. Maybe I miss some context, like other
function introduced that? Can you point me to specific line of that
patch?

Because if you refer to external_irq_controller than I fail to see how
2711 works without the names.

Best regards,
Krzysztof

