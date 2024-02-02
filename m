Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47FB8470C9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 14:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7D610E002;
	Fri,  2 Feb 2024 13:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rk52/yef";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1431D10E002
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 13:01:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 961B162559;
 Fri,  2 Feb 2024 13:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E34C433F1;
 Fri,  2 Feb 2024 13:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706878902;
 bh=ZjGVUgcdYqjFELWbtS5Tz+gafK6SLtjIYXwEYo18YXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Rk52/yefcJ7xC9MuTUP9sVCJC4n6DX/+ofLVOsiOkeAH60dIBnk2fZXv9ByUydBSm
 DtqxnIWw/Mom3yYSOahogiwlITZbO6GPKqH6MT9Kdr8LoJYR+meY7ea3x86U/vmdK4
 jRDsbJiXrCZxHBdA/8os4Npi7r/i1RsmqZO0HydLSMRy0rWgj6ua7CH416PSWMz9pG
 0eAtdr7brPlRIP4fC1N9uM9JlSNyxx5dHaPSkw9vVrEL5j6Xw4EmSZSGqLZYN6CIUl
 apPnlO5ZVBPs/+JA5YylF5MM9Ainw7YQkJYQDn356jUppnedKDWil6gE6ptW+ae8v4
 30Y4ACuH/ziuw==
Date: Fri, 2 Feb 2024 14:01:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: Re: [PATCH v5 08/44] drm/connector: hdmi: Add Broadcast RGB
 property
Message-ID: <73peztbeeikb3fg6coxu3punxllgtyrmgco34tnxkojtsjbr3s@26bud3sjbcez>
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-8-6538e19d634d@kernel.org>
 <20240115143308.GA159345@toolbox> <20240115143720.GA160656@toolbox>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6dznigm7bfdw265q"
Content-Disposition: inline
In-Reply-To: <20240115143720.GA160656@toolbox>
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


--6dznigm7bfdw265q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 15, 2024 at 03:37:20PM +0100, Sebastian Wick wrote:
> > >  /**
> > >   * DOC: HDMI connector properties
> > >   *
> > > + * Broadcast RGB
> > > + *      Indicates the RGB Quantization Range (Full vs Limited) used.
> > > + *      Infoframes will be generated according to that value.
> > > + *
> > > + *      The value of this property can be one of the following:
> > > + *
> > > + *      Automatic:
> > > + *              RGB Range is selected automatically based on the mode
> > > + *              according to the HDMI specifications.
> > > + *
> > > + *      Full:
> > > + *              Full RGB Range is forced.
> > > + *
> > > + *      Limited 16:235:
> > > + *              Limited RGB Range is forced. Unlike the name suggest=
s,
> > > + *              this works for any number of bits-per-component.
> > > + *
> > > + *      Drivers can set up this property by calling
> > > + *      drm_connector_attach_broadcast_rgb_property().
> > > + *
> >=20
> > This is a good time to document this in more detail. There might be two
> > different things being affected:
> >=20
> > 1. The signalling (InfoFrame/SDP/...)
> > 2. The color pipeline processing
> >=20
> > All values of Broadcast RGB always affect the color pipeline processing
> > such that a full-range input to the CRTC is converted to either full- or
> > limited-range, depending on what the monitor is supposed to accept.
> >=20
> > When automatic is selected, does that mean that there is no signalling,
> > or that the signalling matches what the monitor is supposed to accept
> > according to the spec? Also, is this really HDMI specific?
> >=20
> > When full or limited is selected and the monitor doesn't support the
> > signalling, what happens?
>=20
> Forgot to mention: user-space still has no control over RGB vs YCbCr on
> the cable, so is this only affecting RGB? If not, how does it affect
> YCbCr?

So I dug a bit into both the i915 and vc4 drivers, and it looks like if
we're using a YCbCr format, i915 will always use a limited range while
vc4 will follow the value of the property.

I guess the best way to reconcile that would be to state that it also
controls the YCbCr range, and i915 can choose to reject/adjust the
configurations it can't support.

Does that make sense?

Maxime

--6dznigm7bfdw265q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbznsgAKCRDj7w1vZxhR
xY65AP4thN3Jypd+NMHjCI2DGcLcaa/6C19RZkReczuElu+gZwEA4x7ld5E6OIjM
5nF1e+nTxH1f21uOqX5xJzdswy85Rw8=
=NO9C
-----END PGP SIGNATURE-----

--6dznigm7bfdw265q--
