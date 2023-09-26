Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C6F7AE456
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 05:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA7910E09C;
	Tue, 26 Sep 2023 03:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2040.outbound.protection.outlook.com [40.107.7.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7705B10E09C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 03:55:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHSekSS8mO1JAbno/KhUa96RbouG49GjOo/XvxQk1F3UULWYy14XQa3KUInXlYVsBYZHscs9GMF9Dq8OvudFX2OKxLcIx/ULwp+kMCXBA+BjPWgR2NUr/3IQ7nTK3e0W3axHN+np8qcB3hfCUqZZYgVQzmC6vgbKGbZliKWBw6QnrwNjN9TE54wPbTOMpwo+9iVPBaUGBqsVjiX6ZuyQH/porw0XdDHOduGFKbciPRRi+e8Cntn4dgnZcc0Yf4T3u53QZ9oKOBoyNFgeMrsFmVNwgInUXM4zakNQQwfg3DGIZd0ez/PtxgSAiRCO/K9OcaGiiY2tYdtxnJMO0XfpTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeXxeGiMHUpi3mwMXqkb9HzRlDeC1+MK+KsC713d6/8=;
 b=ccM6xCIC9/mFXqR1Ij1FXygXQLWvGDxBQkbo6hAub9IPMfk59N7RfFIHV6HBBVH96xfO9M5eRywhpg90T2SLG2aa3cCt7VPOX5XAELz1okGyLxw4RZyrZjd+IT6UWRqffRlL6Z8FYn7/a6enUt8zogs9YrU0Tl95EAtQ6WFeLjL49iUC2vl/PlQeT7JpSkgop7+gUGHlAdCUJxN1Gfi3swWppEsUQJuSY917OhhVaHHN7hr4VECOq4rwnHpZjij2OIJbODNP5HpHfp5XSceGMTKi4dZ8NiUsM2J4kVdLJXHkD3mpYUn3kWrQdfBxAJKNZipmwzXpAnecsHNDa/q7jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeXxeGiMHUpi3mwMXqkb9HzRlDeC1+MK+KsC713d6/8=;
 b=oJYC1vyAyEedb5mjQhOBI686BQn3piz318KUemRX+Hb/wl2qvEFBwpvZNECDTfc3xlODdhLrG/5DrnycIzTjV00FfmDy7widXDEorigmyM7r0H2iESQXQcvCFuMC0mjVtOSEu4UeqwGuFWiqiUoukPB5STxnbmrd855CA9lG58g=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9791.eurprd04.prod.outlook.com (2603:10a6:10:4ce::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 03:55:36 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b%3]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 03:55:35 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v14 RESEND 5/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Thread-Topic: [PATCH v14 RESEND 5/6] drm/imx: Introduce i.MX8qm/qxp DPU DRM
Thread-Index: AQHZ1NaBVuCZngaloEG5niC6UwZ9La/2RzoAgBVKgbCAAGz/AIAgjpoQ
Date: Tue, 26 Sep 2023 03:55:35 +0000
Message-ID: <AM7PR04MB7046F751A0DFA165B23417E098C3A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230822085949.816844-1-victor.liu@nxp.com>
 <20230822085949.816844-6-victor.liu@nxp.com>
 <22parqvy44hkd2ypkglfwk6bafi5ov4qfhpvd6qnt36us7odec@iebwnwtwvnnf>
 <AM7PR04MB704659DF09143D0C6777143098E8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <uqu5h3ai7jz5mgh67aip7bxmhygvqqzblr4yzc3npp67m47ggc@6kqnsqwhd4hd>
In-Reply-To: <uqu5h3ai7jz5mgh67aip7bxmhygvqqzblr4yzc3npp67m47ggc@6kqnsqwhd4hd>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|DB9PR04MB9791:EE_
x-ms-office365-filtering-correlation-id: 272d168c-7cbd-40f8-fc87-08dbbe447069
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aBihF7snXqwfK4ep1QgK5EP9zbvl1xc8GByZq+DF9E4Ujo/6W1OjKsgk4to4eqmeJMmX8isTlgWEgkzCZiSPAfVUCoeSMisAHGsjZN1Ymb4SdRHd8Ku//3h3PnUiVYRjVBJLQLeW6sAkR49xwqYgIsAKf8MFlTYScOxKAJiZ9hQVZy3IAhaEI9l4WQN4/uofycyVeHqz6I8qPl8DKExNHw1a9k/qHkf+TmSBpbg4lCKZWwUr9VoKo0kT1FtluurZ8NycM8tf9UrZu+6i9lhrl5Prfvb64K7dA2QuyKT4aSApXiCipdonhpthqhptEgVSX/t4RmyOFOUbojrSToJ+JsFM3zAdcJZDdu/aTeZiarueVl5hypuULRItODkUQCHdlgpwaFQycUGwNPxi6J+k2kilmXL3VV3tSi0k4pI6TF3IcS4oLx1xZJmdIKlW6tIq1y3MbiPg+LPyZ46si1fTKrZgBVLXBAuyblyIveAEgFU/3mvzfGq/6rCdYThmHasITJeuSQ5evyoMew1ZBaUb43ziYgr9dH/nPPCre9Zwjou0QmSkXxCTVOapr4IPSrX77olecAOBIcE87xlBkRFGHi8a+YvG5RLICZWNZhr51SSit4cvHZbTQ10FygtXQjrs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(186009)(1800799009)(451199024)(26005)(71200400001)(478600001)(45080400002)(966005)(83380400001)(86362001)(38100700002)(38070700005)(33656002)(5660300002)(53546011)(55016003)(6506007)(122000001)(7696005)(9686003)(66556008)(66476007)(64756008)(66946007)(66446008)(76116006)(54906003)(316002)(6916009)(2906002)(7416002)(30864003)(52536014)(41300700001)(4326008)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JdbbGADRCj2OR48vm2HsgefoPFII/mhHz7Q9I33Atc3OVnf1O1au/2bQ9J?=
 =?iso-8859-1?Q?TGgnixrlBQf/86qW2IL07zXgtMuiGR+ZWJpCDK9EGHdl3VNeAcww+D3Uq3?=
 =?iso-8859-1?Q?5wDXLTUYEEQIpAyMs3LXbTqpTsdl1v8LSuKEPP2I9w0ROye6kEATEdYcMJ?=
 =?iso-8859-1?Q?bpw7Ig3doBIhJgE8Jv+z/acnzh4HQ6P8mmoRNt9HkAzgqlFEOyXGm6TDOp?=
 =?iso-8859-1?Q?P8RIskK8A0XfCzrCg6ReehqqdVcwAJvDHG+OnjdCyLlNEG5X/oWLeiXgNg?=
 =?iso-8859-1?Q?LEeNZM/keHHHd9S7Mjw1Ov7/uuSzIP3H57ZgCyvd8yetKZxzjTdbPPLUWX?=
 =?iso-8859-1?Q?JShPp7cgSPVodNyjErEXFLCQMrmsI41TF6JDsjHYCm4UAACAhbNDaMkWP7?=
 =?iso-8859-1?Q?HYL/Gj9PKlrq325w1JnRW7vwMv8lUBntCk3JsbdatwkGelSrCMFuto83G7?=
 =?iso-8859-1?Q?3x6N9AA2pGSG7TScvnRI+M6K0ba9kouFmbTkYmcPdQht2CpBOaHb120D5V?=
 =?iso-8859-1?Q?oMwDl2AkKzdezdnF9TCmBJ4IBkQMRJtEeyRTGovYK8mBdPDq27LkNY5zjC?=
 =?iso-8859-1?Q?7zCtOMn0dP7f9/NEV5wQQ6ZFlr5xGxDkcbL3s9muHKuhe+iVqdhRjDM/nm?=
 =?iso-8859-1?Q?FaEY/z+moLYum/tEr+0NxSRkXDate2EEIW9K8d/SPTRLekLBEtSprvjBiv?=
 =?iso-8859-1?Q?VvXn3fkJUBQUKQV0+q9DjlarHpRkkDlPXaPSWTCo5PaR6aOeQxISm+ZQx0?=
 =?iso-8859-1?Q?rXoBIz3DOqNcCp622Htm0CcxwkDska0qkd928dflpWjm+oMUXlTmpTFAC8?=
 =?iso-8859-1?Q?3HxELjCF3Vmu84F8jTFm/HqUWgnSmNReLyDZRibVjsNDanS/fJdYY/C/GD?=
 =?iso-8859-1?Q?ErAR9x9Ip7E0g6kL0Li5WaaIyGZo302bk5e/t1SRFde6I9DXeVeJEiH+Ja?=
 =?iso-8859-1?Q?YpbaeD/ep/JU5Y3g1yG618r5lBzKI8IC2P8lgh+cqbIliWB3Jm/QYDh+HV?=
 =?iso-8859-1?Q?7QFrvKHVbUK6WRSEtqvptgljc2sKUOoH951Rlb4x0DIAFUZDgORdve8qUZ?=
 =?iso-8859-1?Q?S4+3UFt7GrnbltqGw0JM5whHOS199Iot0RxsMyyZLevEeX4jWbeft/hxBh?=
 =?iso-8859-1?Q?O8yk/oBJU+diVqaHgUAt1ddVjp7/KI8bpW47TGShhG2fIkXqolpUhAfsHt?=
 =?iso-8859-1?Q?UhnOOCPpl7I5lg/A3fEDq1bv0/5eceLZdx6NQewPM7lGzZ80EOXSLudawE?=
 =?iso-8859-1?Q?fxmueEXy0Zztwa3gewDvp80xAxT3vEwHV/WdEJzKYVBs3TCDDgOsbiGUlc?=
 =?iso-8859-1?Q?qAvCs77Z01cftPkeggDNbs+RdrXJdnsm7M5Z2Sthao1xDPDZH8r1FGqPOa?=
 =?iso-8859-1?Q?iEZy8fISGw3+BZn5ZTTpTPjxOpwYWHh358NiYZAMkWS1coX6fp3d4QoyBz?=
 =?iso-8859-1?Q?B6Hn23pc6GAxjGEMokbnpKswIwxqgKrgIcHTFsgHwNGXYIwA2OiIzfNzc5?=
 =?iso-8859-1?Q?fkQrDeNDLS3LAVAjIIGsek84OgGEQO44pdoTAg4MWvEBmtkz4jpKRDd+VQ?=
 =?iso-8859-1?Q?0/FlZvzICXuqArFrNnghZxEOa1oGPN/blUJUr/+OFTBDgTyC6V/6ay/r+L?=
 =?iso-8859-1?Q?5n/Wsf45NZIs8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272d168c-7cbd-40f8-fc87-08dbbe447069
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 03:55:35.6071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p3oAwVHRavrjZB/bQa5hAo7jy93QkZOQDwEHGcd+5r7OfIsogCkSrsBfRqExYHhU2OoGbo/IS400wpIakFFS0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9791
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "Laurentiu Palcu \(OSS\)" <laurentiu.palcu@oss.nxp.com>,
 =?iso-8859-1?Q?Guido_G=FCnther?= <guido.gunther@puri.sm>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, September 5, 2023 4:37 PM, Maxime Ripard <mripard@kernel.org> w=
rote:
> On Tue, Sep 05, 2023 at 03:32:47AM +0000, Ying Liu wrote:
> > > On Tue, Aug 22, 2023 at 04:59:48PM +0800, Liu Ying wrote:
> > > > +int dpu_cf_init(struct dpu_soc *dpu, unsigned int index,
> > > > +		unsigned int id, enum dpu_unit_type type,
> > > > +		unsigned long pec_base, unsigned long base)
> > > > +{
> > > > +	struct dpu_constframe *cf;
> > > > +
> > > > +	cf =3D devm_kzalloc(dpu->dev, sizeof(*cf), GFP_KERNEL);
> > > > +	if (!cf)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	dpu->cf_priv[index] =3D cf;
> > >
> > > You can't store structures related to KMS in a device managed structu=
re.
> > > The DRM KMS device will stick around (and be accessible from userspac=
e)
> > > after the device has been removed until the last application closed i=
ts
> > > file descriptor to the device.
> >
> > The DRM device is registered after component_bind_all() is called in
> > dpu_drm_bind().  The CRTC components' platform devices are created
> > in the dpu_core_probe() where the device managed resources are
> > created.   So, it looks those resources are safe because the DRM device
> > will be unregistered before those resources are freed.
>=20
> Not, it's not, because the KMS device isn't freed when devices will be
> unbound/removed, but when the last application closes its fd to it, and
> so you'll get dangling pointers.
>=20
> The general rule to get it right is to use drmm for anything but device
> resources (like clocks, regulators, memory mapping, etc.). You can
> deviate from the rule, of course, but you'll need a long and clear
> explanation on why it doesn't work, and why your new approach works.
> Your current approach doesn't though.

I'll try to follow the rule in next version. Will call drmm_kzalloc() inste=
ad of
devm_kzalloc() here.

>=20
> > > This can be checked by enabling KASAN and manually unbinding the
> driver
> > > through sysfs.
> >
> > I enabled KASAN and manually unbound the dpu-core driver with
> command:
> >
> > echo 56180000.dpu > /sys/bus/platform/drivers/dpu-
> core/56180000.dpu/driver/unbind
> >
> > KASAN didin't report memory issue regarding those device managed
> > resources.  However, it did report another issue in dpu_drm_unbind(),
> > where drm_device should be got from drv_data->drm_dev instead of
> > dev_get_drvdata(dev).  I'll fix that in next version.
> >
> > BTW, the dpu-core driver was successfully bound again after unbinding
> with
> > command:
> >
> > echo  56180000.dpu > /sys/bus/platform/drivers/dpu-core/bind
>=20
> Guess you're lucky. That doesn't make it safe or right.
>=20
> > > > +	cf->pec_base =3D devm_ioremap(dpu->dev, pec_base, SZ_16);
> > > > +	if (!cf->pec_base)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	cf->base =3D devm_ioremap(dpu->dev, base, SZ_32);
> > > > +	if (!cf->base)
> > > > +		return -ENOMEM;
> > >
> > > For the same reason, you need to protect any access to a device manag=
ed
> > > resource (so clocks, registers, regulators, etc.) by a call to
> > > drm_dev_enter/drm_dev_exit and you need to call drm_dev_unplug
> instead
> > > of drm_dev_unregister.
> >
> > That's a good point. I've tried to do that, but it turns out that the
> > display controller cannot be enabled again after binding the dpu-core
> > driver manually again. It seems that the display controller requires a
> > proper disablement procedure, but the "driver instance overview " kdoc
> > mentions the shortcoming of no proper disablement if drm_dev_unplug()
> > is used:
> >
> > """
> > * Drivers that want to support device unplugging (USB, DT overlay unloa=
d)
> should
> >  * use drm_dev_unplug() instead of drm_dev_unregister(). The driver mus=
t
> protect
> >  * regions that is accessing device resources to prevent use after they=
're
> >  * released. This is done using drm_dev_enter() and drm_dev_exit(). The=
re
> is one
> >  * shortcoming however, drm_dev_unplug() marks the drm_device as
> unplugged before
> >  * drm_atomic_helper_shutdown() is called. This means that if the disab=
le
> code
> >  * paths are protected, they will not run on regular driver module unlo=
ad,
> >  * possibly leaving the hardware enabled.
> > """
> >
> > A DPU reset in dpu_core() might be helpful, but I'm not sure if there i=
s any
> > reset line provided by the embodying system.
>=20
> Generally speaking, you shouldn't rely on the device being in any
> particuliar state before your driver loads. So a reset at probe/bind
> time is a good idea.

Yes. I'll drop the platform device creations for CRTCs from dpu-core.c=20
and drop the aggregation of CRTC components from different DPU
instances into one DRM device.  This way, there will be only two CRTCs
of one DPU in one DRM device. Then, the driver will be simpler and
users cannot unbind the driver of one of the two DPU instances, which
means drm_dev_unplug() won't be needed any more(?) and the reset
issue will be gone.  The controller will be shutdown properly through
drm_atomic_helper_shutdown() when the driver module is removed.

>=20
> > Even if the reset works, the 2nd DPU instance in i.MX8qm would be a
> > problem, because it won't be reset or properly disabled if the 1st DPU
> > instance is unbound.
>=20
> Why it wouldn't be reset?

Because dpu_core_remove() is not called for the 2nd DPU instance.
Anyway, with the above new design, this doesn't seem to be a problem
any more.

>=20
> > Although the two DPU instances could be wrapped by two DRM devices, I
> > tend not to do that because downstream bridges in future SoCs might be
> > able to mux to different DPU instances at runtime.
> >
> > Due to the disablement issue, can we set drm_dev_enter/exit/unplug
> > aside first?
>=20
> I'd rather have that figured out prior to merging.

I'm assuming that drm_dev_enter/exit/unplug won't be needed with the above
new design - one DPU instance wrapped by one DRM device.

> > >
> > > > +static int dpu_crtc_pm_runtime_put(struct dpu_crtc *dpu_crtc)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	ret =3D pm_runtime_put(dpu_crtc->dev->parent);
> > > > +	if (ret < 0)
> > > > +		dpu_crtc_err(&dpu_crtc->base,
> > > > +			     "failed to put parent device RPM: %d\n", ret);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static void dpu_crtc_mode_set_nofb(struct drm_crtc *crtc)
> > > > +{
> > > > +	struct dpu_crtc *dpu_crtc =3D to_dpu_crtc(crtc);
> > > > +	struct drm_display_mode *adj =3D &crtc->state->adjusted_mode;
> > > > +	enum dpu_link_id cf_link;
> > > > +
> > > > +	dpu_crtc_dbg(crtc, "mode " DRM_MODE_FMT "\n",
> > > DRM_MODE_ARG(adj));
> > > > +
> > > > +	/* request power-on when we start to set mode for CRTC */
> > > > +	dpu_crtc_pm_runtime_get_sync(dpu_crtc);
> > >
> > > From the drm_crtc_helper_funcs documentation:
> > >
> > > """
> > > 	 * Note that the display pipe is completely off when this function i=
s
> > > 	 * called. Atomic drivers which need hardware to be running before
> > > they
> > > 	 * program the new display mode (e.g. because they implement
> > > runtime PM)
> > > 	 * should not use this hook. This is because the helper library call=
s
> > > 	 * this hook only once per mode change and not every time the
> display
> > > 	 * pipeline is suspended using either DPMS or the new "ACTIVE"
> > > property.
> > > 	 * Which means register values set in this callback might get reset
> > > when
> > > 	 * the CRTC is suspended, but not restored.  Such drivers should
> > > instead
> > > 	 * move all their CRTC setup into the @atomic_enable callback.
> > > """
> >
> > I can use drm_atomic_helper_commit_tail() but not
> > drm_atomic_helper_commit_tail_rpm() because the planes need to be
> > updated prior to modeset_enables(where trigger shadow registers in
> > plane's HW resources to take effect).   Using the former one means that
> > RPM needs to be get/put in drm_atomic_helper_commit_planes(), which
> > doesn't seem good because in some cases the power of the display
> controller
> > might be lost after RPM put and I'm not sure if the registers set there=
 will
> > be lost or not.   So, to avoid the issue the documentation mentions,
> > crtc_state->mode_changed is forced to be true in dpu_crtc_atomic_check(=
)
> > if the CRTC is changed to active.  Is this acceptable?
>=20
> No, just move the crtc setup to atomic_enable like the doc suggests.

Ok, will do.

>=20
> > > > +static void dpu_crtc_atomic_enable(struct drm_crtc *crtc,
> > > > +				   struct drm_atomic_state *state)
> > > > +{
> > > > +	struct dpu_crtc *dpu_crtc =3D to_dpu_crtc(crtc);
> > > > +	unsigned long flags;
> > > > +
> > > > +	drm_crtc_vblank_on(crtc);
> > > > +
> > > > +	enable_irq(dpu_crtc->dec_shdld_irq);
> > > > +	enable_irq(dpu_crtc->ed_cont_shdld_irq);
> > > > +	enable_irq(dpu_crtc->ed_safe_shdld_irq);
> > > > +
> > > > +	dpu_fg_enable_clock(dpu_crtc->fg);
> > > > +	dpu_ed_pec_sync_trigger(dpu_crtc->ed_cont);
> > > > +	dpu_ed_pec_sync_trigger(dpu_crtc->ed_safe);
> > > > +	if (crtc->state->gamma_lut)
> > > > +		dpu_crtc_set_gammacor(dpu_crtc);
> > > > +	else
> > > > +		dpu_crtc_disable_gammacor(dpu_crtc);
> > > > +	dpu_fg_shdtokgen(dpu_crtc->fg);
> > > > +
> > > > +	/* don't relinquish CPU until TCON is set to operation mode */
> > > > +	local_irq_save(flags);
> > > > +	preempt_disable();
> > > > +	dpu_fg_enable(dpu_crtc->fg);
> > >
> > > That's super fishy. You shouldn't need that, at all. What is going on
> > > there?
> >
> > This aims to fully workaround the below errata recently released by
> > NXP.
> >
> > ERR010910: DC: Display Subsystem First Frame Programming Restriction
> > Link:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.
> nxp.com%2Fdocs%2Fen%2Ferrata%2FIMX8_1N94W.pdf&data=3D05%7C01%7C
> victor.liu%40nxp.com%7C1250637791414caf559b08dbadeb597e%7C686ea1d
> 3bc2b4c6fa92cd99c5c301635%7C0%7C1%7C638294998555649537%7CUnkno
> wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h
> aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DmKAtsgN30jqfUiczAFe3
> dXPUZOXhM%2Fnlq9%2F%2B%2F8%2Bjj24%3D&reserved=3D0
> >
> > In short, to make sure the display controller can be enabled properly w=
ith
> > prefetch engine(DPRC + PRG), the TCON must be switch from bypass mode
> > to operation mode after FrameGen(FG) generates the first frame.
> >
> > Timing is critical here, so local irq and preemption are disabled durin=
g the
> > switch procedure.
> >
> > BTW, the driver always use prefetch engines for KMS, although they can
> > be bypassed.
>=20
> Ok. So I think it would help your driver getting merged to split that
> workaround into a separate patch. It's hard to tell what are the
> implications of that workaround on your driver when it's lost in the
> middle of, well, the driver :)
>=20
> I guess it would be much easier for everyone if you submitted that
> driver without the errata handling, or with prefetch bypassed, at first.
> And then you can submit / rework the hard parts.

Ok, I'll drop the prefetch engine support and the errata handling.
Also, I'll drop add-on features, like gamma, csc and alpha, to achieve
kind of minimal feature set.

>=20
> > >
> > > > +
> > > > +	/*
> > > > +	 * TKT320590:
> > >
> > > Those are NXP internal references as far as as I can tell. They
> > > shouldn't be here.
> >
> > Ok, will change it to be ERR010910.
>=20
> A link to the errata description would be a good idea too.

Ok, will add a link when errata handling is supported.

>=20
> > > > +static void dpu_atomic_put_plane_state(struct drm_atomic_state
> *state,
> > > > +				       struct drm_plane *plane)
> > > > +{
> > > > +	int index =3D drm_plane_index(plane);
> > > > +
> > > > +	plane->funcs->atomic_destroy_state(plane, state-
> >planes[index].state);
> > > > +	state->planes[index].ptr =3D NULL;
> > > > +	state->planes[index].state =3D NULL;
> > > > +	state->planes[index].old_state =3D NULL;
> > > > +	state->planes[index].new_state =3D NULL;
> > > > +
> > > > +	drm_modeset_unlock(&plane->mutex);
> > > > +
> > > > +	dpu_plane_dbg(plane, "put state\n");
> > > > +}
> > > > +
> > > > +static void dpu_atomic_put_crtc_state(struct drm_atomic_state *sta=
te,
> > > > +				      struct drm_crtc *crtc)
> > > > +{
> > > > +	int index =3D drm_crtc_index(crtc);
> > > > +
> > > > +	crtc->funcs->atomic_destroy_state(crtc, state->crtcs[index].state=
);
> > > > +	state->crtcs[index].ptr =3D NULL;
> > > > +	state->crtcs[index].state =3D NULL;
> > > > +	state->crtcs[index].old_state =3D NULL;
> > > > +	state->crtcs[index].new_state =3D NULL;
> > > > +
> > > > +	drm_modeset_unlock(&crtc->mutex);
> > > > +
> > > > +	dpu_crtc_dbg(crtc, "put state\n");
> > > > +}
> > > > +
> > > > +static void
> > > > +dpu_atomic_put_possible_states_per_crtc(struct drm_crtc_state
> > > *crtc_state)
> > > > +{
> > > > +	struct drm_atomic_state *state =3D crtc_state->state;
> > > > +	struct drm_crtc *crtc =3D crtc_state->crtc;
> > > > +	struct drm_plane *plane;
> > > > +	struct drm_plane_state *old_plane_state, *new_plane_state;
> > > > +	struct dpu_plane_state *old_dpstate, *new_dpstate;
> > > > +
> > > > +	drm_atomic_crtc_state_for_each_plane(plane, crtc_state) {
> > > > +		old_plane_state =3D drm_atomic_get_old_plane_state(state,
> > > plane);
> > > > +		new_plane_state =3D drm_atomic_get_new_plane_state(state,
> > > plane);
> > > > +
> > > > +		old_dpstate =3D to_dpu_plane_state(old_plane_state);
> > > > +		new_dpstate =3D to_dpu_plane_state(new_plane_state);
> > > > +
> > > > +		/* Should be enough to check the below HW plane resources.
> > > */
> > > > +		if (old_dpstate->stage.ptr !=3D new_dpstate->stage.ptr ||
> > > > +		    old_dpstate->source !=3D new_dpstate->source ||
> > > > +		    old_dpstate->blend !=3D new_dpstate->blend)
> > > > +			return;
> > > > +	}
> > > > +
> > > > +	drm_atomic_crtc_state_for_each_plane(plane, crtc_state)
> > > > +		dpu_atomic_put_plane_state(state, plane);
> > > > +
> > > > +	dpu_atomic_put_crtc_state(state, crtc);
> > > > +}
> > >
> > > That's super suspicious too. Are you really going around and dropping
> > > and destroying plane and crtc states in a global state?
> >
> > Yes.
>=20
> That's really not a good idea. Adding states are fine, dropping ones
> aren't.

The idea is to add all active planes on two CRTCs into one commit and
try to allocate fetchunits for those planes as a whole to best meet user's
requirements, because ...

>=20
> > >
> > > At the very least, you need to describe what this addresses and why y=
ou
> > > think it's a good solution.
> >
> > This is the solution to assign HW resources of a plane group to the two
> CRTCs
> > in one DPU or one CRTC group _dynamically_ at runtime.  Dpu.h has some
> > comments which hint this:
> >
> > """
> > /*
> >  * fetchunit/scaler/layerblend resources of a plane group are
> >  * shared by the two CRTCs in a CRTC group
> >  */
> > """
> >
> > I can add a DPU display controller block diagram in dpu_kms.c to tell t=
he
> HW
> > architecture and some SW architecture to clarify this more.
>=20
> It's not so much the diagram that I'm looking for, but an accurate
> description of the problem. What resource is there, why and how does it
> need to be shared, so we can understand what you are doing there, and
> possibly suggest other things.

... the problem is that fetchunits(fetchdecode/fetchlayer/fetchwarp) have
different capabilities/feature sets and they can be built upon either of th=
e
two CRTCs through layerblends.  The 4 fetchunits for one DPU display
controller are fetchdecode0, fetchdecode1, fetchlayer0 and fetchwarp2.
Correspondingly, there are 4 layerblends(0 to 3).  Layerblends blend two
input sources(primary input and secondary input). The primary input can
be, say, constframe or another layerblend's output.  The secondary input
can be, say, one of those fetchunits.  For example, a real use case could
be:
- CRTC0:
  Primary plane:
    Layerblend0:
      Primary:  constframe4
      Secondary: fetchlayer0
  Overlay plane:
    Layerblend1:
      Primary: Layerblend0 output
      Secondary: fetchdecode1 + vscaler5 + hscaler4

- CRTC1:
  Primary plane:
    Layerblend2:
      Primary:  constframe5
      Secondary: fetchwarp2 + fetcheco2
  Overlay plane:
    Layerblend3:
      Primary: Layerblend2 output
      Secondary: fetchdecode0 + fetcheco0 + vscaler4

Some fetchunit features:
- fetchdecode: Horizontoal/vertical downscaling through video
   processing blocks and YUV fb with two planars(use fetcheco).
- fetchwarp: YUV fb with two planars(use fetcheco), up to
  8 sub-layers and warp.
- fetchlayer: up to 8 sub-layers.

All fetchunits support RGB fb.


What I do is:
- Add all active planes(including primary and overlays) on two CRTCs
  into one commit even if the user only wants to update the plane(s)
  on one CRTC.
- Those manually added planes/CRTCs are prone to put, because
   the relevant fetchunits and layerblends are likely/eventually
   unchanged after the allocation.
- Traverse through fetchunit list to try to find an available one to
   meet a plane's requirements(say CSC? Scalers?). Those prone-to-put
   planes are handled first to use the current fetchunits if modeset
   is not allowed, otherwise planes with lower z-positions go first.
- Do not allow fetchunit hot-migration between two CRTCs.
- Assign layerblend with the lowest possible index to planes.  Planes
   with lower z-positions go first.
- Put the prone-to-put planes/CRTC if possible to gain some
  performance .

Regards,
Liu Ying

>=20
> Maxime
