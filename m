Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB858D7CA8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 09:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A7C89151;
	Mon,  3 Jun 2024 07:42:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.b="mKfgfIw0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7990C10E04C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 07:42:37 +0000 (UTC)
Received: from localhost (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 30CEA136A;
 Mon,  3 Jun 2024 09:42:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1717400554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=l/sXJWAR9U+t8PuJjd67PbuHh01c02nSqxd7Y8bCUpM=;
 b=mKfgfIw0rVXzUB2hP0B2WxtTyKBz9VHQ5GW0H/acJGDGO7XYNyllK5U2aU0laMQOncMNxb
 63+o3L3cwsC9BhAZl30ZY1W9aOEIKA0BadMQEvJfy28XQnJ6+Ag1UrmyyEpsPO+vKug+un
 VIOmTj0ewguhvmUIc59KofVhqUsJ34y4Vz9XPQBBUgMTDGUnRQXFk6+nrb3CaP/4hXmPHs
 bCgss0RdUhLImzMiLhXc+o9Y5G8Q2Shz99/HZYYA3JDlD/Bysg/DzDX2nPvCthzELAPQCH
 N2RKaKynB4Z4wd5LO7zIxX5MplhmoRaMzAQ9NZNTakTdQUCwqGCiLUgX0z004g==
Content-Type: multipart/signed;
 boundary=3ed5ea633b485a24b502befa1bea475237ec606cb99637397be66d7a74b8;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 03 Jun 2024 09:42:31 +0200
Message-Id: <D1Q7OPR0TRFG.1WLSI7EBAPUWX@walle.cc>
From: "Michael Walle" <michael@walle.cc>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v4 3/3] drm/mediatek: Implement OF graphs support for
 display paths
Cc: <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <shawn.sung@mediatek.com>, <yu-chang.lee@mediatek.com>,
 <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <wenst@chromium.org>,
 <kernel@collabora.com>
X-Mailer: aerc 0.16.0
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-4-angelogioacchino.delregno@collabora.com>
 <D1BTQIQ2AQIS.G12ROFB149QB@walle.cc>
 <84cd0ac7-99d9-42cb-af79-a0fba09c1ebb@collabora.com>
In-Reply-To: <84cd0ac7-99d9-42cb-af79-a0fba09c1ebb@collabora.com>
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

--3ed5ea633b485a24b502befa1bea475237ec606cb99637397be66d7a74b8
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Angelo,

> >> Implement OF graphs support to the mediatek-drm drivers, allowing to
> >> stop hardcoding the paths, and preventing this driver to get a huge
> >> amount of arrays for each board and SoC combination, also paving the
> >> way to share the same mtk_mmsys_driver_data between multiple SoCs,
> >> making it more straightforward to add support for new chips.
> >=20
> > paths might be optional, see comment in mtk_drm_kms_init(). But with
> > this patch, you'll get an -EINVAL with a disabled path. See my
> > proposals how to fix that below.
>
> I might not be understanding the reason behind allowing that but, per my =
logic, if
> a board does have a path, then it's written in devicetree and enabled - o=
therwise,
> it should not be there at all, in principle.
>
>
> Can you explain a bit more extensively the reason(s) why we need to accou=
nt
> for disabled paths?

Paths should be (and this was already supported before this patch
with the hardcoded paths) disabled with the status property. This
way you can have a common board configuration where all the paths
are already described but are disabled. An overlay (or maybe another
dts variant) can then just enable the pipeline/output port by
overwriting the status property.

Also, this is the usual DT usage, as a node with status =3D "disabled"
should just be skipped. Without handling this, the current code will
return -EINVAL during probe (IIRC, my vacation might have reset my
memory :o).

-michael

--3ed5ea633b485a24b502befa1bea475237ec606cb99637397be66d7a74b8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZl1z6BEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+EuiAYCiS0ktYeqW3WREzRyRaWz/fZqG9E+chTLp
Eq2F71PR2kPsrQjcJqjw9P8PJP1Tb7IBf1Xo00KNX/YZCxZd7B2+oCO6cjri7/ym
ZBbCHMlAM8XqJvXrDFXC1OxZkA8QuPDVng==
=F2kN
-----END PGP SIGNATURE-----

--3ed5ea633b485a24b502befa1bea475237ec606cb99637397be66d7a74b8--
