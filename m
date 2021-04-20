Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4C5365737
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 13:11:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFC589FFD;
	Tue, 20 Apr 2021 11:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53EB89FFD
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 11:11:25 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id h8so4406144edb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 04:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jZ2eCCMOz5RQFGcMqABMs+NIPaISx90MnYdaa+4iJS4=;
 b=FM+Z0jxuKLuWqzMDiIIpznohSRbkVF0ze4zmO28EWSf6ZjMeujfuLQ5s6VDHnDcm/K
 QU8yO+sOwRVKh3hdafBoNIsc/gP7v9copWR1Rn7HUWD0nrWFklpexLRi09fejVvnSQEN
 4OwuLMwFfc5sCodNSUwxqUjChjVPFzC8w6KXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jZ2eCCMOz5RQFGcMqABMs+NIPaISx90MnYdaa+4iJS4=;
 b=ssVdtnZc5V8HSGQyIjkJPYR+w3tT1wq/dHkNwrq5mJLgVUE7C7BxNlH/PmjupVit8D
 kvMbtKC7dFAIs3cgTivGH6LkgmRW5GSqwD+IER4G6ngXbe93ajQjiASX8i4WKyW1yZKW
 rsiDGqpF4YdgupgMaJbrAYMU4nxchApMLO8ZUseg4l5zNn7Ahg4K5rVGSZOklh86kOYe
 DzQQCKW/bBPuvX8RS8mhpaqieWX9Ys9SaeC3D9uYX1OaM0z5tFumL/VRF8EqiOqIJbDP
 t7pYdToTUjDTqFJJ/SIO6FAddR98Xn3c1MwuzlV1SWZST1lLuv2gpgc4h8FUGtSWzFvq
 0btg==
X-Gm-Message-State: AOAM532LH/83Zuc4378iQVHz82X47BAGbFaefjldHnXsA6OgGYB6kS7Q
 vDuHXC1YN2q/baXlxP5vfNSqDA==
X-Google-Smtp-Source: ABdhPJxNr3fYdRNIJHqqw2j6y005xSkYU/6DyrQLB/+bgKJiESX3b+DWZMriP/Dad33tkhxlyM6NCg==
X-Received: by 2002:a50:fd13:: with SMTP id i19mr16959833eds.375.1618917084518; 
 Tue, 20 Apr 2021 04:11:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id go38sm12118273ejc.40.2021.04.20.04.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 04:11:23 -0700 (PDT)
Date: Tue, 20 Apr 2021 13:11:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
Message-ID: <YH622Ri2YJbNfBdA@phenom.ffwll.local>
References: <20210416090048.11492-1-tzimmermann@suse.de>
 <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
 <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
 <CAMuHMdU7BXN0P29wqWo2w3BWr=vQ=UHZHUnfFbMC--29ZBph-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdU7BXN0P29wqWo2w3BWr=vQ=UHZHUnfFbMC--29ZBph-w@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: bluescreen_avenger@verizon.net, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, virtualization@lists.linux-foundation.org,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg KH <gregkh@linuxfoundation.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 20, 2021 at 11:16:09AM +0200, Geert Uytterhoeven wrote:
> Hi Daniel,
> 
> On Tue, Apr 20, 2021 at 10:46 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Mon, Apr 19, 2021 at 10:00:56AM +0200, Geert Uytterhoeven wrote:
> > > On Fri, Apr 16, 2021 at 11:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > This patchset adds support for simple-framebuffer platform devices and
> > > > a handover mechanism for native drivers to take-over control of the
> > > > hardware.
> > > >
> > > > The new driver, called simpledrm, binds to a simple-frambuffer platform
> > > > device. The kernel's boot code creates such devices for firmware-provided
> > > > framebuffers, such as EFI-GOP or VESA. Typically the BIOS, UEFI or boot
> > > > loader sets up the framebuffers. Description via device tree is also an
> > > > option.
> > >
> > > I guess this can be used as a replacement for offb, too...
> > >
> > > > Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> > > > and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> > >
> > > .... if support for 8-bit frame buffers would be added?
> >
> > Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former
> 
> 8-bit indexed with 256 entry palette.
> 
> > shouldn't be a big thing, but the latter is only really supported by the
> > overall drm ecosystem in theory. Most userspace assumes that xrgb8888
> > works, and we keep that illusion up by emulating it in kernel for hw which
> > just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
> > best. The uapis are all there for setting the palette, and C8 is a defined
> > format even with atomic kms interface, but really there's not much
> > userspace for it. In other words, it would work as well as current offb
> > would, but that's at least that.
> 
> Oh, that's good to know!
> Does this mean fbdev is not deprecated for anything <= C8? ;-)

Nope. It just means you wont be able to use drm-only userspace with it
most likely, without also investing a ton of effort into porting those
over.

> A while ago, I was looking into converting an fbdev driver to drm, and
> one of the things I ran into is lack of C4, C2, C1, Y8, Y4, Y2, and
> monochrome support.  On top of that, lots of internal code seems to
> assume pixels are never smaller than a byte (thus ignoring
> char_per_block[]/block_w).  The lack of support for planar modes isn't
> that bad, combined with the need for copying, as c2p conversion can be
> done while copying, thus even making life easier for userspace
> applications that can just always work on chunky data.
> Then real work kicked in, before I got anything working...

We support drm_fourcc, so adding more pixel formats is not problem at all.
Anything indexed/paletted will simply not work great with unchanged drm
userspace, because you can't really convert it over from the common
denominator of xrgb888. But if it's just about adding support, adding more
fourcc codes isn't a big deal. The fbdev layer hasn't been taught about
fourcc codes yet, but that's also just for lack of need by anyone.

Also we support abitrary uneven pixel packing too, with some generic
support for anything that's at least somewhat regular. That's been the
case for a while now. It was added for fancy tiling and compression
formats, but works equally well for anything else that's aligned different
than what can be described with simplistic bytes-per-pixel only.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
