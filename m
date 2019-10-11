Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1144D399A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 08:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5466EBB5;
	Fri, 11 Oct 2019 06:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740132.outbound.protection.outlook.com [40.107.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205826E3F4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 02:21:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKV2LwnziDrtcf+zeUwojhGHsz1WbJ68KHMl6XsQqilJZzI+T86nrwpntbxq+54KACUYkseqqujX/Ijh/pvwivJ5mcxzV9YgZ1LBlgTipIp/OiXxVcCuUGVNQy7dvcgOvCYj7iigIYPq5i4kN62jRJ6it3MGj2m5JVduF2UmsBR5ArHwdFtLL3G64WUa3g8OcyzsKIvhNXUuvw5B8woVQe6syxtjRHsQ27GMf+JG3+28PMoK8G2lfmIUo+KfVIgUOoh9/GiMPRT/bHtqSkTHhPQn2dDPvktx4ZX82EYRT8JOrgkQ4ZfheJm8gWNIMgVphS92L0GCqwOVAKiRQNKGMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrgTNskGg8ZuhmFhtCjGXkTrtLDGZr+OZQHgY6yQ/BY=;
 b=PR2/BH3MH424cJXKgOpif1ER+izAe6jFgQrjK77gI9x7c6dfsa67oN23zirtCPDSs+o4GmgZSBxIRXiKTjpdQJ2WfnKRqFOQg3sCpWvapzaDN/hmB2bYhRgyom07B8DJ9rQqUxhpdpb2o1lD6IETTu3p+Tei93qei7/zSeGqPHfarcNErbRtGN1/jJ+xVk+hmJzc5B9I3zu0s1Png4OXF6INoQA/Ijma4UA6G0k0r2tPARujEjSEZorPOmwaoM01uWP4y75WX7xzzPR0JO0yMZe07ap2xh/knUGxS45yfVDpEykCTPNq82+QJbco6iwWrhisPwbgqahNezdsoEah/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
Received: from BL0PR04MB4532.namprd04.prod.outlook.com (10.167.181.144) by
 BL0PR04MB4721.namprd04.prod.outlook.com (10.167.181.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 02:21:48 +0000
Received: from BL0PR04MB4532.namprd04.prod.outlook.com
 ([fe80::c184:37a4:7e6e:aa42]) by BL0PR04MB4532.namprd04.prod.outlook.com
 ([fe80::c184:37a4:7e6e:aa42%7]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 02:21:48 +0000
From: Xin Ji <xji@analogixsemi.com>
To: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>
Subject: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Topic: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: MIPI to DP
 transmitter binding
Thread-Index: AQHVf9qi2ZQPn8IAhkqsNtop++SEMw==
Date: Fri, 11 Oct 2019 02:21:48 +0000
Message-ID: <75bb8a47d2c3c1f979c6d62158c21988b846e79b.1570760115.git.xji@analogixsemi.com>
References: <cover.1570760115.git.xji@analogixsemi.com>
In-Reply-To: <cover.1570760115.git.xji@analogixsemi.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0024.apcprd03.prod.outlook.com
 (2603:1096:203:2e::36) To BL0PR04MB4532.namprd04.prod.outlook.com
 (2603:10b6:208:4f::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [114.247.245.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e278aa5a-063f-406b-c6c4-08d74df1c4da
x-ms-traffictypediagnostic: BL0PR04MB4721:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR04MB472161CBE451CC2AEFD82939C7970@BL0PR04MB4721.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(366004)(39850400004)(376002)(346002)(189003)(199004)(305945005)(81156014)(64756008)(66446008)(6486002)(107886003)(81166006)(6436002)(7736002)(66066001)(8936002)(66946007)(8676002)(66556008)(4326008)(3846002)(25786009)(66476007)(14454004)(86362001)(6116002)(76176011)(256004)(52116002)(26005)(2501003)(386003)(118296001)(6506007)(478600001)(7416002)(6512007)(446003)(102836004)(99286004)(110136005)(486006)(476003)(316002)(54906003)(2616005)(6306002)(11346002)(186003)(71190400001)(36756003)(71200400001)(5660300002)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR04MB4721;
 H:BL0PR04MB4532.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analogixsemi.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BsAXAZmWR5r/jd1mkeUMZAy72h+4hzCiv/hmCqVaPv3G78k+Ifb5kbW56aOxPqf7dG4PzwEaRUA58+JoC8B9Iyo33Eo8K7WLm9F5gP/UmOVMRGunaoTp/t8Jei7RUMLepQBPvX9s9JL3gfGK4/agCNoW2aqIq/Tpd2FnRS8Fd/vJPJG98KOilGWgGzNY8/UFIek1DIPY0Bd7aO4dIP5sY/rsbZTS8H/yVNGLRUJ1SRq3ksaIWAWPIyqUVbYsqYieW75lOHpB/TTzZUdiUnwI2Iaf+cXk2L6eWiKGDGlRcZaM8kq3i8u6EPck7LvXxMS/eZ07NpGqOh3+NfROScRpN73onDih/pYmuQo2PgO3Nnd07WieU9VkesEcMnbGf4YByzOEiPWQQyGmn6o3fXejXl/CMZHIG0lZKTKsLBxNcl3sIBh8cQVxAmE4kRLlQOcXAgA6YaSBwsGpaIV0rlQGwQ==
Content-ID: <E6BAA219035DF14EBD0997C840B0FB74@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e278aa5a-063f-406b-c6c4-08d74df1c4da
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 02:21:48.5211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WOZikUEpiHmkylrdEa9K+Q8iZpMZ0Bvgz+/HEqsCn4FtIjbG1G4f1ifuNoExg65k3NkuUQl/dAm/sNxn+vt5lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4721
X-Mailman-Approved-At: Fri, 11 Oct 2019 06:48:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrgTNskGg8ZuhmFhtCjGXkTrtLDGZr+OZQHgY6yQ/BY=;
 b=Qq8QQKGVaQlpi9mZKTqvEGVIxZBdQ/xINUxuqV1YSlO/o4dsoDHUMaxaTzysoRAmq/QjyzUkSHtM09aVrz/DkxtiN8iEri/jK6l3vq9B2u+zZ0nEj9UYYZhvfsE8fi4ISVacs5amd1zhYA8b4G1vb4kVqvofgfU8rnFIcU2MxLQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=xji@analogixsemi.com; 
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sheng Pan <span@analogixsemi.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEFOWDc2MjUgaXMgYW4gdWx0cmEtbG93IHBvd2VyIDRLIE1vYmlsZSBIRCBUcmFuc21pdHRl
ciBkZXNpZ25lZApmb3IgcG9ydGFibGUgZGV2aWNlLiBJdCBjb252ZXJ0cyBNSVBJIHRvIERpc3Bs
YXlQb3J0IDEuMyA0Sy4KCllvdSBjYW4gYWRkIHN1cHBvcnQgdG8geW91ciBib2FyZCB3aXRoIGJp
bmRpbmcuCgpFeGFtcGxlOgoJYW54NzYyNV9icmlkZ2U6IGVuY29kZXJANTggewoJCWNvbXBhdGli
bGUgPSAiYW5hbG9naXgsYW54NzYyNSI7CgkJcmVnID0gPDB4NTg+OwoJCXN0YXR1cyA9ICJva2F5
IjsKCQlwYW5lbC1mbGFncyA9IDwxPjsKCQllbmFibGUtZ3Bpb3MgPSA8JnBpbyA0NSBHUElPX0FD
VElWRV9ISUdIPjsKCQlyZXNldC1ncGlvcyA9IDwmcGlvIDczIEdQSU9fQUNUSVZFX0hJR0g+OwoJ
CSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCSNzaXplLWNlbGxzID0gPDA+OwoKCQlwb3J0QDAgewoJ
CSAgcmVnID0gPDA+OwoJCSAgYW54XzFfaW46IGVuZHBvaW50IHsKCQkgICAgcmVtb3RlLWVuZHBv
aW50ID0gPCZtaXBpX2RzaT47CgkJICB9OwoJCX07CgoJCXBvcnRAMyB7CgkJICByZWcgPSA8Mz47
CgkJICBhbnhfMV9vdXQ6IGVuZHBvaW50IHsKCQkgICAgcmVtb3RlLWVuZHBvaW50ID0gPCZwYW5l
bF9pbj47CgkJICB9OwoJCX07Cgl9OwoKU2lnbmVkLW9mZi1ieTogWGluIEppIDx4amlAYW5hbG9n
aXhzZW1pLmNvbT4KLS0tCiAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54NzYyNS55YW1s
ICAgICAgICAgICB8IDk2ICsrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5
NiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUueWFtbAoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hbng3NjI1Lnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYW54
NzYyNS55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmZjODQ2ODMKLS0t
IC9kZXYvbnVsbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvYW54NzYyNS55YW1sCkBAIC0wLDAgKzEsOTYgQEAKKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSkKKyMgQ29weXJpZ2h0IDIwMTkgQW5h
bG9naXggU2VtaWNvbmR1Y3RvciwgSW5jLgorJVlBTUwgMS4yCistLS0KKyRpZDogImh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvYnJpZGdlL2FueDc2MjUueWFtbCMiCiskc2No
ZW1hOiAiaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjIgorCit0
aXRsZTogQW5hbG9naXggQU5YNzYyNSBTbGltUG9ydCAoNEsgTW9iaWxlIEhEIFRyYW5zbWl0dGVy
KQorCittYWludGFpbmVyczoKKyAgLSBYaW4gSmkgPHhqaUBhbmFsb2dpeHNlbWkuY29tPgorCitk
ZXNjcmlwdGlvbjogfAorICBUaGUgQU5YNzYyNSBpcyBhbiB1bHRyYS1sb3cgcG93ZXIgNEsgTW9i
aWxlIEhEIFRyYW5zbWl0dGVyCisgIGRlc2lnbmVkIGZvciBwb3J0YWJsZSBkZXZpY2VzLgorCitw
cm9wZXJ0aWVzOgorICAiI2FkZHJlc3MtY2VsbHMiOiB0cnVlCisgICIjc2l6ZS1jZWxscyI6IHRy
dWUKKworICBjb21wYXRpYmxlOgorICAgIGl0ZW1zOgorICAgICAgLSBjb25zdDogYW5hbG9naXgs
YW54NzYyNQorCisgIHJlZzoKKyAgICBtYXhJdGVtczogMQorCisgIHBhbmVsLWZsYWdzOgorICAg
IGRlc2NyaXB0aW9uOiBpbmRpY2F0ZSB0aGUgcGFuZWwgaXMgaW50ZXJuYWwgb3IgZXh0ZXJuYWwK
KyAgICBtYXhJdGVtczogMQorCisgIGludGVycnVwdHM6CisgICAgbWF4SXRlbXM6IDEKKworICBl
bmFibGUtZ3Bpb3M6CisgICAgZGVzY3JpcHRpb246IHVzZWQgZm9yIHBvd2VyIG9uIGNoaXAgY29u
dHJvbCwgUE9XRVJfRU4gcGluIEQyLgorICAgIG1heEl0ZW1zOiAxCisKKyAgcmVzZXQtZ3Bpb3M6
CisgICAgZGVzY3JpcHRpb246IHVzZWQgZm9yIHJlc2V0IGNoaXAgY29udHJvbCwgUkVTRVRfTiBw
aW4gQjcuCisgICAgbWF4SXRlbXM6IDEKKworICBwb3J0QDA6CisgICAgdHlwZTogb2JqZWN0Cisg
ICAgZGVzY3JpcHRpb246CisgICAgICBBIHBvcnQgbm9kZSBwb2ludGluZyB0byBNSVBJIERTSSBo
b3N0IHBvcnQgbm9kZS4KKworICBwb3J0QDE6CisgICAgdHlwZTogb2JqZWN0CisgICAgZGVzY3Jp
cHRpb246CisgICAgICBBIHBvcnQgbm9kZSBwb2ludGluZyB0byBNSVBJIERQSSBob3N0IHBvcnQg
bm9kZS4KKworICBwb3J0QDI6CisgICAgdHlwZTogb2JqZWN0CisgICAgZGVzY3JpcHRpb246Cisg
ICAgICBBIHBvcnQgbm9kZSBwb2ludGluZyB0byBleHRlcm5hbCBjb25uZWN0b3IgcG9ydCBub2Rl
LgorCisgIHBvcnRAMzoKKyAgICB0eXBlOiBvYmplY3QKKyAgICBkZXNjcmlwdGlvbjoKKyAgICAg
IEEgcG9ydCBub2RlIHBvaW50aW5nIHRvIGVEUCBwb3J0IG5vZGUuCisKK3JlcXVpcmVkOgorICAt
ICIjYWRkcmVzcy1jZWxscyIKKyAgLSAiI3NpemUtY2VsbHMiCisgIC0gY29tcGF0aWJsZQorICAt
IHJlZworICAtIHBvcnRAMAorICAtIHBvcnRAMworCitleGFtcGxlOgorICAtIHwKKyAgICBhbng3
NjI1X2JyaWRnZTogZW5jb2RlckA1OCB7CisgICAgICAgIGNvbXBhdGlibGUgPSAiYW5hbG9naXgs
YW54NzYyNSI7CisgICAgICAgIHJlZyA9IDwweDU4PjsKKyAgICAgICAgc3RhdHVzID0gIm9rYXki
OworICAgICAgICBwYW5lbC1mbGFncyA9IDwxPjsKKyAgICAgICAgZW5hYmxlLWdwaW9zID0gPCZw
aW8gNDUgR1BJT19BQ1RJVkVfSElHSD47CisgICAgICAgIHJlc2V0LWdwaW9zID0gPCZwaW8gNzMg
R1BJT19BQ1RJVkVfSElHSD47CisgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+OworICAgICAg
ICAjc2l6ZS1jZWxscyA9IDwwPjsKKworICAgICAgICBwb3J0QDAgeworICAgICAgICAgIHJlZyA9
IDwwPjsKKyAgICAgICAgICBhbnhfMV9pbjogZW5kcG9pbnQgeworICAgICAgICAgICAgcmVtb3Rl
LWVuZHBvaW50ID0gPCZtaXBpX2RzaT47CisgICAgICAgICAgfTsKKyAgICAgICAgfTsKKworICAg
ICAgICBwb3J0QDMgeworICAgICAgICAgIHJlZyA9IDwzPjsKKyAgICAgICAgICBhbnhfMV9vdXQ6
IGVuZHBvaW50IHsKKyAgICAgICAgICAgIHJlbW90ZS1lbmRwb2ludCA9IDwmcGFuZWxfaW4+Owor
ICAgICAgICAgIH07CisgICAgICAgIH07CisgICAgfTsKLS0gCjIuNy40CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
