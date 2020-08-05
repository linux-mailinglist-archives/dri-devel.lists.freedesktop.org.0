Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA53423CA24
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 13:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90DD6E0EC;
	Wed,  5 Aug 2020 11:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF806E0EC
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 11:04:29 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id r21so22457188ota.10
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 04:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=33JqoDZmhKFAYKLKVFilKKAmoVuqRX1s+fsFx28xbpo=;
 b=OUz4cjIfJruljOUjOcbBooUfP6/RsSR/aNtCB4ow815lB/ODZHd2u53l8zSwW4bgSS
 vFXmWT4YPoNwghlDo9CCmo/WQ9IVFuDPSf4h2y+ibCyLCvF55zdyehFPmU1hR4DqU3Q2
 hJtkzOviZhPqMBXSMJ/KTo7bnICWBIAlMV6J0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=33JqoDZmhKFAYKLKVFilKKAmoVuqRX1s+fsFx28xbpo=;
 b=P+p4uxxJik8LObtnpPbwD4/4d4xRTkf5K531g19UjfGpadFKqMbzn9JidE+lxTc7HP
 ERfhF5AGvdL1tjxtELkkqUVopt0CPwcLF/+chKNX+0/2Fat63B+62uHmYQBhN9t7wwUz
 b/Ta8SIdi2eSF4axdioWorFVdjshNXzlfPuAllNjvWQld++ui/WGXe75/nA/Ktez2MGq
 qQ6FwIh5s2TuG4r8A/cMPzd/4MHaYXS7pOICrJNeH+oIuG6GwgdG1NdPBGkc+IVI05Wz
 sJSSXP6O/XMNF7QV+YLochGikNeMU5gpbmVWZK1evQrXbKHcaWfHC96mfszWe0SChrHq
 wJ4Q==
X-Gm-Message-State: AOAM531bcF3xwGjF8zFmNQeckm30bFOlN7IiJhiEDcTDO3xSNQ6uO8f+
 SYiyYf+/KUxsi3UD6HlLgNMUyIdZSUNA6GeBOP0IVvLf
X-Google-Smtp-Source: ABdhPJz7+HZSwScsZgA0cBM6kzcAidmiZGzsoKMWlS2yN3R22+U6eFgZDTneTPzvGfHoFOODCo9cRPgmDv9j6Gms3c8=
X-Received: by 2002:a9d:f29:: with SMTP id 38mr2241689ott.281.1596625469102;
 Wed, 05 Aug 2020 04:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200805105137.2b272efc@coco.lan>
 <CAKMK7uFdp_3gm-2DNko4AYa-EOgt5MTwuQLSXbo=xn-9oXayVg@mail.gmail.com>
 <20200805121343.4553d7ab@coco.lan>
In-Reply-To: <20200805121343.4553d7ab@coco.lan>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 5 Aug 2020 13:04:18 +0200
Message-ID: <CAKMK7uGWVov+0qmayAvxS+0a-91mRW_1Wp=tqVHFJmTKJ06DuQ@mail.gmail.com>
Subject: Re: DRM/KMS experimental drivers for HiKey 970
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 John Stultz <john.stultz@linaro.org>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, mani@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 5, 2020 at 12:13 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Wed, 5 Aug 2020 11:34:54 +0200
> Daniel Vetter <daniel@ffwll.ch> escreveu:
>
> > On Wed, Aug 5, 2020 at 10:51 AM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > I've been working to get upstream support for the DRM driver on HiKey 970.
> > >
> > > While the patches are not ready yet for upstream merge, I'm placing
> > > what I've sone so far on this repository:
> > >
> > >         https://github.com/mchehab/linux/tree/hikey970/to_upstream-2.0-v1.1
> > >
> > > The drivers there are a port from the Linaro's HiKey official Kernel:
> > >
> > >         https://github.com/96boards-hikey/linux
> > >
> > > The patches there preserve the old history. The porting patches
> > > are applied after the original patches imported from that tree.
> > >
> > > Besides the DRM driver, this repository contains:
> > >
> > > - a PMIC/regulator driver;
> > > - an iommu driver (still requiring some changes at DT properties);
> > > - A DMA driver;
> > > - a small ugly hack reverting some PM changes at the WiFi driver,
> > >   causing a regression on this board for HiKey 970.
> > >
> > > My current plans are to start upstreaming those needed drivers.
> > >
> > > The KMS/DRM driver there still need some changes. I guess it is
> > > not ready for being upstreamed yet. Also, it depends on the
> > > other drivers to work.
> > >
> > > In particular, its support for DPMS is broken: if the monitor is
> > > suspended, it won't return back to the right frequency settings.
> >
> > Hm this is somewhat surprising, at least with atomic, since DPMS as a
> > separate thing doesn't exist anymore - it's the same path as any other
> > modeset. With the suspend/resume helpers even the same as after
> > resume. But of course in reality there's always potential for some
> > differences between boot-up state and what your atomic_disable leaves
> > behind to creep in.
>
> Yeah, I didn't notice anything that would explain a problem there,
> but I didn't have much time so far to try to identify what is
> the real issue there.
>
> Btw, this problem is also present on the official Hikey Linaro's tree.
> There, it had an ugly hack at the modeset logic on adv7535 downstream
> driver.
>
> Ah, I forgot to mention, but this driver has a problem when talking
> with EDID. So, I'm passing this parameter via grub:
>
>         drm_kms_helper.edid_firmware=edid/1920x1080.bin
>
> With the EDID info from the monitor I'm using at the tests.

Hm probing and atomic check/commit should be largely decoupled, at
least for dumb outputs. For DP and hdmi 2, where we have sideband
traffic to do link training and all that it's different. So fake edid
(or just force-setting a mode you like, even on a disconnected output)
should all work.

> Perhaps the DPMS is somehow related to it.
>
> In any case, the modeset part of this driver needs to be revisited,
> before merging it drivers/drm.
>
> Btw, both issues are also present at the official Hikey driver,
> which makes a little harder to fix, as I was unable to get any
> documentation about this chipset so far - except for the public
> ones at 96boards.org.

Uh yeah that makes it tough :-/

> >
> > Just figured I drop this in quickly, always great to have more hw
> > drivers showing up!
>
> Yeah, it has been great for me to work on this DRM driver.
>
> Btw, although I didn't test, this driver is meant to support
> also Hikey 960.
>
> I intend to test it there when I have some spare time.

Adding John Stulz, I think he's been working on upstreaming part of
that too, but not sure.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
