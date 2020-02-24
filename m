Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD0C16AF9F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 19:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60256E853;
	Mon, 24 Feb 2020 18:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0547D6E853
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 18:47:27 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id p8so310740iln.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 10:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fxxPjJP0mTZyh5r+zR+xb4tEneCtwlhiu4N5gzV+RS8=;
 b=nSN1b0u7MI8tm2yATxGgXVdwnf0pu6iK6Ogx4h1pE0d+VoZcIpxLrULemzUYgOfwI3
 8yDiP396BaQL2Vhq5QzDcRGnwTtDcgcQSrounbNyqn/WAd++vPIAHnhXZThOe0oOwApX
 EQcCTgDoj9tnrqENDqA8rHMgiVuzK/i7JAeAUzWkZw0y8X4HwXuLqVQudyZd+P3fpfB8
 mQ8Al0y5nSNSHnY9iGZ95JCoSvWB4V4/xf3vfDb2frbLrt+im0MNMdTjhLPB9J5oMFUC
 hVkGghHKIjbEGPCfbB9myWvXpojK6CssIWS64UnJBGO8eeQXIfwoNynTv67CyHSv6SVC
 InNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fxxPjJP0mTZyh5r+zR+xb4tEneCtwlhiu4N5gzV+RS8=;
 b=K34TyPkV9By0KvJ9cj7xYLIwlKiPXYjPIOBh9bADfQPKPYMjOpb4T/oci2TU/w4leO
 VmM8HS9BOFiS1I7wUsz+snsU3ig8K2Ymdn5YsfHjgxYp0UE7mVlO24gFZ8XpJQvCBzhX
 +qZZwIiDJflHLWHPpOH4WzhVbHIDVAKXdNDa3YWqW7rvxQkDSezlMGOlJkfbvcpFbdFk
 gJSFH4eafhWwQgzdbUDwMMmB82BnrY7xwdP+eFxBTsKUwGyA913vH0HvuZdtc4fnVz98
 F6XqseOIIvildPBmnS67h3Re0MqNUPyp/t24ZAKCYJ1csTJcocklCkwONDA5xG9DADS3
 OuXA==
X-Gm-Message-State: APjAAAVEKK/egNWVJOvhrIe6a8gBu2s1Q8fmC1f1nFTPc4i+ZBiv9U16
 7zicKgAYPTlwRSH0lVy+v6ftesNk4JjGo4NM22M=
X-Google-Smtp-Source: APXvYqyJiRdYXrY50L4QPnj6bJC/8dEt9tT/mqJO2OAuYpReQTeGRgd7BeZXREdCLy7GySX6em3L+gO2lMBQtEPCUQI=
X-Received: by 2002:a92:9e97:: with SMTP id s23mr67180681ilk.139.1582570046114; 
 Mon, 24 Feb 2020 10:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20200219223423.53319-1-gurchetansingh@chromium.org>
 <20200219223423.53319-4-gurchetansingh@chromium.org>
 <CAPaKu7QakQzeT3YrP5ctGfkAToNpq+E+qZ9pq5j-VOgTE4KYvg@mail.gmail.com>
 <CAAfnVBkGYX6=eaViT0Qw0gecd9DJHOURaAZSvL6OVVkgE=+f2A@mail.gmail.com>
 <20200224110626.ofk35vmwxz2ldomr@sirius.home.kraxel.org>
 <CACvgo50L0X7=bOjeuSpeFv14ycUEyCNsPY7OOoaNQzfTbSTrPQ@mail.gmail.com>
In-Reply-To: <CACvgo50L0X7=bOjeuSpeFv14ycUEyCNsPY7OOoaNQzfTbSTrPQ@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 24 Feb 2020 10:47:15 -0800
Message-ID: <CAPaKu7QV0znmKZY50tE7BeZeWbhPe+x-40sgCVDMpi-eqEjf+Q@mail.gmail.com>
Subject: Re: [PATCH 4/4 v6] drm/virtio: enqueue virtio_gpu_create_context
 after the first 3D ioctl
To: Emil Velikov <emil.l.velikov@gmail.com>
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
Cc: Emil Velikov <emil.velikov@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 24, 2020 at 5:24 AM Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> On Mon, 24 Feb 2020 at 11:06, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > On Fri, Feb 21, 2020 at 04:54:02PM -0800, Gurchetan Singh wrote:
> > > On Fri, Feb 21, 2020 at 3:06 PM Chia-I Wu <olvaffe@gmail.com> wrote:
> > > >
> > > > On Wed, Feb 19, 2020 at 2:34 PM Gurchetan Singh
> > > > <gurchetansingh@chromium.org> wrote:
> > > > >
> > > > > For old userspace, initialization will still be implicit.
> > > > >
> > > > > For backwards compatibility, enqueue virtio_gpu_cmd_context_create after
> > > > > the first 3D ioctl.
> > > > >
> > > > > v3: staticify virtio_gpu_create_context
> > > > >     remove notify to batch vm-exit
> > > > > v6: Remove nested 3D checks (emil.velikov):
> > > > >       - unify 3D check in resource create
> > > > >       - VIRTIO_GPU_CMD_GET_CAPSET is listed as a 2D ioctl, added a
> > > > >         3D check there.
> > > > I missed this change.  Why do we need a context to get capsets?  Is
> > > > this a workaround or something?
> > >
> > > No, don't need a context to get a capset.  The patch tries to create a
> > > context when a 3D userspace first talks to the host, not when a 3D
> > > userspace first needs a context ID.  If the latter is preferred, we
> > > can do that too.
> >
> > I think it makes sense to exclude the capset ioctls here.
> >
> > Possibly they are used for non-3d-related capabilities at some
> > point in the future.
> >
> > Also userspace gets capsets while checking device capabilities
> > and possibly does so before deciding how to drive the device.
> >
> Virglrenderer creates the internal/base GL* context during
> virgl_renderer_init().
> Based upon which the caps are populated.
>
> Personally I don't have a preference for/against dropping the
> virtio_gpu_create_context().
> Yet it does seems safe to omit.
Yeah, it should be safe to omit.  The userspace might want to decide
the "context type" based on the capsets.  It should also be better to
omit.


>
> HTH
> Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
