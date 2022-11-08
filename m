Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B26620B87
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 09:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED2010E389;
	Tue,  8 Nov 2022 08:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F70010E389;
 Tue,  8 Nov 2022 08:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667897555; x=1699433555;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=m06uxXNv8cEYktANfB+cYRiTnAeOFpHhpoG4N4jsqRA=;
 b=k0Zjr26V2l6CfY4DNLl6FQtJZcB/gh5/BPJJWz7XmoIkTzmRPOQtirHG
 jlCH7FoX0OuAGf6vhnZ67Bh238zACBQaSJSH9AL4atT7jjnDwBx+YGIYb
 DeFXDI65BhFOPQVbhOMR4n9Z+E3GeSN4eDaRe0ztNxIaRhjTES4PeEQ8Z
 8F3ONXr5K/GqwdfeAe5am03UyC4D8aNeoo9FOILOE+JSNB3MCT5rcWtjq
 YW1QLd7RSH5G5k+9t5rrxQOtA4gzSVuy08p+bFv1e+ynGAgeI8RSpySF+
 xEve6QYmZJpHFh/OH76i4cXuF0GEb7+1tPkIcsX2HbAmGvcc0rmDCy7pA A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="312435150"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="312435150"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 00:52:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="638717754"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="638717754"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga007.fm.intel.com with SMTP; 08 Nov 2022 00:52:30 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 08 Nov 2022 10:52:29 +0200
Date: Tue, 8 Nov 2022 10:52:29 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [RFC PATCH 0/3] Support for Solid Fill Planes
Message-ID: <Y2oYzdHKuSDKogkj@intel.com>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <Y2leZDfLj/5963wl@intel.com>
 <5a9167d5-f88d-ed6b-abff-8ae39117feb1@quicinc.com>
 <CAF6AEGtbwsvr5A+mX7BxP95u3RyRiUFzE6dfiZacS96WVBhuvw@mail.gmail.com>
 <c196f010-34e7-4c1c-4ca6-852a4c32b154@quicinc.com>
 <CAF6AEGtJcz6dK-vgnYuJsBqm2tDRUYB7Tg2jtQm1-KuTi+z8ZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGtJcz6dK-vgnYuJsBqm2tDRUYB7Tg2jtQm1-KuTi+z8ZA@mail.gmail.com>
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
Cc: daniel.vetter@ffwll.ch, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 07, 2022 at 07:34:43PM -0800, Rob Clark wrote:
> On Mon, Nov 7, 2022 at 4:22 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> >
> >
> >
> > On 11/7/2022 2:09 PM, Rob Clark wrote:
> > > On Mon, Nov 7, 2022 at 1:32 PM Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> > >>
> > >>
> > >>
> > >> On 11/7/2022 11:37 AM, Ville Syrjälä wrote:
> > >>> On Fri, Oct 28, 2022 at 03:59:49PM -0700, Jessica Zhang wrote:
> > >>>> Introduce and add support for COLOR_FILL and COLOR_FILL_FORMAT
> > >>>> properties. When the color fill value is set, and the framebuffer is set
> > >>>> to NULL, memory fetch will be disabled.
> > >>>
> > >>> Thinking a bit more universally I wonder if there should be
> > >>> some kind of enum property:
> > >>>
> > >>> enum plane_pixel_source {
> > >>>        FB,
> > >>>        COLOR,
> > >>>        LIVE_FOO,
> > >>>        LIVE_BAR,
> > >>>        ...
> > >>> }
> > >>
> > >> Hi Ville,
> > >>
> > >> Makes sense -- this way, we'd also lay some groundwork for cases where
> > >> drivers want to use other non-FB sources.
> > >>
> > >>>
> > >>>> In addition, loosen the NULL FB checks within the atomic commit callstack
> > >>>> to allow a NULL FB when color_fill is nonzero and add FB checks in
> > >>>> methods where the FB was previously assumed to be non-NULL.
> > >>>>
> > >>>> Finally, have the DPU driver use drm_plane_state.color_fill and
> > >>>> drm_plane_state.color_fill_format instead of dpu_plane_state.color_fill,
> > >>>> and add extra checks in the DPU atomic commit callstack to account for a
> > >>>> NULL FB in cases where color_fill is set.
> > >>>>
> > >>>> Some drivers support hardware that have optimizations for solid fill
> > >>>> planes. This series aims to expose these capabilities to userspace as
> > >>>> some compositors have a solid fill flag (ex. SOLID_COLOR in the Android
> > >>>> hardware composer HAL) that can be set by apps like the Android Gears
> > >>>> app.
> > >>>>
> > >>>> Userspace can set the color_fill value by setting COLOR_FILL_FORMAT to a
> > >>>> DRM format, setting COLOR_FILL to a color fill value, and setting the
> > >>>> framebuffer to NULL.
> > >>>
> > >>> Is there some real reason for the format property? Ie. why not
> > >>> just do what was the plan for the crttc background color and
> > >>> specify the color in full 16bpc format and just pick as many
> > >>> msbs from that as the hw can use?
> > >>
> > >> The format property was added because we can't assume that all hardware
> > >> will support/use the same color format for solid fill planes. Even for
> > >> just MSM devices, the hardware supports different variations of RGB
> > >> formats [1].
> > >
> > > Sure, but the driver can convert the format into whatever the hw
> > > wants.  A 1x1 color conversion is not going to be problematic ;-)
> >
> > Hi Rob,
> >
> > Hm... that's also a fair point. Just wondering, is there any advantage
> > of having the driver convert the format, other than not having to
> > implement an extra format property?
> >
> > (In case we end up wrapping everything into a prop blob or something)
> >
> 
> It keeps the uabi simpler.. for obvious reasons you don't want the
> driver to do cpu color conversion for an arbitrary size plane, which
> is why we go to all the complexity to expose formats and modifiers for
> "real" planes, but we are dealing with a single pixel value here,
> let's not make the uabi more complex than we need to.  I'd propose
> making it float32[4] if float weren't a pita for kernel/uabi, but
> u16[4] or u32[4] should be fine, and drivers can translate that easily
> into whatever weird formats their hw wants for solid-fill.

u16[4] fits into a single u64 property value.

That was the plan for the background prop as well:
https://lore.kernel.org/all/20190703125442.GW5942@intel.com/T/

-- 
Ville Syrjälä
Intel
