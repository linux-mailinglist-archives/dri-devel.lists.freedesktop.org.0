Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5B9345F02
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 14:10:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050416E8EB;
	Tue, 23 Mar 2021 13:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CAF6E15C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 13:10:21 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so1104951wma.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 06:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8LILuIxx3Dt03RFOu/SDBOmKxUoeOOb2/7p2Ovux+Cc=;
 b=HnohPj6P0TsytW0MHIUvzXitiD+Py+SjuVImPqEkHjIqlc/CNfvqKsrQx0lZDUYxWF
 1PxlMrF2G0rptCS0ecJqR7WQmROyB/XsumEYrSicRZi0sLx61/EoSF3AHWcEeAfqTwQQ
 w5mwt56jlBrZxtIQ0iRUji6aMuatmWv7pq46g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8LILuIxx3Dt03RFOu/SDBOmKxUoeOOb2/7p2Ovux+Cc=;
 b=WONPAUmObEhRIsHokj2novfQ8mUnD7+BzM6tagsdBA8tIw0Y5Uw1fMOd+shZqdW81o
 To3V7iNwjHxMeZtqqO/AnyPo6QIJyibt+vKIHNq58ep8eXa48Llibfi6O34tGQ9gBBOT
 lmGHf2yepe0/W+f0X4lPqFlr7ZrQvlrpCZd0lCGhSa2gzSVqYPWfsUttUOKBRZENzows
 swOftJNLyQrxWpo2M3vNeGSy7g0lY0TFmPBIDBdeveIt+DGyZVXSg07XY7WrnSGQSlDt
 AC1Czf+LjJNcWakf1jwJQAX2eh9t8JFqNhgLgcXtRPBMTLcxRcUEZqfeTaxhKKLjIXyU
 i0Wg==
X-Gm-Message-State: AOAM53178ZzAVL//EXXfjiz5zx2VPX/9ZxDaoYAveSsGhNWctO2aWx/i
 6balWaNJeegWg88GGAkdU1o1FA==
X-Google-Smtp-Source: ABdhPJySHnPrHD9PxfvezeGwJIRNpT2FFerm2wpTndArq8J5fihw8E9kTZ4U3Iyyx+nasEZ4ubGm7w==
X-Received: by 2002:a05:600c:284:: with SMTP id 4mr3404455wmk.24.1616505020391; 
 Tue, 23 Mar 2021 06:10:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m132sm2511284wmf.45.2021.03.23.06.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 06:10:19 -0700 (PDT)
Date: Tue, 23 Mar 2021 14:10:17 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 2/2] drm/doc: Add RFC section
Message-ID: <YFnouVsaKs2odAqq@phenom.ffwll.local>
References: <20210323084453.366863-1-daniel.vetter@ffwll.ch>
 <20210323084453.366863-2-daniel.vetter@ffwll.ch>
 <YFng89ujYxcyJQmN@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFng89ujYxcyJQmN@intel.com>
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
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 08:37:07AM -0400, Rodrigo Vivi wrote:
> On Tue, Mar 23, 2021 at 09:44:53AM +0100, Daniel Vetter wrote:
> > Motivated by the pre-review process for i915 gem/gt features, but
> > probably useful in general for complex stuff.
> > 
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  Documentation/gpu/index.rst |  1 +
> >  Documentation/gpu/rfc.rst   | 16 ++++++++++++++++
> >  2 files changed, 17 insertions(+)
> >  create mode 100644 Documentation/gpu/rfc.rst
> > 
> > diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
> > index c9a51e3bfb5a..df58cb826d68 100644
> > --- a/Documentation/gpu/index.rst
> > +++ b/Documentation/gpu/index.rst
> > @@ -16,6 +16,7 @@ Linux GPU Driver Developer's Guide
> >     vga-switcheroo
> >     vgaarbiter
> >     todo
> > +   rfc
> 
> I understand the motivation here so I didn't commented earlier, but looking now,
> I'm wondering that this section will polute the official doc...

We already have this problem between documentation meant for kernel driver
developers and documentation meant for userspace developers around uapi
and all that. "who is the audience here" is very ill-defined for our
current set of docs in Documentation/gpu :-(

So I agree with you, but I also don't think this will make things worse.
-Daniel

> 
> >  
> >  .. only::  subproject and html
> >  
> > diff --git a/Documentation/gpu/rfc.rst b/Documentation/gpu/rfc.rst
> > new file mode 100644
> > index 000000000000..9d0ff2921af8
> > --- /dev/null
> > +++ b/Documentation/gpu/rfc.rst
> > @@ -0,0 +1,16 @@
> > +===============
> > +GPU RFC Section
> > +===============
> > +
> > +For complex work, especially new uapi, it is often good to nail the high level
> > +design issues before getting lost in the code details. This section is meant to
> > +host such documentation:
> > +
> > +* Each RFC should be a section in this file, explaining the goal and main design
> > +  considerations.
> > +
> > +* For uapi structures add a file to this directory with and then pull the
> > +  kerneldoc in like with real uapi headers.
> > +
> > +* Once the code has landed move all the documentation to the right places in
> > +  the main core, helper or driver sections.
> > -- 
> > 2.31.0
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
