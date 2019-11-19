Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ACB102C13
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 19:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61E66E3AE;
	Tue, 19 Nov 2019 18:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D046E3AE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 18:53:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 10:53:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,219,1571727600"; d="scan'208";a="200452249"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga008.jf.intel.com with ESMTP; 19 Nov 2019 10:53:12 -0800
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 19 Nov 2019 10:53:12 -0800
Received: from fmsmsx117.amr.corp.intel.com ([169.254.3.27]) by
 fmsmsx120.amr.corp.intel.com ([169.254.15.106]) with mapi id 14.03.0439.000;
 Tue, 19 Nov 2019 10:53:12 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "benjamin.gaignard@st.com" <benjamin.gaignard@st.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@linux.ie" <airlied@linux.ie>,
 "sean@poorly.run" <sean@poorly.run>
Subject: Re: [PATCH] drm/crtc-helper: drm_connector_get_single_encoder
 prototype is missing
Thread-Topic: [PATCH] drm/crtc-helper: drm_connector_get_single_encoder
 prototype is missing
Thread-Index: AQHVntkEouhMu4wV4EmGG0RqgiHpJqeTXZiA
Date: Tue, 19 Nov 2019 18:53:11 +0000
Message-ID: <f6f32b4d8d8e271953f887c50793f9d64d48e7b3.camel@intel.com>
References: <20191119125805.4266-1-benjamin.gaignard@st.com>
In-Reply-To: <20191119125805.4266-1-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.9.135]
Content-ID: <02A80DBA1E3FBC4DA3F514E8370B1733@intel.com>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTExLTE5IGF0IDEzOjU4ICswMTAwLCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90
ZToNCj4gSW5jbHVkZSBkcm1fY3J0Y19oZWxwZXJfaW50ZXJuYWwuaCB0byBwcm92aWRlDQo+IGRy
bV9jb25uZWN0b3JfZ2V0X3NpbmdsZV9lbmNvZGVyDQo+IHByb3RvdHlwZS4NCj4gDQo+IEZpeGVz
OiBhOTI0NjJkNmJmNDkzICgiZHJtL2Nvbm5lY3RvcjogU2hhcmUgd2l0aCBub24tYXRvbWljIGRy
aXZlcnMNCj4gdGhlIGZ1bmN0aW9uIHRvIGdldCB0aGUgc2luZ2xlIGVuY29kZXIiKQ0KDQpkcm1f
Y29ubmVjdG9yX2dldF9zaW5nbGVfZW5jb2RlcigpIGlzIGltcGxlbWVudGVkIGJlZm9yZSB0aGUg
dXNlIGluDQp0aGlzIGZpbGUgc28gaXQgaXMgbm90IGJyb2tlbiwgbm8gbmVlZCBvZiBhIGZpeGVz
IHRhZy4NCg0KUmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFA
aW50ZWwuY29tPg0KDQo+IA0KPiBDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6
YUBpbnRlbC5jb20+DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVu
amFtaW4uZ2FpZ25hcmRAc3QuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY3J0
Y19oZWxwZXIuYyB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NydGNfaGVscGVyLmMNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2NydGNfaGVscGVyLmMNCj4gaW5kZXggNDk5YjA1YWFjY2ZjLi45
M2E0ZWVjNDI5ZTggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY3J0Y19oZWxw
ZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NydGNfaGVscGVyLmMNCj4gQEAgLTQ4
LDYgKzQ4LDggQEANCj4gICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+DQo+ICAjaW5jbHVkZSA8
ZHJtL2RybV92YmxhbmsuaD4NCj4gIA0KPiArI2luY2x1ZGUgImRybV9jcnRjX2hlbHBlcl9pbnRl
cm5hbC5oIg0KPiArDQo+ICAvKioNCj4gICAqIERPQzogb3ZlcnZpZXcNCj4gICAqDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
