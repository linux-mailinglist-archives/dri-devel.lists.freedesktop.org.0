Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 831684506FF
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AF46EE13;
	Mon, 15 Nov 2021 14:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA786EE13
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:31:42 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c8so72522219ede.13
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 06:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=fbcTbLjQBdVoRHk/d84kLo+kIQplSoYyq9eL4kalAIg=;
 b=a1ddi0dqXM1l2apNRb4Kl0bLUXWz2/I9l7ZoV7oXxeOKVhPgFEI+5s4Q7R8xy5JJ6g
 /YAEB1aYO949LKPmO5i33ldsEF6m+RPkWE350+UUvzBG3uDSbIuFo1s/SOsFrk4lYw+E
 FmXIvhzNXp9/ak0FV6sVz5FHL9nWwCHFNx1hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fbcTbLjQBdVoRHk/d84kLo+kIQplSoYyq9eL4kalAIg=;
 b=XDbOr0C12Mirib8rRE550rmhIIgoYAr3/RN6RFlnN2vucuYUy9mN1vPjXzl49iNAOi
 GJe4TEc7Gyuw/kFAsjqkdNvcpoYMPHdkX7B4xg5naBLfnGQ/7EMvnym+4c8/u0UKRY7S
 XcJTlX7B+9ZF/Fksc2lHG9Kjt0z+Tlebuuz6Md/N3JPo8rQ3/DU677CNvG/tY5bXKtut
 VDf9qQkc79v3O9RRVnl1vv46BfZtBHF/gmhaJH+CwJ1c1z0tnc+mc9fFkoRl2BRRpxm0
 UJFLk7XCBgQNU14dOCl8euCFHkn/WE6dVim8yFtMrpXTeVhyKBDAw7UGyaUkHeY3qOUA
 8d4g==
X-Gm-Message-State: AOAM531W2u1BBPjVmOBDVd62L6/SRZAXMYswF9unVYkUiBqDKiLhXIwS
 N8ZaNw3fMDIMMLf0kDxes/bqVQ==
X-Google-Smtp-Source: ABdhPJzNJZLm2iPngWfJxS9XRToP3pQBBsidtsIzut6JD0xBcpCQShNXcyl9Mg6LJAp8FykQiSujcA==
X-Received: by 2002:a05:6402:3596:: with SMTP id
 y22mr58217917edc.255.1636986701515; 
 Mon, 15 Nov 2021 06:31:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id lv19sm6965171ejb.54.2021.11.15.06.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 06:31:41 -0800 (PST)
Date: Mon, 15 Nov 2021 15:31:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH 0/3] drm/i915, agp/intel-ggt: clean up includes
Message-ID: <YZJvSyQCgWZA1lcb@phenom.ffwll.local>
References: <cover.1636977089.git.jani.nikula@intel.com>
 <87y25p1vm3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y25p1vm3.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 01:55:32PM +0200, Jani Nikula wrote:
> On Mon, 15 Nov 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> > Took Andy's patch [1] and expanded on it a bit.
> >
> > BR,
> > Jani.
> >
> >
> > [1] https://patchwork.freedesktop.org/patch/msgid/20211110102857.59604-1-andriy.shevchenko@linux.intel.com
> >
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > Andy Shevchenko (1):
> >   agp/intel-gtt: Replace kernel.h with the necessary inclusions
> 
> Forgot to mention, I replaced the drm/i915 prefix with agp/intel-gtt
> here, no other changes to Andy's patch.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also feel free to push through drm-intel.git just in case you wondered
about that.
-Daniel

> 
> >
> > Jani Nikula (2):
> >   drm/i915: include intel-gtt.h only where needed
> >   agp/intel-gtt: reduce intel-gtt dependencies more
> >
> >  drivers/char/agp/intel-gtt.c         | 1 +
> >  drivers/gpu/drm/i915/gt/intel_ggtt.c | 2 ++
> >  drivers/gpu/drm/i915/gt/intel_gt.c   | 2 ++
> >  drivers/gpu/drm/i915/i915_drv.h      | 1 -
> >  include/drm/intel-gtt.h              | 8 +++++---
> >  5 files changed, 10 insertions(+), 4 deletions(-)
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
