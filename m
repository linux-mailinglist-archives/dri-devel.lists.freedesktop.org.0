Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICevGCadeGm/rQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:10:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C64593691
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 12:10:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0DE10E0C5;
	Tue, 27 Jan 2026 11:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IvFxtKx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE01E10E53C;
 Tue, 27 Jan 2026 11:10:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 19FA76014F;
 Tue, 27 Jan 2026 11:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB17C116C6;
 Tue, 27 Jan 2026 11:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769512224;
 bh=ghE0PV6MgbDOIunX4C/dCjhWcjwFHGSYSnXY9jCVIxs=;
 h=Date:From:To:Cc:Subject:From;
 b=IvFxtKx4VCQ9+taAJzXnxvFpREBvVfvq9lmsSfEjV9Qf1hWM8vHfdU5hs1bdHvUMH
 OVxZ+YCrfoYlajmSckilv6ldTopjyg5ymuWcL4rWW/xeZAs0zIu4sniAXcQ3RjttqD
 N7O2Lql6lxl5l47UqgsKPTmAhKyX8zRuV4PXzuhjrpKko+oq7nCwMLUdz3oxEzQJI9
 5ov6T6Vlkav/JXYKXcriClkv6sTZiK0eq3gTsGb7A6dgmYY3VmUMvipsjuA/eYS+Fk
 kUsVlJwTJX3fjXrBmsDdktJi5e+4vEz8O9qQV6WH321If2TfYsV1FFod/2wO4eRpS3
 kqy0pQjZffvNA==
Date: Tue, 27 Jan 2026 11:10:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Fixes tags could use some work in the drm-misc tree
Message-ID: <2951a9c1-3a6a-4f96-96b6-8cd49b5c0eb9@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="noIxOaML5XedF8uY"
Content-Disposition: inline
X-Cookie: I brake for chezlogs!
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
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 3C64593691
X-Rspamd-Action: no action


--noIxOaML5XedF8uY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  6ef93f62533e4 ("drm/amd/ras: Reduce stack usage in amdgpu_virt_ras_get_cper_records()")

Fixes tag

  Fixes:

has these problem(s):

  - No SHA1 recognised

--noIxOaML5XedF8uY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml4nRsACgkQJNaLcl1U
h9CXLwf9G0dTFjqQFNplLJkaEoyt/k67OYGOYLOCGjOBNcgxNVSU4bc/j0+QKTrS
zoWh8WGAwDFv4b09PfnXfzVZ2t0gK7Ls/0Fg9/ZdBRFWKUI2wzOluIp6m46cSBzs
3tIx1Uqra8uFqKARThB13s6/as8+UtMt/Jhp5rN+p5/9PWO6aWZ/5MlfA5JM8C8N
iCBkObJIv3y3DM7BnRYRDC9vIm91QQgJaUNGVj+OI7aLW5qqn7l3Wv2dOUS2TiwN
cCydaksJy08Ia5eJUhC9dkZfqB/4UeUTUOJurknr5xzXfd2DymkM7jab6qU1tncS
eRywKtKosxvdFKJMe/iP3mFlIc2kCg==
=pmUD
-----END PGP SIGNATURE-----

--noIxOaML5XedF8uY--
