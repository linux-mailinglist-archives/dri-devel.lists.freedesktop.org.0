Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE1192E360
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 11:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC9310E9E8;
	Thu, 11 Jul 2024 09:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.b="ylW4lySg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1670D10E9DE
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 09:24:10 +0000 (UTC)
Received: from localhost (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id EBB993B6D;
 Thu, 11 Jul 2024 11:24:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1720689849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=9NjQY4CFdRSSUMACoTljrQZ0Eu6KQjt/PB+PShVspRE=;
 b=ylW4lySgGjMOXcWA3D57Rlg3dbXLsLi6lD8Ujp4QTPKR3fGsa7gtjsmw8eqrWbYAJ48HgC
 +GbmuDCeNgyCqRkhsRYQ8litN8fDDEM/99hNMyzOA3TNVMp/ppxC6XcOMDXJivVBYuLrOQ
 E7N8boUaduoWml1xbC3bK2bPL0qZogEV2AfD5xg05036jXZ7ASzfsshNXTWAmg3W1anF/w
 mF2eigXeK3ys5PkY/YoOIsCWoKvZ8FqFeY+jFWU6M9lgeedMWSxCh+lEzri4FF2kV0YFY2
 bZ7Zj8nF/1j0J3vm+TP1jlg0TE8wKRxmP+/0S8f8MoS2g7KdZab2gOLsWYeMPw==
Content-Type: multipart/signed;
 boundary=bd03c224a37c17e60929764b4547fa19bcf92c44aa38a8278f30359b2966;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 11 Jul 2024 11:24:06 +0200
Message-Id: <D2MLN7389BYY.1HZAQPLQNKU5T@walle.cc>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <ck.hu@mediatek.com>
Subject: Re: [PATCH v8 0/3] drm/mediatek: Add support for OF graphs
Cc: <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <shawn.sung@mediatek.com>, <yu-chang.lee@mediatek.com>,
 <jitao.shi@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <wenst@chromium.org>,
 <kernel@collabora.com>, <sui.jingfeng@linux.dev>
From: "Michael Walle" <michael@walle.cc>
X-Mailer: aerc 0.16.0
References: <20240618101726.110416-1-angelogioacchino.delregno@collabora.com>
 <d84f1469-e82a-42de-94a0-8ee0da0cba02@collabora.com>
 <eef10e9f-dac5-4a05-a79c-f8026f27f051@collabora.com>
In-Reply-To: <eef10e9f-dac5-4a05-a79c-f8026f27f051@collabora.com>
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

--bd03c224a37c17e60929764b4547fa19bcf92c44aa38a8278f30359b2966
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > We've got a bunch of series that are waiting for this to get upstreamed=
, including
> > the addition of support for MT8365-EVK (already on mailing lists), MT83=
95 Radxa
> > NIO 12L, MT8395 Kontron SBC i1200 (not on mailing lists yet, waiting fo=
r this to
> > get merged), other than some other conversion commits for other MediaTe=
k DTs from
> > myself.

Yes this is the missing piece to finally get DisplayPort output
working on our board.

-michael

--bd03c224a37c17e60929764b4547fa19bcf92c44aa38a8278f30359b2966
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZo+ktxEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+IKuAX91bBhsZ9n70IFStgrv2BIU/wzvYey5zSMd
wdN4kUkgilUQZFMEdQBBI9Rre4soOOABgKV3nro9rwqC5Qu3/YjtsfR4y9YZMmWS
dVPja70ZNJ1cDuh4I+gD19+V0Q4xPsz6ZQ==
=B681
-----END PGP SIGNATURE-----

--bd03c224a37c17e60929764b4547fa19bcf92c44aa38a8278f30359b2966--
