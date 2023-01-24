Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ED367A429
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 21:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED93710E1D4;
	Tue, 24 Jan 2023 20:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6781910E063
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 20:45:11 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P1f9Y53yMz4xN4;
 Wed, 25 Jan 2023 07:45:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1674593106;
 bh=kQfNoknmbtg5TQDqgUCCia6KVTQBV3rP34byr167yqw=;
 h=Date:From:To:Cc:Subject:From;
 b=E498AHzI2LQj88dgUcCnv7ytpyMpZ4WJ5I5GNHhe1b/mdt27tM4RDWCJdNk1DENqx
 rrl9zI3WdqVFMBlpjeQWC7H6ORNDNwg8AUSVBB5Xe136EsydmmIOEuIV/1Z7dYsvZs
 Nnfzi6YMJFZxiw6Hb5ISU7Gc4sbke5Oe9EcZqbkZElpUYLxRWvItPjFoUYabudncXZ
 QFsC/NrDEI/8qHTawI+lEboYaByNDOXYuHfhx0B+OS5A+zcAzuaL130vETYGOuxLEC
 FCIWSeSj0TdLhueGaliy8exfV877Aqhvo/UY4D5vQpQTZIwBbdGUpRaENkdS75+pzp
 Vbtf6Sf1YsgyQ==
Date: Wed, 25 Jan 2023 07:45:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: duplicate patches in the drm tree
Message-ID: <20230125074504.22f45b57@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pq.dz/mAFTzMhZ1nvmsAoeV";
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Pq.dz/mAFTzMhZ1nvmsAoeV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  0c8a6e9ea232 ("drm/i915: re-disable RC6p on Sandy Bridge")
  14ec40a88210 ("drm/i915/selftests: Unwind hugepages to drop wakeref on er=
ror")
  3db9d590557d ("drm/i915/gt: Reset twice")
  4f0755c2faf7 ("drm/i915: Reserve enough fence slot for i915_vma_unbind_as=
ync")
  bed4b455cf53 ("drm/i915: Fix potential context UAFs")

--=20
Cheers,
Stephen Rothwell

--Sig_/Pq.dz/mAFTzMhZ1nvmsAoeV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmPQQ1AACgkQAVBC80lX
0Gy9lgf/XWEZEboTgdxPtWWEBxOLOvFk04gz8xU7M8lACJ0eNAO4MEp2632pPe9/
Jdyet1G90ajflCVlHPfcqagrCSWjm6xK+UesRp6CIbbOdVpAZ/recP29WL9PIL6A
YaOR6ckQYnmDtXo7eNMUXUO0MaFcRe8oLBa7fb+rKlLMk4fnBV7c3z1ZwGvJsyBK
eJBd5nr94HZNQi3CcD1+w2ohy/1V+W6f3IS1uH9MwSnOOPBad00YThNLcxAXqyk4
dkFvWb/jJpBMCKHhbaHjCMrja5xMw1gkMEtIZiUwKHEkjhTf3VaSI/yii9DxxjdI
0LrUwqIWLhpjJZ2sJ5YQYmLEPx40iw==
=tq1E
-----END PGP SIGNATURE-----

--Sig_/Pq.dz/mAFTzMhZ1nvmsAoeV--
