Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308AD2913F2
	for <lists+dri-devel@lfdr.de>; Sat, 17 Oct 2020 21:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117C26E218;
	Sat, 17 Oct 2020 19:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400097.outbound.protection.outlook.com [40.107.140.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8616E201
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Oct 2020 16:08:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afFiLeGLHKyF4epEhCX9UO4iPJ06P54zU8stnQbzoj+5ps/FE4fg8RLi+13GZBzJbEhEY+LKM6hgj4HkozF/Z2oFDpodH6iCJgbbJ2Ca0xprYN78ym3tLlKBKoIoQQeoF8CcLl4DNWlAvCweNb/Lul3TnWVb2JvRt/rkuK4WfuQWpfes1Ovi8d4HjcQaillyHhS0IosJcRkXDUGY/fCh3eEJLL+saJC9pXsOB6/cqTL+27LVDxrpKyYyMAqv9TFPo0Muq6Mv2MrGoRIEUTjPVnLUS+JmtdfHGHOOFRUEsdc/HRtFfg0Qf2msFZgS65jugP8scq09FtULSMXTyF1RAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r9w2xxLiLFpHtnO0wNuLnuldbHsPA9gFfh1weOS4k0=;
 b=LP2mK0SzLLqiRSdacTXPS6rfhR3pPJduHnOJgtoMOa6ttSPsUpEAckJgywyX+9MOAgwkDtncIiIvN9Qx0ZlR0usE1Ok2UL823q/W4ES07zG+xZCHlIe73Eq/GBz1eTmPFLAxbTDHpCmh8vYRCo/HU3IYPkHkpagxLSFxNyB77owJKu80bj0UMgRK0S5LpKyyPytPeubFMfIe/2MU3Npl9vqu8kPKy6IrlKeubzqA8pOw4CS/UiNolUe+yaca1+bWg/1DmV/c7Zwgi2Zt5H7Utp5Tdego36sREjTzro9rjyJOI20G2YUi29BOijM5Z2BzH2kvo/tAIxXLo7SKDbIUKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r9w2xxLiLFpHtnO0wNuLnuldbHsPA9gFfh1weOS4k0=;
 b=RpoDmJuOFfYi8KKrWXaEa7Yh6ggzy5oIAA4TFXNXpUmBjiKrXLj/801zAeCRW67xwr6OhKgLt4nH4EN8i6zgh9fMypU45f4OhqZNPE9ZWV1IO6RRaHQtC6No6LTA8pM9dz0jazXMmlwB36xc58l5/YxquGY7PNSBIBA71B/wNBY=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TYXPR01MB1773.jpnprd01.prod.outlook.com
 (2603:1096:403:11::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Sat, 17 Oct
 2020 16:08:29 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84%4]) with mapi id 15.20.3477.028; Sat, 17 Oct 2020
 16:08:29 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sam Ravnborg <sam@ravnborg.org>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>
Subject: RE: [PATCH v3] drm/bridge: lvds-codec: Add support for regulator
Thread-Topic: [PATCH v3] drm/bridge: lvds-codec: Add support for regulator
Thread-Index: AQHWkM76/jGpsPjEXkKsonm7MZkvwama3jWAgAE/dSA=
Date: Sat, 17 Oct 2020 16:08:28 +0000
Message-ID: <TYBPR01MB5309A7393BADCF462577188986000@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200922105526.5252-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201016210419.GD1496366@ravnborg.org>
In-Reply-To: <20201016210419.GD1496366@ravnborg.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ravnborg.org; dkim=none (message not signed)
 header.d=none;ravnborg.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [109.154.85.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 231a7d65-2845-4acd-9c86-08d872b6e314
x-ms-traffictypediagnostic: TYXPR01MB1773:
x-microsoft-antispam-prvs: <TYXPR01MB177376B23966C137742BA92F86000@TYXPR01MB1773.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L/WOR5DddXh8Em5HwHGaAV81FO+Rwb2yyzcF63jQnj4gE7Z1K0cW/RMw5y7kGKA6ARPPfzYlGtNqGWpTXrCy9BjZ8cELwQTx6PZtcqQI1vZ50xGd4LyYDPaOAYZme5QUU7XLsG9L49JoC//yI8Vm5FjxMgr2GjdytEwM5aiYcA7MURFjaGXOJ+gkXVuNLRI5mEOamgmjpj0rhwpEFX27hvaWExWaPjEUrOQR1sLyen509PJ+SjFpwXcpEbtiBO/pYAOxxpM3GUeuOXl2kgWMRuQqAFsCdAnSvGoXDUUEZ8Axmqf8Amajp9LomCUgVMPmd277LY0WxBiH4GKAt0P6TwYY3F5qkGmcwrSOwYCJH14=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYBPR01MB5309.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39850400004)(136003)(346002)(7696005)(5660300002)(6506007)(9686003)(52536014)(316002)(8936002)(478600001)(110136005)(966005)(54906003)(76116006)(4326008)(26005)(8676002)(66556008)(64756008)(66476007)(66446008)(186003)(2906002)(55016002)(86362001)(33656002)(66946007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 5aGQsJQEBTHWzg5tkSpu6js/XZVfBIlX0pTfobjNC2+pCvcjGj5TbnMECGn1N4VthLpucIVolETCBFUxYkFZnbwKpixve3FUixxZECeJHlF+Fwkps1ttqX9f0xPJ7K/Tw0e+dOG/oySbjxZBnzkkatXXkHlXz7hfpUcFs8IGVNdd2rvZT5nXpNqnh9dN2c1D8REODnCphdChXTSParmGMVzT2hA/zvvS3AqY3lcLC33Zw9dWr2C/Cz+K/HT93fO+7rBIzputHgDpzbt9l1+GLacqIlC7kvFtjj73zUs4aXYg0Nw9jGPmt9N/0MePyaRWqCkoU07Bao9v8amNkp2JyqBdlPaDjps6iPny0HXvUiAGVjwvUzaqrEQzQ5Z9yeJPTQ3xGstB8w5TYodAGIu2w2oh7z9V27hT+gMEH5sGcQ53azHVVPjdttCpPEEcZQgxXhzaRUhGdXZCpsgjOIIQbfK5tHn9/kRt4/py8t/ABE7NzV+j9UOJIGzBnROVShvla9JFjRAMbtprcdhlDpWS0qcJ9zymyc0yuqJCEmMpi18rK/Ors8OwVPynvo1t3gJFmFoOkcyCeIcHuaVJrjhtd0rlmJ6DNxN5Vec8K4jCtXzhWNYvH5YE+FfyPUgkKMZ9rHFfUOUqGBIROrejolpUBg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231a7d65-2845-4acd-9c86-08d872b6e314
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2020 16:08:28.9351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /BFWwTX6EQOPBUQ3uLTUupIY4S2M1Ielit5MqnhOixKkFUxe3v2JJmaGQAGnx5QRNx/q8+8T5vTkNADc1+SGX1s0Tqelt3a+sNzfKlhfNkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1773
X-Mailman-Approved-At: Sat, 17 Oct 2020 19:04:47 +0000
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
 Andrzej Hajda <a.hajda@samsung.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

> Subject: Re: [PATCH v3] drm/bridge: lvds-codec: Add support for regulator
> 
> Hi Biju, Laurent
> 
> On Tue, Sep 22, 2020 at 01:55:26PM +0300, Laurent Pinchart wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add the support for enabling optional regulator that may be used as
> > VCC source.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > [Replaced 'error' variable with 'ret'] [Renamed regulator from 'vcc'
> > to 'power']
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Applied to drm-misc-next.
> Biju, could you make a follow-up patch that introduces dev_err_probe()
> where appropriate? I did not fix up the code but this was a good candidate.

Ok, sure will do.

Thanks,
Biju
> 
> 	Sam
> 
> > ---
> > Changes since v2:
> >
> > - Use the correct regulator name
> > ---
> >  drivers/gpu/drm/bridge/lvds-codec.c | 29
> > +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/lvds-codec.c
> > b/drivers/gpu/drm/bridge/lvds-codec.c
> > index f19d9f7a5db2..f52ccffc1bd1 100644
> > --- a/drivers/gpu/drm/bridge/lvds-codec.c
> > +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> > @@ -10,13 +10,16 @@
> >  #include <linux/of_device.h>
> >  #include <linux/of_graph.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/regulator/consumer.h>
> >
> >  #include <drm/drm_bridge.h>
> >  #include <drm/drm_panel.h>
> >
> >  struct lvds_codec {
> > +	struct device *dev;
> >  	struct drm_bridge bridge;
> >  	struct drm_bridge *panel_bridge;
> > +	struct regulator *vcc;
> >  	struct gpio_desc *powerdown_gpio;
> >  	u32 connector_type;
> >  };
> > @@ -38,6 +41,14 @@ static int lvds_codec_attach(struct drm_bridge
> > *bridge,  static void lvds_codec_enable(struct drm_bridge *bridge)  {
> >  	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
> > +	int ret;
> > +
> > +	ret = regulator_enable(lvds_codec->vcc);
> > +	if (ret) {
> > +		dev_err(lvds_codec->dev,
> > +			"Failed to enable regulator \"vcc\": %d\n", ret);
> > +		return;
> > +	}
> >
> >  	if (lvds_codec->powerdown_gpio)
> >  		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio,
> 0); @@ -46,9
> > +57,15 @@ static void lvds_codec_enable(struct drm_bridge *bridge)
> > static void lvds_codec_disable(struct drm_bridge *bridge)  {
> >  	struct lvds_codec *lvds_codec = to_lvds_codec(bridge);
> > +	int ret;
> >
> >  	if (lvds_codec->powerdown_gpio)
> >  		gpiod_set_value_cansleep(lvds_codec->powerdown_gpio,
> 1);
> > +
> > +	ret = regulator_disable(lvds_codec->vcc);
> > +	if (ret)
> > +		dev_err(lvds_codec->dev,
> > +			"Failed to disable regulator \"vcc\": %d\n", ret);
> >  }
> >
> >  static const struct drm_bridge_funcs funcs = { @@ -63,12 +80,24 @@
> > static int lvds_codec_probe(struct platform_device *pdev)
> >  	struct device_node *panel_node;
> >  	struct drm_panel *panel;
> >  	struct lvds_codec *lvds_codec;
> > +	int ret;
> >
> >  	lvds_codec = devm_kzalloc(dev, sizeof(*lvds_codec), GFP_KERNEL);
> >  	if (!lvds_codec)
> >  		return -ENOMEM;
> >
> > +	lvds_codec->dev = &pdev->dev;
> >  	lvds_codec->connector_type =
> > (uintptr_t)of_device_get_match_data(dev);
> > +
> > +	lvds_codec->vcc = devm_regulator_get(lvds_codec->dev, "power");
> > +	if (IS_ERR(lvds_codec->vcc)) {
> > +		ret = PTR_ERR(lvds_codec->vcc);
> > +		if (ret != -EPROBE_DEFER)
> > +			dev_err(lvds_codec->dev,
> > +				"Unable to get \"vcc\" supply: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> >  	lvds_codec->powerdown_gpio = devm_gpiod_get_optional(dev,
> "powerdown",
> >
> GPIOD_OUT_HIGH);
> >  	if (IS_ERR(lvds_codec->powerdown_gpio))
> > --
> > Regards,
> >
> > Laurent Pinchart
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
