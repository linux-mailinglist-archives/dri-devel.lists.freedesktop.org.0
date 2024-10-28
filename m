Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC9A9B3235
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 14:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947BE10E4B9;
	Mon, 28 Oct 2024 13:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hCg7qNHs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5300F10E4B9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 13:53:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 405BEA4211D;
 Mon, 28 Oct 2024 13:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DDFC4CEC3;
 Mon, 28 Oct 2024 13:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730123628;
 bh=gLGvaETaA9KrTuAfxxQEcbnH9db6Vm0fKK6E8dKmtT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hCg7qNHsNG+9id8JvnXtyCR4XhvwpThytHSJPY8555pmtUyJY82oN17qV0oiS2Wi3
 mShkHXzSrgVCF4HCJPbndF8hJW6LBbqye6pu136mHnvekw9cJhRj5zXmC3aFBJtXLd
 myD8Ol92q8TeoD1OyNKgYe57mwWN0NKQl4WSpfobL9Q7D1cuWSqgfIHLL2gGnjoMJC
 sgcp6k1Xsv6+iuaAVitetIp9tOv7G0RnOI/nJwmvvO7hAMOHpK1M+C+A9ieNZlIW62
 yaTUlA8Gsz8RwNNJtAUqLRDNTzmWoIbrGxb4fgfD0C2fTLQRL2c8Hb4hJm9x9x911e
 K2pbyvwSWDObQ==
Date: Mon, 28 Oct 2024 14:53:45 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/bridge: tc358767: Fix odd pixel alignment
Message-ID: <20241028-resilient-opalescent-bustard-dc747b@houat>
References: <20241026041019.247606-1-marex@denx.de>
 <20241028-prophetic-cuttlefish-of-fury-2e0ede@houat>
 <0b1ffd41-f8e8-4e75-af35-0f410a34b3ae@denx.de>
 <20241028-mellow-ostrich-of-novelty-dcf6e6@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="iorzugrqmmkcysau"
Content-Disposition: inline
In-Reply-To: <20241028-mellow-ostrich-of-novelty-dcf6e6@houat>
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


--iorzugrqmmkcysau
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: tc358767: Fix odd pixel alignment
MIME-Version: 1.0

On Mon, Oct 28, 2024 at 02:52:09PM +0100, Maxime Ripard wrote:
> On Mon, Oct 28, 2024 at 01:36:58PM +0100, Marek Vasut wrote:
> > On 10/28/24 10:25 AM, Maxime Ripard wrote:
> > > On Sat, Oct 26, 2024 at 06:10:01AM +0200, Marek Vasut wrote:
> > > > Horizontal Timing Control0 Register 1/2 (HTIM01/HTIM02) Register
> > > > bitfields description state "These bits must be multiple of even
> > > > pixel". It is not possible to simply align every bitfield to the
> > > > nearest even pixel, because that would unalign the line width and
> > > > cause visible distortion. Instead, attempt to re-align the timings
> > > > such that the hardware requirement is fulfilled without changing
> > > > the line width if at all possible.
> > > >=20
> > > > Warn the user in case a panel with odd active pixel width or full
> > > > line width is used, this is not possible to support with this one
> > > > bridge.
> > > >=20
> > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > ---
> > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > Cc: David Airlie <airlied@gmail.com>
> > > > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > > > Cc: Robert Foss <rfoss@kernel.org>
> > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: dri-devel@lists.freedesktop.org
> > > > ---
> > > >   drivers/gpu/drm/bridge/tc358767.c | 63 ++++++++++++++++++++++++++=
+++--
> > > >   1 file changed, 60 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/br=
idge/tc358767.c
> > > > index 0a6894498267e..7968183510e63 100644
> > > > --- a/drivers/gpu/drm/bridge/tc358767.c
> > > > +++ b/drivers/gpu/drm/bridge/tc358767.c
> > > > @@ -901,6 +901,63 @@ static int tc_set_common_video_mode(struct tc_=
data *tc,
> > > >   	int vsync_len =3D mode->vsync_end - mode->vsync_start;
> > > >   	int ret;
> > > > +	/*
> > > > +	 * Horizontal Timing Control0 Register 1/2 (HTIM01/HTIM02) Regist=
er
> > > > +	 * bitfields description state "These bits must be multiple of ev=
en
> > > > +	 * pixel". It is not possible to simply align every bitfield to t=
he
> > > > +	 * nearest even pixel, because that would unalign the line width.
> > > > +	 * Instead, attempt to re-align the timings.
> > > > +	 */
> > > > +
> > > > +	/* Panels with odd active pixel count are not supported by the br=
idge */
> > > > +	if (mode->hdisplay & 1)
> > > > +		dev_warn(tc->dev, "Panels with odd pixel count per active line a=
re not supported.\n");
> > > > +
> > > > +	/* HPW is odd */
> > > > +	if (hsync_len & 1) {
> > > > +		/* Make sure there is some margin left */
> > > > +		if (left_margin >=3D 2) {
> > > > +			/* Align HPW up */
> > > > +			hsync_len++;
> > > > +			left_margin--;
> > > > +		} else if (right_margin >=3D 2) {
> > > > +			/* Align HPW up */
> > > > +			hsync_len++;
> > > > +			right_margin--;
> > > > +		} else if (hsync_len > 2) {
> > > > +			/* Align HPW down as last-resort option */
> > > > +			hsync_len--;
> > > > +			left_margin++;
> > > > +		} else {
> > > > +			dev_warn(tc->dev, "HPW is odd, not enough margins to compensate=
=2E\n");
> > > > +		}
> > > > +	}
> > > > +
> > > > +	/* HBP is odd (HPW is surely even now) */
> > > > +	if (left_margin & 1) {
> > > > +		/* Make sure there is some margin left */
> > > > +		if (right_margin >=3D 2) {
> > > > +			/* Align HBP up */
> > > > +			left_margin++;
> > > > +			right_margin--;
> > > > +		} else if (hsync_len > 2) {
> > > > +			/* HPW is surely even and > 2, which means at least 4 */
> > > > +			hsync_len -=3D 2;
> > > > +			/*
> > > > +			 * Subtract 2 from sync pulse and distribute it between
> > > > +			 * margins. This aligns HBP and keeps HPW aligned.
> > > > +			 */
> > > > +			left_margin++;
> > > > +			right_margin++;
> > > > +		} else {
> > > > +			dev_warn(tc->dev, "HBP is odd, not enough pixels to compensate.=
\n");
> > > > +		}
> > > > +	}
> > > > +
> > > > +	/* HFP is odd (HBP and HPW is surely even now) */
> > > > +	if (right_margin & 1)
> > > > +		dev_warn(tc->dev, "HFP is odd, panels with odd pixel count per f=
ull line are not supported.\n");
> > > > +
> > >=20
> > > This should all happen in atomic_check, and reject modes that can't
> > > be supported.
>=20
> > No, that would reject panels I need to support and which can be
> > supported by this bridge.
>=20
> Then drop the warnings, either you support it or you don't.

Oh, and update the commit log, because so far it claims that you can't
support those panels.

Maxime

--iorzugrqmmkcysau
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZx+XaQAKCRAnX84Zoj2+
dmkMAX9Oo5JYUYPa78v/1zDHBJKMRthILWmlmyLFSnVHVXDoHiD521hCs4xzEufr
1jSsmqMBf2nL5jyWRZnQao+I9iJceDfYRRr/nwzUEakJ7S8xdiY6e4ISEJ8i6NzP
Ax16DlSEiw==
=mfO5
-----END PGP SIGNATURE-----

--iorzugrqmmkcysau--
