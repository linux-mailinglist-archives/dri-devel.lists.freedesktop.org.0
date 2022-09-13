Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 690D75B6D01
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 14:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3E210E6D1;
	Tue, 13 Sep 2022 12:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32B5D10E6D1;
 Tue, 13 Sep 2022 12:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663071399; x=1694607399;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=02GdAJcmnqd4e4fwZKv4VilRiYCld4fS/ddF/auc/w0=;
 b=gnOJHO/HEpg4jLu5qn1D/qQE7IAzVPoQBUHwcXNuMw9MWnXd/jnBJKZR
 zbut+BfDshAr2XzzzElFRhLFARfZbFFErntyHkrL7oWxLUjBSdiJt3H85
 AF8d/CvyJMiheqB1bBqpzQbPPGaMc6J1t/mE/TGuaBvxIfiewVlOZusTW
 Ip4n6hVGyvTHrbcEWkvvHzdgMpi+HaEffgdqAtzI1dEPYLjwEeliu5/YE
 f+pa+SHNkj5fJ/jK0oN1DP7s1EtHkGwLlNliapnXbs+R3p9KjIftAStXt
 OZFPwo+X0+UVYsZMV4O1vL08PL4KAdi+YP0f0f5SHIiHX4C8M+d039Tcy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="324365577"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="324365577"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 05:16:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="720145315"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga002.fm.intel.com with SMTP; 13 Sep 2022 05:16:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 13 Sep 2022 15:16:34 +0300
Date: Tue, 13 Sep 2022 15:16:34 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/4] Fixes for damage clips handling
Message-ID: <YyB0omBHTmGphq58@intel.com>
References: <20220823112920.352563-1-jouni.hogander@intel.com>
 <YyBHkmeIy5VD36u1@intel.com>
 <f3ffd5df9d48222e459ff091961ea4ea7c4a411f.camel@intel.com>
 <a496bb39-982c-300a-efb5-918503783ca6@suse.de>
 <aae6e268-dff6-148d-b596-683add3220c2@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aae6e268-dff6-148d-b596-683add3220c2@suse.de>
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mairacanal@riseup.net" <mairacanal@riseup.net>, "Souza,
 Jose" <jose.souza@intel.com>, "Kahola, Mika" <mika.kahola@intel.com>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 13, 2022 at 12:56:49PM +0200, Thomas Zimmermann wrote:
> 
> 
> Am 13.09.22 um 12:54 schrieb Thomas Zimmermann:
> > Hi
> > 
> > Am 13.09.22 um 12:47 schrieb Hogander, Jouni:
> >> On Tue, 2022-09-13 at 12:04 +0300, Ville Syrjälä wrote:
> >>> On Tue, Aug 23, 2022 at 02:29:16PM +0300, Jouni Högander wrote:
> >>>> Currently damage clips handling is broken for planes when using big
> >>>> framebuffer + offset in case kms driver adjusts drm_plane_state.src
> >>>> coords. This is because damage clips are using coords relative to
> >>>> original coords from user-space.
> >>>>
> >>>> This patchset is fixing this by using original
> >>>> coords from user-space instead of drm_plane_state.src when
> >>>> iterating
> >>>> damage_clips.
> >>>>
> >>>> v2: Modify drm unit tests accordingly
> >>>>
> >>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>>> Cc: Jani Nikula <jani.nikula@intel.com>
> >>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >>>> Cc: José Roberto de Souza <jose.souza@intel.com>
> >>>> Cc: Mika Kahola <mika.kahola@intel.com>
> >>>> Cc: Maíra Canal <mairacanal@riseup.net>
> >>>>
> >>>> Jouni Högander (4):
> >>>>    drm: Use original src rect while initializing damage iterator
> >>>>    drm/i915/display: Use original src in psr2 sel fetch area
> >>>> calculation
> >>>>    drm/i915/display: Use drm helper instead of own loop for damage
> >>>> clips
> >>>>    drm/tests: Set also mock plane src_x, src_y, src_w and src_h
> >>>
> >>> Do these need to be applied into the same tree, or can
> >>> the drm vs. i915 stuff go in separately?
> >>
> >> Patch 1 and 2 are needed to fix that bigfb handling for i915. Patch 4
> >> is also needed to prevent breaking tests. Patch 3 is more like cleanup.
> >>
> >> I think i915 patches could go via i915 tree. This just means that i915
> >> bigfb handling isn't fixed by either of the sets alone.
> > 
> > I have a number of updates for damage handling that I want to get 
> > reviewed soon. Could you please merge your patchset via drm-misc-next?
> 
> Or at least patches 1 and 4.

Went with the 50/50 split. Everything pushed now. Thanks.

-- 
Ville Syrjälä
Intel
