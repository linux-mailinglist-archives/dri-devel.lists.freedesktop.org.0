Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A126620DCF
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 19:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA31895C1;
	Thu, 16 May 2019 17:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800083.outbound.protection.outlook.com [40.107.80.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA5B895C1;
 Thu, 16 May 2019 17:21:53 +0000 (UTC)
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3238.namprd12.prod.outlook.com (20.179.93.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Thu, 16 May 2019 17:21:49 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::e07e:24e5:eb8f:199e%6]) with mapi id 15.20.1878.024; Thu, 16 May 2019
 17:21:49 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 5/7] drm/amd/display: Use connector kdev as aux device
 parent
Thread-Topic: [PATCH 5/7] drm/amd/display: Use connector kdev as aux device
 parent
Thread-Index: AQHVC/vVCgNTJNShM0ygCN61Y5YFqaZt/7UA
Date: Thu, 16 May 2019 17:21:49 +0000
Message-ID: <0180549b-62a8-cf0b-2abe-923294ec481f@amd.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
 <1558019883-12397-6-git-send-email-sunpeng.li@amd.com>
In-Reply-To: <1558019883-12397-6-git-send-email-sunpeng.li@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::32) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee00f69b-ec6e-4650-1479-08d6da22faad
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3238; 
x-ms-traffictypediagnostic: BYAPR12MB3238:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR12MB323879BAA1F7C8DB1A168A28EC0A0@BYAPR12MB3238.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(366004)(376002)(39860400002)(189003)(199004)(36756003)(86362001)(2501003)(305945005)(31696002)(7736002)(71200400001)(71190400001)(229853002)(64756008)(3846002)(6116002)(66556008)(14454004)(66446008)(26005)(256004)(14444005)(5660300002)(8676002)(72206003)(81166006)(81156014)(186003)(478600001)(73956011)(66946007)(66066001)(2201001)(66574012)(66476007)(8936002)(966005)(6506007)(52116002)(53546011)(316002)(102836004)(99286004)(450100002)(25786009)(110136005)(76176011)(386003)(476003)(486006)(6436002)(6512007)(2906002)(6246003)(6486002)(6306002)(2616005)(11346002)(446003)(68736007)(53936002)(4326008)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3238;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QnAq1sQlugCXC5w1S8yitY1+MYjXHOmyLWQvzglI0LVyCqFQ6HC4cNDHNyDgAN4K0EeWyiXXir2AemMW22a0FvFopJSmulkj5P1TUTgENH/WbcFn1be7ScvnioBxegzk+rwlB5hcvS5hrE1YO+TEY3vvqs/BQpIuONahBqflkccMbIg6bPHP3YyEtn5dHuRANEvZCGVC1wGz7TmtoXsue0JW1k2R3u505z304sBHiSbon+XgAVAVAX6QEnI95GAk/CwDDPb7yMBqzwhZ5g6dJg/DlhnHJpMi1NcBgCVU5P9fvtAsxT22nuMVf+okx+yL49Dfuypk5HUhFOgTuyCda3jHH/qZIg1NC4gwWk1IsFkIsODyefOTaYHWojJMmvn1JWrpU9bfwfHP9s0wZ9xWT58yJwXfmrxunb4ijJqQMJQ=
Content-ID: <A4D3ED5C99F0FB47837D1767D997A277@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee00f69b-ec6e-4650-1479-08d6da22faad
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 17:21:49.3881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3238
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4TpViTM9BiV1rpNjOKqlXbAYwyEbKsxESjKgEo7o1I=;
 b=qFVSVgrHZ7LJPTIpCTEjSqYWgtTk7gMs0pg35+6JyY6mZM34wBheTPftpp5LKFzRqaR4iR31JQxSv6egeEmdME3WzqVAtbx07bYUTKxREAs85wSqrgdxHoy6SnlSYGlojz+iei8Pf4q9UPKVGe2h+c7grNHkSaRnbziUK0pVfmk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Zuo, Jerry" <Jerry.Zuo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8xNi8xOSAxMToxOCBBTSwgc3VucGVuZy5saUBhbWQuY29tIHdyb3RlOg0KPiANCj4gRnJv
bTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+DQo+IA0KPiBTZXQgdGhlIGNvbm5lY3Rvcidz
IGtlcm5lbCBkZXZpY2UgYXMgdGhlIHBhcmVudCBmb3IgdGhlIGF1eCBrZXJuZWwNCj4gZGV2aWNl
LiBUaGlzIGFsbG93cyB1ZGV2IHJ1bGVzIHRvIGFjY2VzcyBjb25uZWN0b3IgYXR0cmlidXRlcyB3
aGVuDQo+IGNyZWF0aW5nIHN5bWxpbmtzIHRvIGF1eCBkZXZpY2VzLg0KPiANCj4gRm9yIGV4YW1w
bGUsIHRoZSBmb2xsb3dpbmcgdWRldiBydWxlOg0KPiANCj4gU1VCU1lTVEVNPT0iZHJtX2RwX2F1
eF9kZXYiLCBTVUJTWVNURU1TPT0iZHJtIiwgQVRUUlN7ZWRpZH09PSIqIiwNCj4gICAgICAgICAg
U1lNTElOSys9ImRybV9kcF9hdXgvYnktbmFtZS8kaWQiDQo+IA0KPiBXaWxsIGNyZWF0ZSB0aGUg
Zm9sbG93aW5nIHN5bWxpbmtzIHVzaW5nIHRoZSBjb25uZWN0b3IncyBuYW1lOg0KPiANCj4gJCBs
cyAvZGV2L2RybV9kcF9hdXgvYnktbmFtZS8NCj4gY2FyZDAtRFAtMSAgY2FyZDAtRFAtMiAgY2Fy
ZDAtRFAtMw0KPiANCj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+DQo+IENjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPg0KPiBDYzogTmlj
aG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPg0KPiBDYzogSGFy
cnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+DQo+IENjOiBKZXJyeSAoRmFuZ3po
aSkgWnVvIDxKZXJyeS5adW9AYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTGVvIExpIDxzdW5w
ZW5nLmxpQGFtZC5jb20+DQoNClJldmlld2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNo
b2xhcy5rYXpsYXVza2FzQGFtZC5jb20+DQoNCk5vIGlkZWEgd2h5IGl0IHdhc24ndCBsaWtlIHRo
aXMgaW4gdGhlIGZpcnN0IHBsYWNlLg0KDQpOaWNob2xhcyBLYXpsYXVza2FzDQoNCj4gLS0tDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5
cGVzLmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYw0KPiBpbmRleCBhNmY0NGE0Li4wODNm
Yjk3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbV9tc3RfdHlwZXMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlwZXMuYw0KPiBAQCAtMzg1LDcgKzM4NSw3IEBA
IHZvaWQgYW1kZ3B1X2RtX2luaXRpYWxpemVfZHBfY29ubmVjdG9yKHN0cnVjdCBhbWRncHVfZGlz
cGxheV9tYW5hZ2VyICpkbSwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yKQ0KPiAgIHsNCj4gICAg
ICAgICAgYWNvbm5lY3Rvci0+ZG1fZHBfYXV4LmF1eC5uYW1lID0gImRtZGMiOw0KPiAtICAgICAg
IGFjb25uZWN0b3ItPmRtX2RwX2F1eC5hdXguZGV2ID0gZG0tPmFkZXYtPmRldjsNCj4gKyAgICAg
ICBhY29ubmVjdG9yLT5kbV9kcF9hdXguYXV4LmRldiA9IGFjb25uZWN0b3ItPmJhc2Uua2RldjsN
Cj4gICAgICAgICAgYWNvbm5lY3Rvci0+ZG1fZHBfYXV4LmF1eC50cmFuc2ZlciA9IGRtX2RwX2F1
eF90cmFuc2ZlcjsNCj4gICAgICAgICAgYWNvbm5lY3Rvci0+ZG1fZHBfYXV4LmRkY19zZXJ2aWNl
ID0gYWNvbm5lY3Rvci0+ZGNfbGluay0+ZGRjOw0KPiANCj4gLS0NCj4gMi43LjQNCj4gDQo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QNCj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KPiAN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
