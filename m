Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 438BA3E537F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 08:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C303489D87;
	Tue, 10 Aug 2021 06:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A68D89D87
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 06:27:29 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i4so7250808wru.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 23:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=GiCRq9oiIUoYtaK/RUZid1gDex+gXMLXotTaeNIUmiA=;
 b=TSLt8sQv3KMNzzPS3fSD/gdF+b63+EbUkwUJzjp0hhlGdZUZ7Rd/AoOvp0uJmLSyth
 idWsFEWNxLZHMkE7N0Us6P8gpIMwEjBGSYsiiNKmOb86eZDu77SO4PLc1ir83QOgXCk1
 f5jZQSvinIlEibg/HrnX+nJfX9P07P/P7Zz7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=GiCRq9oiIUoYtaK/RUZid1gDex+gXMLXotTaeNIUmiA=;
 b=P+pzbatZ1xyHplkxDUn9xrtxG1i5ov7gKMiwUwK8Yj25QZTVK7lJm+aKOVCNHoh4+F
 XgKqkIBx7Rrg8ZIppyRTAyq0DPY2joh38ksUz/2db/Rre6TEO+iIbz4iaTnRmK8ni5U5
 fCQMxG+zLEfeUlw8bh7DtS+COr5plLOoPIFzupNAtEAxI558l+rWVF5rPhly1jsAW4hU
 TgKAdjOvokVF8mhbWWFxjfS9VQhPhbDOoBtT3jOjMZcgQZr32Ygrp63MehyGMDmytryZ
 Y6tXBnVd5EXfNwFna/kghIdC1cxzJXV7RrJnbobwj4DE9pPnmbmi3LyGsUDopl9yJnKA
 8JNA==
X-Gm-Message-State: AOAM532BvXs4tbkizN40djRfEaUfFOC3O+KD6z0vwloyHvXKEIWRJrob
 Y/ERZ5f5SjcPEON5m5+6q4Duaw==
X-Google-Smtp-Source: ABdhPJzwYtfos5qmwNgPH3qxN41P8KJZR3M++G+4LLPpLcVuvruDMmm0ZBtRneBZ640axXBl0KJ93g==
X-Received: by 2002:a5d:6948:: with SMTP id r8mr15347886wrw.136.1628576847772; 
 Mon, 09 Aug 2021 23:27:27 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g16sm26620083wro.63.2021.08.09.23.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 23:27:27 -0700 (PDT)
Date: Tue, 10 Aug 2021 08:27:25 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [Intel-gfx] linux-next: Signed-off-by missing for commit in the
 drm-intel tree
Message-ID: <YRIcTTsEF0Kg7F8K@phenom.ffwll.local>
Mail-Followup-To: Matt Roper <matthew.d.roper@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210715141854.1ad4a956@canb.auug.org.au>
 <162823181614.15830.10618174106053255881@jlahtine-mobl.ger.corp.intel.com>
 <YRE2RwQ6XlUqbgmn@phenom.ffwll.local>
 <20210809161939.GS1556418@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809161939.GS1556418@mdroper-desk1.amr.corp.intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 09, 2021 at 09:19:39AM -0700, Matt Roper wrote:
> On Mon, Aug 09, 2021 at 04:05:59PM +0200, Daniel Vetter wrote:
> > On Fri, Aug 06, 2021 at 09:36:56AM +0300, Joonas Lahtinen wrote:
> > > Hi Matt,
> > > 
> > > Always use the dim tooling when applying patches, it will do the right
> > > thing with regards to adding the S-o-b.
> > 
> > fd.o server rejects any pushes that haven't been done by dim, so how did
> > this get through?
> 
> I definitely used dim for all of these patches, but I'm not sure how I
> lost my s-o-b on this one.  Maybe when I edited the commit message after
> 'dim extract-tags' I accidentally deleted an extra line when I removed
> the extract-tags marker?  It's the only patch where the line is missing,
> so it's almost certainly human error on my part rather than something
> dim did wrong.

Yeah that's an expected failure model, and dim is supposed to catch that
by rechecking for sobs when you push. See dim_push_branch ->
checkpatch_commit_push_range in dim. So you can hand-edit stuff however
you want, dim /should/ catch it when pushing. That it didn't is kinda
confusing and I'd like to know why that slipped through.

> > Matt, can you pls figure out and type up the patch to
> > plug that hole?
> 
> Are you referring to a patch for dim here?  The i915 patch has already
> landed, so we can't change its commit message now.

Yeah dim, not drm-intel, that can't be fixed anymore because it's all
baked in.
-Daniel

> 
> 
> Matt
> 
> > 
> > Thanks, Daniel
> > 
> > > 
> > > Regards, Joonas
> > > 
> > > Quoting Stephen Rothwell (2021-07-15 07:18:54)
> > > > Hi all,
> > > > 
> > > > Commit
> > > > 
> > > >   db47fe727e1f ("drm/i915/step: s/<platform>_revid_tbl/<platform>_revids")
> > > > 
> > > > is missing a Signed-off-by from its committer.
> > > > 
> > > > -- 
> > > > Cheers,
> > > > Stephen Rothwell
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> VTT-OSGC Platform Enablement
> Intel Corporation
> (916) 356-2795

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
