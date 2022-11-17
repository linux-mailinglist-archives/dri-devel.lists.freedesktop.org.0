Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E615062DD68
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 14:58:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F3110E5FF;
	Thu, 17 Nov 2022 13:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5C110E5FF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 13:58:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 845E9929;
 Thu, 17 Nov 2022 14:58:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668693525;
 bh=F/PXghRd2nxT1V0/7HUgMybNjJ/obgm+pmJHVW4RhzY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=mD0IfArmPzSJwtAaeZONVvCp1cmr8GWAAcZBlEMckvPQLJsSXF7FLDdVt/jugrP6h
 +dUKj1Tm+NMGlmMZldTYN+ws5ZxfkhO2waXHbSzCK1993PRPKNa5jz9f9B+5ABhEBm
 YDDQZMY8IlJjs3q8dbxPDwKp3nneg5lmNU8CJtLg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221117122547.809644-3-tomi.valkeinen@ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-3-tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v1 2/8] dt-bindings: display: bridge: renesas,
 dsi-csi2-tx: Add r8a779g0
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Thu, 17 Nov 2022 13:58:42 +0000
Message-ID: <166869352250.50677.2977989172989256731@Monstersaurus>
User-Agent: alot/0.10
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tomi Valkeinen (2022-11-17 12:25:41)
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>=20
> Extend the Renesas DSI display bindings to support the r8a779g0 V4H.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  .../bindings/display/bridge/renesas,dsi-csi2-tx.yaml           | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi=
-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,ds=
i-csi2-tx.yaml
> index afeeb967393d..bc3101f77e5a 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-t=
x.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-t=
x.yaml
> @@ -11,13 +11,14 @@ maintainers:
> =20
>  description: |
>    This binding describes the MIPI DSI/CSI-2 encoder embedded in the Rene=
sas
> -  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, wi=
th up
> +  R-Car V3U/V4H SoC. The encoder can operate in either DSI or CSI-2 mode=
, with up

That's 81 chars I think ... so perhaps the 'up' should go 'down' a line
... but hey it's one char, I don't care too much, but I can't resist an
up/down reference :D

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>    to four data lanes.
> =20
>  properties:
>    compatible:
>      enum:
>        - renesas,r8a779a0-dsi-csi2-tx    # for V3U
> +      - renesas,r8a779g0-dsi-csi2-tx    # for V4H
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.34.1
>
