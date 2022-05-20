Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE17C52E6C9
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C2211B7B2;
	Fri, 20 May 2022 07:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2101.outbound.protection.outlook.com [40.107.215.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F45811A8C2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 02:31:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTLP8EhIP69XY/Q7+w0UWl9FEfAm+56Deq5b8Dme3gzI3prI3qlHkgF/yMxOQnRpkAa6paHizkmvIluAENngygbSEDZ0p6UaHk6lbPcB3QfvaWqJeL05dfphn72Lm0s+1qBEoOHjplYzXkDBKtyxLWDj758OKijmvgbb2C5MjggKqh+xdnvwMUY6OX7/zru51v2j6l1mzkRX8xu2crrzuYxZg6XUkpAfr/5/zu0JfxfSbnFVnhpYxFxYQa0Yct2+0JSi0hjRywgGjhn41yZK6RZe9xvkKaupVXdVjA7XOgJqbad5xXe8FFu1LoFfSA3PslhNfIgmiMXeP60rlA+O1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbzrgDYDkZhA/rBWK5sR35m+IbSylrqHCcUshC/jidU=;
 b=cdRgzS5UE7G1YdjcLzR0YiEq/3RGAQ52iYd56VbDzS0OxHYp+SYDnI0yjxeMmgMdshpOPWngOU+NUUidebV9Dk4NgTjTTSZoXHMQHoM4RfyJYEtRDNxWDI9oFXfARuAqbF9Qaog2xCoIz8kfkPCLBGcQIiIr+KS+ieQ8l43IFb/pmj2ckjMV9fAjrb8xKIQVxjyPeGfjqAwxc1MvyajavRz9t4a9c3ifrH51d9lF1AvHJInikVf7GLEAskW4kJPQCRL9boohLahlgoW6mQh/9Yuh7CYdwMqsNYCwqbx2kO8w8Zq4WZpYRB7bXer/LDPspzKkqD4oq65x+htb8q4GLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbzrgDYDkZhA/rBWK5sR35m+IbSylrqHCcUshC/jidU=;
 b=liS9yHiFDBrB8iWo/fs4uYp1CCuYO1RKLIFh2fnODpglqyfDo7Jl0/LVJ/WffOilSpzH1UHl6VP+suDEZbe7BwDVuDQeUnL1apvyGlAjSbz2X4YCUHdMvn/AskUToZkDuGY+e8NVm9gI3tkNv+LPvkbBB4b1rI9m5u4d1fuaEeB8z9dCnqAeYmNdyxP+NecMWPZ1PKwcEE+UzfLFSTF9SYH7KDeoFGUBgYTd44L8Al5hDQR6ZJDZq24m39eHyU+5j3qB0CM7Twho+2iHJf+U1klZpE6vHsaukVaNlXQW6Z2MWkcGfzqcYfWy4DLIs6HIIZ1PGMyRPn6Ddvl1olByjg==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by TY2PR06MB3456.apcprd06.prod.outlook.com (2603:1096:404:fc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 02:31:13 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8%7]) with mapi id 15.20.5250.020; Fri, 20 May 2022
 02:31:13 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v3 0/3] add Aspeed udc driver for ast2600
Thread-Topic: [PATCH v3 0/3] add Aspeed udc driver for ast2600
Thread-Index: AQHYan9tqUAHvJsF0EuNAPwZWBao560mXQUAgACw5iA=
Date: Fri, 20 May 2022 02:31:13 +0000
Message-ID: <HK0PR06MB320209500E21D25E7A31E4E880D39@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <20220518062043.1075360-1-neal_liu@aspeedtech.com>
 <YoZosLk5GhTsP841@kroah.com>
In-Reply-To: <YoZosLk5GhTsP841@kroah.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 769401fa-6da4-4c1b-6020-08da3a08ceeb
x-ms-traffictypediagnostic: TY2PR06MB3456:EE_
x-microsoft-antispam-prvs: <TY2PR06MB345617FAC98ACD99022609A780D39@TY2PR06MB3456.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0Zcwt6dUA7Udvhl5PlP5P1fbDpuXykmCFjBTb+cJTgrMx/LRsQhxLY2qxlXYE5Er4vmk7maq8z9J8yoqHQFd8ox6S7PlAcQ79SXDxZaUMAWbXwoS/aWwlonlqKjJUOpHO0hggsrrXhOjR/2Zqg2uBhtCGstgGG1SKkOw3/dImSBD/D7ie4qwo7Lt86Qyh1UNhMmBIJerdMijciTxtdZSaEO07EHJxcO6fOhGULoMrA9q13oWnBZ0MKBPHWXpDFSXFhn9aHoe67N54qcUi/V+/chB6sg1uFmh1Bn99ykhGGEcBEJYRQS2fo66kQdMyPAryWEEOPmvFUxivOm1R3xnLymt6OmsYZXlm0WtmEi5zl3Omd36yUmswkdenpk/ZFjcMT4QzsqjvxrL4pFnHNt1J5yaU4SLo3jd9I7IZn+NadSbebo4JV7zxqxbGdGv3Ga+DcNYmtF9b8Cs0d60WmaMCE9HRTwmGMUmq39PR3ULiZ9xr73yI72peltPmR8+DeQZblK3H2Q44J09X0lb+aBy1hI8xxBCZ2ZtmRBxH5QJ58yJ4nkS+Lc9oa6LToCXsfuRq+x4C0wnMcvq2lwyRWJ8Vg9eeoX+iar5poJeB3l01LZ4L02IKjSlQ87keuYvJvUi35nuc9uYH2M4molHdD6xjtScIiye1BfhTDeg8i3P1xufSFSWMAJm8HtQD+JUW+wUJziz4kwADoJVskDnv6b13A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3202.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(376002)(39850400004)(396003)(346002)(136003)(83380400001)(71200400001)(5660300002)(86362001)(508600001)(38070700005)(186003)(41300700001)(7416002)(52536014)(8936002)(66574015)(38100700002)(6916009)(54906003)(55016003)(53546011)(316002)(7696005)(6506007)(33656002)(122000001)(2906002)(66556008)(76116006)(9686003)(66946007)(66476007)(66446008)(4326008)(8676002)(26005)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3dROPhG5mrWPFNhT+obwgnunBu5dAoNXRSm4VNoLkl4Q903kePSRUwv9eR?=
 =?iso-8859-1?Q?fNy4952XciHgL7Rxe9sDWV4QC42uq7JbO3r9rc8mr1ikn6U2ZJZjPvx6UQ?=
 =?iso-8859-1?Q?Kzg7ZPoUSMgr7Q448CGoj5j6au0QtfQ0Q9WHMjLFaD6x9pHC4HL1XAyM8s?=
 =?iso-8859-1?Q?ZD907miLnwh8U5Vul8GW/TEkEtefOf4K4Dz/91kbQ/WVkMah9wqztmQ/tH?=
 =?iso-8859-1?Q?QOD4aBieBX3mx4bXBQLS0GD/+0INqFhRXp1JVaI7hmJ7SubsybIN/FrUjY?=
 =?iso-8859-1?Q?gabS7wFX6XawzbWNZUYkM7mSvB+8Jdb4WdO5tXP/v6Ej3SWK62sucbyEcc?=
 =?iso-8859-1?Q?XmJyu2sqfRdMvvNtyxzeGfAyOyTOkdhrS6wgszpOrbCu+b2u+GYTRctHGA?=
 =?iso-8859-1?Q?6GIzxXv9jiwe890dVsna2GnElD54KywaI1Gc8F1QRSSm1lUCjzzr1eeoNq?=
 =?iso-8859-1?Q?U7/gyXSVJdFAdcAtDnTCqKFskbl5Xc4TPtrJjQzwosKmU2QVbO6qrQTG+C?=
 =?iso-8859-1?Q?LQL7az0JxJN3vqPkJvozWZybBQt41bRaePCuYqv8uae06QlBnDSIaJOvNQ?=
 =?iso-8859-1?Q?8HsGU2KffoNtLw7esVn7xmJS0OEG3FRuNhLnnn3Zh0Xw1E7E/fpvw0jaDc?=
 =?iso-8859-1?Q?FUuVKj2ciwobhfxrXNvoDsiZMCc+Sb/ch+YmbpNsbbZEI52u5UpO5Lx2Su?=
 =?iso-8859-1?Q?wPUfKA7ZXIxA8UkhK6opuGNiwi/KKTkMddLPlZFxGTCT6HbMAaw51+wnH9?=
 =?iso-8859-1?Q?igWWSNj33P0un/mVjZHOLZOpm0HN1tiH5fa+tdDPc0D66TMCJsMm0XmaOB?=
 =?iso-8859-1?Q?wW4IM6+v0NEj4RUDYayGIp/En/8uT3SPpmgaqDAl3RVL+07+zlTFBzVVY+?=
 =?iso-8859-1?Q?2GKjYbei2s5UOzNGuYdekHtalEUZcmOysHRd/D4mmlSX8d07m5kHlXgudm?=
 =?iso-8859-1?Q?MU7fo+G25fUPVHQrgNYUHvBxkbmvZF/yWN2y35mFDFZ1+PkRljqyYBnP8/?=
 =?iso-8859-1?Q?isw5Ug27GeUwun+hm47APbJ+xo1K69KvnJAY2tRP+mE4+dbCrloivpLZKK?=
 =?iso-8859-1?Q?GwNcytMTpuF9PnD4HetrWhytJE9PKomx5RM5UakQKxZVNlPnvTWlvXRljc?=
 =?iso-8859-1?Q?l7oq/ganK0CVYZxCmAUN8O7UVsYh2s0EkZ8oQzN0WBjroQRGwGop06pGVd?=
 =?iso-8859-1?Q?tRgLHzmP906U68JwoORKCSWl2GKSbbXcOgBCj5mSF20PJWxU5mIs9DkOhO?=
 =?iso-8859-1?Q?YfTapWUEeQj1Ne+zQ9pK18FDPw5VqUk2JZ0fe9q/Fcsc12pSiYtCzNuI4I?=
 =?iso-8859-1?Q?eHnXIiqgWQ4C8qcqUgBgpR6X6DlEMu7tHLjif/GKjAsd6dhbVlUo7UbSsC?=
 =?iso-8859-1?Q?IN46yjFO2nO0jWDLVSFSJ6mowFraF5nHWgMky69XmX3Bq2dO7+gfqmxZrY?=
 =?iso-8859-1?Q?PhCqIBsDYY5/VUcJTEntkSj4Kzaff4j3tN1p93RvTUmMsTi3f3/qyNxQ39?=
 =?iso-8859-1?Q?1LlUuY7a1vwCiSyzuQZVEfwq2bpTQtkRPu6kbCJeViAuPkBGnvLjYxBK/0?=
 =?iso-8859-1?Q?zBXWW2Gr8i2TR7RiRvCGlPUoNexr0P30eBx3wTAcsnpz2UukwSqYjGjTp1?=
 =?iso-8859-1?Q?mKVpXGLkEQWrSgFAA3qOsxewrm07oHWbNgIsrYczTUMalRtIvUW/GrkO/H?=
 =?iso-8859-1?Q?/Y05/LAfKgUB6Iymva/2sfOBcukGf7PfF3ughHl/EablGrLYVbVaL07nHY?=
 =?iso-8859-1?Q?giPRavFxnxw2amrqXMHDq4wqutCUAQMfclSMILkUjStlEa0Y6n324H6Nks?=
 =?iso-8859-1?Q?FJBwkDL1iw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 769401fa-6da4-4c1b-6020-08da3a08ceeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 02:31:13.1559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NSTBzxDNQsvWOzTEhoiL5D3KrLXTEvuxr4nstYQyymcoaQTDi/4jViyZ6Nze0Df5DnNjCqi4Uqdv0BxxmsbJUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB3456
X-Mailman-Approved-At: Fri, 20 May 2022 07:59:06 +0000
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
Cc: Felipe Balbi <balbi@kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Li Yang <leoyang.li@nxp.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Thursday, May 19, 2022 11:57 PM
> To: Neal Liu <neal_liu@aspeedtech.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Andre=
w
> Jeffery <andrew@aj.id.au>; Felipe Balbi <balbi@kernel.org>; Sumit Semwal
> <sumit.semwal@linaro.org>; Christian K=F6nig <christian.koenig@amd.com>;
> Geert Uytterhoeven <geert@linux-m68k.org>; Li Yang <leoyang.li@nxp.com>;
> linux-aspeed@lists.ozlabs.org; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; linux-media@vger.kernel.org;
> dri-devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org
> Subject: Re: [PATCH v3 0/3] add Aspeed udc driver for ast2600
>=20
> On Wed, May 18, 2022 at 02:20:40PM +0800, Neal Liu wrote:
> > This patch series aim to add Aspeed USB 2.0 Device Controller (udc)
> > driver, including driver itself, device tree node and documentation.
> >
> > Change since v2:
> > - Rename device tree nodes.
> > - Fix unusual indentation.
> >
> > Change since v1:
> > - Fix build test warning reported by kernel test robot.
> > - Rename proper name for dt-bindings document.
> >
> > *** BLURB HERE ***
>=20
> No blurb?

The blurb is above over this comment. I'll revise it as you suggested.

