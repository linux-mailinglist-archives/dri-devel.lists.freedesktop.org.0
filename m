Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E521E6F09
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 00:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BE76E7DD;
	Thu, 28 May 2020 22:30:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18916E22F;
 Thu, 28 May 2020 22:30:24 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Y2T61CKbz9sSm;
 Fri, 29 May 2020 08:30:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1590705022;
 bh=5hnKWl4+sVjUwhGg0kPkGh92h5HMCHnAJaXaCE2UxqI=;
 h=Date:From:To:Cc:Subject:From;
 b=av81gLblWcN3A0Btu+jakpA2SXJ6ZswVfh83SXcaZaTUFMTZxW4cddM6jWkUuywOM
 3aiTvy+9pmGfX9s5KvuMEFzM2JUERZl/Ypa90YgPuIVwHmIeEU2CzFfv38wU4udGDO
 g9p9u7bBq1Vsnr44YTC0R0skxOPluPlmDE3IuqZV3VQdAwDtzAANAfb2RmIMo8fdKu
 9M90WCwIQSbgHh40Ge6aq9i1UqoyjtSvhNbpsUM2vDJLzfGyKuG+r+i9de0Nlpm7RC
 NEP9cj5dGURatTWRKpcHuTMM0K6y9ODgLeDmFnXz/Qj5PjPbkuhw47+aRA8ANm2/bz
 RcDVMOA8Zk3Cg==
Date: Fri, 29 May 2020 08:30:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: linux-next: build failure after merge of the drm-intel-fixes tree
Message-ID: <20200529083016.34433f10@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: multipart/mixed; boundary="===============1626787612=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1626787612==
Content-Type: multipart/signed; boundary="Sig_/TOkDXh7dnW68muF.F6F3Zg/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TOkDXh7dnW68muF.F6F3Zg/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/gpu/drm/i915/gt/intel_lrc.c:5472:
drivers/gpu/drm/i915/gt/selftest_lrc.c: In function 'live_timeslice_nopreem=
pt':
drivers/gpu/drm/i915/gt/selftest_lrc.c:1311:3: error: too few arguments to =
function 'engine_heartbeat_disable'
 1311 |   engine_heartbeat_disable(engine);
      |   ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/gt/selftest_lrc.c:53:13: note: declared here
   53 | static void engine_heartbeat_disable(struct intel_engine_cs *engine,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/gt/selftest_lrc.c:1380:3: error: too few arguments to =
function 'engine_heartbeat_enable'
 1380 |   engine_heartbeat_enable(engine);
      |   ^~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/gt/selftest_lrc.c:63:13: note: declared here
   63 | static void engine_heartbeat_enable(struct intel_engine_cs *engine,
      |             ^~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  1f65efb624c4 ("drm/i915/gt: Prevent timeslicing into unpreemptable reques=
ts")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/TOkDXh7dnW68muF.F6F3Zg/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7QO3gACgkQAVBC80lX
0GzmqAf/XXa5YvykjbEJpv0izaCS+dXGemMJa4jOa8v8elQe75+80ozd3Opc9XyZ
RO1BP0gQhffz8Y+zfCUL0Mp9gx6U9OW2JYxVIY94rRUqsC+fT/syM91RXcRHOAMq
R2k36hJ5HtraKp8D9E+pe2sB58mQVF0RSV5ohHOtyDaKkafRSE8KhMx93ap7ehyv
dzDfC1+JYbGUr96SsG/zvvtFFib/ovjCzHaZKaM4VJfo+7SV6YMMbyY5q0DIAbdE
xgR5nElIz8oXKMW5gqvtTvtyEg80x0/Le2OdTC5cli7aTnKH1SSBgfPWC7/k6C0j
XswRutHkAVWD+UqxxFjoWRt3bf5mBg==
=Ltk3
-----END PGP SIGNATURE-----

--Sig_/TOkDXh7dnW68muF.F6F3Zg/--

--===============1626787612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1626787612==--
