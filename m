Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 769918474E7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 17:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E8610E8C4;
	Fri,  2 Feb 2024 16:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6kc+p3a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260E910E8C4
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706891716; x=1738427716;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1lLd48O5ySvz7PNZFF6ltqKVz+fi3YrSX8Kst1Luccw=;
 b=F6kc+p3aQMOl11APXRTedji9x2nRFchJNuYPA4NAmDvcyva7m0QYQ7Wv
 YmnRGEVAq+qHdpHl5Iv8w9aH6KyKKnGpaJMCNGUOyAiNaUFJycucrSHAr
 d8eMblKcpkoEqdgkKiDoKk3QJjXR3Ic9pyf9xr2rlFnBhHLvgLy3siNIN
 mhOrjKOc1N5vSX8AAMqVBpTlnXci7kAYi899hbm4UuM0WC96qolaVAp4C
 BlJNf/jpUYRBjSgOSCgUCjyBqE/80sUEwxvEOmfxqUqg/TfQKSrQO6dF5
 W4+QQsF29BPzt2YbBMHmGZGQv00D7w+opy4Sv73Z590uyLarM+ViHslEe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="354671"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="354671"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 08:35:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823251099"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823251099"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 08:35:07 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 02 Feb 2024 18:35:06 +0200
Date: Fri, 2 Feb 2024 18:35:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Sandy Huang <hjc@rock-chips.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-doc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, David Airlie <airlied@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <Zb0ZujO9E_WH8Pm3@intel.com>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <20240115143308.GA159345@toolbox> <874jerf7ot.fsf@intel.com>
 <c37e9225-3890-4f4d-b45c-919b907b184b@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c37e9225-3890-4f4d-b45c-919b907b184b@xs4all.nl>
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

On Fri, Feb 02, 2024 at 12:20:21PM +0100, Hans Verkuil wrote:
> On 02/02/2024 12:04, Jani Nikula wrote:
> > On Mon, 15 Jan 2024, Sebastian Wick <sebastian.wick@redhat.com> wrote:
> >> On Thu, Dec 07, 2023 at 04:49:31PM +0100, Maxime Ripard wrote:
> >>> The i915 driver has a property to force the RGB range of an HDMI output.
> >>> The vc4 driver then implemented the same property with the same
> >>> semantics. KWin has support for it, and a PR for mutter is also there to
> >>> support it.
> >>>
> >>> Both drivers implementing the same property with the same semantics,
> >>> plus the userspace having support for it, is proof enough that it's
> >>> pretty much a de-facto standard now and we can provide helpers for it.
> >>>
> >>> Let's plumb it into the newly created HDMI connector.
> >>>
> >>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > 
> > [snip]
> > 
> >>> @@ -1655,6 +1678,26 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector_property);
> >>>  /**
> >>>   * DOC: HDMI connector properties
> >>>   *
> >>> + * Broadcast RGB
> >>> + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> >>> + *      Infoframes will be generated according to that value.
> >>> + *
> >>> + *      The value of this property can be one of the following:
> >>> + *
> >>> + *      Automatic:
> >>> + *              RGB Range is selected automatically based on the mode
> >>> + *              according to the HDMI specifications.
> >>> + *
> >>> + *      Full:
> >>> + *              Full RGB Range is forced.
> >>> + *
> >>> + *      Limited 16:235:
> >>> + *              Limited RGB Range is forced. Unlike the name suggests,
> >>> + *              this works for any number of bits-per-component.
> >>> + *
> >>> + *      Drivers can set up this property by calling
> >>> + *      drm_connector_attach_broadcast_rgb_property().
> >>> + *
> >>
> >> This is a good time to document this in more detail. There might be two
> >> different things being affected:
> >>
> >> 1. The signalling (InfoFrame/SDP/...)
> >> 2. The color pipeline processing
> >>
> >> All values of Broadcast RGB always affect the color pipeline processing
> >> such that a full-range input to the CRTC is converted to either full- or
> >> limited-range, depending on what the monitor is supposed to accept.
> >>
> >> When automatic is selected, does that mean that there is no signalling,
> >> or that the signalling matches what the monitor is supposed to accept
> >> according to the spec? Also, is this really HDMI specific?
> > 
> > Automatic is based on the mode as described in the specs
> > below. Basically certain modes are expected to be broadcast range, and
> > others full range.
> > 
> > I don't remember why we don't use the full range if the display
> > indicates it supports selectable quantization range in Video
> > Capabilities Data Block. It's quite possible there are displays that
> > declare support but don't. Cc: Ville.
> 
> I have not seen such displays. Enabling RGB Selectable Quantization Range
> is something that a vendor has to do explicitly, so it is reasonable to
> expect that it works, otherwise there would be no point to that flag!
> 
> Transmitting full range if possible gives a better picture quality and
> so is recommended.
> 
> > 
> > - HDMI 1.4b section 6.6 Video Quantization Ranges
> > 
> > - HDMI 2.1 section 7.3 Video Quantization Ranges
> > 
> > - DP 2.1 (and earlier) section 5.1.1.1 Video Colorimetry
> > 
> > - CTA-861-H (and earlier) section 5.1 Default Encoding Parameters and
> >   section 6.4.3 Quantization Range
> 
> Note that CTA-861-H deprecated the use of Default Range in the AVI
> InfoFrame, instead the source should always signal limited or full range
> in the Q field.

Only because the QS=1 is now mandatory IIRC.
We do always set Q bit explicitly when QS==1.

But yeah, I guess we could always go for full range
by default when QS==1. Or maybe we even did that at
some point in the past and it broke some things?
Can't recall anymore.

Anyways, QS=1 being mandatory is a clear improvement
in CTA-861, but some other CTA-861 rule updates are
more or less pointless as you can't in general detect
which version of the spec the sink claims to implement.

Eg. we already had cases where following the new CTA-861-F
rules for the YQ bit when transmitting RGB broke some
displays. And we are now forced to use the presence of
HDMI 2.0+ capabilities as a heuristic to detect CTA-851-F+.
(see drm_hdmi_avi_infoframe_quant_range()). It's pretty
nasty.

And I think there is some other infoframe related issue
(something to do with VICs IIRC) where we'd need to derive
the CTA-861 version eg. from the set of advertised VICs
in the EDID. I might have even written some code for that
at some point but never finished it. So it's still
broken in the current code. Can't recall the specific
details right now unfortunately.

-- 
Ville Syrjälä
Intel
