Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C35C9B44C9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 09:49:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB6110E5D5;
	Tue, 29 Oct 2024 08:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=scrumplex.net header.i=@scrumplex.net header.b="rXoo0HLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0596A10E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 08:49:08 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Xd3p73lYdz9sl9;
 Tue, 29 Oct 2024 09:49:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scrumplex.net;
 s=MBO0001; t=1730191743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M4803B9eym6IEFUQT/okTaYbhk1BKN7ycWsryGCM+FQ=;
 b=rXoo0HLy/qUs2x5LkqfaRgW4QjcoNw5xF+VzNc9QVTrvUjAqE+e96LnO1JbmS9GMkMWwsF
 PdFi5saHHrDGRbZhCB4fip9Ydrn7xN0agvmtTMoUcsOkAdDQXEZGUtL9F3dIkssQ0iQpth
 ovE1dsQPxTv2N8rWkbL5h/vMYJzBJeqkNHRU5JYZdbaZYc0LXaCJTVh01wmR+oWMCmdu4H
 ft5+739DCzc7rSQnbUdjIg13PZUOOoLx23cfPC8U2Hc+S9XUmuqg6/26L7FCHoiLwyKdpC
 6g8VqEnK5d+0Wn3m9uomZAzaYMXKzcTYUdmnPG0ubFpjceNkvWRDDYkLK/H6iA==
Message-ID: <89f8c2046cfc05e48d24ec36cc78bd871da794c6.camel@scrumplex.net>
Subject: Re: [PATCH] drm/edid: add non-desktop quirk to XREAL Air/Air 2 Pro
From: Sefa Eyeoglu <contact@scrumplex.net>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Date: Tue, 29 Oct 2024 09:48:59 +0100
In-Reply-To: <871pzzpasl.fsf@intel.com>
References: <20241028221055.778851-1-contact@scrumplex.net>
 <871pzzpasl.fsf@intel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-J2xFfJnayPvuiYuNCGaQ"
MIME-Version: 1.0
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


--=-J2xFfJnayPvuiYuNCGaQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2024-10-29 at 10:34 +0200, Jani Nikula wrote:
> On Mon, 28 Oct 2024, Sefa Eyeoglu <contact@scrumplex.net> wrote:
> > Both devices lack a DisplayID 2.0 block and therefore do not
> > advertise
> > themselves as HMDs.
> >=20
> > See https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/53
>=20
> Please attach the EDIDs to the bug.
>=20
> BR,
> Jani.

I had attached the outputs of edid-decode in collapsibles already. I
also attached the binary EDID files now.


KR,

Sefa

>=20
> >=20
> > Signed-off-by: Sefa Eyeoglu <contact@scrumplex.net>
> > ---
> > =C2=A0drivers/gpu/drm/drm_edid.c | 4 ++++
> > =C2=A01 file changed, 4 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_edid.c
> > b/drivers/gpu/drm/drm_edid.c
> > index 855beafb76ff..bc13f6ef2c5d 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -219,6 +219,10 @@ static const struct edid_quirk {
> > =C2=A0	EDID_QUIRK('V', 'L', 'V', 0x91be, EDID_QUIRK_NON_DESKTOP),
> > =C2=A0	EDID_QUIRK('V', 'L', 'V', 0x91bf, EDID_QUIRK_NON_DESKTOP),
> > =C2=A0
> > +	/* XREAL Air series AR glasses */
> > +	EDID_QUIRK('M', 'R', 'G', 0x3132, EDID_QUIRK_NON_DESKTOP),
> > +	EDID_QUIRK('M', 'R', 'G', 0x3135, EDID_QUIRK_NON_DESKTOP),
> > +
> > =C2=A0	/* HTC Vive and Vive Pro VR Headsets */
> > =C2=A0	EDID_QUIRK('H', 'V', 'R', 0xaa01, EDID_QUIRK_NON_DESKTOP),
> > =C2=A0	EDID_QUIRK('H', 'V', 'R', 0xaa02, EDID_QUIRK_NON_DESKTOP),
>=20



--=-J2xFfJnayPvuiYuNCGaQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQThcyN6x4IpbZj1razhPf1LRxJ5UQUCZyChewAKCRDhPf1LRxJ5
USE3AP0WmF48c5sTfjItHqOBLKkhpUCBdoTvyzsfDvTLUJQwuAD/cnIcu0jCWms2
XYh819gIlzq7CUZrtymRFK1RgekRuQ0=
=f7mE
-----END PGP SIGNATURE-----

--=-J2xFfJnayPvuiYuNCGaQ--
