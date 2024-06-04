Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8471D8FB92E
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D2810E586;
	Tue,  4 Jun 2024 16:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lzXHR17z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B3189262
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 16:37:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 38068CE0FCB;
 Tue,  4 Jun 2024 16:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F359C32786;
 Tue,  4 Jun 2024 16:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717519057;
 bh=Y7+FgLP6I8iI3gluqNCiw0N+h9DglAWZrrm+DHCQYzk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lzXHR17zM9MO7WcS93M+5rYdbppUnueqnF3e66ILV8dNc6JwpFbE10Uuqp1AbSWkV
 jvLFa3rayffCWDjtCeluxzx5xNUuqIp++haB4igQGRAWPK+eBNO7xZZ3pWQ5hK49W4
 /KJ6muSyaQXjHng54GMm60gSWSne+KcM8VVsimD5QABIGGDVYUrRFGHnB2MAdRSGeP
 tAWgnB2lpPn6UTBLqK+LTazcK7+mkwdMDDmr9ARkq9gBusUfZPtw9acdl4qkkErNWE
 fIExAHW9EeNLtr5Tu4FbvGzlujfx4bDgrpoLlop6xGTbMqr8Zt1YpNATORXUSlfx0s
 oZXYaHtLp7z2g==
Date: Tue, 4 Jun 2024 17:37:32 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, steven.price@arm.com, matthias.bgg@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8188 SoC
Message-ID: <20240604-etching-shrunk-162bf233f483@spud>
References: <20240604123922.331469-1-angelogioacchino.delregno@collabora.com>
 <20240604123922.331469-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZNmaHLwdV+0Ezx3e"
Content-Disposition: inline
In-Reply-To: <20240604123922.331469-2-angelogioacchino.delregno@collabora.com>
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


--ZNmaHLwdV+0Ezx3e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 02:39:21PM +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the MediaTek MT8188 SoC, with an integrated
> ARM Mali G57 MC3 (Valhall-JM) GPU.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--ZNmaHLwdV+0Ezx3e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZl9CyAAKCRB4tDGHoIJi
0oOXAP9m+tBb+Ha+VYSTduN6nFhe1pWIbILjHx6C4dAD0iWh0QEAuYAAlRVVGxPw
NPLSMqfSlH7QXMhB4oIEvdfuTrfDIQ8=
=meGF
-----END PGP SIGNATURE-----

--ZNmaHLwdV+0Ezx3e--
