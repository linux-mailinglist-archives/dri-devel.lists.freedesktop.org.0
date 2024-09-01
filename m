Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16620967C18
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2024 22:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8BE10E1BB;
	Sun,  1 Sep 2024 20:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k+Wwp1Z5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCED10E1BB
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2024 20:26:47 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3df13906bcdso1365322b6e.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Sep 2024 13:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725222406; x=1725827206; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3oymSihQ9xNkijCwVP8jhm5tPehtP5i+SU6Q/ZWpPuQ=;
 b=k+Wwp1Z5/sakdPxYrxjzNQkb3CIt7s31oqOHOqFQWti9yFdDPlXd1twierWKndFks1
 QGxSOSkZl+v02X/6cxBnEHdod2BVD4qR3B5qnLCXTsagWw2FihaA2W1RBzV5XwW4GM66
 2/+8QbaVHNnmTWqCAr0aO08oQ0uFhxWOwBDb5vMasxzntexJkMEofxxkn3LtY/tW4bAi
 iEtWylz0dsVk9N9/57X6/08d6SVjBpR5FF1Ge4sVqeyvWoMxPNljnrFzKrKtuuL7WAV8
 7FlGzTy6YYsp2e+pNyveyChkuX9RuMP4/ltPR2/WYAwbugrII4YCnbxTXAK4iC6usg5z
 bAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725222406; x=1725827206;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3oymSihQ9xNkijCwVP8jhm5tPehtP5i+SU6Q/ZWpPuQ=;
 b=UnmjE3/Km4OYO5CzqFuRvl4V6wC4/QphkCckZSw3vWEZ1aedi/qbHriRTXC/hR+oxP
 lxwjPMzNmIZZRgdi0wX8mq93ddTOnD2PwurNvc4IXXF4Fkwafu0mPSkkFlCLBIYmEMpB
 fwgUksQgzXBZBZYY6pNT9ieDkGHYb6DCN9ryEvDTJjUIIVgjWFk+OZ5hqYD3F6ddZEJp
 M3eJcpwZSc9vHLLSBDYKEwTxhd3oDmpkN9OM2wHG38kAegL/YJhqFrp1s5rkkzvqpI6O
 MhM73pErHI86VV9MhnFwAgobWRx2CfPkbH9ZTUflu28yOdmcH48KUnwKz5oWVFIVZphC
 qDjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWG+JKnVHosogR7ooePZpwKoIiIxyuzy556pERuvIAdo2X3AuNguJDTjkOQ4FffsTBkv+U9XEhJkkg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo+ODN20KuU++fMEVymFUqAdFawWiUvY8b9wnrTJ/fMsULz7dZ
 h7byI7OuT+uqH6GwojI44pdkAjh7Z47jN3kCorByqfA32D7uduuJKIUNuJ8dRTmYuBMa8qYUiCl
 7QsDwtPEay9ntgG0A84Vlqf4V0HA=
X-Google-Smtp-Source: AGHT+IH5GQdRNg1XGvX1KjmwgNI1LydskMNdRNslrqa2X95W8gIwQ/fT9HHeAKtApyH2Fd34HjEZC1WzxJH9QOo7yiY=
X-Received: by 2002:a05:6871:284:b0:261:146b:b105 with SMTP id
 586e51a60fabf-277c824756fmr5590521fac.41.1725222406534; Sun, 01 Sep 2024
 13:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240821214052.6800-1-wahrenst@gmx.net>
 <20240821214052.6800-2-wahrenst@gmx.net>
 <7ba14fe2-38e0-414c-bc3d-62c1e70741ad@gmx.net>
In-Reply-To: <7ba14fe2-38e0-414c-bc3d-62c1e70741ad@gmx.net>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 1 Sep 2024 15:26:35 -0500
Message-ID: <CABb+yY2ay47mNzMQB0DasvnP-_EZJ7VTSoJFHtiKUySGRCXvWA@mail.gmail.com>
Subject: Re: [PATCH V3 1/9] mailbox: bcm2835: Fix timeout during suspend mode
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Doug Anderson <dianders@chromium.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Lukas Wunner <lukas@wunner.de>, Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Russell King <linux@armlinux.org.uk>, Minas Harutyunyan <hminas@synopsys.com>,
 linux-pm@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-list@raspberrypi.com, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Aug 31, 2024 at 4:19=E2=80=AFAM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
>
> Hi Jassi,
>
> Am 21.08.24 um 23:40 schrieb Stefan Wahren:
> > During noirq suspend phase the Raspberry Pi power driver suffer of
> > firmware property timeouts. The reason is that the IRQ of the underlyin=
g
> > BCM2835 mailbox is disabled and rpi_firmware_property_list() will alway=
s
> > run into a timeout [1].
> >
> > Since the VideoCore side isn't consider as a wakeup source, set the
> > IRQF_NO_SUSPEND flag for the mailbox IRQ in order to keep it enabled
> > during suspend-resume cycle.
> >
> > [1]
> > PM: late suspend of devices complete after 1.754 msecs
> > WARNING: CPU: 0 PID: 438 at drivers/firmware/raspberrypi.c:128
> >   rpi_firmware_property_list+0x204/0x22c
> > Firmware transaction 0x00028001 timeout
> > Modules linked in:
> > CPU: 0 PID: 438 Comm: bash Tainted: G         C         6.9.3-dirty #17
> > Hardware name: BCM2835
> > Call trace:
> > unwind_backtrace from show_stack+0x18/0x1c
> > show_stack from dump_stack_lvl+0x34/0x44
> > dump_stack_lvl from __warn+0x88/0xec
> > __warn from warn_slowpath_fmt+0x7c/0xb0
> > warn_slowpath_fmt from rpi_firmware_property_list+0x204/0x22c
> > rpi_firmware_property_list from rpi_firmware_property+0x68/0x8c
> > rpi_firmware_property from rpi_firmware_set_power+0x54/0xc0
> > rpi_firmware_set_power from _genpd_power_off+0xe4/0x148
> > _genpd_power_off from genpd_sync_power_off+0x7c/0x11c
> > genpd_sync_power_off from genpd_finish_suspend+0xcc/0xe0
> > genpd_finish_suspend from dpm_run_callback+0x78/0xd0
> > dpm_run_callback from device_suspend_noirq+0xc0/0x238
> > device_suspend_noirq from dpm_suspend_noirq+0xb0/0x168
> > dpm_suspend_noirq from suspend_devices_and_enter+0x1b8/0x5ac
> > suspend_devices_and_enter from pm_suspend+0x254/0x2e4
> > pm_suspend from state_store+0xa8/0xd4
> > state_store from kernfs_fop_write_iter+0x154/0x1a0
> > kernfs_fop_write_iter from vfs_write+0x12c/0x184
> > vfs_write from ksys_write+0x78/0xc0
> > ksys_write from ret_fast_syscall+0x0/0x54
> > Exception stack(0xcc93dfa8 to 0xcc93dff0)
> > [...]
> > PM: noirq suspend of devices complete after 3095.584 msecs
> >
> > Link: https://github.com/raspberrypi/firmware/issues/1894
> > Fixes: 0bae6af6d704 ("mailbox: Enable BCM2835 mailbox support")
> > Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> > Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> gentle ping

This sounds like a fix but also a part of 9 patches update. Do you
want this merged as a bugfix now or into the next window.

thanks
