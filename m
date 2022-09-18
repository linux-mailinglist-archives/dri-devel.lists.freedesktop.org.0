Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B725BBF48
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 20:23:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29BB10E011;
	Sun, 18 Sep 2022 18:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE73E10E011
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 18:22:57 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 n23-20020a17090a091700b00202a51cc78bso4796806pjn.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 11:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=4hwpKESv9z2NKRL2hrpuvotDkJLNskH4R7fgUuDkPF4=;
 b=MDFqfoq5TVrtQ1DLmT0xWjBYSxurG6cEgSLa2HYZhJbx8Mjyt/oFGPnPBT83ov+VKe
 6wX7xlytnvHitAwF/3sYlvh2ApNaYFMGda/mttNvEzx6TTxwy4TEH5Ec/JPt4FiwAf/H
 KoL+6oBxoD69VREfZ9eALxC40vHesVEHOQx+AzxZk/fIUGgXMovhP9tRz7H+mz8zKHcf
 WR9iHpTO8jScPn0EUsHE/5bo2eMQydd1PXbFSAmax0ULF5Hkmh/szbTOmYJFZnY90ASx
 j8fe9pczjbwJLRkEXTXdUP4kAjv4L81SK+uS1ovL5jFR8f8gFYAeJ/2oKbeFzZdljwnh
 cblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=4hwpKESv9z2NKRL2hrpuvotDkJLNskH4R7fgUuDkPF4=;
 b=g3frLRcucPbgxabB0GCCU18YKwA4mg8GGa/rcYobCLNBxvNB33ltsOr6W5WZ7z2S1p
 vgwyZJrPluPOy5jffzVzBLv++6dOdKMtfYXByf1l+AMogLDB+9oOYfUJN5ULnvworVOL
 cw10EAzC4hPbVmgxdRpW5YQYev7g67k1JZtD9uZMMnOlsgyIGM3kY5JE8nyoTm0mqwp8
 C5ntmu+f9ZgOZhuMTDYwEw8zL1KxwOtlkyoq9rwOdA2qIoFLxxnz7pggtFFj1EPcIzBI
 OGdIZZUgp1cs9wTCRaGx04tiJJJqRieL8ujzZcaAXXY71T1a0LIPhWB1Uyol9gQHBmI9
 qLfg==
X-Gm-Message-State: ACrzQf2r3dNzF9jltG8g312qI5RMuXhgqjxZUBXdo58gYoNSP3FDWxDV
 rkFkSmNRQZupeoDyewHOtDcnMfg4/AXFlLqUGI2QPAHk
X-Google-Smtp-Source: AMsMyM7uaZehxubCw/55MD8BZU42YZ5IcPVfRCeq0yada+L5PGbmMUzfrYlP0Dq/8xAaHDyUIxcpvu1CSE+VR5S1mU8=
X-Received: by 2002:a17:90b:4d8e:b0:200:73b4:4da2 with SMTP id
 oj14-20020a17090b4d8e00b0020073b44da2mr27379005pjb.197.1663525377236; Sun, 18
 Sep 2022 11:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220917205920.647212-1-hdegoede@redhat.com>
In-Reply-To: <20220917205920.647212-1-hdegoede@redhat.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sun, 18 Sep 2022 20:22:45 +0200
Message-ID: <CAMeQTsZ3Z76QFWgCVPxKdaZ+=KK-9Dqxx9R0G3fs8i3Bob7B6Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] drm/gma500: Backlight handling changes
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 17, 2022 at 10:59 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> Here is a patch-series changing gma500's backlight handling to match
> the changes done to the other major x86 GPU drivers in the just landed
> backlight detection refactor patch series:
> https://lore.kernel.org/dri-devel/261afe3d-7790-e945-adf6-a2c96c9b1eff@redhat.com/
>
> The main goal is here is to only register one backlight class device instead
> of registering both "acpi_video0" and "psb-bl" backlight class devices;
> in preparation for implementing the new backlight userspace-API from:
> https://lore.kernel.org/dri-devel/b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com/

Hi Hans,

Quite some time ago I wrote a backlight driver [1] for a MacBook to
work around an issue in the i915 driver. My driver spoke directly to
an external backlight driver chip. By doing so I could turn off the
signal coming from the GPU and instead program my own PWM value
directly. I remember it being a bit tricky to make my driver get
priority over the i915 driver. Not sure what the actual issue was but
I did get it to work properly in the end (perhaps with an xorg.conf
change).

I understand that this is a corner case but I'm just curious how/if
this can be handled with the new API. Is it possible to kick out an
existing non-acpi backlight driver if you know yours is better?

[1] https://github.com/patjak/mba6x_bl

>
> Changes in v2:
> - Add "Use backlight_get_brightness() to get the brightness" patch
>
> Changes in v3:
> - Fix unused variable warnings when CONFIG_BACKLIGHT is not selected by
>   marking the 2 variables as  __maybe_unused.

This looks good to me. I don't have access to my DIM setup in a couple
of days so please push these yourself if possible.

For the entire series:
Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

>
> Regards,
>
> Hans
>
>
> Hans de Goede (5):
>   drm/gma500: Refactor backlight support (v2)
>   drm/gma500: Change registered backlight device type to raw/native
>   drm/gma500: Use backlight_get_brightness() to get the brightness
>   drm/gma500: Don't register backlight when another backlight should be
>     used
>   drm/gma500: Call acpi_video_register_backlight()
>
>  drivers/gpu/drm/gma500/backlight.c       | 102 +++++++++++++++--------
>  drivers/gpu/drm/gma500/cdv_device.c      |  50 ++---------
>  drivers/gpu/drm/gma500/oaktrail_device.c |  65 ++-------------
>  drivers/gpu/drm/gma500/opregion.c        |   6 +-
>  drivers/gpu/drm/gma500/psb_device.c      |  73 +---------------
>  drivers/gpu/drm/gma500/psb_drv.c         |  15 +---
>  drivers/gpu/drm/gma500/psb_drv.h         |  13 +--
>  7 files changed, 97 insertions(+), 227 deletions(-)
>
> --
> 2.37.3
>
