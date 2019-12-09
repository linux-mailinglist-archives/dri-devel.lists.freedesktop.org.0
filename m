Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7E5118270
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85ADE89DAB;
	Tue, 10 Dec 2019 08:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDA26E143
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:38:29 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id z14so2862275qkg.9
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 06:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H7XZjgL3g7KTwVnmufmCC7R6OVK7fHUfMBsGrRCsy1I=;
 b=UnqlV9gQIodeEiMkvWAZgaYU12yntYX3jw83zfinkFdaoCjrGa13NrFjSaMRF4enzO
 ZEoRx3U62+07LE1c0XeEr7Imkg7qlSnZtktjCWrj1ggRQLQmam1DmOID7VHcwh4GhLHb
 NeqMHl/BCMHfsMKT0PO6fRkp3PuMWmmbb9jvvgIF4Zd41hrZgER4mC+IvxJF/wwUjU2c
 XeAOb3q9NcP+2f8uQvs00RvKGzE0KECrVuZotHBFoBdblnfM36t+8Il5kIGRwThIFAa9
 r5+5Mis2aUsJk+fmTRx1XIxCpqPAKPuD0jd6luoN/JArA7vCpWbdTr/fA7y/dn6UiBBZ
 eZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H7XZjgL3g7KTwVnmufmCC7R6OVK7fHUfMBsGrRCsy1I=;
 b=BeWBZJUny2iaI7u3TGpzvGgjmCGYwqxOEp60kMAI61jc7+vZeaIzYylpyliaCv4rWU
 hmlC30S0vsOviVvLwIms8bo6SRgZjFuznR+e31Y5Ezk1Oq/rUguLnPre2e4weKLTbuPM
 SA9+HJW36vfMtHxh5fVVsrMNlQXn1U87IJOnqPdElsKEwTkmUyrOLxYCkkymqTQXL8Lx
 vjN2TnvvIsaIha+hax2hHRsxKmHov2qzl6IKLWSYwUYIcZ1F+zQqEUL/v1kFXWflo7f+
 jErE8hOI5//s2AY/c8IOyAuoXgCFcLkxfMUwDmlsC/51AJu3zl6xhRz2i7e6qReQNmBG
 Q37g==
X-Gm-Message-State: APjAAAXkP2MrGzrJA5w3OVL6E5xdHZgT+SV3XlIvspAKOdMScl25nH8A
 Uibnn9anadQyU48DZGwN5ePo1h/EiNXKiQ8xEGI=
X-Google-Smtp-Source: APXvYqzlFJP9WaH1O2M6iL/BZjsOlSKfCs3yxsz+r1qvHrFPWA2T29Qt5Dtrlg1uDgPPfOE1aWDrHBmMcj0X8Ct1JWw=
X-Received: by 2002:a37:9245:: with SMTP id u66mr28555486qkd.102.1575902308099; 
 Mon, 09 Dec 2019 06:38:28 -0800 (PST)
MIME-Version: 1.0
References: <20191209050857.31624-1-andrew.smirnov@gmail.com>
 <20191209050857.31624-3-andrew.smirnov@gmail.com>
 <45afdff8-4f91-f5be-a299-d0c7fed71ea7@ti.com>
In-Reply-To: <45afdff8-4f91-f5be-a299-d0c7fed71ea7@ti.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 9 Dec 2019 06:38:16 -0800
Message-ID: <CAHQ1cqH8XTYysd1Nv2Q0EziXfJWeemZeyyZZ3OKoCv8=XrHZWA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: tc358767: Expose test mode
 functionality via debugfs
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
Cc: Cory Tusar <cory.tusar@zii.aero>,
 linux-kernel <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 9, 2019 at 1:38 AM Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
>
> (Cc'ing Daniel for the last paragraph)
>
> On 09/12/2019 07:08, Andrey Smirnov wrote:
> > Presently, the driver code artificially limits test pattern mode to a
> > single pattern with fixed color selection. It being a kernel module
> > parameter makes switching "test pattern" <-> "proper output" modes
> > on-the-fly clunky and outright impossible if the driver is built into
> > the kernel.
>
> That's not correct, /sys/module/tc358767/parameters/test is there even if the driver is built-in.
>

True, I'll drop the "impossible" part of the descrption. Having to
unbind and bind device to the driver to use that parameter definitely
falls under "clunky" for me still, so I'll just stick to that in the
description.

> I think the bigger problems are that there's just one value, even if there are multiple devices, and
> that with kernel parameter the driver can't act on it dynamically (afaik).
>
> > To improve the situation a bit, convert current test pattern code to
> > use debugfs instead by exposing "TestCtl" register. This way old
> > "tc_test_pattern=1" functionality can be emulated via:
> >
> >      echo -n 0x78146302 > tstctl
> >
> > and switch back to regular mode can be done with:
> >
> >      echo -n 0x78146300 > tstctl
>
> In the comment in the code you have 0 as return-to-regular-mode.

Both should work, but I'll modify commit message to match the code.

>
> With my setup, enabling test mode seems to work, but when I return to regular mode, the first echo
> results in black display, but echoing 0 a second time will restore the display.
>
> Hmm, actually, just echoing 0 to tstctl multiple times, it makes the screen go black and then
> restores it with every other echo.
>

Strange, works on my setup every time. No error messages in kernel log
I assume? Probably unrelated, but when you echo "0" and the screen
stays black, what do you see in DP_SINK_STATUS register:

dd if=/dev/drm_dp_aux0 bs=1 skip=$((0x205)) count=1 2>/dev/null | hexdump -Cv

? Note that this needs CONFIG_DRM_DP_AUX_CHARDEV to be enabled.

> > +     debugfs = debugfs_create_dir(dev_name(dev), NULL);
> > +     if (!IS_ERR(debugfs)) {
> > +             debugfs_create_file_unsafe("tstctl", 0200, debugfs, tc,
> > +                                        &tc_tstctl_fops);
> > +             devm_add_action_or_reset(dev, tc_remove_debugfs, debugfs);
> > +     }
> > +
>
> For me this creates debugfs/3-000f/tstctl. I don't think that's a clear or usable path, and could
> even cause a name conflict in the worst case.
>

I agree on usability aspect, but I am not sure I can see how a
conflict can happen. What scenario do you have in mind that would
cause that? My thinking was that the combination of I2C bus number +
I2C address should always be unique on the system, but maybe I am
missing something?

> Not sure what's a good solution here, but only two semi-good ones come to mind: have it in sysfs
> under the device's dir,

I'm fine with this option if it is the only path forward, but, given a
choice, I would _really_ rather not go the sysfs route.

Thanks,
Andrey Smirnov
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
