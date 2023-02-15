Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3526977A9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 08:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBDF10EA49;
	Wed, 15 Feb 2023 07:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC8A10EA49
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 07:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676447732; x=1707983732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WflJ5FrfNUOX+nPHvzKmR7kLVTUVtVMrv41kl6P0qxU=;
 b=W+GaYUT6QKU7cs1KmpJ/pzbP5giG9m/qguwL9P9t6GCBoK62SQuAKReh
 SH1M0MPWtvj6Y2SQew5WvfLGaGDiY0c1zTIQZoKDMBqxNBzL+BUzpm4E8
 z4M5HMbPB3FPzs4flJZ/6aLLrSLonLT44H4vjyZwi2K47H4/caPy5zbjb
 agZnJ/6PZdoxx0vwBk8cWsLiAtX5scoZ13smdCT7SvOWAwN+QEUJXeHot
 JBiy9XrV9MGYCKg8OlXEU5VugCsDa2mCbcP/gr0SWN7QGcosOkLTBRx20
 VzYhzz2fcQN+qXVXA/yh+SuzoPWd5aii8i1fW0FobVpb0vjZL9WZ++S2E g==;
X-IronPort-AV: E=Sophos;i="5.97,299,1669071600"; d="scan'208";a="29090210"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 15 Feb 2023 08:55:30 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 15 Feb 2023 08:55:30 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 15 Feb 2023 08:55:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676447730; x=1707983730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WflJ5FrfNUOX+nPHvzKmR7kLVTUVtVMrv41kl6P0qxU=;
 b=Md17VaT0uRLL47mX9Cc00x2sTgqY2xxRMnQ/TDGd1j29ZmMjAJeOXqeS
 5VBly5sRCCcCtwLb9kmxDAtZJdfaeA9PwB/53Z9cfGvsbsk9NwzogzZeX
 hpH564XxPMLDiTOw4NhaScJdrhXvDPt2G+iWWbRwEppHHYcOFJ6XyLt5V
 5AsOrcLB2vgZkIR4Zd3w113UEYBbCwylaK3F4sV6FdeW49GgcLCn7BGqR
 NKEtOf6NmPWUMXRsPunPIHdVgxL8ohboVIe/OpKrNSNgbs1+deghsvtYg
 n1xjUeGP2WbYwj6toYsfHxW2QjSV9qnCKk8vwYBoRlGSoPtR03Cir9gMw Q==;
X-IronPort-AV: E=Sophos;i="5.97,299,1669071600"; d="scan'208";a="29090209"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 15 Feb 2023 08:55:30 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 79EAD280056;
 Wed, 15 Feb 2023 08:55:30 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 6/6] drm: lcdif: Add i.MX93 LCDIF compatible string
Date: Wed, 15 Feb 2023 08:55:28 +0100
Message-ID: <45316988.fMDQidcC6G@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230213085612.1026538-7-victor.liu@nxp.com>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
 <20230213085612.1026538-7-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: marex@denx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

thanks for the update.

Am Montag, 13. Februar 2023, 09:56:12 CET schrieb Liu Ying:
> With all previous preparations done to make it possible for the
> single LCDIF embedded in i.MX93 SoC to drive multiple displays
> simultaneously, add i.MX93 LCDIF compatible string as the last
> step of adding i.MX93 LCDIF support.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * Fix a trivial typo in commit message.
>=20
> v1->v2:
> * Split from patch 2/2 in v1. (Marek, Alexander)
>=20
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> b/drivers/gpu/drm/mxsfb/lcdif_drv.c index eb6c265fa2fe..48c43b273a4a 1006=
44
> --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> @@ -249,6 +249,7 @@ static const struct drm_driver lcdif_driver =3D {
>=20
>  static const struct of_device_id lcdif_dt_ids[] =3D {
>  	{ .compatible =3D "fsl,imx8mp-lcdif" },
> +	{ .compatible =3D "fsl,imx93-lcdif" },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, lcdif_dt_ids);

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


