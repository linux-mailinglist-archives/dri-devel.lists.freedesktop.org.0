Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8776195A61B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 22:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F01DA10E416;
	Wed, 21 Aug 2024 20:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1280 seconds by postgrey-1.36 at gabe;
 Wed, 21 Aug 2024 08:44:37 UTC
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7769910E04D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 08:44:37 +0000 (UTC)
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
 by mail03.siengine.com with ESMTPS id 47L8fm2N076000
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 21 Aug 2024 16:41:48 +0800 (+08)
 (envelope-from hongchi.peng@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com
 [10.8.1.33])
 by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4Wpfvb2DcFz7ZMpD;
 Wed, 21 Aug 2024 16:41:47 +0800 (CST)
Received: from SEEXMB05-2019.siengine.com (10.8.1.153) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Wed, 21 Aug 2024 16:41:47 +0800
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB05-2019.siengine.com (10.8.1.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Wed, 21 Aug 2024 16:41:46 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Wed, 21 Aug 2024 16:41:46 +0800
From: =?gb2312?B?UGVuZyBIb25nY2hpL8Xtuumz2w==?= <hongchi.peng@siengine.com>
To: =?gb2312?B?UGVuZyBIb25nY2hpL8Xtuumz2w==?= <hongchi.peng@siengine.com>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBkcm06IGtvbWVkYTogRml4IGFuIGlzc3VlIHJlbGF0?=
 =?gb2312?Q?ed_to_normalized_zpos?=
Thread-Topic: [PATCH] drm: komeda: Fix an issue related to normalized zpos
Thread-Index: AQHa86MyGBv66CmiKEqzP2nKr0rHV7IxYmVA
Date: Wed, 21 Aug 2024 08:41:46 +0000
Message-ID: <01446fc98394446eb82a6346953f4fd0@siengine.com>
References: <20240821081910.5062-1-hongchi.peng@siengine.com>
In-Reply-To: <20240821081910.5062-1-hongchi.peng@siengine.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.10.38]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DKIM-Results: [10.8.1.61]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: mail03.siengine.com 47L8fm2N076000
X-Mailman-Approved-At: Wed, 21 Aug 2024 20:51:19 +0000
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

SGksIGFsbDoNCg0KIEknbSBzb3JyeSB0aGF0IEkgZm9yZ290IHRvIGFkZCBhIHBhaXIgb2YgYnJh
Y2tldHMsIGFuZCBJJ2xsIHNlbmQgaXQgYWdhaW4gc29vbi4NCg0KQmVzdCBSZWdhcmRzLA0KSG9u
Z2NoaSBQZW5nDQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBob25nY2hpLnBlbmcgPGhv
bmdjaGkucGVuZ0BzaWVuZ2luZS5jb20+IA0Kt6LLzcqxvOQ6IDIwMjTE6jjUwjIxyNUgMTY6MTkN
CsrVvP7IyzogbGl2aXUuZHVkYXVAYXJtLmNvbQ0Ks63LzTogbWFhcnRlbi5sYW5raG9yc3RAbGlu
dXguaW50ZWwuY29tOyBtcmlwYXJkQGtlcm5lbC5vcmc7IHR6aW1tZXJtYW5uQHN1c2UuZGU7IGFp
cmxpZWRAZ21haWwuY29tOyBkYW5pZWxAZmZ3bGwuY2g7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IFBlbmcgSG9uZ2NoaS/F7brps9sgPGhvbmdjaGkucGVuZ0BzaWVuZ2luZS5jb20+
DQrW98ziOiBbUEFUQ0hdIGRybToga29tZWRhOiBGaXggYW4gaXNzdWUgcmVsYXRlZCB0byBub3Jt
YWxpemVkIHpwb3MNCg0KV2UgdXNlIGtvbWVkYV9jcnRjX25vcm1hbGl6ZV96cG9zIHRvIG5vcm1h
bGl6ZSB6cG9zIG9mIGFmZmVjdGVkIHBsYW5lcyB0byB0aGVpciBibGVuZGluZyB6b3JkZXIgaW4g
Q1UuIElmIHRoZXJlJ3Mgb25seSBvbmUgc2xhdmUgcGxhbmUgaW4gYWZmZWN0ZWQgcGxhbmVzIGFu
ZCBpdHMgbGF5ZXJfc3BsaXQgcHJvcGVydHkgaXMgZW5hYmxlZCwgb3JkZXIrKyBmb3IgaXRzIHNw
bGl0IGxheWVyLCBzbyB0aGF0IHdoZW4gY2FsY3VsYXRpbmcgdGhlIG5vcm1hbGl6ZWRfenBvcyBv
ZiBtYXN0ZXIgcGxhbmVzLCB0aGUgc3BsaXQgbGF5ZXIgb2YgdGhlIHNsYXZlIHBsYW5lIGlzIGlu
Y2x1ZGVkLCBidXQgdGhlIG1heF9zbGF2ZV96b3JkZXIgZG9lcyBub3QgaW5jbHVkZSB0aGUgc3Bs
aXQgbGF5ZXIgYW5kIGtlZXAgemVybyBiZWNhdXNlIHRoZXJlJ3Mgb25seSBvbmUgc2xhdmUgcGxh
bmUgaW4gYWZmYWN0ZWQgcGxhbmVzLCBhbHRob3VnaCB3ZSBhY3R1YWxseSB1c2UgdHdvIHNsYXZl
IGxheWVycyBpbiB0aGlzIGNvbW1pdC4NCg0KSW4gbW9zdCBjYXNlcywgdGhpcyBidWcgZG9lcyBu
b3QgcmVzdWx0IGluIGEgY29tbWl0IGZhaWx1cmUsIGJ1dCBhc3N1bWUgdGhlIGZvbGxvd2luZyBz
aXR1YXRpb246DQogICAgc2xhdmVfbGF5ZXIgMDogenBvcyA9IDAsIGxheWVyIHNwbGl0IGVuYWJs
ZWQsIG5vcm1hbGl6ZWRfenBvcyA9DQogICAgMDsodXNlIHNsYXZlX2xheWVyIDIgYXMgaXRzIHNw
bGl0IGxheWVyKQ0KICAgIG1hc3Rlcl9sYXllciAwOiB6cG9zID0gMiwgbGF5ZXJfc3BsaXQgZW5h
YmxlZCwgbm9ybWFsaXplZF96cG9zID0NCiAgICAyOyh1c2UgbWFzdGVyX2xheWVyIDIgYXMgaXRz
IHNwbGl0IGxheWVyKQ0KICAgIG1hc3Rlcl9sYXllciAxOiB6cG9zID0gNCwgbm9ybWFsaXplZF96
cG9zID0gNDsNCiAgICBtYXN0ZXJfbGF5ZXIgMzogenBvcyA9IDUsIG5vcm1hbGl6ZWRfenBvcyA9
IDU7DQogICAga2NydGNfc3QtPm1heF9zbGF2ZV96b3JkZXIgPSAwOw0KV2hlbiB3ZSB1c2UgbWFz
dGVyX2xheWVyIDMgYXMgYSBpbnB1dCBvZiBDVSBpbiBmdW5jdGlvbiBrb21lZGFfY29tcGl6X3Nl
dF9pbnB1dCBhbmQgY2hlY2sgaXQgd2l0aCBmdW5jdGlvbiBrb21lZGFfY29tcG9uZW50X2NoZWNr
X2lucHV0LCB0aGUgcGFyYW1ldGVyIGlkeCBpcyBlcXVhbCB0byBub3JtYWlsemVkX3pwb3MgbWlu
dXMgbWF4X3NsYXZlX3pvcmRlciwgdGhlIHZhbHVlIG9mIGlkeCBpcyA1IGFuZCBpcyBldXFhbCB0
byBDVSdzIG1heF9hY3RpdmVfaW5wdXRzLCBzbyB0aGF0IGtvbWVkYV9jb21wb25lbnRfY2hlY2tf
aW5wdXQgcmV0dXJucyBhIC1FSU5WQUwgdmFsdWUuDQoNClRvIGZpeCB0aGUgYnVnIGRlc2NyaWJl
ZCBhYm92ZSwgd2hlbiBjYWxjdWxhdGluZyB0aGUgbWF4X3NsYXZlX3pvcmRlciB3aXRoIHRoZSBs
YXllcl9zcGxpdCBlbmFibGVkLCBjb3VudCB0aGUgc3BsaXQgbGF5ZXIgaW4gdGhpcyBjYWxjdWxh
dGlvbiBkaXJlY3RseS4NCg0KU2lnbmVkLW9mZi1ieTogaG9uZ2NoaS5wZW5nIDxob25nY2hpLnBl
bmdAc2llbmdpbmUuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfa21zLmMgfCA4ICsrKysrLS0tDQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5
L2tvbWVkYS9rb21lZGFfa21zLmMNCmluZGV4IGZlNDZiMGViZWZlYS4uMDU1NDk1NGM4Y2VhIDEw
MDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21z
LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5j
DQpAQCAtMTU5LDcgKzE1OSw3IEBAIHN0YXRpYyBpbnQga29tZWRhX2NydGNfbm9ybWFsaXplX3pw
b3Moc3RydWN0IGRybV9jcnRjICpjcnRjLA0KIAlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpwbGFu
ZV9zdDsNCiAJc3RydWN0IGRybV9wbGFuZSAqcGxhbmU7DQogCXN0cnVjdCBsaXN0X2hlYWQgem9y
ZGVyX2xpc3Q7DQotCWludCBvcmRlciA9IDAsIGVycjsNCisJaW50IG9yZGVyID0gMCwgc2xhdmVf
enBvcywgZXJyOw0KIA0KIAlEUk1fREVCVUdfQVRPTUlDKCJbQ1JUQzolZDolc10gY2FsY3VsYXRp
bmcgbm9ybWFsaXplZCB6cG9zIHZhbHVlc1xuIiwNCiAJCQkgY3J0Yy0+YmFzZS5pZCwgY3J0Yy0+
bmFtZSk7DQpAQCAtMjAwLDkgKzIwMCwxMSBAQCBzdGF0aWMgaW50IGtvbWVkYV9jcnRjX25vcm1h
bGl6ZV96cG9zKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCiANCiAJCS8qIGNhbGN1bGF0ZSBtYXgg
c2xhdmUgem9yZGVyICovDQogCQlpZiAoaGFzX2JpdChkcm1fcGxhbmVfaW5kZXgocGxhbmUpLCBr
Y3J0Yy0+c2xhdmVfcGxhbmVzKSkNCisJCQlzbGF2ZV96cG9zID0gcGxhbmVfc3QtPm5vcm1hbGl6
ZWRfenBvczsNCisJCQlpZiAodG9fa3BsYW5lX3N0KHBsYW5lX3N0KS0+bGF5ZXJfc3BsaXQpDQor
CQkJCXNsYXZlX3pwb3MrKzsNCiAJCQlrY3J0Y19zdC0+bWF4X3NsYXZlX3pvcmRlciA9DQotCQkJ
CW1heChwbGFuZV9zdC0+bm9ybWFsaXplZF96cG9zLA0KLQkJCQkgICAga2NydGNfc3QtPm1heF9z
bGF2ZV96b3JkZXIpOw0KKwkJCQltYXgoc2xhdmVfenBvcywga2NydGNfc3QtPm1heF9zbGF2ZV96
b3JkZXIpOw0KIAl9DQogDQogCWNydGNfc3QtPnpwb3NfY2hhbmdlZCA9IHRydWU7DQotLQ0KMi4z
NC4xDQoNCg==
