Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0082A3E4148
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 10:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C5F89B8F;
	Mon,  9 Aug 2021 08:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F59089ACD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 08:00:54 +0000 (UTC)
X-UUID: 140924844d034f5e8fc273a7d88dafef-20210809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=XcvOaLGk1HRjq5y310SuiImxziSOynrhvclPBysCIiY=; 
 b=JGwy9P3J8UYTQynq1hPRFOIwMcNBTDqi/o7teXFFHfGcKhYgxRQ9iTVl6QL7UhnEE1JszmKEq4iFL0OHDm2+9oHb4JJtB5pMNtG676Yz2AvENAqTP2R7+nFuckuYDK5kei780nXuEFH+0JWHvFrKfb9dbX/Dothj+VL+yaPU43M=;
X-UUID: 140924844d034f5e8fc273a7d88dafef-20210809
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 392432069; Mon, 09 Aug 2021 16:00:49 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 16:00:48 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Mon, 9 Aug 2021 16:00:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bf7GWp2FVvb03zb0Hy5rTGScPUBu53uXJWXrMVM0p19Lm6snWKewkwV5LyaMG1eJR6B7Jn9GQyjM5lUpZDCo80D2QklqMsVnuWM7xCLmUAN/XXt8cyVINRNgOLv/YUZS08Z0mZKM78VAIZPRNeickTc9u/yBhx2ftu0Q7skXigXBZUbEbLHpg9yJovBPmMDyeOCaNp75G5m/sjbuzGxEGDaPHYt2rqkx34/40LYnNhk/EQivmIIP4AMsqu1Ig/mZ63AoQXLuLXIfE0w2ZQ/ch7MwprNxtotgn4oS4qIoq9H8YMCv+oJQLg8dHmgO+tXFF1yAEnUbTLka/14JlLgF9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcvOaLGk1HRjq5y310SuiImxziSOynrhvclPBysCIiY=;
 b=eXtfCaFpePSdCklDdZq/QyTKXBk4+7u5XkLtBdSKS9/JBJhby5pI7hfyzeHVyenZ8q8Jjhig+opVWXsewRtOsxbUHY2+EYEg8hY3w46kxD9M6YCbVfuAF1HffP6deih+KiuzbXvVqCTOhhSkmzMCSWb+QFxnUiWBcKU8YpOYgbKZn2FOwfpPjQUc5/NaTUNAREwfg4B6hc0kltSbViFykSJJuaD3Wt8WwL8oLmK29X40EF0FQtHuHEuvyAG9AxvQifYz4K1uHxRtkDmTI0uip+kMKpK6QhJzAeluX3SAwGCOSUDUM21YR/BCI4GgIuDZFn0kwzp+UV5kYtUS2YvaYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcvOaLGk1HRjq5y310SuiImxziSOynrhvclPBysCIiY=;
 b=G+FqQlcwz+ULO6WrpdhXGMIkZAvYXVa7zfKZ3wmj7HUbGDDOKw/lSTM7Cu5Zq6nW8qFzRt2UzkWid3cmSVkyTinWLs2/q7KcZl8BUPlG33gVOC2aRDrsXibv9AecH1LhxExjyYTLZh8yH3jWmuOhJ+FX2/lvUjMYE9W9tN3P59U=
Received: from HK0PR03MB3139.apcprd03.prod.outlook.com (2603:1096:203:4b::11)
 by HK0PR03MB3938.apcprd03.prod.outlook.com (2603:1096:203:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.10; Mon, 9 Aug
 2021 08:00:35 +0000
Received: from HK0PR03MB3139.apcprd03.prod.outlook.com
 ([fe80::7c68:5b77:53c1:50de]) by HK0PR03MB3139.apcprd03.prod.outlook.com
 ([fe80::7c68:5b77:53c1:50de%5]) with mapi id 15.20.4415.012; Mon, 9 Aug 2021
 08:00:34 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
 =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
CC: srv_heupstream <srv_heupstream@mediatek.com>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 =?utf-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 =?utf-8?B?QW5hbiBTdW4gKOWtmeWuieWuiSk=?= <Anan.Sun@mediatek.com>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>, "tfiga@chromium.org"
 <tfiga@chromium.org>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, =?utf-8?B?WGlhIEppYW5nICjmsZ/pnJ4p?=
 <Xia.Jiang@mediatek.com>, "eizan@chromium.org" <eizan@chromium.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?utf-8?B?WWkgS3VvICjpg63mh78p?= <Yi.Kuo@mediatek.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "evgreen@chromium.org" <evgreen@chromium.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?QW50aG9ueSBIdWFuZyAo6buD5bu65ZiJKQ==?=
 <Anthony.Huang@mediatek.com>, =?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?=
 <tiffany.lin@mediatek.com>, "acourbot@chromium.org" <acourbot@chromium.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "drinkcat@chromium.org"
 <drinkcat@chromium.org>, "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "frank-w@public-files.de"
 <frank-w@public-files.de>, =?utf-8?B?TWluZy1GYW4gQ2hlbiAo6Zmz5piO5rGOKQ==?=
 <Ming-Fan.Chen@mediatek.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "will.deacon@arm.com" <will.deacon@arm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mka@chromium.org" <mka@chromium.org>
Subject: Re: [PATCH v7 04/12] iommu/mediatek: Add device_link between the
 consumer and the larb devices
Thread-Topic: [PATCH v7 04/12] iommu/mediatek: Add device_link between the
 consumer and the larb devices
Thread-Index: AQHXhO54JLI6FpzFKkWqO43jK2lQk6tk7+WAgAXveQA=
Date: Mon, 9 Aug 2021 08:00:34 +0000
Message-ID: <1bea58ed853eab23d4af8829538ab9aa22cbd340.camel@mediatek.com>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
 <20210730025238.22456-5-yong.wu@mediatek.com>
 <3f359c03-df44-2410-3172-2f17e620cada@collabora.com>
In-Reply-To: <3f359c03-df44-2410-3172-2f17e620cada@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none; collabora.com; dmarc=none action=none header.from=mediatek.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4451291-a746-4ec5-885a-08d95b0bc47d
x-ms-traffictypediagnostic: HK0PR03MB3938:
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR03MB393839F65113BCB2BD94048E98F69@HK0PR03MB3938.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aOLdGaQfQHbBDaLegFyQRrhQMMKaGgTGrFIX2E+Y7W2tuM0gPSl/MLBOEglqa6JHnjMauKJDQt0nQEvHJ25Ow0W+Sn05JOZKUsFdpmA+inAvubYWqVlYenSU0DTkLmjDfq25yRPId/+91s3em8BbMi9loO0Y8M9fZ2dUxZiu8V3yRT0ShWOCeSYcXH9XPyJbC8OHLFwCh3fF6EKUiwigT8lf0P5BQpxaJSgkntXypJmxC3ovf8ranGKDlOZLDo18JIOdz3WSYFClisAYXquNLugf1uCpNhzve2OMKxJGLsFYK3QfjZhvf36Toe4amjS5iROV24WPqep0k3jU0HEoCXFz+5LBHQOi21+8kpBvN9ZzEL/0ncNa7BMyHc/6EBgil/IcAK2C6a7tCoxrP6DnpNN7PxJvpt7SRNS6vX21QoW3DK9CaHM3a7alHvoS28RqaG+Caw+/bBVQt0qdwILZsG7JGbeY2nESKa9Bar4Xj3/x9TMpWf5d57FwQjTf0GRH9mi4yRovBQxhw5STO0MmmG2rEBHWBk5b1KT201cLtp5iL323qyseuB2SWbJSUiajnxebBkImlmyNoVxc3oUgiUZZpOt5p2NivUd6NtBq93CblQ+DvYgHaQ2ZNNhit/pBa0O/txIm8JN01Q1gQZ2T5gPqDaT/Sve6kzNh12mLW3QeTMQDtZwEADYkIlolD4/X6SRH0dXes0L77ME0Swf3AbnX4gOHNJ++MWMMQAhpzq8AMX1/OFqtP1aIFdDehPrdYXF5av2pCdbWG1gfvpY+IjwX+a6lZ25OGO64j7ItS0L4TtdrXoWXh2Vev6dWjDrdQB+9EhOSqAFPyIdUJbBLZdqBDKUo4Sc2V22UngpCLgY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3139.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(186003)(6506007)(122000001)(38070700005)(53546011)(85182001)(83380400001)(36756003)(86362001)(38100700002)(110136005)(4326008)(6512007)(5660300002)(966005)(7416002)(2906002)(8676002)(6636002)(6486002)(2616005)(66946007)(66556008)(64756008)(66446008)(316002)(54906003)(508600001)(76116006)(66476007)(71200400001)(8936002)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmZIWGk4aVhSVnpRWXM4VS83bk4rOXBBOUZYU3ZvLytteFg2TCthdklCL3Rk?=
 =?utf-8?B?ZnhLRmxmS2lTZTdwbjdEL2FtaXFIaWR1eW9FaW4vNHIwY3NadXdWNXJnTm9P?=
 =?utf-8?B?V0N4THJzazlpL21hZmtxbVZhYWk4M2Qvb0kyNG5vQnUwWWZoRy9JTGg5UDJl?=
 =?utf-8?B?b0VjZERUYTRCS0NrakcxWm5hdkkwakZRNjNLdDZjcWxhbzlaZWZKelBJU3lt?=
 =?utf-8?B?YmxwKytTTm1ldElCZzV5c1ZDaVArZGRXajBrUVJkK2ZBUEgvZnhtMzFQYVFL?=
 =?utf-8?B?T055bXNjR0ZoQ3RxcHVvQ0EzTGs4cTlnNmRZcGJCOFFnRENrK1JZSlFTTk8y?=
 =?utf-8?B?M1YxVmxaTmY5VUtHUzJET3UzL1JaakZwS2kySDVqcG91dUN2MnhHcFplQ2F5?=
 =?utf-8?B?TjNOWTZkdTUvTDdFWTRXRVUyVnpndEYwZTlHU0pxSEQvRjB5Yi9XNG4rZ05h?=
 =?utf-8?B?ZjZsSUg1c0RqMnN5NjNxN0lCYkYxSDZLMW1pdFFsUit6QURnU1hCOElWT1JP?=
 =?utf-8?B?QnpSSVpSY3JGODlzdFR0ZVVzeW1PODFTcW9WYVlTVzhuSmlHSG9KKzlTdVM5?=
 =?utf-8?B?aXM5eUdtRGk2bGpvU0htRmtOaDR2ZmFiWmltSU43S2RzSm1YVFdEWVY2ODli?=
 =?utf-8?B?dlhheEwzYUMrY0s5UzVVaTNLSUp0WVlwZmFqTURKdjVYc3pHMmdLN1FWeVZQ?=
 =?utf-8?B?blV6MkdINSt0Z1pUcnFHNkhsS1JqOG01ekxHOUljNzJVeHZkcnhwY1Z0Z2hk?=
 =?utf-8?B?cUNsL2ZsM2thSXlnZ2x3SlVzRGFBdFE1VDN6d0tMVVE5TTEwTUlQSDF0MFI5?=
 =?utf-8?B?MngyTWV1MTRvdlBENDF5cmhodnNrTWExRzVxT2x2VmRybXRCQnUzRUI0MWFa?=
 =?utf-8?B?bHo3TzZKZm5WOWpNV2laU0xEa2tTd0hTeE9IWjYwSjI1SWVvcWVDYTBVVXh2?=
 =?utf-8?B?cU5GM25iaTQxMFlhVWNOUndGckJJQ25WVHhYOG5ZOHhWZEJ5VHJWeE4zeWZZ?=
 =?utf-8?B?VCtTL0hOYktFUHI3V2xDYkR3RXdXUjN4VjhMT3J4RnpheEltMEdmWEY3aVRJ?=
 =?utf-8?B?VHJvWnU1emRYVzU1R2RPVWowS1h4RVprVlFxMEttWEhlTm5MTjJvZTc2d1BB?=
 =?utf-8?B?enRHQ3lEaVJ0U1FkNkZSaUx0ZTNGOFRZQUpFNXJHOFFmT2lEaU9JMnh2Z3c0?=
 =?utf-8?B?N3lObklOYUxBaUg0c3lVVFFjUUVtNlRReXhzQmk0QTZaUUlBZEdSZlF1NW4y?=
 =?utf-8?B?eisrVG5NbTRRVlZxMExtMnZaZWtScm5tR1hhbUdyYlRBbGxTdzFVMXNOa3pp?=
 =?utf-8?B?cFJ0ZGVDczduV211TC9GUEw5bkNvTGp2bmdtZkE2R2MvUVlGcWtkdEczYkFU?=
 =?utf-8?B?WGh2UldUazBGOTZZVVlaaFg0VlQ2a1FMNU5rZnV1VXVoeDVvVytoaW1RQVRI?=
 =?utf-8?B?dmEvK2JWbVJ3cDV4U05jWk8zZkR2MXluRHFWaXVGVEp6Y1I4WGpYKzFGeWk4?=
 =?utf-8?B?bU1tV0NnU3MrZEVydm9vMHhSZ3ZYbzlGb2F1d0k0a04rNi9nSXFCMDFVS3Fi?=
 =?utf-8?B?WE1GT0gyVEZDSFF1TWZyWVhnSnNlRGFZdUFMZFY3OUsyRWQvOUs1MFgyclhY?=
 =?utf-8?B?dGRiVlFaSGtaZld6dW1Qand0Z3lTd3RRL05xVkxjMTZwN2hYVE9VZTMxZmdo?=
 =?utf-8?B?NVdaMmlpZlZFZ2hYbkcxVXJFeW5yWkwzOHJaaFZZT1ZDTDB1RittMWhKVWFp?=
 =?utf-8?Q?DGiwnjqixOM2rBPhZHXmVW61ztYax0LHkTX4dpl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A9BCFF786BBC44AB1A9BB11E6DB8F5A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3139.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4451291-a746-4ec5-885a-08d95b0bc47d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2021 08:00:34.5696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eNlfgnuNU3IMJ0V8DPMtRBxJ3Qf9dTsv40hElQLD89UfLWfMlHS5VlRwiXLSYrTG9A9soFGo0SMjPSchIW6YTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3938
X-MTK: N
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

T24gVGh1LCAyMDIxLTA4LTA1IGF0IDE1OjIyICswMjAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3Rl
Og0KPiANCj4gT24gMzAuMDcuMjEgMDQ6NTIsIFlvbmcgV3Ugd3JvdGU6DQo+ID4gTWVkaWFUZWsg
SU9NTVUtU01JIGRpYWdyYW0gaXMgbGlrZSBiZWxvdy4gYWxsIHRoZSBjb25zdW1lciBjb25uZWN0
DQo+ID4gd2l0aA0KPiA+IHNtaS1sYXJiLCB0aGVuIGNvbm5lY3Qgd2l0aCBzbWktY29tbW9uLg0K
PiA+IA0KPiA+ICAgICAgICAgIE00VQ0KPiA+ICAgICAgICAgICB8DQo+ID4gICAgICBzbWktY29t
bW9uDQo+ID4gICAgICAgICAgIHwNCj4gPiAgICAtLS0tLS0tLS0tLS0tDQo+ID4gICAgfCAgICAg
ICAgIHwgICAgLi4uDQo+ID4gICAgfCAgICAgICAgIHwNCj4gPiBsYXJiMSAgICAgbGFyYjINCj4g
PiAgICB8ICAgICAgICAgfA0KPiA+IHZkZWMgICAgICAgdmVuYw0KPiA+IA0KPiA+IFdoZW4gdGhl
IGNvbnN1bWVyIHdvcmtzLCBpdCBzaG91bGQgZW5hYmxlIHRoZSBzbWktbGFyYidzIHBvd2VyDQo+
ID4gd2hpY2gNCj4gPiBhbHNvIG5lZWQgZW5hYmxlIHRoZSBzbWktY29tbW9uJ3MgcG93ZXIgZmly
c3RseS4NCj4gPiANCj4gPiBUaHVzLCBGaXJzdCBvZiBhbGwsIHVzZSB0aGUgZGV2aWNlIGxpbmsg
Y29ubmVjdCB0aGUgY29uc3VtZXIgYW5kDQo+ID4gdGhlDQo+ID4gc21pLWxhcmJzLiB0aGVuIGFk
ZCBkZXZpY2UgbGluayBiZXR3ZWVuIHRoZSBzbWktbGFyYiBhbmQgc21pLQ0KPiA+IGNvbW1vbi4N
Cj4gPiANCj4gPiBUaGlzIHBhdGNoIGFkZHMgZGV2aWNlX2xpbmsgYmV0d2VlbiB0aGUgY29uc3Vt
ZXIgYW5kIHRoZSBsYXJicy4NCj4gPiANCj4gPiBXaGVuIGRldmljZV9saW5rX2FkZCwgSSBhZGQg
dGhlIGZsYWcgRExfRkxBR19TVEFURUxFU1MgdG8gYXZvaWQNCj4gPiBjYWxsaW5nDQo+ID4gcG1f
cnVudGltZV94eCB0byBrZWVwIHRoZSBvcmlnaW5hbCBzdGF0dXMgb2YgY2xvY2tzLiBJdCBjYW4g
YXZvaWQNCj4gPiB0d28NCj4gPiBpc3N1ZXM6DQo+ID4gMSkgRGlzcGxheSBIVyBzaG93IGZhc3Rs
b2dvIGFibm9ybWFsbHkgcmVwb3J0ZWQgaW4gWzFdLiBBdCB0aGUNCj4gPiBiZWdnaW5pbmcsDQo+
ID4gYWxsIHRoZSBjbG9ja3MgYXJlIGVuYWJsZWQgYmVmb3JlIGVudGVyaW5nIGtlcm5lbCwgYnV0
IHRoZSBjbG9ja3MNCj4gPiBmb3INCj4gPiBkaXNwbGF5IEhXKGFsd2F5cyBpbiBsYXJiMCkgd2ls
bCBiZSBnYXRlZCBhZnRlciBjbGtfZW5hYmxlIGFuZA0KPiA+IGNsa19kaXNhYmxlDQo+ID4gY2Fs
bGVkIGZyb20gZGV2aWNlX2xpbmtfYWRkKC0+cG1fcnVudGltZV9yZXN1bWUpIGFuZCBycG1faWRs
ZS4gVGhlDQo+ID4gY2xvY2sNCj4gPiBvcGVyYXRpb24gaGFwcGVuZWQgYmVmb3JlIGRpc3BsYXkg
ZHJpdmVyIHByb2JlLiBBdCB0aGF0IHRpbWUsIHRoZQ0KPiA+IGRpc3BsYXkNCj4gPiBIVyB3aWxs
IGJlIGFibm9ybWFsLg0KPiA+IA0KPiA+IDIpIEEgZGVhZGxvY2sgaXNzdWUgcmVwb3J0ZWQgaW4g
WzJdLiBVc2UgRExfRkxBR19TVEFURUxFU1MgdG8gc2tpcA0KPiA+IHBtX3J1bnRpbWVfeHggdG8g
YXZvaWQgdGhlIGRlYWRsb2NrLg0KPiA+IA0KPiA+IENvcnJlc3BvbmRpbmcsIERMX0ZMQUdfQVVU
T1JFTU9WRV9DT05TVU1FUiBjYW4ndCBiZSBhZGRlZCwgdGhlbg0KPiA+IGRldmljZV9saW5rX3Jl
bW92ZWQgc2hvdWxkIGJlIGFkZGVkIGV4cGxpY2l0bHkuDQo+ID4gDQo+ID4gWzFdIA0KPiA+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhdGVrLzE1NjQyMTM4ODguMjI5MDguNC5j
YW1lbEBtaGZzZGNhcDAzLw0KPiA+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdv
cmsvcGF0Y2gvMTA4NjU2OS8NCj4gPiANCj4gPiBTdWdnZXN0ZWQtYnk6IFRvbWFzeiBGaWdhIDx0
ZmlnYUBjaHJvbWl1bS5vcmc+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZyBXdSA8eW9uZy53dUBt
ZWRpYXRlay5jb20+DQo+ID4gVGVzdGVkLWJ5OiBEYWZuYSBIaXJzY2hmZWxkIDxkYWZuYS5oaXJz
Y2hmZWxkQGNvbGxhYm9yYS5jb20+ICMgb24NCj4gPiBtdDgxNzMNCj4gDQo+IEhpLCB1bmZvcnR1
bmF0ZWx5LCBJIGhhdmUgdG8gdGFrZSBiYWNrIHRoZSBUZXN0ZWQtYnkgdGFnLg0KDQpzb3JyeSBm
b3IgaW5jb252ZW5pZW5jZSB5b3UuDQoNCihhbmQgc29ycnkgZm9yIHJlcGx5IGxhdGUsIHRoZXJl
IGlzIHNvbWV0aGluZyB3cm9uZyBhYm91dCBteSBsb2NhbCBtYWlsDQpzZXJ2ZXIuKQ0KDQo+IEkg
YW0gbm93IHRlc3RpbmcgdGhlIG10ay12Y29kZWMgd2l0aCBsYXRlc3Qga2VybmVsICsgcGF0Y2hl
cyBzZW50DQo+IGZyb20gdGhlIG1haWxpbmcgbGlzdDoNCj4gDQpodHRwczovL2dpdGxhYi5jb2xs
YWJvcmEuY29tL2ViYWxsZXRiby9saW51eC8tL2NvbW1pdHMvdG9waWMvY2hyb21lb3MvY2hyb21l
b3MtNS4xNA0KPiB3aGljaCBpbmNsdWRlcyB0aGlzIHBhdGNoc2V0Lg0KPiANCj4gT24gY2hyb21l
b3MgSSBvcGVuIGEgdmlkZW8gY29uZmVyZW5jZSB3aXRoIGdvb2dsLW1lZXQgd2hpY2ggY2F1c2Ug
dGhlDQo+IG10ay12Y29kZWMgdnA4IGVuY29kZXIgdG8gcnVuLg0KPiBJZiBJIGtpbGwgaXQgd2l0
aCBga2lsbGFsbCAtOSBjaHJvbWVgIEkgZ2V0IHNvbWUgcGFnZSBmYXVsdCBtZXNzYWdlcw0KPiBm
cm9tIHRoZSBpb21tdToNCg0KRG9lcyB0aGUgImdpdCBiaXNlY3QiIHBvaW50IHRvIHRoaXMgcGF0
Y2g/DQoNCklmIHlvdSBkb24ndCBraWxsIGl0LCBEb2VzIGl0IGFsc28gaGF2ZSB0aGVzZSBlcnJv
ciBiZWxvdz8NCg0KSSBkb24ndCBrbm93IHdoYXQgaGFwcGVuIGFib3V0ICJraWxsYWxsIC05IGNo
cm9tZScsIERvZXMgaXQgY2F1c2UNCmZyZWVpbmcgc29tZSBidWZmZXI/DQoNCj4gDQo+IFsgIDgz
Ny4yNTU5NTJdIG10ay1pb21tdSAxMDIwNTAwMC5pb21tdTogZmF1bHQgdHlwZT0weDUNCj4gaW92
YT0weGZjZmYwMDAxIHBhPTB4MCBsYXJiPTAgcG9ydD0wIGxheWVyPTEgcmVhZA0KDQpUaGlzIG1l
YW5zICJsYXJiMCBwb3J0MCIgdHJhbnNsYXRpb24gZmF1bHQuIA0KDQpJZiBJIGFtIG5vdCB3cm9u
ZywgeW91IHdvcmsgYXQgbXQ4MTczLCBmcm9tIFswXSwgdGhpcyBpcyBESVNQX09WTDAuDQoNCk1h
eSBiZSAia2lsbGFsbCAtOSBjaHJvbWUiIGZyZWUgdGhlIGJ1ZmZlcihpb3ZhOjB4ZmNmZjAwMDAp
IHRoYXQNCkRJU1BfT1ZMIGlzIGFjY2Vzc2luZywgdGhlbiBpb21tdSBjb21wbGFpbiBpdCBpcyBu
b3QgYSB2YWxpZCBpb3ZhLg0KDQpbMF0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC92NS4xNC1yYzEvc291cmNlL2luY2x1ZGUvZHQtYmluZGluZ3MvbWVtb3J5L210ODE3My1sYXJi
LXBvcnQuaCNMMTkNCg0KPiBbICA4MzcuMjY1Njk2XSBtdGstaW9tbXUgMTAyMDUwMDAuaW9tbXU6
IGZhdWx0IHR5cGU9MHg1DQo+IGlvdmE9MHhmY2ZmMDAwMSBwYT0weDAgbGFyYj0wIHBvcnQ9MCBs
YXllcj0xIHJlYWQNCj4gWyAgODM3LjI4MjM2N10gbXRrLWlvbW11IDEwMjA1MDAwLmlvbW11OiBm
YXVsdCB0eXBlPTB4NQ0KPiBpb3ZhPTB4ZmNmZjAwMDEgcGE9MHgwIGxhcmI9MCBwb3J0PTAgbGF5
ZXI9MSByZWFkDQo+IFsgIDgzNy4yOTkwMjhdIG10ay1pb21tdSAxMDIwNTAwMC5pb21tdTogZmF1
bHQgdHlwZT0weDUNCj4gaW92YT0weGZjZmYwMDAxIHBhPTB4MCBsYXJiPTAgcG9ydD0wIGxheWVy
PTEgcmVhZA0KPiBbICA4MzcuMzE1NjgzXSBtdGstaW9tbXUgMTAyMDUwMDAuaW9tbXU6IGZhdWx0
IHR5cGU9MHg1DQo+IGlvdmE9MHhmY2ZmMDAwMSBwYT0weDAgbGFyYj0wIHBvcnQ9MCBsYXllcj0x
IHJlYWQNCj4gWyAgODM3LjMzMjM0NV0gbXRrLWlvbW11IDEwMjA1MDAwLmlvbW11OiBmYXVsdCB0
eXBlPTB4NQ0KPiBpb3ZhPTB4ZmNmZjAwMDEgcGE9MHgwIGxhcmI9MCBwb3J0PTAgbGF5ZXI9MSBy
ZWFkDQo+IFsgIDgzNy4zNDkwMDRdIG10ay1pb21tdSAxMDIwNTAwMC5pb21tdTogZmF1bHQgdHlw
ZT0weDUNCj4gaW92YT0weGZjZmYwMDAxIHBhPTB4MCBsYXJiPTAgcG9ydD0wIGxheWVyPTEgcmVh
ZA0KPiBbICA4MzcuMzY1NjY1XSBtdGstaW9tbXUgMTAyMDUwMDAuaW9tbXU6IGZhdWx0IHR5cGU9
MHg1DQo+IGlvdmE9MHhmY2ZmMDAwMSBwYT0weDAgbGFyYj0wIHBvcnQ9MCBsYXllcj0xIHJlYWQN
Cj4gWyAgODM3LjM4MjMyOV0gbXRrLWlvbW11IDEwMjA1MDAwLmlvbW11OiBmYXVsdCB0eXBlPTB4
NQ0KPiBpb3ZhPTB4ZmNmZjAwMDEgcGE9MHgwIGxhcmI9MCBwb3J0PTAgbGF5ZXI9MSByZWFkDQo+
IFsgIDgzNy40MDAwMDJdIG10ay1pb21tdSAxMDIwNTAwMC5pb21tdTogZmF1bHQgdHlwZT0weDUN
Cj4gaW92YT0weGZjZmYwMDAxIHBhPTB4MCBsYXJiPTAgcG9ydD0wIGxheWVyPTEgcmVhZA0KPiAN
Cj4gSW4gYWRkaXRpb24sIHJ1bm5pbmcgdGhlIGVuY29kZXIgdGVzdHMgZnJvbSB0aGUgc2hlbGw6
DQo+IA0KPiBzdWRvIC0tdXNlcj0jMTAwMCAvdXNyL2xvY2FsL2xpYmV4ZWMvY2hyb21lLWJpbmFy
eS0NCj4gdGVzdHMvdmlkZW9fZW5jb2RlX2FjY2VsZXJhdG9yX3Rlc3RzIC0tDQo+IGd0ZXN0X2Zp
bHRlcj1WaWRlb0VuY29kZXJUZXN0LkZsdXNoQXRFbmRPZlN0cmVhbV9NdWx0aXBsZSogIA0KPiAt
LWNvZGVjPXZwOA0KPiAvdXNyL2xvY2FsL3NoYXJlL3Rhc3QvZGF0YS9jaHJvbWl1bW9zL3Rhc3Qv
bG9jYWwvYnVuZGxlcy9jcm9zL3ZpZGVvL2QNCj4gYXRhL3R1bGlwMi0zMjB4MTgwLnl1diAtLWRp
c2FibGVfdmFsaWRhdG9yDQo+IA0KPiBBdCBzb21lIHBvaW50IGl0IGZhaWxzIHdpdGggdGhlIGVy
cm9yDQo+IA0KPiBbIDU0NzIuMTYxODIxXSBbTVRLX1Y0TDJdW0VSUk9SXSBtdGtfdmNvZGVjX3dh
aXRfZm9yX2RvbmVfY3R4OjMyOg0KPiBbMjkwXSBjdHgtPnR5cGU9MSwgY21kPTEsIHdhaXRfZXZl
bnRfaW50ZXJydXB0aWJsZV90aW1lb3V0DQo+IHRpbWU9MTAwMG1zIG91dCAwIDAhDQo+IFsgNTQ3
Mi4xNzQ2NzhdIFtNVEtfVkNPREVDXVtFUlJPUl1bMjkwXTogdnA4X2VuY19lbmNvZGVfZnJhbWUo
KQ0KPiBpcnFfc3RhdHVzPTAgZmFpbGVkDQo+IFsgNTQ3Mi4xODI2ODddIFtNVEtfVjRMMl1bRVJS
T1JdIG10a192ZW5jX3dvcmtlcjoxMjM5OiB2ZW5jX2lmX2VuY29kZQ0KPiBmYWlsZWQ9LTUNCg0K
K291ciB2ZW5jIGd1eSBJcnVpLg0KDQpUaGlzIGxvb2tzIFZFTkMgSFcgZG9uJ3Qgc3RhcnQgdG8g
d29yay4gRG9lcyB0aGlzIGNhdXNlZCBieSB0aGlzDQpwYXRjaHNldD8gIHRoaXMgcGF0Y2hzZXQg
b25seSBjaGFuZ2UgdGhlIGZsb3cgb2YgcG93ZXIuDQoNCkkgZ3Vlc3Mgd2Ugc2hvdWxkIGNoZWNr
IGlmIHRoZSBwb3dlci9jbG9jayBmb3IgdmVuYyBoZXJlIGlzIGVuYWJsZSBvcg0Kbm90Pw0KDQo+
IA0KPiANCj4gSWYgeW91IGhhdmUgYW55IGlkZWEgb2Ygd2hhdCBtaWdodCBiZSB0aGUgcHJvYmxl
bSBvciBob3cgdG8gZGVidWc/DQo+IA0KPiBUaGFua3MsDQo+IERhZm5hDQo+IA0KPiA+IC0tDQo=
