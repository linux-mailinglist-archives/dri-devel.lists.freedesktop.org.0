Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E20109A1163
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 20:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8468710E75E;
	Wed, 16 Oct 2024 18:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="tzhx3q5b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C038910E75E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 18:16:59 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-6e330b7752cso9278597b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 11:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729102619; x=1729707419;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g3HglY1GTFqNadxgbdOl+92uQVdMxV3swkJcCWuLvNg=;
 b=tzhx3q5bOMaJe8RnVG4C/BoZNUbTyj9EwoCthvVLfyqecS7iwKI0uQ8lPare0MDdJi
 nZe4uZ5EfB107067XqtTCYiANDNwbGAD0GAk78X0ZEk+rS2MIKwCZ7oOkw47hUjOIPpv
 heKSYsNGQ+phvb/48lziyjIt5Whh9wcmQwfk8tLVMem5qUGeKA3g5ysN2OjuQvhN8mXD
 Fyvk3tw+rLV5HeLeD4bY2yhj20h+0gb50y9oC078YrM9FThvcxZv6aBWyG4VDeNczOq1
 DZjr0qfxKQImePo+UjyR2gn13tu3bhJVN1tJ/9UzMvXeu2lIpjzFvKSLndzD41NB+rdA
 xTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729102619; x=1729707419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g3HglY1GTFqNadxgbdOl+92uQVdMxV3swkJcCWuLvNg=;
 b=nbp+oYY+wOMi96NzXDcp5XIiZaMj2+jDpQd1bOMCNoyp57rdWxH+Gnao9VJLfUXXNc
 6gd9c+u33pOAgvU2td2lG3qizMgJaHNvxsJKKj4VlPcl0EzLy5MBKCEbexkxgIl0xG59
 WHgs/bgpK7PxVuQnBWSqH3HJT8yD0wbzEZz1xN2/I/b4aS6KTJGcjQo2jAvSS+DVjFmR
 PHmGXEp4m2SftRfPnYo0RWAQ4WRC+dIbowFRe7b9TDCminhgJZHKnx51UUuZY58RjE9G
 0qIz2JpL1dLIdGVpR+O11xYyOiHv5u3xQP4Ro+uv0vd80urAosGWHbGfWCUsnVjD4Nzf
 8jKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZxPyaLTqYFrVTjh3mTynzjvhwzfGRFVXGYLaIzI3UMkAG0fESDsrlti8Xx/P7IxT+hRm18KJ9XJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy44MstnvBfhOUKic0SDp64HW/BMkHMuqpypOfHwkCIcVgD/30X
 DbIpcq72puKAcUQAiTe+xIbj0qepJR546ALgHvj4s8QZX9+AkFthzwcfNJULtCILSbQn1kWR3vL
 YRnAYLeLLxJIh19b5Cm9JyevGz+Y38o3ofjBaTA==
X-Google-Smtp-Source: AGHT+IFFDoWWqiv9q5vT0z+7Gqw6F6FicdHzgQ548NMk+8CNmOko6iXyh9Ziir73QlZOJdLMiz6AZmnXo06YAwY7YoE=
X-Received: by 2002:a05:690c:e07:b0:6e2:1c94:41f8 with SMTP id
 00721157ae682-6e5a3d931demr6862777b3.10.1729102618789; Wed, 16 Oct 2024
 11:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <c657d3e9-e4fb-4dac-a611-45655511e500@gmx.net>
 <CAPY8ntDAMq_oTM+ua0pcFroTiWkDyhXSj++oGxOq+ODajm8++Q@mail.gmail.com>
 <3f35403e-f42f-4936-9297-68b56818aeee@gmx.net>
 <20241014-warm-savvy-wrasse-ed984e@houat>
 <CAPY8ntAFzT4uBT47kDnDjEcSZXLonV-n_ixZ6L1_LAcfQPwS8Q@mail.gmail.com>
 <17f8f497-1238-4555-824b-b5a3fb699a98@gmx.net>
 <CAPY8ntBegA_L58s30F4FSO+=q78Xt5XA4kvYq38zAvsgR2DSrQ@mail.gmail.com>
 <6465bac6-9841-4f38-b9e1-48e236ada910@gmx.net>
In-Reply-To: <6465bac6-9841-4f38-b9e1-48e236ada910@gmx.net>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 16 Oct 2024 19:16:43 +0100
Message-ID: <CAPY8ntCzg-2vCuX0uaRD1kK5=qhH79hmtvQc=g44bD5iGwi7_w@mail.gmail.com>
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Maxime Ripard <mripard@kernel.org>,
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

Hi Stefan

On Tue, 15 Oct 2024 at 22:13, Stefan Wahren <wahrenst@gmx.net> wrote:
>
> Hi Dave,
>
> Am 15.10.24 um 11:32 schrieb Dave Stevenson:
> > On Mon, 14 Oct 2024 at 22:16, Stefan Wahren <wahrenst@gmx.net> wrote:
> >>
> >> Am 14.10.24 um 12:54 schrieb Dave Stevenson:
> >>> On Mon, 14 Oct 2024 at 10:04, Maxime Ripard <mripard@kernel.org> wrote:
> >>>> Hi,
> >>>>
> >>>> On Sun, Oct 13, 2024 at 09:57:58PM GMT, Stefan Wahren wrote:
> >>>>> Am 13.10.24 um 21:11 schrieb Dave Stevenson:
> >>>>>> Hi Stefan.
> >>>>>>
> >>>>>> On Sun, 13 Oct 2024, 18:19 Stefan Wahren, <wahrenst@gmx.net> wrote:
> >>>>>>
> >>>>>>       Hi,
> >>>>>>
> >>>>>>       i recently switch for my suspend2idle tests from Raspberry Pi Bullseye
> >>>>>>       to Bookworm. After that testing suspend2idle shows a new warning
> >>>>>>       which i
> >>>>>>       never saw before:
> >>>>>>
> >>>>>>       HDMI Sink doesn't support RGB, something's wrong.
> >>>>>>
> >>>>>>
> >>>>>> Can you provide the edid of your display please?
> >> ...
> >>>>>
> >>>>> The failure is coming from sink_supports_format_bpc()[1], but the flag
> >>>>> for DRM_COLOR_FORMAT_RGB444 should have been set from
> >>>>> update_display_info()[2] parsing the EDID.
> >>>>>
> >>>>> Loading that EDID in via drm.edid_firmware has given me a console at
> >>>>> 1920x1200@60 without any issues, so I'm a little confused as to what
> >>>>> is going on.
> >> Since this warning only occurs on resume and not during normal boot, i
> >> would assume there is no issue with EDID. Maybe the flag get lost. I
> >> should have mention that X11 doesn't recover in this case and the
> >> display stays black.
> > Ah, I hadn't realised you meant it was only on resume that it didn't
> > come back up.
> >
> > I suspect you're right that the state gets lost somehow. It may be
> > triggered by the returning of connector_status_unknown on the
> > connector, but haven't traced it back.
> >
> > If I pick up your patches, what do I need to add to replicate this?
> i prepared a branch for you, which contains the latest suspend2idle patches:
>
> https://github.com/lategoodbye/linux-dev/commits/v6.12-pm/
>
> Steps:
> 1. Flash latest Raspberry Pi OS (32 bit) on SD card
> 2. Build Kernel from repo above with arm/multi_v7_defconfig
> 3. Replace Kernel, modules + DTB on SD card with build ones
> 4. add the following to confix.txt
> device_tree=bcm2837-rpi-3-b-plus.dtb
> enable_uart=1
> 5. change/add the following to cmdline.txt
> console=ttyS1,115200
> no_console_suspend=1
> 6. connect the following devices to Raspberry Pi 3 B+ :
> USB mouse
> USB keyboard
> HDMI monitor
> Debug UART adapter (USB side to PC)
> 7. Power on board and boot into X11
> 8. Change to root
> 9. Enable wakeup for ttyS1

So I remember for next time
echo enabled > /sys/class/tty/ttyS1/power/wakeup

> 10. Trigger suspend to idle via X11 (echo freeze > /sys/power/state)
> 11. Wakeup Raspberry Pi via Debug UART

I don't get the error you are seeing, but I also don't get the display resuming.
pm has obviously killed the power to the HDMI block, and it has the
reset values in as can be seen via /sys/kernel/debug/dri/0/hdmi_regs.
Nothing in the driver restores these registers, and I'm not sure if it
is meant to do so.
Run kmstest or similar from this state and the change of mode
reprogrammes the blocks so we get the display back again.

I've also enabled CONFIG_DRM_LOAD_EDID_FIRMWARE so that I can use your
EDID, and get the same results.

Knee-capping the HDMI block on suspend seems an unlikely mechanism to
work reliably. On the more recent Pis there is a need to be quite
careful in disabling the pipeline to avoid getting data stuck in
FIFOs.
I feel I must be missing something here.

  Dave
