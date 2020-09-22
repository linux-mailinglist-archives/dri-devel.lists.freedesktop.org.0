Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28951275290
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CEA6E456;
	Wed, 23 Sep 2020 07:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1410110.outbound.protection.outlook.com [40.107.141.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32DE89F75
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 11:01:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ax86WpBJyi/OUfn9FC6skJSe44ISl5T/GF2nxTV1dfHCgSj98ilCgwVlu+39oE+a7ULR8xfWf2/RDHn+zAf4Ju0YYgE18Euc24yuCEv09f2r+o8K8kuAbbQAUiIPimLbR3yJ5FQquFGIlsayrKwNUX4LWA8YS9Xv0Ne3KX/0ZVki2yBJYJE/GlzQu0jZ3gfJWp+W+rpehvgNFSDRSLQsB7MbCjPzRRep+5CyOo/nzuXuWidAeUYp0Y4hNWAVEPFij6m7iJAGXKm5u3tUavlT0JgtalggjF6a/r+cdQ9CJxL0a4h/m9BssghwBVCpNqVutzVI+kiMI1KPFrhCYYhoKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvZzfI0EAzwDnGijqJqCZ53EXq3Rw0tzwrQD+WL2uDA=;
 b=jBnoaLhRv1lrMeV6wBuMRoPOIVBWlsJoqZLXlgDjzQMHaXc2FfZbeoJJzaCLpOSNslK5GbiaZq0xOsYPLkZ1rWxUWLpY74bP+59z6dp5s++RKWycrAUJwve1aHTHkXp1zLUryATNpd5GyFAbr61sQ9F/XNjrUzksgTcYdcPWDzf3Q/qG/MTxIIJyN/VT2ZW4ffsIWQLEbdF1Vdx9SK2upEA+4gJ9Wcgjq1NDWNkcYnMhfKxV0dFoL79lyh9MdZbSAgq8CXJjcXCX3/YLDnrUpbFScZjgq5/VzQO9igwpBK5GS8tAMqdt5MwEfqZVUdOwOWL/bo9woBdIj4/j6cgmkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvZzfI0EAzwDnGijqJqCZ53EXq3Rw0tzwrQD+WL2uDA=;
 b=A+uT2RfkgxBWZ1cDI/CHiCMMSXiyBNgQvgMNW7G8TDq2Yj3ktuZ9KsFcb/3w8JCDDCl/3a+gGxQO2uqrzuigARpDkEBbncIBMab6mbFbQ3xF+JtILooC/UzppYI+ok0AoDd032joZZhTgGj52FhZVihstcglyIHh3ZJneDZ1jTE=
Received: from OS0PR01MB5300.jpnprd01.prod.outlook.com (2603:1096:604:a3::12)
 by OS0PR01MB5426.jpnprd01.prod.outlook.com (2603:1096:604:96::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Tue, 22 Sep
 2020 11:01:51 +0000
Received: from OS0PR01MB5300.jpnprd01.prod.outlook.com
 ([fe80::299d:3952:4ffc:31ad]) by OS0PR01MB5300.jpnprd01.prod.outlook.com
 ([fe80::299d:3952:4ffc:31ad%5]) with mapi id 15.20.3391.026; Tue, 22 Sep 2020
 11:01:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3] drm/bridge: lvds-codec: Add support for regulator
Thread-Topic: [PATCH v3] drm/bridge: lvds-codec: Add support for regulator
Thread-Index: AQHWkM76/jGpsPjEXkKsonm7MZkvwal0fYGw
Date: Tue, 22 Sep 2020 11:01:51 +0000
Message-ID: <OS0PR01MB5300DCD7AC601699F1879A54863B0@OS0PR01MB5300.jpnprd01.prod.outlook.com>
References: <20200922105526.5252-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200922105526.5252-1-laurent.pinchart+renesas@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a8ec5440-1bce-49d6-4bd9-08d85ee6e8f7
x-ms-traffictypediagnostic: OS0PR01MB5426:
x-microsoft-antispam-prvs: <OS0PR01MB5426A745E4231F85564999CC863B0@OS0PR01MB5426.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J2g4FxxmFH0qQxM8yGDgBgHXOVfOUtlkTlUJMbZCcxREZj8KaoKOVKQaLoxTPrYAbRq6i1dfGGoOxn+ymKyaL2APPjw4EyNfV4kSVSXEX7iJeT+/AdHDCOnU1f2/AwYD2pNA4Y7QX4MsWwZricTjmc3fJVrD3vd4UytJHvNvd9+27ITJDDRu75p9BOmU16lT/OD0DYo7J27jyaD/jeNXkA5aVLK6YDgsl7TUDzb+y4CJBJk+yT0+aUmTHziKpFzrfrV4aZHua36wHvjpRGhDGY2oDo9xoxKpNfJZST42USZQwHKTLUGocDSO8TNh6FQu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5300.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(64756008)(8676002)(186003)(26005)(316002)(54906003)(478600001)(4326008)(110136005)(52536014)(55016002)(66446008)(66476007)(2906002)(66556008)(71200400001)(66946007)(86362001)(6506007)(33656002)(7696005)(76116006)(8936002)(5660300002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: xZ+TSmxNgrEVdf5Lc5tBncuW/gfnoeuBWDVaP75rmUcPYjnQb1vokhWGjMEgLZa//IxAODPUcBbmuhqWDK+yos03YcEvNQj+Aiwd1HeOaLSYrG8jh4C/fgnC0y452FRoVb1wq456QC2N2g3a/4xzzpDa2NVHDqXp/dz9BoLFMnDMFL4iKiTzg8GBQWXtwESv3UlakYMKm6Ye93SBAlgYdrpZorkOjFgnIwxphI5DXvMMY4lbva4fLiIO47U/IUDQ4AxGmJXvUXZdlmOuf6eRgbHnBbs7iGoI89Q2sxFOfsPgT8yurLwoYLfOZ0Jut9f51Jw7A+lrRZxumNLsxTL4Cn8ZNZMHu+4VALjQ5eT65nLHUEz7ZRxAN91cXitutXVcczDgsZK9qYDW8Ga35VtveSXw4RanU/J7kbbpAAgLS/mTouEF0iJljpVWaX92fElc/Fsm3n0idTsahbL3QtHWeJsWeayAnhNKQjaLux6ZaRYNPsrfgCXFi6P6i7Yo1Pcssoy5YZ/frvm/Nqf9qLUUDyWYz0GSvBSTv6LAW6d3n8CoaWZjawuLJRLxepb7Z3WBF9AnFPSZcsklOWqvRNumSbzOC99DA/zy18VlBvLQAuMoPGCGUFC7vcf5ULcINELaHMguryBM3nDIKrPXOcISXA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5300.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8ec5440-1bce-49d6-4bd9-08d85ee6e8f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 11:01:51.5093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GA8QS6OW5gZjj3yWunVQ1cJxCFh3+R+Cc7MGLHRYaqSlTJd2wRvBSncQFQXbW+E5pMpHJcYXfbY+RTBK12FtSZWm95WVRhGik+vuBio7fTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5426
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:20 +0000
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for the patch.

> Subject: [PATCH v3] drm/bridge: lvds-codec: Add support for regulator
>
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the support for enabling optional regulator that may be used as VCC
> source.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> [Replaced 'error' variable with 'ret']
> [Renamed regulator from 'vcc' to 'power']
> Signed-off-by: Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> Changes since v2:
>
> - Use the correct regulator name
> ---
>  drivers/gpu/drm/bridge/lvds-codec.c | 29
> +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/lvds-codec.c
> b/drivers/gpu/drm/bridge/lvds-codec.c
> index f19d9f7a5db2..f52ccffc1bd1 100644
> --- a/drivers/gpu/drm/bridge/lvds-codec.c
> +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> @@ -10,13 +10,16 @@
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_panel.h>
>
>  struct lvds_codec {
> +struct device *dev;
>  struct drm_bridge bridge;
>  struct drm_bridge *panel_bridge;
> +struct regulator *vcc;
>  struct gpio_desc *powerdown_gpio;
>  u32 connector_type;
>  };
> @@ -38,6 +41,14 @@ static int lvds_codec_attach(struct drm_bridge
> *bridge,  static void lvds_codec_enable(struct drm_bridge *bridge)  {
>  struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
> +int ret;
> +
> +ret = regulator_enable(lvds_codec->vcc);
> +if (ret) {
> +dev_err(lvds_codec->dev,
> +"Failed to enable regulator \"vcc\": %d\n", ret);
> +return;
> +}
>
>  if (lvds_codec->powerdown_gpio)
>  gpiod_set_value_cansleep(lvds_codec->powerdown_gpio,
> 0); @@ -46,9 +57,15 @@ static void lvds_codec_enable(struct drm_bridge
> *bridge)  static void lvds_codec_disable(struct drm_bridge *bridge)  {
>  struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
> +int ret;
>
>  if (lvds_codec->powerdown_gpio)
>  gpiod_set_value_cansleep(lvds_codec->powerdown_gpio,
> 1);
> +
> +ret = regulator_disable(lvds_codec->vcc);
> +if (ret)
> +dev_err(lvds_codec->dev,
> +"Failed to disable regulator \"vcc\": %d\n", ret);
>  }
>
>  static const struct drm_bridge_funcs funcs = { @@ -63,12 +80,24 @@ static
> int lvds_codec_probe(struct platform_device *pdev)
>  struct device_node *panel_node;
>  struct drm_panel *panel;
>  struct lvds_codec *lvds_codec;
> +int ret;
>
>  lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
>  if (!lvds_codec)
>  return -ENOMEM;
>
> +lvds_codec->dev = &pdev->dev;
>  lvds_codec->connector_type =
> (uintptr_t)of_device_get_match_data(dev);
> +
> +lvds_codec->vcc = devm_regulator_get(lvds_codec->dev, "power");
> +if (IS_ERR(lvds_codec->vcc)) {
> +ret = PTR_ERR(lvds_codec->vcc);
> +if (ret != -EPROBE_DEFER)
> +dev_err(lvds_codec->dev,
> +"Unable to get \"vcc\" supply: %d\n", ret);
> +return ret;
> +}
> +
>  lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev,
> "powerdown",
>
> GPIOD_OUT_HIGH);
>  if (IS_ERR(lvds_codec->powerdown_gpio))
> --
> Regards,
>
> Laurent Pinchart



Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, 40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldorf, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WEEE reg. no.: DE 14978647
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
