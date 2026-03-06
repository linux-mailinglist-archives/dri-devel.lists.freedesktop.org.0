Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4He0G/3aqmk3XwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:47:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257862220D1
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA0510E291;
	Fri,  6 Mar 2026 13:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n6kMNgAG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D97410E291
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 13:47:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B005060018;
 Fri,  6 Mar 2026 13:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D286C4CEF7;
 Fri,  6 Mar 2026 13:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772804857;
 bh=0ukStTyGnIIvoK4UDcCYldUsJPcmS2GrzcUY4SL21gE=;
 h=Date:From:To:Cc:Subject:From;
 b=n6kMNgAGRJ1za0nKAdnK+tIqO1rcqzH/J3BUCC2W2e/3r/X8VkCXp2z4sMY4fLODa
 NsGIfvS/qH6MZD5SQEYfTu9wb1RsAi90Pv5NIZEGsI6bFh2vfFm/JJqCwLgruc4MVW
 UX4TprS7JWx8XthtAZ2nIYSpBd1pRZKk87upq2oEvk3XpZSw6kfSqkPH3HyNZo/2wD
 FxO1p00hm3aYwZjL3JB846e/k8Qml+BF5xC/3hPe2sMim31NxJ5suJdztJcHINd+Ai
 ms/Vmrqv5yHkyJSZ19QkZ3IOWFq6J+aT/bsfqEyxqNmWZzjD52+CoUbeKtKLRMfir1
 syXKOQHT+H3Tw==
Date: Fri, 6 Mar 2026 13:47:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <aara9fmCbTdROliH@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Nky8M7ub3zJ4eLnz"
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
X-Rspamd-Queue-Id: 257862220D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:airlied@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,m:matthew.d.roper@intel.com,m:rodrigo.vivi@intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


--Nky8M7ub3zJ4eLnz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_wa.c

between commit:

  89865e6dc8487 ("drm/xe/xe2_hpg: Correct implementation of Wa_16025250150")

=66rom the drm-fixes tree and commit:

  941f538b0af81 ("drm/xe: Consolidate workaround entries for Wa_16021867713=
")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_wa.c
index 462c2fa712e01,289acac2c3c82..0000000000000
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c

--Nky8M7ub3zJ4eLnz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmq2vQACgkQJNaLcl1U
h9A+Pgf9GLG/N23ED2iT/BnDDvEPH25nVyO1wvmJ3D3/tesRhl+J+4pM3am9o5oe
cyqhQX/79nKf7pFX7C9FM/RahXb6pui8xE4cl2OEc8uh+qCfkSbPKjy1Mt52pEJ9
dKBjoEg4oyBTXmUZI+WONOi947h/gxgyinT25Y/SntfksjMLYoSyfuHYf7kSF547
khk9aEKS8sII/Fzf3YsFMX/o7PyJot/rKTy/k1TgeQ85AXPr4/Ao3BNjg2CNOTZY
lTpAmqGVzl1LaSuKhySp+vUXvO9FOLC6qkux80qiOuyatuf7C/Nf4B9Zdl/WB7ND
n/Umc/cQjokU/n23hnw/fAKU/GA7QA==
=ThXb
-----END PGP SIGNATURE-----

--Nky8M7ub3zJ4eLnz--
