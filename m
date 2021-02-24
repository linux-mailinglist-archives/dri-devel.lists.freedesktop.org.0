Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF40323F62
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 16:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE406EAD7;
	Wed, 24 Feb 2021 15:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83846EACF;
 Wed, 24 Feb 2021 15:11:09 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id u20so2309706iot.9;
 Wed, 24 Feb 2021 07:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U6czhus7H+eLTCGeIosqYm9oSprbhjUKqeubjvDXnb8=;
 b=C5zPlzLo7OOZQX7SNc2resR+eM3KvkWbueorGRoPkHkigEBvZTMXAJuBCjLhSIM+h8
 0Rv4h9wslh9fQ15R/T0G3WLT78g5Ji3bY2vX1X5xDak9KHVi6DlLJBlE4h5V2+6axb2w
 BTRt3SzqxVl+ZZI+RyOSkiw4yiIS+S15luNp3RITty60hJmC7UWa8gFE6+qZvlu4OT9g
 e9Amhbz135OxvgNaOK85wznHFHNHlIiQrig3V8mkbVQcq3d7bnx9HYmNJAUz4YIz9hCY
 BJBe3fqvMMmqBf/xk3bFATl6nh6FOj/PpYbfzpN10X4Yir/zvIYc7GtD0gEknuAQ+EqX
 4KLw==
X-Gm-Message-State: AOAM532CkG6wdor8FdDRlPROu9jdv5YCrnjXtALnD30WPAqxDGqdaIvO
 DjhUFicKGjNZDiEpeRtNAHNjgjShfCCD44R1U3E=
X-Google-Smtp-Source: ABdhPJyRc24r1Id6aTRsKDTPy7sXwYFuEXg8hFP/0OyrlRgDbvRK0Tcm3RHnP2uzmUAwokTVVPlKpfdWRX8WebxeQsY=
X-Received: by 2002:a05:6602:1799:: with SMTP id
 y25mr23773035iox.55.1614179468841; 
 Wed, 24 Feb 2021 07:11:08 -0800 (PST)
MIME-Version: 1.0
References: <20210119015415.2511028-1-lyude@redhat.com>
 <20210119015415.2511028-2-lyude@redhat.com>
 <YDUN+Re/alMVL0Zn@pflmari>
 <CAKb7UvhFkw23so-a4JKLzpQLhphzjzarOy-9h+FiKP-aAC=4xw@mail.gmail.com>
 <YDUg/9fjsvTkRUqr@pflmari>
 <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
 <YDUkfjDA4xLJlxE5@pflmari> <YDUr2OGDsxDyC0l2@pflmari>
 <CAKb7UvjmdgS536tNzisomi_oXOGk3Q+anp0AfPvA8OruU_9m5Q@mail.gmail.com>
 <YDYXiTm7MDXgYT7H@pflmari>
In-Reply-To: <YDYXiTm7MDXgYT7H@pflmari>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 24 Feb 2021 10:10:57 -0500
Message-ID: <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor size to
 userspace
To: Alex Riesen <alexander.riesen@cetitec.com>, Simon Ser <contact@emersion.fr>
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+emersion, -various people and lists who definitely don't care]

On Wed, Feb 24, 2021 at 4:09 AM Alex Riesen
<alexander.riesen@cetitec.com> wrote:
>
> Ilia Mirkin, Tue, Feb 23, 2021 19:13:59 +0100:
> > On Tue, Feb 23, 2021 at 11:23 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > >
> > >     $ xrandr  --listproviders
> > >     Providers: number : 1
> > >     Provider 0: id: 0x68 cap: 0x7, Source Output, Sink Output, Source Offload crtcs: 4 outputs: 5 associated providers: 0 name:nouveau
> > >
> > > And yes, the cursor looks good in v5.11 even without reverting the commit.
> >
> > FWIW it's not immediately apparent to me what grave error modesetting
> > is committing in setting the cursor. The logic looks perfectly
> > reasonable. It's not trying to be fancy with rendering the cursor/etc.
> >
> > The one thing is that it's using drmModeSetCursor2 which sets the
> > hotspot at the same time. But internally inside nouveau I think it
> > should work out to the same thing. Perhaps setting the hotspot, or
> > something in that path, doesn't quite work for 256x256? [Again, no
> > clue what that might be.]
> >
> > It might also be worthwhile just testing if the 256x256 cursor works
> > quite the way one would want. If you're interested, grab libdrm,
> > there's a test called 'modetest', which has an option to enable a
> > moving cursor (-c iirc). It's hard-coded to 64x64, so you'll have to
> > modify it there too (and probably change the pattern from plain gray
> > to any one of the other ones).
>
> I am interested, so I did.
>
> If I start the test without X running, the sprite of 256x256 cursor always
> contained horizontal lines across it, both with commit reverted and vanilla
> v5.11. Similarly, the 64x64 cursor has no lines across it in both kernels.
>
> The test does not seem to work at all if there is an X server running (using
> modesetting driver): modetest complained about permission denied to set the
> mode, and just sits there, drawing nothing on the displays.
> So I could not run the test in the environment of original problem.
> Am I starting it correctly? Is the change in modetest.c correct?

Looks right. Although TBH I'd just start it on a single display (I
forgot you could even do multiple displays). You should be able to
start it with the X server running if you switch to a vt (and run it
as root). If you can't, that means the modesetting driver is
forgetting to do something in the LeaveVT function.

The fact that you're getting lines with modetest means there's
something wrong with 256x256. What if you do 128x128 -- does that work
OK?

Simon, you tested on a GK208, that has a slightly later display
controller than the GK104 -- can you try to reproduce Alex's results?
Perhaps there was a problem with the GK10x's and it starts working OK
with the GK110 disp.

I don't have any GK10x's in my posession (I have nearly every other
iteration of the display controller), but hopefully someone on the
nouveau team will be able to dig one up and reproduce.

Thanks for testing, Alex!

>
>     $ ./modetest -c |grep '^[0-9]\|preferred'
>     85  86      connected       LVDS-1          340x190         13      86
>       #0 1920x1080 60.01 1920 2010 2070 2226 1080 1086 1095 1142 152540 flags: phsync, nvsync; type: preferred, driver
>     87  89      connected       DP-1            470x300         18      88, 89
>       #0 1680x1050 59.88 1680 1728 1760 1840 1050 1053 1059 1080 119000 flags: phsync, nvsync; type: preferred, driver
>     90  0       disconnected    DP-2            0x0             0       91, 92
>     93  95      connected       DP-3            520x320         10      94, 95
>       #0 1920x1200 59.95 1920 1968 2000 2080 1200 1203 1209 1235 154000 flags: phsync, nvsync; type: preferred, driver
>     96  0       disconnected    VGA-1           0x0             0       97
>
>     $ ./modetest -s 85:1920x1080 -s 93:1920x1200 -s 87:1680x1050  -C
>     trying to open device 'i915'...failed
>     trying to open device 'amdgpu'...failed
>     trying to open device 'radeon'...failed
>     trying to open device 'nouveau'...done
>     setting mode 1920x1080-60.01Hz on connectors 85, crtc 50
>     starting cursor
>
>     cursor stopped
>
> This is the change on top of 1225171b (master):
>
> diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
> index fc75383a..cdba7b4e 100644
> --- a/tests/modetest/modetest.c
> +++ b/tests/modetest/modetest.c
> @@ -1730,14 +1730,14 @@ static void set_cursors(struct device *dev, struct pipe_arg *pipes, unsigned int
>         int ret;
>
>         /* maybe make cursor width/height configurable some day */
> -       uint32_t cw = 64;
> -       uint32_t ch = 64;
> +       uint32_t cw = 256;
> +       uint32_t ch = 256;
>
>         /* create cursor bo.. just using PATTERN_PLAIN as it has
>          * translucent alpha
>          */
>         bo = bo_create(dev->fd, DRM_FORMAT_ARGB8888, cw, ch, handles, pitches,
> -                      offsets, UTIL_PATTERN_PLAIN);
> +                      offsets, UTIL_PATTERN_SMPTE);
>         if (bo == NULL)
>                 return;
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
