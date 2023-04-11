Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6522A6DD259
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 08:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509E910E4B1;
	Tue, 11 Apr 2023 06:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB3810E4B5
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 06:02:43 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PwZxn6Dnyz4x91;
 Tue, 11 Apr 2023 16:02:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1681192958;
 bh=qHTvp22dsZACvYo/CD+HHw0iRh9ENx0zdMyTPABzpMo=;
 h=Date:From:To:Cc:Subject:From;
 b=KHevkZ2J3QcaNH6kaSDxZ3d555vWbqoUOmzzwyPfIDNYbC3qzM762PH9QBT2t3Fyv
 SNxBsPKRT0heJEf4xHU8fZWYK6qiy3NcmWyTYB6xRp3O8JiHYbV+2w/QI2RP6b4XM5
 9fBCegXRr5ua7U0GbzpM/KbGHm6Y6zAQtXNdsnpxRh5vcB9lvIJj6UgE2swTnSRmCn
 82dLWjvPVjfjPFGHbQt13q8mS1L2pvXu9jmOVuoVSAtGG+2627FL9HznykKlR+g2Mm
 usTpMlot8z0fq+ygCjQn08GFmLRIYYr6HwCLLvArDkFxRcAJfw1UpxJ2H3SWl5soFh
 i7joQ/Kj3I/JA==
Date: Tue, 11 Apr 2023 16:02:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20230411160236.28845f80@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hnmEc=/ddEtBNSnjGm9IyHN";
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
 Andi Shyti <andi.shyti@linux.intel.com>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/hnmEc=/ddEtBNSnjGm9IyHN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/i915/gt/uc/intel_guc.h:274: warning: Function parameter or =
member 'dbgfs_node' not described in 'intel_guc'

Introduced by commit

  70b5ffb393f3 ("drm/i915/gt: Create per-gt debugfs files")

--=20
Cheers,
Stephen Rothwell

--Sig_/hnmEc=/ddEtBNSnjGm9IyHN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQ09/wACgkQAVBC80lX
0GxwHAf7BJ9yFOizwO9kgbhusUSzGC1NnaJdYnTgcvi985+FkQ1Eo04QrI8gqddz
/0vlNX00lvP4PkR+0S0qZfwzm5D5uY4RwmsSqkVv1IvJxFE9KsuBw7u7Dqi50Bg6
PQ56cVuZ3hviZoJUGyeuFA5ih3rCFARdYa9caP4jjMY4hasbK/GMe6JYh7aiA643
QzRkzWQzFwzKhgnui1YpS5GURxPDnXE9SiZXU4UFLuLEjMeBWd1NqSiTM89lKSSE
ZkDd5MHXQA/9dyF4xdIC/Ba3cK4EKnh2ZQA3CksOfoCNCbJE5+PcaOuPMP9cPNUX
Z+IJWLZIKjmhHFssnBUAZmsLw1AQsQ==
=Ae9Y
-----END PGP SIGNATURE-----

--Sig_/hnmEc=/ddEtBNSnjGm9IyHN--
