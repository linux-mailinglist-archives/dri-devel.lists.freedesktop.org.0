Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94B55A824F
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 17:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F087E10E475;
	Wed, 31 Aug 2022 15:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C64810E327;
 Wed, 31 Aug 2022 15:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661961158; x=1693497158;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PO5kE2i9fLfVhqfQY/kHfPuVDTjv8lIUTM5155KGn8M=;
 b=Racx0Sv/9wvhT0E4queNzf1XVzG4S/8bBUNiadmUoygy50WLjsFW6T5I
 L+IrZ3daYTyPxHolCxjhY2oS1g7qIcUsaPZRfR21yCh5geSyS2ZsSI+XL
 n9Y8MpdCc/Yct3CMWpRTJq4TElTDodXG1t4fYLQnoGxwzzYpW8xmf8Kou
 gtRwsjBZEzLSK8xiEVtISnFE4HVhrLP0aXbgp/C5kj2gPpS1SkHbvWB18
 /tuNliPYs7ZmzXpicqu2f/Bws9V2ngo4frK+sOmZUugGV67kaNQlni2Kw
 YYQ9FB7Rj2VY9g8Jt7BtozSiqQ4UYzmLCz33+hspysoMUXkDYlkr6/62M A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="321619223"
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; d="scan'208";a="321619223"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 08:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; d="scan'208";a="645275466"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga001.jf.intel.com with SMTP; 31 Aug 2022 08:52:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 31 Aug 2022 18:52:33 +0300
Date: Wed, 31 Aug 2022 18:52:33 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 4/6] drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic
 commits
Message-ID: <Yw+DwSbCCvxpb6dY@intel.com>
References: <20220830172851.269402-1-contact@emersion.fr>
 <20220830172851.269402-5-contact@emersion.fr>
 <20220831105007.69e4c3e0@eldfell>
 <Z4_OkSeCcfjYtgQvRf-w3-_YSFzvSJvy0s9p2VyP5GDMcRp8Gsw9drHctcYOM0aJgXXUKqWL5cB4TEunPlw6d9kktuLVt2ZnwaGkM2u9GCc=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4_OkSeCcfjYtgQvRf-w3-_YSFzvSJvy0s9p2VyP5GDMcRp8Gsw9drHctcYOM0aJgXXUKqWL5cB4TEunPlw6d9kktuLVt2ZnwaGkM2u9GCc=@emersion.fr>
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 mwen@igalia.com, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, hwentlan@amd.com,
 nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 31, 2022 at 02:56:12PM +0000, Simon Ser wrote:
> On Wednesday, August 31st, 2022 at 09:50, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> 
> > > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > > index 86a292c3185a..cce1a1bea645 100644
> > > --- a/include/uapi/drm/drm_mode.h
> > > +++ b/include/uapi/drm/drm_mode.h
> > > @@ -942,6 +942,10 @@ struct hdr_output_metadata {
> > > * Request that the page-flip is performed as soon as possible, ie. with no
> > > * delay due to waiting for vblank. This may cause tearing to be visible on
> > > * the screen.
> > > + *
> > > + * When used with atomic uAPI, the driver will return an error if the hardware
> > > + * doesn't support performing an asynchronous page-flip for this update.
> > > + * User-space should handle this, e.g. by falling back to a regular page-flip.
> > > */
> > > #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
> > > #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
> > 
> > Hi Simon,
> > 
> > recalling what Ville explained that enabling async flips might require
> > one more sync flip first, how is that supposed to work?
> > 
> > A TEST_ONLY commit is not allowed to change hardware state, and a
> > failing real commit is not allowed to change hardware state either
> > (right?), therefore a failing async flip cannot prepare the next flip
> > to be async, meaning async will never work.
> 
> I'd blame it on bad hw, and make it one special quirk in the driver,
> just like it does now.
> 
> Ville, thoughts?

I suppose it might be worth mentioning that special case here,
to avoid people getting confused why the first async flip was
accepted but took a full frame to complete.

-- 
Ville Syrjälä
Intel
