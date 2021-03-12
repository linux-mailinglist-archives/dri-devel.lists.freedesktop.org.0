Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A8D338F99
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 15:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE7E6EEC0;
	Fri, 12 Mar 2021 14:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F9D6F40A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 14:15:07 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id g20so3899717wmk.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 06:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Af3mHPZaT2LqPuBFoXyUtYrCtuU51W2QCvy0JH+xM/c=;
 b=K5+4O2vLpHWuJ+nsGqSzGBmDM8uB6sSAkq04oKhFvkkF3urlatz3lBF6BT07cJZ+ra
 +GESRZUgblJtgpBXq6pOdVt79sGnPdAYYlw30eDP0KW/hOAcrBRFvd++YJd3fINZyBXB
 gnXsn+6bg1BNRwdumHXgV1NvaUkDxI8/XLfow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Af3mHPZaT2LqPuBFoXyUtYrCtuU51W2QCvy0JH+xM/c=;
 b=KefACwljFC2wV3xyj3fNh/5+/ECR+K4+itrnsbAKS/cb0rg4obszUjZ8ZhCLBBTFN/
 tyxHYHKVTfHlwL7i4wPfttNslUBFKVncBAtnihUoN69zFlrJO06IEXQbRxR07x5niwyU
 roojCrUoAGxaWzH86/E9Ttnd44kuBMfdVdeOy9YulVygrseIfcJ1aOfTptSCbXrDW5Zf
 dZlLuUMdakv/xPmnrdWelRSAccKGQHiQ1vDObpCT1bZ/yrApDkMN5pkXlhoeQV2mYL24
 hd41btpMB98KMKXEKoUH4Tr7H7q40HaMNqc9AYz7l5dc6JJ6p6HPXkMmp/R7PQK7iJNK
 vpUQ==
X-Gm-Message-State: AOAM533TP/d6v49779Ys0VA1DBAriksC+c8795Seeifn+pWoWRVpT9cG
 f19lQzKoUHOqpZPkdzi4dn0421SXZAljhpGU
X-Google-Smtp-Source: ABdhPJzJ0pzqKsGjmqvPE9hbg/rFLfBqAQjZTBv3DIf7Vq2A9IQs0yMNEU+RDC6VOM4LWib9TcBhug==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr13304059wmk.101.1615558505789; 
 Fri, 12 Mar 2021 06:15:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm2868382wmm.5.2021.03.12.06.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 06:15:05 -0800 (PST)
Date: Fri, 12 Mar 2021 15:15:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [Intel-gfx] [PATCH] i915: Drop legacy execbuffer support
Message-ID: <YEt3Z2GbRZmmFkE4@phenom.ffwll.local>
References: <20210310210049.723206-1-jason@jlekstrand.net>
 <87sg51un0c.wl-ashutosh.dixit@intel.com>
 <17824b43488.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17824b43488.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
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
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 11, 2021 at 10:31:33PM -0600, Jason Ekstrand wrote:
> 
> On March 11, 2021 20:26:06 "Dixit, Ashutosh" <ashutosh.dixit@intel.com> wrote:
> 
> > On Wed, 10 Mar 2021 13:00:49 -0800, Jason Ekstrand wrote:
> > > 
> > > libdrm has supported the newer execbuffer2 ioctl and using it by default
> > > when it exists since libdrm commit b50964027bef249a0cc3d511de05c2464e0a1e22
> > > which landed Mar 2, 2010.  The i915 and i965 drivers in Mesa at the time
> > > both used libdrm and so did the Intel X11 back-end.  The SNA back-end
> > > for X11 has always used execbuffer2.
> > > 
> > > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > > ---
> > > .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 100 ------------------
> > > drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |   2 -
> > > drivers/gpu/drm/i915/i915_drv.c               |   2 +-
> > > 3 files changed, 1 insertion(+), 103 deletions(-)
> > 
> > Don't we want to clean up references to legacy execbuffer in
> > include/uapi/drm/i915_drm.h too?
> 
> I thought about that but Daniel said we should leave them. Maybe a comment
> is in order?

These headers are copied unchanged to userspace for building. We don't use
kernel-headers packages directly in any of our userspace (I hope at
least), but still better safe than sorry and avoid compilation failures
simply due to updated uapi headers that lost a few old things.

Also we need at least the struct size because that's encoded in the ioctl
number, and at that point might as well keep the entire thing.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
