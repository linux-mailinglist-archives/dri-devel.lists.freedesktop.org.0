Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 587B1B357F4
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 11:03:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810ED10E2DC;
	Tue, 26 Aug 2025 09:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pF7H9Uf7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9708C10E2DC;
 Tue, 26 Aug 2025 09:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756199024;
 bh=AEA0tboIIwumHQDgu58GiD5GyIcRWbalr3fv6UgFixo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pF7H9Uf7g+Np9cwo3+MdkCq9Z9WSFF3tukQSL1HFuR2XzeUvattpNMM5mK8QmgKG1
 rgN0UgFbUuabSNizJUXthZhBsnBw/Fltv6vWhQjANB6MlpZ1xMqp6vd2W4VTQuG4aL
 cRYzkeaRLFccPRVpW8Dr34dczjQXCoyvUiDR3nN9+bT+aCDquL4aTKnfQr9W7Wr87u
 J/lV7iLi/HeOTRtTOlfM6/q9SPao32Ds5a0vuOn/CkvPUi5sucqsyCzyoqM7SaX3uH
 JjH088gBYdpZ1Gfd4cPCwLtyf9ESzQAxlbCZDFQSdzSeGtQ/LXoj1RmIeBXeqPNL4A
 BWtzmOTvDPJVQ==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2165B17E0A28;
 Tue, 26 Aug 2025 11:03:43 +0200 (CEST)
Date: Tue, 26 Aug 2025 12:03:06 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Alex Hung <alex.hung@amd.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>, Sebastian Wick
 <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, nfraprado@collabora.com, Daniel Stone
 <daniels@collabora.com>
Subject: Re: [PATCH V11 06/47] drm/colorop: Add 1D Curve subtype
Message-ID: <20250826120306.618c275f@eldfell>
In-Reply-To: <4eef4157-cad5-4399-9bc9-c5c2f005d472@amd.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-7-alex.hung@amd.com>
 <DC6I12RMKGXL.1L8KAEE0UBNNW@redhat.com>
 <CAFZQkGyXbD_x0V6KBdR4vaunF+bG+HKOYAA7y6aVWfeTQ3cLzA@mail.gmail.com>
 <4eef4157-cad5-4399-9bc9-c5c2f005d472@amd.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3qjeMGeqauBUipZAl8_EYKi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/3qjeMGeqauBUipZAl8_EYKi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Aug 2025 11:54:32 -0600
Alex Hung <alex.hung@amd.com> wrote:

> On 8/21/25 06:23, Xaver Hugl wrote:
> >> We user space folks have been convinced at this point that the sRGB EO=
TF
> >> is actually gamma 2.2, and not the piece-wise function. Now, if the
> >> hardware is actually the piece-wise, then that's what should be expose=
d,
> >> but I'm a bit unsure if we should do that under the name sRGB EOTF. =20
> > Maybe simply rename the enum string to "sRGB piece-wise EOTF"? In
> > hindsight, the naming of "srgb" in the Wayland protocol caused a lot
> > of confusion, it's better to be explicit about it where possible. =20
>=20
> I will leave this to Harry to comment. He is taking a few days off so I=20
> will check with him later.
>=20

"sRGB inverse OETF"?

Strictly speaking "sRGB piece-wise EOTF" is not a thing AFAIU.


Thanks,
pq

--Sig_/3qjeMGeqauBUipZAl8_EYKi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmiteEoACgkQI1/ltBGq
qqeJIw//WRnYs255xPlaG6UKS5mo/qUPlDe2CIrOBfSxmP/d8rYRYEQSg390r2R1
9nSOD3joV4nn+vp88U7YqciYeMz4NJHSuWAuJeKdNlY5l+pTMRObVHYZrg+bHmWR
3tXOmmY6g5SNpI/x9fn3Wlzr5AB/GBUDaPtgBaC/V1Oot/XF2XARvD9SeA9IqC2g
lLzLeqyCAIyrrh3f1jOaR0AtL7AoJMDsxW4ZKl3LQ3/0rMXaBUA9Ujb5cGE5aYql
REKlIhEBnJUidQv3zBllxr5UKK0+WnlUcl5nGWf/D2b6Qwe2whChJ3J9GdO5oJSo
1nly6Ob7FwkzXCDSx2fhQeXa/S2mfstrUMF93JrBdH3J7CYcEhg6q8d8hdkJl2FM
Ix5tejgRBnj2MGf9oRSS8nVsTk6Myz+guhSy1hpdRIneYj1dJ41I4S2lWQGdwj9y
LvHOynCM4juvQNd3ZdV08ZTk13KjQiK3QJnl5xuqTVGGWg9DmAj+2kDn4EDmXsoe
7vYpmP0HC+RV2vXiov3TVYfmqJ1HrIUnp/YdTxzFOi21LucpW6CBuPO9mqkamCIo
4MuHbIs7A9IwmUf+IhQxqCyeGJGSYTdAqUIPIpauIshNREydeHHbWQ/hMXAwdMLn
UvsC2SKCUECnvWtxsOGpg7pif7VH9STZoJGfDPxLPVa60K/9zjg=
=mY+T
-----END PGP SIGNATURE-----

--Sig_/3qjeMGeqauBUipZAl8_EYKi--
