Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7D19EA021
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 21:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAAF10E543;
	Mon,  9 Dec 2024 20:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q5JNHvEx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED38C10E543;
 Mon,  9 Dec 2024 20:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733775439; x=1765311439;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j3jpc9uyPsFPe/7TykNxhb6jlmI8Iy8XYTCmmiLkEYo=;
 b=Q5JNHvExtdQlWwIROXdkrpOTmr3r2e3ml6CjLPCEzjJ2cvyaoRyvO6Sc
 Tvs8rBsKMr23i3Z/5N2Mrqgxg/hvBOVJvXL8QQKVwEmoAxRB2hp9k+J+e
 IjXjOvCQZM0KKd+KJEOLrzeYWkZonxuw3Pg+lrou2ZoJcjcXezpduwpC+
 jlNiXIRRNPYR1HyDxq1S0hm3HflIX+4oq6vPf6roUN58ooeQorUNcn/1R
 upBRh9YHf0RAnT/RM6I5StrQrbsLrFgk2I6ZBA5U/K36I2FWwExkAU6oe
 K3e8czpTiM3Z2E4bnJpWRilQQlW7dzbbVlcHgIAKwiHGaLLop3m+zRfVF w==;
X-CSE-ConnectionGUID: rv4hS2NTQyuj8fxsd1eRVw==
X-CSE-MsgGUID: sSjHZGTXTLSmTAxt9Pgf3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34218906"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="34218906"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 12:17:19 -0800
X-CSE-ConnectionGUID: UT0bvmFFSBOa51BQF/PO9g==
X-CSE-MsgGUID: 26WTx9qeRtWecluuIC1EJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="95664868"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 12:17:17 -0800
Date: Mon, 9 Dec 2024 22:17:14 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCHv10 00/10] Display Global Histogram
Message-ID: <Z1dQSjlF7qIzFROv@black.fi.intel.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
 <20241209165756.GQ3224633@mdroper-desk1.amr.corp.intel.com>
 <Z1csWzRHDzU0pds9@black.fi.intel.com>
 <20241209181842.GU5725@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209181842.GU5725@mdroper-desk1.amr.corp.intel.com>
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

On Mon, Dec 09, 2024 at 10:18:42AM -0800, Matt Roper wrote:
> On Mon, Dec 09, 2024 at 07:43:55PM +0200, Raag Jadav wrote:
> > On Mon, Dec 09, 2024 at 08:57:56AM -0800, Matt Roper wrote:
> > > On Mon, Dec 09, 2024 at 09:54:54PM +0530, Arun R Murthy wrote:
> > > > Display histogram is a hardware functionality where a statistics for 'x'
> > > > number of frames is generated to form a histogram data. This is notified
> > > > to the user via histogram event. Compositor will then upon sensing the
> > > > histogram event will read the histogram data from KMD via crtc property.
> > > > A library can be developed to take this generated histogram as an
> > > > input and apply some algorithm to generate an Image EnhancemenT(IET).
> > > > This is further fed back to the KMD via crtc property. KMD will use this
> > > > IET as a multiplicand factor to multiply with the incoming pixels at the
> > > > end of the pipe which is then pushed onto the display.
> > > > 
> > > > One such library Global Histogram Enhancement(GHE) will take the histogram
> > > > as input and applied the algorithm to enhance the density and then
> > > > return the enhanced factor. This library can be located @
> > > > https://github.com/intel/ghe
> > > > 
> > > > The corresponding mutter changes to enable/disable histogram, read the
> > > > histogram data, communicate with the library and write the enhanced data
> > > > back to the KMD is also pushed for review at https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873
> > > > and https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873/diffs?commit_id=270808ca7c8be48513553d95b4a47541f5d40206
> > > > The IGT changes for validating the histogram event and reading the
> > > > histogram is also pushed for review at https://patchwork.freedesktop.org/series/135789/
> > > 
> > > I think other people have already asked this on previous postings of
> > > these patches, but please don't try to manually hack the version numbers
> > > within a series.  What you just posted has "PATCHv10" on the cover
> > > letter, "PATCHv2" on one patch, "PATCHv3" on three patches, and the rest
> > > are unversioned "PATCH."  The general expectation these days is that
> > > versioning in the subject applies to the series as a whole, not the
> > > individual patches, so this causes a lot of confusion.  Posting like you
> > > did here also wrecks havoc on a lot of the tools people use to manage
> > > and compare series like the "b4" tool.
> > > 
> > > When generating and sending a new series, you should just do something
> > > like "git format-patch -v10 ..." so that the proper "v10" numbering is
> > > automatically applied to all the patches and we don't wind up with this
> > > strange jumble.
> > 
> > Isn't that the starting point?
> > 
> > https://kernelnewbies.org/FirstKernelPatch -> "Versioning patchsets"
> 
> That section is explaining that the descriptive changelogs for updated
> series can either be placed in the cover letter or in the individual
> patches; I don't see anything about going back and editing the "[PATCH"
> prefix of the subject line that was generated.  You generate the new
> copy of all the patches (and the cover letter) with one execution of
> "git format-patch," so whatever version number is generated should be
> consistent and correct as a series-wide version without editing.

Yes, that's what I meant above (which is explained with an example).

Raag
