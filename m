Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0DD906ABB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 13:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E6C10EA2D;
	Thu, 13 Jun 2024 11:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ucw.cz header.i=@ucw.cz header.b="UzwupdY/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 603 seconds by postgrey-1.36 at gabe;
 Thu, 13 Jun 2024 11:08:43 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709DF10EA2D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 11:08:43 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 3E1051C0082; Thu, 13 Jun 2024 12:58:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1718276317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6QQ5va+aQlfb/vFalaHPg5H34Qi6y4ixcQX/yxfzk4Y=;
 b=UzwupdY/Ac2rvSWK4CcDb7IHw17P1YQfhSJeFe5Eiaf5ZQnXaNRH7FLMZMq4nUB4esdAa1
 MdXvLUELmlq3RYK5tK03k0Oxba9oFa+to0qIHHQ4OMxwsVhOqHkw0+qZBpXenPrb/YRxzd
 m1khVbAGHM8KN8XWo17biXMw9eDXRiE=
Date: Thu, 13 Jun 2024 12:58:36 +0200
From: Pavel Machek <pavel@ucw.cz>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
Subject: Re: [PATCH RESEND,v6 0/8] Add CMDQ secure driver for SVP
Message-ID: <ZmrQ3NWxwy8719Vr@duo.ucw.cz>
References: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="0ugZqD1PtgeGMHeh"
Content-Disposition: inline
In-Reply-To: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
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


--0ugZqD1PtgeGMHeh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2024-05-26 22:44:35, Jason-JH.Lin wrote:
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
>=20
> For the Secure Video Path (SVP) feature, inculding the memory stored
> secure video content, the registers of display HW pipeline and the
> HW configure operations are required to execute in the secure world.

This feature goes against interests of hardware users/owners. We
should not merge this.
								Pavel
							=09
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--0ugZqD1PtgeGMHeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZmrQ3AAKCRAw5/Bqldv6
8hagAJ91OcdTYdDnoCizlMOqRMmJHUnS9QCcDaoEoZdKMTlzCo9uoGaVA2KHcyI=
=iTbB
-----END PGP SIGNATURE-----

--0ugZqD1PtgeGMHeh--
