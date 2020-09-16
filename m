Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7757226C2AE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 14:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250E06E9F0;
	Wed, 16 Sep 2020 12:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25356E9F0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 12:24:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g4so6717285wrs.5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 05:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=l8kjoyfFJu+D8mOuRZf0tG7/TCcNZBbZs3fWorKgkQY=;
 b=J/liHQ0EIWObpZg3n9l2Grq7i/9Ph0+zlI5egK9nl/jkr5rSDSqoqJ3L9BfGE0YrBg
 6YLOylfP0g+FHwlZTGgqH0B+/2Ka8VT6sAEvX5RqiCvrH6SQouNOXlyxrkC0jgRqfSXt
 qU0s4WO4LgkrsYnfAuEj5ABJpMn1ygWLFQn/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=l8kjoyfFJu+D8mOuRZf0tG7/TCcNZBbZs3fWorKgkQY=;
 b=PSy5FVBIO43WL8Z01xY0WR8k0xgguV9AHXeOMaAQ880gVLbyOmsGrDVwFOuBuOu8Ae
 Rj1IKSRkDtQkC49w3kWFabpASyGH8T4mukUQWqOQ87A3bElu1Xb9h1FxdHFP7a5B/GHZ
 rol3XmOBlcEs8zzozsbhChNLDqUrnqZVGOeQwj/grdtpsZ+cFo/aRRaYwbvTXgo6CcgI
 cCT94tksvU67bewXldr6Ll8E7XxFfyZrQEcw2Xyo/h7yga9Yns+2WZUtfcjeOXjjYsD/
 Egwaul1alY6NvrID0Ad2KJX/+mclw1xxbvLjxsmzhKQsvarSJxQobW1YGG3WoqISd+71
 cBIA==
X-Gm-Message-State: AOAM532hrSu5aiAKdOu95jeIbqEjfh678drgqPXMTUlmxPl15aJOEhWR
 RbVqBvNTrwldAvtYfBFjRVtosw==
X-Google-Smtp-Source: ABdhPJxyu4DwSY4BIVWxJ6Hc2i1yJDRluPIhg3ID8mT2aS2WZiy2nGaJoOjxR85EDt24rNjWMu8++w==
X-Received: by 2002:adf:e80b:: with SMTP id o11mr24212577wrm.118.1600259049514; 
 Wed, 16 Sep 2020 05:24:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 10sm5165242wmi.37.2020.09.16.05.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 05:24:08 -0700 (PDT)
Date: Wed, 16 Sep 2020 14:24:05 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/3] dma-buf: Flag vmap'ed memory as system or I/O memory
Message-ID: <20200916122405.GQ438822@phenom.ffwll.local>
References: <20200914112521.1327-1-tzimmermann@suse.de>
 <20200916093756.GC438822@phenom.ffwll.local>
 <0378c326-28c6-371e-45d2-8b81ccbda84f@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0378c326-28c6-371e-45d2-8b81ccbda84f@suse.de>
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
Cc: christian.koenig@amd.com, airlied@linux.ie, mark.cave-ayland@ilande.co.uk,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 thierry.reding@gmail.com, kraxel@redhat.com, sparclinux@vger.kernel.org,
 sam@ravnborg.org, m.szyprowski@samsung.com, jonathanh@nvidia.com,
 matthew.auld@intel.com, linux+etnaviv@armlinux.org.uk,
 linux-media@vger.kernel.org, pawel@osciak.com, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 thomas.hellstrom@intel.com, rodrigo.vivi@intel.com,
 linux-tegra@vger.kernel.org, mchehab@kernel.org, tfiga@chromium.org,
 kyungmin.park@samsung.com, davem@davemloft.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 16, 2020 at 12:48:20PM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 16.09.20 um 11:37 schrieb Daniel Vetter:
> > On Mon, Sep 14, 2020 at 01:25:18PM +0200, Thomas Zimmermann wrote:
> >> Dma-buf provides vmap() and vunmap() for retrieving and releasing mapp=
ings
> >> of dma-buf memory in kernel address space. The functions operate with =
plain
> >> addresses and the assumption is that the memory can be accessed with l=
oad
> >> and store operations. This is not the case on some architectures (e.g.,
> >> sparc64) where I/O memory can only be accessed with dedicated instruct=
ions.
> >>
> >> This patchset introduces struct dma_buf_map, which contains the addres=
s of
> >> a buffer and a flag that tells whether system- or I/O-memory instructi=
ons
> >> are required.
> >>
> >> Some background: updating the DRM framebuffer console on sparc64 makes=
 the
> >> kernel panic. This is because the framebuffer memory cannot be accesse=
d with
> >> system-memory instructions. We currently employ a workaround in DRM to
> >> address this specific problem. [1]
> >>
> >> To resolve the problem, we'd like to address it at the most common poi=
nt,
> >> which is the dma-buf framework. The dma-buf mapping ideally knows if I=
/O
> >> instructions are required and exports this information to it's users. =
The
> >> new structure struct dma_buf_map stores the buffer address and a flag =
that
> >> signals I/O memory. Affected users of the buffer (e.g., drivers, frame=
works)
> >> can then access the memory accordingly.
> >>
> >> This patchset only introduces struct dma_buf_map, and updates struct d=
ma_buf
> >> and it's interfaces. Further patches can update dma-buf users. For exa=
mple,
> >> there's a prototype patchset for DRM that fixes the framebuffer proble=
m. [2]
> >>
> >> Further work: TTM, one of DRM's memory managers, already exports an
> >> is_iomem flag of its own. It could later be switched over to exporting=
 struct
> >> dma_buf_map, thus simplifying some code. Several DRM drivers expect th=
eir
> >> fbdev console to operate on I/O memory. These could possibly be switch=
ed over
> >> to the generic fbdev emulation, as soon as the generic code uses struct
> >> dma_buf_map.
> >>
> >> [1] https://lore.kernel.org/dri-devel/20200725191012.GA434957@ravnborg=
.org/
> >> [2] https://lore.kernel.org/dri-devel/20200806085239.4606-1-tzimmerman=
n@suse.de/
> > =

> > lgtm, imo ready to convert the follow-up patches over to this. But I th=
ink
> > would be good to get at least some ack from the ttm side for the overall
> > plan.
> =

> Yup, it would be nice if TTM could had out these types automatically.
> Then all TTM-based drivers would automatically support it.
> =

> > =

> > Also, I think we should put all the various helpers (writel/readl, mems=
et,
> > memcpy, whatever else) into the dma-buf-map.h helper, so that most code
> > using this can just treat it as an abstract pointer type and never look
> > underneath it.
> =

> We have some framebuffer helpers that rely on pointer arithmetic, so
> we'd need that too. No big deal wrt code, but I was worried about the
> overhead. If a loop goes over framebuffer memory, there's an if/else
> branch for each access to the memory buffer.

If we make all the helpers static inline, then the compiler should be able
to see that dma_buf_map.is_iomem is always the same, and produced really
optimized code for it by pulling that check out from all the loops.

So should only result in somewhat verbose code of having to call
dma_buf_map pointer arthimetic helpers, but not in bad generated code.
Still worth double-checking I think, since e.g. on x86 the generated code
should be the same for both cases (but maybe the compiler doesn't see
through the inline asm to realize that, so we might end up with 2 copies).
-Daniel


> =

> Best regards
> Thomas
> =

> > -Daniel
> > =

> >>
> >> Thomas Zimmermann (3):
> >>   dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr
> >>   dma-buf: Use struct dma_buf_map in dma_buf_vmap() interfaces
> >>   dma-buf: Use struct dma_buf_map in dma_buf_vunmap() interfaces
> >>
> >>  Documentation/driver-api/dma-buf.rst          |   3 +
> >>  drivers/dma-buf/dma-buf.c                     |  40 +++---
> >>  drivers/gpu/drm/drm_gem_cma_helper.c          |  16 ++-
> >>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  17 ++-
> >>  drivers/gpu/drm/drm_prime.c                   |  14 +-
> >>  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |  13 +-
> >>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  13 +-
> >>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  18 ++-
> >>  drivers/gpu/drm/tegra/gem.c                   |  23 ++--
> >>  .../common/videobuf2/videobuf2-dma-contig.c   |  17 ++-
> >>  .../media/common/videobuf2/videobuf2-dma-sg.c |  19 ++-
> >>  .../common/videobuf2/videobuf2-vmalloc.c      |  21 ++-
> >>  include/drm/drm_prime.h                       |   5 +-
> >>  include/linux/dma-buf-map.h                   | 126 ++++++++++++++++++
> >>  include/linux/dma-buf.h                       |  11 +-
> >>  15 files changed, 274 insertions(+), 82 deletions(-)
> >>  create mode 100644 include/linux/dma-buf-map.h
> >>
> >> --
> >> 2.28.0
> >>
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
