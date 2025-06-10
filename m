Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E81CAD4613
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 00:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAA610E5DB;
	Tue, 10 Jun 2025 22:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XqQQCR+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D3810E5E6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 22:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1749594963;
 bh=5XDxG69hJWIR7MrTeXsJdUOv+6s4mDyGo/RvB64CshI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XqQQCR+o3z3LchzfZOYdUg/qSXh1lqnsdgAXG5SgJCCPke4qd/s1Fj8JmbT7g6Q78
 4mivrnFZXAbUJ447uRHI+FlwrBfUmaeMa0bVoNL86Gz5anhMjZ1HWdv1Cqcw4dhOWp
 rowaQjr0zptqkeZsXfUci7SzdEc46Yq7IQ359BOAI0fSETiGhxhToqV8VaGtZt6ogR
 5raEQz6pXyBOwQC1R/BfI93PONWTtr2o6ephTKrrpu7TYEgd+OMn32YWPTMB3Q0CSB
 a6k/CSlUaJA8aBMqZ6s2qtVTiCBcXjJj1dbwGby3SLPUp6ompcOSQ6u/lOxy7U34yi
 Rqgldoy3InQjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4bH3Xz1hQlz4wy6;
 Wed, 11 Jun 2025 08:36:03 +1000 (AEST)
Date: Wed, 11 Jun 2025 08:36:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, lizhi.hou@amd.com,
 jacek.lawrynowicz@linux.intel.com, quic_yabdulra@quicinc.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/qaic: Use dev_printk() in RAS
Message-ID: <20250611083602.169893da@canb.auug.org.au>
In-Reply-To: <20250610175912.2086773-1-jeff.hugo@oss.qualcomm.com>
References: <20250610175912.2086773-1-jeff.hugo@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vSsDob3nsa+9LwSfoRqKvy2";
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

--Sig_/vSsDob3nsa+9LwSfoRqKvy2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jeff,

On Tue, 10 Jun 2025 11:59:12 -0600 Jeff Hugo <jeff.hugo@oss.qualcomm.com> w=
rote:
>
> pci_printk() was removed with commit 1c8a0ed2043c ("PCI: Remove unused pc=
i_printk()")
> so change to using dev_printk().
>=20
> Fixes: c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Service=
ability (RAS)")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20250610124809.1e1ff0cd@canb.auug.org=
.au/
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> ---
>  drivers/accel/qaic/qaic_ras.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Thanks.  I will apply that to the drm-misc tree merge until it is
applied to the drm-misc tree itself.

--=20
Cheers,
Stephen Rothwell

--Sig_/vSsDob3nsa+9LwSfoRqKvy2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhIs1IACgkQAVBC80lX
0GxYlQf9HEoJDJGuzaElhagMan6AK+uuQFks37DLEKQpaUPnPMfc+5kQRg1uadxw
+VvJo7JBT+d58quTE4AGoTk9w4udA5ClCjq/Hij2hUZZ4/snZvAr3GBcUzWVW/Kk
ZdOt2P7mSRswJABNJ6OeBwBcHvKlkdesnf2VVacL5qFNn3w0SFYca8OgxwpWRrD7
B6WnqPttrC+WjQLVeCo5WEhkGouDFhMr5KC+A4Aa7XKaKfHECRNABOAMSxyelaIB
VZ0C1XMCsk5mgfxNwlHdrB3Qn2vhi+H9/gxi4awI/Ixz9pirCB29rM5QkZKxIcpM
GeHxrTmgrlQZ6pDIkuM2SStFkzmqaQ==
=tFPA
-----END PGP SIGNATURE-----

--Sig_/vSsDob3nsa+9LwSfoRqKvy2--
