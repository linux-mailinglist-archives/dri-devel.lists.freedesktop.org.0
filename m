Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CAA4E64FA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 15:19:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2D410E8B8;
	Thu, 24 Mar 2022 14:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED1A10E0D3;
 Thu, 24 Mar 2022 14:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648131571; x=1679667571;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=ThduxQcEHJZKb46KqQQqsMcCHsHJPrv898mD73J2fC8=;
 b=ljEs0vpttPYdGnYgtQWEPjR18goUkXJ6Fs4/9LorOfTc0Ns9XOMpTYrp
 Lzaa5gchVnI8GzjTfWd5GqU/aLIh2HIu+GTr71yYU16h15MMjeSiE/GhA
 oN78tGBqWJC8MIILndwBnMtGchVDRvLC5+Jwnnv95CNStOv+U6tpMOrcT
 e7TzEOeLrN5s3sTYP08NpiVKM2tgdqQb+WJX0I1l43FEHYUvLhNPuUXzH
 JmoN+YyLDrOjf9jDicAE4fWgzbQfoAmxrS4fMxBZE6rLhUbSQs6rlA3RR
 kAJ+s89OcRPYYl7OI1v5ckmitVEcH2me3Z+AYibp++lV6lGPc5tYi/kWP A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="258575224"
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; d="scan'208";a="258575224"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 07:19:30 -0700
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; d="scan'208";a="544665036"
Received: from ideak-desk.fi.intel.com ([10.237.72.175])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 07:19:28 -0700
Date: Thu, 24 Mar 2022 16:19:24 +0200
From: Imre Deak <imre.deak@intel.com>
To: "Chery, Nanley G" <nanley.g.chery@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 15/19] drm/i915/dg2: Add DG2 unified
 compression
Message-ID: <Yjx97IKACHS4xGPW@ideak-desk.fi.intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
 <20220201104132.3050-16-ramalingam.c@intel.com>
 <CAJDL4uKokNLKhx1Yd_gnxyqto+bcg+=efLZFLVxqp-D7aQW0oQ@mail.gmail.com>
 <326a4099-f7d9-8adf-f371-d8ab0532256e@gmail.com>
 <fd88996f283648f8b4eca3f3844d6e8d@intel.com>
 <20220318173943.GA2622954@ideak-desk.fi.intel.com>
 <75a48ad279d449c399693b73ee50bb97@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75a48ad279d449c399693b73ee50bb97@intel.com>
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
Reply-To: imre.deak@intel.com
Cc: Nanley Chery <nanleychery@gmail.com>,
 "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 24, 2022 at 01:40:37AM +0200, Chery, Nanley G wrote:
> > [...]
> > Capturing all the above would you be ok with the following?:
> > 
> > Intel color control surfaces (CCS) for DG2 render compression.
> > 
> > The main surface is Tile 4 and at plane index 0. The CCS data is stored
> > outside of the GEM object in a reserved memory area dedicated for the
> > storage of the CCS data from all GEM objects. The main surface pitch is
> > required to be a multiple of four Tile 4 widths.
> > 
> > 
> > Intel color control surfaces (CCS) for DG2 media compression.
> > 
> > The main surface is Tile 4 and at plane index 0. For semi-planar formats
> > like NV12, the UV plane is Tile 4 at plane index 1. The CCS data both for
> > the main and semi-planar UV planes are stored outside of the GEM object
> 
> This kind of implies that the Y plane is the main surface, but it's not more
> "main" than the UV plane right? Seems like we should specifically call out the
> Y plane for clarity. Maybe something like:
> 
> For semi-planar formats like NV12, the Y and UV planes are Tile 4 and are 
> located at plane indices 0 and 1, respectively. The CCS for all planes are stored 
> outside of the GEM object

Ok, makes sense.

> > in a reserved memory area dedicated for the storage of the CCS data from
> > all GEM objects. The main surface pitch is required to be a multiple of
> > four Tile 4 widths.
> 
> Looks good to me. Main suggestion I have here is to substitute 
> "from all GEM objects" with "for all compressible GEM objects".

"for all RC/RC_CC/MC CCS compressible GEM objects" would be more
precise, in case there are other ways to compress data. Either way looks
ok to me.

> Happy to look at further revisions, but with that change at least,
> Acked-by: Nanley Chery <nanley.g.chery@intel.com>

Thanks. 

--Imre
