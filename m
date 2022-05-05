Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5BB51BA5D
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 10:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DC710F111;
	Thu,  5 May 2022 08:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7E010F111
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 08:28:18 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id m20so7279168ejj.10
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 01:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=rcxyA3134NCuVr95OWaYMkj8iPMc5rNfiopB8bULWOw=;
 b=H1cwutUCyWdowQDRRqKBECZ7cUTOSHNa+ipMPT5VMGhPA86WXJuB5lxhlMCbnu6Re8
 tEdUZkDoo/WZ3T4mQ46BAEVx9J6ODM730zFY8ahwLrF9ZgI48vQJuq9SDDDZjPsVzTT8
 Q1VXEIfaCOTxBGLQofxq6O5fpbN0S929CEFOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=rcxyA3134NCuVr95OWaYMkj8iPMc5rNfiopB8bULWOw=;
 b=K9fRXt9oBHVcE/mlRjgZuyvevKyumDwQu0xDK9wcfHEuys9n5Cg0xTsmL4XFTIk6lQ
 S7EwCGLj+8LzhyqjBtxCQX3AQdHo5/l/3vmHZXaMdJzxDUpLYkuUF0mpYDkvkvZKIFdK
 DMVZDxc/kNvZYNNferr1nK9mwUxVAwO0KZdTi85dwtf8M3FLkBIlpNiI+jE/cKsNiz/H
 NE361mOCs4FXKeK/t9rpLbIfckqvI8xchRsHIstOj5q5VpQRlFOXZl3PSOJgErmr7Vzw
 //nHY954DyoY5VfB0TE9VRqwXkuLkfxOzpgSyKdOQVVbZi2cpr90Op+mtiS9WsBrweRK
 kKmw==
X-Gm-Message-State: AOAM531eWg4BPjG3c4sOF1Mwe6th15rV2p6iSB7w8WBQ06XDAm6lXsaG
 fpDQdLn1HNi4dGcSS1KMzDqM4JaK+RDUMQ==
X-Google-Smtp-Source: ABdhPJzNJ2BZJB0Tx2NBiesqaMNC7ozW6WCHZJv+ZwSxzGs2JuagLj8gpUytvnRFMVbOG1kKDWBAxQ==
X-Received: by 2002:a17:907:72c4:b0:6f4:ad52:b9fd with SMTP id
 du4-20020a17090772c400b006f4ad52b9fdmr9179057ejc.128.1651739296611; 
 Thu, 05 May 2022 01:28:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a170906070f00b006f3ef214e3asm462604ejb.160.2022.05.05.01.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 01:28:15 -0700 (PDT)
Date: Thu, 5 May 2022 10:28:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] drm: drm_gem.h: Add explicit includes for
 DEFINE_DRM_GEM_FOPS
Message-ID: <YnOKnisCqwXB9n6P@phenom.ffwll.local>
Mail-Followup-To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <1651262112-29664-1-git-send-email-quic_jhugo@quicinc.com>
 <87y1zkq6vg.fsf@intel.com> <YnJJq6UdCVIWcH3G@phenom.ffwll.local>
 <6dde7bb4-8931-ccdb-2677-930a1c6d6dab@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dde7bb4-8931-ccdb-2677-930a1c6d6dab@quicinc.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 07:58:38AM -0600, Jeffrey Hugo wrote:
> On 5/4/2022 3:38 AM, Daniel Vetter wrote:
> > On Mon, May 02, 2022 at 06:41:39PM +0300, Jani Nikula wrote:
> > > On Fri, 29 Apr 2022, Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
> > > > DEFINE_DRM_GEM_FOPS() references drm functions from other headers.  For
> > > > example drm_open() is defined in drm_file.h and drm_ioctl() is defined
> > > > in drm_ioctl.h.  Since drm_gem.h doesn't include these headers, it
> > > > relies on an implicit include from the .c file to have included these
> > > > required headers before DEFINE_DRM_GEM_FOPS() gets used.  Relying on
> > > > these implicit includes can cause build failures for new code that
> > > > doesn't know about these requirements, and can lead to future problems
> > > > if the headers ever get restructured as there will be a need to update
> > > > every downstream file that includes drm_gem.h.
> > > > 
> > > > Lets fix this explicitly including the required headers in drm_gem.h so
> > > > that code that includes drm_gem.h does not need to worry about these
> > > > implicit dependencies.
> > > 
> > > In the general case, I tend to agree, but in this specific instance I
> > > think I'd err on the side of fewer includes. I think the more likely
> > > outcome here is accumulating implicit dependencies on symbols from
> > > drm_file.h and drm_ioctl.h by including drm_gem.h only!
> > > 
> > > I do think headers need to be self-contained, and we actually enforce
> > > this in i915 (see HDRTEST in drivers/gpu/drm/i915/Makefile), but not to
> > > the point of macro expansions.
> > 
> > Yeah we abuse macros in a bunch of places to untangle header dependencies,
> > so then going back and pulling in all the headers back in feels a bit
> > silly and defeats the point.
> 
> Fair enough.  I'll consider this NAK'd
> 
> I've been pondering alternate solutions, but haven't come up with any. I
> guess, for now, the status quo will remain.

I think a standalone header for gem fops or so might be an option. We also
have some macro iirc for standard stuff in drm_driver (or at least had in
the past, maybe that's cleaned up now better).

That would allow drivers to include this monster header that pulls in a
lot of things in the one place they define their file ops, and nowhere
else. I think that would cover everything we'd want to achieve? But would
be a bit of churn to roll out everywhere.
-Daniel


> 
> > 
> > iow, I concur.
> > -Daniel
> > 
> > > 
> > > BR,
> > > Jani.
> > > 
> > > 
> > > 
> > > > 
> > > > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > > > ---
> > > >   include/drm/drm_gem.h | 2 ++
> > > >   1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > > index 9d7c61a..1cbe3d8 100644
> > > > --- a/include/drm/drm_gem.h
> > > > +++ b/include/drm/drm_gem.h
> > > > @@ -37,6 +37,8 @@
> > > >   #include <linux/kref.h>
> > > >   #include <linux/dma-resv.h>
> > > > +#include <drm/drm_file.h>
> > > > +#include <drm/drm_ioctl.h>
> > > >   #include <drm/drm_vma_manager.h>
> > > >   struct iosys_map;
> > > 
> > > -- 
> > > Jani Nikula, Intel Open Source Graphics Center
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
