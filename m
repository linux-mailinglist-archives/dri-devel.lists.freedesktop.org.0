Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA797132A3F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 16:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69536E0E0;
	Tue,  7 Jan 2020 15:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200CB6E0E0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 15:42:53 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c9so54485146wrw.8
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 07:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=e3JSrkA31lPQjM0qXrRZGQXu9t0TvJbA8jjtu6S4Kws=;
 b=J5AV37YMJnHJ3RXFwlcgkZbwnjesyNWZCGcGQ9HbGoN2/KGcUJWMYOHJ644L/6842G
 fvzBovUsbr46GGogb+jON8VfUPJWTsgksfQX3FM7MP1Z0QKoY+4D80AMiPLsLyT5D/+i
 ZuBWwdoFgmGgy3oleSv4YP/oJ2Un2Z0W9tkpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=e3JSrkA31lPQjM0qXrRZGQXu9t0TvJbA8jjtu6S4Kws=;
 b=n4NTyR0CnSAzH62a67IOBR5v+uSclUv18zoCbyXSfgbrAxpm8z5Y++wiL2mggywW3y
 4TRfrUYESjVHIpjD8v7Pi2FMxrB/YDoVhik/+6ocWccwD+ymZ0Q6Wum04jM1ofevNy2W
 VoS0i3ee8w1TnPTXdKWT+8JdfKv6TxNYUipwu115c6KzzTNNKnHurYkcDhpIZTVVI2Yt
 QAJe2oBZKyPlvq96X6kE1Vi6JGFhNqA8M/CMl1eGe8Hiqzu6JSVH6t0bDkBwBYdvZ/Jb
 XMOqGpZ8LXUONdrY6JlFAZUtldfNjaEhD2i72vNmhsFHzcn9ODM7uydaqUrBHA74HU+E
 ywwA==
X-Gm-Message-State: APjAAAVhOGBHtIYWjTSX+udQDfEBtwrMAMHUsUqVXuMakC5F3b8QsYae
 VYh2wYccVFUWCcvFoQ1oF+Zeag==
X-Google-Smtp-Source: APXvYqxzjRRl6NXBuJI2QKzzEl9GDdX2Uvf5Cn8sj8TaUUnBTDqduz5Kg7Z/Xcxe5sZ6W6MbtlZrgQ==
X-Received: by 2002:a5d:558d:: with SMTP id
 i13mr110929908wrv.364.1578411771762; 
 Tue, 07 Jan 2020 07:42:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id g199sm21778wmg.12.2020.01.07.07.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 07:42:50 -0800 (PST)
Date: Tue, 7 Jan 2020 16:42:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: SIGBUS on device disappearance (Re: Warnings in DRM code when
 removing/unbinding a driver)
Message-ID: <20200107154243.GA43062@phenom.ffwll.local>
Mail-Followup-To: Pekka Paalanen <ppaalanen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, dbueso@suse.de,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Chenfeng (puck)" <puck.chen@hisilicon.com>,
 John Garry <john.garry@huawei.com>, Linuxarm <linuxarm@huawei.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kongxinwei (A)" <kong.kongxinwei@hisilicon.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ezequiel Garcia <ezequiel@collabora.com>
References: <07899bd5-e9a5-cff0-395f-b4fb3f0f7f6c@huawei.com>
 <f867543cf5d0fc3fdd0534749326411bcfc5e363.camel@collabora.com>
 <c2e5f5a5-5839-42a9-2140-903e99e166db@huawei.com>
 <fde72f73-d678-2b77-3950-d465f0afe904@huawei.com>
 <CAKMK7uFr03euoB6rY8z9zmRyznP41vwfdaKApZ_0HfYZT4Hq_w@mail.gmail.com>
 <fcca5732-c7dc-6e1d-dcbe-bfd914a4295b@huawei.com>
 <CAKMK7uE+nfR2hv1ybfv1ZApZbGnnX7ZHfjFCv5K72ZaAmdtfug@mail.gmail.com>
 <20191219113151.sytkoi3m7rrxzps2@sirius.home.kraxel.org>
 <CAKMK7uHEL3WzSHDM3XdLwOBtQUtygK6x-md8W1MVsAryDDgFog@mail.gmail.com>
 <20191223110015.0e04ea25@ferris.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191223110015.0e04ea25@ferris.localdomain>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dbueso@suse.de,
 "airlied@linux.ie" <airlied@linux.ie>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>,
 John Garry <john.garry@huawei.com>, Linuxarm <linuxarm@huawei.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kongxinwei \(A\)" <kong.kongxinwei@hisilicon.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 23, 2019 at 11:00:15AM +0200, Pekka Paalanen wrote:
> On Thu, 19 Dec 2019 13:42:33 +0100
> Daniel Vetter <daniel@ffwll.ch> wrote:
> 
> > On Thu, Dec 19, 2019 at 12:32 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > While being at it:  How would a driver cleanup properly cleanup gem
> > > objects created by userspace on hotunbind?  Specifically a gem object
> > > pinned to vram?  
> > 
> > Two things:
> > - the mmap needs to be torn down and replaced by something which will
> > sigbus. Probably should have that as a helper (plus vram fault code
> > should use drm_dev_enter/exit to plug races).
> 
> Hi,
> 
> I assume SIGBUS is the traditional way to say "oops, the memory you
> mmapped and tried to access no longer exists". Is there nothing
> else for this?
> 
> I'm asking, because SIGBUS is really hard to handle right in
> userspace. It can be caused by any number of wildly different
> reasons, yet being a signal means that a userspace process can only
> have a single global handler for it. That makes it almost
> impossible to use safely in libraries, because you would want to
> register independent handlers from multiple libraries in the same
> process. Some libraries may also be using threads.
> 
> How to handle a SIGBUS completely depends on what triggered it.
> Almost always userspace wants it to be a non-fatal error. A Wayland
> compositor can hit SIGBUS on accessing wl_shm-based client buffers
> (regular mmapped files), and then it just wants to continue with
> garbage data as if nothing happened and possibly send a protocol
> error to the client provoking it.

For drm drivers that you actually want to hotunplug (as opposed to more
just for driver development) they all use system memory/shmem, so
shouldn't sigbus. I think at least, I haven't tested anything. This is for
udl, or the tiny displays behind an spi bridge.

For pci drivers where the mmap often points at a pci bridge the mmio range
will be gone, so not SIGBUSing is going to be a tough order. Not
impossible, but before we enshrine this into uapi someont will have to do
some serious typing.

> I would also imagine that Mesa, when it starts looking into
> supporting GPU hotunplug, needs to handle vanished mmaps. I don't
> think Mesa can ever install signal handlers, because that would
> mess with the applications that may already be using SIGBUS for
> handling disappearing mmapped files. It needs to start returning
> errors via API calls. I cannot imagine a way to reliably prevent
> such SIGBUS either by e.g. ensuring Mesa gets notified of removal
> before it actually starts failing.

Mesa already blows up in all kinds of interesting ways when it gets an EIO
at execbuf. I think. Robust handling of gpu hotunplug for gl/vk contexts
is going to be more work on top (and mmap is probably the least issue
there, at least right now).

> For now, I'm just looking for a simple "yes" or "no" here for the
> something else. If it's "no" like I expect, creating something else
> is probably in the order of years to get into a usable state. Does
> anyone already have plans towards that?

I agree with you that SIGBUS for mmap of hotunplugged devices is
essentially unusable because sighandlers and all what you point out (would
make it impossible to have robust vk/gl contexts, at least robuts against
hotunplug).

So in principle I'm open to have some other uapi for this, but it's going
to be serios amounts of work across the stack.

For display only udl-style devices otoh I think we should be mostly there,
+/- driver bugs as usual.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
