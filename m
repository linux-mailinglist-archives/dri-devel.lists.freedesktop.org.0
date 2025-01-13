Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4798A0B1D9
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9739610E5B8;
	Mon, 13 Jan 2025 08:57:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="W60aA9aI";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LZdr2CBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8281910E5B8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1736758672; x=1768294672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Tbo5YrOw2H/3ruPHWEWAeiN8rdU9wVeQI9EvOOOmwNo=;
 b=W60aA9aIz5XeBjKNWKG8eVJHpS9+Qf/4aUvPysNVg7H0Iirf8OVy6mw9
 exeGVj5slPdBk8tJb4jspEQvaLvz6jaf8uWXufZtDopBDUvT/nRuwoWtm
 MuM0S1mTE0RcZX2TshyJARn9cLwRbc+FMJcncwr2yDzE7Zn7aPFh25wWT
 VDZuih7ttrsLZ083zckKtZAlw4h3pfB2fI+BqPAvcQrQBPLzvVrLt8Twl
 TPDb3yGndt54H3telDoiLr2PZX0DS8gC93+7uUmqQCdl1dN2c9N30UWz4
 arK+iwkPQ8YOWcS2Kpg9sExk1wQ8tK99LxG2TMIk/Gn/qC4T4eM4cqMQr Q==;
X-CSE-ConnectionGUID: r6C6qALjSYCdz8g3LMnIHg==
X-CSE-MsgGUID: iTW4TdugQM6ZWsGwJfs2uA==
X-IronPort-AV: E=Sophos;i="6.12,310,1728943200"; d="scan'208";a="41010458"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 13 Jan 2025 09:57:50 +0100
X-CheckPoint: {6784D58E-24-3C670366-E45AD810}
X-MAIL-CPID: 454A88758688CF77A57FFEA4212AB19F_4
X-Control-Analysis: str=0001.0A682F17.6784D58E.00AF, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C44D416B92E; Mon, 13 Jan 2025 09:57:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1736758666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tbo5YrOw2H/3ruPHWEWAeiN8rdU9wVeQI9EvOOOmwNo=;
 b=LZdr2CBlejpULzspz8QRDz4idx1VWuBMwPS8FhWiLZYZQeGear7/p4Mz4kf1ag+6tf/F97
 hXfLVT+M7qMV5xVSOLgjqAJ3/bECAt3QA3hx9OKCVPJ3w2+6UNaowWQtelH5QWvNvILz7V
 DPvG1jh3YxmmH1ow2k606eX5Oc9uGocMu1b49jNzVNNOf4TYSMX6CO5xeDqXmK5TBcHoMp
 g0FPyBVAWTN8gv5PROTOeid4bIGxw3CoKlINPY7D77uIA/jpzQXomOgrwrUWnXQGZ+FBCo
 B7CNXGFHBQ0NWbbLwUhh1yykm7aaxUNuJK8p3ZWlx0/2PHEkw5yebRvfHAlm5w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guido =?ISO-8859-1?Q?G=FAnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: nwl-dsi: Allow 'data-lanes'
 property for port@1
Date: Mon, 13 Jan 2025 09:57:43 +0100
Message-ID: <5856132.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250110161733.2515332-1-Frank.Li@nxp.com>
References: <20250110161733.2515332-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
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

Hi Frank,

Am Freitag, 10. Januar 2025, 17:17:32 CET schrieb Frank Li:
> This controller support scalable data lanes from 1 to 4. Add the
> 'data-lanes' property to configure the number of MIPI display panel lanes
> selected for boards.
>=20
> Change $ref of port@1 from 'port' to 'port-base' and add 'endpoint'
> property referencing video-interfaces.yaml. Allow 'data-lanes' values
> 1, 2, 3, and 4 for port@1.
>=20
> Fix below CHECK_DTB warnings:
> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb:
>  dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allo=
wed ('data-lanes' was unexpected)
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I've had a similar patch WIP. Looks good to me. For the record I based
my local change according to commit 54df4868fb728 ("dt-bindings:
samsung,mipi-dsim: Use port-base reference")

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Change from v1 to v2
> - Add the reason why need 'data-lanes' property in commit message.
> ---
>  .../bindings/display/bridge/nwl-dsi.yaml       | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yam=
l b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> index 350fb8f400f02..5952e6448ed47 100644
> --- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> @@ -111,11 +111,27 @@ properties:
>          unevaluatedProperties: false
> =20
>        port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
>          description:
>            DSI output port node to the panel or the next bridge
>            in the chain
> =20
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                description: array of physical DSI data lane indexes.
> +                minItems: 1
> +                items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +
>      required:
>        - port@0
>        - port@1
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


