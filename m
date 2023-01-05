Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7DD65E438
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:47:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBC110E699;
	Thu,  5 Jan 2023 03:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE1910E699
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 03:47:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NnXVH05Rtz4y0k;
 Thu,  5 Jan 2023 14:47:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1672890456;
 bh=LxcYn7CdaUXveHJS3sIgtUUoBgSnw9O1NYqQgya82ag=;
 h=Date:From:To:Cc:Subject:From;
 b=BhuhNjQsLju6islS9dynrD1V3D6rpfmNkeEWQ+bRsQI7nDlwBAmlYB3hG+Ov6yyz5
 O7WfF8x/sYVz0FJXU0YU9s4Dgdd458fvKXXbcag/NnohNSPvUKw9VzeDzvgLL7XM9P
 +CpLIf8aaO8MtpdKmMPKGtRtJ5xhFnNUh7f9JhDZ44KmnlP5Kxgd/77f0aBl5Dxfjg
 yGaUXfX22+vSLnb26SXUeju9ah/kspU7eWLy+we+JJ/ZPNvL1E+w5b97lfmPZ9rlsH
 Y1F8SrsAQnajy0QUZpVpC0sGDGsh5o2bxc1gcmIKB8gFZ5U5qo+p/ICaHPrUAHKsre
 DZTCVSZ31ttNg==
Date: Thu, 5 Jan 2023 14:47:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: linux-next: build warnings after merge of the drm tree
Message-ID: <20230105144734.06278c8b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vcDC4foG=4ee6x3QtYzXh5x";
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
Cc: =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/vcDC4foG=4ee6x3QtYzXh5x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
these warnings:

include/drm/drm_debugfs.h:93: warning: Function parameter or member 'name' =
not described in 'drm_debugfs_info'
include/drm/drm_debugfs.h:93: warning: Function parameter or member 'show' =
not described in 'drm_debugfs_info'
include/drm/drm_debugfs.h:93: warning: Function parameter or member 'driver=
_features' not described in 'drm_debugfs_info'
include/drm/drm_debugfs.h:93: warning: Function parameter or member 'data' =
not described in 'drm_debugfs_info'
include/drm/drm_debugfs.h:105: warning: Function parameter or member 'dev' =
not described in 'drm_debugfs_entry'
include/drm/drm_debugfs.h:105: warning: Function parameter or member 'file'=
 not described in 'drm_debugfs_entry'
include/drm/drm_debugfs.h:105: warning: Function parameter or member 'list'=
 not described in 'drm_debugfs_entry'

Introduced by commit

  1c9cacbea880 ("drm/debugfs: create device-centered debugfs functions")

--=20
Cheers,
Stephen Rothwell

--Sig_/vcDC4foG=4ee6x3QtYzXh5x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmO2SFYACgkQAVBC80lX
0Gw98QgAnADV1+PXGit7rad2UW8QIsn+mrvrKuOz6t/POkG+5y+OCHmbwDbap5hY
7E/m/EznDV+SgQBD3JiRzjX8rW/asN78iuCe3PXX5aRPHleXgSFXZsucvG7TBdwX
aX/ZaBCqASs9Q/Wk0l+mercb+NIVTNVPjURRbxa4BkimsPl9A2wkvz+ihhtCRXbd
7KKQCtw3akh8yp5xWaEys4zN/EnvFQYxbyUcJVwgFQ+qdSJVCvLLjglZNzWrUb0E
fPyRd/lzlAf0WvOXHvjrU1AcdFL7Kxc9/7NITvlzGCs5YljSAmnHb3M8D0/3eN5V
saxxCP8H+AyF+CmSHPnSVTizUx2C8w==
=30pc
-----END PGP SIGNATURE-----

--Sig_/vcDC4foG=4ee6x3QtYzXh5x--
