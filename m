Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B367E9B43
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D08A10E359;
	Mon, 13 Nov 2023 11:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBBAF10E359
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 11:38:31 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id D50361C0072; Mon, 13 Nov 2023 12:38:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1699875508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EAyXszHtRdE1BBbkJKoK+xUoJRMnmO0Ng8MajCCXXeE=;
 b=oZ6iug6lHz81l8qjRZCg00hy2PwoLO2zZ7Yl1ySH6w9vL4ZHgbyhnhSBQNB0kMf+riZTjP
 ihjQZXossJmcKGUdwBVEow+L7CfBiINvvwKeXSKOJiseR/OR7j8YUgMFc12eIgoNkymRl9
 pdhP5uc7Jy66YN+qdPpbvbmj2dIsYDU=
Date: Mon, 13 Nov 2023 12:38:28 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v2 0/8] dma-buf: heaps: Add secure heap
Message-ID: <ZU/V2XX71GbaV6Q8@duo.ucw.cz>
References: <20231111111559.8218-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="+UPm1Kfn/l4nJAP4"
Content-Disposition: inline
In-Reply-To: <20231111111559.8218-1-yong.wu@mediatek.com>
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
Cc: dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, jianjiao.zeng@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, ckoenig.leichtzumerken@gmail.com,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--+UPm1Kfn/l4nJAP4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This patchset adds three secure heaps:
> 1) secure_mtk_cm: secure chunk memory for MediaTek SVP (Secure Video Path=
).
>    The buffer is reserved for the secure world after bootup and it is used
>    for vcodec's ES/working buffer;
> 2) secure_mtk_cma: secure CMA memory for MediaTek SVP. This buffer is
>    dynamically reserved for the secure world and will be got when we start
>    playing secure videos, Once the security video playing is complete, the
>    CMA will be released. This heap is used for the vcodec's frame buffer.=
=20
> 3) secure_cma: Use the kerne CMA ops as the allocation ops.=20
>    currently it is a draft version for Vijay and Jaskaran.

Is there high-level description of what the security goals here are,
somewhere?

BR,
									Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--+UPm1Kfn/l4nJAP4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZVIKtAAKCRAw5/Bqldv6
8iG9AJ99RhByi/gP/cqaMDDkFg2adWOtcgCgicBpfQqh45WCONn3cfMdR3OcoPg=
=6oEJ
-----END PGP SIGNATURE-----

--+UPm1Kfn/l4nJAP4--
