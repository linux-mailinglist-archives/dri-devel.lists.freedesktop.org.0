Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6082E392C94
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 13:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7C26EE81;
	Thu, 27 May 2021 11:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12C96EE82
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 11:22:49 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id jt22so7440216ejb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 04:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Hsq4MI72k1IdZdZS7WsYodiUse6OcN72CW+w7uTnZMU=;
 b=DV98uznTRt5lRl//DvXjXXVQyMbRKkQKY19rl9cvS/yatz7d60aTj6R107nyR3aVlF
 5oriuwnZJnZtRBH9/5Cx4lJN5pEz/Wmvos/s4Os403W7s4abI5CWZIoQWapjZgKljdYv
 JjEh1uSLdEDYxd1OMmTvMXIbKQHggjbdom5Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Hsq4MI72k1IdZdZS7WsYodiUse6OcN72CW+w7uTnZMU=;
 b=BNoh3CScpFmEup1ckIZJh4WNzNS3Y9/ptreikhMMM2oLxPzgf/IGVlV5ss5izoO1Nq
 ACQ3oLPpWVcnin6CE5dxzmvEuGA1mnnLQobdvEA3QW3SkXlGOi9mgSXprHbKwaGuX+I6
 3B49yM7cEtnw24AM0LstRN2aMKx/L+Hq6GP2i9oQ4U3BqIpk74qc4ugHjN8EXDkjHF35
 kB20B56wkg4uN8g8OK1vv59dMsURS5eN/XN+ZisAaxtGYY58fELrOZLvxIh2F3ZhwgNB
 DbUtkngK5Tzvv6PAj9fFPfFfrQzhCRvPBZIwkkERAoIsBXWqK1qh531NIhC25GNfU7fT
 3vAQ==
X-Gm-Message-State: AOAM533GtaTNFKRwl7xC0JSe+RDJJVb58t0eggdy0vCiaSOByM5ZMG8k
 BNzb+4H59cZeanyy4QuGI0FO2g==
X-Google-Smtp-Source: ABdhPJwkarwsxetAcfk71UD0ZDOG++V183h3c4XK4zicbtcGlnbV+MqLdDZtdCgsJVB2/cWm7RkXzw==
X-Received: by 2002:a17:906:c247:: with SMTP id
 bl7mr3362214ejb.288.1622114568300; 
 Thu, 27 May 2021 04:22:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z7sm847557ejm.122.2021.05.27.04.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 04:22:47 -0700 (PDT)
Date: Thu, 27 May 2021 13:22:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Disable gpu relocations
Message-ID: <YK+BBWYzhlNbVnlg@phenom.ffwll.local>
References: <20210526163730.3423181-1-daniel.vetter@ffwll.ch>
 <55fb9d6c-23aa-bdce-250f-7f0377441a53@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55fb9d6c-23aa-bdce-250f-7f0377441a53@linux.intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 27, 2021 at 01:16:13PM +0200, Maarten Lankhorst wrote:
> Op 2021-05-26 om 18:37 schreef Daniel Vetter:
> > Media userspace was the last userspace to still use them, and they
> > converted now too:
> >
> > https://github.com/intel/media-driver/commit/144020c37770083974bedf59902b70b8f444c799
> >
> > This means no reason anymore to make relocations faster than they've
> > been for the first 9 years of gem. This code was added in
> >
> > commit 7dd4f6729f9243bd7046c6f04c107a456bda38eb
> > Author: Chris Wilson <chris@chris-wilson.co.uk>
> > Date:   Fri Jun 16 15:05:24 2017 +0100
> >
> >     drm/i915: Async GPU relocation processing
> >
> > Furthermore there's pretty strong indications it's buggy, since the
> > code to use it by default as the only option had to be reverted:
> >
> > commit ad5d95e4d538737ed3fa25493777decf264a3011
> > Author: Dave Airlie <airlied@redhat.com>
> > Date:   Tue Sep 8 15:41:17 2020 +1000
> >
> >     Revert "drm/i915/gem: Async GPU relocations only"
> >
> > This code just disables gpu relocations, leaving the garbage
> > collection for later patches and more importantly, much less confusing
> > diff. Also given how much headaches this code has caused in the past,
> > letting this soak for a bit seems justified.
> >
> > Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 43 ++++++++-----------
> >  1 file changed, 18 insertions(+), 25 deletions(-)
> 
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> Note that a lot of complexity may be removed with gpu relocations gone.
> Some igt tests might also start to fail, as they expect relocations to
> complete asynchronously.

Yeah I have the kernel side patch for that, at least in the execbuf code +
selftests. For igt I'm wawiting on CI to tell me what I all need to look
at and decide what to do with it.

> Is it kept in case we need to revive it?

I don't want to revive it, but I want to split the huge code changes from
the functional changes at least.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
