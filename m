Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLXrI24SiWmT2AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 23:47:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CBE10A830
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 23:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7323F10E0A9;
	Sun,  8 Feb 2026 22:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VKA8gGtX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF7410E0A9
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 22:47:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CBEDC600BB;
 Sun,  8 Feb 2026 22:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D863C4CEF7;
 Sun,  8 Feb 2026 22:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770590825;
 bh=LQ4s2e8Lj7w21FEOqYhdWpp7zK/QswGp8/y51DxHH1g=;
 h=Date:From:To:Cc:Subject:From;
 b=VKA8gGtXiMn7/AEZ76qtATkcCdfMhC8l4N8MJtEvLUNOw4IEl+/3vUyQ1c+RakH/E
 3XYBGG7D2mk2JaUhgXAHSCbSB+9sHAv2duMV/o0z8YfdqT6DE11Jmflonkhbbc1esM
 UUVneykSDtRy2bHMNeRu/0pNC06+i3D2pmZ1JHxOnkftSKfcboMOWj60RKS0hmxW4V
 JXPV+DCMcf1nESnfXktVZq9z8klgvPwnAudYP8WGnQnDJPxRIUybCJ47aw0HU/CRix
 DyNrJOBMaVndSTueBEGaBDgpw2ceEVaJRMBh2THkmV5v30ThyibSxZUeligjL08P7v
 oAYNUJQuRr5HQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id E6DEF1AC57F1; Sun, 08 Feb 2026 22:47:02 +0000 (GMT)
Date: Sun, 8 Feb 2026 22:47:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matt Roper <matthew.d.roper@intel.com>, Raag Jadav <raag.jadav@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <aYkSZpjepGCh6ZGI@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9UUSVj4PRQBDK18F"
Content-Disposition: inline
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@redhat.com,m:ashutosh.dixit@intel.com,m:daniele.ceraolospurio@intel.com,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,m:matthew.d.roper@intel.com,m:raag.jadav@intel.com,m:riana.tauro@intel.com,m:rodrigo.vivi@intel.com,m:thomas.hellstrom@linux.intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 36CBE10A830
X-Rspamd-Action: no action


--9UUSVj4PRQBDK18F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_guc.c

between commit:

  4cb1b327135ddd ("drm/xe/guc: Fix CFI violation in debugfs access.")

=66rom the origin tree and commits:

  43fb9e113bf11d ("drm/xe/gt: Introduce runtime suspend/resume")
  6e035abf98b05f ("drm/xe/guc: Fix CFI violation in debugfs access.")
  3947e482b5ebb9 ("drm/xe/guc: Use scope-based cleanup")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_guc.c
index edb939f2626851,6df7c3f260e5bd..00000000000000
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c

--9UUSVj4PRQBDK18F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmJEmYACgkQJNaLcl1U
h9Bmswf+PHJQScW6m6tWHwj5lGFXMZq35rX5mR1zBpuhozezd71BbCpnGv7vXFSU
BxfdB27gB4JzphXY7ZXu9vhpUfJioU4mNyV30XKTC9BowNa7pncg4E+2uEkK7+lI
Ran6ByjlyGHi2R7TMIdJNDEUUTd09WKQ/+FLoj4Wyr3OgHv21+gySiAfgsMhkDXA
/j/m9mT2WrFMM2vttLHVCOzNkb6N8E2u+dkKpe/JqO1FpaehblzXxoUQtvdOzB2I
J+NiZejfNensiPU4wPmGr/QeGty6a4/FxbSMDUxK8LJEjVcmZPUFc/DgsbuA46ds
XVpUSDRzMuGBalAE3yiPkwgHD5r13g==
=edQg
-----END PGP SIGNATURE-----

--9UUSVj4PRQBDK18F--
