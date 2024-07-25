Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC21B93BCFE
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 09:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EE410E500;
	Thu, 25 Jul 2024 07:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=scrumplex.net header.i=@scrumplex.net header.b="bSh+RreT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BCE10E500
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 07:20:15 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4WV2Mv4vMBz9tf6;
 Thu, 25 Jul 2024 09:20:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scrumplex.net;
 s=MBO0001; t=1721892011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tZEsCKU7xIjPTNW0eB18v8uwjlsqtQ0DiFuGV/KE/2o=;
 b=bSh+RreTgSeCvRRD+sw38XgqNOJSUuA182c+FJJuB/NwYbGGgbsgvPhbr97dnL/hCGud2H
 RWqeAeGpseJ4gs+eWKRXQf8zuyRfkIEOJPhbp8GCgMa9QZUF5MuR16qfnZbM3n/IS1W4oy
 Ei8GQZIybvPGxZy0REpss12hmmX12sY8s8VUidM21ojVOCoKT2E5MtLenEqwch+8Hdwdsn
 k0LhbJsugR4fMLfK1kavu0oIHcDEf0WZrGP17dVTUc9jSMMq2k46yEG5PM21mhbWHF7aff
 lRwGYmg+SR1SyBUHgsCH6RZwJ9A9C2TIirlSJmipZk98U55xCwLNAYSNMFtkPA==
Message-ID: <119ff8daeb8eadda3dae9e3f3cc590533b3bdd29.camel@scrumplex.net>
Subject: Re: [PATCH] drm/edid: add non-desktop quirk to Pimax VR Headsets
From: Sefa Eyeoglu <contact@scrumplex.net>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Date: Thu, 25 Jul 2024 09:20:09 +0200
In-Reply-To: <87zfq7fe50.fsf@intel.com>
References: <20240720110437.251252-2-contact@scrumplex.net>
 <87zfq7fe50.fsf@intel.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-EdRvZVc8dcMy801mGxaH"
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


--=-EdRvZVc8dcMy801mGxaH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jani,

I have asked someone with the actual hardware to attach their EDID blob
to the issue.

Kind regards,
Sefa

On Wed, 2024-07-24 at 10:22 +0300, Jani Nikula wrote:
> On Sat, 20 Jul 2024, Sefa Eyeoglu <contact@scrumplex.net> wrote:
> > See https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/40
>=20
> Please attach the relevant EDID blobs to the bug.
>=20
> BR,
> Jani.
>=20
> >=20
> > Signed-off-by: Sefa Eyeoglu <contact@scrumplex.net>
> > ---
> > =C2=A0drivers/gpu/drm/drm_edid.c | 5 +++++
> > =C2=A01 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_edid.c
> > b/drivers/gpu/drm/drm_edid.c
> > index f68a41eeb1fa..41879d67599d 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -237,6 +237,11 @@ static const struct edid_quirk {
> > =C2=A0	EDID_QUIRK('S', 'E', 'C', 0x144a, EDID_QUIRK_NON_DESKTOP),
> > =C2=A0	EDID_QUIRK('A', 'U', 'S', 0xc102, EDID_QUIRK_NON_DESKTOP),
> > =C2=A0
> > +	/* Pimax VR Headsets */
> > +	EDID_QUIRK('P', 'V', 'R', 0x1019, EDID_QUIRK_NON_DESKTOP),
> > +	EDID_QUIRK('P', 'V', 'R', 0x101a, EDID_QUIRK_NON_DESKTOP),
> > +	EDID_QUIRK('P', 'V', 'R', 0x101b, EDID_QUIRK_NON_DESKTOP),
> > +
> > =C2=A0	/* Sony PlayStation VR Headset */
> > =C2=A0	EDID_QUIRK('S', 'N', 'Y', 0x0704, EDID_QUIRK_NON_DESKTOP),
>=20


--=-EdRvZVc8dcMy801mGxaH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQThcyN6x4IpbZj1razhPf1LRxJ5UQUCZqH8qQAKCRDhPf1LRxJ5
UazDAQDZe9K65jaip9FwxBMXpEw4BVT//VJkRjfe8YvYJ9gsHwEA62o/nojaA+gz
EiMI081w0U0mg2Rg2/lY94qczSfZqQg=
=7A92
-----END PGP SIGNATURE-----

--=-EdRvZVc8dcMy801mGxaH--
