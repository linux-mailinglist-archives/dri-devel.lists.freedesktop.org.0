Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C6F58AD07
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 17:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36116B6EDE;
	Fri,  5 Aug 2022 15:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE700B6E17;
 Fri,  5 Aug 2022 15:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659713148; x=1691249148;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BBkKKVV2C1HplLOBazIBlbRqLev0FCOZIzgV87+YAmg=;
 b=WkIAj4Obd0uKmzjJZKqztoTdndok3LT9lLnlwZWpAjDuZFUHT9ONliwA
 F7fGeolpaIt6SLH3Bz64Op9dEdxS9a39b/vrTtcZJnVcFT2BzlRMTLDkJ
 Kl/M74U1zsFPrNQO8SUZ8e1KnjTRN/IGZ8H/3YDwmWdXnlZ1I5oFqVC2m
 lfbx2vxoBe6XlfbxPcxRjOSfBpcsxycrTpWfP7fU672sY3hbrj9MrGERz
 DstSrKYp40E03f3Nyk3/X7nXsXEHuRSr3T95T6ZkvPd613XXjnoVLLxqt
 smH+hQkRO12UOdjs8OcFIhAJQV2G9d3M6IvjfaqC1qKCp5wtdRgL3OV79 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="376518239"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="376518239"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 08:25:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="663019373"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.252.33.203])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 08:25:45 -0700
Date: Fri, 5 Aug 2022 17:25:43 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PULL] drm-intel-next-fixes
Message-ID: <20220805172543.1cdcd58a@maurocar-mobl2>
In-Reply-To: <Yu0rsGnxcFmvzSPi@intel.com>
References: <YuwC0s6khQsun32+@intel.com>
 <20220805104642.0f0e1410@maurocar-mobl2>
 <Yu0rsGnxcFmvzSPi@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Andi Shyti <andi.shyti@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 5 Aug 2022 10:39:44 -0400
Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:

> On Fri, Aug 05, 2022 at 10:46:57AM +0200, Mauro Carvalho Chehab wrote:
> > Hi Rodrigo,
> > 
> > On Thu, 4 Aug 2022 13:33:06 -0400
> > Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> >   
> > > Hi Dave and Daniel,
> > > 
> > > Here goes drm-intel-next-fixes-2022-08-04:
> > > 
> > > - disable pci resize on 32-bit systems (Nirmoy)
> > > - don't leak the ccs state (Matt)
> > > - TLB invalidation fixes (Chris)
> > > 
> > > Thanks,
> > > Rodrigo.
> > > 
> > > The following changes since commit 2bc7ea71a73747a77e7f83bc085b0d2393235410:
> > > 
> > >   Merge tag 'topic/nouveau-misc-2022-07-27' of git://anongit.freedesktop.org/drm/drm into drm-next (2022-07-27 11:34:07 +1000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-08-04
> > > 
> > > for you to fetch changes up to e57b9369e0c6f60155027e120fafd4b57e385b71:
> > > 
> > >   drm/i915/gt: Batch TLB invalidations (2022-08-01 09:48:06 -0400)
> > > 
> > > ----------------------------------------------------------------
> > > - disable pci resize on 32-bit systems (Nirmoy)
> > > - don't leak the ccs state (Matt)
> > > - TLB invalidation fixes (Chris)
> > > 
> > > ----------------------------------------------------------------
> > > Chris Wilson (4):
> > >       drm/i915/gt: Ignore TLB invalidations on idle engines
> > >       drm/i915/gt: Invalidate TLB of the OA unit at TLB invalidations
> > >       drm/i915/gt: Skip TLB invalidations once wedged  
> >   
> > >       drm/i915/gt: Batch TLB invalidations  
> > This patch actually adds a regression due to a silly mistake. 
> > The fix is here:
> > 
> > 	https://patchwork.freedesktop.org/patch/496249/?series=106805&rev=4
> >  
> 
> Thank you for the heads up.
> 
> Since that patch is not merged yet, what are your recommendations here?
> Should I remove this from drm-intel-next-fixes now?

Those patches are OK to merge:

       drm/i915/gt: Ignore TLB invalidations on idle engines
       drm/i915/gt: Invalidate TLB of the OA unit at TLB invalidations
       drm/i915/gt: Skip TLB invalidations once wedged  

And helps reduce performance regressions due to TLB cache invalidation.
So, I would keep them.

With regards to the 4th patch, please don't merge:

	drm/i915/gt: Batch TLB invalidations

or merge it together with:

	drm/i915: pass a pointer for tlb seqno at vma_invalidate_tlb()

> Which regression is worst?

The regression caused by the batch patch is a lot worse, as it
effectively disables TLB cache invalidation. The fix was meant to
be merged at the patch, but somehow between several rebases and 3
machines involved on tests, internal development and upstream, the
branch actually sent upstream was not the right one. It got only
noticed after reviewing a newer patch. Yeah, that sucks.

> Also dim has trouble with fixes for fixes in the same round.
> Please ping me when you get that patch merged so I can pull that.

OK.

Regards,
Mauro
