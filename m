Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E89A8473DC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 16:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230E910F0B1;
	Fri,  2 Feb 2024 15:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HTDaz0RY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510C810E9EB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 15:59:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2D879CE29C7;
 Fri,  2 Feb 2024 15:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4B4C433F1;
 Fri,  2 Feb 2024 15:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706889576;
 bh=NeFFADYXbSKDmrGxCWJn52cB3UzPfQUhTWEHOnSrQZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HTDaz0RYlhUret3nyLqzvt6R8k6VsimfwHqO1yl3uS9kIgBDturoT/SzAOrkJmL0D
 gby8DoOSYxkckwhawpNZGiKhJZAA/FYdwsgnDQqfvz3dMDCU/HO5WY8xz2FHu9Kr8L
 daPvZmGo4bFFcHgIrkr2mcbFtdg9New0ZyzGfphKcNJO3eDiwJkoGdhHoc6hntlGeH
 lerkU+3sB1Fb0yguYyLd2yDxiGP4NzJ3nhUkBgGk+/hfGOKRyXS6Ek/g7K6aW5+Ln+
 wxu2+c68gmL0w0uwr/TJaeDRR3RtaEQeDvUyu6v/v1+AmIcFFDLpsTN9Vxh4MaHkrk
 8PWHWdcqKrMlQ==
Date: Fri, 2 Feb 2024 16:59:30 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: Re: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB
 property
Message-ID: <hez2m57ogqx3yyqk45tzdkvxvhrbdepgm244i4m2aty2xhf5b5@acqgvmxhmmvr>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <20240115143308.GA159345@toolbox> <20240115143720.GA160656@toolbox>
 <73peztbeeikb3fg6coxu3punxllgtyrmgco34tnxkojtsjbr3s@26bud3sjbcez>
 <Zb0M_2093UwPXK8y@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nkbwqjl5lzj6skqt"
Content-Disposition: inline
In-Reply-To: <Zb0M_2093UwPXK8y@intel.com>
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


--nkbwqjl5lzj6skqt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 02, 2024 at 05:40:47PM +0200, Ville Syrj=E4l=E4 wrote:
> On Fri, Feb 02, 2024 at 02:01:39PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wick wrote:
> > > > >  /**
> > > > >   * DOC: HDMI connector properties
> > > > >   *
> > > > > + * Broadcast RGB
> > > > > + *      Indicates the RGB Quantization Range (Full vs Limited) u=
sed.
> > > > > + *      Infoframes will be generated according to that value.
> > > > > + *
> > > > > + *      The value of this property can be one of the following:
> > > > > + *
> > > > > + *      Automatic:
> > > > > + *              RGB Range is selected automatically based on the=
 mode
> > > > > + *              according to the HDMI specifications.
> > > > > + *
> > > > > + *      Full:
> > > > > + *              Full RGB Range is forced.
> > > > > + *
> > > > > + *      Limited 16:235:
> > > > > + *              Limited RGB Range is forced. Unlike the name sug=
gests,
> > > > > + *              this works for any number of bits-per-component.
> > > > > + *
> > > > > + *      Drivers can set up this property by calling
> > > > > + *      drm_connector_attach_broadcast_rgb_property().
> > > > > + *
> > > >=20
> > > > This is a good time to document this in more detail. There might be=
 two
> > > > different things being affected:
> > > >=20
> > > > 1. The signalling (InfoFrame/SDP/...)
> > > > 2. The color pipeline processing
> > > >=20
> > > > All values of Broadcast RGB always affect the color pipeline proces=
sing
> > > > such that a full-range input to the CRTC is converted to either ful=
l- or
> > > > limited-range, depending on what the monitor is supposed to accept.
> > > >=20
> > > > When automatic is selected, does that mean that there is no signall=
ing,
> > > > or that the signalling matches what the monitor is supposed to acce=
pt
> > > > according to the spec? Also, is this really HDMI specific?
> > > >=20
> > > > When full or limited is selected and the monitor doesn't support the
> > > > signalling, what happens?
> > >=20
> > > Forgot to mention: user-space still has no control over RGB vs YCbCr =
on
> > > the cable, so is this only affecting RGB? If not, how does it affect
> > > YCbCr?
> >=20
> > So I dug a bit into both the i915 and vc4 drivers, and it looks like if
> > we're using a YCbCr format, i915 will always use a limited range while
> > vc4 will follow the value of the property.
>=20
> The property is literally called "Broadcast *RGB*".
> That should explain why it's only affecting RGB.

Right. And the limited range option is called "Limited 16:235" despite
being usable on bpc > 8 bits. Naming errors occurs, and history happens
to make names inconsistent too, that's fine and not an argument in
itself.

> Full range YCbCr is a much rarer beast so we've never bothered
> to enable it.

vc4 supports it.

> Eg. with DP it only became possible with the introduction of the VSC
> SDP (and I don't recall if there's additional capability checks that
> are also required). With DP MSA signalling full range YCbCr is not
> possible at all.

This is for HDMI only.

> I don't recall right now what the HDMI requirements are.

HDMI has supported it for a while, and it's defined (for example) in the
HDMI 1.4 spec in Section 6.6 - Video Quantization Ranges. It supports
limited and full range on both RGB and YCbCr, as long as the EDIDs state
so and the Infoframes signal it.

Maxime

--nkbwqjl5lzj6skqt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZb0RYgAKCRDj7w1vZxhR
xaFMAPwPX00aGuZMcwT8+4307ZfdO5OyFc7WAkZEWUBovapBWAD/d9+niBWsPvl3
otXPVDwd1PFHbq4/qGvzqn443KiCiQA=
=rMjR
-----END PGP SIGNATURE-----

--nkbwqjl5lzj6skqt--
