Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eECFJrqvhWkRFAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:09:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5379FBD62
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 10:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D27910E5C9;
	Fri,  6 Feb 2026 09:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Zeq14iJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CD010E5C9
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 09:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770368947;
 bh=81Nfnr+VgGFh1r1KxdRZ/fW91tng+mO/I9oWaPLw1M8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zeq14iJASuWMiCVaPM0Pq1VwmwDFxdyiFG+ZAxgtEY75PnbG9du504E8hcTbBT7aR
 ERjhnQPjndIHwksoMMDmEVPT4xW0SG4yU7b9Kt2wML+uSK8XwTpJY7aGhnf1sYREb4
 aDsdsN4D/aBFWNr3SY5PprTvRMKcznkaf6l/0g3muSFrXZ+KE6zHHYnFDChVkz8IWT
 kP8Udb2kwJm9E071SiJ9sA44iumwg8wIBoawYmxQpER9Y5fQ0COzRQWrFUYMw3iSjt
 UqkKrN0uGXhlsox06qmdQeKLADO8ehDkXDUOQXflk8w4xRcBdm+XjU7kGwMJkb6DbR
 YpdPjUXTBWUpg==
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 837A117E1352;
 Fri,  6 Feb 2026 10:09:06 +0100 (CET)
Date: Fri, 6 Feb 2026 11:09:01 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Shengyu Qu <wiagn233@outlook.com>, "=?UTF-8?B?TsOtY29sYXM=?= F. R. A.
 Prado" <nfraprado@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, daniels@collabora.com,
 ariel.dalessandro@collabora.com, kernel@collabora.com, xaver.hugl@gmail.com
Subject: Re: [PATCH 00/11] Plane Color Pipeline support for MediaTek
Message-ID: <20260206110901.660cf712@eldfell>
In-Reply-To: <cdf6a704-88f8-414a-adf1-65ea7237337f@amd.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <TY4PR01MB144323B0DDC18B05EE1472B5298BFA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <TY4PR01MB14432E7601C0BE848D25E80C398BAA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <cdf6a704-88f8-414a-adf1-65ea7237337f@amd.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hCOlWIbx7XSjDW26hBp0SP7";
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[pekka.paalanen@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:harry.wentland@amd.com,m:wiagn233@outlook.com,m:nfraprado@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:daniels@collabora.com,m:ariel.dalessandro@collabora.com,m:kernel@collabora.com,m:xaver.hugl@gmail.com,m:matthiasbgg@gmail.com,m:xaverhugl@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[pekka.paalanen@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[outlook.com,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim]
X-Rspamd-Queue-Id: B5379FBD62
X-Rspamd-Action: no action

--Sig_/hCOlWIbx7XSjDW26hBp0SP7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 2 Jan 2026 13:40:21 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2026-01-01 07:37, Shengyu Qu wrote:
> >=20
> >=20
> > =E5=9C=A8 2025/12/30 02:53, Shengyu Qu =E5=86=99=E9=81=93: =20
> >>
> >>
> >> =E5=9C=A8 2025/12/24 3:44, N=C3=83 colas F. R. A. Prado =E5=86=99=E9=
=81=93: =20

> >>> Given the lack of support for writeback connectors on the
> >>> MediaTek KMS driver, combined with limited hardware
> >>> documentation, I haven't been able to verify the correctness of
> >>> each curve, only that they were visually sane (gamma curves made
> >>> the image on the display brighter, while inverse gamma made it
> >>> darker). =20
> >>
> >> Hmmm I don't think this is acceptable. sRGB/scRGB has two transfer
> >> functions mentioned in original specification[1]. To keep color
> >> accuracy, we need someone from mediatek confirm whether this is
> >> piece- wise or pure power 2.2 transfer function, this is already
> >> done in original amdgpu color pipeline series, sRGB means
> >> piece-wise while also dedicated power 2.2 function exists. =20
>=20
> Not sure what you mean with this not being acceptable. This is about
> enabling HW support for this functionality. Not every HW has
> writeback for testing. At some point you'll have to trust the driver
> devs if you're going to use functionality of the driver. We're not
> always going to get everything perfect, but if that's really such a
> worry you can always use shaders to do precisely what you want.
>=20

Hi Harry,

yes, but I understood that in this case, the hardware documentation
available is so vague that it's impossible to say what it will actually
do. There are no formulas given or referenced in the documentation, are
there, N=C3=ADcolas?

The "HLG EOTF" is probably a good example of that, referring to the
reply I just sent on the patch adding "HLG" as a curve.


Thanks,
pq

--Sig_/hCOlWIbx7XSjDW26hBp0SP7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmmFr60ACgkQI1/ltBGq
qqfVuBAAhRSCzEHvBUtrOp91RdRbG2YPSFu9qQcoCw3vhnQVW16yyqFIhyLIYYvh
Wz+xqAHzjRwSlAQkt0tWCvLfQyOagIHc16qKV0ILgMhe9WS3L54kzGL8pusw+MFS
e7N+hU/eTPG0ceOOBKvTB9iuWoMIMJFglSj3EX2B6NRoVeo1JxptRUoRrA4p3nh2
IRGTOlqzOj75VbQkJRJZynwxiLiNoCj1qJzKzYsZpEx0mPUr283LiVujio0Awl/B
iIfUbgczUS/hkENMjixJBEWkVX1V4iys6GLraJbLWqrdF5EgWEFkIOOO/iEg9rJv
JKJZixdCs4TppDcs0lvBya5D/0gvMKJMFeZQGcqD6jNTZBuwdeoAXGcQcbuz0ljE
R8K3V9nTHf10Mhwk2Qwp0zWAedcGM1rEIgZnlFZlTCizqcO0YCfc6iwNvat2jTUT
oNuVbGQWXzWGb8cpGKlQ57ftrUEPdt2KCceJ+Cn3R5NAYTV2K4H1wN4aK+VGtXU0
Wvq1Psx2H9VlualOEBWDuTCmH1EFz+UPaMXpFWnKDOhK8qgA0r0yUffyfJP7kXvh
15d6L/2XOzbB0XnckisC/fAPX0usTGEOoNqaZVoJRGnIuYvWx26haI8R1gbmDz1G
tdgfsmYrIdytlgiSFWzIF/9VlsBP8kOro+za0/Qt7w7surapmBA=
=QU4T
-----END PGP SIGNATURE-----

--Sig_/hCOlWIbx7XSjDW26hBp0SP7--
