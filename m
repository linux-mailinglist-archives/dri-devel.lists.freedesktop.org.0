Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EADC44CE7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 03:50:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E61310E150;
	Mon, 10 Nov 2025 02:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KFV05b4B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E4110E00B;
 Mon, 10 Nov 2025 02:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1762743039;
 bh=bII9wxGwo0GQs5LsRqGIU1tgTnW++AwHm9lJKVbwHhI=;
 h=Date:From:To:Cc:Subject:From;
 b=KFV05b4B9ps57EmN3vjWndQSI7oxhj2/DraB6E19QIhvDtxh2HX1qaWxqnZfjVhK2
 A3YQM6cu4+c6wIiUQHI/du1uww9ZHGlmNCf9Hl38Z1m99ioHvA/AlSvDXMNrbju9BY
 7CsEsLSZvS5WWnvcjAhd2EzS3hsc85kfSP3QgN1Uy005dxuam8DGhV99y2MD3ZuNj5
 bYA6fQgy3RSGEj2NIniKPC5rXZVPVvbbMG7G5qlXF1B6A2DYkyOhhY+aODc50ZEnQx
 iUGsPlG8NdCmodrN2hKZj9uDui936S92hD4hL60CbeFxRF0MuxqHFIOz8yJ1jFveTn
 YSVW4kMG7poDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4d4Z0b3l7Bz4wCm;
 Mon, 10 Nov 2025 13:50:39 +1100 (AEDT)
Date: Mon, 10 Nov 2025 13:50:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Pranjal Ramajor Asha Kanojiya
 <quic_pkanojiy@quicinc.com>, Youssef Samir
 <youssef.abdulrahman@oss.qualcomm.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20251110135038.29e96051@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EtZK38glqk5fOWnXV9JY4Gi";
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

--Sig_/EtZK38glqk5fOWnXV9JY4Gi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/ABI/stable/sysfs-driver-qaic:1: ERROR: Unexpected indentation=
. [docutils]
Documentation/ABI/stable/sysfs-driver-qaic:1: WARNING: Block quote ends wit=
hout a blank line; unexpected unindent. [docutils]
Documentation/ABI/stable/sysfs-driver-qaic:1: WARNING: Definition list ends=
 without a blank line; unexpected unindent. [docutils]

Introduced by commit

  f286066ed9df ("accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents")

--=20
Cheers,
Stephen Rothwell

--Sig_/EtZK38glqk5fOWnXV9JY4Gi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkRUv4ACgkQAVBC80lX
0GyGtggAj3V78Y9uJM/FG2EksOREgFI2cyF8x30UouaCAc97Bjqu/2jU6ybtNXzQ
LnrNmAjyE9WJwa6bKpAuJlIo/BSDxBUdL1NjOguh7GbNPSBOl6i+kPmbs2Yn2fXB
7ARkwK2JLqFpXTi8QLWUMQezezZoaaEtSgfigsRirxhRZY9wmCdNi/Jc0TAADR+s
befaGBcZt1tnD1kNqFnioJaU/WFAYqFlAYhxEDGyeQTO1xP/n1Ov4HX9lNq8JaKo
KuZ81N3RkkAD/fQxo/IelOq803BP8FBhTpsyAFJo4BlMF0O4wacph3DWYSBWZo2c
9hItT9rBd9aCyrJJnKY9uMwLlFCFBQ==
=jW1I
-----END PGP SIGNATURE-----

--Sig_/EtZK38glqk5fOWnXV9JY4Gi--
