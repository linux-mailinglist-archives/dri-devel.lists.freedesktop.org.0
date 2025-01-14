Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8263A1062D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 13:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE15C10E1FD;
	Tue, 14 Jan 2025 12:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NyhrkoTM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B00510E109;
 Tue, 14 Jan 2025 12:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1736856369;
 bh=wElorjl51idWQA1WITlYRl8byIXNZ4W5GUVJ5cJVqbg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NyhrkoTMHaxsm2zVbFNhESqhb2zD/YRA3099+1yEQlym6IRYv6jK0PBlT6oCsppej
 vLG+Ahka99k1ELStPq3PhXVK9cphhQyqXaE156d63SZB6Y+QK2ZZibQzGx46LIaUMo
 I2QwhiyMliAHjcv47Z2nnwWEwv11XI9egmiMzrJlnYJ2ywqw4ZORp4uTk0inEPPKvJ
 o+5rBUVhfuUGFvJHONYzbQrSYkJqJcUVlHrBJ0VMU4C16Mvz61p+k32OlA8mBIkuPo
 WSnecfqrxaTFLrtM8makD8nQnFI434T52qftlKTQF9odXuT92LTCt/sMFseSo7gmvZ
 ICLFPAfsMju6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXSX05cCzz4x8R;
 Tue, 14 Jan 2025 23:06:08 +1100 (AEDT)
Date: Tue, 14 Jan 2025 23:06:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie
 <airlied@redhat.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250114230614.4fe2d33c@canb.auug.org.au>
In-Reply-To: <2f74opyehgqxnd7337fc23hwwow2ggod25obqweu72j2zfbo6g@xuvurpzbwbyd>
References: <20250106174645.463927e0@canb.auug.org.au>
 <20250114164324.3a42700e@canb.auug.org.au>
 <2f74opyehgqxnd7337fc23hwwow2ggod25obqweu72j2zfbo6g@xuvurpzbwbyd>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pnjhH/ntVCqC8IWflgU8ukj";
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

--Sig_/pnjhH/ntVCqC8IWflgU8ukj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Tue, 14 Jan 2025 13:40:43 +0200 Dmitry Baryshkov <dmitry.baryshkov@linar=
o.org> wrote:
>
> The patch is pending reviewal:
>=20
> https://lore.kernel.org/dri-devel/20250107-drm-bridge-fix-docs-v1-1-84e53=
9e6f348@linaro.org/

Thanks

--=20
Cheers,
Stephen Rothwell

--Sig_/pnjhH/ntVCqC8IWflgU8ukj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeGUzYACgkQAVBC80lX
0Gx4pAf/Vts9k3Vh7mhqDnq/BRY7Bee0Q9OP4cuZ6VqEF+t+neIqlaCzEcUbLb2R
q+FMUCtEqZREikZ3kwH8DY9zQQCJyQzP9UL8xjvlVSUvrTmDYFGzAEtmceznSaYV
MpefATyu9C4iNbBcsojv1L4fa089hvVuv3aARSLph4xCRG1T9vyANd78GdP1Wkk7
nvD6crjKIf0PSbblUvWp9JoFoi0ZIB55Xv9vWuvRrpqCVbRAs+Z830HGlgHV6Af7
B2yI5e6OHVmpgyj40X+LKAgzzXekxSePAHq5BYCbClgBf5oA34zWNXsv/q6xpknV
ch86taCgO5TqRulAPtoOvAB9hKwpQw==
=MhXZ
-----END PGP SIGNATURE-----

--Sig_/pnjhH/ntVCqC8IWflgU8ukj--
