Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D32925F32
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 13:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A43910E7BF;
	Wed,  3 Jul 2024 11:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k++e98Sv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C25610E7BC;
 Wed,  3 Jul 2024 11:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720007576; x=1751543576;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EpdJkfBmRQKg1jeirUfiq32WPAAoiCKsPGk8hCr+s6c=;
 b=k++e98Svz1pe27wKdkkCtLiGNH3zqKd/onHOJSs1ssdQ9VPvTdJPswHi
 YWlQAx5mmz0LrCZ5MkGx9Rk8hBSXlGGzPtfbDYAbHp+lyoMrfAuuoPTCr
 3MA+lHT1R++tb7tE6HYI3qcPnDirN+ft31QT5mb052lYw2K2qHuah0r/N
 VAmUVPpoSSxtYkGUVISv2vig5jibfgJJVs1BFLFNNrVKDkN9ux6XsPdTQ
 EsT5GcnxpUWHbJIvGop78fJPBcOG2bqO7gti57Pb5K4y3zLIp31xCY26K
 6QMjTONPDq7+HO9Y+0t46ooGaKSk1XOvw/i7ff50PqxKoDl9bUszyjGNa g==;
X-CSE-ConnectionGUID: MEHVd34HRYORei4NSaCV5Q==
X-CSE-MsgGUID: QuDzNqgnRay/u0i5GmvJAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17440573"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="17440573"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 04:52:55 -0700
X-CSE-ConnectionGUID: RPKwiF2YT5uq5i+JYJQ79g==
X-CSE-MsgGUID: 3q321IkRR06QRpPPf4qnAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46205175"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Jul 2024 04:52:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 14:52:49 +0300
Date: Wed, 3 Jul 2024 14:52:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: jim.cromie@gmail.com
Cc: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk,
 joe@perches.com, mcgrof@kernel.org
Subject: Re: [PATCH v9 30/52] drm-dyndbg: adapt drm core to use dyndbg
 classmaps-v2
Message-ID: <ZoU7kR2aYwVDvd_G@intel.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
 <20240702215804.2201271-31-jim.cromie@gmail.com>
 <ZoSOMClB0MeWeokU@intel.com>
 <CAJfuBxzsZUpO-Q_uAfMhzXs0WHYMTnj1F8ju7af-kQZKQjLvNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJfuBxzsZUpO-Q_uAfMhzXs0WHYMTnj1F8ju7af-kQZKQjLvNQ@mail.gmail.com>
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

On Tue, Jul 02, 2024 at 08:34:39PM -0600, jim.cromie@gmail.com wrote:
> On Tue, Jul 2, 2024 at 5:33 PM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Tue, Jul 02, 2024 at 03:57:20PM -0600, Jim Cromie wrote:
> > > dyndbg's CLASSMAP-v1 api was broken; DECLARE_DYNDBG_CLASSMAP tried to
> > > do too much.  Its replaced by DRM_CLASSMAP_DEFINE, which creates &
> > > EXPORTs the classmap when CONFIG_DRM_USE_DYNAMIC_DEBUG=y, for direct
> > > reference by drivers.
> > >
> > > The drivers still use DECLARE_DYNDBG_CLASSMAP for now, so they still
> > > redundantly re-declare the classmap, but we can convert the drivers
> > > later to DYNDBG_CLASSMAP_USE
> > >
> > > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > > ---
> > >  drivers/gpu/drm/drm_print.c | 25 +++++++++++++------------
> > >  include/drm/drm_print.h     |  8 ++++++++
> > >  2 files changed, 21 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> > > index 699b7dbffd7b..4a5f2317229b 100644
> > > --- a/drivers/gpu/drm/drm_print.c
> > > +++ b/drivers/gpu/drm/drm_print.c
> > > @@ -55,18 +55,19 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
> > >  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
> > >  module_param_named(debug, __drm_debug, ulong, 0600);
> > >  #else
> > > -/* classnames must match vals of enum drm_debug_category */
> > > -DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
> > > -                     "DRM_UT_CORE",
> > > -                     "DRM_UT_DRIVER",
> > > -                     "DRM_UT_KMS",
> > > -                     "DRM_UT_PRIME",
> > > -                     "DRM_UT_ATOMIC",
> > > -                     "DRM_UT_VBL",
> > > -                     "DRM_UT_STATE",
> > > -                     "DRM_UT_LEASE",
> > > -                     "DRM_UT_DP",
> > > -                     "DRM_UT_DRMRES");
> > > +/* classnames must match value-symbols of enum drm_debug_category */
> > > +DRM_CLASSMAP_DEFINE(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS,
> > > +                 DRM_UT_CORE,
> > > +                 "DRM_UT_CORE",
> > > +                 "DRM_UT_DRIVER",
> > > +                 "DRM_UT_KMS",
> > > +                 "DRM_UT_PRIME",
> > > +                 "DRM_UT_ATOMIC",
> > > +                 "DRM_UT_VBL",
> > > +                 "DRM_UT_STATE",
> > > +                 "DRM_UT_LEASE",
> > > +                 "DRM_UT_DP",
> > > +                 "DRM_UT_DRMRES");
> >
> > Looks like this stuff just ends up in an array, so presumably
> > it should be possible to use designated initializers to make this
> > less fragile?
> 
> Im not sure I got your whole point, but:

I mean using
 [DRM_UT_CORE] = "DRM_UT_CORE"
instead of
 "DRM_UT_CORE"
so there is no chance of screwing up the order.
Or maybe the order doesn't even matter here?

Could also stringify to avoid accidental of typos.

> 
> the fragility is the repetitive re-statement of the map,
> in those un-modified DECLARE_s,
> once replaced, the USEs just ref the struct built by the _DEFINE
> (once, and exported)
> 
> I dont really like the _DEFINEs restatement of the enum-values: DRM_UT_*
> especially as "strings".
> I can automate the stringification with an APPLY_FN_(__stringify, ...)
> but the enum-list DRM_UT_* (w.o quotes) is still needed as args.
> 
> unless there is something C can do thats like Enum.values() ?
> 
> 
> 
> >
> > --
> > Ville Syrjälä
> > Intel

-- 
Ville Syrjälä
Intel
