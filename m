Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C444F552C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 07:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466E610EC3E;
	Wed,  6 Apr 2022 05:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7354F10EC3E;
 Wed,  6 Apr 2022 05:44:35 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KYD3h2RjGz4xXv;
 Wed,  6 Apr 2022 15:44:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1649223873;
 bh=XaEydd0v9rzsjJ13ImPTLIrQlLhXxeytXQhVXvFUX7o=;
 h=Date:From:To:Cc:Subject:From;
 b=avGYXP2CPTvwcCNmlWuD4lLUQkgt7Lg78rxV6FIqIuSLvfNYYnCWP9JREZV++p7zZ
 hqVkzof54G7BdHanWlkP/e3VflnYsjlBI9NzuvSj2WoNE9TVAhTzWO5W4VPmTdL20g
 RAJ7Kt0i8RBrRS+MDWs6BkdLnK9HHKuoDm1xHC9r2z8posznVWEMbye5mPSwAbajN1
 o46vazQKvaGn9X4QtKi65jJZWn7WgM2p0jp0IspOE5u153gr9inFKFyWyOAo44EUdl
 1rV4j1VDgR1glZ/AVXwmJl4eKnNFQvi/0jl5IITVyrOjMFfyEWkSAHY0dWvD6Xv4Ck
 CyHOhn+UxD0/Q==
Date: Wed, 6 Apr 2022 15:44:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20220406154431.567414c3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WJiKREXF3Ec+2vEZl7GyBMA";
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/WJiKREXF3Ec+2vEZl7GyBMA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (KCONFIG_NAME)
produced these warnings:

drivers/gpu/drm/drm_edid.c:1589: warning: Function parameter or member '_ed=
id' not described in 'drm_edid_header_is_valid'
drivers/gpu/drm/drm_edid.c:1589: warning: Excess function parameter 'raw_ed=
id' description in 'drm_edid_header_is_valid'
drivers/gpu/drm/drm_edid.c:1737: warning: Function parameter or member '_bl=
ock' not described in 'drm_edid_block_valid'
drivers/gpu/drm/drm_edid.c:1737: warning: Excess function parameter 'raw_ed=
id' description in 'drm_edid_block_valid'

Introduced by commits

  6d987ddd6843 ("drm/edid: make drm_edid_header_is_valid() accept void poin=
ter")
  1f221284ab63 ("drm/edid: split drm_edid_block_valid() to check and act pa=
rts")

--=20
Cheers,
Stephen Rothwell

--Sig_/WJiKREXF3Ec+2vEZl7GyBMA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmJNKL8ACgkQAVBC80lX
0Gzakwf/SzB8dszFDecGzZx/RB+HDNQ/knJlKX/GG/8apJdnYOwkU+45eA+15CJn
yuNnfUipmpuzawrtEmcZtbChiUGux2dSz5tTHeqDtJFEVW57BjZIG9+HskxdsH9x
H7ztoESQiFtU5xh2+CQ3RpDGhadTLB22fQrHdSYH+GItBSFI8OlFuOfKqWS7a5sU
7YmiiOdlXxJ7clC6NacS+xYsg0KWHuCbZtNXNg/qI/L8to3lyWZryWUuvpspG7fK
+bom6Bsf3sEyPYo6n4cf7UShEt/FnlB7OKIpw84lJgO/cWD6qOhMDAUUq/m38mp8
INlfF6/c76XQpp/vT1IGb5idycWzYA==
=eirQ
-----END PGP SIGNATURE-----

--Sig_/WJiKREXF3Ec+2vEZl7GyBMA--
