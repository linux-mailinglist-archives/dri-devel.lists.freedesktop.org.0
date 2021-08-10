Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E723E5810
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 12:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A4789650;
	Tue, 10 Aug 2021 10:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A29989650
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 10:14:42 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b13so25535559wrs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 03:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y3QS1FCrYdlmaqXiG1OJXl7lfED7PyktVQVwB2bvr8I=;
 b=BmXmFejb/qK7hA260JrWvlGX/gLQXJ9JOd6a76DvoRbbGZE0g593TmqcZzU/wU5IIu
 YLakd4oCkkwGHF+AJfseqjQvDUEvI/IrRrxhJ8/jk+3PQX9Ve3nSU7FqsEQ/W7p29IU2
 Ei5X9ir+BQAqfPiHDoU+SrQot7rpZB1ioEGL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Y3QS1FCrYdlmaqXiG1OJXl7lfED7PyktVQVwB2bvr8I=;
 b=P6xkz0WfBk4zwssX6k/S+Sp9YoCEqV4GmcDvNGr4rd1YtlGQQMdCR/AlSeI6Hb1zJz
 XYt48A3IfZtls8SxFtvBTfkHg70XnjX6AQlu2FV1FoI1SJiG+sU3PbUSZrr+Yv1A4Nu5
 VvNzgD5O8nrquLEq5CNujJf++nqcnixQXefujBjhK7Yv+lYvNFjX0LOmaTvZ+1t9FD5Z
 7BItbRBoedkPaV9QTvGN1Z07XEIc2NVzSaZlfr44QviurXPWHHEwtcziFmzfPeK6Wl5u
 5TN9bYr9UeYWrU3kyFlinQU3MikgZ6itUr0M43qXUV8mr5HsfOVyiqfkoA/vS2SP3NT3
 Im/A==
X-Gm-Message-State: AOAM532hpC8zEnQaIf/6HyZS5kL/h//35GIWSC/KUul5mGhJRnSBpLJw
 AWcNG8ZUweF9n0k/hNyj4VwpZg==
X-Google-Smtp-Source: ABdhPJxvdfIs0xvibG7SFc6t4/K9jAdA0Rjh5XE53jIDVKUe4LIjSEvpazKK2sTVLHBfF9e8ZU0rQg==
X-Received: by 2002:a05:6000:18a5:: with SMTP id
 b5mr29599858wri.184.1628590480822; 
 Tue, 10 Aug 2021 03:14:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 140sm21738829wmb.43.2021.08.10.03.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 03:14:40 -0700 (PDT)
Date: Tue, 10 Aug 2021 12:14:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <YRJRju/zo5YiF1EB@phenom.ffwll.local>
Mail-Followup-To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210603193242.1ce99344@canb.auug.org.au>
 <20210708122048.534c1c4d@canb.auug.org.au>
 <20210810192636.625220ae@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810192636.625220ae@canb.auug.org.au>
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

On Tue, Aug 10, 2021 at 07:26:36PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 8 Jul 2021 12:20:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Thu, 3 Jun 2021 19:32:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > After merging the drm tree, today's linux-next build (htmldocs) produced
> > > these warnings:
> > > 
> > > Documentation/gpu/driver-uapi.rst:2412: WARNING: Duplicate C declaration, also defined at gpu/rfc/i915_gem_lmem:1393.
> > > Declaration is '.. c:enum:: drm_i915_gem_memory_class'.
> > > Documentation/gpu/driver-uapi.rst:2484: WARNING: Duplicate C declaration, also defined at gpu/rfc/i915_gem_lmem:2484.
> > > Declaration is '.. c:struct:: drm_i915_gem_memory_class_instance'.
> > > Documentation/gpu/driver-uapi.rst:7: WARNING: Duplicate C declaration, also defined at gpu/rfc/i915_gem_lmem:7.
> > > Declaration is '.. c:struct:: drm_i915_memory_region_info'.
> > > Documentation/gpu/driver-uapi.rst:2531: WARNING: Duplicate C declaration, also defined at gpu/rfc/i915_gem_lmem:2531.
> > > Declaration is '.. c:struct:: drm_i915_query_memory_regions'.
> > > Documentation/gpu/driver-uapi.rst:2595: WARNING: Duplicate C declaration, also defined at gpu/rfc/i915_gem_lmem:1393.
> > > Declaration is '.. c:struct:: drm_i915_gem_create_ext'.
> > > Documentation/gpu/driver-uapi.rst:2615: WARNING: Duplicate C declaration, also defined at gpu/rfc/i915_gem_lmem:1393.
> > > Declaration is '.. c:struct:: drm_i915_gem_create_ext_memory_regions'.
> > > 
> > > Introduced by (one or more of) commits
> > > 
> > >   0c1a77cbdafb ("drm/doc: add section for driver uAPI")
> > >   2bc9c04ea702 ("drm/doc/rfc: i915 DG1 uAPI")
> > >   727ecd99a4c9 ("drm/doc/rfc: drop the i915_gem_lmem.h header")  
> > 
> > I am still getting these warning.
> 
> Still getting them ...

Matt Auld is on vacation, and the other issue is that the tree where this
is from isn't in linux-next. So will take a bit to get sorted in
linux-next.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
