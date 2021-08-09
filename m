Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5163E499D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 18:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302D289C13;
	Mon,  9 Aug 2021 16:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5781B89B7B;
 Mon,  9 Aug 2021 16:19:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="214713513"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="214713513"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 09:19:41 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="588935639"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 09:19:41 -0700
Date: Mon, 9 Aug 2021 09:19:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drm-intel tree
Message-ID: <20210809161939.GS1556418@mdroper-desk1.amr.corp.intel.com>
References: <20210715141854.1ad4a956@canb.auug.org.au>
 <162823181614.15830.10618174106053255881@jlahtine-mobl.ger.corp.intel.com>
 <YRE2RwQ6XlUqbgmn@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRE2RwQ6XlUqbgmn@phenom.ffwll.local>
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

On Mon, Aug 09, 2021 at 04:05:59PM +0200, Daniel Vetter wrote:
> On Fri, Aug 06, 2021 at 09:36:56AM +0300, Joonas Lahtinen wrote:
> > Hi Matt,
> > 
> > Always use the dim tooling when applying patches, it will do the right
> > thing with regards to adding the S-o-b.
> 
> fd.o server rejects any pushes that haven't been done by dim, so how did
> this get through?

I definitely used dim for all of these patches, but I'm not sure how I
lost my s-o-b on this one.  Maybe when I edited the commit message after
'dim extract-tags' I accidentally deleted an extra line when I removed
the extract-tags marker?  It's the only patch where the line is missing,
so it's almost certainly human error on my part rather than something
dim did wrong.

> Matt, can you pls figure out and type up the patch to
> plug that hole?

Are you referring to a patch for dim here?  The i915 patch has already
landed, so we can't change its commit message now.


Matt

> 
> Thanks, Daniel
> 
> > 
> > Regards, Joonas
> > 
> > Quoting Stephen Rothwell (2021-07-15 07:18:54)
> > > Hi all,
> > > 
> > > Commit
> > > 
> > >   db47fe727e1f ("drm/i915/step: s/<platform>_revid_tbl/<platform>_revids")
> > > 
> > > is missing a Signed-off-by from its committer.
> > > 
> > > -- 
> > > Cheers,
> > > Stephen Rothwell
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
