Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F732126273
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 13:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694F96EB5E;
	Thu, 19 Dec 2019 12:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83DB6EB5E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 12:42:45 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id k16so2518102otb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 04:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bYF5D8OyCxsifRan1VNFDw31YCOJxCs5X35xN2Xsu9c=;
 b=OG0zKHFbfaEQmlUoP8o3p3ZUiQjwQ5QzZJmv79u1eQfazk7ZeVXvgqICOzW9MLuciY
 7ERjSOGUHu7XqWG87h9vXirzpuudaFMsQXZS7pMry7t/niao9X0WXqiUtlKOI46MVHRu
 Dg/qVGrRrHeT/AXCXrwWDqgD9VtuvVkPSYiHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bYF5D8OyCxsifRan1VNFDw31YCOJxCs5X35xN2Xsu9c=;
 b=YCX9K7bdOqVhCLxi+t+fzXsYDvWvGuqJkSoJR2r481f//CEIuy/2JbhMgEBPfoDcK8
 KMOcj9WpsE/kf90e3I7NGaggmp/cwsLuOVYSTwtyFVVMvdjMyZGQzRqIqh+Htctnd+h8
 poqOnjAblsmMxpexF69oj7zFRoVi5vR9ipWbZViV98cuDckIml/Syk0EDz7tz4TE8xKR
 tQOoHrI6LDyYCNxYJWkZ7cYnY5/idvFiQyXDHAR/p4q7x+QNfVuOPqGXxHYjBw86zJ/V
 cmySdSmuZsmgGArwlaHzNmz2AC4IWtjd6BqRT74YhOs87HI1Q/u7L9oV4XibSgdGUrLD
 RgIw==
X-Gm-Message-State: APjAAAWOC2P74k/BYlMmfL7Dgcu3epY2aMgUEq/QQ7ipzi4R0sOKYBeb
 pVf1os4i0EFioV3wD/FOZ5c5WzQ3P2bbghlKncaX5Q==
X-Google-Smtp-Source: APXvYqwC4oTQJQT47ypqRnpTBZmyJTlKmHL17s0WvbC6jXR6ef19PMFuIxeZsGL9iHIGpAikF+RiJyv/heqQGtxVkBo=
X-Received: by 2002:a9d:7f11:: with SMTP id j17mr8979147otq.281.1576759365177; 
 Thu, 19 Dec 2019 04:42:45 -0800 (PST)
MIME-Version: 1.0
References: <07899bd5-e9a5-cff0-395f-b4fb3f0f7f6c@huawei.com>
 <f867543cf5d0fc3fdd0534749326411bcfc5e363.camel@collabora.com>
 <c2e5f5a5-5839-42a9-2140-903e99e166db@huawei.com>
 <fde72f73-d678-2b77-3950-d465f0afe904@huawei.com>
 <CAKMK7uFr03euoB6rY8z9zmRyznP41vwfdaKApZ_0HfYZT4Hq_w@mail.gmail.com>
 <fcca5732-c7dc-6e1d-dcbe-bfd914a4295b@huawei.com>
 <CAKMK7uE+nfR2hv1ybfv1ZApZbGnnX7ZHfjFCv5K72ZaAmdtfug@mail.gmail.com>
 <20191219113151.sytkoi3m7rrxzps2@sirius.home.kraxel.org>
In-Reply-To: <20191219113151.sytkoi3m7rrxzps2@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 19 Dec 2019 13:42:33 +0100
Message-ID: <CAKMK7uHEL3WzSHDM3XdLwOBtQUtygK6x-md8W1MVsAryDDgFog@mail.gmail.com>
Subject: Re: Warnings in DRM code when removing/unbinding a driver
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: dbueso@suse.de, "airlied@linux.ie" <airlied@linux.ie>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>,
 John Garry <john.garry@huawei.com>, Linuxarm <linuxarm@huawei.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kongxinwei \(A\)" <kong.kongxinwei@hisilicon.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 19, 2019 at 12:32 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > >   Like I said, for most drivers
> > > > you can pretty much assume that their unload sequence has been broken
> > > > since forever. It's not often tested, and especially the hotunbind
> > > > from a device (as opposed to driver unload) stuff wasn't even possible
> > > > to get right until just recently.
> > >
> > > Do you think it's worth trying to fix this for 5.5 and earlier, or just
> > > switch to the device-managed interface for 5.6 and forget about 5.5 and
> > > earlier?
> >
> > I suspect it's going to be quite some trickery to fix this properly
> > and everywhere, even for just one driver. Lots of drm drivers
> > unfortunately use anti-patterns with wrong lifetimes (e.g. you can't
> > use devm_kmalloc for anything that hangs of a drm_device, like
> > plane/crtc/connector). Except when it's for a real hotunpluggable
> > device (usb) we've never bothered backporting these fixes. Too much
> > broken stuff unfortunately.
>
> While being at it:  How would a driver cleanup properly cleanup gem
> objects created by userspace on hotunbind?  Specifically a gem object
> pinned to vram?

Two things:
- the mmap needs to be torn down and replaced by something which will
sigbus. Probably should have that as a helper (plus vram fault code
should use drm_dev_enter/exit to plug races).
- otherwise all datastructures need to be properly refcounted.
drm_device now is (if your driver isn't broken), but any dma_fence or
dma_buf we create and export has an independent lifetime, and
currently the refcounting for is still wobbly I think.

So some work to do, both in helpers/core code and in drivers to get updated.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
