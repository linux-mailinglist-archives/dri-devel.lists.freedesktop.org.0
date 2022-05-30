Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB5F53745D
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 08:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273D310EFDD;
	Mon, 30 May 2022 06:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2135.outbound.protection.outlook.com [40.107.215.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E931B10EFDD
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 06:30:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rg4upEaYFgAThtROL5XNYnr/PLiwK9R1db+KnAViGuRCxnx5S9kPo/FXWVBCNT8DNe3q0sH5vDfVA5NTKj8x9P+pP3fXRyTubRqwIIU7raMMp0GLIcsP5ZTu3KdPZXl8QJfP1aqAtpU20cad5GcEfg7GvDgcBJxepIpTcUIdjhiVNqQL62+QAKTpzQC2X7Tv4tPKYkWI4ye7qPVpKi4t4L+RXaNx5cFbfFmI6EkixTcoGzqu3TuoaMFenBfEP+R7E3iLcI3+knyU2utdihakz6yRlk+YxyDhonKyd0HwrpW8/EKwxW9MkeMut2hdZnKd9hGjTu3E+FBjHhtiEBb09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD5zW35l4crAPXNe/DvcB42bF+8jmYODfx/BGuCUbAo=;
 b=m//lOGd84+L/jqlJcwfWfyoYzn20GRRWUZ4/sUzRnIYTxlhrsAvzRCESdPkEPtfi/QIFqeQ7QGKXUZthvC9COsJMD5uVZoo16qdl83lPobX+pNczdjCW+R2WhkcNHhBptE0DMJNMqq9a6tTJ9mb0/Ln5jWak9wEtd6yvAmFZBGxF81Lp+9rFFVEcRTcwUl1EdlaBimXCWWQSkFv7/mGG/DyE1h1aqDccSB9Rwsn5X4B/Ht9ybSODjE0Wli6rAKXAL1625mzeJiN91OOZy4Nste1NA9u5u88PHLV5zkBO75ge+MqbaGzKmCypFN0vcXKrHhZmC2Z2t15IuDmGsLMqJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD5zW35l4crAPXNe/DvcB42bF+8jmYODfx/BGuCUbAo=;
 b=0e8O/f2fgWDkJdftctDdKxxUqYwCNtXn6aQRTBj+Fp4d92FmFBDM8vKoeKQEGQshh4O/m5JDJ4UTO2ojZwWLv9K3J2fD485BMhdz2/PpSYOF/MVXRhZZuOue4nyq/fEPGbsQG+c23/o199B/Sd5mJXMB2jvCJ5fJxMKL9UgEESJgsGhYJhiw3jX07+JuApCqTmaE+vwSYGyOGlpBEuGa4FpgOlxQX51558MrOXHvLEb1T1uqY40guu1ZYzWxy6u3rcZRJpn2Sy3jYCqUL+I/DJmxkfnGmj5SDDh/jN5XMrMKOAHBNYMZbi8B6Kd58ldB5dC4kqIXro2mOuBEYXdIag==
Received: from TY2PR06MB3213.apcprd06.prod.outlook.com (2603:1096:404:97::16)
 by PSAPR06MB4934.apcprd06.prod.outlook.com (2603:1096:301:ae::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Mon, 30 May
 2022 06:30:13 +0000
Received: from TY2PR06MB3213.apcprd06.prod.outlook.com
 ([fe80::7847:b601:7d4a:1625]) by TY2PR06MB3213.apcprd06.prod.outlook.com
 ([fe80::7847:b601:7d4a:1625%7]) with mapi id 15.20.5293.018; Mon, 30 May 2022
 06:30:13 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v5 1/3] usb: gadget: add Aspeed ast2600 udc driver
Thread-Topic: [PATCH v5 1/3] usb: gadget: add Aspeed ast2600 udc driver
Thread-Index: AQHYblFv8upl497Tr0KWTmQJeF4k3a02q/WQgABTQoCAAAD0AA==
Date: Mon, 30 May 2022 06:30:13 +0000
Message-ID: <TY2PR06MB32138063BDDFFDE75E83FE7580DD9@TY2PR06MB3213.apcprd06.prod.outlook.com>
References: <20220523030134.2977116-1-neal_liu@aspeedtech.com>
 <20220523030134.2977116-2-neal_liu@aspeedtech.com>
 <TY2PR06MB3213611D7D9DD6F9B47DBB4080DD9@TY2PR06MB3213.apcprd06.prod.outlook.com>
 <YpRjIXaJ2ZeuuWJ8@kroah.com>
In-Reply-To: <YpRjIXaJ2ZeuuWJ8@kroah.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed035ce1-a169-4185-aec3-08da4205da75
x-ms-traffictypediagnostic: PSAPR06MB4934:EE_
x-microsoft-antispam-prvs: <PSAPR06MB4934B58DB42403E5A2704A0080DD9@PSAPR06MB4934.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ticACIbteaQqfITU1hFeT10hWg7XOMY8kmHVWN7dEsSBFwj5eLYU4tn/8cR0Cl/Ktkigd1CZHcD4uuANZAfIg/hMRXqnguscAt1wmzYMV2SVknbeL+3PidX4bW8FKqCCUpcIlbkGqn/uR9z9M5dtJT7CNgLuepuat6/KNW567BPJBegnJnSxpUSjHI1y8VRLPZuFek6HBCgp5hOKDq01P8WNn7bUEWyDTT+GnFhdWcHiVmDfLjO5Noz1IGdzQY9hIGOFQkIXGeW1Tx2a6HExgYf6IkXVvlM3kkSfYmKmrQLTwfGiQAzhJW0uip9pWgFoVttJNChmaNBufBR1911oUzv9MuWm+Bh/5rflc3J9CU6g6K+aErDQmGgLTIgTWYyHSnMZhgGvai942NHMazp2MsBOKnECjKM/0fyecXXfTq4UVHLj8Vd1uk8hirR3KNIy7P3PowxtgKYD4uqF8g9OWvj2qowyaggjs4cxpnHuij/dM2IC54ij5bveqr4JFT5B/PhDFxb2oQnimOFdE4U+gzWQF+eoouucva7VM/VksWpzQDHoqSSS5QIwML5PGBVd6D2id4DQI9T0RYkG9iH47QrwirKOOYbKfERv06nRwZYkWOk0Vrl9Dld6qytDvtZ6GngNfe9zrNwO4PlsFkMWKpTnR0JC1KBcSz4eUtD9olH4OopO6sMCn8qHIK9paHMAlkuVS/BUgD7nbtSzoOVBQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3213.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(83380400001)(64756008)(4744005)(8676002)(508600001)(7416002)(66446008)(6506007)(7696005)(76116006)(38100700002)(66556008)(52536014)(66476007)(71200400001)(4326008)(66946007)(8936002)(55016003)(2906002)(186003)(316002)(86362001)(38070700005)(54906003)(26005)(6916009)(9686003)(33656002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xkLR9J9MCFWkZKPcYL9tLLAb6JmXSmvanMbMLywhZp+6UvHhX+psjejFDL?=
 =?iso-8859-1?Q?5hCShJl0CLshbsyyvZbsADHWfsFwrYzRHPDuYY7scnsWFwRRW1iPngwodj?=
 =?iso-8859-1?Q?1uYhIj1fVaB/CV65GeAkzTtK4zYsaSkPNLgk/hywM40Fi+8Nkkfgo2pfId?=
 =?iso-8859-1?Q?CmiJtv73gKXb0DT7MZUH9WrINWytn6EGup9B+jQ/5OM9rWMHOCL5egqeL0?=
 =?iso-8859-1?Q?klVaiLxyE+zNip1Ufx73bjtswxXMCl6FxjRPsP0mg0ZvSv47SBTCopQ6LO?=
 =?iso-8859-1?Q?1gEqQX9UMvw+lRICJC49QmkPliN3mAu64LBxb1O1+xXjLbbcL7NlnZzeNy?=
 =?iso-8859-1?Q?dTjp2xlV30cqfrBGWAeGMhUn/OjCiKVEF5s9c+NeoK9MCpdfJFwOrmXbFN?=
 =?iso-8859-1?Q?wcLbqLbMBR3/fujpafMOq9lZBYBc79zmHXZ22Ces/f+LYgjKvRJphGrelS?=
 =?iso-8859-1?Q?xk4PwcSovz1bBdyrJ3ssfeBbhlmkdC1WjH47jPMyHVeHC+QZYyv821ya0A?=
 =?iso-8859-1?Q?WgFBndVxKuqAJd6uloCGPM3hdEC/cM39BNjmorEQIUKb6zD0DO1fk/Gkv3?=
 =?iso-8859-1?Q?4D8getgCe9IIB0cdFCIzORA2nEuf8dAIqAOhWgKRYyFGpmogcQxHT5E9t5?=
 =?iso-8859-1?Q?uzAz1WJ70+3mJY4EKjYTvLrit/qoBOvFyahAljPp4hKf7KRj2mJQ5oKh3I?=
 =?iso-8859-1?Q?MRzmItm0bYGghl8fWCWqfnP0urTub97KHgWafYaBh0T16zsDoL3BKAs9gA?=
 =?iso-8859-1?Q?d413zEJuBxYUUc27ZquRGjdC1bVe79B+QuTSmkAUZFgKUIq+Xc9lnQHzyy?=
 =?iso-8859-1?Q?K68vMDysuh93te1+n/oXrub2xjYuFiZFqW99rzJNoKgaGPhS2e/rfJOLNd?=
 =?iso-8859-1?Q?0iNHgD1/HExd3G9jn2v1POdZAaOf+hNwN3mVSPwXFVJbNSwuabqJiSlvcq?=
 =?iso-8859-1?Q?fw5go1XfEuZq7HDBybRwapjCFkIk54cVmfx7tEXD93yBvG1Th2s5gH9wsf?=
 =?iso-8859-1?Q?mwu0cXb1hWEwIJoJxAdmm4AtAgCvD6MjnJk28nW+/N4pOGGQtnYnv3XRA8?=
 =?iso-8859-1?Q?/NIk/e3L1H6cPqAh+B1UP0BTagVEOpD7n178cnkuCK5Qa3Z8wC/IZn/Beo?=
 =?iso-8859-1?Q?WwD28DNNAhbKI0eN0ZVN0RCjQUPHuOVgCjusrnNb70YGbv/OXqE1yVEKYV?=
 =?iso-8859-1?Q?piLNkHhHadfgXwfLngoQI8GGwLBlCP0ErrO1ooWmtgPu24XK85yyjo7oaD?=
 =?iso-8859-1?Q?CedXpYsmgcQocNkIp/Nusdm9f7cjS7uad2zOX6TWzL+ANxqFYf99uNR5Ry?=
 =?iso-8859-1?Q?5yHPHyTzo80RHGiMCsaHrcU7N4Olu6/zWFZ3Ph4SyfRaIVNkLmwLTKiLNj?=
 =?iso-8859-1?Q?tqBsEhYLGbO2aC3dwBQRchQF1frICLThz8yhr0EbJg64GhSa1vEGLLH9nw?=
 =?iso-8859-1?Q?87ekB6y3ej73KdyIjCwSGlDVE9h0YjrrcbB6kY5Bohq1cYo9vSpzEGyNyq?=
 =?iso-8859-1?Q?CdQhZbSbYFhKcybEqVbPW4CHXaIezow2OpO5GxnaohtWRv0/UpFfq2i0UO?=
 =?iso-8859-1?Q?yl0qVhvh2h81EOPv2QTGVoqVjc7Rv6K84jsdcRj1D1O9jQhalcAwuYVixU?=
 =?iso-8859-1?Q?8Me1C0XcSz4QohatDloGxtwwkXwULZXoSchRmHQdgjnWS0RSkPH09NpeIJ?=
 =?iso-8859-1?Q?zLWddCxk6HORquYCztWDuHbozZpQ+Ph4B06/CDwcnx+FSmU/UffMnO/hLu?=
 =?iso-8859-1?Q?9bbPWb7RavtYWgbAlqcLdIUxE1jZiXH+95ZbqOlC1kt23bZk/zDFY1Fa9S?=
 =?iso-8859-1?Q?nHAbsIG6/A=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3213.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed035ce1-a169-4185-aec3-08da4205da75
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2022 06:30:13.3136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PW7M9IEGn8pwm2VgsMAhn6QK6lzcNaYsWj4ddvKNntQvt4ICkIX8IgNHbNJ1C3pxEwFD2dWWJE3Wr+XT2zsKwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4934
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

> On Mon, May 30, 2022 at 01:27:16AM +0000, Neal Liu wrote:
> > Gentle ping on this path, thanks.
>=20
> Please never top-post.
>=20
> Also, it is the middle of the merge window and we can not do anything wit=
h
> new submissions.  Please wait until next week at the earliest before we c=
an
> even start to look at stuff like this.
>=20
> What is the rush?
>=20
> thanks,
>=20
> greg k-h

No rush, just kindly reminder. Thanks for the notice.
