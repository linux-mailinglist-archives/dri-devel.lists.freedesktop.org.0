Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A60AE16A73E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 14:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D73A6E4B7;
	Mon, 24 Feb 2020 13:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0726E4B7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 13:24:09 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id c129so2472671vkh.7
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 05:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ynWr2nZ60g7K6YEmFWwuesvrA51hSnaZH5/tqOVYmnk=;
 b=nQBnV1vOIQJlgwLpZ3KDTCZKJ9MmoR+c3yUEwUz8gLQ0tAXkKwmc+v36DocXn21e+V
 r+6TQh7v3uURf8JRGe8zcBVrczrm9vd9GwNb0r+wkB09Vs8y2hG44MG/rP45BVpvj13k
 K4XmqXDEoYp6J5F+kuhJKimyBlrreXRl/i+euIwz5D1Qu0dE9BUGRtQJ4RaqFymYpysR
 dEf60wtlM9YoNqNI/6xgTrfUGYgNBbPAmBBAdJiAgcWjZVG28b6ik/KJNNJCKIV7P6Xx
 jhVaSwcPT6Pdl3Zvl/UZdroI1R7Hnw26RAvkzQAN1lWm2S8qbroSFEORhJx+aEjGYZ65
 kJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ynWr2nZ60g7K6YEmFWwuesvrA51hSnaZH5/tqOVYmnk=;
 b=rXMuIj0SFA6siRzBULA7VXZfObU8ygtwSb3n+1qLBtI7Zf8VSrm05vqzIAV8++HoT0
 YWNuMWK0iXW0xKfW0pbSoVMkSJfdP6mQZxyyqbJQTWuCEqHlw5s5/Sucvcde8zSlLq5x
 sue0R0M6M1E36lwRKUTY4HJrwYSgHJ5i3nQoqXzHq4oRfRemdeHD0D6gU4V5LKjJiHfY
 upWTQ6nKkzWXfqzN6Gus7QLqjNFKMqnU/Lw+NWiSOzYJRPbOlQF9xXrVbsYf4bpbvDt2
 yzw/v0EgKBuKgzynVdcQIv+K6Y9mYB0vNMdlTdbljWGL9EoAhLbyEuiN9wDTeJbC/avI
 LhzA==
X-Gm-Message-State: APjAAAXm07CQ9s3nhw5wQZnVIfoOHNGAPTxKHPm49DiWDjRCzXCucoZt
 pRJ/RLlPMOoHTNAQGi1BfulY+ZwYGWaSOlDUthA=
X-Google-Smtp-Source: APXvYqyk0OrnLi+tkPlxm2zbnTOP4FrC5mztQSA6/EBTe0t11nNWrnkHUPtIuRV3O1bcrDrlLwcZM8SOOf2LOyzO1fs=
X-Received: by 2002:a1f:264b:: with SMTP id m72mr23099424vkm.51.1582550648665; 
 Mon, 24 Feb 2020 05:24:08 -0800 (PST)
MIME-Version: 1.0
References: <20200219223423.53319-1-gurchetansingh@chromium.org>
 <20200219223423.53319-4-gurchetansingh@chromium.org>
 <CAPaKu7QakQzeT3YrP5ctGfkAToNpq+E+qZ9pq5j-VOgTE4KYvg@mail.gmail.com>
 <CAAfnVBkGYX6=eaViT0Qw0gecd9DJHOURaAZSvL6OVVkgE=+f2A@mail.gmail.com>
 <20200224110626.ofk35vmwxz2ldomr@sirius.home.kraxel.org>
In-Reply-To: <20200224110626.ofk35vmwxz2ldomr@sirius.home.kraxel.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 24 Feb 2020 13:23:50 +0000
Message-ID: <CACvgo50L0X7=bOjeuSpeFv14ycUEyCNsPY7OOoaNQzfTbSTrPQ@mail.gmail.com>
Subject: Re: [PATCH 4/4 v6] drm/virtio: enqueue virtio_gpu_create_context
 after the first 3D ioctl
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
Cc: Emil Velikov <emil.velikov@collabora.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Feb 2020 at 11:06, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Fri, Feb 21, 2020 at 04:54:02PM -0800, Gurchetan Singh wrote:
> > On Fri, Feb 21, 2020 at 3:06 PM Chia-I Wu <olvaffe@gmail.com> wrote:
> > >
> > > On Wed, Feb 19, 2020 at 2:34 PM Gurchetan Singh
> > > <gurchetansingh@chromium.org> wrote:
> > > >
> > > > For old userspace, initialization will still be implicit.
> > > >
> > > > For backwards compatibility, enqueue virtio_gpu_cmd_context_create after
> > > > the first 3D ioctl.
> > > >
> > > > v3: staticify virtio_gpu_create_context
> > > >     remove notify to batch vm-exit
> > > > v6: Remove nested 3D checks (emil.velikov):
> > > >       - unify 3D check in resource create
> > > >       - VIRTIO_GPU_CMD_GET_CAPSET is listed as a 2D ioctl, added a
> > > >         3D check there.
> > > I missed this change.  Why do we need a context to get capsets?  Is
> > > this a workaround or something?
> >
> > No, don't need a context to get a capset.  The patch tries to create a
> > context when a 3D userspace first talks to the host, not when a 3D
> > userspace first needs a context ID.  If the latter is preferred, we
> > can do that too.
>
> I think it makes sense to exclude the capset ioctls here.
>
> Possibly they are used for non-3d-related capabilities at some
> point in the future.
>
> Also userspace gets capsets while checking device capabilities
> and possibly does so before deciding how to drive the device.
>
Virglrenderer creates the internal/base GL* context during
virgl_renderer_init().
Based upon which the caps are populated.

Personally I don't have a preference for/against dropping the
virtio_gpu_create_context().
Yet it does seems safe to omit.

HTH
Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
