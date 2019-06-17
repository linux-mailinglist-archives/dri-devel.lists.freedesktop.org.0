Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD934789E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 05:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D73389177;
	Mon, 17 Jun 2019 03:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80054.outbound.protection.outlook.com [40.107.8.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E75989173;
 Mon, 17 Jun 2019 03:22:10 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4958.eurprd08.prod.outlook.com (10.255.158.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Mon, 17 Jun 2019 03:22:07 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1987.014; Mon, 17 Jun 2019
 03:22:07 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 11/59] drm/arm: Drop drm_gem_prime_export/import
Thread-Topic: [PATCH 11/59] drm/arm: Drop drm_gem_prime_export/import
Thread-Index: AQHVJLvXXBVah2nKdUGim99Vdhge7w==
Date: Mon, 17 Jun 2019 03:22:07 +0000
Message-ID: <20190617032159.GA21144@james-ThinkStation-P300>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
 <20190614203615.12639-12-daniel.vetter@ffwll.ch>
In-Reply-To: <20190614203615.12639-12-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: SL2PR01CA0019.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::31) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f042fbc5-8f5e-46bd-91a9-08d6f2d2fa1d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4958; 
x-ms-traffictypediagnostic: VE1PR08MB4958:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB4958039B20DEBC04C1F533DFB3EB0@VE1PR08MB4958.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:357;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(346002)(39850400004)(136003)(396003)(366004)(376002)(199004)(189003)(316002)(305945005)(6116002)(58126008)(3846002)(2906002)(73956011)(7736002)(1076003)(66066001)(6486002)(6436002)(9686003)(53936002)(6916009)(6512007)(71190400001)(71200400001)(229853002)(66446008)(81166006)(81156014)(5660300002)(68736007)(8936002)(66946007)(66556008)(64756008)(8676002)(256004)(66476007)(86362001)(6506007)(386003)(99286004)(52116002)(446003)(11346002)(478600001)(102836004)(186003)(55236004)(26005)(76176011)(14454004)(4326008)(25786009)(33656002)(6246003)(476003)(486006)(33716001)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4958;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oZ1EoczZ2pd+wjOHJ/HKPU0uTb+exbVnOZkg80HFqm5cTEJLXQ4fX8mESeN3NAiiW5jBt4iDvVcZRxL7ZA19FoZ2RXNHmz9Qh6Hqv6/uGE6cLRUhJk/8M8S3h4VvxDCsRapif8sfBuQ7H6vm6ZulgUbZwmn/BLksXLTBLWru8Ct3vfg6T2lr/6klmuAshvz9xj3Lz1E2/xlpEvpqjZ+V3UucsmrAZ7Obi2aHFRlpSn2/pFWFlJbgXMlQsATwLhLlxwEYtr+v8vP8iOC5TS7oMtIuHNQeTcTrtzawesXxW5alI20N43FtGgpiQTKShbJ2fNTSlDAOjczP+Q4olWJTBHotL9Q1+DF2kZ63ZXMBvChLyIem2qQqVhQkVvochWdoxWlQqAFjl2RgxVSxC6FtkrxOiCMa/e2m/QCQ17NDTpw=
Content-ID: <F09943709F4EEA45B7D2C7E916286F0D@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f042fbc5-8f5e-46bd-91a9-08d6f2d2fa1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 03:22:07.6917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4958
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mie2B1v6PYtmGAPAmrW3QNl+XBbXml2dwFMEGSbXJRo=;
 b=CzAcFALjhsoTFNoEwyI+Ijhr7Ky+ULbHNpp9H1tAuvSkcSA+qctdBPdD/KO8RLZhQO4WxXNwPbo7XjlVIt4T9LaVnQvgHug0uPLaht54XzbzXfR3GYMjkgllCAYqnZUvdV8+zKlmHBWBT6+fnWLn1d8A/PgHqRra9zwJWx3WKXA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6MzU6MjdQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBUaGV5J3JlIHRoZSBkZWZhdWx0Lgo+IAo+IEFzaWRlOiBXb3VsZCBiZSByZWFsbHkg
bmljZSB0byBzd2l0Y2ggdGhlIG90aGVycyBvdmVyIHRvCj4gZHJtX2dlbV9vYmplY3RfZnVuY3Mu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5j
b20+Cj4gQ2M6ICJKYW1lcyAoUWlhbikgV2FuZyIgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgo+
IENjOiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KPiBDYzogQnJpYW4gU3Rhcmtl
eSA8YnJpYW4uc3RhcmtleUBhcm0uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYyB8IDIgLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9o
ZGxjZF9kcnYuYyAgICAgICAgICAgICAgICAgfCAyIC0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hcm0v
bWFsaWRwX2Rydi5jICAgICAgICAgICAgICAgIHwgMiAtLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDYg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEva29tZWRhX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfa21zLmMKPiBpbmRleCBiOWQ2OTljYzdiYmYuLjQ1ZjA1YmM5NDQ4NyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCj4g
QEAgLTYzLDggKzYzLDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGtvbWVkYV9rbXNfZHJp
dmVyID0gewo+ICAJLmR1bWJfY3JlYXRlCQkJPSBrb21lZGFfZ2VtX2NtYV9kdW1iX2NyZWF0ZSwK
PiAgCS5wcmltZV9oYW5kbGVfdG9fZmQJCT0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCj4g
IAkucHJpbWVfZmRfdG9faGFuZGxlCQk9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAo+IC0J
LmdlbV9wcmltZV9leHBvcnQJCT0gZHJtX2dlbV9wcmltZV9leHBvcnQsCj4gLQkuZ2VtX3ByaW1l
X2ltcG9ydAkJPSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwKPiAgCS5nZW1fcHJpbWVfZ2V0X3NnX3Rh
YmxlCQk9IGRybV9nZW1fY21hX3ByaW1lX2dldF9zZ190YWJsZSwKPiAgCS5nZW1fcHJpbWVfaW1w
b3J0X3NnX3RhYmxlCT0gZHJtX2dlbV9jbWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAo+ICAJLmdl
bV9wcmltZV92bWFwCQkJPSBkcm1fZ2VtX2NtYV9wcmltZV92bWFwLAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2hkbGNkX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9oZGxj
ZF9kcnYuYwo+IGluZGV4IGIxMjY1NTU4OTVkOC4uMjdjNDZhMjgzOGM1IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vaGRsY2RfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2hkbGNkX2Rydi5jCj4gQEAgLTI0MCw4ICsyNDAsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9k
cml2ZXIgaGRsY2RfZHJpdmVyID0gewo+ICAJLmR1bWJfY3JlYXRlID0gZHJtX2dlbV9jbWFfZHVt
Yl9jcmVhdGUsCj4gIAkucHJpbWVfaGFuZGxlX3RvX2ZkID0gZHJtX2dlbV9wcmltZV9oYW5kbGVf
dG9fZmQsCj4gIAkucHJpbWVfZmRfdG9faGFuZGxlID0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5k
bGUsCj4gLQkuZ2VtX3ByaW1lX2V4cG9ydCA9IGRybV9nZW1fcHJpbWVfZXhwb3J0LAo+IC0JLmdl
bV9wcmltZV9pbXBvcnQgPSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwKPiAgCS5nZW1fcHJpbWVfZ2V0
X3NnX3RhYmxlID0gZHJtX2dlbV9jbWFfcHJpbWVfZ2V0X3NnX3RhYmxlLAo+ICAJLmdlbV9wcmlt
ZV9pbXBvcnRfc2dfdGFibGUgPSBkcm1fZ2VtX2NtYV9wcmltZV9pbXBvcnRfc2dfdGFibGUsCj4g
IAkuZ2VtX3ByaW1lX3ZtYXAgPSBkcm1fZ2VtX2NtYV9wcmltZV92bWFwLAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYXJtL21hbGlkcF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
bWFsaWRwX2Rydi5jCj4gaW5kZXggNWRjY2M3MTMwNzM5Li4zZWNkZjEzMTEzMzUgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9tYWxpZHBfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL21hbGlkcF9kcnYuYwo+IEBAIC01NzQsOCArNTc0LDYgQEAgc3RhdGljIHN0cnVj
dCBkcm1fZHJpdmVyIG1hbGlkcF9kcml2ZXIgPSB7Cj4gIAkuZHVtYl9jcmVhdGUgPSBtYWxpZHBf
ZHVtYl9jcmVhdGUsCj4gIAkucHJpbWVfaGFuZGxlX3RvX2ZkID0gZHJtX2dlbV9wcmltZV9oYW5k
bGVfdG9fZmQsCj4gIAkucHJpbWVfZmRfdG9faGFuZGxlID0gZHJtX2dlbV9wcmltZV9mZF90b19o
YW5kbGUsCj4gLQkuZ2VtX3ByaW1lX2V4cG9ydCA9IGRybV9nZW1fcHJpbWVfZXhwb3J0LAo+IC0J
LmdlbV9wcmltZV9pbXBvcnQgPSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwKPiAgCS5nZW1fcHJpbWVf
Z2V0X3NnX3RhYmxlID0gZHJtX2dlbV9jbWFfcHJpbWVfZ2V0X3NnX3RhYmxlLAo+ICAJLmdlbV9w
cmltZV9pbXBvcnRfc2dfdGFibGUgPSBkcm1fZ2VtX2NtYV9wcmltZV9pbXBvcnRfc2dfdGFibGUs
Cj4gIAkuZ2VtX3ByaW1lX3ZtYXAgPSBkcm1fZ2VtX2NtYV9wcmltZV92bWFwLAo+IC0tIAo+IDIu
MjAuMQoKSGkgRGFuaWVsCgpUaGFuayB5b3UuCgpSZXZpZXdlZC1ieTogSmFtZXMgUWlhbiBXYW5n
IChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
