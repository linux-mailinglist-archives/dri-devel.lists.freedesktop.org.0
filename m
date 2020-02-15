Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7DC15FBD4
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2020 01:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052016E89A;
	Sat, 15 Feb 2020 00:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98C36E89A
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 00:58:05 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id l14so5132158qvu.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 16:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1cKFrJvxjBZmwV8fx4PYPqMr+d+UV5RB12ZA7bxHkY0=;
 b=TeSq9Nlzf7M/ZtJ8VOaje5NhgoW8Yeqrn8llHTbkbSXb5O/a1WCI5M5AZcp131CFwf
 13Arnsb5ipnKvw44LV/bDy99jaw3XQ6+lrSgP3r47jcFBAANti4hct/FKSVSzETMGn1s
 g5c5h0yzaGpiilE+3o2Xg2CjsUeE+cvpiSA/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1cKFrJvxjBZmwV8fx4PYPqMr+d+UV5RB12ZA7bxHkY0=;
 b=QBl1e3pdGx6gJPkNj5oQ9NCtYf2IFol1NahGzJK/qwZoD8jtN+/FFzFVGqKUxyISCN
 C68NDAF0S/UOzLi5yWIQ4MfhMmwXnr5Wvp9DF4iCa1KYMZ/HHaGXTUIGdCM6TI2Ry6bY
 7lQM6i8Hxg2zNdPtlS1uTtV+xMpblG6M5eeAA8nA1+uImEhTDDdr/TPHyG8tOrbp73nP
 3eFBJaJgYXKToWkIP2MGNdGLCtcKvyGy3zi/UzTDJqY50EZ/laRO/jo2qzN9t/OwhUWU
 EEttYnA2oodDlPgQt3f7V3pD/W/egj2HGSGk4YuSG+yeA48Fd4QOQ/wUo2oQ2MkQkRBB
 +bSg==
X-Gm-Message-State: APjAAAWlYnksDoYMSSa5GcwYiJCASNpDl4KgjqCKOzlB4DU0rWUyPsT2
 6fANsctQUSI6J3MMwCaJSSl5RiSX6jWXgB742s/fsA==
X-Google-Smtp-Source: APXvYqzCBMYNJm+5z3VItZNU8GREjvs8qxBPDVO54pJ2EWZ9LKE1F+BAhKKuBrQstARpdGDLibG5Ehxxqpzcf4gxABI=
X-Received: by 2002:a05:6214:531:: with SMTP id
 x17mr4638090qvw.156.1581728284775; 
 Fri, 14 Feb 2020 16:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20200213145416.890080-1-enric.balletbo@collabora.com>
 <20200213145416.890080-2-enric.balletbo@collabora.com>
 <CA+E=qVffVzZwRTk9K7=xhWn-AOKExkew0aPcyL_W1nokx-mDdg@mail.gmail.com>
In-Reply-To: <CA+E=qVffVzZwRTk9K7=xhWn-AOKExkew0aPcyL_W1nokx-mDdg@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Sat, 15 Feb 2020 08:57:53 +0800
Message-ID: <CANMq1KCAp6fYEqX3udxUXi+zEgjSy_FddDngDwriB8D-gAj=YQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7688: Add anx7688 bridge driver
 support
To: Vasily Khoruzhick <anarsoul@gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Torsten Duwe <duwe@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 15, 2020 at 5:36 AM Vasily Khoruzhick <anarsoul@gmail.com> wrote:
>
> On Thu, Feb 13, 2020 at 6:54 AM Enric Balletbo i Serra
> <enric.balletbo@collabora.com> wrote:
> >
> > From: Nicolas Boichat <drinkcat@chromium.org>
> >
> > ANX7688 is a HDMI to DP converter (as well as USB-C port controller),
> > that has an internal microcontroller.
> >
> > The only reason a Linux kernel driver is necessary is to reject
> > resolutions that require more bandwidth than what is available on
> > the DP side. DP bandwidth and lane count are reported by the bridge
> > via 2 registers on I2C.
>
> It is true only for your particular platform where usb-c part is
> managed by firmware. Pinephone has the same anx7688 but linux will
> need a driver that manages usb-c in addition to DP.
>
> I'd suggest making it MFD driver from the beginning, or at least make
> proper bindings so we don't have to rework it and introduce binding
> incompatibilities in future.

If that helps for the binding, ANX7688 is indeed a MFD (TCPC, HDMI to
DP converter, USB-C mux between USB 3.0 lanes and the DP output of the
embedded converter), with 2 I2C addresses:
- 0x2c is the TCPC/mux, used by the Embedded Controller [1] on Chrome
OS, and the code in this patch (my understanding is that lane count/BW
registers in the kernel driver below may only be available to FW on
Chromebooks).
- 0x28:
    - Used to update the embedded FW in the anx7688 (on Chrome OS we
do this in depthcharge [2]). This is a EEPROM-based FW (so even
without implementing this, it'll usually "just work").
    - Used to workaround some TCPC issues (see [1] again).

[1] EC driver: https://chromium.googlesource.com/chromiumos/platform/ec/+/refs/heads/master/driver/tcpm/anx7688.c
[2] depthcharge driver to update ANX7688 FW:
https://chromium.googlesource.com/chromiumos/platform/depthcharge/+/master/src/drivers/ec/anx7688/anx7688.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
