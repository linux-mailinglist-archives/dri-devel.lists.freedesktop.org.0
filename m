Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BCC7F9694
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 00:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487FE10E15E;
	Sun, 26 Nov 2023 23:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB8510E0EF;
 Sun, 26 Nov 2023 23:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1701041888;
 bh=qNS7kra+g/KlF5zsB7qa3okRtG8l8jcRBJUXQdN731g=;
 h=Date:From:To:Cc:Subject:From;
 b=GNOlESY+k39+jCTOvsNXgkXbkZhZoC4Fp/KXFgnZMSPDYMFgF6PG2gLkyZtdN/bsO
 9AMPSBPWSeZysDBAYS8yhs0w2bziRKO1gB/sZO3gzayWprVZ1urP9KhvNAp+xgGnc+
 UBvQou7Wl80T6ThsVcB3Sq4znLzxE5aTbU8agUBLv0UsaYmgUethcqhUQg3p+2RwpQ
 nB4goz0OwKWOStBKATqd05iIIwiYjwk2/TRIfMojGQAdFirCjygjRhND6MYOmmyz37
 fjDa0+nw0ZvOxwSfIOWfSaPlLpkAroP+gSxtAMhsBUxVprVYvwCljW2Zen6p4VfKTd
 n92ypQBNKmmCg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SdlX03mCbz4wdD;
 Mon, 27 Nov 2023 10:38:07 +1100 (AEDT)
Date: Mon, 27 Nov 2023 10:38:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20231127103806.35efa376@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/99K1/HMbAQVisk4a1dkfFH0";
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
 Luben Tuikov <ltuikov89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/99K1/HMbAQVisk4a1dkfFH0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/nouveau/nouveau_sched.c:21:41: error: 'DRM_SCHED_PRIORITY_M=
IN' undeclared here (not in a function); did you mean 'DRM_SCHED_PRIORITY_L=
OW'?
   21 |         NOUVEAU_SCHED_PRIORITY_SINGLE =3D DRM_SCHED_PRIORITY_MIN,
      |                                         ^~~~~~~~~~~~~~~~~~~~~~
      |                                         DRM_SCHED_PRIORITY_LOW

Caused by commit

  fe375c74806d ("drm/sched: Rename priority MIN to LOW")

I have used the drm-misc tree from next-20231124 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/99K1/HMbAQVisk4a1dkfFH0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVj1t4ACgkQAVBC80lX
0GxxZQf/eXWeRuPF3o5mP3DrWYuy8MYH45Aoep9ve0etwo/vMqanLL19E0tshiGM
3u2ib3lrqIpmGA8nnN4ohpzhd/GkHSGHkW8TVGPsbKB8EHvOFH8UrxDjUhYBDfm3
IFBg9bHYu59Ce5AcU4l5N1YLkrNiISlcfmQo99Gi72+9L8BZf8WEgKPiBhG00qJn
5vPUX+DF6if0HtapWOe2O6ahmvK8c7H8tvjxa0nIjWxcdysNqgo7zxE+acUS0nlR
akyUcbB4f1igLIjtP+/0qnj0wq/U6k86Qha5/TsCY9yPCba+qeHtRDmJF4WmkTBR
gJjRLNq6PMUOYQvOtNSvULgC+4RYIg==
=fcYr
-----END PGP SIGNATURE-----

--Sig_/99K1/HMbAQVisk4a1dkfFH0--
