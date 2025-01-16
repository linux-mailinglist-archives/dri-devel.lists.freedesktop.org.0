Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DB1A132F2
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 07:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CB210E1A3;
	Thu, 16 Jan 2025 06:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R1cdnY09";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6EC10E1A3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 06:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1737007675;
 bh=TeaJjQclXiieRyqczNSx5oWONLO6v9jhRcEroFf1LCE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R1cdnY09MYX+UpNlwA1o0i0vlqmNewhR3DWcO4Azbx6+/wmn6XCY39LihFn3DdbrF
 8CUWzITx/QSzMpM5GODpdJvTSDRmb+t8nzKywos7uYo8bB3juYmqyaMt6usRhNh79E
 i0LxTNAnigbIc3S+J9eov0zrKQLYD2nDPjNBPyNN0hzHHfHxOkLfu6qhqIJ5GShJ1U
 4cNO6P/p53eoUd4J3I8e+kv/isOmfitHFto0VC6cAKDUetkHg652TfX4fsI4WhSGR1
 vkdNW8+rJ9Mf1JSap/ktMtb9KYGEUjPE6GmIb5gQP+LjFboIRyoRYhe1cZhWZRAILe
 OuPzS2mcJFZnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYXTk527Wz4wy9;
 Thu, 16 Jan 2025 17:07:54 +1100 (AEDT)
Date: Thu, 16 Jan 2025 17:08:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Kun Liu <Kun.Liu2@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"DRI <dri-devel"@lists.freedesktop.org
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250116170801.7ee67a21@canb.auug.org.au>
In-Reply-To: <20250113155423.3be0e78a@canb.auug.org.au>
References: <20250113155423.3be0e78a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/whifXz+u.ftTh4z74Ip5QEX";
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

--Sig_/whifXz+u.ftTh4z74Ip5QEX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 13 Jan 2025 15:54:23 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/include/amd_shared.h:352: warning: Enum value 'DC_DIS=
ABLE_HDMI_CEC' not described in enum 'DC_DEBUG_MASK'
>=20
> Introduced by commit
>=20
>   7594874227e1 ("drm/amd/display: add CEC notifier to amdgpu driver")

I am still seeing this warning.  That commit is now in the drm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/whifXz+u.ftTh4z74Ip5QEX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeIokEACgkQAVBC80lX
0GylsAf8DPauo+P9yu3APjl/MgDIH4dLnydm4usscwdfn/Afbi0/iFq/BFS/VlFH
IPbhUJKWE/aeszMx2PkScrX3DooXLm6E4Rcp+s6djH3FVaofk85/xaMnqO1rF0uc
lxMS56ZFrg5kNNNUo9fm41IMDvLuzOiHdJD5JZKjPYWKnW/7wdZS1YCzu5NXOQP/
AHTpiNxhWr0F+K+k7XrAkNLExZuWA4Y/JL9IxhOCfRN1iLiJlB4H8MIWTw5+0qBk
OhgoSg3J9X9ZN/s9eNuABsreZb+PThwHPJOtmhNhHVRlAKaOKUcdx6RN78dthQba
SIhCVYO8aGUXpa2QLIW20NlBpa8SVQ==
=uDT3
-----END PGP SIGNATURE-----

--Sig_/whifXz+u.ftTh4z74Ip5QEX--
