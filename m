Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1736612F3
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 02:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BC910E1A5;
	Sun,  8 Jan 2023 01:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FA810E1A5
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 01:58:57 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NqKxS5Xzhz4xZj;
 Sun,  8 Jan 2023 12:58:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1673143133;
 bh=+xs4IsnJmGwDDAxs/tkK8SjyFH4qf8Q5NAmetU2Cthc=;
 h=Date:From:To:Cc:Subject:From;
 b=NwY3ehlt3rZjdtIrTv8IOz3ZphUd9t0nmFMtT2XfTESiInuIFgK6ooQ6cwN98QxWL
 hzv2afqc00NJJkB/s8FC0Y/+Atdh/MUgFn3kajlfRStCrxlkl6qoWG/K4Z8IySVYa8
 bVBfrPwFlLMHAfDGLn2xYJuN/PkCOCPR9wlnODrT6MBy2m4cXO7sPuv/ZSYpl/rutr
 4ir/OqDNIoBz+pRlb98mtW6cbT4fgEpDXx0Db9uv46LWGIGumPCyV/f3HL0kIvHmgf
 AYuK9r3QjxGGP1CpSSX7OhOgkaYrEl1+u1JEqXQlMoiLNGy5W9xErQs37PdR54I/PG
 X/z8DGLKekDow==
Date: Sun, 8 Jan 2023 12:58:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: linux-next: duplicate patches in the drm tree
Message-ID: <20230108125851.26687a6f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/myB1/v_beOwHkAy8F8hLWDW";
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/myB1/v_beOwHkAy8F8hLWDW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  9f1ecfc5dcb4 ("drm/scheduler: Fix lockup in drm_sched_entity_kill()")
  4333472f8d7b ("drm/imx: ipuv3-plane: Fix overlay plane width")

(in fact the first of these is in Linus' tree twice)

--=20
Cheers,
Stephen Rothwell

--Sig_/myB1/v_beOwHkAy8F8hLWDW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmO6I1sACgkQAVBC80lX
0GwhvQf/U5OqbPBGPRftiLF9g0PXHBMBTTi/3osLJP1M2y2+SxyDAuiG+3qZbOqX
/LECDhpy73PBXUVQQIh966AZHjWhX7CJEThCn01dOVp6JdulHVtEXxKsGjLPDyPt
Ay+Te9aw1dOjJRVKvT6PpCo9f9sfhS+csWmpFrjFdMM2nHaJWzJOdScSEkMtf2pS
uZplrX841dXp+3O9T+dpNjijqRXE90tkZgC9zXwRls+csXWPGYsQPzJnNW80TsRU
8GNI14inrVwkSzaA5z0GGW4e+lv93F0c1NliEkHFNADMEnRniJQbx8N0aON62pdI
WYIX98cRd9k6YDusO/O6THUU3WyFAw==
=hR3b
-----END PGP SIGNATURE-----

--Sig_/myB1/v_beOwHkAy8F8hLWDW--
