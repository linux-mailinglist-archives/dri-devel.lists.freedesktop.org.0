Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B712814336D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 22:34:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774006FAB3;
	Mon, 20 Jan 2020 21:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DF46EB3E;
 Mon, 20 Jan 2020 21:34:35 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 481lLG6Vcgz9sPK;
 Tue, 21 Jan 2020 08:34:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1579556073;
 bh=B/uaXNOzGmgYx5o+zZDaRq+uyNaotC/PaEI4OhmL6/U=;
 h=Date:From:To:Cc:Subject:From;
 b=JBcc76639Ocp2dtjOb89h6KEIrZHrNc76gi8rxRpVYHULgmOvMOm+/4DYaicgmAu3
 pn9dM+seyoL9/Xhygb0wuiC1eJEpKlIKL8Q/WoDUUKCoA6uJ+o3vvrmuAOykE8QUcH
 TtQ/Xn8qQe5gxVogUjoiK4Iu79289rmju09O7k70S1PwX4L0Qh9b7pprkSAwUjYit0
 Os8ZceP+1jmsEXuph1TfaGwU9FdeMZr5a6gK104S4ryRmuhKHggfLEOINlrW1u7Qx1
 20JvLonvHgPhWpqNcGi8bkSCZp+gHhKjqBR+zQzMSMVm/RyZmYRBsJcyDJeSr2GJ0d
 RaY3CsRLFPZ0A==
Date: Tue, 21 Jan 2020 08:34:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-intel-fixes tree
Message-ID: <20200121083424.66d98dc5@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: multipart/mixed; boundary="===============1557630631=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1557630631==
Content-Type: multipart/signed; boundary="Sig_/XwC9.aYjJCeolnFRpcIZ6sg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XwC9.aYjJCeolnFRpcIZ6sg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:


Caused by commit

  d8fcca47e195 ("drm/i915/userptr: fix size calculation")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/XwC9.aYjJCeolnFRpcIZ6sg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4mHOAACgkQAVBC80lX
0GyiIggAh+uEumRRLd/uzS0G2uWsepBy1Yq2Du+SZOvq5q6eXzxPFi3v4yq5G/Z3
91kKDbUbXIq0bt+4ZeBWCVa9JHfac7zaD6v96oj0/WAGptURVMWs8IQzSeCE5ly8
OaRbBIw0l/7R6oDXh0+UmePioF1mh1PiZ2uHQNmVgGS9ECzzGsHYst0WlWKbfrcW
tF/i5GkROKKAy92QKh+SHQKa+QMi9qYOzffYXqyVbTmUD4BUit9Es86qFcYnMebu
60CJT2QjE1vOcPeThd8mRGmHy9qrMlLypvMnEV4KmI4hDq3X9LR4GnDsms5Ej+nI
AhoRQjAGR3OGYJqZGubAw/fwzQw1Zg==
=0wfI
-----END PGP SIGNATURE-----

--Sig_/XwC9.aYjJCeolnFRpcIZ6sg--

--===============1557630631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1557630631==--
