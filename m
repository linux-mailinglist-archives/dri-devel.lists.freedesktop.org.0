Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC16688D35
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 03:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA86D10E708;
	Fri,  3 Feb 2023 02:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F87B10E708
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 02:46:31 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P7KmH0ZDbz4xyt;
 Fri,  3 Feb 2023 13:46:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1675392386;
 bh=bBK0QFBmWeYW1Huy0osXV6kbNDYFnO/rdS/pjZdNbHI=;
 h=Date:From:To:Cc:Subject:From;
 b=LH+f9dC0X9TGF+6Abse+U+LMubUu2Nlq6Gq/2W0iVSIQZ/bYfKa11KOgNDDjydb6b
 AE+BMYXywByrQCvVhqkr2otI5aO1EvScmkajI7e42/k4a04h1ggkUf/fxD9/arKkYQ
 cv0UjJxzfErtKxq1wBE1kMGZLt/QZfCUbomU7biMsuU7T4Iqe1mZQ2S5uTVVeSkitA
 J9NvShmLZp0t7jd+iaaad1LRI2XDMWUZOhOWgiJYro7IWLviB69hxR9hjtnDM4lBih
 9Ejh7OQ7EGBqAl6+Qk+LPqiGGsRBcBGURa/BQlLrPOWOScHzM/F85T89jFFj8lRf0A
 Fcmq4zXgJiJXQ==
Date: Fri, 3 Feb 2023 13:46:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20230203134622.0b6315b9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cFdrXd9x+MiyerVxBWD2kYI";
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
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/cFdrXd9x+MiyerVxBWD2kYI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/gpu/i915:64: drivers/gpu/drm/i915/gt/intel_workarounds.c:32: =
WARNING: Inline emphasis start-string without end-string.
Documentation/gpu/i915:64: drivers/gpu/drm/i915/gt/intel_workarounds.c:57: =
WARNING: Inline emphasis start-string without end-string.
Documentation/gpu/i915:64: drivers/gpu/drm/i915/gt/intel_workarounds.c:66: =
WARNING: Inline emphasis start-string without end-string.

Introduced by commit

  0c3064cf33fb ("drm/i915/doc: Document where to implement register workaro=
unds")

--=20
Cheers,
Stephen Rothwell

--Sig_/cFdrXd9x+MiyerVxBWD2kYI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPcdX4ACgkQAVBC80lX
0GxXPAf9Hl0I07tpP50WPBpc1FiWVPa1QWlZ5mMTYBwNohmK88hsh6w1Rsgcdbvo
rAdghaNj+TPJeCuSSIXFawPnpDMnfr039ZHMm8DDv3TI3/q9EOMGwC2YfEaO4lOT
06JK+HdZxqAGfeAKf9YJpWClGP0BtDNI2vz56S2m9YWsHIk9zpAxNV6XFno2cDkf
1DvuAvM+WfYEvb+qMHVxeeitbO/84lUgtRxUvmkT9NUlxkpfreTXHs2lk8wGoKGz
td8rcqVkCch5hKQsyIngGan66/y0OoTXF91/OAGipDbb8Rh1fzJncXPSCLSeTESp
aGiR3RHIzuY0+lowEqACdbq+GEw13w==
=KWT8
-----END PGP SIGNATURE-----

--Sig_/cFdrXd9x+MiyerVxBWD2kYI--
