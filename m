Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B5765E373
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:27:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB6810E630;
	Thu,  5 Jan 2023 03:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35F410E630;
 Thu,  5 Jan 2023 03:27:18 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NnX2q6jGtz4y0B;
 Thu,  5 Jan 2023 14:27:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1672889237;
 bh=T/mJIWEOpF2Kt/Rsdz+IYRH758gICLRlV+vE8xQmF7w=;
 h=Date:From:To:Cc:Subject:From;
 b=BomVQFtbv5swYeeEZxYQdPH8ZzW2iLrE2e1ZsCQUuzknvO71zHHKWvlLKjXdyU7NM
 qaxLhdTuBIgKf0WKzhkatfEbE6IZBnue7arM2Rj3SS3zgykAfekHegYRscumbqqGqU
 0lvUNtELgjth2iB6nfjaeIc1CwzFTefZDQ1s8bNeaSu5zjEzuZH4lz55//t3+UPYLw
 gY6JYSEWDPtR7NZSpGcKH3VTPTfmsJ9PasWztoctFhKFmW2C9m+w9OXxifXhItOa2G
 wBQbFnrz10tj4dbHursPw/GY6vo1HyxunYDR5p88fXd0u0PZslKcgxouxfU5vIa9SK
 hYs7x+mnRl6BQ==
Date: Thu, 5 Jan 2023 14:27:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: build warnings after merge of the drm-intel tree
Message-ID: <20230105142713.6a6cac10@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Gsv_+fERN4E48iB=rDcj8aI";
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Gsv_+fERN4E48iB=rDcj8aI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (htmldocs)
produced these warnings:

drivers/gpu/drm/i915/display/intel_dsb.c:201: warning: Excess function para=
meter 'crtc_state' description in 'intel_dsb_reg_write'
drivers/gpu/drm/i915/display/intel_dsb.c:201: warning: Function parameter o=
r member 'dsb' not described in 'intel_dsb_reg_write'

Introduced by commit

  b358c3b98813 ("drm/i915: Make DSB lower level")

--=20
Cheers,
Stephen Rothwell

--Sig_/Gsv_+fERN4E48iB=rDcj8aI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmO2Q5IACgkQAVBC80lX
0GzSoAf/XfSdrpM25TU+j7+evILzw8FSIzjPYKmHD1Cq/oPFtftYAfznPaGtALSr
Qkn64bitLnHe0x1igfGBHMSOP3QX0Qb1zRbwDNkbJ7/8f6OTAEe2A05koMBnHQyq
BDCNvVcJ/kZdPq1OPTGPEKALYsLDvXr2KpUl5ODE/wB2tOTqrVbaT50nUnnWET4B
/CR4Wmcvsrk4Vw0J2Szw8/DQjuDT3ERvY4KxJf+w+GPunGaSo5ociIuehbY3O5/F
8st3IO9UK1uEkFlgHGeTpWo2Iw0k4EtzL4pjmbbDPpjh9BtaYn+qgWm0dTIAc62o
F+5x1Qklx3kGK1SuWy97BZoyzcxi4A==
=pqfY
-----END PGP SIGNATURE-----

--Sig_/Gsv_+fERN4E48iB=rDcj8aI--
