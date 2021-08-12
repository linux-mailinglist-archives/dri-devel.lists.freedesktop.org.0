Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460B23E9BE5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 03:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E196E21C;
	Thu, 12 Aug 2021 01:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187896E21C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 01:21:04 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GlTQy70Gbz9t2b;
 Thu, 12 Aug 2021 11:20:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1628731262;
 bh=NyX7NxhdTqFuLiEuNiYUkkM6Iaiv9G/1RgaK5DhFUTs=;
 h=Date:From:To:Cc:Subject:From;
 b=SPIB2sKXPA7HuocgGyGwSxssuZlScSVSuhhalfnrlcWWBFyJY9ZeHIs/nCLoGk9S4
 nQBoi69hpR4AUuCThV6wAyGvxtsT85DMIZAgEF1N8VlnWqozpca21s3ajcVNXB7yeF
 vXo/ffgBb8MFdKFhyHwL5RRH83eaNNy/dAvPJ/jk/eSC+/vx3TpfmyceQ0DC9mnoKj
 ZjAwInnqe1nPZce018v3YC9vBRsonFm5EfLERhTs0XwJsNapMvj1pmwyNPNCp6ML5w
 pHp5rU5yKPWcRQL30qoi8PxqDJPF/oKM1qWUfgR+Heuou4xju74U7wmIvCtKsB3Jw2
 K5sqHRPu2jZig==
Date: Thu, 12 Aug 2021 11:20:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel Vetter
 <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>, Jason Ekstrand
 <jason@jlekstrand.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20210812112056.0e6fa4fd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UZR4JNYLxTvVTQMXYhxdip9";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/UZR4JNYLxTvVTQMXYhxdip9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/i915_globals.c

between commits:

  1354d830cb8f ("drm/i915: Call i915_globals_exit() if pci_register_device(=
) fails")
  a07296453bf2 ("drm/i915: fix i915_globals_exit() section mismatch error")

from Linus' tree and commit:

  bb13ea282535 ("drm/i915: Remove i915_globals")

from the drm tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/UZR4JNYLxTvVTQMXYhxdip9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEUd3gACgkQAVBC80lX
0Gw9LQgAgv3cYm5Xrt0JvYyyYrFIY9pP5sG6Ifrf32s9YwWcRYyiBcy3tDP/LSTB
C7S9v31itFXiBwdpP6JCGLMJWD89Nj97cQ9W5QFv3ynnumB11zzAvM2SJpRIR0PK
YtYL83wmkJzQZ8kWMP1oWfpKTjev3UxlYSjGtDcmncymXcEJD5sizaGqlr08LuO4
GacWdeBmzzaPtADs7KjVOj1Am5l4HKwg6MDqcTcB0Tm7FLC9+DJdDL8DFCmvMRWM
lhjOV3godDhtYFGkiFS7xxrsmdl1OcBCdqLm3a/63P9Tm6nbUJ3DcWxEFYFGTKi/
XQb3jrFQ44B9NDIcg5uFJBmsMzp4KQ==
=ez8E
-----END PGP SIGNATURE-----

--Sig_/UZR4JNYLxTvVTQMXYhxdip9--
