Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mInuJrParmm/JQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 15:35:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282DD23A97F
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 15:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4469710E187;
	Mon,  9 Mar 2026 14:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C+O0sxZc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6607B10E187
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 14:35:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0CF1D40BD5;
 Mon,  9 Mar 2026 14:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99840C2BC86;
 Mon,  9 Mar 2026 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773066926;
 bh=td5ftknNehC8j6Vob4umQYrFzWP3iJsSCjVvZSxTsZc=;
 h=Date:From:To:Cc:Subject:From;
 b=C+O0sxZclusK7ol28XglcMMs6Zlf1ZjKYkiyFTVc9GtCvxRXPzQ8b5QOOxp5IPJLL
 Y7dkSmt6uPAG5wtrF0IyOmiwue9YcGhAik4J8Z8J1bj+f5FdSjjGkWprrn48WIJL2Z
 NzEDsx6pEz9DyY+R/44bqjwoSfafL7IKKvdB8JpOa/cHzJ/5kvjGis4wb0fATamiO/
 chl1a8511Npk4YsnOX/t9Briv/cZP5VXxE6M683XT9akULxxZugU1U53ksDkh46J9p
 5wa4tXa3U20g2585WfWdbjH5H0YEV8dR3yoKMKZ4qujH72BO3Tb50ox1g8Fd98Q1is
 irR+4z/k7blCQ==
Date: Mon, 9 Mar 2026 14:35:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <aa7aqG5INDTFsZbq@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a75ee9lmBRa91F/0"
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
X-Rspamd-Queue-Id: 282DD23A97F
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
	FORGED_RECIPIENTS(0.00)[m:airlied@redhat.com,m:alexander.deucher@amd.com,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,m:sunil.khatri@amd.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.988];
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


--a75ee9lmBRa91F/0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

between commit:

  65b5c326ce410 ("drm/amdgpu/userq: refcount userqueues to avoid any race c=
onditions")

=66rom the drm-fixes tree and commit:

  4952189b284d4 ("drm/amdgpu/userq: refcount userqueues to avoid any race c=
onditions")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 5239b06b9ab03,d8ce7b3733e75..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

--a75ee9lmBRa91F/0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmu2qgACgkQJNaLcl1U
h9DRLwf8DNl2ISYZ4N2Zu0YS8w4vpBP9fOJVLyFDVMPE0oMrJ2X2iQDfxlK/isPK
MbRRlYI3pbfTD1utxzBgHK2GqyvgzdG1rf0G5zZYGwutSExpB10n1sc4uUad56mI
65SHVT11UeQtawRJ7n3Gj+76CB+wzRArfuojYj5U/i/J0WhuKyh9FNRS9t65jxBn
6Sl6OE5dca49igPuBaZBbRclGhcYHGZBMVjvGM6cOimAQLgg0q2E8W43uUfdYkrz
Xlryw/nyJA0A+i9A41DqB3lE4yqn6d221NsLHml+bt82y5KFLdX2CclROUokpTWa
9SY4CqjmSdUIvZBT2q7kbUyko+g3bQ==
=/yvF
-----END PGP SIGNATURE-----

--a75ee9lmBRa91F/0--
