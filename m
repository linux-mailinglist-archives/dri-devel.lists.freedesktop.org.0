Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3189157CD4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6948A6E5C2;
	Thu, 27 Jun 2019 07:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30067.outbound.protection.outlook.com [40.107.3.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0726E3A6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 12:13:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=CRcyMRK3/R1/YWJtoqu94I6a2kHrD1k/q9QVDudy6ycAwgaDLXFZC5Ht16xERI/cqRnaY2xUnZnIzpd21/vOVi+T9i0sXW4LkzngBblyKVpzHi5ZnCHUCnGZyz309GESDa5M/nRGRpXSxO1ySQ2o1qJ28U+6c+XUaFUS/XzmvWo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiWSnbvF+BF/JcWPOc1MvN6IavzbwC3tgTtiNZDaRcw=;
 b=k0RniEMUa++P2KaJL9ZIMIUaw3bAi+6F/J3by7hnW1YUQX+bqS/7wz5crczpjIkFv9IM1rVWJQ9KQPYARjdnJEspew+VQwHlac6cFFGhVqQfmtWS3ICSLDguaPAxDLubMoAeJ4uLz/RjwiwQCojKCf+gAwm1pjA+5dAHznwHH18=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com (20.178.123.141) by
 VI1PR04MB3998.eurprd04.prod.outlook.com (10.171.182.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Wed, 26 Jun 2019 12:13:23 +0000
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::3d8f:3ac3:c34e:eb7b]) by VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::3d8f:3ac3:c34e:eb7b%5]) with mapi id 15.20.2008.014; Wed, 26 Jun 2019
 12:13:23 +0000
From: Robert Chiras <robert.chiras@nxp.com>
To: "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [EXT] Re: [PATCH v5 2/2] drm/panel: Add support for Raydium
 RM67191 panel driver
Thread-Topic: [EXT] Re: [PATCH v5 2/2] drm/panel: Add support for Raydium
 RM67191 panel driver
Thread-Index: AQHVLAjUHIR3x6RJE0mlIrxpmnY6X6atzcYAgAALQAA=
Date: Wed, 26 Jun 2019 12:13:23 +0000
Message-ID: <1561551202.9328.93.camel@nxp.com>
References: <1561544420-15572-1-git-send-email-robert.chiras@nxp.com>
 <1561544420-15572-3-git-send-email-robert.chiras@nxp.com>
 <20190626113306.GA24921@ravnborg.org>
In-Reply-To: <20190626113306.GA24921@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af10ff88-1313-40bc-f0c8-08d6fa2faf97
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB3998; 
x-ms-traffictypediagnostic: VI1PR04MB3998:
x-microsoft-antispam-prvs: <VI1PR04MB3998AD3FDD2DA9269ED705BDE3E20@VI1PR04MB3998.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(366004)(396003)(346002)(376002)(199004)(189003)(2616005)(11346002)(54906003)(2501003)(44832011)(6486002)(2351001)(3846002)(305945005)(26005)(6116002)(2906002)(4326008)(66066001)(5640700003)(6916009)(36756003)(68736007)(478600001)(7736002)(486006)(50226002)(6436002)(103116003)(53936002)(102836004)(66476007)(446003)(64756008)(14454004)(476003)(73956011)(71190400001)(5660300002)(229853002)(6246003)(186003)(71200400001)(1730700003)(76116006)(256004)(14444005)(6512007)(81166006)(99286004)(6506007)(76176011)(8676002)(25786009)(81156014)(8936002)(66446008)(86362001)(66556008)(316002)(66946007)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB3998;
 H:VI1PR04MB5967.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 202fcN4ivl29M/aEHqzMc1yxFkKhfocGEzBGmE2d7wyH5kdWh0sxbLyAYsD+BSOWaGJOir4CaHOc+FWhaY4aeqiCzXvZsGuQpkNdDbxQIfd7FpPmthR4nHCK6L6K69DEqG5/n4rD7KzIfIBYf6bSD2MS0KrGs60k+7ZGLxOyI/fvpemrUqhyTRYDscuWsHKVgP/CncibsVk2+1fILxQADFtB+g74An0oDHF15lIaenI8wG76N6B8qGmM4f0XqfpZ6jjKUZTYF79Wc1D1ufqFoY0q/xkxFT9rS6LoXzp5gTKTspen4WLa1JKKWes2XGAiBU6MmMmm2lEZGajD7YUN3jZlS+jJoqw8I5+4TRnZcZgQxIetS6AClgDfyK/WfC2QnF+Xg5zRo20ygWzKFyeYuPS2cxITWlt30Xup6JP1HUI=
Content-ID: <891AD3EE32C2F64BB3ABB9E1B06E6B39@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af10ff88-1313-40bc-f0c8-08d6fa2faf97
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 12:13:23.4601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: robert.chiras@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3998
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MiWSnbvF+BF/JcWPOc1MvN6IavzbwC3tgTtiNZDaRcw=;
 b=q3JawTK3oRJIOtg36eYQqJQzmS2+/t4FyimNHQfXx/eIXBvPB/UhYHcfBU/0ZCqDSbEB8ZYQ1VmUyUuN3MPqbVQgoBZs9QO35ID60Vi7BA4/7uv91XYSwAPwN5LKvH8wcglCQcXWrN2KasnKj2uH3pUOii+AEo8nTAQ4p2MJAdg=
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLA0KDQpPbiBNaSwgMjAxOS0wNi0yNiBhdCAxMzozMyArMDIwMCwgU2FtIFJhdm5ib3Jn
IHdyb3RlOg0KPiBIaSBSb2JlcnQuDQo+IA0KPiBPbiBXZWQsIEp1biAyNiwgMjAxOSBhdCAwMToy
MDoyMFBNICswMzAwLCBSb2JlcnQgQ2hpcmFzIHdyb3RlOg0KPiA+IA0KPiA+IFRoaXMgcGF0Y2gg
YWRkcyBSYXlkaXVtIFJNNjcxOTEgVEZUIExDRCBwYW5lbCBkcml2ZXIgKE1JUEktRFNJDQo+ID4g
cHJvdG9jb2wpLg0KPiBJIHdhcyBhYm91dCB0byBhcHBseSB0aGVzZSAtIGJ1dCBJIGdldCBmb2xs
b3dpbmcgd2FybmluZ3MgZHVyaW5nDQo+IGJ1aWxkOg0KPiDCoCBDQ8KgwqDCoMKgwqDCoGRyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXlkaXVtLXJtNjcxOTEubw0KPiAvaG9tZS9zYW0vZHJt
L2xpbnV4LmdpdC9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmF5ZGl1bS0NCj4gcm02NzE5
MS5jOiBJbiBmdW5jdGlvbiDigJhyYWRfYmxfZ2V0X2JyaWdodG5lc3PigJk6DQo+IC9ob21lL3Nh
bS9kcm0vbGludXguZ2l0L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXlkaXVtLQ0KPiBy
bTY3MTkxLmM6NDcwOjE3OiB3YXJuaW5nOiB1bnVzZWQgdmFyaWFibGUg4oCYZGV24oCZIFstV3Vu
dXNlZC12YXJpYWJsZV0NCj4gwqAgc3RydWN0IGRldmljZSAqZGV2ID0gJmRzaS0+ZGV2Ow0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgXn5+DQo+IC9ob21lL3NhbS9kcm0vbGlu
dXguZ2l0L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXlkaXVtLQ0KPiBybTY3MTkxLmM6
IEluIGZ1bmN0aW9uIOKAmHJhZF9ibF91cGRhdGVfc3RhdHVz4oCZOg0KPiAvaG9tZS9zYW0vZHJt
L2xpbnV4LmdpdC9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcmF5ZGl1bS0NCj4gcm02NzE5
MS5jOjQ5MjoxNzogd2FybmluZzogdW51c2VkIHZhcmlhYmxlIOKAmGRlduKAmSBbLVd1bnVzZWQt
dmFyaWFibGVdDQo+IMKgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZkc2ktPmRldjsNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoF5+fg0KPiANCj4gUGxlYXNlIGZpeCBhbmQgdXBk
YXRlIHlvdXIgc2NyaXB0cyB0byBjYXRjaCB0aGlzIGluIHRoZSBmdXR1cmUuDQpPaCwgSSBhbSBz
b3JyeSBhYm91dCB0aGF0LCBzZWVtcyB0aGF0IEkgbWlzc2VkIHRoYXQgOigNCkZpeGVkIGFuZCBz
dWJtaXR0ZWQuDQo+IA0KPiDCoMKgwqDCoMKgwqDCoMKgU2FtDQoNClRoYW5rcywNClJvYmVydApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
