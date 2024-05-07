Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517928BE163
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 13:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05E610F5AF;
	Tue,  7 May 2024 11:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mgYH6jrc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F045010F553
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 11:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715082568; x=1746618568;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+wD8Uwn5OazzcdIwydknz/8wgWC6FOFSbhto52Ccs4M=;
 b=mgYH6jrcVlHtw5rB3U7vsVst73cTsY/oVfS7ApElGxZYKMZI0kU7BNNr
 ZprFT0PkNUYvmwaVBhd7uepDOR8tAvIgI7xe0DDiVaSpUpxRH+Lv8wqPe
 3WLIGSEXpzSMmRTaEeMsksZygss1HOpkZUvow+u32xh1lvOPN2ul4dCXo
 ykn2064+96xjLunK3YLRplxDlWgMV5u8kZ73R7WGNddR0L8TZpb91QPSP
 BLFlIavkKA6G3gdrbkNh5sAI9+Oy3OxArSh7P2mr1+DHtaPGAkQjBLLH9
 q8COK8UFaM4dLbDRYfA+chrPJZJ+EjWzYFFIrRMpQoR5+eXq4TMF82/kk w==;
X-CSE-ConnectionGUID: 6FgyrnFVQ9aHurK8uiEbqA==
X-CSE-MsgGUID: U56WuahcR9+AzdaQ5rWkxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="33378896"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="33378896"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 04:49:27 -0700
X-CSE-ConnectionGUID: +wM8PPPXQkittj3f45C1UQ==
X-CSE-MsgGUID: n+w+6jXSQ7G8Hb6KRVHsDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="28464233"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 May 2024 04:49:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 07 May 2024 14:49:23 +0300
Date: Tue, 7 May 2024 14:49:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Joshua Ashton <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH] drm/uapi: Move drm_color_ctm_3x4 out from drm_mode.h
Message-ID: <ZjoVQxGKAZlvxIDW@intel.com>
References: <20240422085857.17651-1-ville.syrjala@linux.intel.com>
 <mB2sQaqlBgdsUPAXqWyd03aZAS8h1JKTff3_efNWi5uTEnwBWzIuRSEL72CUCohJ06bEzN9n5jvVzB4rApwfSB1fxwQWDBri4RZ9oSujNlg=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mB2sQaqlBgdsUPAXqWyd03aZAS8h1JKTff3_efNWi5uTEnwBWzIuRSEL72CUCohJ06bEzN9n5jvVzB4rApwfSB1fxwQWDBri4RZ9oSujNlg=@emersion.fr>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 24, 2024 at 03:48:24PM +0000, Simon Ser wrote:
> On Monday, April 22nd, 2024 at 10:58, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> 
> > drm_color_ctm_3x4 is some undocumented amgdpu private
> > uapi and thus has no business being in drm_mode.h.
> > At least move it to some amdgpu specific header, albeit
> > with the wrong namespace as maybe something somewhere
> > is using this already?
> 
> If something somewhere is using this already, I don't think the name
> matters? In other words, if there is a user, such user would be broken
> when moving the declaration anyways, so it shouldn't be more risky to
> do the rename as well?

I suppose. Not something I want to have to think about though.

I've pushed this to drm-misc-next with Harry's rb (thanks).

> 
> I'm holding off the libdrm header update until we find a solution.

-- 
Ville Syrjälä
Intel
