Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEF3ADD14D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 17:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A94A10E75B;
	Tue, 17 Jun 2025 15:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ww6DvpAe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9183A10E759;
 Tue, 17 Jun 2025 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750173953; x=1781709953;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MCjSl+kXEQTeDXa2Liysr1PgVP/E1cw3gWgQrWuIjII=;
 b=Ww6DvpAeN3hWWEw90AHA15D7S27XgVo/VwCqUG3Xjer4uE7qYTIeXuj9
 U5UfeuyVH9UUXXeXvvgFZ7NWIv/uaulXxDq1OijpLisXoC5ZcELb42jDY
 J+NJA9R/jZXuWRH8lLI5TIrDc+axDjHuBXMEcIAiAakUp0q/pAne+H7wt
 AVfahNIYEUNZeG600Z/22Rpg9k6Z4BkYlMc5i9n82hACouCEyAaD+/vev
 bE2pni5A5nXjR9XzVTAYcgJ90GyXpu7qPn+JsECVYuJc3YI1fDHtZFFFo
 CfgQfRmFr28R+Fc9jR1zxrPuXdUxyalMXQPo6PlHrIJ5e0ePeitfBa9Nh g==;
X-CSE-ConnectionGUID: U8WzqLfYQbqj97Wc1M6xGQ==
X-CSE-MsgGUID: 4KuAhO3BT1iMPc3I3cA9bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="39964703"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="39964703"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 08:25:40 -0700
X-CSE-ConnectionGUID: mBpc1KXPRNeg5EZQY+wP9w==
X-CSE-MsgGUID: PNAkrieySemDO/usG8+nyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="154102118"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.184])
 by orviesa005.jf.intel.com with SMTP; 17 Jun 2025 08:25:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 17 Jun 2025 18:25:30 +0300
Date: Tue, 17 Jun 2025 18:25:30 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Alex Hung <alex.hung@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "leo.liu@amd.com" <leo.liu@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>,
 "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>,
 "shashank.sharma@amd.com" <shashank.sharma@amd.com>,
 "agoins@nvidia.com" <agoins@nvidia.com>,
 "joshua@froggi.es" <joshua@froggi.es>,
 "mdaenzer@redhat.com" <mdaenzer@redhat.com>,
 "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 "victoria@system76.com" <victoria@system76.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "marcan@marcan.st" <marcan@marcan.st>,
 "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>,
 Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH V9 16/43] drm/colorop: Add 3x4 CTM type
Message-ID: <aFGI6rPrV9OVJCZ9@intel.com>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <20250430011115.223996-17-alex.hung@amd.com>
 <SJ1PR11MB61298CC231B8739FD48E30E1B970A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <20250616163212.62361605@eldfell>
 <SJ1PR11MB6129FDD1CBAA6FBFD978054FB973A@SJ1PR11MB6129.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SJ1PR11MB6129FDD1CBAA6FBFD978054FB973A@SJ1PR11MB6129.namprd11.prod.outlook.com>
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

On Tue, Jun 17, 2025 at 05:33:20AM +0000, Borah, Chaitanya Kumar wrote:
> 
> 
> > -----Original Message-----
> > From: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Sent: Monday, June 16, 2025 7:02 PM
> > To: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> > Cc: Alex Hung <alex.hung@amd.com>; dri-devel@lists.freedesktop.org; amd-
> > gfx@lists.freedesktop.org; wayland-devel@lists.freedesktop.org;
> > harry.wentland@amd.com; leo.liu@amd.com; ville.syrjala@linux.intel.com;
> > mwen@igalia.com; jadahl@redhat.com; sebastian.wick@redhat.com;
> > shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> > mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> > victoria@system76.com; daniel@ffwll.ch; Shankar, Uma
> > <uma.shankar@intel.com>; quic_naseer@quicinc.com;
> > quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com; marcan@marcan.st;
> > Liviu.Dudau@arm.com; sashamcintosh@google.com;
> > louis.chauvet@bootlin.com; Daniel Stone <daniels@collabora.com>
> > Subject: Re: [PATCH V9 16/43] drm/colorop: Add 3x4 CTM type
> > 
> > On Mon, 16 Jun 2025 11:30:23 +0000
> > "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
> > 
> > > > -----Original Message-----
> > > > From: Alex Hung <alex.hung@amd.com>
> > > > Sent: Wednesday, April 30, 2025 6:41 AM
> > > > To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> > > > Cc: wayland-devel@lists.freedesktop.org; harry.wentland@amd.com;
> > > > alex.hung@amd.com; leo.liu@amd.com; ville.syrjala@linux.intel.com;
> > > > pekka.paalanen@collabora.com; contact@emersion.fr; mwen@igalia.com;
> > > > jadahl@redhat.com; sebastian.wick@redhat.com;
> > > > shashank.sharma@amd.com; agoins@nvidia.com; joshua@froggi.es;
> > > > mdaenzer@redhat.com; aleixpol@kde.org; xaver.hugl@gmail.com;
> > > > victoria@system76.com; daniel@ffwll.ch; Shankar, Uma
> > > > <uma.shankar@intel.com>; quic_naseer@quicinc.com;
> > > > quic_cbraga@quicinc.com; quic_abhinavk@quicinc.com;
> > > > marcan@marcan.st; Liviu.Dudau@arm.com; sashamcintosh@google.com;
> > > > Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
> > > > louis.chauvet@bootlin.com; Daniel Stone <daniels@collabora.com>
> > > > Subject: [PATCH V9 16/43] drm/colorop: Add 3x4 CTM type
> > > >
> > > > From: Harry Wentland <harry.wentland@amd.com>
> > > >
> > > > This type is used to support a 3x4 matrix in colorops. A 3x4 matrix
> > > > uses the last column as a "bias" column. Some HW exposes support for
> > > > 3x4. The calculation looks like:
> > > >
> > > >  out   matrix    in
> > > >  |R|   |0  1  2  3 |   | R |
> > > >  |G| = |4  5  6  7 | x | G |
> > > >  |B|   |8  9  10 11|   | B |
> > > >                        |1.0|
> > > >
> > > > This is also the first colorop where we need a blob property to
> > > > program the property. For that we'll introduce a new DATA property
> > > > that can be used by all colorop TYPEs requiring a blob. The way a
> > > > DATA blob is read depends on the TYPE of the colorop.
> > > >
> > > > We only create the DATA property for property types that need it.
> > >
> > > Is there any value to adding pre-offsets [1] in the uapi?
> > >
> > >  |R/Cr|    | c0 c1 c2 |   ( |R/Cr|   |preoff0| )   |postoff0|
> > >  |G/Y | = | c3 c4 c5 | x ( |G/Y | + |preoff1| ) + |postoff1|
> > >  |B/Cb|   | c6 c7 c8 |   ( |B/Cb|   |preoff2| )   |postoff2|
> > >
> > > Handling limited range values is one use case that I can think of.
> > 
> > Hi,
> > 
> > in the mathematical sense, no. A pre-offset can always be converted into a
> > post-offset by multiplying it with the 3x3 matrix (and adding to the existing
> > post-offset). This can be pre-computed, no need to do it separately for every
> > pixel.
> > 
> > For hardware reasons, I have no idea.
> 
> Thank you for the reply, Pekka. Our hardware does allow programming Pre-offsets separately.
> Currently I can't think of a particular advantage of that if mathematically a post-offset does the job but I will keep this thread posted if I find something out.

Just FYI we have three different kinds of hardware:
- 3x3 matrix
- 3x3 matrix + programmable pre offsets + hardcoded post offsets for limited range conversion
- 3x3 matrix + programmable pre and post offsets

-- 
Ville Syrjälä
Intel
