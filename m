Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D2A65E35F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8111B10E0DE;
	Thu,  5 Jan 2023 03:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E83810E0DE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 03:21:19 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NnWvw70xQz4y0B;
 Thu,  5 Jan 2023 14:21:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1672888877;
 bh=qhnv72iKLXlp0Iy60FC7k2nMmgngV1sGzB5TQ6N2tpA=;
 h=Date:From:To:Cc:Subject:From;
 b=RvwGEL5ywZvFiYQTNHUUqfMtfq+s0qnRXjM1i20EeWhrrPZ1MZKp/3AALDQxSZ2Z1
 0eU5TTkP+aHCPDqGf2PCA0NXSiz5SfM1GQuHYeo0jZ8rPt0rRNSjE2W/I5alTgUPl+
 jbILGUscD71wIo8gxGLq00HzhbEwYmRm6hIgkIuTJd7X7hBzfqLbjDS6Nlnbv+jMUj
 NYXt2codzX+6lvAeUggbZCePiag04rAD3AJizyyvIGv/n5K+0BDF8tx49/skDm/mwV
 lSCtQ969SSUJcuAJZSJ4HHkEddfdF0A25pimuVy2JwlerfPl/9YrGTLTDc6W2sF+bo
 AlbfUYWKqHW/g==
Date: Thu, 5 Jan 2023 14:21:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20230105142116.3e0203a3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OYy0_Ui_uWdFfY8NZTe5giw";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/OYy0_Ui_uWdFfY8NZTe5giw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

drivers/gpu/drm/drm_connector.c:1849: warning: bad line:

Introduced by commit

  7d63cd8526f1 ("drm/connector: Add TV standard property")

--=20
Cheers,
Stephen Rothwell

--Sig_/OYy0_Ui_uWdFfY8NZTe5giw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmO2QiwACgkQAVBC80lX
0GzmmQf/a/doIugDJ6hvwKdiQr8Mcd817/PKaXOCrqo8Kf9Uap6ox6jXRtrMTGaR
7lKWae5hdyIoAuF0AU28/Xs/Qbzk/6epTtzqq3EKbuxQwXme0A/U8Xf6d0dKVBST
LH+I4OQ7PEFRZpVGiF7oPmH+CvK+VYZte5pzUTeguK40FHow3UhLCpvbF2N0ga0g
duW+WQviHp+pn5smctaCxh7InPQ0PqMOnVN7sODmc+DPFmrXY20FB3V+tVkdsC+P
xkV0249Xs1NpOksm1fhMlYRKZvdojLJexJgpDhTN4sGVVmMa+Cs3fEam1r0uVme/
a/Re5qdD+eugQYGSk92X1J2Mdx7tkw==
=Ls+s
-----END PGP SIGNATURE-----

--Sig_/OYy0_Ui_uWdFfY8NZTe5giw--
