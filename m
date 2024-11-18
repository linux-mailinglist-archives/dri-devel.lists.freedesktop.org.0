Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDF09D144A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 16:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2241510E253;
	Mon, 18 Nov 2024 15:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O95VOuDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7032510E253
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 15:19:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 561AFA4019B;
 Mon, 18 Nov 2024 15:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CACC4CED6;
 Mon, 18 Nov 2024 15:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731943161;
 bh=I1hslJ8DtXlwoUaxx6vIlk9MKMft+pKonR0pJPjeP58=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O95VOuDK2SMXxaKYM3N/b9j4vWRo9L2P1o+AZTWwx4UALYBJ+P8c5tqAdAnc6ICmN
 Bxls8zXrQFUfh3G+C6QKrOPptou63iGl2UWDoR+g2FLj+l23x+2wInqQqN550rXqTg
 p9UD9tCrH48dGPE/OYUP14Nde2EEpHSnToApC48Fm+/S8iuTxrqYItN99WJ2Ueihlv
 yIpfpsuflmPYXjsfTRwCTOFEUIDNb0FL1gY7EXHciScAZEL8mOm/2WLPzfSV7iAnNk
 9F2LWGyKf1XE0vqH4fM7sn4biSqkugFUWY+l1SnnC6US/5AznsshJR8L3c7wGEi7t6
 hjQojBUZRpmTg==
Date: Mon, 18 Nov 2024 16:19:18 +0100
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
Message-ID: <20241118-bipedal-mastodon-of-tenacity-ae0ced@houat>
References: <20241026041019.247606-1-marex@denx.de>
 <20241028-prophetic-cuttlefish-of-fury-2e0ede@houat>
 <0b1ffd41-f8e8-4e75-af35-0f410a34b3ae@denx.de>
 <20241028-mellow-ostrich-of-novelty-dcf6e6@houat>
 <fc79d9da-2a77-4398-ac90-4d908a507ca2@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="usca3pr2vircp7cg"
Content-Disposition: inline
In-Reply-To: <fc79d9da-2a77-4398-ac90-4d908a507ca2@denx.de>
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


--usca3pr2vircp7cg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/bridge: tc358767: Fix odd pixel alignment
MIME-Version: 1.0

On Mon, Oct 28, 2024 at 03:49:42PM +0100, Marek Vasut wrote:
> On 10/28/24 2:52 PM, Maxime Ripard wrote:
> > On Mon, Oct 28, 2024 at 01:36:58PM +0100, Marek Vasut wrote:
> > > On 10/28/24 10:25 AM, Maxime Ripard wrote:
> > > > On Sat, Oct 26, 2024 at 06:10:01AM +0200, Marek Vasut wrote:
> > > > > Horizontal Timing Control0 Register 1/2 (HTIM01/HTIM02) Register
> > > > > bitfields description state "These bits must be multiple of even
> > > > > pixel". It is not possible to simply align every bitfield to the
> > > > > nearest even pixel, because that would unalign the line width and
> > > > > cause visible distortion. Instead, attempt to re-align the timings
> > > > > such that the hardware requirement is fulfilled without changing
> > > > > the line width if at all possible.
> > > > >=20
> > > > > Warn the user in case a panel with odd active pixel width or full
> > > > > line width is used, this is not possible to support with this one
> > > > > bridge.
> > > > >=20
> > > > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > > > ---
> > > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > Cc: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > Cc: Robert Foss <rfoss@kernel.org>
> > > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > ---
> > > > >    drivers/gpu/drm/bridge/tc358767.c | 63 +++++++++++++++++++++++=
++++++--
> > > > >    1 file changed, 60 insertions(+), 3 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/=
bridge/tc358767.c
> > > > > index 0a6894498267e..7968183510e63 100644
> > > > > --- a/drivers/gpu/drm/bridge/tc358767.c
> > > > > +++ b/drivers/gpu/drm/bridge/tc358767.c
> > > > > @@ -901,6 +901,63 @@ static int tc_set_common_video_mode(struct t=
c_data *tc,
> > > > >    	int vsync_len =3D mode->vsync_end - mode->vsync_start;
> > > > >    	int ret;
> > > > > +	/*
> > > > > +	 * Horizontal Timing Control0 Register 1/2 (HTIM01/HTIM02) Regi=
ster
> > > > > +	 * bitfields description state "These bits must be multiple of =
even
> > > > > +	 * pixel". It is not possible to simply align every bitfield to=
 the
> > > > > +	 * nearest even pixel, because that would unalign the line widt=
h.
> > > > > +	 * Instead, attempt to re-align the timings.
> > > > > +	 */
> > > > > +
> > > > > +	/* Panels with odd active pixel count are not supported by the =
bridge */
> > > > > +	if (mode->hdisplay & 1)
> > > > > +		dev_warn(tc->dev, "Panels with odd pixel count per active line=
 are not supported.\n");
> > > > > +
> > > > > +	/* HPW is odd */
> > > > > +	if (hsync_len & 1) {
> > > > > +		/* Make sure there is some margin left */
> > > > > +		if (left_margin >=3D 2) {
> > > > > +			/* Align HPW up */
> > > > > +			hsync_len++;
> > > > > +			left_margin--;
> > > > > +		} else if (right_margin >=3D 2) {
> > > > > +			/* Align HPW up */
> > > > > +			hsync_len++;
> > > > > +			right_margin--;
> > > > > +		} else if (hsync_len > 2) {
> > > > > +			/* Align HPW down as last-resort option */
> > > > > +			hsync_len--;
> > > > > +			left_margin++;
> > > > > +		} else {
> > > > > +			dev_warn(tc->dev, "HPW is odd, not enough margins to compensa=
te.\n");
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	/* HBP is odd (HPW is surely even now) */
> > > > > +	if (left_margin & 1) {
> > > > > +		/* Make sure there is some margin left */
> > > > > +		if (right_margin >=3D 2) {
> > > > > +			/* Align HBP up */
> > > > > +			left_margin++;
> > > > > +			right_margin--;
> > > > > +		} else if (hsync_len > 2) {
> > > > > +			/* HPW is surely even and > 2, which means at least 4 */
> > > > > +			hsync_len -=3D 2;
> > > > > +			/*
> > > > > +			 * Subtract 2 from sync pulse and distribute it between
> > > > > +			 * margins. This aligns HBP and keeps HPW aligned.
> > > > > +			 */
> > > > > +			left_margin++;
> > > > > +			right_margin++;
> > > > > +		} else {
> > > > > +			dev_warn(tc->dev, "HBP is odd, not enough pixels to compensat=
e.\n");
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	/* HFP is odd (HBP and HPW is surely even now) */
> > > > > +	if (right_margin & 1)
> > > > > +		dev_warn(tc->dev, "HFP is odd, panels with odd pixel count per=
 full line are not supported.\n");
> > > > > +
> > > >=20
> > > > This should all happen in atomic_check, and reject modes that can't
> > > > be supported.
> >=20
> > > No, that would reject panels I need to support and which can be
> > > supported by this bridge.
> >=20
> > Then drop the warnings, either you support it or you don't.
>
> These warnings are useful to notify users that something is not right. I
> find them useful when bringing up systems with this bridge.

Yeah, because you know what to do about them.

Unfortunately, you're not the only audience of those messages, and the
vast majority of the users will have no idea what these warnings are
about, and no way to fix them.

Maxime

--usca3pr2vircp7cg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZzta9gAKCRAnX84Zoj2+
dpjyAX9Kjg2KKYUonOZXftR7Yj/BpvGGqgz/0yeDhiVEHMDVXolr3dbheSFiwR8g
ohXRYbQBgLRHNNvF3b1lIjICh/VWkpjzPLk2LoBQZ+fX9G8fKiPy5ljOgElin7gs
pUhkan7oQw==
=n95R
-----END PGP SIGNATURE-----

--usca3pr2vircp7cg--
