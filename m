Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHBROxLJeGmNtQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:17:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED58957C9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5737310E03C;
	Tue, 27 Jan 2026 14:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nfZPBDvj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9B710E03C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 14:17:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9E7DE4062E;
 Tue, 27 Jan 2026 14:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14A2C116C6;
 Tue, 27 Jan 2026 14:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769523470;
 bh=Wej2MOWpAG+SIElNaf3Kl2Rp9CHikAlyCHOcfjpccbw=;
 h=Date:From:To:Cc:Subject:From;
 b=nfZPBDvjTmcOwjqRY/NDCZdNunfbJ5hvnoAutYLRgdimdA4VmR9cWcvIIA9ek08Ih
 OTLAdPOTr/ZKtfoT8Zwhas1Nc45J61N3t7LWviAogl4IZk23kZQULkv+VGK4+Lxm0F
 Kj3G1VUsA5qj7y7ISLMOD3MakIaBWhQx++K4LMIL6CgHORmppnrlWF3U0DM6kP3Nv5
 zHwAMao3QG/mEKtODiHnQcn2wQBIi0/ha23X+CJgRTfKQtQA53jOa0HpqjkwhjDY8x
 EwhV6wpf86wUGh4j63cXAgi0PSI99msOT5Qc1ZWKx2VqJzj7wq2Dn9ToLF6B14ndXW
 OQE5BSCm9pcUg==
Date: Tue, 27 Jan 2026 14:17:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Zhu Lingshan <lingshan.zhu@amd.com>
Subject: linux-next: manual merge of the drm tree with the mm-unstable tree
Message-ID: <aXjJCmDiKFYA0-P6@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MgnZV3muts1xuYCF"
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@redhat.com,m:alexander.deucher@amd.com,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,m:oleg@redhat.com,m:lingshan.zhu@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7ED58957C9
X-Rspamd-Action: no action


--MgnZV3muts1xuYCF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdkfd/kfd_process.c

between commit:

  8635c94737032 ("drm/amd: kill the outdated "Only the pthreads threading m=
odel is supported" checks")

=66rom the mm-unstable tree and commit:

  d59e9d2d556ad ("amdkfd: process pointer of a HIQ should be NULL")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdkfd/kfd_process.c
index f8ef18a3aa71d,ba25d83c23e78..0000000000000
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c

--MgnZV3muts1xuYCF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml4yQkACgkQJNaLcl1U
h9BdxAf9HizhRgpOuFZEcZVOt/JDkla+mvNH2QT0ALavkbXjAdtjHHe91j5W6vHu
sOaO1ObsoXNjPEv8REPQNwYvigCUgEM+oihFjxw3KisU3rBrnx19e1unEaMGEVDx
XWCE+n+vDUF5+YOEXPef0d4sW/i9nqYMmqYEybzrnir/QQGTlpr8ZFHseZW5pa5p
uOXdsAgtV3vZevXx4Pn5dfPy6r2vK5crlw0PAF4U6nFidgMaqMpNHFDeWBqnP5Fw
MnyvIuWAC4XMEKxvB6aTQNb0+epOytySQmXjq8SZQm3jyCCBbaKxtM68USFcalsA
yhDfuuuNrYvv2szeHBRIjCDIiuIw9Q==
=npR3
-----END PGP SIGNATURE-----

--MgnZV3muts1xuYCF--
