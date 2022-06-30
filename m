Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B973562CBB
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 09:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9EF11201A;
	Fri,  1 Jul 2022 07:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 30 Jun 2022 16:35:37 UTC
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C349F10F70E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 16:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656606937; x=1688142937;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RYj256pxZHBa9TZxfheBj1dbtyBll6WI4O9bPiSiEsQ=;
 b=To/AxFek+PQFwozwyYroRcN+o2/du3yWfobEOnArcpL0o2wPGwUGNa23
 1vcBW38V7MUA0RuHIJGGtV7csp0jIwCtmLXZNYxoc6ZRulJDKJp7FvqPb
 b6+4JxKyq3AkbeyuBJDPJnKUgsj1w+uVFMFWILo2Kcv/BMqRMNoCNsPGq
 BgDMbXiCnd68OKyfJH/Fp41elDqk9vICUDSH58tVmbkkdURI9fkTagEP8
 2r5lpsTFCbQWnp/l9Dq0ykSAMxharSmwDY7wpJxQXdtP4O4rUenJJRsTy
 BtZQPWfULD18TTBlD8KrFfPRERb4lM1cKaut1JmnxpvI39tvHYOJJAvcv g==;
X-IronPort-AV: E=Sophos;i="5.92,234,1650902400"; d="scan'208";a="209380277"
Received: from mail-sn1anam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2022 00:28:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwqHOj2HbzXU+AmO324UjHTxq0eSpI3pURgEULug3zqUKdujhGml0oCX0ltU1YJ3jSB5+ioX1aJG0jXOwAprjsLhcnECBwtcwGEMedJ7vMyPtfdJ355Z0RRWQdlvk6dEhAzVuIiRD3s8R+erOf/o7TV0LzMIh1dbeU3l0HMEcwQeEfYaOBToVTJCF+uXSKYAFv8cvWyuzvyMQqvP4qnxQ6uNcrFgxX9knhB3X4H2ktezNFALfd44ir5u5AquY+5s3NoXvBwAIT5EQzFzq3DAGe9ucD2VRswtGmWzycm5XBz0ChvrZz7rJ0Wp5XCQ7GXAJt6LIhF37eFgUirpqhKOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYj256pxZHBa9TZxfheBj1dbtyBll6WI4O9bPiSiEsQ=;
 b=K96rmAAK/NFEDJxnj7l1KLb2qF+Q1oOKhDMEfXELV6UbfvBgZDwbF9UYIq5trPtw1+iLfo6J/xWXdKUTA9efp964e5z/jfw3WAYBu+IB4zS66/wBZ+dUmCHWcPPUmNlbaK3TuvsLeE5D8IxkTSv8GwIKpET/rmQQFKkPRcZ2dvdK7vw3onNbaomMxkw5SHbS2mN9gXzNJo4jUQKbjJTJKah3l8++gyF67WVet3u5sm7a53yYgMy4u7hr9IdwS8Qpwkyga4LFAFz1bKouDA52UpD7gAfY4XaKe4EVObPa8nmnqFwvS/2MgaoGtPlSp6sBzW9AzNYcW8scz6fk1B2u4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYj256pxZHBa9TZxfheBj1dbtyBll6WI4O9bPiSiEsQ=;
 b=z49GcaycuimwkM/03aebBrBDK1rexI5VkjMgNvNL+jH27FqYsV9RLn+SbKXerZjQt9+wo8NP0AinXh7S3iytbzzgmA7EW+akFo5cv9I4sLwdpq9uqYaaHW1ku6L+RThq8IgjVnd3b79jnsC9Osw3jTEyYVFO09vt/aNM3ozOhvw=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by DM5PR04MB0589.namprd04.prod.outlook.com (2603:10b6:3:9d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 16:28:27 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::6177:a7ca:8caa:d19c]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::6177:a7ca:8caa:d19c%5]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 16:28:27 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Conor Dooley <mail@conchuod.ie>
Subject: Re: [PATCH v3 00/15] Canaan devicetree fixes
Thread-Topic: [PATCH v3 00/15] Canaan devicetree fixes
Thread-Index: AQHYi+hOfrObr2gkhkik9ukKE68/7q1oJQeA
Date: Thu, 30 Jun 2022 16:28:26 +0000
Message-ID: <Yr3PKR0Uj1bE5Y6O@x1-carbon>
References: <20220629184343.3438856-1-mail@conchuod.ie>
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 168984bd-686d-470a-ca86-08da5ab58f98
x-ms-traffictypediagnostic: DM5PR04MB0589:EE_
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gvjvmoCQmBNsEH9PWkR9em44A2jd7Hq2N/O/rPDI3XrvWovKfdkDoES6/nYcuMC2RbiU1ErnUqBvC/1vypd6i/JGIyf8+oUeNAQ4FGVwBdF0KC+JZVbyEfa3IgjHkO2QwSxpkNlBXKEYeh5eP8+BqdRYxomcjOCVE0YXkZr1Qm8an/dRQeWAQ/qlKboAltmnNo26K9IqRSGG4YGUKq7l4FQjDTM2RbshJ+aW/OQ+NzjDTW7q/enxs1fXjzI8zajB1iVruS/EytZtwcE+ADAmvt0wAW4meiCmhi3VJLv6+kzuq4g5wIlQ49sHeY8yorvmo/le8v8MlkAF9L1JD+sPQD3frn79CtGAtNf6Lsbz7hmF1m2J+1wmGi16OSEjdNB4IzBiBtZpa0JHpLfWpkCRQWB5Ov0MewbLiGwQuqKuYbayxKMWaTtM+IxPm0t0Ao/+2c2lYpNXNzJy+4xan3mxmlllHjQw42zPfRfHqnpYBwGfNhhLWscimnzzlPzvzsGj98IMfQ1oky4dhsrqyovLiomTVTs2g7EIMZWVZ0QLWUaib08kpbfSetw5iXeyTIeiwWlr9mYnmzkQXwZjkJaott7D7HkRfiyZ1wD+4FycRxBQl6BbZ8MjqCskYf5hiKRNc13V/mJsKHbK+izYcWVB/yniT8Y0QcwOgmVvYoC90EwpBhSvzM/XkRUCIMPQyQbW6P+AUEqE8YiLXZNe7mTvQ3tg/ssuvI6aebPIgy1piPE9j7kMhWRhRbl4wEiY9eyTGX5f6yLDg3sL4g1KEpjPGRWfigEW/iK+IyMm8hsuuWD3M8azm24dIA4mN89jtCRs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(7916004)(39860400002)(346002)(366004)(136003)(376002)(396003)(8676002)(64756008)(8936002)(26005)(66556008)(66476007)(4326008)(316002)(66446008)(6512007)(38070700005)(82960400001)(66946007)(9686003)(38100700002)(122000001)(6916009)(5660300002)(54906003)(186003)(71200400001)(7416002)(83380400001)(86362001)(91956017)(33716001)(6506007)(76116006)(41300700001)(6486002)(7406005)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HWFZaauVTNgx6404FU9nWf0PHa4nKFQe89QRYQ9+9T5UyatjPBvu3CGCgZaN?=
 =?us-ascii?Q?L9g4GZEAA2nRgU3cbXoq7bvVbxNdmUw0cHHYwlxROuA87sT761jqQw+QH5zM?=
 =?us-ascii?Q?5TxVOr0/uyoI1hw1+xv2xhteNFicUTElVDelCVI0DM+QMZ3mHuns0hriak0T?=
 =?us-ascii?Q?GZcs1ACfLmISCMg3oLIMqRdURXmZA8hWoCszfvIxP1RXOcK/aGKyboHfRIm0?=
 =?us-ascii?Q?HkamTvvmGRN47PVlyvtqT4eYJeEXwkSKxkncoznGnTUV6tDau7YE9XiX4vtl?=
 =?us-ascii?Q?+rEh8TidbakTdTrjEgQpOLaUWlPw+hdMIIrTPxEy0oBaRrFlGX4DH6oNZ4W+?=
 =?us-ascii?Q?LHTGhyERNk2BcqGc9N1JNdfGQ2KaaJ8mvzlJT5QZqqyFFLWnLcwT9yLUQd4V?=
 =?us-ascii?Q?7o7dKCsJOGi5ca/njtI+gcJNcxAvwytUvGvmQKP1nLBgwzrAFQCcW249scjE?=
 =?us-ascii?Q?h8Lz5Qg8ru0RHMioVz2dGI+3UgF/AnJC6v5dvtZ62YqGuCVvrdp65pY2/BYS?=
 =?us-ascii?Q?45DuDiEijlTrM6CbhNobguPWKyiyvzsgGaPoSaDdFdystPpBkU4qkRS9xG0G?=
 =?us-ascii?Q?8wd2IUrq5UQDDOEV2kl5+ASAahGDg5OIbE57yW3dHy+0uxUhHxthgZCODCBk?=
 =?us-ascii?Q?YpLtW8rgA6M3mD8SBdXfap7qHGizgYso9qTxNY50iZFUqnaVliHqfv5ey7Qz?=
 =?us-ascii?Q?rqw2CJkRTS/L3neO98WEmRSIvhhvgjXVFustD4NByjbUqLI4N4HvOLb71ND/?=
 =?us-ascii?Q?d3/rWLsbYTAMGA/bwHbb03eXKwPyDAw1+lI/Dyh7ywgEFhCugfz3+0Ls8lpQ?=
 =?us-ascii?Q?Y8LBkf0Ju3er2i4fyYgelr0Vecj/1BeBOZHzH1bP5aXCUtUfEVTFmN7HgeUD?=
 =?us-ascii?Q?s70+pVqXR739mHrzYRg2iSpSy1dtRIozdOnZh6ZIhu+EYYzjKL05a/7fB+wP?=
 =?us-ascii?Q?TUL/6RJ7Bcd1M7IsGl+5y/UKwEZCzJTMfar6CVVQvd6bBq5LE4ToP125gOvK?=
 =?us-ascii?Q?NmygwD73cWy1a1G8pc5GBxrYp2kdf7WtvZ774yiFsS/IZSkSQ9rjjfzLobbr?=
 =?us-ascii?Q?UKQGv1cklJ8ILHQTPmPBi9tUMS2i132LzlkSIeB/ggVK9TVxNV2EykQ42D0Y?=
 =?us-ascii?Q?b5OTIwCC0piWMpZ3ZFAjpBNl65gNTyPCc5K3tzF5UUiVNAtlxW64SjuW3Huu?=
 =?us-ascii?Q?8NSSrkU81zs4kPFVA/O/Eo3WilA1nEDyBvpG7lpEnHZlkhp9wR8k64UCbk4F?=
 =?us-ascii?Q?uqLFeiZMwvRDEZb8ZTy3E3tlFH/61KGZOe71/aZ/7wvAAhlgZRf54qh8sSm5?=
 =?us-ascii?Q?H9bF7u3IVfvzH3M7NLTd992r8bMrjCZpyFphPwa8lyRScQ250lywRNd1xnuF?=
 =?us-ascii?Q?xi6eroj0F04+MRxw2aoqtCQep0vnwGMpDfdLtXq5kdxZPMErb0lVAx3+vTX9?=
 =?us-ascii?Q?6yt5HpdW7Oub4UHOI1VvgOlJhbWeHk05/4Xmh/vhvQfB9IwiA3O/sk4puGkF?=
 =?us-ascii?Q?6XugJGwaBkpaDF6dCKLeP/rpbusWwy7L9zc1HIGKuscrADxjybdTe+KoWu1i?=
 =?us-ascii?Q?rqWBe5CWmHm7D/+eLwGXCVxWCMfAvmvT8MxlPB94hyMy40s0UI5pNTz9XAp8?=
 =?us-ascii?Q?6w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3258E1AD7A923242AE53351E866121A3@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 168984bd-686d-470a-ca86-08da5ab58f98
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 16:28:27.0613 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sl1vT0v5pkENyeJd9P9CiyPYj5Tg7jiGYRfqpvg0awEmFcstKcZQFIZ5xRvNRrgztXA0B6Xb9lMsYLOnYoW/MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0589
X-Mailman-Approved-At: Fri, 01 Jul 2022 07:33:24 +0000
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Dillon Min <dillon.minfei@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 29, 2022 at 07:43:29PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Hey all,
> This series should rid us of dtbs_check errors for the RISC-V Canaan k210
> based boards. To make keeping it that way a little easier, I changed the
> Canaan devicetree Makefile so that it would build all of the devicetrees
> in the directory if SOC_CANAAN.
>=20
> I *DO NOT* have any Canaan hardware so I have not tested any of this in
> action. Since I sent v1, I tried to buy some since it's cheap - but could
> out of the limited stockists none seemed to want to deliver to Ireland :(
> I based the series on next-20220617.
>=20

I first tried to apply your series on top of next-20220630,
but was greeted by a bunch of different warnings on boot,
including endless RCU stall warnings.
However, even when booting next-20220630 without your patches,
I got the same warnings and RCU stall.

So I tested your series on top of v5.19-rc4 +
commit 0397d50f4cad ("spi: dt-bindings: Move 'rx-sample-delay-ns' to
spi-peripheral-props.yaml") cherry-picked,
(in order to avoid conflicts when applying your series,)
and the board was working as intended, no warnings or RCU stalls.

I tried both booting both via u-boot (with u-boots DTB)
and booting the kernel (with an initrd) directly.
I could successfully read data from the MMC in both cases.

Therefore:
Tested-by: Niklas Cassel <niklas.cassel@wdc.com>=
