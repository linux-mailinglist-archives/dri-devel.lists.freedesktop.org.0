Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6329D5BC7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 10:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA76C10EB17;
	Fri, 22 Nov 2024 09:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KME/Hl2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3950210EB17
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 09:20:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C8FF75C59BC;
 Fri, 22 Nov 2024 09:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2AFC4CECE;
 Fri, 22 Nov 2024 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732267240;
 bh=TJISY0Qp3DpFT5vqFaWzyOjdEgvgZWYGz0dptffo+IU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KME/Hl2eBbCHhY0v0AERmlO4znWAAU34qQDMEbCw7PhvXfSeVYbO+oQvKVDNyamM1
 AVRD3oJbaJmD4nZeLB7Mkla6Ukzja/tclzHLbkaUA0XFukUx8LdeZBmofRrcOewkHS
 jPWpjaAoMH38m00bAHypUBbGW8Vuhrl2l0vVEN+sxNt0yQ/locP9l2A/Sp2HfRLj/w
 +cYS1MgwSrxkwVgrbDYAp/Fqk2S6Co4GEnEVBkFQ0Rw0u1wU3OIhxNjCE1DA1xVKwt
 y3QwWIUapP4xaPxeHupKheer/zrNwfmKnKqxs6vk8lFeoVOJ50PavLMPXcczHpOMiT
 YPgbER5kBZ1IQ==
Date: Fri, 22 Nov 2024 10:20:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, 
 ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
Message-ID: <20241122-cobra-of-authentic-discourse-e2c5b6@houat>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3dic3xjywnt7kqn4"
Content-Disposition: inline
In-Reply-To: <20241120124512.134278-8-angelogioacchino.delregno@collabora.com>
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


--3dic3xjywnt7kqn4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 7/7] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
MIME-Version: 1.0

Hi,

On Wed, Nov 20, 2024 at 01:45:12PM +0100, AngeloGioacchino Del Regno wrote:
> Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
> found in MediaTek's MT8195, MT8188 SoC and their variants, and
> including support for display modes up to 4k60 and for HDMI
> Audio, as per the HDMI 2.0 spec.
>=20
> HDCP and CEC functionalities are also supported by this hardware,
> but are not included in this commit.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Just a heads-up, you should really be using the new HDMI helpers, it'll
remove a lot of boilerplate and potential bugs.

Maxime

--3dic3xjywnt7kqn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0BM5QAKCRAnX84Zoj2+
doq3AYCWl8KXP/adtoZQh37W4KQ0qJZyU0dQnXyzmC0rmSXysoIv/perb0JAwCnN
EmwWeE0BgIVw4QDM9RrCyqMR8CGn/NICh9ybOvi4UXzG1UZ/sFYYIoevlH2+U4+7
PHNpqZlw+g==
=Qlnv
-----END PGP SIGNATURE-----

--3dic3xjywnt7kqn4--
