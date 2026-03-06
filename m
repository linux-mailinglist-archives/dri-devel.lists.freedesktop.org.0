Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGrpDefaqmk3XwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:47:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76822220A5
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 14:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D8610E17E;
	Fri,  6 Mar 2026 13:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GiXZSSU3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C467710E17E
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 13:47:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1C7E060018;
 Fri,  6 Mar 2026 13:47:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE43C4CEF7;
 Fri,  6 Mar 2026 13:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772804832;
 bh=14L9YD01FHv0WUOOW7RIytyRqpEHvac672Sa8/TsMzs=;
 h=Date:From:To:Cc:Subject:From;
 b=GiXZSSU326fS0jnP6HMOX/TQEetyyi6EzyN6kv0l9eW+6IZ4OQ/5+FiLKRxMcPyXk
 l7Ll8xmVbSmzhMKTqAN/ivuePSAnnbEhWmMP0t1ugOP56w7V22GnaCpYs6y6SEY4ZA
 JTMURBTNN/IvsPd7Gem55M9lRiFcqQOldemguONYUk7peMsTiNM+B/9ZOcE4QeLbPs
 pWL362WLfKhP93RtR90y6Use26mVEBW4CtCjGu/z+Vl1Xg61kC6NfP5rYu4/Qcgxft
 ffA+T42oq7twaKjxtGKk9af5B9FRnudPLYxiEQPq/JTLfvUlv+bn/uPpARA9Nfb06p
 R43QuexpADK7A==
Date: Fri, 6 Mar 2026 13:47:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <aara3Be4tsc1OMZl@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OH/UXzDbech4EnvK"
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
X-Rspamd-Queue-Id: B76822220A5
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
	FORGED_RECIPIENTS(0.00)[m:airlied@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,m:michal.wajdeczko@intel.com,m:rodrigo.vivi@intel.com,m:tomasz.lis@intel.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


--OH/UXzDbech4EnvK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_exec_queue.c

between commit:

  99f9b5343cae8 ("drm/xe/queue: Call fini on exec queue creation fail")

=66rom the drm-fixes tree and commits:

  393e5fea6f7d7 ("drm/xe/queue: Call fini on exec queue creation fail")
  ec172c7befc4a ("drm/xe: Wrappers for setting and getting LRC references")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_exec_queue.c
index 8ecdf949f9e4c,2d0e73a6a6eee..0000000000000
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c

--OH/UXzDbech4EnvK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmq2twACgkQJNaLcl1U
h9BrTQf9GOQd2IaBknY1FBRa8zC5lXb9JHQg8ejT4wdCOW28hZyyUhFCxVyTtgfl
lqfq+NcOgCc/9i/hgN2sZ/LtpPiYEosojV2WzjU1jx6uulI88ka+nTn/MWCLd+zz
Ph9UeWkW09w2oz1vLrlM9TylBULhBs4QE9i7PKNGXnKMnv6S7eYff/eCDUpZuPee
GO/jFO3PPMk63vQacNiM4nl1DQkZzErW7y4ffil8bwuAuIJCUOxF102eVmSW+Zfy
ljjXNmzwqGO29fkwkvWntj5nweAEDnOexdvQXAyKZSNzF0UhysK1jGuxRaCdH+BY
TjWCzAZenewuqlkwqethX+5bLb+y8A==
=vYUp
-----END PGP SIGNATURE-----

--OH/UXzDbech4EnvK--
