Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DB19A66AB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 13:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EF610E063;
	Mon, 21 Oct 2024 11:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mla1iWyj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D129610E063
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 11:35:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B08AAA42739;
 Mon, 21 Oct 2024 11:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92C5C4CEC7;
 Mon, 21 Oct 2024 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729510521;
 bh=NnP5FFpDfPfkxNfCzIGryQtgDRYsg/mYEfAboo/domI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mla1iWyj+nVKFELG9OM0sl2Ck1pK3QghS6o/oTV8/yZO3sp8Lrhej6jSyClxHf+SQ
 thPx5XAP1aAUIJ1n8IT0COeQ4y0ZeVIqMSpf0KwzwyvEUW9s7CpWQwsoC15nBySc43
 1cy71HCUjzwiKPiqnJy1LGnFMjS+WcWEl/d6TXrgcRP3gxmWkzvOsGdhscwZhcZYrz
 xhHGMzlQnf9vWaZ5V5glMtdfRFtUVNGW7ulbJj5vilV63osFGEpT2UZxNnnfvBzD/p
 Yfm4VG1cmtIGDWWByk79cW/pP9OY7bGx9FXTAiU4LoOm6WYZbCJdJpch2JniAKpXnK
 toLAL2wB0CzAw==
Date: Mon, 21 Oct 2024 12:35:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: Update device list
 with power-domains
Message-ID: <20241021-january-dissuade-d391a189007b@spud>
References: <20241019052935.553886-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y8NnBLaHu/CIQkrF"
Content-Disposition: inline
In-Reply-To: <20241019052935.553886-1-fshao@chromium.org>
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


--y8NnBLaHu/CIQkrF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 19, 2024 at 01:26:56PM +0800, Fei Shao wrote:
> There are two kinds of MediaTek DPI devices in the tree: the ones with a
> power domain and those without (or missing). The former are the majority
> and are more common in newer DTs. Only three older DTs fall into the
> latter category: MT2701, MT7623 and MT8192.
>=20
> However, the current binding only allows particular DPI devices to have
> power domains, which results in spurious binding check errors against
> existing and new DTs.
>=20
> Instead of diligently maintaining the allowed list, let's do it the
> other way around - create an exception list for devices that are fine
> not specifying a power domain. This list is expected to be fixed, and it
> encourages new MTK DPI devices to describe their power domain whenever
> possible; if not, those should be listed with proper rationale.
>=20
> Signed-off-by: Fei Shao <fshao@chromium.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--y8NnBLaHu/CIQkrF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxY8dAAKCRB4tDGHoIJi
0syAAP0c5qRTn8GS7F+N997ftgRYudfJIwY28xnK83tSh6fSbwEAnGMsiLIl6DTW
PLKeegSHvQKodm39IEv39tGUs88enQE=
=R8QS
-----END PGP SIGNATURE-----

--y8NnBLaHu/CIQkrF--
