Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 570863E418F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 10:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB368940E;
	Mon,  9 Aug 2021 08:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317E98940E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 08:30:22 +0000 (UTC)
X-UUID: 0dfe6980362543f69d58323e7ca8b11f-20210809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=DDegfEk6lWN2cZebSAw+He4OGGIMw0uuY2WfLAyVcn4=; 
 b=bjaHtoUuq57REYZ0uSDD+1fjVc60j/ub6Zmat0u6CM8KxH9OzuE88GPOcISS4xBEyZXAh9LdGr7Zm4wQXyEHmQQisdObJTeIwxq5EP7M1Nvt/Ju9Dg0TW6++UKohIhXEqlhvX/dGR/JWLsLXD2GdLZX1Q6W9fDJbjk6q/nXKl0c=;
X-UUID: 0dfe6980362543f69d58323e7ca8b11f-20210809
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 664520856; Mon, 09 Aug 2021 16:30:17 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 16:30:15 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP
 Server id
 15.2.792.15 via Frontend Transport; Mon, 9 Aug 2021 16:30:16 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVjlDWGKs71VOmXBO8kZeFs/+hqrlCMNQ8x1BspR5t+8zm1XFj2w8kO0lXUZ1F4Jy2xw+5sgqguielb5N98Hov/JW4y2L/DFBbGD7UfAh6MfJR5xu04F9dQStC3/jsx7emF6eLX2EvCzhXzU69QaeMtVPO6qs7m3DJa4mMeG+r6nPeNhfso9IpbJY4LN4Tp7vkM3XmK52TcfC0fhl7eZbVSDlLilTVOrQ4L/wb0KvrTKJm/meYZAl7ZEEmLHw8l5lf2dFu2jVWH3oK056IgDgYFBKqse8qwYTqJwygVFgJ++fdgozSCPzCmHvG/eASohOfy6+CkdI5QfXgedNLzWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDegfEk6lWN2cZebSAw+He4OGGIMw0uuY2WfLAyVcn4=;
 b=eNDamAh0EHJFkgVvyhBoXUZ75KRq2r273rP74Bn64ouyLlF9h52ONkJd4//9NF91R3IofPOGX8Nxh4j85YLCxogzrEHbM1EdXL/72XRLUnLCDfUq3YvxzT86GnBq9hKiO9Sv77EGYNoXpihGiBEsxmSP9XGYZhWqLF0CfIXs5BzuwajBzWWisPBUe5Difv6jUM5nE0+x2TqPESHNPio8R9H1TTp2ntiYen8vpAa7KaMDkMdsbw6mUW209h2G+eCx9O96Y9x3DcChIaQI33fIu4are0iQ/0vIfBGxbkQIxm9Dllo28/2gLNgQQhwU7IvJWJWOGhz/x5YyqxDgWUd1ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDegfEk6lWN2cZebSAw+He4OGGIMw0uuY2WfLAyVcn4=;
 b=giHCIMTU8mUaS2WOttAM+bQZforki7QeO6FSkCT8pFX9WtLmv9QoOlJisy/Rfmdsrx5Wni+RzusjwNlb1jbU+uvcVCXhSsBk+9z4A8bzK2mKLiMxka7q84DRQOtT248TRrmk42nFOECC/A68Q9qDzt5hR41PJ0PbTr2MeA1dqrA=
Received: from HK0PR03MB3139.apcprd03.prod.outlook.com (2603:1096:203:4b::11)
 by HK0PR03MB4689.apcprd03.prod.outlook.com (2603:1096:203:bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.9; Mon, 9 Aug
 2021 08:30:03 +0000
Received: from HK0PR03MB3139.apcprd03.prod.outlook.com
 ([fe80::7c68:5b77:53c1:50de]) by HK0PR03MB3139.apcprd03.prod.outlook.com
 ([fe80::7c68:5b77:53c1:50de%5]) with mapi id 15.20.4415.012; Mon, 9 Aug 2021
 08:30:03 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "joro@8bytes.org" <joro@8bytes.org>
CC: "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 =?utf-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 =?utf-8?B?QW5hbiBTdW4gKOWtmeWuieWuiSk=?= <Anan.Sun@mediatek.com>,
 "tfiga@chromium.org" <tfiga@chromium.org>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, =?utf-8?B?WGlhIEppYW5nICjmsZ/pnJ4p?=
 <Xia.Jiang@mediatek.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "eizan@chromium.org" <eizan@chromium.org>, 
 =?utf-8?B?WWkgS3VvICjpg63mh78p?= <Yi.Kuo@mediatek.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "evgreen@chromium.org" <evgreen@chromium.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 =?utf-8?B?QW50aG9ueSBIdWFuZyAo6buD5bu65ZiJKQ==?=
 <Anthony.Huang@mediatek.com>, "acourbot@chromium.org"
 <acourbot@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>,
 "drinkcat@chromium.org" <drinkcat@chromium.org>, "hsinyi@chromium.org"
 <hsinyi@chromium.org>, =?utf-8?B?TWluZy1GYW4gQ2hlbiAo6Zmz5piO5rGOKQ==?=
 <Ming-Fan.Chen@mediatek.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "frank-w@public-files.de"
 <frank-w@public-files.de>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "will.deacon@arm.com"
 <will.deacon@arm.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "mka@chromium.org"
 <mka@chromium.org>
Subject: Re: [PATCH v7 00/12] Clean up "mediatek,larb"
Thread-Topic: [PATCH v7 00/12] Clean up "mediatek,larb"
Thread-Index: AQHXhO4/B+asb7CmWUi2ITwnwJWoI6tf/iCAgArljAA=
Date: Mon, 9 Aug 2021 08:30:03 +0000
Message-ID: <ed099698f63bec6771561bcad7022dbff184ce7f.camel@mediatek.com>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
 <YQfALZNWyw8VKODp@8bytes.org>
In-Reply-To: <YQfALZNWyw8VKODp@8bytes.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: 8bytes.org; dkim=none (message not signed)
 header.d=none;8bytes.org; dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f64dd73b-b873-4f9b-274b-08d95b0fe2cf
x-ms-traffictypediagnostic: HK0PR03MB4689:
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR03MB46892A100ADA547C11A4E6FC98F69@HK0PR03MB4689.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e600U8MSOTRqFFhTE+TKVtab4W/AYFq4Xrxb0r/NyJKHsh1mi6nmY/o9kSimy3MxdORVSV+SNBDkdawE+CeSiDKF7Br59lJs9fKzuqr3Xuml2xHQg8zhKbpDQQbudi7WI1F43uZHcUlt8CKmU6HaSt0rOy6TXeD2SQjJ9Ox4FumvhYwHjxe/DGmsXsVQL4gUp6GV23IRkokgRqGSh3KEZ2aLfKYV5Dy3IsnN1lcZLAjyeB3f0OvMynbeahYxWtrhgZO6LgtO1mGhHimMMubjt0kbErD3kCktRqW3LZVUNNarK43FGz0ervddIXywYLyI3l7CKQr1vvQFACyNGIcjnsThd7GSAckDZpGasHBJd8yTQrU3+8JDfY5sN9MO4gtZFDjXXm8lyR82X2xR94ogyktU4tXZ/YdhqYyoRrnrex0+FeteYHpR80GL7CJWuot0IsOeCU1+XhUGAeB6coPJYW2AI1y43UWLh1zCC/2OFEEp0SaBlS92eY2QmnJe/LF0DzqC1XZY8TFV9LXXMZac7NYhTsStwSDUzOoDNAEBp4NWuQ1AXFtAue3RWi/n8hztp+5B045r7Jjx7U4qeVznSggdfxGMfuRsLA0zdn8Q3RiY3rZRDOauakUGu9Ab+k60/s5e4y0//dZTIsy9L9PZxCh7aynl4gTiZHY66eclCCeMk33vsb8Ml9t+/WYC1lbSWievfu3Xrw7EuRGgP2VTTOpHkMnyoe8InvhzB79jftk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB3139.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(54906003)(83380400001)(6916009)(36756003)(122000001)(8936002)(6486002)(2906002)(38070700005)(316002)(85182001)(26005)(5660300002)(2616005)(7416002)(66446008)(66946007)(66556008)(66476007)(6512007)(6506007)(4326008)(8676002)(64756008)(186003)(76116006)(38100700002)(508600001)(86362001)(71200400001)(99106002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2xpcnhDY3lQTFozSEJPOXhoRTM3N0g2UDFYcERwcE1PQ1JyR0FLQkFkNWdV?=
 =?utf-8?B?QU5lVThOUXpvY0FSZHdQcHJwa0l6VjE5QlRESTBrU2M1bTh1QUR6Q2w4Rkl4?=
 =?utf-8?B?R0J6dTdPQzlKK3pTV3J4czdpWHhKU28xN1gza0V4bFFucEM2OXlCdWlJZE5y?=
 =?utf-8?B?UjdzUkZLUk5tb3IxbzM0bWp4TzhPSExxNnM1MEF6STlsWFBRLzVPbWg3Wkw2?=
 =?utf-8?B?ZGNxK0ZlMWZFWjUyUURNbEE2YXlHZTg2WG9WYktITmpibFU2MWk0N1VaQzlN?=
 =?utf-8?B?eEZJTUFSazFrdGF5RmlFRnV2UWxLYWp0RkRzLzFnNFBwWDhHM3JJNGpuSHI5?=
 =?utf-8?B?VjlsdmFNME1lSEg4UXQ1eTBKakZIeis1d2l1MzZ0U1Z3L2EzSkdMdWt1dUxO?=
 =?utf-8?B?SkllSzhtUHpJaERkUk5VMjNZNzZrOFE5T0NUS1g1ZDhzTzBKcFYxY1pGQ3h3?=
 =?utf-8?B?ZFE4TUY4Z3Z0SnZNYjBGVDNxU0pQTVd0VFVSdVZHT0Juc2dVSGxTdEsrYmlB?=
 =?utf-8?B?bTNObXkzMFVBQ01POUFFNS9YTGMzOGYvTWdvY1gyZVJEaFlCT05hNDJjR29i?=
 =?utf-8?B?V1NHUGIyUERlVXdNam1RMzB6V0R6T0ZLLzVvSHYrTUp4U1FML29EK0k5Yk5T?=
 =?utf-8?B?WWFLSHFZWVRnSzlmcjBNaVR5MTc3R1ZPTmxaQU1XaWRwVTJrcVpTWkREU1NR?=
 =?utf-8?B?NEtoMGRBaXk5V1hOZ0JGYm5CdHU5SEFzaVJud2EwL2Z6cXNqajhQbnd0bFVE?=
 =?utf-8?B?Z0hlaW5sNXdwYThmdmFwQ3QwTndXZmY1RktySXNzenhXTFdJbWd5TFJseERx?=
 =?utf-8?B?ay9WWjhpdUdZNUkrd25jSER4d1JKOWhuYUlPVkhMRE8wdmd3V2lqZk1Pa3Jn?=
 =?utf-8?B?cEVlazl1emk3aTZkbEJybjR2aDdtNzhLbmhzL3dUd1V5T2U4UzZBMjhnakVX?=
 =?utf-8?B?ZzFXUEFUcTRXbFYrWGZsQU9iN256ZG9JREVVMWtac3pHbkxiUWppZVQ0Sy9n?=
 =?utf-8?B?S25KWVYweWVyZjErdDM1cm5iejNOa0wrQ00zWnBTbWRrRkZ4d3psLzBpVngv?=
 =?utf-8?B?NE44T1JzWTBkM1Mxbm5hRXJONW9hNUlNazdlbzdzWGVzUis2YkxiU0p1c0ly?=
 =?utf-8?B?ZmZKV3ZlQ2JGeWlNNlljRjZLTHVwWWVQVlhGMm5DL2ZoSG9EdDNiUm45Y1hz?=
 =?utf-8?B?dzRTZUNzNHBuNUU4VktDS3RMS2psblpTKzBVSG0vNE0xS05hc0VnMmVhU3hl?=
 =?utf-8?B?dVZtK3E3N3NreHEva1hJSFJkaS9lOHZqbjArUmhiTmt4WlREQ1lGaC9kZHFz?=
 =?utf-8?B?N1QwWFhmZmY4R3BUVkozOTc0bGJXckRadElBK2pwTHdtaFBVK2FGRDdRUng3?=
 =?utf-8?B?czF2VG5SVmJvWGtDM2tidjFvMi9RVEVlK05GZm1uSzRsWWVoYkJEY2xudDJG?=
 =?utf-8?B?OVJ1YXVWSkJ5b2ZKSEdUK2UvUTJSd1h5ajFweFIvTTA5UGVhNUFZUTE4Uzcw?=
 =?utf-8?B?cW1mNm1oaGtLVUxDWmErUFNGWUNydGcxTk1rTVIzYUFhbFgxT3hkTWx5UG5s?=
 =?utf-8?B?UVFWSzRpclRtelYvSDB6NDRrOWtVaHZTRC9wT05KdFRudkNHWUQxLzV3YXNm?=
 =?utf-8?B?VEJLZzBVTmIrMHRnTHNXbE9QanN4anlJd1JtdzdxV0dDcmJBQUoveXlNb25K?=
 =?utf-8?B?d0xtdllWeXhwazBacGthNG5GaCt6dDhJQ0wweGlBbS90dWd0MWxBWmY5aWxv?=
 =?utf-8?Q?wOxzXQQ61T5ScEa27JmtVR7//W3pnls1ogj/9tb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2B3C272E8D6A4B47AB989598907E21EC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3139.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f64dd73b-b873-4f9b-274b-08d95b0fe2cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2021 08:30:03.5041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jmwZIoouDotxgI+Tmyp5+8IFsUirUGiRFZDx+K1WKQJezdCpoBjZ/PMzRqDQ8JXL91+evnWKoT/5n9IN6qQ57A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB4689
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

T24gTW9uLCAyMDIxLTA4LTAyIGF0IDExOjUxICswMjAwLCBKb2VyZyBSb2VkZWwgd3JvdGU6DQo+
IE9uIEZyaSwgSnVsIDMwLCAyMDIxIGF0IDEwOjUyOjI2QU0gKzA4MDAsIFlvbmcgV3Ugd3JvdGU6
DQo+ID4gIC4uLi9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0ICAgICAgICB8ICA5
IC0tLS0NCj4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLWpwZWctZGVjb2Rlci55YW1s
IHwgIDkgLS0tLQ0KPiA+ICAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstanBlZy1lbmNvZGVy
LnlhbWwgfCAgOSAtLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1tZHAudHh0
ICAgICAgICAgICB8ICA4IC0tLS0NCj4gPiAgLi4uL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLXZj
b2RlYy50eHQgICAgICAgIHwgIDQgLS0NCj4gPiAgYXJjaC9hcm0vYm9vdC9kdHMvbXQyNzAxLmR0
c2kgICAgICAgICAgICAgICAgIHwgIDIgLQ0KPiA+ICBhcmNoL2FybS9ib290L2R0cy9tdDc2MjNu
LmR0c2kgICAgICAgICAgICAgICAgfCAgNSAtLQ0KPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE3My5kdHNpICAgICAgfCAxNiAtLS0tLS0tDQo+ID4gIGFyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgICAgICB8ICA2IC0tLQ0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgICAgICAgfCAgOSArKystDQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgICAgICB8ICA5ICsrKy0NCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jICAgICAgIHwgMTUgKysrLS0t
DQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgICB8IDM2
ICstLS0tLS0tLS0tLS0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHBfY29tcC5oICAgfCAgMSAtDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2Rydi5jICAgICAgICB8ICA1ICstDQo+ID4gIGRyaXZlcnMvaW9tbXUvbXRrX2lvbW11LmMgICAg
ICAgICAgICAgICAgICAgICB8IDI0ICsrKysrKysrKy0NCj4gPiAgZHJpdmVycy9pb21tdS9tdGtf
aW9tbXVfdjEuYyAgICAgICAgICAgICAgICAgIHwgMzEgKysrKysrKysrKysrLQ0KPiA+ICAuLi4v
bWVkaWEvcGxhdGZvcm0vbXRrLWpwZWcvbXRrX2pwZWdfY29yZS5jICAgfCA0NSArLS0tLS0tLS0t
LS0tDQo+ID4gLS0tLS0NCj4gPiAgLi4uL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVn
X2NvcmUuaCAgIHwgIDIgLQ0KPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1tZHAvbXRr
X21kcF9jb21wLmMgfCA0NiArLS0tLS0tLS0tLS0tDQo+ID4gLS0tLS0tDQo+ID4gIGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLW1kcC9tdGtfbWRwX2NvbXAuaCB8ICAyIC0NCj4gPiAgZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tdGstbWRwL210a19tZHBfY29yZS5jIHwgIDEgLQ0KPiA+ICAuLi4v
cGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19wbS5jICAgfCAzNyArKy0tLS0tLS0t
LS0tLS0NCj4gPiAgLi4uL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kcnYuaCAgICAg
IHwgIDMgLS0NCj4gPiAgLi4uL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYyAg
ICAgIHwgIDEgLQ0KPiA+ICAuLi4vcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuY19w
bS5jICAgfCA0NCArKy0tLS0tLS0tLS0tLS0NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tZW1vcnkv
bXRrLXNtaS5jICAgICAgICAgICAgICAgICAgICAgIHwgMTQgLS0tLS0tDQo+ID4gIGluY2x1ZGUv
c29jL21lZGlhdGVrL3NtaS5oICAgICAgICAgICAgICAgICAgICB8IDIwIC0tLS0tLS0tDQo+ID4g
IDI4IGZpbGVzIGNoYW5nZWQsIDkyIGluc2VydGlvbnMoKyksIDMyMSBkZWxldGlvbnMoLSkNCj4g
DQo+IFNvIHRoaXMgaXMgbGlrZWx5IG5vdCBnb2luZyB0aHJvdWdoIHRoZSBJT01NVSB0cmVlLCBn
aXZlbiBNYXR0aGlhcw0KPiBoYXMNCj4gcmV2aWV3ZWQgdGhlIElPTU1VIGNoYW5nZXMgeW91IGNh
biBhZGQgbXkgQWNrZWQtYnk6IEpvZXJnIFJvZWRlbCA8DQo+IGpyb2VkZWxAc3VzZS5kZT4NCg0K
SGkgSm9lcmcsDQoNClRoYW5rcyB2ZXJ5IG11Y2ggZm9yIHlvdXIgY29uZmlybS4gSSB3aWxsIHlv
dXIgQWNrIGZvciBpb21tdSBwYXJ0IGluDQp0aGUgbmV4dCB2ZXJzaW9uLg0KDQo=
