Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B667A172E77
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 03:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725056E993;
	Fri, 28 Feb 2020 02:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AC56E993
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 02:03:30 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s1so413891lfd.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JUJ3kLTC4U63h1bY5FvqPO8+OmeY75SEI3DvH6g7Hlk=;
 b=S2/l5WTLHJdtok2tvIRIFDQ62NWgGHRyS9FfGNF7Vkn1gyoZI2izI2ULe+OMCbJE8x
 7OSp9v83NECSmTWj9UgXkjcUz37ExvauQ8FU0zbqmSbA3rXDP+mRTgxGDTkxlOVCbBi1
 XZg67MAaxESkDgeN5sRhZ2xyZfbTkUmbxkJ2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JUJ3kLTC4U63h1bY5FvqPO8+OmeY75SEI3DvH6g7Hlk=;
 b=XDwiT5NKsJ0Z352D6UAvhPAC39/2OaSBMTTICGOrSK9s8k3PDo2OhZyVhNS8rsYhKx
 FTT8tfT2t8N0FuRn1mfqS9uWwyStL27R1yI3ZV10HAtbnywUZ27haerNi22L8/3Thjc2
 83dEQorqo92WQE8i78cVOw0npdmrGB6mYf25cXFj49Au6WKalMzN+FJZ5mwjYKjFCVD/
 WZbkk9Br/IXcHccBoioETbM7xSr/T9SnaHqZ9+K775oHa4YqLzBZ9Kd1JTGrLrpEz74z
 6DTUZaY9we/5Ko17tSgOe+V1qwY6ifNaMvdtoDUdMRtqXZIN/l9aXrOsHkJCgFwZMjtK
 KaOA==
X-Gm-Message-State: ANhLgQ0Wkkn6kkDRZwcCrGOd2XXRxIAJb/Uu9V68vVY+ArteCQpjfVo+
 FAp81kgs+PWpEtttaJcGtHvtakNU5mc=
X-Google-Smtp-Source: ADFU+vsENePG+WK4SNsYl0Fdb5oaH6BgpfjnvdMkDTeWovRkNc2R+8AUFcme820XfWh06RWhbhaaCg==
X-Received: by 2002:ac2:5328:: with SMTP id f8mr1201427lfh.47.1582855408273;
 Thu, 27 Feb 2020 18:03:28 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id x8sm2057543lfa.75.2020.02.27.18.03.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 18:03:28 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id e3so1488680lja.10
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:03:28 -0800 (PST)
X-Received: by 2002:a05:651c:107c:: with SMTP id
 y28mr24279ljm.77.1582855407044; 
 Thu, 27 Feb 2020 18:03:27 -0800 (PST)
MIME-Version: 1.0
References: <20200227002601.745-1-gurchetansingh@chromium.org>
 <20200227072319.qimkovn7ncx35no5@sirius.home.kraxel.org>
In-Reply-To: <20200227072319.qimkovn7ncx35no5@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Thu, 27 Feb 2020 18:03:14 -0800
X-Gmail-Original-Message-ID: <CAAfnVB=hPaGUtq=w9X5DGnsCAAjMzP_dTNKQm-4hG5ORD=2r+A@mail.gmail.com>
Message-ID: <CAAfnVB=hPaGUtq=w9X5DGnsCAAjMzP_dTNKQm-4hG5ORD=2r+A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] *** Refactor struct virtgpu_object ***
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 John Bates <jbates@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 26, 2020 at 11:23 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Wed, Feb 26, 2020 at 04:25:53PM -0800, Gurchetan Singh wrote:
> > The main motivation behind this is to have eventually have something like this:
> >
> > struct virtio_gpu_shmem {
> >     struct drm_gem_shmem_object base;
> >     uint32_t hw_res_handle;
> >     struct sg_table *pages;
> >     (...)
> > };
> >
> > struct virtio_gpu_vram {
> >     struct drm_gem_object base;  // or *drm_gem_vram_object
> >     uint32_t hw_res_handle;
> >     {offset, range};
> >     (...)
> > };
>
> Given that we probably will not use drm_gem_vram_object

Makes sense not to use drm_gem_vram_object for now.

> and
> drm_gem_shmem_object->base is drm_gem_object I think we can
> go this route:
>
> struct virtgpu_object {

Yeah, using "virtgpu_" rather than "virtio_gpu" makes sense.  A bit
less wordy, though the current code is based on "virtio_gpu".

>         struct drm_gem_shmem_object base;
>         enum object_type;
>         uint32_t hw_res_handle;
>         [ ... ]
> };
>
> struct virtgpu_object_shmem {
>         struct virtgpu_object base;
>         struct sg_table *pages;
>         [ ... ]
> };
>
> struct virtgpu_object_hostmem {
>         struct virtgpu_object base;
>         {offset, range};
>         (...)

I'm a kernel newbie, so it's not obvious to me why struct
drm_gem_shmem_object would be a base class for struct
virtgpu_object_hostmem?

The core utility of drm_gem_shmem_helper seems to get pages, pinning
pages, and releasing pages.  But with host-mem, we won't have an array
of pages, but just an (offset, length) -- which drm_gem_shmem_helper
function is useful here?

Side question: is drm_gem_object_funcs.vmap(..) /
drm_gem_object_funcs.vunmap(..) even possible for hostmem?

P.S:

The proof of concept hostmem implementation is on Gitlab [1][2].  Some notes:

- io_remap_pfn_range to get a userspace mapping
- calls drm_gem_private_object_init(..) rather than
drm_gem_object_init [which sets up shmemfs backing store].

[1] https://gitlab.freedesktop.org/virgl/drm-misc-next/-/blob/virtio-gpu-next/drivers/gpu/drm/virtio/virtgpu_drv.h#L80
[2] https://gitlab.freedesktop.org/virgl/drm-misc-next/-/blob/virtio-gpu-next/drivers/gpu/drm/virtio/virtgpu_hostmem.c#L179

> };
>
> Then have helpers to get virtgpu_object_hostmem / virtgpu_object_shmem
> from virtgpu_object via container_of which also sanity-check
> object_type (maybe we can check drm_gem_object->ops for that instead of
> adding a new field).
>
> > Sending this out to solicit feedback on this approach.  Whichever approach
> > we decide, landing incremental changes to internal structures is reduces
> > rebasing costs and avoids mega-changes.
>
> That certainly makes sense.
>
> cheers,
>   Gerd
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
