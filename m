Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 829161E8010
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 16:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A196E914;
	Fri, 29 May 2020 14:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C456E914
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 14:20:35 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q11so3871328wrp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 07:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tSWLms+XDDdpfTq+6BPbS9zw9nPEkQ2+NlU6o71o/9k=;
 b=mn+TT5frza9J0INQG32zoWXl8jUIPBurVbmMBevQXXumXIFK77q3/viT/18G7PVXT4
 iT3s6ZiPGQgQn0jhCK8PL/xm2sQ8kNVV1qnyKt3w0VxsDDEjbloVYeL0jqhusLrBUWdJ
 tkJw2mstTqWWEydoy6NBFoY1X9au4VqCss6tOX1JnyIRqFFuuLYGi+IKg3qO7qBlrrBP
 qHrbWVUdTTdBXlFoN4aLWqqBWL+6FLWr9GV5flnY8eUKFouJBp7V6Mqc4iMFlvWaOcY4
 BZ4VdF0s4CD4g7KRnORpaXL8Y5Sz3eItP4jOvjrpO5rsTAst67j3zgkKQ/10UjGYPQJQ
 qzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tSWLms+XDDdpfTq+6BPbS9zw9nPEkQ2+NlU6o71o/9k=;
 b=AJHe7msg7wrnu+xdFiwMaz1IgM3RpNBgHdPv8nzMHxMs7Ma0sF6aPKh9eJTO1OOWMR
 D+YFJEtpwnd5aJYfGwYKpwezH4Dlc1VFuf/AR9JCdP/gMnd0DrJZGukroyYQ62Vmao2y
 +n/YA2uCytdrddVa2gbaxENOJSZWGagFIbr3CUvrRy7PbYROMC3RxdI67BUg0KuaR2Q3
 bpH2yOiy6DmOHfWDO+Fqsk6023S7XyphVKVVOv1FLW1e+/EA+ag700JwaaWZl9qNAvT1
 Ect9rdVsmLb7LbZBukXtGCpNS4eQ+XDrcsmAVC+TeDrvPJxhm0pdxxUhz54MFuWqUVbU
 FLaA==
X-Gm-Message-State: AOAM531zsQLcNx2LHi8k126XekgzwzvgLFqIn35zeG/Dg0rqeeisESf1
 xks4l08Fo0gCg7p1K9ZD1l9xeiH+Db1QTwaUSqg=
X-Google-Smtp-Source: ABdhPJyFtL7KlwMhKXbCqV8pD2CS3yn4WGowBF8tMERF9U2NFpr/XpEXnVKsBwOlm2L5gPu4ACufAiqA9bdIGStFGJ8=
X-Received: by 2002:a5d:6789:: with SMTP id v9mr9520502wru.124.1590762034497; 
 Fri, 29 May 2020 07:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200523154426.1088988-1-issor.oruam@gmail.com>
 <CAKMK7uGKps4AfLKTSP2HZTHd1cm+1dMD9r8M9rKobqwXGgv5EQ@mail.gmail.com>
 <2xZF5q7722pK-_L_0jQjYv33oMS6WS4Jm06tbVwUo9SQO9QBv48_HaVhzVHTb2OLnz3JUj3O1uRYn_y-JWGrWpD3c8J0y8Mr_qgwbNzsxDE=@emersion.fr>
 <CAHUn7wPfaEuWAc7iDGtfCdT71dwYkt7fNgMdPtfZL=COmKBaiQ@mail.gmail.com>
 <20200529104859.33af5eed@eldfell.localdomain>
In-Reply-To: <20200529104859.33af5eed@eldfell.localdomain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 29 May 2020 10:20:23 -0400
Message-ID: <CADnq5_N9cdqFFgQdm=yWgaR80=ZM=0YbBvY4PqZBrpGkfTunzA@mail.gmail.com>
Subject: Re: [PATCH] xf86drm: add drmOpenByFB
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Robert Foss <robert.foss@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Mauro Rossi <issor.oruam@gmail.com>,
 Chih-Wei Huang <cwhuang@linux.org.tw>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 29, 2020 at 3:49 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Thu, 28 May 2020 17:46:08 +0800
> Chih-Wei Huang <cwhuang@linux.org.tw> wrote:
>
> > The main problem we're trying to solve is to
> > find the DRM device of the primary framebuffer (fb0).
>
> Hi,
>
> I would say that is a completely wrong starting point. Please, let
> fbdev die in peace/pieces. Do not make any new code that relies on
> fbdev existing.
>
> Why do you think you want to follow the setup fbdev has? How do you
> know fb0 is the device you want and not fb1? How do you guarantee that
> fb0 is the device you want?
>
> "It was right on where I tested it" is no guarantee if you do not
> understand how it actually is chosen under the hood. If you know how it
> is chosen under the hood, you can do the same yourself without relying
> on deprecated stuff (fbdev).
>
> It is fbdev that should follow the DRM setup, not pick a DRM device
> based on fbdev.
>
> People already mentioned looking at device properties via libudev API.
> If you cannot have libudev (I believe it does not need udev daemon,
> btw.), then you can look at the same information directly in sysfs. Use
> the information about the DRM devices themselves from sysfs to decide
> which one to pick, and never look at fbdev anything. Or polish the
> patch Emil proposed if boot_vga indeed matches what you actually want
> to find.
>
> I think Daniel Vetter explained nicely what boot_vga means. Is your
> problem that the device may not be a PCI device, but a platform device
> for instance?
>
> Display servers use heuristics, for example if no device has boot_vga,
> then pick the platform device (since there usually is only one with KMS
> capabilities). Here are couple of examples.
>
> Weston wants a device with KMS capabilities, because it currently
> doesn't support using more than one KMS device and it also doesn't
> explicitly support a separate render device:
> https://gitlab.freedesktop.org/wayland/weston/-/blob/8.0.0/libweston/backend-drm/drm.c#L2546-2631
>
> Mutter is primarily looking for a hardware rendering capable device,
> because it can use any number of KMS devices in addition to a rendering
> device, separate or same device:
> https://gitlab.gnome.org/GNOME/mutter/-/blob/3.37.1/src/backends/native/meta-renderer-native.c#L3904-3953
>
> Neither is probably perfect, but they are totally better than picking
> based on fb0.

As an example, on my system with multiple GPUs, the one that the bios
lights up is the last one Linux enumerates when loading the GPU
drivers.

Alex
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
