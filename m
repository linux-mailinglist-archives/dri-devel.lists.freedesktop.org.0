Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2717E6DD3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 16:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C958610E8D9;
	Thu,  9 Nov 2023 15:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC6C610E8DB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 15:42:54 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-5afa5dbc378so11910697b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 07:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1699544574; x=1700149374;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MyVYFOhkCpJULR+XwsnX+s2Ge7na8MXM78iRwEfPiEM=;
 b=LMA+zBjYMdufZvcz2SU9I8XdyXwh4DsZImTB2eMjUf2RHVF1PVlwVhTbYr4GCx3ZDP
 eHrZO34grNDSWDEp0pfRcbnXe9m+/yTkgv+f10IaK4jYxnkjrrkjcWE5LKf2NctPmDpR
 qLDxCbb7OjoiX8wbryZczm9iJgltGiqPI6dfXmGvCGz/EFsamkXnKcU7EQ5OuYpHZLGU
 B0urXCUgfp2ytASOfdamyDv8KvgR2EsBCD5AaKSA+Hq7ixDgyJrdSYbK8r9pHcmOg9md
 2E7i0+9m1OFH+sRvMggiFn83wCOt5UP+cjzXAgp9x+rkPCFf0ACrz+POAKhBvdIt2c6J
 O2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699544574; x=1700149374;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MyVYFOhkCpJULR+XwsnX+s2Ge7na8MXM78iRwEfPiEM=;
 b=doOM0ZTlDvk5tKJOXWAdg3sOK4Y9XaXNk4hatIGIgPvIL29azf9ixN1kwt9kzG9iJv
 HrwhHMYWJKA13IZ6I42DWdSzYeLRP62ri24oYJbLxT3qtizqVqg0R/jlnRhvWnZrPgyQ
 9gtYN8dPhnHBvGMKONOlgNNNwOuXKU6mww6/NllzsmZqkMNXw0nAMTnF4uM6stDaMZ65
 v6yEnBgxJpqrUiju1wVbZBc6EJsithoCTNHkWIkptC5JKmgjjhB/Z2vVjjTfBXsnIRsp
 aBbKCyin5w4Jd5N+HBzRLz/sJvdVArnhHfZ0APt29MbgDilTqDxcVeF5QLHxlmMNNnll
 WEig==
X-Gm-Message-State: AOJu0YzaFfK5N1f4KsG3O/oCerXp5OZze01iZbt0rDYABo/4IBMlZbBu
 8xdIzB88J7X7fYk47cxObkcE2BPDbCuwztMzy4tCZA==
X-Google-Smtp-Source: AGHT+IFkEkPLjybFkMvMOPnyHhgVm2RQpqh0Ml16QylsjpZ2NCUFSEMggWpbG6HLH8FAlaIXLrGDkB777vTOYQyuKmE=
X-Received: by 2002:a81:6c81:0:b0:5ad:43b3:e737 with SMTP id
 h123-20020a816c81000000b005ad43b3e737mr5522634ywc.22.1699544574082; Thu, 09
 Nov 2023 07:42:54 -0800 (PST)
MIME-Version: 1.0
References: <20231109074545.148149-1-contact@emersion.fr>
 <20231109074545.148149-2-contact@emersion.fr>
 <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
In-Reply-To: <tmsf75w3iskpvx2dxgzpk4vn7g6jpfdgdq2qv3nl5i4ocawzz4@ihcwmnq5gval>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 9 Nov 2023 15:42:38 +0000
Message-ID: <CAPY8ntC=qa-ajgSxeqrP5DVW4cEVZd+ik84ag5sN0RJvKLokqA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] vc4: introduce DMA-BUF heap
To: Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, Iago Toral Quiroga <itoral@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Simon and Maxime

On Thu, 9 Nov 2023 at 09:12, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi Simon,
>
> On Thu, Nov 09, 2023 at 07:45:58AM +0000, Simon Ser wrote:
> > User-space sometimes needs to allocate scanout-capable memory for
> > GPU rendering purposes. On a vc4/v3d split render/display SoC, this
> > is achieved via DRM dumb buffers: the v3d user-space driver opens
> > the primary vc4 node, allocates a DRM dumb buffer there, exports it
> > as a DMA-BUF, imports it into the v3d render node, and renders to it.
> >
> > However, DRM dumb buffers are only meant for CPU rendering, they are
> > not intended to be used for GPU rendering. Primary nodes should only
> > be used for mode-setting purposes, other programs should not attempt
> > to open it. Moreover, opening the primary node is already broken on
> > some setups: systemd grants permission to open primary nodes to
> > physically logged in users, but this breaks when the user is not
> > physically logged in (e.g. headless setup) and when the distribution
> > is using a different init (e.g. Alpine Linux uses openrc).
> >
> > We need an alternate way for v3d to allocate scanout-capable memory.
> > Leverage DMA heaps for this purpose: expose a CMA heap to user-space.
> > Preliminary testing has been done with wlroots [1].
> >
> > This is still an RFC. Open questions:
> >
> > - Does this approach make sense to y'all in general?
>
> Makes sense to me :)
>
> > - What would be a good name for the heap? "vc4" is maybe a bit naive and
> >   not precise enough. Something with "cma"? Do we need to plan a naming
> >   scheme to accomodate for multiple vc4 devices?
>
> That's a general issue though that happens with pretty much all devices
> with a separate node for modesetting and rendering, so I don't think
> addressing it only for vc4 make sense, we should make it generic.
>
> So maybe something like "scanout"?
>
> One thing we need to consider too is that the Pi5 will have multiple
> display nodes (4(?) iirc) with different capabilities, vc4 being only
> one of them. This will impact that solution too.

It does need to scale.

Pi5 adds 4 additional DRM devices (2xDSI, 1xDPI, and 1xComposite
Video), and just this last week I've been running Wayfire with TinyDRM
drivers for SPI displays and UDL (DisplayLink) outputs as well.
Presumably all of those drivers need to have appropriate hooks added
so they each expose a dma-heap to enable scanout buffers to be
allocated.

Can we add another function pointer to the struct drm_driver (or
similar) to do the allocation, and move the actual dmabuf handling
code into the core?

> > - Right now root privileges are necessary to open the heap. Should we
> >   allow everybody to open the heap by default (after all, user-space can
> >   already allocate arbitrary amounts of GPU memory)? Should we leave it
> >   up to user-space to solve this issue (via logind/seatd or a Wayland
> >   protocol or something else)?
>
> I would have expected a udev rule to handle that?
>
> > TODO:
> >
> > - Need to add !vc5 support.
>
> If by !vc5 you mean RPi0-3, then it's probably not needed there at all
> since it has a single node for both modesetting and rendering?

That is true, but potentially vc4 could be rendering for scanout via UDL or SPI.
Is it easier to always have the dma-heap allocator for every DRM card
rather than making userspace mix and match depending on whether it is
all in one vs split?

  Dave
