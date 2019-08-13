Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7528E681
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C906E8D5;
	Thu, 15 Aug 2019 08:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150048.outbound.protection.outlook.com [40.107.15.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C536E0FF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 10:36:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frAlh6Sytz7K67UkI7/GxkUKPamnDZHOocQolyDIV7zzXHabKO5KLIuysNvlbr19dEWNENkhSYf/8LOh6dVA1oldQT+2c/59lTzCJbHlRXwCRWI3ZqYtIWuyZk8rUCcHesb4izALA7dpNCaHAFN04VYPqdaS/t6B3yU40pJCyhyXBclTj6aIw4aKlP67vRmEZCoqOwoWQ1dt4PxA3x7ha9BdrcH1HsIqGbdj4Qy7K7GlH2joxdm1ZKd4lf5rMnvZfeXSvsrz15Fbh69aWenwVgYO9Kq7PNGuUW/e938/PBwl/5p0n0e2dRb1P2R9hcPyiwvbyw4S0uFKoGNUGE1BGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L328Gjry8w2xCMnLfGXmL5AVe0M06JI2pNJW97tNV/I=;
 b=eGwWIkyNNfcOLkU122zjukUaRrBUHd4FMSLanTiQEi3EWWB95yErCiXbyI67jIS1u432IO6UVZb9SfBzkpHrPE+KQ7FCEaW2KA7AHVVkMPHvh6uJI/HNa80o9wkB3fUxpRLi6lb4825PhvUm36xSMh0BZnLbhjrfTWTrvXGnh6nNArybl8hlfRGoKmxYLqVwzOOc3+2T62I1lcdpL53MbXWsJrqt2ufsTR2ZZN7YWAMF8CRoqvPZESTTRiB4WehB27XX9ymukLza84tMRBvQ+ldjEEJHNFtgcSVhi8IkZXWIxfeQ1CyW8PoIlSNvK0+vfbOGq276MkJmrmHO+eoXHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB8PR04MB6715.eurprd04.prod.outlook.com (20.179.251.14) by
 DB8PR04MB5930.eurprd04.prod.outlook.com (20.179.8.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Tue, 13 Aug 2019 10:36:41 +0000
Received: from DB8PR04MB6715.eurprd04.prod.outlook.com
 ([fe80::b0ab:d127:ca27:e1fa]) by DB8PR04MB6715.eurprd04.prod.outlook.com
 ([fe80::b0ab:d127:ca27:e1fa%7]) with mapi id 15.20.2136.018; Tue, 13 Aug 2019
 10:36:41 +0000
From: Robert Chiras <robert.chiras@nxp.com>
To: "agx@sigxcpu.org" <agx@sigxcpu.org>
Subject: Re: [EXT] Re: [PATCH 00/10] Improvements and fixes for mxsfb DRM
 driver
Thread-Topic: [EXT] Re: [PATCH 00/10] Improvements and fixes for mxsfb DRM
 driver
Thread-Index: AQHVLCOX39rb+e39GkGlwLk9dRqh9Kb5KeuAgAADyQA=
Date: Tue, 13 Aug 2019 10:36:41 +0000
Message-ID: <1565692600.3209.43.camel@nxp.com>
References: <1561555938-21595-1-git-send-email-robert.chiras@nxp.com>
 <20190813102307.GA22623@bogon.m.sigxcpu.org>
In-Reply-To: <20190813102307.GA22623@bogon.m.sigxcpu.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 318e5352-9a9a-469c-a54b-08d71fda212e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR04MB5930; 
x-ms-traffictypediagnostic: DB8PR04MB5930:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB59306E9803DAF62A091B405EE3D20@DB8PR04MB5930.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(51914003)(189003)(199004)(103116003)(86362001)(229853002)(7736002)(26005)(66476007)(66446008)(8936002)(305945005)(91956017)(1730700003)(81166006)(6486002)(2906002)(64756008)(76116006)(81156014)(7416002)(66556008)(66946007)(8676002)(256004)(2351001)(6916009)(6436002)(50226002)(45080400002)(966005)(3846002)(478600001)(6116002)(486006)(25786009)(446003)(6246003)(53936002)(44832011)(2501003)(36756003)(4326008)(6506007)(102836004)(316002)(66066001)(6512007)(11346002)(5640700003)(76176011)(2616005)(6306002)(99286004)(71190400001)(71200400001)(186003)(476003)(14454004)(54906003)(5660300002)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB5930;
 H:DB8PR04MB6715.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wdFxeYZ9CD1LoWeSKjOLwkqA3x8Q9Ernj90G9Ih9C1/UQAZwE1ceYUnxodRNbhhezHgr1d5g54Meconsh8HkdptBUqmEtCvYNACSjBnKZcpUEVmU6ib2yLMMXMHEdlG6TseNM8VJOFUSdJT2Xh3aBbkVfz20IKN0886ARYZD4wNoYc3cuTf1PGGJTIGNrbEFJhqNhOVMClPpnFdEFN6oGIrC/xfgeIfEwhAmz58jiqIpuWkSzQxgdvE0pEJY2ZW/yFqi7RWgOafdwCcLAVGDf6cYvg58CjfnTbKyu0u5pLk6ceXEuKJ2INKnwnkADSfcQ59blCKuTBAd0EW8wu5SWRK1V2eZ70WycpTMlinYgFcljTRq9vfzTZ10nSz/V54kNWFPuWTJFsOq5qJvKUAopDuspGxt9xQJfMVe2QCF+gQ=
Content-ID: <AFA2B89B03FD444FBEABF1AE1F1FD100@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 318e5352-9a9a-469c-a54b-08d71fda212e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 10:36:41.4292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: robert.chiras@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5930
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L328Gjry8w2xCMnLfGXmL5AVe0M06JI2pNJW97tNV/I=;
 b=FP7I9Qd92hN5y14zJm6vamXGrh8xhF5mumSVTONeNL6uBAKcRz10zoKoTLO99S5RYf0BeQs2hDRrgug5NH59H40un7qizRKWWnIklEACmv/2ELq0GypNVsGpRAb1IQFEtuAYlGHOW/O0b9EAwA1rLCHTlR+6adO/N479TC5ay7U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=robert.chiras@nxp.com; 
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
Cc: "marex@denx.de" <marex@denx.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTWEsIDIwMTktMDgtMTMgYXQgMTI6MjMgKzAyMDAsIEd1aWRvIEfDvG50aGVyIHdyb3RlOg0K
PiBIaSBSb2JlcnQsDQo+IE9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDA0OjMyOjA4UE0gKzAzMDAs
IFJvYmVydCBDaGlyYXMgd3JvdGU6DQo+ID4gDQo+ID4gVGhpcyBwYXRjaC1zZXQgaW1wcm92ZXMg
dGhlIHVzZSBvZiBlTENESUYgYmxvY2sgb24gaU1YIDggU29DcyAobGlrZQ0KPiA+IDhNUSwgOE1N
DQo+ID4gYW5kIDhRWFApLiBGb2xsb3dpbmcsIGFyZSB0aGUgbmV3IGZlYXR1cmVzIGFkZGVkIGFu
ZCBmaXhlcyBmcm9tDQo+ID4gdGhpcw0KPiA+IHBhdGNoLXNldDoNCj4gVGhlcmUgd2FzIHNvbWUg
ZmVlZGJhY2sgb24gdmFyaW91cyBwYXRjaGVzLCBkbyB5b3UgaW50ZW5kIHRvIHBpY2sNCj4gdGhh
dA0KPiB1cCBhZ2Fpbj8gVGhhdCB3b3VsZCBiZSBjb29sIHNpbmNlIHRoZXJlJ3Mgc29tZSBvdmVy
bGFwcGluZyB3b3JrDQo+IHBvcHBpbmcNCj4gdXAgYWxyZWFkeSBlLmcuIGluDQo+IA0KPiDCoMKg
wqDCoGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1o
dHRwcyUzQSUyRiUyDQo+IEZwYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnJTJGc2VyaWVzJTJGNjQ1
OTUlMkYmYW1wO2RhdGE9MDIlN0MwMSU3Q3JvYg0KPiBlcnQuY2hpcmFzJTQwbnhwLmNvbSU3QzZj
YTY3MjRhNjU2YjQxOTEyZjA0MDhkNzFmZDgzZGEwJTdDNjg2ZWExZDNiYzINCj4gYjRjNmZhOTJj
ZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzcwMTI4ODU5MTg2MzExOTYmYW1wO3NkYXRhPWIzQ3Ji
TnUlDQo+IDJGY3NXQk9BJTJCY2FRTFglMkJybHJLNyUyRmhmMiUyRjF2WlMzZVFHTjdhTSUzRCZh
bXA7cmVzZXJ2ZWQ9MA0KPiANCj4gc2hvd2luZyB1cCBhbmQgaXQncyB0aGUgYmFzZSBmb3IgdGhl
IHRpbnkNCj4gDQo+IMKgwqDCoMKgaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTINCj4gRnBhdGNod29yay5mcmVlZGVza3RvcC5v
cmclMkZzZXJpZXMlMkY2NDMwMCUyRiZhbXA7ZGF0YT0wMiU3QzAxJTdDcm9iDQo+IGVydC5jaGly
YXMlNDBueHAuY29tJTdDNmNhNjcyNGE2NTZiNDE5MTJmMDQwOGQ3MWZkODNkYTAlN0M2ODZlYTFk
M2JjMg0KPiBiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNzAxMjg4NTkxODY0MTE5
NiZhbXA7c2RhdGE9aDZLTFZuU3gNCj4geEJ3dkslMkZ2UEY5enQ0RFFSNlduRjFweVFTd0tCVE80
clFUZyUzRCZhbXA7cmVzZXJ2ZWQ9MA0KPiANCj4gQ2hlZXJzLA0KPiDCoC0tIEd1aWRvDQoNCkhp
IEd1aWRvLA0KDQpZZXMsIEkgcGxhbiB0byBzdWJtaXQgYSBuZXh0IHJldmlzaW9uLCBidXQgZmly
c3QgSSB3YW50ZWQgdG8gdHJ5IGl0IHdpdGggeW91ciBwYXRjaC1zZXQgZm9yIHRoZSBud2wtZHNp
IGRyaXZlci4NClRoYW5rcyBmb3IgdGhlIGhlYWRzLXVwLg0KDQpCZXN0IHJlZ2FyZHMsDQpSb2Jl
cnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
