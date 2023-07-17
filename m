Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A95755E86
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55DF10E208;
	Mon, 17 Jul 2023 08:32:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20F610E208
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:32:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 344F560FCC;
 Mon, 17 Jul 2023 08:32:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44651C433C7;
 Mon, 17 Jul 2023 08:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689582766;
 bh=nVdNFaIM5q8yzAM6X+ufMIbwtpAWzqwx9TWlj/9T9a0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eJv8zaXTCskf0rsUA2PcHM5wmjcsMNCwOxRXctje0xqR6ITX+/19lybW3LQiEkOik
 MpIy+cALmr5EXeHLBSIOU8eiUXQwB3FWADGAd6R5wGWmBYs/oAQNSF6WijrWD9s8XF
 qOh4yZlrywBH8R5UmZF6jaJjLi4bm5efVj13pMjdwK5Ns63+4gM/ocZ1lHT8Umcv1C
 5PLma2w6djzqVpWBX2ItlXsp6K4hXtbCG4a2P63f6QMBv4iE6yiMkYOrMqLkJmVWOi
 8zep+sMwzjH91JwjqeHWZ0crB752mKET/bAXqnLjCriTu/wWU92hbW5dDoZTO36fiz
 DlGaVHBJ9gQ+Q==
Date: Mon, 17 Jul 2023 10:32:44 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sarah Walker <sarah.walker@imgtec.com>
Subject: Re: [PATCH v4 17/17] arm64: dts: ti: k3-am62-main: Add GPU device
 node [DO NOT MERGE]
Message-ID: <el4ythd7inzj5emscuoiewh4x2glkyugxxnqd67axloglamtpr@vp26mlv6ocas>
References: <20230714143033.112624-1-sarah.walker@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mfri3en37qva4g6l"
Content-Disposition: inline
In-Reply-To: <20230714143033.112624-1-sarah.walker@imgtec.com>
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
Cc: matthew.brost@intel.com, luben.tuikov@amd.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, afd@ti.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 hns@goldelico.com, christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mfri3en37qva4g6l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jul 14, 2023 at 03:30:33PM +0100, Sarah Walker wrote:
> Add the Series AXE GPU node to the AM62 device tree.
>=20
> Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>

Checkpatch complains about that one because you indented the node with
spaces instead of tabs.

Once fixed:
Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--mfri3en37qva4g6l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLT8qwAKCRDj7w1vZxhR
xa7fAP9FDt6bwQ/W8zycfYaWUKZ/M9LdF98tonOYw0cebZEB8gD/aOmlzvHgQ9FI
LdvGl02SvojJp3fIySEVUOc3xWUX5Aw=
=6+yl
-----END PGP SIGNATURE-----

--mfri3en37qva4g6l--
