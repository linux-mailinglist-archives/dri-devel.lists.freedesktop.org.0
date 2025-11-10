Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31EFC44C41
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 03:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3655710E28C;
	Mon, 10 Nov 2025 02:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VlFRbZzw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9442710E28C;
 Mon, 10 Nov 2025 02:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1762741442;
 bh=LHo9xZyZFl43ehMl0ZMkiYOE3hBiB5Knu4/aMTJbWzw=;
 h=Date:From:To:Cc:Subject:From;
 b=VlFRbZzwI7/WjBlY+9GcF0tgWXcTBxo+WNierjsKYvkV/lDydnZm6C99E4klu9lLu
 t7ElulsefqrylQTfDkrnPzGOi0WTDdXdEKZtOwk5Qo1tIBNPcVtk1mgnsyE9sgj9Zw
 512BRgXcwghaNt8ID/4zNOxgR7+0R+5cA2zEMPzu7u+jRuAK70paGINmqhRPC3/DiZ
 KGf8g+fL8fGzcl1f3+WN7rMbwBqdUeggqW2qWSzZU0PjLqMfvNv4tlLxiGJq7SJBcy
 VIPR3vabKlTJkvdrojtAP4UumWtRSsfEAn44UEd2n+NEHF8eoEVtLFgCnpSOR9ywx7
 tAhftMYXDjkrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4d4YPt1XDyz4w2R;
 Mon, 10 Nov 2025 13:24:01 +1100 (AEDT)
Date: Mon, 10 Nov 2025 13:24:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Aswin Venkatesan <aswivenk@qti.qualcomm.com>, Jeff Hugo
 <jeff.hugo@oss.qualcomm.com>, Jeffrey Hugo <jhugo@codeaurora.org>, Jeffrey
 Hugo <quic_jhugo@quicinc.com>, Pranjal Ramajor Asha Kanojiya
 <quic_pkanojiy@quicinc.com>, Troy Hanson <quic_thanson@quicinc.com>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20251110132401.200d88bd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r06Vw_PbOst0fgTV7ucR6je";
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

--Sig_/r06Vw_PbOst0fgTV7ucR6je
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/accel/qaic/aic100.rst:502: ERROR: Unexpected indentation. [do=
cutils]
Documentation/accel/qaic/aic100.rst:504: WARNING: Block quote ends without =
a blank line; unexpected unindent. [docutils]

Introduced by commit

  9675093acea0 ("accel/qaic: Implement basic SSR handling")

--=20
Cheers,
Stephen Rothwell

--Sig_/r06Vw_PbOst0fgTV7ucR6je
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkRTMEACgkQAVBC80lX
0Gx0AQf/aMyqvU4OKrj4JQ0OqcT4+SX7cuWhmDfRWeIvq//xRHf+KYZAhpL3W72A
qZx73EtkizpHtAmgfE6JwpwBrmtT0QkueKYqbrhKHJvgj2W8vDePE4833xSlbyTO
ymFIPHMC/K0HCpv6/Bj0hECoCYZgTPlm6CWC9/5i80qaIMlEbRbPf5ubDg1udKeD
Obi6uClvnEPMDjijsAAIvQog88P4grNs6Dc2yutYIYxKkTE+g9sopZ4iRk1ZIPx4
HhuIPsM86aZZp8SChhPupirtjm1XLBZY1Tuk5MLW956DngQPEnskcoBXPqwl/c+h
AeeuTXHEGWpqJCk6sOKXiedd22kyTQ==
=AE2a
-----END PGP SIGNATURE-----

--Sig_/r06Vw_PbOst0fgTV7ucR6je--
