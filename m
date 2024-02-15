Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4F08566ED
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 16:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80A410E0E8;
	Thu, 15 Feb 2024 15:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ApIWkTco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D49510E0E8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708009755; x=1739545755;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1dewdp2A0Zo42dyThGoQOQMbyk8kJSMF3Ua2SIJeM54=;
 b=ApIWkTcopMBYHHLcqaY4WvaivqTmGD4bX9BEWo70RJsYJ183w8vqA+TY
 GUO8q+O1J4K2pNnGRkkIVY7K38oKM3fXYntwBSDrpv8RzITPPYuKoTJEa
 TITDKVthtk2iDVJLlVfMBgWifkTl8Ha8ykCiztaBBuzCc6BRFk6puOcPo
 PPbz8E4WpImeuqldPTUtYdhDQ7FzPUQ3ohKc/FuyDGUl+16oY1HKnK5oi
 5fXS8mWIL3ddVT8xSik0Yytd4qSOBdhAwf2RLST9UlDH4nbiaPnSDVHL1
 A8HlcaCAVX4o7sVD7sWPTZyAwDDTWatdNJJW/qjN5efBI5ZLW8tApb/eE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5930143"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5930143"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 07:09:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="826423681"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="826423681"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 15 Feb 2024 07:09:06 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 15 Feb 2024 17:09:05 +0200
Date: Thu, 15 Feb 2024 17:09:05 +0200
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
Subject: Re: Re: Re: Re: Re: Re: Re: [PATCH v5 08/44] drm/connector: hdmi:
 Add Broadcast RGB property
Message-ID: <Zc4pEfVRItn0ZCXE@intel.com>
References: <Zb0M_2093UwPXK8y@intel.com>
 <hez2m57ogqx3yyqk45tzdkvxvhrbdepgm244i4m2aty2xhf5b5@acqgvmxhmmvr>
 <Zb0aYAapkxQ2kopt@intel.com>
 <zml6j27skvjmbrfyz7agy5waxajv4p4asbemeexelm3wuv4o7j@xkd2wvnxhbuc>
 <20240209203435.GB996172@toolbox>
 <ahfl6f72lpgpsbnrbgvbsh4db4npr2hh36kua2c6krh544hv5r@dndw4hz2mu2g>
 <Zco-DQaXqae7B1jt@intel.com>
 <yx2t7xltxxgsngdsxamsfq6y7dze3wzegxcqwmsb5yrxen73x6@u3vilqhpci4w>
 <ZcsqoPCJDjA5PJUF@intel.com>
 <dti6zcuzszhut5m4g2bxiwfogwctfhktv2mwuqlij7wtvh3bny@ry4mxpiqidmt>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dti6zcuzszhut5m4g2bxiwfogwctfhktv2mwuqlij7wtvh3bny@ry4mxpiqidmt>
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

On Thu, Feb 15, 2024 at 11:53:17AM +0100, Maxime Ripard wrote:
> On Tue, Feb 13, 2024 at 10:38:56AM +0200, Ville Syrjälä wrote:
> > On Mon, Feb 12, 2024 at 05:53:48PM +0100, Maxime Ripard wrote:
> > > On Mon, Feb 12, 2024 at 05:49:33PM +0200, Ville Syrjälä wrote:
> > > > On Mon, Feb 12, 2024 at 11:01:07AM +0100, Maxime Ripard wrote:
> > > > > On Fri, Feb 09, 2024 at 09:34:35PM +0100, Sebastian Wick wrote:
> > > > > > On Mon, Feb 05, 2024 at 10:39:38AM +0100, Maxime Ripard wrote:
> > > > > > > On Fri, Feb 02, 2024 at 06:37:52PM +0200, Ville Syrjälä wrote:
> > > > > > > > On Fri, Feb 02, 2024 at 04:59:30PM +0100, Maxime Ripard wrote:
> > > > > > > > > On Fri, Feb 02, 2024 at 05:40:47PM +0200, Ville Syrjälä wrote:
> > > > > > > > > > On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime Ripard wrote:
> > > > > > > > > > > Hi,
> > > > > > > > > > > 
> > > > > > > > > > > On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wick wrote:
> > > > > > > > > > > > > >  /**
> > > > > > > > > > > > > >   * DOC: HDMI connector properties
> > > > > > > > > > > > > >   *
> > > > > > > > > > > > > > + * Broadcast RGB
> > > > > > > > > > > > > > + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> > > > > > > > > > > > > > + *      Infoframes will be generated according to that value.
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > + *      The value of this property can be one of the following:
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > + *      Automatic:
> > > > > > > > > > > > > > + *              RGB Range is selected automatically based on the mode
> > > > > > > > > > > > > > + *              according to the HDMI specifications.
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > + *      Full:
> > > > > > > > > > > > > > + *              Full RGB Range is forced.
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > + *      Limited 16:235:
> > > > > > > > > > > > > > + *              Limited RGB Range is forced. Unlike the name suggests,
> > > > > > > > > > > > > > + *              this works for any number of bits-per-component.
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > + *      Drivers can set up this property by calling
> > > > > > > > > > > > > > + *      drm_connector_attach_broadcast_rgb_property().
> > > > > > > > > > > > > > + *
> > > > > > > > > > > > > 
> > > > > > > > > > > > > This is a good time to document this in more detail. There might be two
> > > > > > > > > > > > > different things being affected:
> > > > > > > > > > > > > 
> > > > > > > > > > > > > 1. The signalling (InfoFrame/SDP/...)
> > > > > > > > > > > > > 2. The color pipeline processing
> > > > > > > > > > > > > 
> > > > > > > > > > > > > All values of Broadcast RGB always affect the color pipeline processing
> > > > > > > > > > > > > such that a full-range input to the CRTC is converted to either full- or
> > > > > > > > > > > > > limited-range, depending on what the monitor is supposed to accept.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > When automatic is selected, does that mean that there is no signalling,
> > > > > > > > > > > > > or that the signalling matches what the monitor is supposed to accept
> > > > > > > > > > > > > according to the spec? Also, is this really HDMI specific?
> > > > > > > > > > > > > 
> > > > > > > > > > > > > When full or limited is selected and the monitor doesn't support the
> > > > > > > > > > > > > signalling, what happens?
> > > > > > > > > > > > 
> > > > > > > > > > > > Forgot to mention: user-space still has no control over RGB vs YCbCr on
> > > > > > > > > > > > the cable, so is this only affecting RGB? If not, how does it affect
> > > > > > > > > > > > YCbCr?
> > > > > > > > > > > 
> > > > > > > > > > > So I dug a bit into both the i915 and vc4 drivers, and it looks like if
> > > > > > > > > > > we're using a YCbCr format, i915 will always use a limited range while
> > > > > > > > > > > vc4 will follow the value of the property.
> > > > > > > > > > 
> > > > > > > > > > The property is literally called "Broadcast *RGB*".
> > > > > > > > > > That should explain why it's only affecting RGB.
> > > > > > > > > 
> > > > > > > > > Right. And the limited range option is called "Limited 16:235" despite
> > > > > > > > > being usable on bpc > 8 bits. Naming errors occurs, and history happens
> > > > > > > > > to make names inconsistent too, that's fine and not an argument in
> > > > > > > > > itself.
> > > > > > > > > 
> > > > > > > > > > Full range YCbCr is a much rarer beast so we've never bothered
> > > > > > > > > > to enable it.
> > > > > > > > > 
> > > > > > > > > vc4 supports it.
> > > > > > > > 
> > > > > > > > Someone implemented it incorrectly then.
> > > > > > > 
> > > > > > > Incorrectly according to what documentation / specification? I'm sorry,
> > > > > > > but I find it super ironic that i915 gets to do its own thing, not
> > > > > > > document any of it, and when people try to clean things up they get told
> > > > > > > that we got it all wrong.
> > > > > > 
> > > > > > FWIW, this was an i915 property and if another driver uses the same
> > > > > > property name it must have the same behavior. Yes, it isn't standardized
> > > > > > and yes, it's not documented (hence this effort here) but it's still on
> > > > > > vc4 to make the property compatible.
> > > > > 
> > > > > How is it not compatible? It's a superset of what i915 provides, but
> > > > > it's strictly compatible with it.
> > > > 
> > > > No it is not.
> > > 
> > > The property is compatible with i915 interpretation of it, whether you
> > > like it or not. And that's what Sebastian was referring to.
> > > 
> > > > Eg. what happens if you set the thing to full range for RGB (which you
> > > > must on many broken monitors), and then the kernel automagically
> > > > switches to YCbCr (for whatever reason) but the monitor doesn't
> > > > support full range YCbCr? Answer: you get crap output.
> > > 
> > > And that part is just moving goalposts.
> > 
> > No. Allowing users to get correct colors with broken displays
> > is the sole reason why this property even exists.
> 
> HDMI 1.4, Section 6.6 - Video Quantization Ranges:
> 
>   If the sink’s EDID declares a selectable YCC Quantization Range
>   (QY=1), then it shall expect limited range pixel values if it receives
>   AVI YQ=0 and it shall expect full range pixel values if it receives
>   AVI YQ=1. For other values of YQ, the sink shall expect pixel values
>   with the default range for the transmitted video format.
> 
> So, the only concern you have is if the EDID has QY set to 1 but the
> monitor doesn't actually support it? If so, could we qualify the monitor
> as a "broken display" and thus would require that property to apply to
> YUV too?

Sinks that declare a selectable quantization range are not the
problem, or at least I don't recall ever seeing one that lied about
that. The problem is the sinks that don't have selectable quantization
range, and which implement the default rules incorrectly. The only way
to get correct colors on those is for the user to override the
quantization range manually.

Typically TVs get it mostly right (though I have at least one that
also expects limited range for 640x480 which is not correct), and 
many (perhaps even most?) computer displays get it wrong (as in
they always assume RGB to be full range).

We could in theory quirk those, but the quirk list would be enormous,
and fragile to maintain because the user can also shoot themselves in
the foot here by frobbing with the "black level"/etc. settings on the
display itself. So we'd surely end up with lots of false positives
on the quirk list.

-- 
Ville Syrjälä
Intel
