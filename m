Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F8B454D8F
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 20:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3016E3BB;
	Wed, 17 Nov 2021 19:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821B36E3BB;
 Wed, 17 Nov 2021 19:01:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="294845750"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="294845750"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 11:01:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="455004381"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 17 Nov 2021 11:01:17 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 17 Nov 2021 21:01:16 +0200
Date: Wed, 17 Nov 2021 21:01:16 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3 5/5] drm/i915/dg2: extend Wa_1409120013 to
 DG2
Message-ID: <YZVRfD9O7yExAakv@intel.com>
References: <20211116174818.2128062-1-matthew.d.roper@intel.com>
 <20211116174818.2128062-6-matthew.d.roper@intel.com>
 <YZVNR9i5nkJZIORP@intel.com>
 <20211117185139.GD2020422@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211117185139.GD2020422@mdroper-desk1.amr.corp.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 17, 2021 at 10:51:39AM -0800, Matt Roper wrote:
> On Wed, Nov 17, 2021 at 08:43:19PM +0200, Ville Syrjälä wrote:
> > On Tue, Nov 16, 2021 at 09:48:18AM -0800, Matt Roper wrote:
> > > From: Matt Atwood <matthew.s.atwood@intel.com>
> > > 
> > > Extend existing workaround 1409120013 to DG2.
> > 
> > I don't see this listed for DG2.
> 
> This seems to be problem with the DG2 query since for some reason they
> marked this workaround as 'driver_change_required' rather than
> 'driver_permanent_wa' in the database and that prevents it from showing
> up in some of the queries properly.  The DG2-specific ID number
> to check is 1409222275.

Bit of mes that one. I can't really figure out if dg2 is the only
d13 platform that needs this or might there be others?

-- 
Ville Syrjälä
Intel
