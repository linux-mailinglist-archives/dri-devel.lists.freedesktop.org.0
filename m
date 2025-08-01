Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B342B17BDD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 06:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EBD10E39F;
	Fri,  1 Aug 2025 04:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cwObEtYV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8EA10E2E9;
 Fri,  1 Aug 2025 04:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1754022651;
 bh=oO4lRU20sEP4gjQMLXi33Cj6UC+YBAezSMbRbz1DpwM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cwObEtYVa9BrEfbKPDOLaqW1sSukNR+OW3NTckCfbwyXjdwki919HffGhYpsRkCN2
 h5pHcm+mUSQxnt0GXQtY45atoAKXlY/xvgZ6yuNZJMe1dkPbiNK9bS84/i6m1g2l3G
 4pIhhXuOy1LyZJ3dfYoR10O0uR/rUKZSc4F1V3eAsDwGq9c0I767GU0xgA/kNb96Tm
 ZFbUZNHw06xa55H1JFko9tk6YcRRTX2NMQ9QfqfYXvBZfssP4PVcWwZAYE/HP1EQn9
 EDkAkZhm01CtR33t+CnYjDzVEA2HkSCnEzKdp0g2+oBHcNJ1woeRaP34gSDKiH96e4
 xX7dWN4hCTvXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4btY0q38sMz4x7W;
 Fri,  1 Aug 2025 14:30:51 +1000 (AEST)
Date: Fri, 1 Aug 2025 14:34:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250801143440.59e13a4b@canb.auug.org.au>
In-Reply-To: <20250611140933.1429a1b8@canb.auug.org.au>
References: <20250611140933.1429a1b8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4.0je3=yvOcR0PhaG=onJs1";
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

--Sig_/4.0je3=yvOcR0PhaG=onJs1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 11 Jun 2025 14:09:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> include/drm/drm_bridge.h:943: warning: Function parameter or struct membe=
r 'hdmi_cec_init' not described in 'drm_bridge_funcs'
> include/drm/drm_bridge.h:943: warning: Function parameter or struct membe=
r 'hdmi_cec_enable' not described in 'drm_bridge_funcs'
> include/drm/drm_bridge.h:943: warning: Function parameter or struct membe=
r 'hdmi_cec_log_addr' not described in 'drm_bridge_funcs'
> include/drm/drm_bridge.h:943: warning: Function parameter or struct membe=
r 'hdmi_cec_transmit' not described in 'drm_bridge_funcs'
>=20
> Introduced by commit
>=20
>   a74288c8ded7 ("drm/display: bridge-connector: handle CEC adapters")

I am still seeing these warnings.  That commit is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/4.0je3=yvOcR0PhaG=onJs1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiMQ+AACgkQAVBC80lX
0GxnxQf/cOK5eyKavjdPQc03CU265FlRrktAYHiyMfAC5zdlurGLWCJUOCiWPC/b
dYOefPDdyerIOAkWabkc8Mt8PM5ChxnX3FuO62kFbStvm0ZvrTW7QQK81PZ+pwF/
PmMZJbkERq0Hwyk+320C2eqz8uXsL0bGqGYmNxKECnOdkz2oNNPwfw9niAWZ+FHC
UMqq55sKJ00VK3qmGIF1Lcm3eYZEZ++sVzJ9EeLUrdSQ3kLA4+rA6aVvgfaP6DDj
3VATQZz3G6+b/n5xiZlnugE845KRaQfYFO86XQ6As1tsNBb7ssoXqTxNfNIu+PgT
4dr7SFMfCaa6ObsFfQ9d6AB1dpJJwQ==
=6cLz
-----END PGP SIGNATURE-----

--Sig_/4.0je3=yvOcR0PhaG=onJs1--
