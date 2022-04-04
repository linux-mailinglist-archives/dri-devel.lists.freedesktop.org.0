Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 873FE4F11A1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 11:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10FFD10EC01;
	Mon,  4 Apr 2022 09:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EEF10EBFC;
 Mon,  4 Apr 2022 09:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649063059; x=1680599059;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v9w+C2GgX86M8seswjaCKYzc2jfz72wfTwg0xZ6r42c=;
 b=hJMwxentbHYi7w6FxVTvNqUndpI0HH1M7RBbXY7NOAnNHt/qJPwuzAKa
 VSpeqiqO6w7309tWcyCL+Xo8kncIx7/dpZ7eVBEH2+ZUePRhmWTC5ocvg
 uKOYVX9zB0Ww78sNxOq3FyNA3ss/3v1a3i+SByCRetj4vS1yuEBwcjaA+
 QJC3nZTGgzTh1EI9kuhV5OiIEKamAVHh1+D47sU4b2vdHgc/Q8LdaMoUZ
 CYG9IWYISQu105kI09A2AquTSZBtY4TxQAUUXhp76GL0lZC3ozfhs1xVP
 /0+gWwcAmppkvdLtLSo1lF4r6hBNTy21Wc0pL45I0k/yF69Z3NL49JMMw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10306"; a="241058261"
X-IronPort-AV: E=Sophos;i="5.90,233,1643702400"; d="scan'208";a="241058261"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 02:04:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,233,1643702400"; d="scan'208";a="587508047"
Received: from skahiryx-mobl.ger.corp.intel.com (HELO [10.249.254.108])
 ([10.249.254.108])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2022 02:04:15 -0700
Message-ID: <94a68571ed19fb27bf7fb0b1e6f652f8cfed219c.camel@linux.intel.com>
Subject: Re: [Intel-gfx] Small bar recovery vs compressed content on DG2
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, Daniel Vetter <daniel@ffwll.ch>, 
 "Bloomfield, Jon" <jon.bloomfield@intel.com>, Kenneth W Graunke
 <kenneth.w.graunke@intel.com>, Lionel Landwerlin
 <lionel.g.landwerlin@linux.intel.com>
Date: Mon, 04 Apr 2022 11:04:13 +0200
In-Reply-To: <00378547-2a1f-a288-fd2e-12fca172e3ba@intel.com>
References: <162c1566-87c6-072f-d340-1693f6a71aea@linux.intel.com>
 <164750662822.7267.9355161518284202141@jlahtine-mobl.ger.corp.intel.com>
 <9eb06b576948707f9a0527b07b58b9640821bf19.camel@linux.intel.com>
 <d874ba08a65e4468baae737d826a85a5@intel.com>
 <ddd7af8f57320a7e2a84b3fdb94e3050eae81857.camel@linux.intel.com>
 <f80dc6ccf38343beb819e1584a9017f7@intel.com>
 <CAKMK7uGsCFJR2d-m0TsVjEy36bN1Z38fuoME6gezA9xY_MkSeA@mail.gmail.com>
 <00378547-2a1f-a288-fd2e-12fca172e3ba@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-3.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kenneth Graunke <kenneth@whitecape.org>, "Vetter,
 Daniel" <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-03-31 at 10:25 +0100, Matthew Auld wrote:
> On 18/03/2022 18:12, Daniel Vetter wrote:
> > Maybe also good to add dri-devel to these discussions.
> > 
> > I'm not sure where exactly we landed with dgpu error capture (maybe
> > I
> > should check the code but it's really w/e here), but I think we can
> > also toss in "you need a non-recoverable context for error capture
> > to
> > work on dgpu". Since that simplifies things even more. Maybe Thomas
> > forgot to add that to the list of restrictions.

Not sure whether we reached a conclusion here, but after discussing
with Daniel in another thread, What about:

1) Reject error capture on recoverable contexts. That means we are free
to implement reasonable error capture from outside the fence signalling
critical path moving forward. Makes it easier to blit buffer content.

2) No additional restrictions on capture buffers, They are best effort
anyway. If they are not mappable, they don't end up in the error log
for now (affects only small BAR systems). Moving forward we can blit
the content to system or mappable LMEM for capture once the gpu reset
has completed.

/Thomas

> > 
> > Anyway on the "we can't capture lmem-only compressed buffers", I
> > think
> > that's totally fine. Those are for render targets, and we don't
> > capture those. Adding Lionel and Ken to confirm.
> 
> Ken, Lionel: gentle ping on this?
> 
> > -Daniel
> > 
> > On Fri, 18 Mar 2022 at 17:26, Bloomfield, Jon
> > <jon.bloomfield@intel.com> wrote:
> > > 
> > > @Thomas Hellström - I agree :-)
> > > 
> > > My question was really to @Joonas Lahtinen, who was saying we
> > > could always migrate in the CPU fault handler. I am pushing back
> > > on that unless we have no choice. It's the very complication we
> > > were trying to avoid with the current SAS. If that's what's
> > > needed, then so be it. But I'm asking whether we can instead
> > > handle this specially, instead of adding generic complexity to
> > > the primary code paths.
> > > 
> > > Jon
> > > 
> > > > -----Original Message-----
> > > > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Sent: Friday, March 18, 2022 2:48 AM
> > > > To: Bloomfield, Jon <jon.bloomfield@intel.com>; Joonas Lahtinen
> > > > <joonas.lahtinen@linux.intel.com>; Intel Graphics Development
> > > > <intel-
> > > > gfx@lists.freedesktop.org>; Auld, Matthew
> > > > <matthew.auld@intel.com>; C,
> > > > Ramalingam <ramalingam.c@intel.com>; Vetter, Daniel
> > > > <daniel.vetter@intel.com>
> > > > Subject: Re: Small bar recovery vs compressed content on DG2
> > > > 
> > > > Hi,
> > > > 
> > > > On Thu, 2022-03-17 at 18:21 +0000, Bloomfield, Jon wrote:
> > > > > +@Vetter, Daniel
> > > > > 
> > > > > Let's not start re-inventing this on the fly again. That's
> > > > > how we got
> > > > > into trouble in the past. The SAS/Whitepaper does currently
> > > > > require
> > > > > the SMEM+LMEM placement for mappable, for good reasons.
> > > > 
> > > > Just to avoid any misunderstandings here:
> > > > 
> > > > We have two hard requirements from Arch that clash, main
> > > > problem is
> > > > compressed bos can't be captured on error with current designs.
> > > > 
> > > >  From an engineering point of view we can do little more than
> > > > list
> > > > options available to resolve this and whether they are hard or
> > > > not so
> > > > hard to implemement. But IMHO Arch needs to agree on what's got
> > > > to
> > > > give.
> > > > 
> > > > Thanks,
> > > > Thomas
> > > > 
> > > > 
> > > > > 
> > > > > We cannot 'always migrate to mappable in the fault handler'.
> > > > > Or at
> > > > > least, this is not as trivial as it is to write in a sentence
> > > > > due to
> > > > > the need to spill out other active objects, and all the usual
> > > > > challenges with context synchronization etc. It is possible,
> > > > > perhaps
> > > > > with a lot of care, but it is challenging to guarantee, easy
> > > > > to
> > > > > break, and not needed for 99.9% of software. We are trying to
> > > > > simplify our driver stack.
> > > > > 
> > > > > If we need a special mechanism for debug, we should devise a
> > > > > special
> > > > > mechanism, not throw out the general LMEM+SMEM requirement.
> > > > > Are
> > > > there
> > > > > any identified first-class clients that require such access,
> > > > > or is it
> > > > > only debugging tools?
> > > > > 
> > > > > If only debug, then why can't the tool use a copy engine
> > > > > submission
> > > > > to access the data in place? Or perhaps a bespoke ioctl to
> > > > > access
> > > > > this via the KMD (and kmd submitted copy-engine BB)?
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > Jon
> > > > > 
> > > > > > -----Original Message-----
> > > > > > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > Sent: Thursday, March 17, 2022 2:35 AM
> > > > > > To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>;
> > > > > > Bloomfield,
> > > > > > Jon
> > > > > > <jon.bloomfield@intel.com>; Intel Graphics Development
> > > > > > <intel-
> > > > > > gfx@lists.freedesktop.org>; Auld, Matthew
> > > > > > <matthew.auld@intel.com>;
> > > > > > C,
> > > > > > Ramalingam <ramalingam.c@intel.com>
> > > > > > Subject: Re: Small bar recovery vs compressed content on
> > > > > > DG2
> > > > > > 
> > > > > > On Thu, 2022-03-17 at 10:43 +0200, Joonas Lahtinen wrote:
> > > > > > > Quoting Thomas Hellström (2022-03-16 09:25:16)
> > > > > > > > Hi!
> > > > > > > > 
> > > > > > > > Do we somehow need to clarify in the headers the
> > > > > > > > semantics for
> > > > > > > > this?
> > > > > > > > 
> > > > > > > >   From my understanding when discussing the CCS
> > > > > > > > migration series
> > > > > > > > with
> > > > > > > > Ram, the kernel will never do any resolving
> > > > > > > > (compressing /
> > > > > > > > decompressing) migrations or evictions which basically
> > > > > > > > implies
> > > > > > > > the
> > > > > > > > following:
> > > > > > > > 
> > > > > > > > *) Compressed data must have LMEM only placement,
> > > > > > > > otherwise the
> > > > > > GPU
> > > > > > > > would read garbage if accessing from SMEM.
> > > > > > > 
> > > > > > > This has always been the case, so it should be documented
> > > > > > > in the
> > > > > > > uAPI
> > > > > > > headers and kerneldocs.
> > > > > > > 
> > > > > > > > *) Compressed data can't be assumed to be mappable by
> > > > > > > > the CPU,
> > > > > > > > because
> > > > > > > > in order to ensure that on small BAR, the placement
> > > > > > > > needs to be
> > > > > > > > LMEM+SMEM.
> > > > > > > 
> > > > > > > Not strictly true, as we could always migrate to the
> > > > > > > mappable
> > > > > > > region
> > > > > > > in
> > > > > > > the CPU fault handler. Will need the same set of tricks
> > > > > > > as with
> > > > > > > limited
> > > > > > > mappable GGTT in past.
> > > > > > 
> > > > > > In addition to Matt's reply:
> > > > > > 
> > > > > > Yes, if there is sufficient space. I'm not sure we want to
> > > > > > complicate
> > > > > > this to migrate only part of the buffer to mappable on a
> > > > > > fault
> > > > > > basis?
> > > > > > Otherwise this is likely to fail.
> > > > > > 
> > > > > > One option is to allow cpu-mapping from SYSTEM like TTM is
> > > > > > doing
> > > > > > for
> > > > > > evicted buffers, even if SYSTEM is not in the placement
> > > > > > list, and
> > > > > > then
> > > > > > migrate back to LMEM for gpu access.
> > > > > > 
> > > > > > But can user-space even interpret the compressed data when
> > > > > > CPU-
> > > > > > mapping?
> > > > > > without access to the CCS metadata?
> > > > > > 
> > > > > > > 
> > > > > > > > *) Neither can compressed data be part of a CAPTURE
> > > > > > > > buffer,
> > > > > > > > because
> > > > > > > > that
> > > > > > > > requires the data to be CPU-mappable.
> > > > > > > 
> > > > > > > Especially this will be too big of a limitation which we
> > > > > > > can't
> > > > > > > really
> > > > > > > afford
> > > > > > > when it comes to debugging.
> > > > > > 
> > > > > > Same here WRT user-space interpretation.
> > > > > > 
> > > > > > This will become especially tricky on small BAR, because
> > > > > > either we
> > > > > > need
> > > > > > to fit all compressed buffers in the mappable portion, or
> > > > > > be able
> > > > > > to
> > > > > > blit the contents of the capture buffers from within the
> > > > > > fence
> > > > > > signalling critical section, which will require a lot of
> > > > > > work I
> > > > > > guess.
> > > > > > 
> > > > > > /Thomas
> > > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > Regards, Joonas
> > > > > > > 
> > > > > > > > Are we (and user-mode drivers) OK with these
> > > > > > > > restrictions, or
> > > > > > > > do we
> > > > > > > > need
> > > > > > > > to rethink?
> > > > > > > > 
> > > > > > > > Thanks,
> > > > > > > > 
> > > > > > > > Thomas
> > > > > > > > 
> > > > > > > > 
> > > > > > 
> > > > > 
> > > > 
> > > 
> > 
> > 


