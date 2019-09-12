Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F54B10FB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 16:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518ED6ED85;
	Thu, 12 Sep 2019 14:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rfout2.hes.trendmicro.com (rfout2.hes.trendmicro.com
 [54.67.111.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484046ED83
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 14:20:28 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [10.64.4.116])
 by rfout2.hes.trendmicro.com (Postfix) with ESMTPS id 8F40A1116048
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 14:18:16 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [10.64.0.243])
 by rout1.hes.trendmicro.com (Postfix) with SMTP id EA7B8EFC04E;
 Thu, 12 Sep 2019 14:18:14 +0000 (UTC)
Received: from IND01-BO1-obe.outbound.protection.outlook.com (unknown
 [104.47.101.53])
 by relay1.hes.trendmicro.com (TrendMicro Hosted Email Security) with ESMTPS id
 09473AFA014; Thu, 12 Sep 2019 14:18:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rs+//jhK0XhnV4QvFA4B+3IMSeWtGsnAL6VS81/XmNOSPIpj1le7jM2WDOA6Wh1VIEQFCDDlNAU3lrvCiIGrVjlnPhdUs1OJ3DMQQRkqYPQJzXZ0BY8h2aJ5J1xw4TU7zcHjlG5u6yHLrmdYsTJOu2qaehj6BX98FEe6csa6kOsOnRz6b+L7CGUiJOCwffBl0PliymrK1nlg2Y+WUg+Atp4C7DlXbddwRu/U+oCmaIBF6y0rb8DXPiBOsViaOtf5gjlxqKh7beVVLI5WBc1XMtWE/nHXPHrTiU6PWZ/aPZgOqf88LwI/ZdqKJd4bei24wYAFUcMnhtEv3zi0dG/MLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vUKnmKl7DRujYB2ncYVvVr9QoFnSI5/g2wzVayuoT8=;
 b=VcRAx243YohBf/9VjGNngfrlAQqoQXFVp4PEdlrx83YKKk8D93swzr9kz/85AVKbrB/rxeFmlMWoavlrLAOtir/J+5REMycel2DYVpsRrpczVhko+ia/V5awrri9u10ToLPHRky89li5rTH0GHBKBxQL8lLemZ+HJ0bvX8bnmQ1vS0Me5aDC/uSbIQIJnyoIPFWnq5kmlpvI91M3B/BVrXSb08HW2L5ziF5RH1XyCSQF0f/DfcNDHmGuo8NQjDtKfKsbV7X+grFnVRYEX0rA+bbBqpJFlwVSJxICZUqqJacY7QA3hjxIjy4BuQgBsgahwyLxW9eMqP0vIidVzgv5yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thinci.com; dmarc=pass action=none header.from=thinci.com;
 dkim=pass header.d=thinci.com; arc=none
Received: from MA1PR01MB3033.INDPRD01.PROD.OUTLOOK.COM (52.134.150.139) by
 MA1PR01MB2732.INDPRD01.PROD.OUTLOOK.COM (52.134.150.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Thu, 12 Sep 2019 14:18:03 +0000
Received: from MA1PR01MB3033.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ac1f:2d05:990:b583]) by MA1PR01MB3033.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ac1f:2d05:990:b583%5]) with mapi id 15.20.2263.016; Thu, 12 Sep 2019
 14:18:03 +0000
From: Matt Redfearn <matt.redfearn@thinci.com>
To: Andrzej Hajda <a.hajda@samsung.com>, John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH] drm: kirin: Fix dsi probe/attach logic
Thread-Topic: [RFC][PATCH] drm: kirin: Fix dsi probe/attach logic
Thread-Index: AQHVXi/ZYjUHyRzEOUKUcNBcrpSsvKcSZPyAgADdeICAAKoKAIAEee8AgAHDkACAAS/zgIAMEBsAgACziACAAA/JAA==
Date: Thu, 12 Sep 2019 14:18:03 +0000
Message-ID: <00e4f553-a02c-6d98-a0e8-28c0183a3c8c@thinci.com>
References: <20190829060550.62095-1-john.stultz@linaro.org>
 <CGME20190829173938epcas3p1276089cb3d6f9813840d1bb6cac8b1da@epcas3p1.samsung.com>
 <CAF6AEGvborwLmjfC6_vgZ-ZbfvF3HEFFyb_NHSLRoYWF35bw+g@mail.gmail.com>
 <ebdf3ff5-5a9b-718d-2832-f326138a5b2d@samsung.com>
 <CAF6AEGtkvRpXSoddjmxer2U6LxnV_SAe+jwE2Ct8B8dDpFy2mA@mail.gmail.com>
 <b925e340-4b6a-fbda-3d8d-5c27204d2814@samsung.com>
 <CALAqxLU5Ov+__b5gxnuMxQP1RLjndXkB4jAiGgmb-OMdaKePug@mail.gmail.com>
 <9d31af23-8a65-d8e8-b73d-b2eb815fcd6f@samsung.com>
 <CALAqxLVP=x9+p9scGyfgFUMN2di+ngOz9-fWW=A1YCM4aN7JRA@mail.gmail.com>
 <16c9066b-091f-6d0e-23f1-2c1f83a7da1b@samsung.com>
In-Reply-To: <16c9066b-091f-6d0e-23f1-2c1f83a7da1b@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0445.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::25) To MA1PR01MB3033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:46::11)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [213.106.91.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e0fbb9d-045c-4021-6da3-08d7378c05d7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MA1PR01MB2732; 
x-ms-traffictypediagnostic: MA1PR01MB2732:
x-microsoft-antispam-prvs: <MA1PR01MB2732E4D36F58AE8009F91247F1B00@MA1PR01MB2732.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(366004)(39840400004)(396003)(376002)(346002)(52314003)(189003)(199004)(102836004)(5660300002)(6246003)(386003)(6512007)(6436002)(53936002)(81166006)(81156014)(53546011)(478600001)(76176011)(7736002)(6506007)(305945005)(71200400001)(71190400001)(6486002)(4326008)(54906003)(229853002)(8676002)(110136005)(31696002)(7416002)(52116002)(6116002)(3846002)(446003)(99286004)(36756003)(11346002)(2616005)(66066001)(25786009)(66446008)(64756008)(476003)(66556008)(66476007)(66946007)(486006)(256004)(5024004)(186003)(14454004)(8936002)(26005)(2906002)(316002)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MA1PR01MB2732;
 H:MA1PR01MB3033.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: thinci.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4iuRccU/5ZoOX+dq0Pj9OceErr2ejxZSIWj+IE0KU5Ku2A0gzqD9pPXfAwbkL0bPWoctKqwsKHOI8Pqt7VWlaJGS/1IN0A1nvaqtSO8SbK8JwjwB3XhFoiLEQhpZcvRwep20x2fQDECUmaPkZ+KE3nGSmAKCTkBjW3YXmy7Hcb/p4V601t/wdFrP74SwOdRAapDDmI5MmmOmlnWjgW/IwiRSbmDYDG4HtOwpXlaghrwTrMce8OtFHos3NLwVT3jCqlMl1Zcn1p86Ucsc427MJ98i36wsGPSAkUWQ03E34XRiSOnwehgHLK6kNDbnU6Qxc/Im+tiKe20KWhogFpZ3BMpVxFPBwNFHkpIS9jGsbyGJl8nqwuEaWNyK4J/HTs+/whDaMZuZf/rf6bkYahQD9MI8c21sEaVWlRwP58kmUWw=
x-ms-exchange-transport-forked: True
Content-ID: <C2806052E8B64D468F9ED075782BDC63@INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: thinci.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0fbb9d-045c-4021-6da3-08d7378c05d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 14:18:03.2236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SZts4ItkBnwN+KdgDLdbmM6/LujqcUMs+r209r17AnJ/lt8fuFlAM/k3tdKFvpC59nNmDU8CLMv9zo8LGh3ieyr4BjvAGZGW5wyvA7A0spE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB2732
X-TMASE-Version: StarCloud-1.3-8.5.1020-24906.007
X-TMASE-Result: 10--17.718100-4.000000
X-TMASE-MatchedRID: 0lhM5bBmjEPmLzc6AOD8DfHkpkyUphL9SeIjeghh/zNyRzv8VthUeO78
 JM8/PJKtilFjvLZ/j0+CfAAkLV8ZpAZozxJuL+QzSyH6bNPVSdsA+JHhu0IR5r0rWM4nIpJrQ06
 GWWsHgeWclFMYx7d3xp13WEx+M1LaMYXCjAv0ws/0hv/rD7WVZAZyESFXAljfSgypjNmDEOv/ol
 ENOfDLuqv4jSzK/3BDzOzX3Ugwdp8vTkJbUZogmvNctuQlbOgkprzcyrz2L10cNByoSo036bBZs
 zSz1qei8ze0IlupaK3sfSmuEHK7OCzoUFXYNBYHqJSK+HSPY+9rLj3DxYBIN1S+oHmj8upzcM9I
 zjFc6Cbh53PZBRbu8/5G22dO0g90ig6yfQGtC660YzRwENQzjWgU1o1xV13fLrb+wM+3z+IEv3J
 Y2DTPMTWhjLSUqUa9z0Nn6V8FDgK0Nx5/0yISyS/PpqUXWtWDBtG6netTkaVLxCuBTCXaKmlys1
 PDhWLo7Sr91NIPRy13j1jxhRfPxsGY0l4ehoxDvOAv94sAIMScX+8paBX5l8eQfu6iwSfsn3P5M
 anUWB0gXhVckvDO0ZX00MHwP9R6LDvpFRH1bkKwWQIt565829s4MOUU/wa2BjMxa/QV+tThBjWE
 tFRXBgh3s4yCdKS3fILl67YGAqY5HWa1kxc3MRRbernba4ig64sVlliWKx/QOCWBwgRKBYesoyU
 FcYI/wWulRtvvYxTUHQeTVDUrItRnEQCUU+jz9xS3mVzWUuA152LecOHHIz8mKvV1biOgrLtkjl
 ioaNM4Gm2JhqDjKmuT1Mq3TdwU3Az5D7wfy24=
X-TM-Deliver-Signature: C9FE929865C6A0FEC2E7C22290EC42E1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thinciit.onmicrosoft.com; s=selector2-thinciit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vUKnmKl7DRujYB2ncYVvVr9QoFnSI5/g2wzVayuoT8=;
 b=WWUbl/9K5YdPdPwu+acTbKBDUiwp55WNvf66UDTLjYS9ZDrtsN751G3qg42A1BQ8vfHt13TgCdKevXOJvAhDKWwI2IgYmqObYfHLnKNzuy6kzvoPik7isbFDQH+uO6WhU15XNGqAFlyq2GpERJSLbxJk0QiduHggMWqcz5aY8LU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=matthew.redfearn@thinci.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, lkml <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDEyLzA5LzIwMTkgMTQ6MjEsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6DQo+IE9uIDEyLjA5
LjIwMTkgMDQ6MzgsIEpvaG4gU3R1bHR6IHdyb3RlOg0KPj4gT24gV2VkLCBTZXAgNCwgMjAxOSBh
dCAzOjI2IEFNIEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+IHdyb3RlOg0KPj4+
IE9uIDAzLjA5LjIwMTkgMTg6MTgsIEpvaG4gU3R1bHR6IHdyb3RlOg0KPj4+PiBPbiBNb24sIFNl
cCAyLCAyMDE5IGF0IDY6MjIgQU0gQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4g
d3JvdGU6DQo+Pj4+PiBPbiAzMC4wOC4yMDE5IDE5OjAwLCBSb2IgQ2xhcmsgd3JvdGU6DQo+Pj4+
Pj4gT24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMTE6NTIgUE0gQW5kcnplaiBIYWpkYSA8YS5oYWpk
YUBzYW1zdW5nLmNvbT4gd3JvdGU6DQo+Pj4+Pj4+IE9mIGNvdXJzZSBpdCBzZWVtcyB5b3UgaGF2
ZSBkaWZmZXJlbnQgb3BpbmlvbiB3aGF0IGlzIHRoZSByaWdodCB0aGluZyBpbg0KPj4+Pj4+PiB0
aGlzIGNhc2UsIHNvIGlmIHlvdSBjb252aW5jZSB1cyB0aGF0IHlvdXIgYXBwcm9hY2ggaXMgYmV0
dGVyIG9uZSBjYW4NCj4+Pj4+Pj4gcmV2ZXJ0IHRoZSBwYXRjaC4NCj4+Pj4+PiBJIGd1ZXNzIG15
IHN0cm9uZ2VzdCAvIG1vc3QgaW1tZWRpYXRlIG9waW5pb24gaXMgdG8gbm90IGJyZWFrIG90aGVy
DQo+Pj4+Pj4gZXhpc3RpbmcgYWR2NzV4eCBicmlkZ2UgdXNlcnMuDQo+Pj4+PiBJdCBpcyBwaXR5
IHRoYXQgYnJlYWthZ2UgaGFwcGVuZWQsIGFuZCBuZXh0IHRpbWUgd2Ugc2hvdWxkIGJlIG1vcmUN
Cj4+Pj4+IHN0cmljdCBhYm91dCB0ZXN0aW5nIG90aGVyIHBsYXRmb3JtcywgYmVmb3JlIHBhdGNo
IGFjY2VwdGFuY2UuDQo+Pj4+Pg0KPj4+Pj4gQnV0IHJldmVydGluZyBpdCBub3cgd2lsbCBicmVh
ayBhbHNvIHBsYXRmb3JtIHdoaWNoIGRlcGVuZCBvbiBpdC4NCj4+Pj4gSSdtIHJlYWxseSBvZiBu
byBvcGluaW9uIG9mIHdoaWNoIGFwcHJvYWNoIGlzIGJldHRlciBoZXJlLCBidXQgSSB3aWxsDQo+
Pj4+IHNheSB0aGF0IHdoZW4gYSBwYXRjaCBicmVha3MgcHJldmlvdXNseSB3b3JraW5nIGJvYXJk
cywgdGhhdCdzIGENCj4+Pj4gcmVncmVzc2lvbiBhbmQganVzdGlmeWluZyB0aGF0IHNvbWUgb3Ro
ZXIgYm9hcmQgaXMgbm93IGVuYWJsZWQgdGhhdA0KPj4+PiB3b3VsZCBiZSBicm9rZW4gYnkgdGhl
IHJldmVydCAob2YgYSBwYXRjaCB0aGF0IGlzIG5vdCB5ZXQgdXBzdHJlYW0pDQo+Pj4+IGlzbid0
IHJlYWxseSBhIHN0cm9uZyBhcmd1bWVudC4NCj4+Pj4NCj4+Pj4gSSdtIGhhcHB5IHRvIHdvcmsg
d2l0aCBmb2xrcyB0byB0cnkgdG8gZml4dXAgdGhlIGtpcmluIGRyaXZlciBpZiB0aGlzDQo+Pj4+
IHBhdGNoIHJlYWxseSBpcyB0aGUgcmlnaHQgYXBwcm9hY2gsIGJ1dCB3ZSBuZWVkIHNvbWVvbmUg
dG8gZG8gdGhlIHNhbWUNCj4+Pj4gZm9yIHRoZSBkYjQxMGMsIGFuZCBJIGRvbid0IHRoaW5rIGl0
cyBmYWlyIHRvIGp1c3QgZHVtcCB0aGF0IHdvcmsgb250bw0KPj4+PiBmb2xrcyB1bmRlciB0aGUg
dGhyZWF0IG9mIHRoZSBib2FyZCBicmVha2luZy4NCj4+Pg0KPj4+IFRoZXNlIGRyaXZlcnMgc2hv
dWxkIGJlIGZpeGVkIGFueXdheSAtIGFzc3VtcHRpb24gdGhhdA0KPj4+IGRybV9icmlkZ2UvZHJt
X3BhbmVsIHdpbGwgYmUgcmVnaXN0ZXJlZCBiZWZvcmUgdGhlIGJ1cyBpdCBpcyBhdHRhY2hlZCB0
bw0KPj4+IGlzIGp1c3QgaW5jb3JyZWN0Lg0KPj4+DQo+Pj4gU28gaW5zdGVhZCBvZiByZXZlcnRp
bmcsIGZpeGluZyBhbmQgdGhlbiByZS1hcHBseWluZyB0aGUgcGF0Y2ggSSBoYXZlDQo+Pj4gZ2Vu
dGx5IHByb3Bvc2VkIHNob3J0ZXIgcGF0aC4gSWYgeW91IHByZWZlciBsb25nIHBhdGggd2UgY2Fu
IHRyeSB0byBnbw0KPj4+IHRoaXMgd2F5Lg0KPj4+DQo+Pj4gTWF0dCwgaXMgdGhlIHB1cmUgcmV2
ZXJ0IE9LIGZvciB5b3Ugb3IgaXMgaXQgcG9zc2libGUgdG8gcHJlcGFyZSBzb21lDQo+Pj4gd29y
a2Fyb3VuZCBhbGxvd2luZyBjb29wZXJhdGlvbiB3aXRoIGJvdGggYXBwcm9hY2hlcz8NCj4+IFJv
Yi9BbmRyemVqOiBXaGF0J3MgdGhlIGNhbGwgaGVyZT8NCj4+DQo+PiBTaG91bGQgSSByZXN1Ym1p
dCB0aGUga2lyaW4gZml4IGZvciB0aGUgYWR2NzUxMSByZWdyZXNzaW9uIGhlcmU/DQo+PiBPciBk
byB3ZSByZXZlcnQgdGhlIGFkdjc1MTEgcGF0Y2g/IEkgYmVsaWV2ZSBkYjQxMGMgc3RpbGwgbmVl
ZHMgYSBmaXguDQo+Pg0KPj4gSSdkIGp1c3QgbGlrZSB0byBrZWVwIHRoZSBIaUtleSBib2FyZCBm
cm9tIGJyZWFraW5nLCBzbyBsZXQgbWUga25vdyBzbw0KPj4gSSBjYW4gZ2V0IHRoZSBmaXggc3Vi
bWl0dGVkIGlmIG5lZWRlZC4NCj4gDQo+IA0KPiBTaW5jZSB0aGVyZSBpcyBubyByZXNwb25zZSBm
cm9tIE1hdHQsIHdlIGNhbiBwZXJmb3JtIHJldmVydCwgc2luY2UgdGhlcmUNCj4gYXJlIG5vIG90
aGVyIGlkZWFzLiBJIHdpbGwgYXBwbHkgaXQgdG9tb3Jyb3csIGlmIHRoZXJlIGFyZSBubyBvYmpl
Y3Rpb25zLg0KDQpIaSwNCg0KU29ycnkgLSB5ZWFoIEkgdGhpbmsgcmV2ZXJ0aW5nIGlzIHByb2Jh
Ymx5IGJlc3QgYXQgdGhpcyBwb2ludCB0byBhdm9pZCANCmJyZWFraW5nIGluLXRyZWUgcGxhdGZv
cm1zLg0KSXQncyBhIHNoYW1lIHRob3VnaCB0aGF0IHRoZXJlIGlzIGEgYnVpbHQtaW4gaW5jb21w
YXRpYmlsaXR5IHdpdGhpbiB0aGUgDQp0cmVlIGJldHdlZW4gZHJpdmVycy4gVGhlIHdheSB0aGF0
IHRoZSBnZW5lcmljIFN5bm9wc3lzIERTSSBob3N0IGRyaXZlciANCnByb2JlcyBpcyBjdXJyZW50
bHkgaW5jb21wYXRpYmxlIHdpdGggdGhlIEFEVjc1MzMgKGhlbmNlIHRoZSBwYXRjaCksIA0Kb3Ro
ZXIgRFNJIGhvc3QgZHJpdmVycyBhcmUgbm93IGNvbXBhdGlibGUgd2l0aCB0aGUgQURWNzUzMyBi
dXQgYnJlYWsgDQp3aGVuIHdlIGNoYW5nZSBpdCB0byBwcm9iZSBpbiBhIHNpbWlsYXIgd2F5IHRv
IHBhbmVsIGRyaXZlcnMuDQoNCj4gDQo+IEFuZCBmb3IgdGhlIGZ1dHVyZTogSSBndWVzcyBpdCBp
cyBub3QgcG9zc2libGUgdG8gbWFrZSBhZHYgd29yayB3aXRoIG9sZA0KPiBhbmQgbmV3IGFwcHJv
YWNoLCBidXQgc2ltcGxlIHdvcmthcm91bmQgZm9yIGFkdiBjb3VsZCBiZSBhZGRlZCBsYXRlcjoN
Cj4gDQo+IGlmIChzb3VyY2UgaXMgbXNtIG9yIGtpcmluKQ0KPiANCj4gIMKgwqDCoCBkb190aGVf
b2xkX3dheQ0KPiANCj4gZWxzZQ0KPiANCj4gIMKgwqDCoCBkb19jb3JyZWN0bHkuDQoNCk1heWJl
IHRoaXMgd291bGQgd29yaywgYnV0IGhvdyBkbyB3ZSBrbm93IHRoYXQgdGhlIGxpc3QgIm1zbSBv
ciBraXJpbiIgDQppcyBleGhhdXN0aXZlIHRvIGNvcGUgd2l0aCBhbGwgcGxhdGZvcm1zPyBJdCBz
ZWVtcyB0byBtZSB0aGUgYnVpbHQgaW4gDQppbmNvbXBhdGliaWxpdHkgYmV0d2VlbiBEU0kgaG9z
dHMgbmVlZHMgdG8gYmUgcmVzb2x2ZWQgcmVhbGx5IHJhdGhlciANCnRoYW4gdHJ5aW5nIHRvIHdv
cmsgYXJvdW5kIGl0IGluIHRoZSBBRFY3NTMzIGRyaXZlciAoYW5kIGFueSBvdGhlciBEU0kgDQpi
dXMgZGV2aWNlIHRoYXQgZmFsbHMgaW50byB0aGlzIHRyYXApLg0KDQpBbnl3YXksIG15IHBsYXRm
b3JtIGlzIG91dCBvZiB0cmVlIHNvIGJldHRlciB0byByZXZlcnQgbXkgcGF0Y2ggYW5kIGtlZXAg
DQp0aGUgaW4tdHJlZSBwbGF0Zm9ybXMgd29ya2luZy4NCg0KVGhhbmtzIGV2ZXJ5b25lLg0KTWF0
dA0KDQo+IA0KPiANCj4gQW5kIHJlbW92ZSBpdCBhZnRlciBmaXhpbmcgYm90aCBkc2kgbWFzdGVy
cy4NCj4gDQo+IA0KPiBSZWdhcmRzDQo+IA0KPiBBbmRyemVqDQo+IA0KPiANCj4+DQo+PiB0aGFu
a3MNCj4+IC1qb2huDQo+Pg0KPj4NCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
