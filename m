Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F047BB026
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 03:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B409B10E18B;
	Fri,  6 Oct 2023 01:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C6710E085;
 Fri,  6 Oct 2023 01:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1696556690;
 bh=FEZ5Zt1GmousPutMjHkXHKTXZftkzEH+5BRetQ9SLH8=;
 h=Date:From:To:Cc:Subject:From;
 b=QPsAkMu3ouwOCN8SrhzPXaAqTmCtz+DPaSeZTeqeRbim3p4EL/Vlcb7Wkz/onPK4o
 T1E+FTSDxp8+LLlWXhFpOAZ8II+WFxUh/Xn7KHhCL3cUyJoO4riWlwVwTBi5+32CHz
 afj8enCEZX0e6VY5M1szvDeLMGHCMXPXxjTDJdOJppSflqRAdoZRX7/DO89tcwuRDe
 isQ2AZNzN8vN4pZPaYIXdlgTcW0cvYq8+fEIdx6QRsnpDNp8GLJ8daYEKki2XwK1LU
 FymHFqlrMdektyMorj/NzUaH9sHM6QEo0HtDDsgK4wFAv8iCiVKGbYANgcIjb/tjXw
 JsB41dGJP8kpg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4S1rp93DYFz4x5k;
 Fri,  6 Oct 2023 12:44:49 +1100 (AEDT)
Date: Fri, 6 Oct 2023 12:44:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Subject: linux-next: manual merge of the drm-msm-lumag tree with the
 drm-misc tree
Message-ID: <20231006124447.10031f6e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eXIVIosoXmtrWkP4jtgIGQQ";
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
Cc: Kees Cook <keescook@chromium.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/eXIVIosoXmtrWkP4jtgIGQQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-msm-lumag tree got a conflict in:

  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h

between commit:

  8f5d3daad715 ("drm/msm/dpu: Annotate struct dpu_hw_intr with __counted_by=
")

from the drm-misc tree and commits:

  eb7af0e86349 ("drm/msm/dpu: add helper to get IRQ-related data")
  07e7d96dcb08 ("drm/msm/dpu: make the irq table size static")

from the drm-msm-lumag tree.

I fixed it up (the latter 2 replaced what was updated by the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/eXIVIosoXmtrWkP4jtgIGQQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmUfZo8ACgkQAVBC80lX
0GzxjAgAoMVn3jWTorqxP+K3iyB+pqlcIgz90HiPbveLth6LEasVkPQQJsRKMUlt
MgH791r86UQGTWQi1YTAfhGxj+wBrXUFYXzAUjlYsGLyBY8+q/reb3Tt+IydPBTB
ZVWA50yhpS4c4jTkOKob8Y06hegR7anpPlypRxeSEU9beG8ZogLXN51FSGjiJBYX
HquwMYxEWAqHBTk10vzSEEDEg8wVdmr6rdv7Gz4MbBdaJhqKEZaxNTkVGXXuy+kn
jePWgxTaCPXNPzBW4+yJNVrkTdF4RklSCUoNuRKgFesWRLBnCabFVgwv7WVY4Ig1
2p5BV5lb3L4x5JS07YcBEx69kL29VA==
=D7A5
-----END PGP SIGNATURE-----

--Sig_/eXIVIosoXmtrWkP4jtgIGQQ--
