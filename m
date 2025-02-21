Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972EBA3F1E8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 11:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CA810E255;
	Fri, 21 Feb 2025 10:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ah5SMrmq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73C410E255
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 10:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740133482; x=1771669482;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=ak5HhJgea9kjBINxSEsca6JCZ/SZSug8UZ6ylG+W/74=;
 b=ah5SMrmq++rI7SvYvcdNCiZObOapDmCCPHRp0sdWe3ZZbbSLHRDZLn15
 OOuEK2GLzr6IkIoPlBM4nq9pE0mf4RAT3ppvRduhmUZFc4Cj/qSpgmXQA
 Dz9QF9YHQs1UJQUfvmyjXmE9WfASlZkYPY8Yke8cfSh88Aomt3dQeFuv+
 n03lhrN6bXHkqTFW9mThd1gg7DoqGs3ALL8Mph/NTZ+QwDxnSNvWx5jAZ
 ZIhZC029w2EYRuCOCiLSsKzFZYopBbn/+P2R1kuPmpXCPgbofDc9h4zDL
 90CaRX+Tlgrlav6msgdlgI57rLPfHVNoCTHTZSpOFaJ2f6gzLPI2RxfsS Q==;
X-CSE-ConnectionGUID: DXwgXw9JSUmCFjIkjMRnkg==
X-CSE-MsgGUID: pySSqSTxSOGIyyL/0FYYMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41154398"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41154398"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 02:24:42 -0800
X-CSE-ConnectionGUID: 9XQmhJ4JRW2FqEUCh10x+w==
X-CSE-MsgGUID: 6NWjHjybRA++5n1NIlQ13g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="146197544"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 02:24:39 -0800
Date: Fri, 21 Feb 2025 12:24:36 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>, arnd@arndb.de,
 andriy.shevchenko@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/draw: include bug.h
Message-ID: <Z7hUZIYhg6ShNJCf@black.fi.intel.com>
References: <20250221050804.2764553-1-raag.jadav@intel.com>
 <20250221050804.2764553-3-raag.jadav@intel.com>
 <2025022135-aviation-evident-2518@gregkh>
 <Z7hMPIxFyd6cqbC0@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7hMPIxFyd6cqbC0@phenom.ffwll.local>
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

On Fri, Feb 21, 2025 at 10:49:48AM +0100, Simona Vetter wrote:
> On Fri, Feb 21, 2025 at 07:05:12AM +0100, Greg KH wrote:
> > On Fri, Feb 21, 2025 at 10:38:04AM +0530, Raag Jadav wrote:
> > > Directly include bug.h for WARN() helpers instead of relying on
> > > intermediate headers.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_draw.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
> > > index cb2ad12bce57..0a0e1eebf481 100644
> > > --- a/drivers/gpu/drm/drm_draw.c
> > > +++ b/drivers/gpu/drm/drm_draw.c
> > > @@ -5,6 +5,7 @@
> > >   */
> > >  
> > >  #include <linux/bits.h>
> > > +#include <linux/bug.h>
> > >  #include <linux/iosys-map.h>
> > >  #include <linux/types.h>
> > >  
> > > -- 
> > > 2.34.1
> > > 
> > 
> > Does patch 1 break this file without this patch so this series is not in
> > order?
> > 
> > I'll be glad to take patch 1 in my tree, but I don't want to break
> > anything else.
> 
> Yeah looks inverted. In case this is all there is I'm happy to land this
> patch through your tree, that seems like the simplest approach.

Yep, I messed up the ordering. Let me send out a v3 since I need to fix
nios2 builds anyway.

> Acked-by: Simona Vetter <simona.vetter@ffwll.ch>

Thank you!

Raag
