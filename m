Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB4129A447
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 06:43:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EABB6E075;
	Tue, 27 Oct 2020 05:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164C76E075;
 Tue, 27 Oct 2020 05:43:36 +0000 (UTC)
IronPort-SDR: Om/H+YOCM70c+2ZKdUtZZxGP8VQshwmuBO9vNmXL5qLzWYwvveHpqiW4tuA/cJRbkrUaxbQB6W
 otWJGmvtsB7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9786"; a="185766841"
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="185766841"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 22:43:36 -0700
IronPort-SDR: 4nZmgplB4iMjI7lPeWpWzkc8tlG2mWJg+78xw6SiNU5456+kxIXIqFasU1FHhqhjOKskkbIyNa
 1sfZHC/ciV3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,422,1596524400"; d="scan'208";a="303642211"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga008.fm.intel.com with ESMTP; 26 Oct 2020 22:43:36 -0700
Received: from bgsmsx602.gar.corp.intel.com (10.109.78.81) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 22:43:35 -0700
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX602.gar.corp.intel.com (10.109.78.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 27 Oct 2020 11:13:33 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.1713.004;
 Tue, 27 Oct 2020 11:13:33 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 03/16] drm/i915/hotplug: Handle CP_IRQ for DP-MST
Thread-Topic: [PATCH v3 03/16] drm/i915/hotplug: Handle CP_IRQ for DP-MST
Thread-Index: AQHWqTj2T9U4RjQ+v0WxcsrhpOXframq9WJw
Date: Tue, 27 Oct 2020 05:43:33 +0000
Message-ID: <486c36387fd74371b374da39255020b1@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
 <20201023122112.15265-4-anshuman.gupta@intel.com>
In-Reply-To: <20201023122112.15265-4-anshuman.gupta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.223.10.1]
MIME-Version: 1.0
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "Li, 
 Juston" <juston.li@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5zaHVtYW4gR3VwdGEg
PGFuc2h1bWFuLmd1cHRhQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDIzLCAy
MDIwIDU6NTEgUE0NCj4gVG86IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IHNlYW5wYXVsQGNocm9taXVtLm9yZzsg
TmlrdWxhLCBKYW5pIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+OyBDLA0KPiBSYW1hbGluZ2FtIDxy
YW1hbGluZ2FtLmNAaW50ZWwuY29tPjsgTGksIEp1c3RvbiA8anVzdG9uLmxpQGludGVsLmNvbT47
DQo+IFNoYW5rYXIsIFVtYSA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPjsgR3VwdGEsIEFuc2h1bWFu
DQo+IDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+OyBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjMgMDMvMTZdIGRybS9p
OTE1L2hvdHBsdWc6IEhhbmRsZSBDUF9JUlEgZm9yIERQLU1TVA0KPiANCj4gSGFuZGxlIENQX0lS
USBpbiBERVZJQ0VfU0VSVklDRV9JUlFfVkVDVE9SX0VTSTAgSXQgcmVxdWlyZXMgdG8gY2FsbA0K
PiBpbnRlbF9oZGNwX2hhbmRsZV9jcF9pcnEoKSBpbiBjYXNlIG9mIENQX0lSUSBpcyB0cmlnZ2Vy
ZWQgYnkgYSBzaW5rIGluIERQLU1TVA0KPiB0b3BvbG9neS4NCg0KTG9va3MgR29vZCB0byBtZS4N
ClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KDQo+IENj
OiAiVmlsbGUgU3lyasOkbMOkIiA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+IENj
OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0BpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IEFuc2h1bWFuIEd1cHRhIDxhbnNodW1hbi5ndXB0YUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jIHwgMTQgKysrKysrKysrKysrKy0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jDQo+IGluZGV4IDgxOGRh
YWIyNTJmMy4uMjFjNmM5ODI4Y2Q3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RwLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9kcC5jDQo+IEBAIC01NjU3LDYgKzU2NTcsMTcgQEAgc3RhdGljIHZvaWQgaW50ZWxf
ZHBfaGFuZGxlX3Rlc3RfcmVxdWVzdChzdHJ1Y3QNCj4gaW50ZWxfZHAgKmludGVsX2RwKQ0KPiAg
CQkJICAgICJDb3VsZCBub3Qgd3JpdGUgdGVzdCByZXNwb25zZSB0byBzaW5rXG4iKTsgIH0NCj4g
DQo+ICtzdGF0aWMgdm9pZA0KPiAraW50ZWxfZHBfbXN0X2hwZF9pcnEoc3RydWN0IGludGVsX2Rw
ICppbnRlbF9kcCwgdTggKmVzaSwgYm9vbCAqaGFuZGxlZCkNCj4gK3sNCj4gKwkJZHJtX2RwX21z
dF9ocGRfaXJxKCZpbnRlbF9kcC0+bXN0X21nciwgZXNpLCBoYW5kbGVkKTsNCj4gKw0KPiArCQlp
ZiAoZXNpWzFdICYgRFBfQ1BfSVJRKSB7DQo+ICsJCQlpbnRlbF9oZGNwX2hhbmRsZV9jcF9pcnEo
aW50ZWxfZHAtDQo+ID5hdHRhY2hlZF9jb25uZWN0b3IpOw0KPiArCQkJKmhhbmRsZWQgPSB0cnVl
Ow0KPiArCQl9DQo+ICt9DQo+ICsNCj4gIC8qKg0KPiAgICogaW50ZWxfZHBfY2hlY2tfbXN0X3N0
YXR1cyAtIHNlcnZpY2UgYW55IHBlbmRpbmcgTVNUIGludGVycnVwdHMsIGNoZWNrIGxpbmsNCj4g
c3RhdHVzDQo+ICAgKiBAaW50ZWxfZHA6IEludGVsIERQIHN0cnVjdA0KPiBAQCAtNTcwMSw3ICs1
NzEyLDggQEAgaW50ZWxfZHBfY2hlY2tfbXN0X3N0YXR1cyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVs
X2RwKQ0KPiANCj4gIAkJZHJtX2RiZ19rbXMoJmk5MTUtPmRybSwgImdvdCBlc2kgJTNwaFxuIiwg
ZXNpKTsNCj4gDQo+IC0JCWRybV9kcF9tc3RfaHBkX2lycSgmaW50ZWxfZHAtPm1zdF9tZ3IsIGVz
aSwgJmhhbmRsZWQpOw0KPiArCQlpbnRlbF9kcF9tc3RfaHBkX2lycShpbnRlbF9kcCwgZXNpLCAm
aGFuZGxlZCk7DQo+ICsNCj4gIAkJaWYgKCFoYW5kbGVkKQ0KPiAgCQkJYnJlYWs7DQo+IA0KPiAt
LQ0KPiAyLjI2LjINCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
