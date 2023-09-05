Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8A5792031
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 05:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A498610E40F;
	Tue,  5 Sep 2023 03:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2058.outbound.protection.outlook.com [40.107.249.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0889010E40F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 03:44:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9+tKfl2RZczVkOODmTc49F7MyT4bheLjlDqG/hpADi/NG2DFyJUeBkwbr8MEAKyE/3LqKq2oFbFGuunpPP1/cc2BWsnqJanuZHgp0oPwHg7ScUm2tJ84bwFPtSC8rT8tXwifLy6jWOt3Bi4kDQEckxiGyYjd0RzIC/SDCXY5HubA8fOC27VK4WKPnMPoA2TFc04RBjS7JtCS/AnuX49Ey7woXhn7vqm8kdKWZBfOTDcOJ4P99OBv9UeF8TUPRUdIRM0f2xAygOfiJVhVdkyEW1AtOTZ/Ya/LBtJxyfDQncmwdgcmfnXFu1QUdc+DTptZxMk7K7YEqcc+28cx2z8CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBHypuCA5MQIfvCWSzauJDaVZTeZDxTIosqkdE7PPTU=;
 b=QOqFmyodb3CjdnKG/QcwUYNCWm0KgORjq6TfT48z0TOapKd6SCdGCn2ZJ711cUVf+ZrUfttMPmeyaswAdp/wymI/etqb1TR5rI21w/ATZHn9pyehKou1SxCrVdT8Ls3annu9PamSKLPFc85/VDKWFBfiJAtesHARsghvjTAFmWetyPUaWzvheDsYX0LHQC7rBdKxMJ+774O63C/DbAhWmQRfnFHcK0KgKUXAaGN5xCInE3I9gsqL7W0nECEw9B60AUos2szckbGYRppq5trwalygMhy/HHNNSi0UKNd2tPro5zKCbxZRH9AI8RbCpwcYbZZcS2lDTJ3mIq1MkvoGVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBHypuCA5MQIfvCWSzauJDaVZTeZDxTIosqkdE7PPTU=;
 b=XJ+mmH2T6Xhi0OFDiSEyBNS6PHqmoNKG8fWhU5IUPDLyguGcliTUELIOmA4jjeu3lHNEtaeBs9ddm5bmXyC6sxdIQ1Z2D0C4pZ2eTGXSGgLqaQ0tyX2O6sMjT5pEGVCCqXx4xIiLoRustyqtzUKuC07omxoN0q1B9jP4VBkUuOk=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 03:44:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 03:44:23 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH v14 RESEND 1/6] dt-bindings: display: imx: Add i.MX8qxp/qm
 DPU binding
Thread-Topic: [PATCH v14 RESEND 1/6] dt-bindings: display: imx: Add
 i.MX8qxp/qm DPU binding
Thread-Index: AQHZ1NZxpKDHNQbjgEiILz/ou3qvwa/2MuwAgADviPCAAFvOAIAABz3wgAGw1QCAEnN4UA==
Date: Tue, 5 Sep 2023 03:44:23 +0000
Message-ID: <AM7PR04MB7046598DF5621D73152AB1E898E8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230822085949.816844-1-victor.liu@nxp.com>
 <20230822085949.816844-2-victor.liu@nxp.com>
 <scbtbu4cdjlsmbr6ugkpqslvfywidvbuqyekxuttfe4rmbp2st@lev2zfqe4h62>
 <AM7PR04MB70469E94D5FCFC46F51A72F3981CA@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <64bpiz5nt3xgboxya26gcdh6d7nyyflm2m56orgjwwwibh52n7@yk4ogdcierho>
 <AM7PR04MB7046E8DD816FC99193B07E07981CA@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <2k3cc3yfwqlpquxrdmzmaafz55b3lnqomzxjsvtetfriliqj3k@tv6uh7dzc2ea>
In-Reply-To: <2k3cc3yfwqlpquxrdmzmaafz55b3lnqomzxjsvtetfriliqj3k@tv6uh7dzc2ea>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|DB9PR04MB8493:EE_
x-ms-office365-filtering-correlation-id: 6ad93e04-9747-411f-369c-08dbadc26534
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GDwXMBd5D4cePwDpDgn4Vrc5s90q9SPnJxHpTo71si4gSQYl0x9OpVCUP/i4igNV55x8lc4LyuRFfhzXsIjq9b7/rShXoaBMBLoyuDoEiuhKTKRSOuPA/p/0xYY1qW0kjrNMZ4+1/6YzELumHVnwhTxA/L+GdAQ2WD+bISza2QVofjX23Bu9qfAqr19T+kLjITbNQCMOqBHujiMmbQWRO6xD75Y6ILulaZULDJIMljapckQ2niAys5O2fDymOZ3lOxrA2vahhVCjNiZCaGVvzZ9NzQOzpCE/qjbO4oN2Y0xWR9dWBbaCOGtzo971C/boLtw4Rz1GApQ1kiesAsFRS28qTCRzPbjwwUyvbNeNfSlcWFghEfMrVTdWUzF3uAhDOq3jnRKOXMh6YgvxiGqqDK6EhgDZwnDSiLtr5kDqborUxAX2YytYr6Pucfj+mn3voOuul/NgXXLK7KKu4Zt7c5O3whbANYZIiLa8zsMtdKevpv8wBsSmfrFMl8UFowoCl3QkjED7O2W2jOrZ+qM4YJyZ27ysnWBNqKFxfHppShpFVZ65+/zHY+NnwJwrOHDotI6i7IU2yZZt1SYToHmcsYlgw1Kyk9jFmJjFVpyPuPSnpti6dWzBtX1KJXBnd2tRy1OmjnLVMULTptzY1TooLg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(396003)(346002)(376002)(451199024)(1800799009)(186009)(55016003)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(76116006)(6916009)(122000001)(478600001)(38070700005)(38100700002)(966005)(316002)(2906002)(7416002)(86362001)(41300700001)(8676002)(8936002)(4326008)(5660300002)(52536014)(83380400001)(53546011)(6506007)(9686003)(71200400001)(7696005)(26005)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0CqlfWNs755+yWR+FwbZJ5tcjLtXDKJaZpwVRIdX56ayXpAi2JvbcNAfKA?=
 =?iso-8859-1?Q?5w14kFldA0bB0g0sUK6QQOgu5uJ3Ha049zbZ5IVd2M5faD0GzxhG9W16r8?=
 =?iso-8859-1?Q?cRPYHAX/6on5mH5VP++4Q3GBxz3bLKoXRvzPF8CwwtQIHchA9AHxOMCy4d?=
 =?iso-8859-1?Q?geew9nsfhIs2k39JsBOy1nysaxK/PKnEelER9kUOxVFGa9o4IH6yDRY78t?=
 =?iso-8859-1?Q?XmuEvlGml2VqCRWmHBeQtPajlZZzc/VsR5V8Fn7jClE+9Wp4YWyOqJaMPu?=
 =?iso-8859-1?Q?diRW2lTFBEpfPw+iaN/o2d2YtkULhC+AH/TTX6LrL2pmQJJHYSJGP8YhtT?=
 =?iso-8859-1?Q?Y0F1M1dMl9ESTHcZLHVAvoLhoEFGcWumNEQhg/Yp2fTjapgUIkWZG9avDE?=
 =?iso-8859-1?Q?WVvLhDazJtkPsjBu9LGmKj/He4KtfC7PkEU9ivSxjpOryIoAYBk1YHuW/9?=
 =?iso-8859-1?Q?G3n1nFtQjDYlxGGaCUYz55VfE/gqiXqndOQF9YOKS4nlMKMcGod0+del73?=
 =?iso-8859-1?Q?yixZIkTzD6lveZP3U/9JPgSIED94kkDJNnxUN3b+D4ZaosmpySUXWK99DL?=
 =?iso-8859-1?Q?mtg9fPJNb7+ut7r4oJVCwWcjBjWbbtIOPfnDP++MDQB16VZQDSJX8AmGFn?=
 =?iso-8859-1?Q?5VrdH9W+HaY6Jv5WfRwDmPrSF/E8S5Cl6rHhimdjSNW5i658v019Y0QOU9?=
 =?iso-8859-1?Q?NJf+AwVQMzvC5TCH9Yb913RsZcl+fVpsYv9p/zKQ1ll0jQpIF2Llsb0Hyh?=
 =?iso-8859-1?Q?boxE/+E1MobVJcMBA26Pm0XxAwywH6ZU2eXdVD07hgxzH+zZbV6UbqtBQt?=
 =?iso-8859-1?Q?ujT5vdDPLUfKl4qiKNWcb0etGm6sXU4nFoFNZFGO7f/6dkVcJVSO2cSagh?=
 =?iso-8859-1?Q?K9bml/0ZMCK6YdDX3Ze+VKUFd5oxeHF5aqu1EmVKOcW7d7PJDR2qqWJmZR?=
 =?iso-8859-1?Q?N1A4r2bNKcCkx0W6iEnm52Zf6z6dRiYRftXmi6Iv3m6QBUZnfsQ8eOASsS?=
 =?iso-8859-1?Q?7iMC2y9l5u7MZE3d2/LBeNRf9PzY5SqD8Zk7Lb5eow7fubc70DVsfrfDPI?=
 =?iso-8859-1?Q?EN9BEVOCsQrDXZ+yguLXUalUXtjbsq0sZeICZm2qe5OG2l+byWMll32neC?=
 =?iso-8859-1?Q?8153ranBf4MMHqq6UjCoT/48PTKF9QiaGWsJ5z569oKxw7fzPZ1H+rz8/J?=
 =?iso-8859-1?Q?duMbXLgXytsiucMHxFpYgTznV6KmukpBRJNk9Od4CcgZsYKMlOFj8dtPpW?=
 =?iso-8859-1?Q?yo8nOUrAkm0yqifaGTT86X1XqAvwvHC5CDoJiIlQEpzBB/js5RpmS05oQm?=
 =?iso-8859-1?Q?pGCu9JWfPz71hGWbk9wwAmDyVbTZ1qeFNTzpxvAQhAGJhGFHmgnbDxX2xX?=
 =?iso-8859-1?Q?Rrr+mUhMA4XCqom0+yQVcTCXfLVS3u8ewukg42gulUlJTCXOWjKDa/gZWg?=
 =?iso-8859-1?Q?oFZTEoMnUdodCh1T5UVuLtDjdq/O4pvzfyRlOIgJI/nBGcIfksBB17cmzC?=
 =?iso-8859-1?Q?8b82TccjGUW6EdXEmMyC4R6uS79zNwn7eNDvgEkljfQUtuNlNVQRvp+Q20?=
 =?iso-8859-1?Q?EiAjovLDtwXKuQQEEfvYHgMMWa0YRh+kHwDoiK6UU+AUpKjGBWWSC2fSNH?=
 =?iso-8859-1?Q?Fa9V4uZpVMWT4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad93e04-9747-411f-369c-08dbadc26534
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2023 03:44:23.5855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: avCvHerpjiNcDA9iuC4gfd6C8CVIe5JIELk1blDNXxY0IdSFqrsQnkqC4wavL/QplDJqA+SYjz3y5M7lqkL8rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493
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

On Thursday, August 24, 2023 5:48 PM, Maxime Ripard <mripard@kernel.org> wr=
ote:=20
> On Wed, Aug 23, 2023 at 08:47:51AM +0000, Ying Liu wrote:
> > > > This dt-binding just follows generic dt-binding rule to describe th=
e DPU
> IP
> > > > hardware, not the software implementation.  DPU internal units do n=
ot
> > > > constitute separate devices.
> > >
> > > I mean, your driver does split them into separate devices so surely i=
t
> > > constitutes separate devices.
> >
> > My driver treats them as DPU internal units, especially not Linux devic=
es.
> >
> > Let's avoid Linuxisms when implementing this dt-binding and just be sim=
ple
> > to describe necessary stuff exposing to DPU's embodying system/SoC, lik=
e
> > reg, interrupts, clocks and power-domains.
>=20
> Let's focus the conversation here, because it's redundant with the rest.
>=20
> Your driver registers two additional devices, that have a different
> register space, different clocks, different interrupts, different power
> domains, etc. That has nothing to do with Linux, it's hardware
> properties.
>=20
> That alone is a very good indication to me that these devices should be
> modeled as such. And your driver agrees.
>=20
> Whether or not the other internal units need to be described as separate
> devices, I can't really tell, I don't have the datasheet.

i.MX8qxp and i.MX8qm SoC reference manuals can be found at(I think
registration is needed first):
https://www.nxp.com/webapp/Download?colCode=3DIMX8DQXPRM
https://www.nxp.com/webapp/Download?colCode=3DIMX8QMRM

Sorry for putting this in a short way, but the DPU is one IP, so one dt-bin=
ding.

>=20
> But at least the CRTC and the interrupt controller should be split away,
> or explained and detailed far better than "well it's just convenient".

CRTC is Linuxisms, which cannot be referenced to determine dt-binding.

DPU as Display Controller is listed as a standalone module/IP in RM.
This is how the IP is designed in the first place, not for any convenient
purpose.

Regards,
Liu Ying

>=20
> Maxime
