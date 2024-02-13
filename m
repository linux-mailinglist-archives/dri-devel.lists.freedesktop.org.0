Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7FA852B4D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 09:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF3B10E0F1;
	Tue, 13 Feb 2024 08:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nq+FAIFG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F250A10E0F1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 08:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707813545; x=1739349545;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EW4hyg6ywuwUU3ETBIP6P9hAzw5rF+JafXM/qqClrws=;
 b=Nq+FAIFGZ+vbGpaspxZZQWfqyNugROV6PtXFRLG/ecZM05I1/hnl5Pch
 1RfZ+UCB4q1eY0D1957NvXPYbXm1dN0/NHh1y3Na4VTGMVkqeZ4GUQSNQ
 FzuqXLKQ+CmnNYP2uFwgegqjOUA1fH/lfeM38NOhD0qF92noIQkCoigF8
 28JL7YE2j7XLam03dRHI4NiiDeWnBPpAq5j3bOjFZ/GHAQuTkzs0ucVTT
 IayjMpdrHnakqd9B6+uKfNjOLjOvrVsK7KWA/U/Jt1jBfJbAxL5oUxWnW
 03GgYBbZTd3mldytNV4biVsnNmBs4ohpCeBeqKIsUhk2qGofs3scxjyxR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="5629253"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="5629253"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 00:39:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="826052613"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="826052613"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 13 Feb 2024 00:38:57 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 13 Feb 2024 10:38:56 +0200
Date: Tue, 13 Feb 2024 10:38:56 +0200
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
Subject: Re: Re: Re: Re: Re: Re: [PATCH v5 08/44] drm/connector: hdmi: Add
 Broadcast RGB property
Message-ID: <ZcsqoPCJDjA5PJUF@intel.com>
References: <20240115143720.GA160656@toolbox>
 <73peztbeeikb3fg6coxu3punxllgtyrmgco34tnxkojtsjbr3s@26bud3sjbcez>
 <Zb0M_2093UwPXK8y@intel.com>
 <hez2m57ogqx3yyqk45tzdkvxvhrbdepgm244i4m2aty2xhf5b5@acqgvmxhmmvr>
 <Zb0aYAapkxQ2kopt@intel.com>
 <zml6j27skvjmbrfyz7agy5waxajv4p4asbemeexelm3wuv4o7j@xkd2wvnxhbuc>
 <20240209203435.GB996172@toolbox>
 <ahfl6f72lpgpsbnrbgvbsh4db4npr2hh36kua2c6krh544hv5r@dndw4hz2mu2g>
 <Zco-DQaXqae7B1jt@intel.com>
 <yx2t7xltxxgsngdsxamsfq6y7dze3wzegxcqwmsb5yrxen73x6@u3vilqhpci4w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yx2t7xltxxgsngdsxamsfq6y7dze3wzegxcqwmsb5yrxen73x6@u3vilqhpci4w>
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

On Mon, Feb 12, 2024 at 05:53:48PM +0100, Maxime Ripard wrote:
> On Mon, Feb 12, 2024 at 05:49:33PM +0200, Ville Syrjälä wrote:
> > On Mon, Feb 12, 2024 at 11:01:07AM +0100, Maxime Ripard wrote:
> > > On Fri, Feb 09, 2024 at 09:34:35PM +0100, Sebastian Wick wrote:
> > > > On Mon, Feb 05, 2024 at 10:39:38AM +0100, Maxime Ripard wrote:
> > > > > On Fri, Feb 02, 2024 at 06:37:52PM +0200, Ville Syrjälä wrote:
> > > > > > On Fri, Feb 02, 2024 at 04:59:30PM +0100, Maxime Ripard wrote:
> > > > > > > On Fri, Feb 02, 2024 at 05:40:47PM +0200, Ville Syrjälä wrote:
> > > > > > > > On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime Ripard wrote:
> > > > > > > > > Hi,
> > > > > > > > > 
> > > > > > > > > On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wick wrote:
> > > > > > > > > > > >  /**
> > > > > > > > > > > >   * DOC: HDMI connector properties
> > > > > > > > > > > >   *
> > > > > > > > > > > > + * Broadcast RGB
> > > > > > > > > > > > + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> > > > > > > > > > > > + *      Infoframes will be generated according to that value.
> > > > > > > > > > > > + *
> > > > > > > > > > > > + *      The value of this property can be one of the following:
> > > > > > > > > > > > + *
> > > > > > > > > > > > + *      Automatic:
> > > > > > > > > > > > + *              RGB Range is selected automatically based on the mode
> > > > > > > > > > > > + *              according to the HDMI specifications.
> > > > > > > > > > > > + *
> > > > > > > > > > > > + *      Full:
> > > > > > > > > > > > + *              Full RGB Range is forced.
> > > > > > > > > > > > + *
> > > > > > > > > > > > + *      Limited 16:235:
> > > > > > > > > > > > + *              Limited RGB Range is forced. Unlike the name suggests,
> > > > > > > > > > > > + *              this works for any number of bits-per-component.
> > > > > > > > > > > > + *
> > > > > > > > > > > > + *      Drivers can set up this property by calling
> > > > > > > > > > > > + *      drm_connector_attach_broadcast_rgb_property().
> > > > > > > > > > > > + *
> > > > > > > > > > > 
> > > > > > > > > > > This is a good time to document this in more detail. There might be two
> > > > > > > > > > > different things being affected:
> > > > > > > > > > > 
> > > > > > > > > > > 1. The signalling (InfoFrame/SDP/...)
> > > > > > > > > > > 2. The color pipeline processing
> > > > > > > > > > > 
> > > > > > > > > > > All values of Broadcast RGB always affect the color pipeline processing
> > > > > > > > > > > such that a full-range input to the CRTC is converted to either full- or
> > > > > > > > > > > limited-range, depending on what the monitor is supposed to accept.
> > > > > > > > > > > 
> > > > > > > > > > > When automatic is selected, does that mean that there is no signalling,
> > > > > > > > > > > or that the signalling matches what the monitor is supposed to accept
> > > > > > > > > > > according to the spec? Also, is this really HDMI specific?
> > > > > > > > > > > 
> > > > > > > > > > > When full or limited is selected and the monitor doesn't support the
> > > > > > > > > > > signalling, what happens?
> > > > > > > > > > 
> > > > > > > > > > Forgot to mention: user-space still has no control over RGB vs YCbCr on
> > > > > > > > > > the cable, so is this only affecting RGB? If not, how does it affect
> > > > > > > > > > YCbCr?
> > > > > > > > > 
> > > > > > > > > So I dug a bit into both the i915 and vc4 drivers, and it looks like if
> > > > > > > > > we're using a YCbCr format, i915 will always use a limited range while
> > > > > > > > > vc4 will follow the value of the property.
> > > > > > > > 
> > > > > > > > The property is literally called "Broadcast *RGB*".
> > > > > > > > That should explain why it's only affecting RGB.
> > > > > > > 
> > > > > > > Right. And the limited range option is called "Limited 16:235" despite
> > > > > > > being usable on bpc > 8 bits. Naming errors occurs, and history happens
> > > > > > > to make names inconsistent too, that's fine and not an argument in
> > > > > > > itself.
> > > > > > > 
> > > > > > > > Full range YCbCr is a much rarer beast so we've never bothered
> > > > > > > > to enable it.
> > > > > > > 
> > > > > > > vc4 supports it.
> > > > > > 
> > > > > > Someone implemented it incorrectly then.
> > > > > 
> > > > > Incorrectly according to what documentation / specification? I'm sorry,
> > > > > but I find it super ironic that i915 gets to do its own thing, not
> > > > > document any of it, and when people try to clean things up they get told
> > > > > that we got it all wrong.
> > > > 
> > > > FWIW, this was an i915 property and if another driver uses the same
> > > > property name it must have the same behavior. Yes, it isn't standardized
> > > > and yes, it's not documented (hence this effort here) but it's still on
> > > > vc4 to make the property compatible.
> > > 
> > > How is it not compatible? It's a superset of what i915 provides, but
> > > it's strictly compatible with it.
> > 
> > No it is not.
> 
> The property is compatible with i915 interpretation of it, whether you
> like it or not. And that's what Sebastian was referring to.
> 
> > Eg. what happens if you set the thing to full range for RGB (which you
> > must on many broken monitors), and then the kernel automagically
> > switches to YCbCr (for whatever reason) but the monitor doesn't
> > support full range YCbCr? Answer: you get crap output.
> 
> And that part is just moving goalposts.

No. Allowing users to get correct colors with broken displays
is the sole reason why this property even exists.

-- 
Ville Syrjälä
Intel
