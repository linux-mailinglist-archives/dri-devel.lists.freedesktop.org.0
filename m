Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5638FDC56C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 14:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1936EB23;
	Fri, 18 Oct 2019 12:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE3E6EB23;
 Fri, 18 Oct 2019 12:52:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Oct 2019 05:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,311,1566889200"; d="scan'208";a="199698269"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga003.jf.intel.com with ESMTP; 18 Oct 2019 05:52:03 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 18 Oct 2019 05:52:02 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 18 Oct 2019 05:52:02 -0700
Received: from bgsmsx151.gar.corp.intel.com (10.224.48.42) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 18 Oct 2019 05:52:02 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.228]) by
 BGSMSX151.gar.corp.intel.com ([169.254.3.95]) with mapi id 14.03.0439.000;
 Fri, 18 Oct 2019 18:21:59 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 2/4] drm/edid: Extract drm_mode_cea_vic()
Thread-Topic: [Intel-gfx] [PATCH 2/4] drm/edid: Extract drm_mode_cea_vic()
Thread-Index: AQHVer7AaEFHu3uBh06QG7blZuZKrqdgb9Yw
Date: Fri, 18 Oct 2019 12:51:59 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F8227604E@BGSMSX104.gar.corp.intel.com>
References: <20191004141914.20600-1-ville.syrjala@linux.intel.com>
 <20191004141914.20600-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20191004141914.20600-2-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODYzOWIyMjgtMmFlZC00Zjk5LTk0YzYtOWU3OTUwNjZjZTkyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiXC9wcEg5ZE9KWlB5RE8zaWJEM1JMRXJrUHhVUmprK0l6aFFXTzhLckpmdE5jOEFTU0tQdTlXYzZwMW9OMWJSeGYifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
MIME-Version: 1.0
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Wayne Lin <waynelin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEludGVsLWdmeCA8aW50ZWwt
Z2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVmlsbGUgU3ly
amFsYQ0KPlNlbnQ6IEZyaWRheSwgT2N0b2JlciA0LCAyMDE5IDc6NDkgUE0NCj5UbzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBXYXluZSBMaW4gPHdheW5lbGluQGFtZC5jb20+DQo+U3ViamVjdDogW0ludGVsLWdm
eF0gW1BBVENIIDIvNF0gZHJtL2VkaWQ6IEV4dHJhY3QgZHJtX21vZGVfY2VhX3ZpYygpDQo+DQo+
RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4N
Cj5FeHRyYWN0IHRoZSBsb2dpYyB0byBjb21wdXRlIHRoZSBmaW5hbCBDRUEgVklDIHRvIGEgc21h
bGwgaGVscGVyLg0KPldlJ2xsIHJlb3JkZXIgaXQgYSBiaXQgdG8gbWFrZSBmdXR1cmUgbW9kaWZp
Y2F0aW9ucyBtb3JlIHN0cmFpZ2h0Zm9yd2FyZC4gTm8gZnVuY3Rpb24NCj5jaGFuZ2VzLg0KDQpD
aGFuZ2VzIGxvb2sgZ29vZCB0byBtZS4NClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNo
YW5rYXJAaW50ZWwuY29tPg0KDQo+Q2M6IFdheW5lIExpbiA8d2F5bmVsaW5AYW1kLmNvbT4NCj5T
aWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPg0KPi0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDUzICsrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tDQo+IDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRp
b25zKCspLCAyMyBkZWxldGlvbnMoLSkNCj4NCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBpbmRleA0KPjNkZjgyNjdh
ZGFiOS4uNDk1YjdmYjRkOWVmIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRp
ZC5jDQo+KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMNCj5AQCAtNTE2MCw2ICs1MTYw
LDM1IEBAIGRybV9oZG1pX2luZm9mcmFtZV9zZXRfaGRyX21ldGFkYXRhKHN0cnVjdA0KPmhkbWlf
ZHJtX2luZm9mcmFtZSAqZnJhbWUsICB9DQo+RVhQT1JUX1NZTUJPTChkcm1faGRtaV9pbmZvZnJh
bWVfc2V0X2hkcl9tZXRhZGF0YSk7DQo+DQo+K3N0YXRpYyB1OCBkcm1fbW9kZV9jZWFfdmljKHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsDQo+KwkJCSAgIGNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICptb2RlKSB7DQo+Kwl1OCB2ZW5kb3JfaWZfdmljID0gZHJtX21hdGNoX2hk
bWlfbW9kZShtb2RlKTsNCj4rCWJvb2wgaXNfczNkID0gbW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9G
TEFHXzNEX01BU0s7DQo+Kwl1OCB2aWM7DQo+Kw0KPisJLyoNCj4rCSAqIEhETUkgc3BlYyBzYXlz
IGlmIGEgbW9kZSBpcyBmb3VuZCBpbiBIRE1JIDEuNGIgNEsgbW9kZXMNCj4rCSAqIHdlIHNob3Vs
ZCBzZW5kIGl0cyBWSUMgaW4gdmVuZG9yIGluZm9mcmFtZXMsIGVsc2Ugc2VuZCB0aGUNCj4rCSAq
IFZJQyBpbiBBVkkgaW5mb2ZyYW1lcy4gTGV0cyBjaGVjayBpZiB0aGlzIG1vZGUgaXMgcHJlc2Vu
dCBpbg0KPisJICogSERNSSAxLjRiIDRLIG1vZGVzDQo+KwkgKi8NCj4rCWlmIChkcm1fdmFsaWRf
aGRtaV92aWModmVuZG9yX2lmX3ZpYykgJiYgIWlzX3MzZCkNCj4rCQlyZXR1cm4gMDsNCj4rDQo+
Kwl2aWMgPSBkcm1fbWF0Y2hfY2VhX21vZGUobW9kZSk7DQo+Kw0KPisJLyoNCj4rCSAqIEhETUkg
MS40IFZJQyByYW5nZTogMSA8PSBWSUMgPD0gNjQgKENFQS04NjEtRCkgYnV0DQo+KwkgKiBIRE1J
IDIuMCBWSUMgcmFuZ2U6IDEgPD0gVklDIDw9IDEwNyAoQ0VBLTg2MS1GKS4gU28gd2UNCj4rCSAq
IGhhdmUgdG8gbWFrZSBzdXJlIHdlIGRvbnQgYnJlYWsgSERNSSAxLjQgc2lua3MuDQo+KwkgKi8N
Cj4rCWlmICghaXNfaGRtaTJfc2luayhjb25uZWN0b3IpICYmIHZpYyA+IDY0KQ0KPisJCXJldHVy
biAwOw0KPisNCj4rCXJldHVybiB2aWM7DQo+K30NCj4rDQo+IC8qKg0KPiAgKiBkcm1faGRtaV9h
dmlfaW5mb2ZyYW1lX2Zyb21fZGlzcGxheV9tb2RlKCkgLSBmaWxsIGFuIEhETUkgQVZJIGluZm9m
cmFtZSB3aXRoDQo+ICAqICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRhdGEgZnJvbSBhIERSTSBkaXNwbGF5IG1vZGUNCj5AQCAtNTE4NywyOSArNTIxNiw3IEBA
IGRybV9oZG1pX2F2aV9pbmZvZnJhbWVfZnJvbV9kaXNwbGF5X21vZGUoc3RydWN0DQo+aGRtaV9h
dmlfaW5mb2ZyYW1lICpmcmFtZSwNCj4gCWlmIChtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdf
REJMQ0xLKQ0KPiAJCWZyYW1lLT5waXhlbF9yZXBlYXQgPSAxOw0KPg0KPi0JZnJhbWUtPnZpZGVv
X2NvZGUgPSBkcm1fbWF0Y2hfY2VhX21vZGUobW9kZSk7DQo+LQ0KPi0JLyoNCj4tCSAqIEhETUkg
MS40IFZJQyByYW5nZTogMSA8PSBWSUMgPD0gNjQgKENFQS04NjEtRCkgYnV0DQo+LQkgKiBIRE1J
IDIuMCBWSUMgcmFuZ2U6IDEgPD0gVklDIDw9IDEwNyAoQ0VBLTg2MS1GKS4gU28gd2UNCj4tCSAq
IGhhdmUgdG8gbWFrZSBzdXJlIHdlIGRvbnQgYnJlYWsgSERNSSAxLjQgc2lua3MuDQo+LQkgKi8N
Cj4tCWlmICghaXNfaGRtaTJfc2luayhjb25uZWN0b3IpICYmIGZyYW1lLT52aWRlb19jb2RlID4g
NjQpDQo+LQkJZnJhbWUtPnZpZGVvX2NvZGUgPSAwOw0KPi0NCj4tCS8qDQo+LQkgKiBIRE1JIHNw
ZWMgc2F5cyBpZiBhIG1vZGUgaXMgZm91bmQgaW4gSERNSSAxLjRiIDRLIG1vZGVzDQo+LQkgKiB3
ZSBzaG91bGQgc2VuZCBpdHMgVklDIGluIHZlbmRvciBpbmZvZnJhbWVzLCBlbHNlIHNlbmQgdGhl
DQo+LQkgKiBWSUMgaW4gQVZJIGluZm9mcmFtZXMuIExldHMgY2hlY2sgaWYgdGhpcyBtb2RlIGlz
IHByZXNlbnQgaW4NCj4tCSAqIEhETUkgMS40YiA0SyBtb2Rlcw0KPi0JICovDQo+LQlpZiAoZnJh
bWUtPnZpZGVvX2NvZGUpIHsNCj4tCQl1OCB2ZW5kb3JfaWZfdmljID0gZHJtX21hdGNoX2hkbWlf
bW9kZShtb2RlKTsNCj4tCQlib29sIGlzX3MzZCA9IG1vZGUtPmZsYWdzICYgRFJNX01PREVfRkxB
R18zRF9NQVNLOw0KPi0NCj4tCQlpZiAoZHJtX3ZhbGlkX2hkbWlfdmljKHZlbmRvcl9pZl92aWMp
ICYmICFpc19zM2QpDQo+LQkJCWZyYW1lLT52aWRlb19jb2RlID0gMDsNCj4tCX0NCj4rCWZyYW1l
LT52aWRlb19jb2RlID0gZHJtX21vZGVfY2VhX3ZpYyhjb25uZWN0b3IsIG1vZGUpOw0KPg0KPiAJ
ZnJhbWUtPnBpY3R1cmVfYXNwZWN0ID0gSERNSV9QSUNUVVJFX0FTUEVDVF9OT05FOw0KPg0KPi0t
DQo+Mi4yMS4wDQo+DQo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCj5JbnRlbC1nZnggbWFpbGluZyBsaXN0DQo+SW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aW50ZWwtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
