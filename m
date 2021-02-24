Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DF53241B1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 17:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D0E6E8AB;
	Wed, 24 Feb 2021 16:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214936E8AB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 16:17:25 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id s3so2661956otg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 08:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WoFEQ1/bfKoFI9xvg8DWul0UZStnDpuh33pXiEHG16U=;
 b=N4/rUSMsYrYBLT2mWYW11Tj9i5sFyWaQXEkIWwmk5faDg80d4hXBplnYGQb9fvPTVg
 hjP97F8wrC7M83DOiTXQ1mubWe8HtNkh9bTaT4tfOOL2gcASsySWCWKbJJpuDagAyl2R
 wJMirrr073YqLP+Rq4+WnrHyHvuoa6PNBGeL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WoFEQ1/bfKoFI9xvg8DWul0UZStnDpuh33pXiEHG16U=;
 b=lGbu8yxBjGBb3mqjydIuNPwYZt6xUSn5R7itpfmkiIwrzIlBMeNl0cq8Jf89+ap+i0
 /7CfJ359CR3v+b+/FllEOfxdDFrLNI3JYT/QHMXEgH9VpEHLPOwWQBJnqZhDnu/s5G73
 2gx6IHk4Ee5cnWAp+uGWEaoyiUN/8bHmCM3+JXfdvaBftUDH5p7Mh+fQn5yfSqKydAxS
 byaFB6pfPbCVfDZVDZQltGodGsa2afoh/SDjpN4apuZXmU4uOGQDVMqzGq0D1o9w6Gw6
 mqRahsZ9JhLgf6KE8DWCGDHvA3qdrBXr9HV4FO8a0YhGYZ5Lm5NS3oxvltH7Zht8+HA3
 C/xg==
X-Gm-Message-State: AOAM530O2BR668U/6VVhPXg40WAViAygpvYrNTjMaErExG25UPkjqnTj
 QeB62sWjC1Ya0cwkZvN2aCF+dOUqbFU6m9QR5RlPTQ==
X-Google-Smtp-Source: ABdhPJy5Y98h9GUiqrOFjUQF2+PwNwCz5OXAmFFcvCNRB9jriSwRzPjd90bBKiziOEProUm0GiPXnDfVdnnviyzzWx4=
X-Received: by 2002:a9d:2265:: with SMTP id o92mr24849267ota.188.1614183444301; 
 Wed, 24 Feb 2021 08:17:24 -0800 (PST)
MIME-Version: 1.0
References: <54ae54f9-1ba9-900b-a56f-f48e2c9a82b0@suse.com>
 <a9597f1a-39a6-3664-8617-90338e7943d0@epam.com>
In-Reply-To: <a9597f1a-39a6-3664-8617-90338e7943d0@epam.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 24 Feb 2021 17:17:13 +0100
Message-ID: <CAKMK7uGV25ERN0wy1pJvZqvC0QXBh=oQ_RfpRy7+ViQbEdBNPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/xen: adjust Kconfig
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 24, 2021 at 8:55 AM Oleksandr Andrushchenko
<Oleksandr_Andrushchenko@epam.com> wrote:
>
> Hello, Jan!
>
> On 2/23/21 6:41 PM, Jan Beulich wrote:
> > By having selected DRM_XEN, I was assuming I would build the frontend
> > driver. As it turns out this is a dummy option, and I have really not
> > been building this (because I had DRM disabled). Make it a promptless
> > one, moving the "depends on" to the other, real option, and "select"ing
> > the dummy one.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Since you're maintainer/committer, I'm assuming you'll also merge
this? Always confusing when there's an r-b but nothing about whether
the patch will get merged or not.
-Daniel

> > --- a/drivers/gpu/drm/xen/Kconfig
> > +++ b/drivers/gpu/drm/xen/Kconfig
> > @@ -1,15 +1,11 @@
> >   # SPDX-License-Identifier: GPL-2.0-only
> >   config DRM_XEN
> > -     bool "DRM Support for Xen guest OS"
> > -     depends on XEN
> > -     help
> > -       Choose this option if you want to enable DRM support
> > -       for Xen.
> > +     bool
> >
> >   config DRM_XEN_FRONTEND
> >       tristate "Para-virtualized frontend driver for Xen guest OS"
> > -     depends on DRM_XEN
> > -     depends on DRM
> > +     depends on XEN && DRM
> > +     select DRM_XEN
> >       select DRM_KMS_HELPER
> >       select VIDEOMODE_HELPERS
> >       select XEN_XENBUS_FRONTEND
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
