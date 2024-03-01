Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224CD86E0E6
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 13:12:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5187C10E172;
	Fri,  1 Mar 2024 12:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oA08poAp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2E910E172
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 12:12:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E2E316101F;
 Fri,  1 Mar 2024 12:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE13C43390;
 Fri,  1 Mar 2024 12:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709295124;
 bh=6E5qCAMa5baRaHUWMvXXQI+RrvNsgn7wLP4NhDm0xqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oA08poAphN0lZAIQQq2SGgzG3xggzAQadZkfPaCm/Hu8g9cM/T4l3JdOqaYOkxWl9
 vrqvj9vAvv+3MFp1p5/mtabU/57iOutCJziDcrIJYbMln3emj+hQUeVjpTN3lw8hyd
 DqYNXY7Pe42dfO9kjTSsy2TNv872hwWtUKuvBqgMrvoFQL5290xX0k5fd2/PUkajDW
 NhqU/v8Z7ZXb4qhzyA220yicASsbi5YThFJqVW8YgUPMv/mzc7ZUkuLBxas48Pldb6
 +hMe7ue4KokCYLS8ArfwOI4F6fZ2+SCQUof3riITI7VglYH26eAgQ10sqxPfzjIpPj
 rPBGFlAlB3Q2Q==
Date: Fri, 1 Mar 2024 13:12:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v7 21/36] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <20240301-loyal-cornflower-oxpecker-83ed59@houat>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-21-8f4af575fce2@kernel.org>
 <20240229194726.GB166694@toolbox>
 <20240301-light-impressive-grasshopper-adabeb@houat>
 <20240301112941.GE166694@toolbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240301112941.GE166694@toolbox>
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

On Fri, Mar 01, 2024 at 12:29:41PM +0100, Sebastian Wick wrote:
> On Fri, Mar 01, 2024 at 11:30:56AM +0100, Maxime Ripard wrote:
> > On Thu, Feb 29, 2024 at 08:47:26PM +0100, Sebastian Wick wrote:
> > > > @@ -1708,6 +1731,39 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subcon=
nector_property);
> > > >  /**
> > > >   * DOC: HDMI connector properties
> > > >   *
> > > > + * Broadcast RGB (HDMI specific)
> > > > + *      Indicates the Quantization Range (Full vs Limited) used. T=
he color
> > > > + *      processing pipeline will be adjusted to match the value of=
 the
> > > > + *      property, and the Infoframes will be generated and sent ac=
cordingly.
> > > > + *
> > > > + *      This property is only relevant if the HDMI output format i=
s RGB. If
> > > > + *      it's one of the YCbCr variant, it will be ignored and the =
output will
> > > > + *      use a limited quantization range.
> > >=20
> > > Uh, maybe just say that the quantization range is selected automatica=
lly
> > > in case a YCbCr output format is in use. I'm not sure every YCbCr
> > > variant requires limited and even if it does, new formats could change
> > > this.
> >=20
> > I documented what i915 is doing:
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/dis=
play/intel_hdmi.c#L2143
>=20
> Sure, this is one valid strategy for the automatic behavior of YCbCr.
> Drivers could also always send an InfoFrame to ensure full range where
> possible. The point here is that this property shall not affect YCbCr
> output formats!
>=20
> Maybe it's even better to say "driver specific" instead of "automatic".

Honestly, I'm not sure what you want from me here. Ville and you
insisted on the previous version to document what i915 is doing and to
follow whatever the behaviour was, and that we shouldn't spend time
improving the property. Fine, I did that.

But now, you want me to ... improve the property?

Maxime
