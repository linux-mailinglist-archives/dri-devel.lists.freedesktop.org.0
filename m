Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77644B82C1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 09:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D5110E894;
	Wed, 16 Feb 2022 08:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C0A10E88F;
 Wed, 16 Feb 2022 08:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644999404; x=1676535404;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/oZbZTAQd39We1f6YSFw98s4kP2LqoE7OCYarnGz6GA=;
 b=FhfBdK9oXfY6HShplEndtLyMb9HVf3Av1G8vg88xUIAGAj24UWTC+qMq
 yNkvFg1ye/j/XiGxlkcNyhFgZBZFRB6lbNDdW3NpWt9H7aAwkVElcGANX
 TTxAK230q+wr4KUxxK/nSQBgd7wIgMJZb0HAYcGxsngyNBS2wRO2DcOfo
 fCDzPgjtL9L92WJMxs4CEOdpf00HtSyjl2Pq7SHG3aNDTXrvPwdX6vT/+
 8AEbT5BDr5y+5lmzOuhd08t7Ouv80zsBAGI+aHP4enNIQf/eeDxc4bfwn
 KDvz3oBG4XHwpYxg7L33wXxwBJD7RUiul39D3j9x2d1PiUPJM0hsmVSi9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="237954613"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="237954613"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 00:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="681405986"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2022 00:16:43 -0800
Received: from bgsmsx601.gar.corp.intel.com (10.109.78.80) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 16 Feb 2022 00:16:42 -0800
Received: from bgsmsx604.gar.corp.intel.com (10.67.234.6) by
 BGSMSX601.gar.corp.intel.com (10.109.78.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 16 Feb 2022 13:46:40 +0530
Received: from bgsmsx604.gar.corp.intel.com ([10.67.234.6]) by
 BGSMSX604.gar.corp.intel.com ([10.67.234.6]) with mapi id 15.01.2308.020;
 Wed, 16 Feb 2022 13:46:40 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "C, Ramalingam" <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 3/3] drm/i915: Fix for PHY_MISC_TC1 offset
Thread-Topic: [PATCH 3/3] drm/i915: Fix for PHY_MISC_TC1 offset
Thread-Index: AQHYIjAhXFmBTmxvlk+dLcr6rZcFLayV1bZw
Date: Wed, 16 Feb 2022 08:16:40 +0000
Message-ID: <b9a703701ef741c9a44d6c002681dcea@intel.com>
References: <20220215055154.15363-1-ramalingam.c@intel.com>
 <20220215055154.15363-4-ramalingam.c@intel.com>
In-Reply-To: <20220215055154.15363-4-ramalingam.c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
Cc: "Hogander, Jouni" <jouni.hogander@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQywgUmFtYWxpbmdhbSA8
cmFtYWxpbmdhbS5jQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMTUsIDIw
MjIgMTE6MjIgQU0NCj4gVG86IGludGVsLWdmeCA8aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZz47IGRyaS1kZXZlbCA8ZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+DQo+
IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPjsgU2hh
bmthciwgVW1hDQo+IDx1bWEuc2hhbmthckBpbnRlbC5jb20+OyBIb2dhbmRlciwgSm91bmkgPGpv
dW5pLmhvZ2FuZGVyQGludGVsLmNvbT47IEMsDQo+IFJhbWFsaW5nYW0gPHJhbWFsaW5nYW0uY0Bp
bnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCAzLzNdIGRybS9pOTE1OiBGaXggZm9yIFBIWV9N
SVNDX1RDMSBvZmZzZXQNCj4gDQo+IEZyb206IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5k
ZXJAaW50ZWwuY29tPg0KPiANCj4gQ3VycmVudGx5IElDTF9QSFlfTUlTQyBtYWNybyBpcyByZXR1
cm5pbmcgb2Zmc2V0IDB4NjRDMTAgZm9yIFBIWV9FIHBvcnQuIENvcnJlY3QNCj4gb2Zmc2V0IGlz
IDB4NjRDMTQuDQo+IA0KPiBGaXggdGhpcyBieSBoYW5kbGluZyBQSFlfRSBwb3J0IHNlcHJhdGVs
eS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRl
bC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJA
aW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0uY0Bp
bnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9z
bnBzX3BoeS5jIHwgMiArLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCAgICAg
ICAgICAgICAgIHwgNiArKysrLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfc25wc19waHkuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfc25wc19waHkuYw0KPiBpbmRleCBjNjA1NzVjYjUzNjguLmYwODA2MWM3NDhiMyAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zbnBzX3Bo
eS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc25wc19waHku
Yw0KPiBAQCAtMzIsNyArMzIsNyBAQCB2b2lkIGludGVsX3NucHNfcGh5X3dhaXRfZm9yX2NhbGli
cmF0aW9uKHN0cnVjdA0KPiBkcm1faTkxNV9wcml2YXRlICppOTE1KQ0KPiAgCQlpZiAoIWludGVs
X3BoeV9pc19zbnBzKGk5MTUsIHBoeSkpDQo+ICAJCQljb250aW51ZTsNCj4gDQo+IC0JCWlmIChp
bnRlbF9kZV93YWl0X2Zvcl9jbGVhcihpOTE1LCBJQ0xfUEhZX01JU0MocGh5KSwNCj4gKwkJaWYg
KGludGVsX2RlX3dhaXRfZm9yX2NsZWFyKGk5MTUsIERHMl9QSFlfTUlTQyhwaHkpLA0KPiAgCQkJ
CQkgICAgREcyX1BIWV9EUF9UWF9BQ0tfTUFTSywgMjUpKQ0KPiAgCQkJZHJtX2VycigmaTkxNS0+
ZHJtLCAiU05QUyBQSFkgJWMgZmFpbGVkIHRvIGNhbGlicmF0ZSBhZnRlcg0KPiAyNW1zLlxuIiwN
Cj4gIAkJCQlwaHkpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9y
ZWcuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgNCj4gaW5kZXggNGQxMmFiYjJk
N2ZmLi4zNTRjMjVmNDgzY2IgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfcmVnLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaA0KPiBAQCAt
OTU1OSw4ICs5NTU5LDEwIEBAIGVudW0gc2tsX3Bvd2VyX2dhdGUgew0KPiANCj4gICNkZWZpbmUg
X0lDTF9QSFlfTUlTQ19BCQkweDY0QzAwDQo+ICAjZGVmaW5lIF9JQ0xfUEhZX01JU0NfQgkJMHg2
NEMwNA0KPiAtI2RlZmluZSBJQ0xfUEhZX01JU0MocG9ydCkJX01NSU9fUE9SVChwb3J0LCBfSUNM
X1BIWV9NSVNDX0EsIFwNCj4gLQkJCQkJCSBfSUNMX1BIWV9NSVNDX0IpDQo+ICsjZGVmaW5lIF9E
RzJfUEhZX01JU0NfVEMxCTB4NjRDMTQgLyogVEMxPSJQSFkgRSIgYnV0IG9mZnNldCBhcyBpZiAi
UEhZIEYiICovDQo+ICsjZGVmaW5lIElDTF9QSFlfTUlTQyhwb3J0KQlfTU1JT19QT1JUKHBvcnQs
IF9JQ0xfUEhZX01JU0NfQSwNCj4gX0lDTF9QSFlfTUlTQ19CKQ0KDQpOaXQ6IEFsaWduIGl0IGFz
IHdhcyBkZWZpbmVkIGVhcmxpZXIgdG8gaG9ub3IgbGluZSBsaW1pdC4NCg0KTG9va3MgR29vZCB0
byBtZS4NClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0K
DQo+ICsjZGVmaW5lIERHMl9QSFlfTUlTQyhwb3J0KQkoKHBvcnQpID09IFBIWV9FID8gX01NSU8o
X0RHMl9QSFlfTUlTQ19UQzEpIDoNCj4gXA0KPiArCQkJCSBJQ0xfUEhZX01JU0MocG9ydCkpDQo+
ICAjZGVmaW5lICBJQ0xfUEhZX01JU0NfTVVYX0RESUQJCQkoMSA8PCAyOCkNCj4gICNkZWZpbmUg
IElDTF9QSFlfTUlTQ19ERV9JT19DT01QX1BXUl9ET1dOCSgxIDw8IDIzKQ0KPiAgI2RlZmluZSAg
REcyX1BIWV9EUF9UWF9BQ0tfTUFTSwkJCVJFR19HRU5NQVNLKDIzLCAyMCkNCj4gLS0NCj4gMi4y
MC4xDQoNCg==
