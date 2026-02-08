Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id frJgBmMSiWmT2AQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 23:46:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FB610A819
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 23:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC7310E05F;
	Sun,  8 Feb 2026 22:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mz+zDOcx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5161110E05F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 22:46:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D7B6F4386F;
 Sun,  8 Feb 2026 22:46:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987C4C4CEF7;
 Sun,  8 Feb 2026 22:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770590813;
 bh=hEzUixNjVVNaa3Bxv+XxJ+VxH06BOg0rYo4G6AVrlLA=;
 h=Date:From:To:Cc:Subject:From;
 b=mz+zDOcxqewnhtiTyX911RPqDHx555kfBqnju6WLfG64Hxge/kJq+aZwdvMiDzr1Q
 FslSqj4B80BLSqr41PgoxSvf9qgQuAK98roGE1VWOLiU1uvuxIB5ZrH3H+3p3e/k5n
 1K4kuR3SgnmDEMvpXTTjBjf6zSn33HWCtxgrIEKNaGbITHk01uG7AxNu3cYVeVsjUJ
 VesUndK6otkBjaQP60X4Oz6SQrkoNGXmdcUSP1pCyX0V4hdi0pTx1MUD5/XbnmqmkO
 eW8ejU1xGzK/j9zzQGVHr1u30Ds7z0M2tfZQyj6/niAbMVP2VBpXUuq1lZVI3kmhsO
 dmKArDU7ELYSw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 51EBF1AC57F1; Sun, 08 Feb 2026 22:46:50 +0000 (GMT)
Date: Sun, 8 Feb 2026 22:46:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <aYkSWobP3JUatoHn@sirena.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="B62MvGnV4Ep6+BKn"
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,m:matthew.brost@intel.com,m:michal.wajdeczko@intel.com,m:rodrigo.vivi@intel.com,m:satyanarayana.k.v.p@intel.com,m:shuicheng.lin@intel.com,m:thomas.hellstrom@linux.intel.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 82FB610A819
X-Rspamd-Action: no action


--B62MvGnV4Ep6+BKn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_migrate.c

between commit:

  e022c16965b834 ("drm/xe: Fix kerneldoc for xe_migrate_exec_queue")

=66rom the origin tree and commits:

  fa18290bf0723b ("drm/xe/vf: Shadow buffer management for CCS read/write o=
perations")
  5d5ef695497950 ("drm/xe: Fix kerneldoc for xe_migrate_exec_queue")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_migrate.c
index 9d7329cef910af,078a9bc2821dd6..00000000000000
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c

--B62MvGnV4Ep6+BKn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmJElkACgkQJNaLcl1U
h9C5MQf+IrUNqHN8u1iJNvgbL+Rmuk+uWKvtZkzWNqaBKGwomc9eAUJk7ocSV1cA
TuXps/mInmsctnzM89VN3+lLiwDiFg7Ps1TKF5bkcCvKn3WqrV8q0ZRWU9am4oGI
/fjLRIO163o/+BJDKXfYE+ifepdP10o9IGcOob4n0Hda2Im8+Y08xfXqVovPL99N
bngNPWxUc0nQzdgzgvYKAlZL21cQhSNrIePe95VMbpuqYbtjCL8EID5b6CyhiNIi
uB7Ghpz3US7BlCnjVZauHhSNM0uZk0kKQGvCVwaU3itrEfixHBxVH+lTsVVVU8rK
03tQXUgGJC6lHcVfD5CFv25m0U0bBQ==
=veOn
-----END PGP SIGNATURE-----

--B62MvGnV4Ep6+BKn--
