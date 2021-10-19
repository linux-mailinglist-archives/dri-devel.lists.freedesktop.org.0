Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6AD4331D0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 11:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F6C6EB65;
	Tue, 19 Oct 2021 09:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426BF6EB60;
 Tue, 19 Oct 2021 09:08:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="228734459"
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; d="scan'208";a="228734459"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 02:08:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,383,1624345200"; d="scan'208";a="462692561"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 19 Oct 2021 02:08:37 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 19 Oct 2021 12:08:36 +0300
Date: Tue, 19 Oct 2021 12:08:36 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH 0/4] drm/i915: Make the driver not oops on load on old
 machines
Message-ID: <YW6LFInWuSGMc3mL@intel.com>
References: <20211014090941.12159-1-ville.syrjala@linux.intel.com>
 <CAPM=9twtQFKU_oFyEoKg3j-OgVNDrODN180eYM+ASvFYyWjm3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPM=9twtQFKU_oFyEoKg3j-OgVNDrODN180eYM+ASvFYyWjm3w@mail.gmail.com>
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

On Mon, Oct 18, 2021 at 09:54:59AM +1000, Dave Airlie wrote:
> On Thu, 14 Oct 2021 at 19:09, Ville Syrjala
> <ville.syrjala@linux.intel.com> wrote:
> >
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Fix a pile of regression on older machines which just oops the driver
> > on load.
> >
> 
> For all 4:
> 
> Reviewed-by: Dave Airlie <airlied@redhat.com>
> 
> though it would be nice if the clflushes has more justifications on
> initial patch submission/review, maybe something for gt team to keep
> an eye for patches coming out from internal.

Thanks. clflush fixes pushed to drm-intel-gt-next. The hpd fix
I pushed to drm-intel-next already earlier.

-- 
Ville Syrjälä
Intel
