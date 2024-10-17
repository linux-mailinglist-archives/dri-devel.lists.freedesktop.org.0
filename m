Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F9A9A291E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 18:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCF610E881;
	Thu, 17 Oct 2024 16:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="N0OT5ocj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAED10E87B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 16:37:31 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6e35bf59cf6so22673957b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 09:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729183050; x=1729787850;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DcwMt17gLv7MqoX+/JhPbiFmnVIhpw/nf6IfeGl7cyo=;
 b=N0OT5ocjUHVhxnioNMlcGmcKa1o7YN6nPyx6BUdprvgtxhQEMQkLhS7murCJKpNkhw
 dvmmrtmUJOjTcIaqiLjvsZQlefPUMeiZ6c7jLwdQHvwPEzv1u35q5LCAT8pntYmBgkt7
 Kqnl+7Ru2JbwNmnwvz8ecfzGe8AtyYW/chnmYQb/mMcmXXi6MI4AuXXRuGrS+9dYVy5b
 LfnVkOPgq/MCy6S+9To8OtgLxcWEE/L8AW6okbAhL193EfA3Uu8XGIDK65/oh/eI2omV
 MJUpKrU7Cs0V/0eW3ZephxwllepwuNyA4VLjDuW6DxTyq7dHDS6hMYE+DeodcRYDI+B5
 eePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729183050; x=1729787850;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DcwMt17gLv7MqoX+/JhPbiFmnVIhpw/nf6IfeGl7cyo=;
 b=P8MdiSXrb/JJbt7jJDDLUJd4dX8LyaPe1VhkTxhfADFyIWyQGC0wlMjUMsQR1pzDf1
 9lB3Ox2dK1j7LTZC6nUJb+HZ/GY++O7KzXsVgXkkOwNETx0up1qp8B6u+ij1/jooYDqI
 ScYoRypZWMtdyk+MFpxXQ1DJEqr6FUX9szYw0wDaFNv66u50X2DbLyzyZs+uVcdpV7S1
 fdhoc5yKedtLXBuejjGRAshFlfDvQ1m27hkeWGvw3RBtzDmNB3KptfrrMM5UE+PMsI/e
 V9ocp5LNQv+rSQZR2I/SyBjb5/KZsOYVqTpXYkRsTlvYa+ZmsRhQQESLidqOjUA5Y8Kc
 oy5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyyL6HpgPo6bOxGR3gfn/jJjGl10P0oUUIKy4o4r+pGN9fATHIR3rHGpHzEy61qPrZOQ+Y71OPa4I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydAQvCzME8DW0iXntv1GptMj0jg7g4VjRjBcm9LgtAPU9eEttd
 EmklE/FJCgVXhf3NSkcRL+O7LXhAsuhwXiSvz5Rj9h6tq5M85CTsuLXjuM5caHK4qSiAMWDXkjc
 NEPPMa55jruYywKS6cYjbA6vgrkV/vfwqvD4Gww==
X-Google-Smtp-Source: AGHT+IFKFJkZvhNGmsqSih7i44Uzs72BhU+dMy/vzzAn97zycwQAf43np7+i6qz5H75vbrdAWnWjREuUMjtMO2ifRik=
X-Received: by 2002:a05:690c:3684:b0:6d6:afe9:d818 with SMTP id
 00721157ae682-6e5a3d5a24fmr32988487b3.6.1729183050259; Thu, 17 Oct 2024
 09:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntDAMq_oTM+ua0pcFroTiWkDyhXSj++oGxOq+ODajm8++Q@mail.gmail.com>
 <3f35403e-f42f-4936-9297-68b56818aeee@gmx.net>
 <20241014-warm-savvy-wrasse-ed984e@houat>
 <CAPY8ntAFzT4uBT47kDnDjEcSZXLonV-n_ixZ6L1_LAcfQPwS8Q@mail.gmail.com>
 <17f8f497-1238-4555-824b-b5a3fb699a98@gmx.net>
 <CAPY8ntBegA_L58s30F4FSO+=q78Xt5XA4kvYq38zAvsgR2DSrQ@mail.gmail.com>
 <6465bac6-9841-4f38-b9e1-48e236ada910@gmx.net>
 <CAPY8ntCzg-2vCuX0uaRD1kK5=qhH79hmtvQc=g44bD5iGwi7_w@mail.gmail.com>
 <20241017-kickass-agile-boa-dd5cd3@houat>
 <974f9525-76da-4b3a-ba94-6ac68fc542be@gmx.net>
 <20241017-icy-speedy-okapi-bebdfa@houat>
In-Reply-To: <20241017-icy-speedy-okapi-bebdfa@houat>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 17 Oct 2024 17:37:14 +0100
Message-ID: <CAPY8ntDoS4Vo1GUw7KB+QNRfdZrebYCJSw1sQPVHz=Tr6Lh49g@mail.gmail.com>
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
To: Maxime Ripard <mripard@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 17 Oct 2024 at 16:59, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Thu, Oct 17, 2024 at 05:26:46PM GMT, Stefan Wahren wrote:
> > Am 17.10.24 um 16:27 schrieb Maxime Ripard:
> > > On Wed, Oct 16, 2024 at 07:16:43PM GMT, Dave Stevenson wrote:
> > > > Hi Stefan
> > > >
> > > > On Tue, 15 Oct 2024 at 22:13, Stefan Wahren <wahrenst@gmx.net> wrote:
> > > > > Hi Dave,
> > ...
> > > > > i prepared a branch for you, which contains the latest suspend2idle patches:
> > > > >
> > > > > https://github.com/lategoodbye/linux-dev/commits/v6.12-pm/
> > > > >
> > > > > Steps:
> > > > > 1. Flash latest Raspberry Pi OS (32 bit) on SD card
> > > > > 2. Build Kernel from repo above with arm/multi_v7_defconfig
> > > > > 3. Replace Kernel, modules + DTB on SD card with build ones
> > > > > 4. add the following to confix.txt
> > > > > device_tree=bcm2837-rpi-3-b-plus.dtb
> > > > > enable_uart=1
> > > > > 5. change/add the following to cmdline.txt
> > > > > console=ttyS1,115200
> > > > > no_console_suspend=1
> > > > > 6. connect the following devices to Raspberry Pi 3 B+ :
> > > > > USB mouse
> > > > > USB keyboard
> > > > > HDMI monitor
> > > > > Debug UART adapter (USB side to PC)
> > > > > 7. Power on board and boot into X11
> > > > > 8. Change to root
> > > > > 9. Enable wakeup for ttyS1
> > > > So I remember for next time
> > > > echo enabled > /sys/class/tty/ttyS1/power/wakeup
> > > >
> > > > > 10. Trigger suspend to idle via X11 (echo freeze > /sys/power/state)
> > > > > 11. Wakeup Raspberry Pi via Debug UART
> > > > I don't get the error you are seeing, but I also don't get the display resuming.
> > > > pm has obviously killed the power to the HDMI block, and it has the
> > > > reset values in as can be seen via /sys/kernel/debug/dri/0/hdmi_regs.
> > > > Nothing in the driver restores these registers, and I'm not sure if it
> > > > is meant to do so.
> > > > Run kmstest or similar from this state and the change of mode
> > > > reprogrammes the blocks so we get the display back again.
> > > >
> > > > I've also enabled CONFIG_DRM_LOAD_EDID_FIRMWARE so that I can use your
> > > > EDID, and get the same results.
> > > >
> > > > Knee-capping the HDMI block on suspend seems an unlikely mechanism to
> > > > work reliably. On the more recent Pis there is a need to be quite
> > > > careful in disabling the pipeline to avoid getting data stuck in
> > > > FIFOs.
> > > > I feel I must be missing something here.
> > >
> > > I think we're probably missing calls to drm_mode_config_helper_suspend and
> > > drm_mode_config_helper_resume.
> >
> > Okay, i tried this and it works better (HDMI resumes fast), but it also
> > triggers a lot of WARN
>
> vc4_plane_reset deviates from the helper there:
> https://elixir.bootlin.com/linux/v6.11.3/source/drivers/gpu/drm/drm_atomic_state_helper.c#L326
>
> We should adjust it.

Yes, it looks like that WARN is inappropriate, and we should be
freeing the old state.

> > and the "doesn't support RGB ..." warnings are still there.
> >
> > I pushed my changes to the branch and attached the dmesg output.
>
> I can't help you there, it doesn't make sense to me. The EDID should be correct.

Nor can I. I've just taken the latest branch and HDMI does resume
correctly after suspend now.

We have seen monitors that do weird things on HPD when they stop
getting video and go into standby mode, so I wonder if that is the
case with your monitor.

I do wonder if the HDMI part of the display is the correct place to
handle drm_mode_config_helper_[suspend|resume]. All other users seem
to do it at the base DRM driver level, which would be vc4_drv.c.
I've done that and pushed it to
https://github.com/6by9/linux/tree/lategoodbye-suspend. That also
works for me without your changes to the HDMI side. That branch also
includes the above fix to vc4_plane_reset too.

  Dave
