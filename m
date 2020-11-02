Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4728B2A2BD1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437736EB85;
	Mon,  2 Nov 2020 13:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 939 seconds by postgrey-1.36 at gabe;
 Mon, 02 Nov 2020 12:10:29 UTC
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA896E4C9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 12:10:29 +0000 (UTC)
Received: from DGGEMM402-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CPrtk5JtmzVfkm;
 Mon,  2 Nov 2020 19:54:38 +0800 (CST)
Received: from dggemi760-chm.china.huawei.com (10.1.198.146) by
 DGGEMM402-HUB.china.huawei.com (10.3.20.210) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Mon, 2 Nov 2020 19:54:43 +0800
Received: from dggemi762-chm.china.huawei.com (10.1.198.148) by
 dggemi760-chm.china.huawei.com (10.1.198.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Mon, 2 Nov 2020 19:54:43 +0800
Received: from dggemi762-chm.china.huawei.com ([10.1.198.148]) by
 dggemi762-chm.china.huawei.com ([10.1.198.148]) with mapi id 15.01.1913.007;
 Mon, 2 Nov 2020 19:54:43 +0800
From: "Zouwei (Samuel)" <zou_wei@huawei.com>
To: Steven Price <steven.price@arm.com>, "robh@kernel.org" <robh@kernel.org>, 
 "tomeu.vizoso@collabora.com" <tomeu.vizoso@collabora.com>,
 "alyssa.rosenzweig@collabora.com" <alyssa.rosenzweig@collabora.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggLW5leHRdIGRybS9wYW5mcm9zdDogRml4IHVudXNl?=
 =?utf-8?Q?d_variable_warning?=
Thread-Topic: [PATCH -next] drm/panfrost: Fix unused variable warning
Thread-Index: AQHWsPmNZ8kkF0YqIE+m1gaHAdZuLKm0DSsAgACuKhA=
Date: Mon, 2 Nov 2020 11:54:43 +0000
Message-ID: <b6c8a27c8ce9443cac816affcc6ce4f6@huawei.com>
References: <1604309599-10078-1-git-send-email-zou_wei@huawei.com>
 <8729ad8d-31db-c7cd-e962-a0f7db6891b3@arm.com>
In-Reply-To: <8729ad8d-31db-c7cd-e962-a0f7db6891b3@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.178.100]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 02 Nov 2020 13:43:21 +0000
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU3RldmUsDQpTb3JyeSwgSSBkaWRuJ3Qgbm90aWNlIHRoZSBwYXRjaCBlYXJsaWVyLg0KUGxl
YXNlIGlnbm9yZSBteSBwYXRjaC4NCg0KLS0tLS3pgq7ku7bljp/ku7YtLS0tLQ0K5Y+R5Lu25Lq6
OiBTdGV2ZW4gUHJpY2UgW21haWx0bzpzdGV2ZW4ucHJpY2VAYXJtLmNvbV0gDQrlj5HpgIHml7bp
l7Q6IDIwMjDlubQxMeaciDLml6UgMTc6MjkNCuaUtuS7tuS6ujogWm91d2VpIChTYW11ZWwpIDx6
b3Vfd2VpQGh1YXdlaS5jb20+OyByb2JoQGtlcm5lbC5vcmc7IHRvbWV1LnZpem9zb0Bjb2xsYWJv
cmEuY29tOyBhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tOyBhaXJsaWVkQGxpbnV4Lmll
OyBkYW5pZWxAZmZ3bGwuY2gNCuaKhOmAgTogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0K5Li76aKYOiBSZTogW1BBVENIIC1uZXh0
XSBkcm0vcGFuZnJvc3Q6IEZpeCB1bnVzZWQgdmFyaWFibGUgd2FybmluZw0KDQpPbiAwMi8xMS8y
MDIwIDA5OjMzLCBab3UgV2VpIHdyb3RlOg0KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJu
ZWwgYnVpbGQgd2FybmluZzoNCj4gDQo+IC4vcGFuZnJvc3Rfam9iLmM6NjE3OjI4OiB3YXJuaW5n
OiB1bnVzZWQgdmFyaWFibGUg4oCYanPigJkgWy1XdW51c2VkLXZhcmlhYmxlXQ0KPiAgICBzdHJ1
Y3QgcGFuZnJvc3Rfam9iX3Nsb3QgKmpzID0gcGZkZXYtPmpzOw0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+DQo+IA0KPiBSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1
YXdlaS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFpvdSBXZWkgPHpvdV93ZWlAaHVhd2VpLmNvbT4N
Cg0KQm9yaXMgcG9zdGVkIGFuIGlkZW50aWNhbCBwYXRjaCBlYXJsaWVyOg0KDQpodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjAxMTAxMTczODE3LjgzMTc2OS0xLWJvcmlzLmJyZXppbGxvbiU0
MGNvbGxhYm9yYS5jb20NCg0KU3RldmUNCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3Rfam9iLmMgfCAyIC0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRp
b25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2pvYi5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jDQo+IGlu
ZGV4IDQ5MDJiYzYuLmU3NWI3ZDIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9qb2IuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3Rfam9iLmMNCj4gQEAgLTYxMyw4ICs2MTMsNiBAQCBpbnQgcGFuZnJvc3Rfam9iX29wZW4o
c3RydWN0IHBhbmZyb3N0X2ZpbGVfcHJpdiAqcGFuZnJvc3RfcHJpdikNCj4gICANCj4gICB2b2lk
IHBhbmZyb3N0X2pvYl9jbG9zZShzdHJ1Y3QgcGFuZnJvc3RfZmlsZV9wcml2ICpwYW5mcm9zdF9w
cml2KQ0KPiAgIHsNCj4gLQlzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiA9IHBhbmZyb3N0
X3ByaXYtPnBmZGV2Ow0KPiAtCXN0cnVjdCBwYW5mcm9zdF9qb2Jfc2xvdCAqanMgPSBwZmRldi0+
anM7DQo+ICAgCWludCBpOw0KPiAgIA0KPiAgIAlmb3IgKGkgPSAwOyBpIDwgTlVNX0pPQl9TTE9U
UzsgaSsrKQ0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
