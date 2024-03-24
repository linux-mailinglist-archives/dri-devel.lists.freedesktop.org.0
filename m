Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D10887F31
	for <lists+dri-devel@lfdr.de>; Sun, 24 Mar 2024 22:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F9F10E2AF;
	Sun, 24 Mar 2024 21:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DE/d3Shl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247D210E324;
 Sun, 24 Mar 2024 21:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1711316132;
 bh=ulW3Cqm8/uV68AdhJwzVhvDjYc3Mc32LlRTTtsYRRrg=;
 h=Date:From:To:Cc:Subject:From;
 b=DE/d3ShlekHMObGGTslu2yeTYgkVALoKey4N2vsNMzy3osc9SwvZXbiVzQ7+P0ymB
 JnlLdtNotLgzfEeR2vurldW5z+rJAGorQM/YhFi5iavYw2PInujo/rxf07sxbrE9+D
 LgvRxF3GhZl9YpaabeFY06wJB+0MNfrZaqlvXgsQnTSGXuS4RUfiiW9+smprjzTUlS
 pM7eu6EEqI0TiY/tweZFKYIL36bPtQ/9nwvzSN7CnIRLMs/tL/N86reU9nDkklh6XR
 Q33xumIFoee/oVQvhDoK1nHhjr6Zw1ARWLxrf+HXpNYxt718zR7tqBQn84FgaO7aFd
 +iJ82FKWbsT5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4V2q9Z6J5fz4wcv;
 Mon, 25 Mar 2024 08:35:30 +1100 (AEDT)
Date: Mon, 25 Mar 2024 08:34:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: fetch warning for the drm-intel tree
Message-ID: <20240325083435.4f970eec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UGcDP=zHKknV.w3ZXcL/qbe";
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

--Sig_/UGcDP=zHKknV.w3ZXcL/qbe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

fetching the drm-intel tree produced this warning:

Commit

  326e30e4624c ("drm/i915: Drop dead code for pvc")

added this unexpected file:

  drivers/gpu/drm/i915/gt/intel_workarounds.c.rej

--=20
Cheers,
Stephen Rothwell

--Sig_/UGcDP=zHKknV.w3ZXcL/qbe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYAnGsACgkQAVBC80lX
0Gxo8AgAmqbGXsK/2qwAmioQ+KoJpnbquSXlo91O7wkT9mnhzfKnXScsS6L/SDen
II6GsCtREg48Wno0CC2Cdh5AOVAcmbeZW5fwIv1c9ESQSsIzaXARn3yllQnK2TNQ
N/8j/N+Y1u1Tuig6W5pF8C5orCb3dgTmpwA2dGhj4BC9pRUYMvjbH67hHSdFZbRj
BkPucMX8DUq/5zNZ6wK7Y5PcAqxzZwfCDzd5O7ze0EPXB7tJ3yoaPX+IgV8elULP
kqoWs3jADnijg6PUUYCblfuC4u1xqf8RKbKKWdd1e5gxfs8p3VZDArD1mlfZrn9i
A9AXoiUiomFeoMpEb/6YclMRtlFIxg==
=DpOw
-----END PGP SIGNATURE-----

--Sig_/UGcDP=zHKknV.w3ZXcL/qbe--
