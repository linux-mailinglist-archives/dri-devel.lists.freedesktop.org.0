Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B17E6DD254
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 08:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EDB10E4B0;
	Tue, 11 Apr 2023 06:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68C810E4B0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 06:01:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PwZwZ0NN0z4x91;
 Tue, 11 Apr 2023 16:01:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1681192894;
 bh=fDaRNAXX3MceCbtR8+zQSYBG3ckpk+sV0RZO2DLtF9U=;
 h=Date:From:To:Cc:Subject:From;
 b=m0LU6aN//0lWVh+QtqhonJVZiqmoAu9in9B6NOtoY1luetF8GXvGo+2ThI0uAYrDA
 hh8rL5j93VAS8Ks96mzDHEMFgR7B4hZhzk4sG0mhJLPrV5n0GUUuXNDtqZ20psNfjd
 YBNevWTzok66MyY08oBUnN8rEAeVMDPKWPcXAShWDHT+oH5xj8P5PctRmPkZyPdHTC
 Op8jddV/NPyTfiJ2mihqjGa9+Fc7K7Qoi30r89ikDTf+AunFvlAQfGicpOcIBylkzP
 ye7QTBnc69DwKhdqUJvN+GhP8bpUm/qyI+YwJ1w8MlyWT5XWT+TKBsmBvoB/lmDgc/
 Vpe2vQJllRr5g==
Date: Tue, 11 Apr 2023 16:01:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20230411160132.07ff8eaf@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e_Sj8bDijfZn0ZQeY=GNlR.";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/e_Sj8bDijfZn0ZQeY=GNlR.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

drivers/gpu/drm/i915/i915_perf.c:5307: warning: Function parameter or membe=
r 'i915' not described in 'i915_perf_ioctl_version'

Introduced by commit

  94d82e95219a ("drm/i915/perf: Pass i915 object to perf revision helper")

--=20
Cheers,
Stephen Rothwell

--Sig_/e_Sj8bDijfZn0ZQeY=GNlR.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQ097wACgkQAVBC80lX
0GzlxAf9GPN3/Na9xZT596Kvql08eS7J+K9BJ2pHJlCFg+Cm+2VhZOVjbfHxfsjI
aazCfnV7q/ngOpDahWXoXbX7pzEtMxenfjyKEex1HTuCZkrO8S0Ig+wCVvPpYe5L
BBNicptz0yZiM2Jm5iIuQ9JFFLIR0SNC3taj0oXFAskaVjaHUe3j1dn3+ThfpQDG
lrbtxFTqzHpBgAdjBPbhBRyRdvc4hRbXbSGnHDSYdPe8F6D3zaQCGWvOE7I3T3Jy
DBaDDweb0t9/3G6CeybOjKxuyuXR4H6orGuk+lISvBfnCGIrvhpmGrBfZMilpB9Z
OzwHgGj6xT/WVgeDmlsVp7cmxbc9vg==
=44wx
-----END PGP SIGNATURE-----

--Sig_/e_Sj8bDijfZn0ZQeY=GNlR.--
