Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3583735101A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 09:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9806E0A0;
	Thu,  1 Apr 2021 07:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968A36E0A0
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 07:32:37 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F9vz736Mtz9sVt;
 Thu,  1 Apr 2021 18:32:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1617262355;
 bh=/isdsYgQkcYhkRFaRl4QlzMrWCuDpbbf/TEzX6QiOmA=;
 h=Date:From:To:Cc:Subject:From;
 b=DLLh1wlNkgBPyqdi3CzWdS2sab4Zavv5KPvNSo/JnwSfkxX9bSE5CTwKb1BkyUrd+
 RKJDI2QY5mEHXTOUelCVhPS/Cac1+c75fgXIxA23rhfjwR5Nc7ClwrGGuEhUM5dEkZ
 YxRTgDN2F1heeSNv797t5So5Bq4Xp5EQqj+Q1J/s6Cs8NLKBrT52APDj4lsB86IgBD
 0wmYGglTmslgxJFF1J6SUoT8VQcEXVigf9dEh6Shh+GYRFNGYSC/o0UMxDPQFDGpbQ
 4lCMwfXAsKeQcOahJo8SVHmRnmyMpLRWZzmQoHhFkve+eNGgu7qeP1QYehoaHXlaCw
 DzTAmw4gBYwXw==
Date: Thu, 1 Apr 2021 18:32:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: build warnings after merge of the drm tree
Message-ID: <20210401183234.11344d79@canb.auug.org.au>
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
Content-Type: multipart/mixed; boundary="===============1607066778=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1607066778==
Content-Type: multipart/signed; boundary="Sig_/q.43okiEo_Sw6Cb6WiawBC8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/q.43okiEo_Sw6Cb6WiawBC8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
these warnings:

drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess function param=
eter 'trampoline' description in 'intel_engine_cmd_parser'
drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter or=
 member 'jump_whitelist' not described in 'intel_engine_cmd_parser'
drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter or=
 member 'shadow_map' not described in 'intel_engine_cmd_parser'
drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter or=
 member 'batch_map' not described in 'intel_engine_cmd_parser'
drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess function param=
eter 'trampoline' description in 'intel_engine_cmd_parser'


Introduced by commit

  0edbb9ba1bfe ("drm/i915: Move cmd parser pinning to execbuffer")

--=20
Cheers,
Stephen Rothwell

--Sig_/q.43okiEo_Sw6Cb6WiawBC8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBldxIACgkQAVBC80lX
0Gz+VggAmz9Oe5HbO3fZk6MLggai5qWpZYwqednPMY3nK9LSTPLvvZu6WzdkCVQg
Fk4rWgLNMW42PrY//pkf6Y7aixQAAKM0ojZfjwPpSn40WAv/R5ia58Nr1LjSPU1g
yLXKZjCIx4ljGCRMRViIdoY2evqnNvGUCh4f6KJ3ykIUfP4mzc6YVGpcFsdikiI3
3WQ/CwZH8u2R2Bn18M9n9CHJZMRVt4eLdebn17VLBeLUCY3zGk2cPKTS40cFnA2Y
W46OCB/kCe3AKMgqCAiRPwu3Meyayjwk629zeDkJX1O5YpU40YGRDGZZTaWB13g4
yY5XRO7DIIk6MAI/U22hrOJ/ZIn5iw==
=mc5V
-----END PGP SIGNATURE-----

--Sig_/q.43okiEo_Sw6Cb6WiawBC8--

--===============1607066778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1607066778==--
