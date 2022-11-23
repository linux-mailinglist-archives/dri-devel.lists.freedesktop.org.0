Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BC8635070
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 07:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC3EA10E18F;
	Wed, 23 Nov 2022 06:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E6910E18F;
 Wed, 23 Nov 2022 06:22:59 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NH9zL6L79z4xGW;
 Wed, 23 Nov 2022 17:22:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1669184575;
 bh=EQ20pup+UOSYnYaiLUfl3RnsWjq+/RodS36tFIhcfGs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NliPke1t23bnfQJAAa1os0c3H2ibbVuYTIBW8ZiLF4Z7acOX3l8kmrxZJT8BesejB
 UH0ExfFNmGEpOland5zohsBckxbYl5zsleZQc3x6OdMvUYFECawpVudnty9XJR2lvc
 KQoe13e9Wm97Z23WtgSp9kOj2NdI67HLDnCOuSenxlTGBzXg2UzEObVfcfw0YYud5I
 99muLLB8nR6ph5CcrJPVoaoYnXjeM4TaTzkZOS73v6muKJxi+QinV29BAPXtogMedH
 8wPxYQeAk7GX2HXgxu1VYxl692khoIR/xlMCrhfk4EyvAufjypFxthBnmjYnbcW9Xd
 Dtf1xPsIghSWw==
Date: Wed, 23 Nov 2022 17:22:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Airlie <airlied@redhat.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20221123172253.05c9b2f8@canb.auug.org.au>
In-Reply-To: <CAMwc25pz4mBYJUK5_GX01X0_5CCCrzfrGS=HoFTtrVRrqF13kA@mail.gmail.com>
References: <20221117183214.2473e745@canb.auug.org.au>
 <20221123162033.02910a5a@canb.auug.org.au>
 <CAMwc25pz4mBYJUK5_GX01X0_5CCCrzfrGS=HoFTtrVRrqF13kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l7LvT=tFQ83SWzFWhsDvPpv";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/l7LvT=tFQ83SWzFWhsDvPpv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, 23 Nov 2022 15:35:50 +1000 David Airlie <airlied@redhat.com> wrote:
>
> Nothing gone wrong as such, just the drm-misc-next pull request was
> sent on a regular weekly cadence, then I merged it a few days later.
> The fix for this is still in the drm-misc-next queue for the next PR
> which I will get this week.

There is nothing currently in the drm-misc tree in linux-next (relative
to the drm tree).  And there was never a fix in there for this problem,
the commit was just removed when I reported it.

If there was a fix for this in the drm-misc tree, I would not have seen
the build failure.
--=20
Cheers,
Stephen Rothwell

--Sig_/l7LvT=tFQ83SWzFWhsDvPpv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmN9vD0ACgkQAVBC80lX
0GwGXgf/QjhenVIKSMNwPEN7XNJTj8cqU9aDjBtnnjA/rsrdgzPTtJ/OgvPIUj8g
TE6/aAGVh5IZKlliObO0zlfx5TJcuhPGz8rOotLW36ecvcLF4dHNuxlpcjYq3f+f
20OtftvBX37Oo9pzmEP5iH+wIUCkbnVQ+s4hiEzaV/TlqGrTt/D2tEjkZ4YNieQk
bCP/i+XZjMah2B3EoTS9uwuyq9GsM9nGj3EMjiGfIuKIVSW1kAlo0H3JNhY33S2e
zrp/MSGxPjmcaWVAEZ5/klA6yRcpqtxFE5Nz8519gXFtzyh1RjGBkCRO0xmnJHmy
9QbQKtB5vwW5MfL8/p3r7LADRZJ3/w==
=4o2t
-----END PGP SIGNATURE-----

--Sig_/l7LvT=tFQ83SWzFWhsDvPpv--
