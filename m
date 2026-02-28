Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JleDwz7omkZ8gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:26:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDEA1C3934
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 15:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC78310E2BA;
	Sat, 28 Feb 2026 14:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IDlBpRbc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D9C10E2BA
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Feb 2026 14:26:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 04E174055B;
 Sat, 28 Feb 2026 14:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6DE6C116D0;
 Sat, 28 Feb 2026 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772288762;
 bh=p0m4b9Cu2R487zUVWz8+aY5tpJLJNC+MHOAHj5xSxw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IDlBpRbc/aOJs+QuFFyvxOfNVgTFiUF7jUmysowfFA3JxNx/Ky2OlhBgn4XyGJc+w
 bb3jfm55w5N7H86M/5yj47/I8J4pvPIdkWupsF0rzxZGhsNMTP2R+Y73Xt+gDj8aWM
 hALejpJAeVWv8KtKI48VMmqxcHYKk9VmuKrzcC5BXwUgksKytqiMXvA2gT80KJvVD+
 WCVDkIMIJ11JBAb8F063Ku5ng9zPCxbwtdsaoKklbqMc055N9aHf6lAY1FiCzdPaXe
 hza8bWXe2ixFCkACGPdSm55UhsVhMrpP7GM7+nZqc7sgLtjyxtMEgdRyZLYO02/Vin
 D2aFeUKWMFiHg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id ECD231AC58E5; Sat, 28 Feb 2026 14:25:59 +0000 (GMT)
Date: Sat, 28 Feb 2026 14:25:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/imagination: Check for NULL struct
 dev_pm_domain_list
Message-ID: <aaL69__gB9mnR_um@sirena.co.uk>
References: <20260227-single-domain-power-fixes-v1-0-d37ba0825f7c@imgtec.com>
 <20260227-single-domain-power-fixes-v1-1-d37ba0825f7c@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tZsRh7811fnmnXri"
Content-Disposition: inline
In-Reply-To: <20260227-single-domain-power-fixes-v1-1-d37ba0825f7c@imgtec.com>
X-Cookie: Think big.  Pollute the Mississippi.
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
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:matt.coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:geert@linux-m68k.org,m:frank.binns@imgtec.com,m:alessio.belle@imgtec.com,m:brajesh.gupta@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux-m68k.org,imgtec.com,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,sirena.co.uk:mid]
X-Rspamd-Queue-Id: 9FDEA1C3934
X-Rspamd-Action: no action


--tZsRh7811fnmnXri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 02:12:47PM +0000, Matt Coster wrote:
> While dev_pm_domain_detach_list() itself contains the necessary NULL chec=
k,
> the access to struct dev_pm_domain_list->num_pds does not and thus faults
> on devices with <=3D1 power domains (where the struct dev_pm_domain_list
> machinery is skipped for simplicity).
>=20
> This can be reproduced on AM625, which produces the following log[1]:

Tested-by: Mark Brown <broonie@kernel.org>

--tZsRh7811fnmnXri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmi+vcACgkQJNaLcl1U
h9CrFgf/e3tBHZv1kvgeLjvZeh5PHprI+KMjcOxUFEpNbCMU4P7bgyHmkx1L7MxK
GyfwyX0P02icGY+5aMub6H8QpZvvpq0Jm4gbyEJj7k3hTDRNEZ1V8HeGMJnSlncF
tWvtftsArconpVVeiRC2k3nf3hymNN6cXby2Yf4SZp+/2pqFXYsszOIQG0E1dWsX
Cy5Mrij6qRrR41QciUEjK8/HMbNRNaXduSdOgqEiYknJZ/6LQUAQpgShwlHvhKPC
J5Z7LQQAVofM/KbCh8dGhHS0aMAD59JM++ojDtJHl+o1dkomm/wTo+fidEjfyBfy
ZrbE8zdoEV5Kz4WeD5ll//kO9dd2wQ==
=rpRg
-----END PGP SIGNATURE-----

--tZsRh7811fnmnXri--
