Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D83498A1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 07:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E95189000;
	Tue, 18 Jun 2019 05:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30062.outbound.protection.outlook.com [40.107.3.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2945189000
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 05:24:49 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5071.eurprd08.prod.outlook.com (20.179.29.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Tue, 18 Jun 2019 05:24:46 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::206b:5cf6:97e:1358%7]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 05:24:46 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Ayan Halder <Ayan.Halder@arm.com>
Subject: Re: [v2] drm/komeda: Make Komeda interrupts shareable
Thread-Topic: [v2] drm/komeda: Make Komeda interrupts shareable
Thread-Index: AQHVJZYkGje/vtT4XU6VNPIgpehS3Q==
Date: Tue, 18 Jun 2019 05:24:46 +0000
Message-ID: <20190618052439.GA3638@james-ThinkStation-P300>
References: <20190613151257.32297-1-ayan.halder@arm.com>
In-Reply-To: <20190613151257.32297-1-ayan.halder@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR03CA0082.apcprd03.prod.outlook.com
 (2603:1096:203:72::22) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04387cfc-5d06-45ac-b66a-08d6f3ad46cc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5071; 
x-ms-traffictypediagnostic: VE1PR08MB5071:
nodisclaimer: True
x-microsoft-antispam-prvs: <VE1PR08MB5071E1C3C230A6043E06C21DB3EA0@VE1PR08MB5071.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:104;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(39860400002)(136003)(366004)(346002)(396003)(376002)(199004)(189003)(66066001)(71200400001)(9686003)(6636002)(71190400001)(5660300002)(6512007)(52116002)(229853002)(256004)(7736002)(11346002)(6436002)(4326008)(5024004)(99286004)(66446008)(55236004)(102836004)(64756008)(14454004)(66946007)(14444005)(6506007)(76176011)(66476007)(305945005)(1076003)(66556008)(68736007)(81166006)(476003)(54906003)(2906002)(8676002)(81156014)(73956011)(386003)(6486002)(478600001)(26005)(86362001)(186003)(53936002)(486006)(6862004)(446003)(3846002)(58126008)(33656002)(316002)(25786009)(6116002)(8936002)(33716001)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5071;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V4BnsgEQnxRnEl6z0SjII9ddPoYF07BJX3FaWMhOgsh6dSyqqarKXgR1JevWgjJPUd4fyAzrs64FRFVJoOMJqosQsN9Hdh0+7kWIkdbjqsyXVN0HH8WHxLY0JMhaM7hZbnbX7kYB9EOk9wh9fyVgftdkJi30k73/5x+UDMhdE1bg1NDWnKL69GdqqUoDfK9uy9mtDXkSihz44UPQmd73R46RoLPLQfmEePBuPZHimbWMy0lFJY524VhZJNBioG36SzexGzBtqYUG+5tSaLxK8DTkr1AWDFrnEe61XLr2VucGIlw8N0x1xFt14qzdlv9PlIr3s/tntXxU3OP6eVCvrgBSHaw0X5Z3UJMHiydEaLKezhPG+XFgSPbuTFKkPvr1LG9KB2QotCmI+JXUB1tTYN71dbgkdgBJlRKOgGpX5MY=
Content-ID: <F05A4150F9974B4CB2FCB81ED970D441@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04387cfc-5d06-45ac-b66a-08d6f3ad46cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 05:24:46.5055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5071
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jg11UFsuG8yLgVKAb2iXZ6Brtbhmfy1eccVVMXVHDCs=;
 b=s6U4V5I8bfnzzLIGfz5NbozkSc6px9SzEBmlkGR6cgG1YRLyJKGgUy29JQvSqP1X5Cmhzja3YhLbvZee6BAlGt0IKBbZeBVGcjZQ0t4TyEwI9z7bP2N3EsURbYqtCwV7GQ81H01VWvlUuaadODjkZkmnrcLkSF6r1N8EKJYVN/U=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDM6MTM6MTBQTSArMDAwMCwgQXlhbiBIYWxkZXIgd3Jv
dGU6Cj4gS29tZWRhIGludGVycnVwdHMgbWF5IGJlIHNoYXJlZCB3aXRoIG90aGVyIGhhcmR3YXJl
IGJsb2Nrcy4KPiBPbmUgbmVlZHMgdG8gdXNlIGRldm1fcmVxdWVzdF9pcnEoKSB3aXRoIElSUUZf
U0hBUkVEIHRvIGNyZWF0ZSBhIHNoYXJlZAo+ICBpbnRlcnJ1cHQgaGFuZGxlci4KPiBBcyBhIHJl
c3VsdCBvZiBub3QgdXNpbmcgZHJtX2lycV9pbnN0YWxsKCkgYXBpLCBvbmUgbmVlZHMgdG8gc2V0
Cj4gIihzdHJ1Y3QgZHJtX2RldmljZSAqKS0+aXJxX2VuYWJsZWQgPSB0cnVlL2ZhbHNlIiB0byBl
bmFibGUvZGlzYWJsZQo+IHZibGFuayBpbnRlcnJ1cHRzLgo+IAo+IENoYW5nZXMgZnJvbSB2MTot
Cj4gMS4gU3F1YXNoZWQgdGhlIGZvbGxvd2luZyB0d28gcGF0Y2hlcyBpbnRvIG9uZSAoYXMgdGhl
IHNlY29uZCBwYXRjaCBpcyBhCj4gY29uc2VxdWVuY2Ugb2YgdGhlIGZpcnN0IG9uZSk6LQo+ICAg
IGRybS9rb21lZGE6IEF2b2lkIHVzaW5nIERSSVZFUl9JUlFfU0hBUkVECj4gICAgZHJtL2tvbWVk
YTogRW5hYmxlL0Rpc2FibGUgdmJsYW5rIGludGVycnVwdHMKPiAyLiBGaXhlZCB0aGUgY29tbWl0
IG1lc3NhZ2UgKGFzIHBvaW50ZWQgYnkgRGFuaWVsIFZldHRlcikKPiAzLiBSZW1vdmVkIGNhbGxz
IHRvICdkcm1faXJxX3VuaW5zdGFsbCgpJyBhcyB3ZSBhcmUgbm8gbG9uZ2VyIHVzaW5nCj4gZHJt
X2lycV9pbnN0YWxsKCkKPiA0LiBSZW1vdmVkIHRoZSBzdHJ1Y3QgbWVtYmVyICdrb21lZGFfa21z
X2RyaXZlci5pcnFfaGFuZGxlcicgYXMgaXQgaXMgbm90Cj4gdXNlZCBhbnl3aGVyZS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBBeWFuIEt1bWFyIGhhbGRlciA8YXlhbi5oYWxkZXJAYXJtLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgfCAx
NiArKysrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gMi4yMS4wCj4gUmV2aWV3ZWQtYnk6IExpdml1IER1ZGF1
IDxsaXZpdS5kdWRhdUBhcm0uY29tPgo+IAoKbG9va3MgZ29vZCB0byBtZS4KClRoYW5rIHlvdSBB
eWFuLgoKUmV2aWV3ZWQtYnk6IEphbWVzIFFpYW4gV2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEp
IDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9rbXMuYwo+IGluZGV4IDg2ZjY1NDJhZmI0MC4uYmIyYmZmYzBl
MDIyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfa21zLmMKPiBAQCAtNTgsNyArNTgsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIga29t
ZWRhX2ttc19kcml2ZXIgPSB7Cj4gIAkuZHJpdmVyX2ZlYXR1cmVzID0gRFJJVkVSX0dFTSB8IERS
SVZFUl9NT0RFU0VUIHwgRFJJVkVSX0FUT01JQyB8Cj4gIAkJCSAgIERSSVZFUl9QUklNRSB8IERS
SVZFUl9IQVZFX0lSUSwKPiAgCS5sYXN0Y2xvc2UJCQk9IGRybV9mYl9oZWxwZXJfbGFzdGNsb3Nl
LAo+IC0JLmlycV9oYW5kbGVyCQkJPSBrb21lZGFfa21zX2lycV9oYW5kbGVyLAo+ICAJLmdlbV9m
cmVlX29iamVjdF91bmxvY2tlZAk9IGRybV9nZW1fY21hX2ZyZWVfb2JqZWN0LAo+ICAJLmdlbV92
bV9vcHMJCQk9ICZkcm1fZ2VtX2NtYV92bV9vcHMsCj4gIAkuZHVtYl9jcmVhdGUJCQk9IGtvbWVk
YV9nZW1fY21hX2R1bWJfY3JlYXRlLAo+IEBAIC0xOTQsMjMgKzE5MywyNiBAQCBzdHJ1Y3Qga29t
ZWRhX2ttc19kZXYgKmtvbWVkYV9rbXNfYXR0YWNoKHN0cnVjdCBrb21lZGFfZGV2ICptZGV2KQo+
ICAKPiAgCWRybV9tb2RlX2NvbmZpZ19yZXNldChkcm0pOwo+ICAKPiAtCWVyciA9IGRybV9pcnFf
aW5zdGFsbChkcm0sIG1kZXYtPmlycSk7Cj4gKwllcnIgPSBkZXZtX3JlcXVlc3RfaXJxKGRybS0+
ZGV2LCBtZGV2LT5pcnEsCj4gKwkJCSAgICAgICBrb21lZGFfa21zX2lycV9oYW5kbGVyLCBJUlFG
X1NIQVJFRCwKPiArCQkJICAgICAgIGRybS0+ZHJpdmVyLT5uYW1lLCBkcm0pOwo+ICAJaWYgKGVy
cikKPiAgCQlnb3RvIGNsZWFudXBfbW9kZV9jb25maWc7Cj4gIAo+ICAJZXJyID0gbWRldi0+ZnVu
Y3MtPmVuYWJsZV9pcnEobWRldik7Cj4gIAlpZiAoZXJyKQo+IC0JCWdvdG8gdW5pbnN0YWxsX2ly
cTsKPiArCQlnb3RvIGNsZWFudXBfbW9kZV9jb25maWc7Cj4gKwo+ICsJZHJtLT5pcnFfZW5hYmxl
ZCA9IHRydWU7Cj4gIAo+ICAJZXJyID0gZHJtX2Rldl9yZWdpc3Rlcihkcm0sIDApOwo+ICAJaWYg
KGVycikKPiAtCQlnb3RvIHVuaW5zdGFsbF9pcnE7Cj4gKwkJZ290byBjbGVhbnVwX21vZGVfY29u
ZmlnOwo+ICAKPiAgCXJldHVybiBrbXM7Cj4gIAo+IC11bmluc3RhbGxfaXJxOgo+IC0JZHJtX2ly
cV91bmluc3RhbGwoZHJtKTsKPiAgY2xlYW51cF9tb2RlX2NvbmZpZzoKPiArCWRybS0+aXJxX2Vu
YWJsZWQgPSBmYWxzZTsKPiAgCWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRybSk7Cj4gIAlrb21l
ZGFfa21zX2NsZWFudXBfcHJpdmF0ZV9vYmpzKGttcyk7Cj4gIGZyZWVfa21zOgo+IEBAIC0yMjMs
OSArMjI1LDkgQEAgdm9pZCBrb21lZGFfa21zX2RldGFjaChzdHJ1Y3Qga29tZWRhX2ttc19kZXYg
KmttcykKPiAgCXN0cnVjdCBkcm1fZGV2aWNlICpkcm0gPSAma21zLT5iYXNlOwo+ICAJc3RydWN0
IGtvbWVkYV9kZXYgKm1kZXYgPSBkcm0tPmRldl9wcml2YXRlOwo+ICAKPiArCWRybS0+aXJxX2Vu
YWJsZWQgPSBmYWxzZTsKPiAgCW1kZXYtPmZ1bmNzLT5kaXNhYmxlX2lycShtZGV2KTsKPiAgCWRy
bV9kZXZfdW5yZWdpc3Rlcihkcm0pOwo+IC0JZHJtX2lycV91bmluc3RhbGwoZHJtKTsKPiAgCWNv
bXBvbmVudF91bmJpbmRfYWxsKG1kZXYtPmRldiwgZHJtKTsKPiAgCWtvbWVkYV9rbXNfY2xlYW51
cF9wcml2YXRlX29ianMoa21zKTsKPiAgCWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRybSk7Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
