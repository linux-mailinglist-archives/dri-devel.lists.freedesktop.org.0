Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A32F11CE253
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 20:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D5806E529;
	Mon, 11 May 2020 18:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C556E527;
 Mon, 11 May 2020 18:12:34 +0000 (UTC)
IronPort-SDR: 9mRYIf+N27O0f2qk87/Z+jVWcCT5rlUyKgJlvPLY8PxT4ZVE9JKZVYDGUtelgvBUSMY1Oqt812
 Lfdn40cjiHBg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 11:12:33 -0700
IronPort-SDR: a5dNAnaZU73+PB47lD7rYy9vZpVDkfMS/Udz9CRvWB+kMJ1Os2WPkMyiKy+p7EzQchQMRHMAbb
 VL4hbgjUHS1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,380,1583222400"; d="scan'208";a="279862110"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga002.jf.intel.com with ESMTP; 11 May 2020 11:12:33 -0700
Received: from fmsmsx163.amr.corp.intel.com (10.18.125.72) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 11 May 2020 11:12:32 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.60]) by
 fmsmsx163.amr.corp.intel.com ([169.254.6.217]) with mapi id 14.03.0439.000;
 Mon, 11 May 2020 11:12:32 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] drm/writeback: don't set fence->ops to default
Thread-Topic: [PATCH 1/3] drm/writeback: don't set fence->ops to default
Thread-Index: AQHWJ3Q7yTxcG3nXxUawaG6GrIfCOKijMEEw
Date: Mon, 11 May 2020 18:12:32 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663010E20F82D@FMSMSX108.amr.corp.intel.com>
References: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20200511091142.208787-1-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.107]
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
Cc: David Airlie <airlied@linux.ie>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkRhbmllbCBWZXR0
ZXINCj5TZW50OiBNb25kYXksIE1heSAxMSwgMjAyMCA1OjEyIEFNDQo+VG86IExLTUwgPGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+DQo+Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT47IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ow0KPkludGVsIEdy
YXBoaWNzIERldmVsb3BtZW50IDxpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgRFJJ
DQo+RGV2ZWxvcG1lbnQgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBUaG9tYXMg
WmltbWVybWFubg0KPjx0emltbWVybWFubkBzdXNlLmRlPjsgVmV0dGVyLCBEYW5pZWwgPGRhbmll
bC52ZXR0ZXJAaW50ZWwuY29tPg0KPlN1YmplY3Q6IFtQQVRDSCAxLzNdIGRybS93cml0ZWJhY2s6
IGRvbid0IHNldCBmZW5jZS0+b3BzIHRvIGRlZmF1bHQNCj4NCj5JdCdzIHRoZSBkZWZhdWx0Lg0K
DQpJIGNhbiBnZXQgYmVoaW5kIHRoYXQuIPCfmIoNCg0KUmV2aWV3ZWQtYnk6IE1pY2hhZWwgSi4g
UnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0KDQo+U2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQo+Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+Q2M6IE1heGltZSBSaXBhcmQg
PG1yaXBhcmRAa2VybmVsLm9yZz4NCj5DYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+DQo+Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4NCj5DYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0KPi0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vZHJt
X3dyaXRlYmFjay5jIHwgMSAtDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+DQo+
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fd3JpdGViYWNrLmMNCj5iL2RyaXZlcnMv
Z3B1L2RybS9kcm1fd3JpdGViYWNrLmMNCj5pbmRleCA0M2Q5ZTNiYjNhOTQuLmRjY2Y0NTA0ZjFi
YiAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3dyaXRlYmFjay5jDQo+KysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV93cml0ZWJhY2suYw0KPkBAIC0xMDgsNyArMTA4LDYgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkbWFfZmVuY2Vfb3BzDQo+ZHJtX3dyaXRlYmFja19mZW5jZV9vcHMg
PSB7DQo+IAkuZ2V0X2RyaXZlcl9uYW1lID0gZHJtX3dyaXRlYmFja19mZW5jZV9nZXRfZHJpdmVy
X25hbWUsDQo+IAkuZ2V0X3RpbWVsaW5lX25hbWUgPSBkcm1fd3JpdGViYWNrX2ZlbmNlX2dldF90
aW1lbGluZV9uYW1lLA0KPiAJLmVuYWJsZV9zaWduYWxpbmcgPSBkcm1fd3JpdGViYWNrX2ZlbmNl
X2VuYWJsZV9zaWduYWxpbmcsDQo+LQkud2FpdCA9IGRtYV9mZW5jZV9kZWZhdWx0X3dhaXQsDQo+
IH07DQo+DQo+IHN0YXRpYyBpbnQgY3JlYXRlX3dyaXRlYmFja19wcm9wZXJ0aWVzKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpDQo+LS0NCj4yLjI2LjINCj4NCj5fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj5kcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
