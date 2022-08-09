Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D81C58D981
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 15:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C74950A5;
	Tue,  9 Aug 2022 13:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D0E9718E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 13:39:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OmpotJivurqWjU/SgXM6gkCPXBtwXUTsTCxK7LOji8DG7aZMXy43f+pVjMPD/FRaT/IQMRw6+sKPrpRNjZs0+0/bMhVyPe0HMYS0oQYB9tOI4l5IIMaesxOPpxuK6ZSsKYce/Ou4BAGBevBr+bR332HR3lcXhbBHDDalfCnZR9CTjEOb9TJ919EVbE8Nf20ZcgI6NjAFsBaezNtporGaPme6NyJUOngj8AWYonqXOqz7vaplhRyJbKuYX7q5WTRVVeOwQJudwsJZXDEUJBSLOoPTiEIZ0FwW7vmJOwdWu3LwdCBK7357sBoQPX6aPeZjPR+BEqSsz1l+ZPE4GatHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsW/73XAUpgJI/4b2pVcUZ62NA9Odlc8GVNM5GvZnz8=;
 b=ljm1uRTNchyqLmbXXa5ajzOQY1gaFVpcU6Zsq8R9GmjB8Y0uTWmotvfLFyl9WjVfDpR68wT4m2H2ApSYAg7NIdK1BipXyV5+Bj4RnGKK6SqcN8yqQaSAao6Dk5diOFS6cd7HqV9jO+1DcRQwRM69qEYfisD8o38M66gDuS4U2WU9cZqUZyyVOC1l2dwP6NhMfnCwYTlH/vmHdCSc0qQ0HyQaZU6+w+6mLEpOrNyZih8mcL0WZYOm3biyDQRXuGDs/BdMHXqUi/nrnTWRYzW/F2Y60IERTLxTB85Bwr+guRsIAFdpUqM22Ob1DjLgbcl1yn8owNe2F3buXbTMcFelLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsW/73XAUpgJI/4b2pVcUZ62NA9Odlc8GVNM5GvZnz8=;
 b=khbzf13sH7uupXC5YCWZFyULLMcgFx1WFLWjXQ2h0B4gwcBmpC9YiV2M7bGwDHhrfst1Du+929OwOaDXyoIyBcwoY55a1wllpivasbfXMK4ZQs7kSVS7Klp99G26fb9tc2yzP6vXpIZ1Wf3b9fT5ktZzFRXXHPvE18myF9h+X4w=
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by PR3PR04MB7419.eurprd04.prod.outlook.com (2603:10a6:102:80::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21; Tue, 9 Aug
 2022 13:38:59 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::a401:5ed6:1bfa:89a9]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::a401:5ed6:1bfa:89a9%5]) with mapi id 15.20.5504.019; Tue, 9 Aug 2022
 13:38:59 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: "brian.starkey@arm.com" <brian.starkey@arm.com>
Subject: Re: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Topic: [EXT] Re: [PATCH 1/3] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Thread-Index: AQHYqNLEB1kEEMDN2EiJXHn7b90D762gcg6AgAYmygA=
Date: Tue, 9 Aug 2022 13:38:58 +0000
Message-ID: <86524ed0e12cbb76a8d746447b24f90f0aca55fa.camel@nxp.com>
References: <20220805135330.970-1-olivier.masse@nxp.com>
 <20220805135330.970-2-olivier.masse@nxp.com>
 <20220805154139.2qkqxwklufjpsfdx@000377403353>
In-Reply-To: <20220805154139.2qkqxwklufjpsfdx@000377403353>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52c61423-bbd6-4211-cad8-08da7a0c838b
x-ms-traffictypediagnostic: PR3PR04MB7419:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RfprcbVvfHi7d61+p/i5/qlUFwhlud26kFMGhgYyOKSnQJogf3DiFhrBcBVxYNu56N/yRx+xDB+lWg+sjZ7i/mstqGlhMPApSaXqwnoVI0InY3Zo+Fn4jZam4yIvF//Fa1ATg7CWINwC05M2KhYZEj0pQESfwUJyDEwIcgsmy9jkBjf9vpQB090kJ7ZCKMwfHCXm5bWKvwC8+QrWjP6HrSUJMb/Sr/aEFtsxPWmNjRA6/Ix35B1qXpcR4C1hlI4Roa/ZRqH2+Ct9kqns7gqjlWxW0a/jGgvm8t7+hYTl7d5j53pOi+rfiZY/aZXKOUoeMOI9teczV1nmY27FwImVgh5ENPAHb5H711JLAOeTyHD3Hlitema4lI+kzc7S2bnikJSROPhou7gF0118HEDr5l+TMEM9uV/9ywRGhrXIxH6p+5diIGLVrnH6ZBDgr0FFMKWR62PKp7SYKOna4yLu8fTKPBZu1YV7YtfrwlCm1OsgfLx3pzmUKnFD4QMysf07msqpF7VFnR5UGkDd/DfQBEYiDucBCthtnX4uRtpbrsEF2ZdICeQryBHk50qWUgboLeuyLqZYgeq47TRWpd1cTjJaTJ0I2JwUXyd8iqzDc+iNwAlaES3NpYJ/zkVCEAFIVviEY9T4Mbez6WvT51SrSEFp+iIt7wZl+KlPrxSFke6yrdlUeMZ2Dml1j1fDlm6KI47zPZQ0OZZqhb8HymkPxmsLpje4+DxJhya0zQpM6T6p8UvSYezVGOvTI+yzuC2uRUcpS+L+LyvOsCZUOibCY5LrekBLRikDLi30MboGqDPcA4Ookd0Jq8tDOqIjr+g4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(8936002)(66946007)(316002)(4744005)(71200400001)(76116006)(122000001)(4326008)(66446008)(66556008)(8676002)(64756008)(44832011)(66476007)(54906003)(6916009)(36756003)(91956017)(5660300002)(6486002)(478600001)(41300700001)(2906002)(186003)(26005)(6512007)(6506007)(38070700005)(38100700002)(2616005)(86362001)(99106002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?mTbtCZlpLpUxtuQPPk454uXcovBOeMck3ZH41opFaBsfvrzrp3lOs83Dw?=
 =?iso-8859-15?Q?cCrxIKNF7sv0wNrKvKpXjAX6KoclKpzP/IsIy6lvVEPB1F7pdjcQniaxt?=
 =?iso-8859-15?Q?WhBjhHoELd3sUyCxGANOAzrRRIJM977vBLYFfEpjZMm4xHGIHflyUo3O0?=
 =?iso-8859-15?Q?JUxFs2BiBqc5I2WlFFWulF9r82cPSk4sgHXNcxAJOzr2qO/eULv1SRrDN?=
 =?iso-8859-15?Q?L7TQTe+a1sIXcp9cQUwxfhru1sPAdxNbhlmOrSSq/+4qiC5nSMZd3kv+X?=
 =?iso-8859-15?Q?Abigdr0zrLgJH0uaTiPJBQb2ZcoEuv+FnoRNM/YoetJQDMy9XLsIH+Yau?=
 =?iso-8859-15?Q?b/L5ReeBYyZeo7PBuQeDgO9i5FUFLLa43/nCkgLci6f9Y23bGDw349y2/?=
 =?iso-8859-15?Q?MAiXGlMS8zTuCjx03HBa6zlEZojnzHQjsWGuKUcmR/LCbu/tUfBk/RnLz?=
 =?iso-8859-15?Q?EPB5O2Oi8D/uuYlK4uyeZUvlFw5/JIWfUaqRmYqAjbMDZPSlD2s9pJopk?=
 =?iso-8859-15?Q?+qTo+5AL2e8x2PS8B2Z3lywmSU61m/yog7U7Nn3efC1fCVsqUnN73+2Mz?=
 =?iso-8859-15?Q?qAhFi1Xmu5e5/Cmi4oOo6rNzUGChdhTeHWYxQ5swfAtr7FmQNaLvJy98R?=
 =?iso-8859-15?Q?/u5DlCOAOXCtfiYghcduj9qxe0HUEPR/gRIWnLZ7VmUS+ueGt/xbiZNQw?=
 =?iso-8859-15?Q?SG/xErFk91095GB+dvWWv7RyXhWm1jf8TLleeJLdPJ3WhoCHyVRWQAgDl?=
 =?iso-8859-15?Q?cVcElyWZX7LC8IDW3SKvperaGx5Pl5IBmImLfMq2/mAsCtSXS3RUTP/ry?=
 =?iso-8859-15?Q?RYQXS+gGmUUZQnJE1fav+uB27/mERqZu6E3BEekm3dOqrqcWj1bsmbwwj?=
 =?iso-8859-15?Q?rxf6sLkvRpFVYk4KzWlLeo3wtY0N1qGdvJyEGTt0j2TmUT7Raz47Ehx6q?=
 =?iso-8859-15?Q?3B3yOylQHPeNN8zwiX/7aRX6wQL+00osLkerJUOvRquj735Ssc0lAp6U5?=
 =?iso-8859-15?Q?3agntM/orqQrc+vu4mLB0dsZJBA1MIqJ4KXup8gjqEH2HuBX6QdkeFNfR?=
 =?iso-8859-15?Q?EIP29MVz2B9qVb/od20HwARO3r6PS51lOjDKOfxM2WILF7zdUthbgAgZl?=
 =?iso-8859-15?Q?+1WloeUyjlmRtuc8hiWsL6S2HXrSWJTIrn7Hf4u8RENX38X9n5vDPRFi8?=
 =?iso-8859-15?Q?clbq8yJ2qht1q/612EYL+8DcT1welRSzKhsxuXVonscqayKBBa47K/Lir?=
 =?iso-8859-15?Q?n1m3zZaood3jJH2pFdZFDhVuErkE8ZVvl0l5cBqIYW9N1awTmr56Wh4US?=
 =?iso-8859-15?Q?j9DwwrYeUwkUdk6wN7of2VEQo/vUEVC+2CBPbFdthHY6kDgSRQ22DsEGr?=
 =?iso-8859-15?Q?OdQsoOzGuer/58u/5xHzzTfn8F0lSVu2XlzqR5ve4qwFWcz4fCvvv6pRv?=
 =?iso-8859-15?Q?oSiHnMZjym+eNxF23HSXIlIsWz2ZhOYr3PesbDgcvzClt9aLXcNNvmy8e?=
 =?iso-8859-15?Q?KabQ4/bZT0tf/C3mTxuqT5KOOAgVQ2PwvTtOsUHInI/UtJBfgsxMeIBiD?=
 =?iso-8859-15?Q?GF0b11vf94damJX4rV30Je0gOPXz3B4S8DMZJKVR41Hp3Xp99hL6cQRMc?=
 =?iso-8859-15?Q?9iLtyjamSaO2yKAcdWwaQD8usO8teNGwcynKBZNrdt4N2gPFhoHSF9R4G?=
 =?iso-8859-15?Q?vuTN?=
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <75FA77FEE6A4EA4FA7E03430296AEECC@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52c61423-bbd6-4211-cad8-08da7a0c838b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 13:38:59.1363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGCuLJ0H3rzKi/vNo31iJZbhcmECRyChxlvcpA3J+1WKoL+bOAX6JtSzdhq6caAjZ3H0VyMGFwOKHV0vgxLyXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7419
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
Cc: =?iso-8859-15?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "nd@arm.com" <nd@arm.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Brian,

> > +
> > +             rmem->ops =3D &rmem_dma_ops;
> > +             pr_info("Reserved memory: DMA buf secure pool %s at
> > %pa, size %ld MiB\n",
> > +                     secure_data[secure_data_count].name,
> > +                     &rmem->base, (unsigned long)rmem->size /
> > SZ_1M);
>=20
> nit: What if rmem->size < SZ_1M, or not 1M-aligned
>=20

Let's assume that size is 1K-aligned, maybe something like that could
be better ?

		unsigned long mb =3D rmem->size >> 20;
		unsigned long kb =3D (rmem->size & (SZ_1M - 1)) >> 10;

		pr_info("Reserved memory: DMA buf secure pool %s at %pa, size %ld MiB and=
 %ld KiB",
			secure_data[secure_data_count].name,
			&rmem->base, mb, kb);

Cheers,
Olivier
