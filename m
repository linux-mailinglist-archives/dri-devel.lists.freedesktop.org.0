Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89188605855
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 09:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA7310E3B6;
	Thu, 20 Oct 2022 07:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr
 [80.12.242.26])
 by gabe.freedesktop.org (Postfix) with ESMTP id 85A2810E74E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 21:21:22 +0000 (UTC)
Received: from sopl295.home ([109.220.248.156]) by smtp.orange.fr with ESMTPA
 id lGNoo1NB2g7y2lGNpocFOd; Wed, 19 Oct 2022 23:13:51 +0200
X-ME-Helo: sopl295.home
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 19 Oct 2022 23:13:51 +0200
X-ME-IP: 109.220.248.156
From: Robert Jarzmik <jarzmik.robert@orange.fr>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 00/30] ARM: pxa: remove all unused boards&drivers
In-Reply-To: <20221019161831.3864786-1-arnd@kernel.org> (Arnd Bergmann's
 message of "Wed, 19 Oct 2022 18:17:53 +0200")
References: <20221019161831.3864786-1-arnd@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (darwin)
X-URL: http://belgarath.falguerolles.org/
Date: Wed, 19 Oct 2022 23:13:48 +0200
Message-ID: <m2r0z3h5yr.fsf@sopl295.home>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 20 Oct 2022 07:21:18 +0000
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
Cc: alexandre.belloni@bootlin.com, linux-usb@vger.kernel.org, vigneshr@ti.com,
 lgirdwood@gmail.com, viresh.kumar@linaro.org, ulf.hansson@linaro.org,
 linux@dominikbrodowski.net, perex@perex.cz, wsa+renesas@sang-engineering.com,
 patches@opensource.cirrus.com, linux-mtd@lists.infradead.org,
 philipp.zabel@gmail.com, miquel.raynal@bootlin.com,
 damien.lemoal@opensource.wdc.com, kernel@wantstofly.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org, brgl@bgdev.pl,
 lee@kernel.org, linux@armlinux.org.uk, marek.vasut@gmail.com,
 stern@rowland.harvard.edu, lost.distance@yahoo.com, slapin@ossfans.org,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-gpio@vger.kernel.org, broonie@kernel.org, sre@kernel.org,
 linux-fbdev@vger.kernel.org, tiwai@suse.com,
 linux-arm-kernel@lists.infradead.org, balbi@kernel.org,
 mkpetch@internode.on.net, s.shtylyov@omp.ru, linux-ide@vger.kernel.org,
 jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
 dmitry.torokhov@gmail.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, sudipm.mukherjee@gmail.com,
 linux-renesas-soc@vger.kernel.org, gregkh@linuxfoundation.org,
 alsa-devel@alsa-project.org, deller@gmx.de, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
...zip...

> A good number of drivers become impossible to select after this, so
> each of these also get dropped. I'm including the driver patches in the
> series here and can either merge them through the soc tree, or they
> can get picked up by the individual subsystem maintainers. Since both
> the platform and the drivers get removed, the order should not matter.
This part is a bit ... bothering.
I at least identified these :
>  delete mode 100644 drivers/input/touchscreen/wm9705.c
>  delete mode 100644 drivers/input/touchscreen/wm9712.c
>  delete mode 100644 drivers/input/touchscreen/wm9713.c
>  delete mode 100644 drivers/input/touchscreen/wm97xx-core.c
>  delete mode 100644 drivers/mfd/wm97xx-core.c
>  delete mode 100644 sound/ac97/bus.c
>  delete mode 100644 sound/ac97/codec.c
>  delete mode 100644 sound/ac97/snd_ac97_compat.c

For the existing platforms working with devicetree support (mioa701 for
example), the wm9713 was properly used, providing both sound support and input
touchscreen.
So was the a97 part, providing a framework to make the wm9713 work.

So I'm wondering how the choice to chop these drivers was done, and it is
necessary to remove them. If so, maybe pxa support in the kernel should be
removed all together, as people playing with it loose part of the working DT
platforms they had.

As for the removal of defconfigs and arch-pxa, sure, this was PXA's destiny.

Cheers.

--
Robert

PS: If this mail is sent twice, sorry in advance, my mailer is a bad mood
lately.
