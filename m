Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A41690C85D
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 13:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DB510E096;
	Tue, 18 Jun 2024 11:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.b="EcGylFKE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E5910E096
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:06:17 +0000 (UTC)
Received: from localhost (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id D30E24EB;
 Tue, 18 Jun 2024 13:06:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1718708775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=x3dY7vGUbHuM7HK5sLYaOBv96qBz5iBV4OEjaZApnZQ=;
 b=EcGylFKEGifOWNxIqMP1JLQXaIeq48Z8EyC1O86WxZyERM3xNT+PS5yg49l4s9Cd/FunH5
 /cxrLAAZ3dwF5o6bN14jScBzoHqbnz3kNQ7TmXfsmK2lM3BQX0mDAzAB6t7Ulp7W1yCDxU
 LsqsUfDjDTxWCs1W9fZYk9LpUcoSsrYKDOAJiZXoIEdUc6D2g99gyzvzDLbg5RSy5RPaxa
 LaIj6pOQJJ/GLPniTuhCd+MP9Rd4kBK9Ahocy4PMai9rnPeo2sYO/Rmdqx9bKkbHU9yiF9
 XViRWu27tg/IxlKkPwEzQHymirWjwKoerg3TZfgmjv7Jkr3cXSY7TR9RlD/O4w==
Content-Type: multipart/signed;
 boundary=35992d9bcb644d4eacfa1e9e85c528ea0bce7a64169a83d15a45c664ea97;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 18 Jun 2024 13:05:59 +0200
Message-Id: <D233EO49QOHJ.Z924UBW5OPJU@walle.cc>
Subject: Re: [PATCH v8 0/3] drm/mediatek: Add support for OF graphs
Cc: <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <shawn.sung@mediatek.com>, <yu-chang.lee@mediatek.com>,
 <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <wenst@chromium.org>,
 <kernel@collabora.com>, <sui.jingfeng@linux.dev>
From: "Michael Walle" <michael@walle.cc>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240618101726.110416-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240618101726.110416-1-angelogioacchino.delregno@collabora.com>
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

--35992d9bcb644d4eacfa1e9e85c528ea0bce7a64169a83d15a45c664ea97
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Jun 18, 2024 at 12:17 PM CEST, AngeloGioacchino Del Regno wrote:
> The display IPs in MediaTek SoCs are *VERY* flexible and those support
> being interconnected with different instances of DDP IPs (for example,
> merge0 or merge1) and/or with different DDP IPs (for example, rdma can
> be connected with either color, dpi, dsi, merge, etc), forming a full
> Display Data Path that ends with an actual display.
>
> This series was born because of an issue that I've found while enabling
> support for MT8195/MT8395 boards with DSI output as main display: the
> current mtk_drm_route variations would not work as currently, the driver
> hardcodes a display path for Chromebooks, which have a DisplayPort panel
> with DSC support, instead of a DSI panel without DSC support.
>
> There are other reasons for which I wrote this series, and I find that
> hardcoding those paths - when a HW path is clearly board-specific - is
> highly suboptimal. Also, let's not forget about keeping this driver from
> becoming a huge list of paths for each combination of SoC->board->disp
> and... this and that.
>
> For more information, please look at the commit description for each of
> the commits included in this series.
>
> This series is essential to enable support for the MT8195/MT8395 EVK,
> Kontron i1200, Radxa NIO-12L and, mainly, for non-Chromebook boards
> and Chromebooks to co-exist without conflicts.
>
> Besides, this is also a valid option for MT8188 Chromebooks which might
> have different DSI-or-eDP displays depending on the model (as far as I
> can see from the mtk_drm_route attempt for this SoC that is already
> present in this driver).
>
> This series was tested on MT8195 Cherry Tomato and on MT8395 Radxa
> NIO-12L with both hardcoded paths, OF graph support and partially
> hardcoded paths, and pure OF graph support including pipelines that
> require OVL_ADAPTOR support.
>
> AngeloGioacchino Del Regno (3):
>   dt-bindings: display: mediatek: Add OF graph support for board path
>   dt-bindings: arm: mediatek: mmsys: Add OF graph support for board path
>   drm/mediatek: Implement OF graphs support for display paths

Thanks!

Tested-by: Michael Walle <mwalle@kernel.org> # on kontron-sbc-i1200

-michael

--35992d9bcb644d4eacfa1e9e85c528ea0bce7a64169a83d15a45c664ea97
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZnFqGBEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+LnxAYDvi8NGKcq7QnyhgH61V4MgBsPbGi/ni6z7
nn8e3UxZOMcwQRRNDphL39CDLPKkw8kBfjA6cKY5YP8k+k9IXpaQujvbA4vOC7EE
PW5JBh2io2Yi2GnYe8xwA15I341VvtY/wA==
=dDOU
-----END PGP SIGNATURE-----

--35992d9bcb644d4eacfa1e9e85c528ea0bce7a64169a83d15a45c664ea97--
