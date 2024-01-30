Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961EB8419AD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 03:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA738112C87;
	Tue, 30 Jan 2024 02:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2418112C87
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 02:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1706583263;
 bh=EdAkFP733cEuXQh07GTpPK4SF6dq0gAnpERjGKXV280=;
 h=Date:From:To:Cc:Subject:From;
 b=DlGg72taDiLeh1r9jSxB0mO0yUeB/mDCafrC0kg1EVOixpBoB0zgzJkpql03hZ8GH
 heTEiP1rGqHDxUHmYBFopKtWGIYFxj4t7O0FiApXk+BDE33veJAbJHDJIqFbfYQqIT
 6vBJRlAJZlxLLlCp7NiagUp9Yu8OBPhHUbwCjn9O0GCdjKUaCUWkRve7aja/YpYmwH
 Kf4f9GPIIgSbiV+m7hjk2JKteY1laZcdZtor9uC17YegqUEpLTy8LswyhIVuICxGfg
 2I0AnB4mezT0z4vO0z6RmyhmUIK7eaV77eX6BlT0rlZtkUzc945Tjhl9ODxDYPXDFI
 RmFmSLBvaESwg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TP8rv2TdBz4wc3;
 Tue, 30 Jan 2024 13:54:23 +1100 (AEDT)
Date: Tue, 30 Jan 2024 13:54:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240130135421.19907631@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lcOaDuwG8rKF.1zDt96NBeM";
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/lcOaDuwG8rKF.1zDt96NBeM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced this warning:

drivers/gpu/drm/amd/display/dc/inc/hw/opp.h:1: warning: no structured comme=
nts found
drivers/gpu/drm/amd/display/dc/inc/hw/opp.h:1: warning: no structured comme=
nts found

Introduced by commit

  0fba33311e63 ("Documentation/gpu: Add entry for OPP in the kernel doc")

--=20
Cheers,
Stephen Rothwell

--Sig_/lcOaDuwG8rKF.1zDt96NBeM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmW4ZN0ACgkQAVBC80lX
0GwSpwgAh79BjBH9g/ynPZZz7rkRnVZ6rrKNoABbWxrbQ972ZvtpmH/2bKkEoJNJ
RJO729SVqwJEJW2IW5KO0ZhrnQYQfMiwJPJ5XaftUgEomRJz6YcuAIVeZdxjKf9P
Y+1BV37+GVES/ZEX00fVME+Hr8F1P4omWNJH/lq6pYHtECO2XfBLKgCemFZgUQXF
BRKVlv7EdHhYtp9zbgrKjj+QfOEI5BIvxbf+vr8ckFwzAKHXqgoKn1K6HFj6EJ2n
pugUVFp1XcSbvwQDRs55r6UxBTnldUczp3Gcetw27z7QFE8TuE0+hPG45nmkjIJ9
ZjjqvGCSVgc4iDdPjknl33fhcmg5Sg==
=BD5s
-----END PGP SIGNATURE-----

--Sig_/lcOaDuwG8rKF.1zDt96NBeM--
