Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC4F8473A1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 16:48:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F79F10F077;
	Fri,  2 Feb 2024 15:48:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Px4JkEns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A5110F070
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 15:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706888881; x=1738424881;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Wzt2OKA98oRZpOPKfSYMaxS0U0E4dZGMDfd4SSadYFo=;
 b=Px4JkEnsB/pdGQdZ1dySWYk+kUKRK8I1tNwizkBWbj/0DAun34EcdMXK
 dcXYCsy/1fESqFLHqkgnreEm32L1KRyHERijSYVLmN/SsoDlV4ecQpdwR
 98hXe+yuZF2QJ8slW3udPXuD25sdw/wVGqvFLi9gp0L6Jn84FwazsZwJb
 nxpQY96D0GiNSDz4nUv17HlL3KVi5XMUhxCfKc2+zaOcbNh3XHxUJZo/P
 1hKLKJYrWuhEMZaAKve6++nw7JdQQf+VfyVrHV7Vg8vtPXCk18Q1vR/EO
 tI2jrgHyf2ejdWkFn9TjIu2yQtxEDQopbsI1gNqzkfUuN9eWgHIlWmynu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="356369"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="356369"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 07:40:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823240563"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="823240563"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 02 Feb 2024 07:40:48 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 02 Feb 2024 17:40:47 +0200
Date: Fri, 2 Feb 2024 17:40:47 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB
 property
Message-ID: <Zb0M_2093UwPXK8y@intel.com>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <20240115143308.GA159345@toolbox> <20240115143720.GA160656@toolbox>
 <73peztbeeikb3fg6coxu3punxllgtyrmgco34tnxkojtsjbr3s@26bud3sjbcez>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73peztbeeikb3fg6coxu3punxllgtyrmgco34tnxkojtsjbr3s@26bud3sjbcez>
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

On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wick wrote:
> > > >  /**
> > > >   * DOC: HDMI connector properties
> > > >   *
> > > > + * Broadcast RGB
> > > > + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> > > > + *      Infoframes will be generated according to that value.
> > > > + *
> > > > + *      The value of this property can be one of the following:
> > > > + *
> > > > + *      Automatic:
> > > > + *              RGB Range is selected automatically based on the mode
> > > > + *              according to the HDMI specifications.
> > > > + *
> > > > + *      Full:
> > > > + *              Full RGB Range is forced.
> > > > + *
> > > > + *      Limited 16:235:
> > > > + *              Limited RGB Range is forced. Unlike the name suggests,
> > > > + *              this works for any number of bits-per-component.
> > > > + *
> > > > + *      Drivers can set up this property by calling
> > > > + *      drm_connector_attach_broadcast_rgb_property().
> > > > + *
> > > 
> > > This is a good time to document this in more detail. There might be two
> > > different things being affected:
> > > 
> > > 1. The signalling (InfoFrame/SDP/...)
> > > 2. The color pipeline processing
> > > 
> > > All values of Broadcast RGB always affect the color pipeline processing
> > > such that a full-range input to the CRTC is converted to either full- or
> > > limited-range, depending on what the monitor is supposed to accept.
> > > 
> > > When automatic is selected, does that mean that there is no signalling,
> > > or that the signalling matches what the monitor is supposed to accept
> > > according to the spec? Also, is this really HDMI specific?
> > > 
> > > When full or limited is selected and the monitor doesn't support the
> > > signalling, what happens?
> > 
> > Forgot to mention: user-space still has no control over RGB vs YCbCr on
> > the cable, so is this only affecting RGB? If not, how does it affect
> > YCbCr?
> 
> So I dug a bit into both the i915 and vc4 drivers, and it looks like if
> we're using a YCbCr format, i915 will always use a limited range while
> vc4 will follow the value of the property.

The property is literally called "Broadcast *RGB*".
That should explain why it's only affecting RGB.

Full range YCbCr is a much rarer beast so we've never bothered
to enable it. Eg. with DP it only became possible with the
introduction of the VSC SDP (and I don't recall if there's
additional capability checks that are also required). With
DP MSA signalling full range YCbCr is not possible at all.
I don't recall right now what the HDMI requirements are.

-- 
Ville Syrjälä
Intel
