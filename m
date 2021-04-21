Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCA6366573
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 08:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9079D6E94F;
	Wed, 21 Apr 2021 06:30:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9814C6E94F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 06:30:34 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FQ9fJ44PVz9t0Y;
 Wed, 21 Apr 2021 16:30:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1618986632;
 bh=qlBGa2l8YULLNCXVp4KGUyi+W0CGzSz0nIHBmKGpQDs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F1XTTsP0p7gNos5H+HoQQpEBp/ZhKS5+dFd0SGVhxZekAexxmbsfLbkwVreKsUJxv
 xiUCXpB4cwPIAV/T1jiqqmdRSAY7A3sv2QYRr0u3vQ/eiUWraAwpk6V3he0JnU0Ze1
 e71zphWqAvYhZr3hBT4Krahpb7YegKspFYvlp0uvGqdo5noUCth97t97P6pKRtlron
 rW6KglcwhDebYHeEbErngfbmOVqhqix7/5fEXuD1IxoHZrR+nYpjDOn1qD9rRL2D4n
 0skbX6bRmrWl6o6aiqrZoYuBiRvI61oCRcQTVTFJ+k7WwH8uO1BxR3PxlxcOty3X/c
 sjUW0J+1yB5Dw==
Date: Wed, 21 Apr 2021 16:30:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <20210421163031.10ef514b@canb.auug.org.au>
In-Reply-To: <20210401183234.11344d79@canb.auug.org.au>
References: <20210401183234.11344d79@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0385669058=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0385669058==
Content-Type: multipart/signed; boundary="Sig_/KsN8ik.f/vnU1V.S6DLAaTe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KsN8ik.f/vnU1V.S6DLAaTe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 1 Apr 2021 18:32:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm tree, today's linux-next build (htmldocs) produced
> these warnings:
>=20
> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess function par=
ameter 'trampoline' description in 'intel_engine_cmd_parser'
> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter =
or member 'jump_whitelist' not described in 'intel_engine_cmd_parser'
> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter =
or member 'shadow_map' not described in 'intel_engine_cmd_parser'
> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter =
or member 'batch_map' not described in 'intel_engine_cmd_parser'
> drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess function par=
ameter 'trampoline' description in 'intel_engine_cmd_parser'
>=20
> Introduced by commit
>=20
>   0edbb9ba1bfe ("drm/i915: Move cmd parser pinning to execbuffer")

I am still seeing these warnings (as of next-20210420).

--=20
Cheers,
Stephen Rothwell

--Sig_/KsN8ik.f/vnU1V.S6DLAaTe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB/xocACgkQAVBC80lX
0GzKeggAjaLM4uDBg6JGUrW8vVoLYrmfrO6/AqKftJ3Xt1zH2gwDo71sTEMXW44b
6zW1Nc16tKVDls7mZf46vWkURmNWJOuefkHgKpkaRsZ9AUcWMSC+J/oT5U5y9Ba4
hY5sYauHthqUo6OuHeuKJGVks9NayES7EAX7a4PwRt6S4WiuBlPxPhThqE0SGG+6
fOhNaae6//Tl6IeX+bzJY6CBOVl7+hkmmZUCnqBI6amfB2Qyv+NaNwuHgdDrCKVU
P2+Z5V7Kqu67J8i0qaZ6anX4GJYaVTB7HcZWHQxgkXmP9oVE1KIKkvH6gHHdnRFE
ofLfOW9yziul7ZqwRTET09xSwPzoCg==
=cESv
-----END PGP SIGNATURE-----

--Sig_/KsN8ik.f/vnU1V.S6DLAaTe--

--===============0385669058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0385669058==--
