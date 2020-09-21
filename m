Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EEA271E90
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 11:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A706D6E23D;
	Mon, 21 Sep 2020 09:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09556E247
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 09:09:51 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id c18so11884391wrm.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 02:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fAVVSw+Lw5u8RkTPDPSBrKsahSYxK5N2+xaOm2dYak8=;
 b=birNdg/QmDDNh057o/PKfwu9uhW0Njxo9tc3KbomwzoIK4cbmh9wM25k3KXLCvajVY
 1ENc6rqGTtAEoXhkhoZuW5Xvcv0tWtdjLnxhvKqd7MPPysc9ImeYA2IXu5FdiwdAoF/c
 /3GZ4gCV/uHRHJMyf5e6msf+YR9QlbZPDMrNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fAVVSw+Lw5u8RkTPDPSBrKsahSYxK5N2+xaOm2dYak8=;
 b=qIlRdjL+s/yrO5LXFSwlM8p+jgHdtZTJL31DI/tMgFEvhbvPUOtMAo/H/Voj2YVpY8
 DfCEh6re7qfwUuy6NZyRJUA59Ne2UqImTzTxXS8pVzUxDZon1BlQqv22OFcShscWJIdw
 CW2cwM4GPRo6zlVGre5699nhenatg0+xmZ9KMRDtiMy7/nYVDDGBO601R0M6hohioxaF
 sjbesIJxehveiekzqb+utHKPsZCGCQnqV1EheR5MECtrpbFlruM3PnW727bMxPFiHoDl
 sMXdW+oiKgsyodQ/2IRHdupovCbyesvhZBd5S/M2UNz3Jbg8LXG88MBDJMznRGv775xh
 aICg==
X-Gm-Message-State: AOAM5302gEPEZtFdo6mcesIBYJx2u3vMHwloftonNl9i/UWLWIUT7Zfn
 5+D9yJTLLskVOWwbDeRBRm/dAw==
X-Google-Smtp-Source: ABdhPJwsHMgqO6KuxTYCVHoQvSAn867Ob8+iM6WX67irriuvqbR20flip6bplkOd6Zg8lDELWmek0w==
X-Received: by 2002:adf:ef0a:: with SMTP id e10mr50795596wro.362.1600679390040; 
 Mon, 21 Sep 2020 02:09:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k12sm19461209wrn.39.2020.09.21.02.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 02:09:49 -0700 (PDT)
Date: Mon, 21 Sep 2020 11:09:47 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/4] managed drm_device, absolute final
 leftover bits
Message-ID: <20200921090947.GI438822@phenom.ffwll.local>
References: <20200918132505.2316382-1-daniel.vetter@ffwll.ch>
 <CADnq5_NW_k6szxmLxvf+tca4-D7oUfkLg1W-P0Q8AjVPBK_=iQ@mail.gmail.com>
 <20200918171221.GB716636@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918171221.GB716636@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 01:12:21PM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 18, 2020 at 11:03:12AM -0400, Alex Deucher wrote:
> > On Fri, Sep 18, 2020 at 9:25 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > >
> > > Hi all,
> > >
> > > These are the leftovers of the leftovers of my initial drmm series to
> > > manage drm_device.
> > >
> > > Changes:
> > > - bugfixed i915 selftests
> > > - patch from Luben to finalize the admgpu conversion
> > >
> > > Alex & i915 maintainers, pls ack for merging this all through
> > > drm-misc-next since otherwise the final patch (and the resulting confusion
> > > with outdated docs) is held up another round.
> > 
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> 
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Entire series merged into drm-misc-next.
-Daniel

> 
> > 
> > >
> > > Cheers, Daniel
> > >
> > > Daniel Vetter (3):
> > >   drm/i915/selftest: Create mock_destroy_device
> > >   drm/i915/selftests: align more to real device lifetimes
> > >   drm/dev: Remove drm_dev_init
> > >
> > > Luben Tuikov (1):
> > >   drm/amdgpu: Convert to using devm_drm_dev_alloc() (v2)
> > >
> > >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 16 ++----
> > >  drivers/gpu/drm/drm_drv.c                     | 41 ++--------------
> > >  drivers/gpu/drm/drm_internal.h                |  1 +
> > >  drivers/gpu/drm/drm_managed.c                 | 13 -----
> > >  .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
> > >  .../drm/i915/gem/selftests/i915_gem_context.c |  2 +-
> > >  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  2 +-
> > >  .../drm/i915/gem/selftests/i915_gem_object.c  |  2 +-
> > >  .../drm/i915/gem/selftests/i915_gem_phys.c    |  2 +-
> > >  drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
> > >  .../gpu/drm/i915/selftests/i915_gem_evict.c   |  2 +-
> > >  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  2 +-
> > >  drivers/gpu/drm/i915/selftests/i915_request.c |  2 +-
> > >  drivers/gpu/drm/i915/selftests/i915_vma.c     |  2 +-
> > >  .../drm/i915/selftests/intel_memory_region.c  |  2 +-
> > >  .../gpu/drm/i915/selftests/mock_gem_device.c  | 49 ++++++++++++-------
> > >  .../gpu/drm/i915/selftests/mock_gem_device.h  |  2 +
> > >  include/drm/drm_drv.h                         |  4 --
> > >  18 files changed, 51 insertions(+), 97 deletions(-)
> > >
> > > --
> > > 2.28.0
> > >
> > > _______________________________________________
> > > amd-gfx mailing list
> > > amd-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
