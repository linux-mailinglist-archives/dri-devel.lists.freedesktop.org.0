Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC506697758
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 08:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E215B10EA3A;
	Wed, 15 Feb 2023 07:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C7910EA3A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676445980; x=1707981980;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1+BNIE0i1dEK/uDSABMSpkeF8y7fSo07sIK227mq4hc=;
 b=CYa1U0p9SLoNcwMr+38HqBfG00JAPWFpMhHHgUZwfb7ed5fpHylZmkIa
 aA6UDix2IGtQzgC4f0MVFcwyVzoxblgBztPY0GDTCXDr5aOW04gHrFgjT
 Ld9PzoSsH45u2lj6c0reVB6rHu19wNuao6cPALIrCsAHKSVDNEvlSxE4m
 EGpegAK3nKgLCUCc5nUyN3Tx0RvjwluCiCg2JpGCyRyE3FfdOWynXyXez
 Sllke0Egqvg046sZRZLvdOVg0Ka1uzjpwRHWdIUTN08vTjP6cY5v7Zi0w
 Yv+YdcpO/0eL4Puur05U4AREXkUAn6LvxH08exOlLBc/KbOMEGtt+IoBF w==;
X-IronPort-AV: E=Sophos;i="5.97,299,1669071600"; d="scan'208";a="29089230"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 15 Feb 2023 08:26:18 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 15 Feb 2023 08:26:18 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 15 Feb 2023 08:26:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1676445978; x=1707981978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1+BNIE0i1dEK/uDSABMSpkeF8y7fSo07sIK227mq4hc=;
 b=cu0/bptZbw+Dv5TBOS0mrdI/r3GN9WeAcchDDl2pW08SCGO48jKn/rdE
 /gLQIMTYroCrc8l00eBOb6i0VtPVDKZQzGh/2xmEpGu+cBVdll8oRzI5U
 1kiM66FtD+jZU4WFMdTnNq1LacG6qtpwgWtjgi6ZMC+MopCXnlZwev72V
 rVXBhGQsRIbiOK+bs2rhfjIL2Q5OHqbZyLSR2Y713lkElQQZN4ahAqxas
 f7hbdj8WTcU7fFJlLS6zvKIm+oZJdJJ7/N8helyh+puNuASA5zINCJUEs
 Nt517mSCc0hyx/QiCa4U8SicshxrWC/N9qJme+7TQEHhIMzdj0Gfu8LF4 g==;
X-IronPort-AV: E=Sophos;i="5.97,299,1669071600"; d="scan'208";a="29089229"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 15 Feb 2023 08:26:18 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 21827280056;
 Wed, 15 Feb 2023 08:26:18 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: lcdif: Add i.MX93 LCDIF support
Date: Wed, 15 Feb 2023 08:26:16 +0100
Message-ID: <2551514.Lt9SDvczpP@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230213085612.1026538-2-victor.liu@nxp.com>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
 <20230213085612.1026538-2-victor.liu@nxp.com>
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

Am Montag, 13. Februar 2023, 09:56:07 CET schrieb Liu Ying:
> There is one LCDIF embedded in i.MX93 SoC to connect with
> MIPI DSI controller through LCDIF cross line pattern(controlled
> by mediamix blk-ctrl) or connect with LVDS display bridge(LDB)
> directly or connect with a parallel display through parallel
> display format(also controlled by mediamix blk-ctrl).  i.MX93
> LCDIF IP is essentially the same to i.MX8MP LCDIF IP.  Add device
> tree binding for i.MX93 LCDIF.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Marek Vasut <marex@denx.de>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2->v3:
> * No change.
>=20
> v1->v2:
> * Add Krzysztof's A-b and Marek's R-b tags on patch 1/6.
>=20
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml index
> 75b4efd70ba8..fc11ab5fc465 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -21,6 +21,7 @@ properties:
>            - fsl,imx28-lcdif
>            - fsl,imx6sx-lcdif
>            - fsl,imx8mp-lcdif
> +          - fsl,imx93-lcdif
>        - items:
>            - enum:
>                - fsl,imx6sl-lcdif
> @@ -88,7 +89,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: fsl,imx8mp-lcdif
> +            enum:
> +              - fsl,imx8mp-lcdif
> +              - fsl,imx93-lcdif
>      then:
>        properties:
>          clocks:
> @@ -107,6 +110,7 @@ allOf:
>                enum:
>                  - fsl,imx6sx-lcdif
>                  - fsl,imx8mp-lcdif
> +                - fsl,imx93-lcdif
>      then:
>        properties:
>          clocks:
> @@ -123,6 +127,7 @@ allOf:
>                - fsl,imx8mm-lcdif
>                - fsl,imx8mn-lcdif
>                - fsl,imx8mp-lcdif
> +              - fsl,imx93-lcdif
>      then:
>        required:
>          - power-domains

I would have expected that fsl,imx93-lcdif supports up to 3 endpoints (MIPI=
=20
DSI, LVDS, and parallel) in a 'ports' subnode. But this binding only suppor=
ts=20
a single 'port' sub-node. Also an example for this case might be very helpf=
ul.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


