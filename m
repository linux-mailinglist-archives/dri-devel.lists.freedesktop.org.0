Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6985F608DCC
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 17:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87A010E3B9;
	Sat, 22 Oct 2022 15:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C3A10E3B9
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Oct 2022 15:03:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WeRE1wRIaLsedBeOkdeefMtajKpnA4OwGPqTZE74NowQjv7QsHuyltQCeUk6ZY39kza0E+Ai/win896BKweMvZFSkEZQ1+Tnsmwuvio9oj+pSlo3l7SoBLgB3H75dfoExAQYzbvbqJREjODmxd+DBJETvHP77AuX2iaYoXYanqNWVU1JYf81UQBwfLaWl/pZY5jgac+EYOPb0JtJhplZQ7g5wWEsHgeBw8lmtA4ogEWLk3RdUXL0yemxM6za982D2sZ2uwvYmDntvWxRyIsC44JoMSgMI51Y4pu/0h0sWD/ghQpz40D9mRqTizFcH2260Zxa0of9/llvcBGV1kkp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyFLfTgaIeawzYoXGFa6+WrIg78ecDHJzzAgZxAEdl8=;
 b=QEc4mU4fBd2LLb1DgZrO8E3ZiFpdHr3Hzn+PPhNgbNaL8TGqrpZmxE99K0Tm4x7Nxy9Qzk/WglqIJTgz1M1JZVNFKmelOYe/UntfLCabXgobWw6yWmQvcEneS44kDjkwhWlt7B3IM0sHLmXLkc7fUX2WWdB+Rx2zOnhih0LfU5UMb5my36cX69OLN4O2UVxRwkq300kFCOn+LweXr/2zJqpSu6o1orQnhBsOxDcAi3mv1kb0hrWbJOfnZ8WHMARMB6X+Fc4sCPwYZaq14uq1Rsh9ktek7fEI8XCR6lLGMxaYTX+9F6/uGIXFdaR564y7cPRM6HVuBRXMSOsxLHdX+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyFLfTgaIeawzYoXGFa6+WrIg78ecDHJzzAgZxAEdl8=;
 b=QIuHXtizreb2qVWR5Ecafq/IXCxrtNY4iJP4lbpzL5VjxDlk+qqfGjCIZPipL5G4Sb2tUewiNexW/TTrr6fGLlmEWaLa4ZVvsjTsgVwPkyTyhEOMdNoOFoM+PH/YH3amlqL9rSfbAwyy9oX/kkbwaF6VXuHhg9XY+UO/Y54vVR4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB7802.jpnprd01.prod.outlook.com (2603:1096:604:179::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.38; Sat, 22 Oct
 2022 15:03:26 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fea0:9039:b0b3:968f]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::fea0:9039:b0b3:968f%7]) with mapi id 15.20.5746.021; Sat, 22 Oct 2022
 15:03:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH v2 02/10] drm: rcar-du: Add encoder lib support
Thread-Topic: [PATCH v2 02/10] drm: rcar-du: Add encoder lib support
Thread-Index: AQHYvu6mKF8h/geyTEijwnFD++q7fq4a0FGQ
Date: Sat, 22 Oct 2022 15:03:24 +0000
Message-ID: <OS0PR01MB5922419DBE20362680903DC1862C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220902170826.599262-1-biju.das.jz@bp.renesas.com>
 <20220902170826.599262-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220902170826.599262-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB7802:EE_
x-ms-office365-filtering-correlation-id: baf34d5c-7a0b-4090-3e99-08dab43e914a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zUfE83Wkywoxo4ZLvjxFT9srOy9K0c8Xm21dUms8Q+rLLS5BksNy2nDE22BZAdXWahZsMjNqfRUW5/mr0CN85qzYJL8kfLBxTWj/2Ry1Ay8sQlAsX9Wev/AIHYZbEfQ2vo7DPkmRg8zOpqHUh0mcv0QcpvQzY8ZzQD9cs0+JCsxw0HI/WuEdSIgcRxNDJNitnP+3JtgfVpxmGxxjh+NpcwXTaoJxr1RD3Q72Md95DyQywgQAJU5d25iqsvqm4SE+akMPZWTZ5GE32WRtvO2V/pmDvGnfFcJaJa8rsgkaAAXNcie9O4uwPeG9eeOLmron+4FR6+W3vOsv2i2/zOOxLvZhHT38VHrRyzgdFptGl/l506lZlL7afr0fXbGww4+b8HKoDLcbQ5nE/C3qOpAsPgOXG9dE7XwOc4KZ8Luhrxr+4wZU2xlqXld72RXkkoMcfTAF0ZhCOn+gF640N73VZtYuKPC3k+Ibl4l5RWOtuUSwkqWUGyPhFpef4ma4UQIQ3d6jY80pENdsmXDbzsg5HL6qv7r+hSYSye27Tgc2cyN44tZtKO2gy03uhuxU68NLqvSoMq4i2wmOFlyBAL02LgxzG2k78Fum1V+H+EZStBr6/GKsIPDDiPoEAZMxDikYS1pdi/sbocuP34ZSU0l6co0OxlanK/EGGQ0Bgv456vfsKrAHsqLu1qRq5S7vYCTR1oQBWYvNXXENTUzllX5GBREuoJeAJxdFANFm9IZraognLmYwSpDRAGnNLk20+enr9XiXtzVoUkEg0jLLpGS95Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199015)(86362001)(83380400001)(478600001)(71200400001)(107886003)(26005)(316002)(4326008)(8676002)(64756008)(7696005)(6506007)(41300700001)(9686003)(52536014)(8936002)(66446008)(66476007)(66556008)(66946007)(76116006)(110136005)(5660300002)(54906003)(55016003)(38100700002)(122000001)(33656002)(30864003)(2906002)(186003)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xfwiO9IxPmQJgQXHwGVMg54tOfx8Kx8q6MTsGCS3srTkW+arcR5bSHaYzItd?=
 =?us-ascii?Q?qLuxBv7GmAnX4LYv9r9cMFthvhhrIjLz+JQI6kL/Zi5zzMjwEWoFT1zMRm85?=
 =?us-ascii?Q?xmWk0YSMPVdnX3uihO5OFOWtxVBs41GcE+rBKZb9zZ5E9JcoGUvEi3OXu5wM?=
 =?us-ascii?Q?UPy/2rKLdl7TyHNGvSl2XvOIK+OjdRfv/x8N8EGAGqF6gRKn+yFElnkysdiT?=
 =?us-ascii?Q?p+beMgZlxtIlyDDRQj6NxNnjXt8VllB3xwrzekc2KAIF71Y6JH2VhroZMhsp?=
 =?us-ascii?Q?j14Rh58VBEv0pIk5MagqikQeJCrEoW8Q3YmuMyESVL92MpP1P+KnlZhHk1Er?=
 =?us-ascii?Q?6z5m+41Y0u1SDJfBcnDSqNSVm+ExmFwljyEZu+UY706/K4kyUOPQv/chiC/h?=
 =?us-ascii?Q?LCSzoZ7VsgxBdjKxorMdvChqa/eRZNhvWtdNpbW9Zwny1YZVRsOLbVhbmjV5?=
 =?us-ascii?Q?5jgsi9dDR7EvIgLQ1bbewqvJhn3r2sAh2kGA5j1+2GB1IDzs88rDPOA+6Kh4?=
 =?us-ascii?Q?p5pwLET60962vpKbLimOLmDLx6PsXyPZiUAf2UKGQ5vkbBKxTjzMzV/UWpBR?=
 =?us-ascii?Q?V73zJ1ya4Pzs1NOJVR6bG+QzryGbuZwYwGp7k2IvJX59EcmU+3e9TCi6u15e?=
 =?us-ascii?Q?hnrDoQqCGd46IM2156f5tzxLVC+f6Mp/V36jlR0vPPdAGbL+aYnZHU+YXrx+?=
 =?us-ascii?Q?aP4Z8iVciAW73TeLlATi5kIlAsApAZ0/rgj8YUzWzoAWG+MdC0LHkGCi9phY?=
 =?us-ascii?Q?+CYBNpH2ROt7q51Us8he8cFM2bjy/Ta3tEfgs6bnWtkniH7IC+7tJIxNA+NK?=
 =?us-ascii?Q?w2U+hTjIJsvt62TyOvEGwfplfZbS3ixQqe/nKxcl0eC8M5C9oFO06DKQbvV7?=
 =?us-ascii?Q?NK+/bJPAP583dTkGNBcFz4TyHdiqLCxgOIazPlazshJ8LM4kfLOeG9nEpho6?=
 =?us-ascii?Q?3z5rullfirqW4P2lMOKHThocUL+OMRx8SN+5W8QRbsB1tPAjFIigKO1UrbRx?=
 =?us-ascii?Q?Pqfk4eyulSSm02eKMKYdebs/C72xnOCOCCYc73EiQca0rcYiP6KpZN1yxjJO?=
 =?us-ascii?Q?dyqRX9C0NpmhKVjZ4GUN2RE2/EACVy6jUkEyHZGNGrfRRLg/tJha+rPnUSbQ?=
 =?us-ascii?Q?dmHNSoOrNzDK0+m2oIZtv8/AM/UfojxDB9CsJM0lZPc6tx2TngqURU7fIhmA?=
 =?us-ascii?Q?xaF91rBSsFoSeyy5Mr9KxwppIr1HBBSTWPqAgKXGMv7EKhqpINCERD+jeaxH?=
 =?us-ascii?Q?8LTW8oR31+vXaa8J0LSoaNkfndsn73NKuK6yo7X1Xk9kxIvvc0vsfB3ZXQW8?=
 =?us-ascii?Q?5d3SwVQVa8LfXHpe2LtZv6upNvXAhWc7whgBbrzbw44URFftcg/X2p/GF1xi?=
 =?us-ascii?Q?K2lLtT8efvZuaX3dP5+33X3aA911/3I0s8or+arGPiobrrHxLnR+CVSApxbq?=
 =?us-ascii?Q?scv3nzdx/xnigF79hxSVocjc/ykgLQSLq3xYcdh+5wzeDHlZplNqmclWgrF5?=
 =?us-ascii?Q?ONfFrSuG/RlYWr6XRNb30TeQNV4Wp0slhR+LSuGoIaES99OfC0gGgQlHFVWh?=
 =?us-ascii?Q?J0L8uiSP4V6xiE3sZUs2eZdwpg6Zp5GPDyV44kb1h52FjrCdlhRMdU9Omlih?=
 =?us-ascii?Q?bA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf34d5c-7a0b-4090-3e99-08dab43e914a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2022 15:03:24.4723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oqQrdrlJkpT21WRKncWIIHp3g9lVOQvywZs4fndCVEI1SrEaw+qo+veV8DsbH4Mcydr6/3crCYyaQRENOB95ZUH/sHcuuXBjUEvUOXd37C4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7802
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Gentle ping. Am I going in the right direction with this patch series?

I know I need to rebase these patches. Please review these patches and prov=
ide
some direction to move forward.

Cheers,
Biju


> Subject: [PATCH v2 02/10] drm: rcar-du: Add encoder lib support
>=20
> Add RCar DU encoder lib support by moving
> rcar_du_encoder_count_ports() and rcar_du_encoder_funcs to the lib
> file and added
> rcar_du_encoder_funcs() to share the common code between RCar and
> RZ/G2L DU encoder drivers.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Rebased on drm-misc-next and DU-next.
>  * Fixed the warning reported by bot.
> ---
>  drivers/gpu/drm/rcar-du/Kconfig               |   5 +
>  drivers/gpu/drm/rcar-du/Makefile              |   2 +
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c     | 117 +--------------
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.h     |  14 +-
>  drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c | 138
> ++++++++++++++++++  drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h |
> 30 ++++
>  6 files changed, 180 insertions(+), 126 deletions(-)  create mode
> 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h
>=20
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-
> du/Kconfig index 58ffb8c2443b..369af45b5ff9 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -71,3 +71,8 @@ config DRM_RCAR_WRITEBACK
>  	bool
>  	default y if ARM64
>  	depends on DRM_RCAR_DU
> +
> +config DRM_RCAR_LIB
> +	bool
> +	default y
> +	depends on DRM_RCAR_DU
> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-
> du/Makefile
> index b8f2c82651d9..479c8eebba5a 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -6,6 +6,8 @@ rcar-du-drm-y :=3D rcar_du_crtc.o \
>  		 rcar_du_kms.o \
>  		 rcar_du_plane.o \
>=20
> +rcar-du-drm-$(CONFIG_DRM_RCAR_LIB) +=3D rcar_du_encoder_lib.o
> +
>  rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+=3D rcar_du_vsp.o
>  rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) +=3D rcar_du_writeback.o
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index b1787be31e92..444cc956f692 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -2,7 +2,7 @@
>  /*
>   * R-Car Display Unit Encoder
>   *
> - * Copyright (C) 2013-2014 Renesas Electronics Corporation
> + * Copyright (C) 2013-2022 Renesas Electronics Corporation
>   *
>   * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
> @@ -10,128 +10,17 @@
>  #include <linux/export.h>
>  #include <linux/of.h>
>=20
> -#include <drm/drm_bridge.h>
> -#include <drm/drm_bridge_connector.h>
> -#include <drm/drm_panel.h>
> -
>  #include "rcar_du_drv.h"
>  #include "rcar_du_encoder.h"
> -#include "rcar_lvds.h"
>=20
>  /* ------------------------------------------------------------------
> -----------
>   * Encoder
>   */
>=20
> -static unsigned int rcar_du_encoder_count_ports(struct device_node
> *node) -{
> -	struct device_node *ports;
> -	struct device_node *port;
> -	unsigned int num_ports =3D 0;
> -
> -	ports =3D of_get_child_by_name(node, "ports");
> -	if (!ports)
> -		ports =3D of_node_get(node);
> -
> -	for_each_child_of_node(ports, port) {
> -		if (of_node_name_eq(port, "port"))
> -			num_ports++;
> -	}
> -
> -	of_node_put(ports);
> -
> -	return num_ports;
> -}
> -
> -static const struct drm_encoder_funcs rcar_du_encoder_funcs =3D { -};
> -
>  int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			 enum rcar_du_output output,
>  			 struct device_node *enc_node)
>  {
> -	struct rcar_du_encoder *renc;
> -	struct drm_connector *connector;
> -	struct drm_bridge *bridge;
> -	int ret;
> -
> -	/*
> -	 * Locate the DRM bridge from the DT node. For the DPAD outputs,
> if the
> -	 * DT node has a single port, assume that it describes a panel
> and
> -	 * create a panel bridge.
> -	 */
> -	if ((output =3D=3D RCAR_DU_OUTPUT_DPAD0 ||
> -	     output =3D=3D RCAR_DU_OUTPUT_DPAD1) &&
> -	    rcar_du_encoder_count_ports(enc_node) =3D=3D 1) {
> -		struct drm_panel *panel =3D of_drm_find_panel(enc_node);
> -
> -		if (IS_ERR(panel))
> -			return PTR_ERR(panel);
> -
> -		bridge =3D devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
> -							 DRM_MODE_CONNECTOR_DPI);
> -		if (IS_ERR(bridge))
> -			return PTR_ERR(bridge);
> -	} else {
> -		bridge =3D of_drm_find_bridge(enc_node);
> -		if (!bridge)
> -			return -EPROBE_DEFER;
> -
> -		if (output =3D=3D RCAR_DU_OUTPUT_LVDS0 ||
> -		    output =3D=3D RCAR_DU_OUTPUT_LVDS1)
> -			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] =3D bridge;
> -
> -		if (output =3D=3D RCAR_DU_OUTPUT_DSI0 ||
> -		    output =3D=3D RCAR_DU_OUTPUT_DSI1)
> -			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] =3D bridge;
> -	}
> -
> -	/*
> -	 * Create and initialize the encoder. On Gen3, skip the LVDS1
> output if
> -	 * the LVDS1 encoder is used as a companion for LVDS0 in dual-
> link
> -	 * mode, or any LVDS output if it isn't connected. The latter may
> happen
> -	 * on D3 or E3 as the LVDS encoders are needed to provide the
> pixel
> -	 * clock to the DU, even when the LVDS outputs are not used.
> -	 */
> -	if (rcdu->info->gen >=3D 3) {
> -		if (output =3D=3D RCAR_DU_OUTPUT_LVDS1 &&
> -		    rcar_lvds_dual_link(bridge))
> -			return -ENOLINK;
> -
> -		if ((output =3D=3D RCAR_DU_OUTPUT_LVDS0 ||
> -		     output =3D=3D RCAR_DU_OUTPUT_LVDS1) &&
> -		    !rcar_lvds_is_connected(bridge))
> -			return -ENOLINK;
> -	}
> -
> -	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %s\n",
> -		enc_node, rcar_du_output_name(output));
> -
> -	renc =3D drmm_encoder_alloc(&rcdu->ddev, struct rcar_du_encoder,
> base,
> -				  &rcar_du_encoder_funcs,
> DRM_MODE_ENCODER_NONE,
> -				  NULL);
> -	if (!renc)
> -		return -ENOMEM;
> -
> -	renc->output =3D output;
> -
> -	/* Attach the bridge to the encoder. */
> -	ret =3D drm_bridge_attach(&renc->base, bridge, NULL,
> -				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> -	if (ret) {
> -		dev_err(rcdu->dev,
> -			"failed to attach bridge %pOF for output %s (%d)\n",
> -			bridge->of_node, rcar_du_output_name(output), ret);
> -		return ret;
> -	}
> -
> -	/* Create the connector for the chain of bridges. */
> -	connector =3D drm_bridge_connector_init(&rcdu->ddev, &renc->base);
> -	if (IS_ERR(connector)) {
> -		dev_err(rcdu->dev,
> -			"failed to created connector for output %s (%ld)\n",
> -			rcar_du_output_name(output), PTR_ERR(connector));
> -		return PTR_ERR(connector);
> -	}
> -
> -	return drm_connector_attach_encoder(connector, &renc->base);
> +	return rcar_du_lib_encoder_init(rcdu, output, enc_node,
> +					rcar_du_output_name(output));
>  }
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
> b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
> index e5ec8fbb3979..d33b684fe93f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.h
> @@ -2,7 +2,7 @@
>  /*
>   * R-Car Display Unit Encoder
>   *
> - * Copyright (C) 2013-2014 Renesas Electronics Corporation
> + * Copyright (C) 2013-2022 Renesas Electronics Corporation
>   *
>   * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
>   */
> @@ -10,17 +10,7 @@
>  #ifndef __RCAR_DU_ENCODER_H__
>  #define __RCAR_DU_ENCODER_H__
>=20
> -#include <drm/drm_encoder.h>
> -
> -struct rcar_du_device;
> -
> -struct rcar_du_encoder {
> -	struct drm_encoder base;
> -	enum rcar_du_output output;
> -};
> -
> -#define to_rcar_encoder(e) \
> -	container_of(e, struct rcar_du_encoder, base)
> +#include "rcar_du_encoder_lib.h"
>=20
>  int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			 enum rcar_du_output output,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c
> b/drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c
> new file mode 100644
> index 000000000000..534d357cfbe2
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * R-Car Display Unit Encoder Lib
> + *
> + * Copyright (C) 2013-2022 Renesas Electronics Corporation
> + *
> + * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
> + */
> +
> +#include <linux/export.h>
> +#include <linux/of.h>
> +
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
> +#include <drm/drm_panel.h>
> +
> +#include "rcar_du_drv.h"
> +#include "rcar_du_encoder.h"
> +#include "rcar_lvds.h"
> +
> +/*
> +---------------------------------------------------------------------
> --
> +------
> + * Encoder
> + */
> +
> +static unsigned int rcar_du_encoder_count_ports(struct device_node
> +*node) {
> +	struct device_node *ports;
> +	struct device_node *port;
> +	unsigned int num_ports =3D 0;
> +
> +	ports =3D of_get_child_by_name(node, "ports");
> +	if (!ports)
> +		ports =3D of_node_get(node);
> +
> +	for_each_child_of_node(ports, port) {
> +		if (of_node_name_eq(port, "port"))
> +			num_ports++;
> +	}
> +
> +	of_node_put(ports);
> +
> +	return num_ports;
> +}
> +
> +static const struct drm_encoder_funcs rcar_du_encoder_funcs =3D { };
> +
> +int rcar_du_lib_encoder_init(struct rcar_du_device *rcdu,
> +			     enum rcar_du_output output,
> +			     struct device_node *enc_node,
> +			     const char *output_name)
> +{
> +	struct rcar_du_encoder *renc;
> +	struct drm_connector *connector;
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	/*
> +	 * Locate the DRM bridge from the DT node. For the DPAD outputs,
> if the
> +	 * DT node has a single port, assume that it describes a panel
> and
> +	 * create a panel bridge.
> +	 */
> +	if ((output =3D=3D RCAR_DU_OUTPUT_DPAD0 ||
> +	     output =3D=3D RCAR_DU_OUTPUT_DPAD1) &&
> +	    rcar_du_encoder_count_ports(enc_node) =3D=3D 1) {
> +		struct drm_panel *panel =3D of_drm_find_panel(enc_node);
> +
> +		if (IS_ERR(panel))
> +			return PTR_ERR(panel);
> +
> +		bridge =3D devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
> +							 DRM_MODE_CONNECTOR_DPI);
> +		if (IS_ERR(bridge))
> +			return PTR_ERR(bridge);
> +	} else {
> +		bridge =3D of_drm_find_bridge(enc_node);
> +		if (!bridge)
> +			return -EPROBE_DEFER;
> +
> +		if (output =3D=3D RCAR_DU_OUTPUT_LVDS0 ||
> +		    output =3D=3D RCAR_DU_OUTPUT_LVDS1)
> +			rcdu->lvds[output - RCAR_DU_OUTPUT_LVDS0] =3D bridge;
> +
> +		if (output =3D=3D RCAR_DU_OUTPUT_DSI0 ||
> +		    output =3D=3D RCAR_DU_OUTPUT_DSI1)
> +			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] =3D bridge;
> +	}
> +
> +	/*
> +	 * Create and initialize the encoder. On Gen3, skip the LVDS1
> output if
> +	 * the LVDS1 encoder is used as a companion for LVDS0 in dual-
> link
> +	 * mode, or any LVDS output if it isn't connected. The latter may
> happen
> +	 * on D3 or E3 as the LVDS encoders are needed to provide the
> pixel
> +	 * clock to the DU, even when the LVDS outputs are not used.
> +	 */
> +	if (rcdu->info->gen >=3D 3) {
> +		if (output =3D=3D RCAR_DU_OUTPUT_LVDS1 &&
> +		    rcar_lvds_dual_link(bridge))
> +			return -ENOLINK;
> +
> +		if ((output =3D=3D RCAR_DU_OUTPUT_LVDS0 ||
> +		     output =3D=3D RCAR_DU_OUTPUT_LVDS1) &&
> +		    !rcar_lvds_is_connected(bridge))
> +			return -ENOLINK;
> +	}
> +
> +	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %s\n",
> +		enc_node, rcar_du_output_name(output));
> +
> +	renc =3D drmm_encoder_alloc(&rcdu->ddev, struct rcar_du_encoder,
> base,
> +				  &rcar_du_encoder_funcs,
> DRM_MODE_ENCODER_NONE,
> +				  NULL);
> +	if (!renc)
> +		return -ENOMEM;
> +
> +	renc->output =3D output;
> +
> +	/* Attach the bridge to the encoder. */
> +	ret =3D drm_bridge_attach(&renc->base, bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret) {
> +		dev_err(rcdu->dev,
> +			"failed to attach bridge %pOF for output %s (%d)\n",
> +			bridge->of_node, output_name, ret);
> +		return ret;
> +	}
> +
> +	/* Create the connector for the chain of bridges. */
> +	connector =3D drm_bridge_connector_init(&rcdu->ddev, &renc->base);
> +	if (IS_ERR(connector)) {
> +		dev_err(rcdu->dev,
> +			"failed to created connector for output %s (%ld)\n",
> +			output_name, PTR_ERR(connector));
> +		return PTR_ERR(connector);
> +	}
> +
> +	return drm_connector_attach_encoder(connector, &renc->base); }
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h
> b/drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h
> new file mode 100644
> index 000000000000..29fcc7cc12db
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder_lib.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * R-Car Display Unit Encoder Lib
> + *
> + * Copyright (C) 2013-2022 Renesas Electronics Corporation
> + *
> + * Contact: Laurent Pinchart (laurent.pinchart@ideasonboard.com)
> + */
> +
> +#ifndef __RCAR_DU_ENCODER_LIB_H__
> +#define __RCAR_DU_ENCODER_LIB_H__
> +
> +#include <drm/drm_encoder.h>
> +
> +struct rcar_du_device;
> +
> +struct rcar_du_encoder {
> +	struct drm_encoder base;
> +	enum rcar_du_output output;
> +};
> +
> +#define to_rcar_encoder(e) \
> +	container_of(e, struct rcar_du_encoder, base)
> +
> +int rcar_du_lib_encoder_init(struct rcar_du_device *rcdu,
> +			     enum rcar_du_output output,
> +			     struct device_node *enc_node,
> +			     const char *output_name);
> +
> +#endif /* __RCAR_DU_ENCODER_LIB_H__ */
> --
> 2.25.1

