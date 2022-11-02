Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2706F615BCF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 06:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B303D10E050;
	Wed,  2 Nov 2022 05:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B32010E008;
 Wed,  2 Nov 2022 05:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667366987; x=1698902987;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yvRRoJflohH1lmpwGZNxOcm64jldS95YZAAd9BMsHzI=;
 b=XNhu3Gu2ngEkQMsE7ywXyn6qZapaEjJHRdDM+Ni0c9pFyYIVd3nMuDC0
 Mc1pikF5/7dhuFit2wofWyTAlvLpcuOAS1FKUu7wc6MGo3uU4GL03P6Iy
 Savadfo0B7vLEYzMRbskIDHvaErtEvgjTFLrZKFWRgkRI3YKsnubbFSHl
 h1uvHZzkqAFdBuX8S7XpJ0MI8jetsg1Y6UPeAqXtC3Y7a4Lh/4bZXN7gF
 wlsnlo7eNJisB6wBPA65WJuCmPllBMs5Em+Hifc7NIqThbRb9jyVN27/k
 eKh7HTGyR+WQDkghdr5BnJ+eTkSLOERgmVlUHXWqGNTuUZMziis7ULU/L w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="373540171"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="373540171"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2022 22:29:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="739610687"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; d="scan'208";a="739610687"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga002.fm.intel.com with SMTP; 01 Nov 2022 22:29:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Nov 2022 07:29:41 +0200
Date: Wed, 2 Nov 2022 07:29:41 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PULL] drm-intel-next
Message-ID: <Y2IARZ1YTK4f3wJE@intel.com>
References: <Y1wd6ZJ8LdJpCfZL@intel.com> <Y1xonYqg5qrbTFA/@intel.com>
 <d97f246025eefa859708b1923a81bd15a9fda179.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d97f246025eefa859708b1923a81bd15a9fda179.camel@intel.com>
X-Patchwork-Hint: comment
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
Cc: "dim-tools@lists.freedesktop.org" <dim-tools@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 01, 2022 at 10:29:24PM +0000, Vivi, Rodrigo wrote:
> On Sat, 2022-10-29 at 02:41 +0300, Ville Syrjälä wrote:
> > On Fri, Oct 28, 2022 at 02:22:33PM -0400, Rodrigo Vivi wrote:
> > > Hi Dave and Daniel,
> > > 
> > > Here goes the first chunk of drm-intel-next targeting 6.2
> > > 
> > > The highlight goes to Ville with many display related clean-up
> > > and improvement, some other MTL enabling work and many other
> > > fixes and small clean-ups.
> > > 
> > > drm-intel-next-2022-10-28:
> > ...
> > > - ELD precompute and readout (Ville)
> > 
> > A slight clarification seems to be in order. The ELD
> > precompute+readout is in fact not in yet. This was just a pile
> > of cleanups and minor fixes. The real ELD stuff will come later,
> > once we figure out how we actually want to do it.
> 
> Sorry for the confusion. I have just used the subject of your series
> as summary: 
> [Intel-gfx] [PATCH 00/22] drm/i915: ELD precompute and readout

Only part of the series went in.

> 
> Should I change that to ELD precompute and readout

Just "audio cleanups" or something like that would be the
approximate truth.

-- 
Ville Syrjälä
Intel
