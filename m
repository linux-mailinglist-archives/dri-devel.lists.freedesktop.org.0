Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF19E38FA6D
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 07:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C436E835;
	Tue, 25 May 2021 05:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0C96E835
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 05:55:46 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id u11so29252484oiv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 22:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IjGFILrVJZ83xpyGVV1k02MU+tyQoMiIxsbfSGtKfqY=;
 b=N1eChgXZmiMMQbZgvby3R1DIVZ6Ec1GIIyiKh51tSUYB2h7RWnchGwxRppp9rvSqh3
 wjSuSg1waTnjABMM0InpV53o8OjmJ5j3tCwFURRJk2ziRFMaWBklUc7divxElPZaw9jF
 WN5meXG8X+SkGHYOIYQfQvIq0EIPIZSFvxB1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IjGFILrVJZ83xpyGVV1k02MU+tyQoMiIxsbfSGtKfqY=;
 b=jKH2l3vD6V298fHn9SUaMzHYXkfhs7mEK33wGh50eEdilCu49GQRPOc49cju6333nH
 wE917Zzlo+9xo9684sXPhgPWnpN3+jkaHSOCjbwdhj+JtdkQ6ySJu7ksgt3LkOc7ATtB
 4xYfQFAtWgn1LlGpz+otrGHZ3g6zFt7WpRYmtsFTK43+AIjeHn8zJ9fsp6ncMxtjPfIM
 1VCyEMKYp3y+ACQw++Mp10GmH8Dq6AU7IC53btFxEu9uZhlj2+vqLrTVkdutJ+SpLcnK
 PEwSPYPH1PfcY1z4m921KKKraRR93vlom7V8iLEvNEDxLC8raRQlXqwXbdSlYmsnNavE
 jjhg==
X-Gm-Message-State: AOAM532cIbT/QQoar/7FVBE8lR+38t6RqLGh9aYlX19k3ChGtKXHi/bp
 1qi2M2vXYsHMK5UEIQTkr/Rhb/S9ZJTD+Ygv6INPclVOjErQUg==
X-Google-Smtp-Source: ABdhPJzk1nsc9S8pVba6kQabXvYAlK2DokN+Cpo2YDaQLCbshCF3UvZLPwdUaRGyzAV75yOJSyfEC0wFzfm4kyE8HXE=
X-Received: by 2002:aca:f4c5:: with SMTP id
 s188mr13099290oih.128.1621922145874; 
 Mon, 24 May 2021 22:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <0a54d998-1c4b-724c-ec2d-a6c23aa35c21@amd.com>
 <CAPj87rOdE35n4yCe6U_384u0YR4oZ=zb9wKOH4PKEC4Ti5gUSg@mail.gmail.com>
In-Reply-To: <CAPj87rOdE35n4yCe6U_384u0YR4oZ=zb9wKOH4PKEC4Ti5gUSg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 25 May 2021 07:55:34 +0200
Message-ID: <CAKMK7uHvJW20cWPTM+sQYS_dw=ApUY-cmJ2QbrBQgcW75yKkpg@mail.gmail.com>
Subject: Re: EPOLL for drm_syncfile (was Re: [PATCH 4/4] RFC: dma-buf: Add an
 API for importing sync files (v6))
To: Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 23, 2021 at 11:34 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi Christian,
>
> On Sun, 23 May 2021 at 18:16, Christian K=C3=B6nig <christian.koenig@amd.=
com> wrote:
> > Am 22.05.21 um 22:05 schrieb Daniel Stone:
> > > Anyway, the problem with syncobj is that the ioctl to wait for a
> > > sync_file to materialise for a given timeline point only allows us to
> > > block with a timeout; this is a non-starter, because we need somethin=
g
> > > which fits into epoll. The most optimal case is returning a new
> > > eventfd or similar which signals when a given timeline point becomes
> > > available or signaled, but in extremis a syncobj FD becoming readable
> > > when any activity which would change the result of any zero-timeout
> > > wait on that syncobj is more or less workable.
> >
> > I think the tricky part is to epoll for a certain value.
> >
> > Not sure how eventfd is supposed to work, but IIRC we don't have the
> > functionality to poll for a certain value/offset etc to become availabl=
e.
> >
> > We could of course create a separate fd for each requested value to pol=
l
> > for thought, but that sounds like a bit much overhead to me.
>
> Yeah, I understand the point; something like an eventfd is exactly
> what you think, that we would have to materialise a new FD for it. On
> the other hand, as soon as the sync point becomes available, the
> winsys will want to immediately extract a sync_file from it, so I
> don't think FD amplification is a big issue. If it looks like being a
> problem in practice, we could look at providing a FD which starts off
> inert, and only later becomes a sync_file after it polls readable, but
> that sounds like something we really want to avoid if we can.

We can't change personalities of filp in the kernel because there's no
locking for that. But we can add a future fence state to sync_file for
this, and then make sure sync_file_get_fence() fails on them as long
as the fence hasn't materialized. That's required because current uapi
is that sync_file is never a future fence. Also opens the door for
that, which might be useful for all our userspace fences ideas.

Then we could support poll on that sync_file to wait for the fence to
materialize using POLLPRI. man poll suggests this isn't the dumbest
thing to go with, and grep in the kernel shows plenty of users (it's
EPOLLPRI internally).

With this we'd just need a new flag for allowing this mode in
sync_handle_to_fd_ioctl, and a fairly small amount of typing to glue
it together.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
