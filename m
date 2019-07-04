Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681285F2AA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 08:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666F76E25C;
	Thu,  4 Jul 2019 06:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B714F6E25C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 06:18:20 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4637.eurprd08.prod.outlook.com (10.255.27.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 4 Jul 2019 06:18:17 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 06:18:17 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH 1/6] drm/komeda: Add side by side assembling
Thread-Topic: [PATCH 1/6] drm/komeda: Add side by side assembling
Thread-Index: AQHVMjBFlYmNC0QkvE69W6T2GlIVsw==
Date: Thu, 4 Jul 2019 06:18:17 +0000
Message-ID: <20190704061717.6854-2-james.qian.wang@arm.com>
References: <20190704061717.6854-1-james.qian.wang@arm.com>
In-Reply-To: <20190704061717.6854-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c9342a2-00dc-4d17-a37f-08d70047673f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4637; 
x-ms-traffictypediagnostic: VE1PR08MB4637:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VE1PR08MB46370040D26CAD8EEEFDF89EB3FA0@VE1PR08MB4637.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(199004)(189003)(99286004)(110136005)(14444005)(36756003)(68736007)(256004)(52116002)(102836004)(26005)(386003)(55236004)(3846002)(6116002)(6506007)(8676002)(5660300002)(103116003)(486006)(2906002)(54906003)(76176011)(2501003)(186003)(6436002)(81156014)(81166006)(2201001)(476003)(71200400001)(86362001)(305945005)(446003)(7736002)(11346002)(8936002)(478600001)(2616005)(966005)(6486002)(66476007)(64756008)(66066001)(66946007)(4326008)(53936002)(50226002)(66446008)(14454004)(316002)(73956011)(66556008)(71190400001)(6512007)(6306002)(1076003)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4637;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tjg46lxOO87tBs6rPUbriYzaOuoOW8q4L6hCjCt7YcMaIwC/tumAK5bA484lN0SO15BB0XdXM9CT4BqkPAu5r/nW0dSXDc3mbg3Jrvi750hMQIbweidnDvZXIfL1iIN2pJ2tNPf/x9m9vKmV5gaCBFQsQel2zFoFsgFmiLUNW/YtioLA/xcOk4zDUszLWNkYEboeEJdZ10REdp1AZ1DC2Sq7h5hxsNVHs9Ndnm/C6AmRW+bblSZ62KGFcett8uAXAlVNd7aguRt1e2pHsDQpRHwSIOJr+y1l12w0eDMLT0nktaclhwhhOfJYjpk2eKXJmvhizIuicn4iIff/Rbfh+lgS2rImyF/E9Ud1C1E1CUzAltlZ/tnw/etnaLl5U8i/RA1z3G91Z/g+Uv/NmyJFE+YeK9M170iWCL746441a+E=
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9342a2-00dc-4d17-a37f-08d70047673f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 06:18:17.6633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4637
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZp3A+Zj58ITdMBc/79NVuDNXIXj7nlNqra73Z2aQZY=;
 b=cA2OmyC0CZMCm+W/yzgscfmpgYSHCaraJn2n1DkRm42Aifv1fubI9UkjFTHKo2aDhW5IIQu35Y7b6SUB+ydouDKwXBUdeaVSNoQ/rh//PaV9jLxpCCXBCM5wPmq7rOqXHZu87Fydkw5mZuZved5nzLTEGOSX+LmOBaIGGQeCFQY=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

S29tZWRhIEhXIGNhbiBzdXBwb3J0IHNpZGUgYnkgc2lkZSwgd2hpY2ggc3BsaXRzIHRoZSBpbnRl
cm5hbCBkaXNwbGF5CnByb2Nlc3NpbmcgdG8gdHdvIHNpbmdsZSBoYWx2ZXMgKExFRlQvUklHSFQp
IGFuZCBoYW5kbGUgdGhlbSBieSB0d28KcGlwZWxpbmVzIHNlcGFyYXRlbHkgYW5kIHNpbXVsdGFu
ZW91c2x5LgoKVGhlIGRhdGEgZmxvdyBvZiBzaWRlX2J5X3NpZGUgYXMgYmxvdzoKCiBzbGF2ZS5s
YXllcjAgLT5cICAgICAgICAgICAgICAgICAgLy0+IHNsYXZlLndiX2xheWVyIC0+IGZiLnJpZ2h0
X3BhcnQKICAgICAuLi4gICAgICAgICAtPiBzbGF2ZS5jb21waXogLT4KIHNsYXZlLmxheWVyMyAt
Pi8gICAgICAgICAgICAgICAgICBcLT4gc2xhdmUuaW1wcm9jZXNzb3ItPgogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXCAgICAvLT4gb3V0
cHV0LWxpbmswCiBtYXN0ZXIubGF5ZXIwIC0+XCAgICAgICAgICAgICAgICAgICAgLy0+IG1hc3Rl
ci5pbXByb2Nlc3NvciAtPlwtPiBvdXRwdXQtbGluazEKICAgICAuLi4gICAgICAgICAgIC0+IG1h
c3Rlci5jb21waXogLT4KIG1hc3Rlci5sYXllcjMgLT4vICAgICAgICAgICAgICAgICAgICBcLT4g
bWFzdGVyLndiX2xheWVyIC0+IGZiLnJpZ2h0X3BhcnQKCkRlcGVuZHMgb246Ci0gaHR0cHM6Ly9w
YXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82MjI4MC8KClNpZ25lZC1vZmYtYnk6IEph
bWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJt
LmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYyAg
fCAgOSArKystCiAuLi4vZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5jICAg
fCAgMyArKwogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCAgIHwg
IDkgKysrKwogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCAgIHwg
IDMgKysKIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5jICB8IDUw
ICsrKysrKysrKysrKysrKysrLS0KIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9w
aXBlbGluZS5oICB8ICAxICsKIDYgZmlsZXMgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKSwgNiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jcnRjLmMKaW5kZXggMzc0NGU2ZDFiYTk2Li5jM2JiMTExYzQ1NGMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKQEAgLTU5MSwx
NiArNTkxLDIxIEBAIGludCBrb21lZGFfa21zX3NldHVwX2NydGNzKHN0cnVjdCBrb21lZGFfa21z
X2RldiAqa21zLAoKIAkJY3J0Yy0+bWFzdGVyID0gbWFzdGVyOwogCQljcnRjLT5zbGF2ZSAgPSBr
b21lZGFfcGlwZWxpbmVfZ2V0X3NsYXZlKG1hc3Rlcik7CisJCWNydGMtPnNpZGVfYnlfc2lkZSA9
IG1kZXYtPnNpZGVfYnlfc2lkZTsKCiAJCWlmIChjcnRjLT5zbGF2ZSkKIAkJCXNwcmludGYoc3Ry
LCAicGlwZS0lZCIsIGNydGMtPnNsYXZlLT5pZCk7CiAJCWVsc2UKIAkJCXNwcmludGYoc3RyLCAi
Tm9uZSIpOwoKLQkJRFJNX0lORk8oIkNSVEMtJWQ6IG1hc3RlcihwaXBlLSVkKSBzbGF2ZSglcyku
XG4iLAotCQkJIGttcy0+bl9jcnRjcywgbWFzdGVyLT5pZCwgc3RyKTsKKwkJRFJNX0lORk8oIkNS
VEMtJWQ6IG1hc3RlcihwaXBlLSVkKSBzbGF2ZSglcykgc2JzKCVzKS5cbiIsCisJCQkga21zLT5u
X2NydGNzLCBtYXN0ZXItPmlkLCBzdHIsCisJCQkgY3J0Yy0+c2lkZV9ieV9zaWRlID8gIk9uIiA6
ICJPZmYiKTsKCiAJCWttcy0+bl9jcnRjcysrOworCisJCWlmIChtZGV2LT5zaWRlX2J5X3NpZGUp
CisJCQlicmVhazsKIAl9CgogCXJldHVybiAwOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9kZXYuYwppbmRleCBiYjcyNjQyY2ZkNjcuLjJhZWU3MzVhNjgz
ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
ZGV2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZGV2
LmMKQEAgLTE5MSw2ICsxOTEsOSBAQCBzdGF0aWMgaW50IGtvbWVkYV9wYXJzZV9kdChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQogCQl9CiAJfQoKKwltZGV2LT5z
aWRlX2J5X3NpZGUgPSAhb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJzaWRlX2J5X3NpZGVfbWFz
dGVyIiwKKwkJCQkJJm1kZXYtPnNpZGVfYnlfc2lkZV9tYXN0ZXIpOworCiAJcmV0dXJuIHJldDsK
IH0KCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVk
YV9kZXYuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5o
CmluZGV4IGU4NjNlYzMyNzc5MC4uYzcwY2MyNWQyNDZmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaAorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaApAQCAtMTc2LDYgKzE3NiwxNSBAQCBz
dHJ1Y3Qga29tZWRhX2RldiB7CgogCS8qKiBAaXJxOiBpcnEgbnVtYmVyICovCiAJaW50IGlycTsK
KwkvKioKKwkgKiBAc2lkZV9ieV9zaWRlOgorCSAqCisJICogb24gc2JzIHRoZSB3aG9sZSBkaXNw
bGF5IGZyYW1lIHdpbGwgYmUgc3BsaXQgdG8gdHdvIGhhbHZlcyAoMToyKSwKKwkgKiBtYXN0ZXIg
cGlwZWxpbmUgaGFuZGxlcyB0aGUgbGVmdCBwYXJ0LCBzbGF2ZSBmb3IgdGhlIHJpZ2h0IHBhcnQK
KwkgKi8KKwlib29sIHNpZGVfYnlfc2lkZTsKKwkvKiogQHNpZGVfYnlfc2lkZV9tYXN0ZXI6IG1h
c3RlciBwaXBlIGlkIGZvciBzaWRlIGJ5IHNpZGUgKi8KKwlpbnQgc2lkZV9ieV9zaWRlX21hc3Rl
cjsKCiAJLyoqIEBsb2NrOiB1c2VkIHRvIHByb3RlY3QgZHBtb2RlICovCiAJc3RydWN0IG11dGV4
IGxvY2s7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9rbXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2tt
cy5oCmluZGV4IGQwY2Y4MzgxZDJhYi4uMGRiZmQ3YWQ3ODA1IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaAorKysgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaApAQCAtODQsNiArODQsOSBAQCBz
dHJ1Y3Qga29tZWRhX2NydGMgewogCSAqLwogCXN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKnNsYXZl
OwoKKwkvKiogQHNpZGVfYnlfc2lkZTogaWYgdGhlIG1hc3RlciBhbmQgc2xhdmUgd29ya3Mgb24g
c2lkZSBieSBzaWRlIG1vZGUgKi8KKwlib29sIHNpZGVfYnlfc2lkZTsKKwogCS8qKiBAc2xhdmVf
cGxhbmVzOiBrb21lZGEgc2xhdmUgcGxhbmVzIG1hc2sgKi8KIAl1MzIgc2xhdmVfcGxhbmVzOwoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3Bp
cGVsaW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBl
bGluZS5jCmluZGV4IDQ1MmU1MDVhMWZkMy4uMTA0ZTI3Y2MxZGMzIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmMKQEAgLTMy
NiwxNCArMzI2LDU2IEBAIHN0YXRpYyB2b2lkIGtvbWVkYV9waXBlbGluZV9hc3NlbWJsZShzdHJ1
Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlKQogc3RydWN0IGtvbWVkYV9waXBlbGluZSAqCiBrb21l
ZGFfcGlwZWxpbmVfZ2V0X3NsYXZlKHN0cnVjdCBrb21lZGFfcGlwZWxpbmUgKm1hc3RlcikKIHsK
LQlzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqc2xhdmU7CisJc3RydWN0IGtvbWVkYV9kZXYgKm1k
ZXYgPSBtYXN0ZXItPm1kZXY7CisJc3RydWN0IGtvbWVkYV9jb21wb25lbnQgKmNvbXAsICpzbGF2
ZTsKKwl1MzIgYXZhaWxfaW5wdXRzOworCisJLyogb24gU0JTLCBzbGF2ZSBwaXBlbGluZSBtZXJn
ZSB0byBtYXN0ZXIgdmlhIGltYWdlIHByb2Nlc3NvciAqLworCWlmIChtZGV2LT5zaWRlX2J5X3Np
ZGUpIHsKKwkJY29tcCA9ICZtYXN0ZXItPmltcHJvYy0+YmFzZTsKKwkJYXZhaWxfaW5wdXRzID0g
S09NRURBX1BJUEVMSU5FX0lNUFJPQ1M7CisJfSBlbHNlIHsKKwkJY29tcCA9ICZtYXN0ZXItPmNv
bXBpei0+YmFzZTsKKwkJYXZhaWxfaW5wdXRzID0gS09NRURBX1BJUEVMSU5FX0NPTVBJWlM7CisJ
fQoKLQlzbGF2ZSA9IGtvbWVkYV9jb21wb25lbnRfcGlja3VwX2lucHV0KCZtYXN0ZXItPmNvbXBp
ei0+YmFzZSwKLQkJCQkJICAgICAgS09NRURBX1BJUEVMSU5FX0NPTVBJWlMpOworCXNsYXZlID0g
a29tZWRhX2NvbXBvbmVudF9waWNrdXBfaW5wdXQoY29tcCwgYXZhaWxfaW5wdXRzKTsKCiAJcmV0
dXJuIHNsYXZlID8gc2xhdmUtPnBpcGVsaW5lIDogTlVMTDsKIH0KCitzdGF0aWMgaW50IGtvbWVk
YV9hc3NlbWJsZV9zaWRlX2J5X3NpZGUoc3RydWN0IGtvbWVkYV9kZXYgKm1kZXYpCit7CisJc3Ry
dWN0IGtvbWVkYV9waXBlbGluZSAqbWFzdGVyLCAqc2xhdmU7CisJaW50IGk7CisKKwlpZiAoIW1k
ZXYtPnNpZGVfYnlfc2lkZSkKKwkJcmV0dXJuIDA7CisKKwlpZiAobWRldi0+c2lkZV9ieV9zaWRl
X21hc3RlciA+PSBtZGV2LT5uX3BpcGVsaW5lcykgeworCQlEUk1fRVJST1IoIkRUIGNvbmZpZ3Vy
ZWQgc2lkZSBieSBzaWRlIG1hc3Rlci0lZCBpcyBpbnZhbGlkLlxuIiwKKwkJCSAgbWRldi0+c2lk
ZV9ieV9zaWRlX21hc3Rlcik7CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCW1hc3RlciA9IG1k
ZXYtPnBpcGVsaW5lc1ttZGV2LT5zaWRlX2J5X3NpZGVfbWFzdGVyXTsKKwlzbGF2ZSA9IGtvbWVk
YV9waXBlbGluZV9nZXRfc2xhdmUobWFzdGVyKTsKKwlpZiAoIXNsYXZlIHx8IHNsYXZlLT5uX2xh
eWVycyAhPSBtYXN0ZXItPm5fbGF5ZXJzKSB7CisJCURSTV9FUlJPUigiQ3VycmVudCBIVyBkb2Vz
bid0IHN1cHBvcnQgc2lkZSBieSBzaWRlLlxuIik7CisJCXJldHVybiAtRUlOVkFMOworCX0KKwor
CWlmICghbWFzdGVyLT5kdWFsX2xpbmspIHsKKwkJRFJNX0RFQlVHX0FUT01JQygiU0JTIGNhbiBu
b3Qgd29yayB3aXRob3V0IGR1YWwgbGluay5cbiIpOworCQlyZXR1cm4gLUVJTlZBTDsKKwl9CisK
Kwlmb3IgKGkgPSAwOyBpIDwgbWFzdGVyLT5uX2xheWVyczsgaSsrKQorCQltYXN0ZXItPmxheWVy
c1tpXS0+c2JzX3NsYXZlID0gc2xhdmUtPmxheWVyc1tpXTsKKworCXJldHVybiAwOworfQorCiBp
bnQga29tZWRhX2Fzc2VtYmxlX3BpcGVsaW5lcyhzdHJ1Y3Qga29tZWRhX2RldiAqbWRldikKIHsK
IAlzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlOwpAQCAtMzQ2LDcgKzM4OCw3IEBAIGludCBr
b21lZGFfYXNzZW1ibGVfcGlwZWxpbmVzKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQogCQlrb21l
ZGFfcGlwZWxpbmVfZHVtcChwaXBlKTsKIAl9CgotCXJldHVybiAwOworCXJldHVybiBrb21lZGFf
YXNzZW1ibGVfc2lkZV9ieV9zaWRlKG1kZXYpOwogfQoKIHZvaWQga29tZWRhX3BpcGVsaW5lX2R1
bXBfcmVnaXN0ZXIoc3RydWN0IGtvbWVkYV9waXBlbGluZSAqcGlwZSwKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmggYi9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCmluZGV4IDY2
ZDc2NjQyYmM1Yi4uNmQzNzQ1YmI4YzFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lLmgKQEAgLTIzNiw2ICsyMzYsNyBAQCBz
dHJ1Y3Qga29tZWRhX2xheWVyIHsKIAkgKiBub3QgdGhlIHNvdXJjZSBidWZmZXIuCiAJICovCiAJ
c3RydWN0IGtvbWVkYV9sYXllciAqcmlnaHQ7CisJc3RydWN0IGtvbWVkYV9sYXllciAqc2JzX3Ns
YXZlOwogfTsKCiBzdHJ1Y3Qga29tZWRhX2xheWVyX3N0YXRlIHsKLS0KMi4yMC4xCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
