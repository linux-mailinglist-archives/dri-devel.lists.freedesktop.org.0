Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0E62DAD7C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 13:53:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED7D6E2DE;
	Tue, 15 Dec 2020 12:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D198B6E0DA;
 Tue, 15 Dec 2020 12:52:58 +0000 (UTC)
IronPort-SDR: 78Xdv1MlAlboqT/aWEEUSbqI9sIQyTK/lW3BuoA3o5+eGRSaJFuPEAUsZMYvE92nWmg3RBiAZ/
 o3UnAsrcpyIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="238971600"
X-IronPort-AV: E=Sophos;i="5.78,421,1599548400"; d="scan'208";a="238971600"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2020 04:52:57 -0800
IronPort-SDR: cTHmTOuZu+ICUBXd1zenNib5f7GFpAjERWwPk3Fsp/2ntJ9VMYglbOZvnx4UrFLPBtaPE5bFs9
 5At6VaG7/oNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,421,1599548400"; d="scan'208";a="556691131"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 15 Dec 2020 04:52:57 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 15 Dec 2020 04:52:57 -0800
Received: from irsmsx605.ger.corp.intel.com (163.33.146.138) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 15 Dec 2020 04:52:56 -0800
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138]) by
 IRSMSX605.ger.corp.intel.com ([163.33.146.138]) with mapi id 15.01.1713.004;
 Tue, 15 Dec 2020 12:52:54 +0000
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH v6 1/5] drm: Add function to convert rect in 16.16 fixed
 format to regular format
Thread-Topic: [PATCH v6 1/5] drm: Add function to convert rect in 16.16 fixed
 format to regular format
Thread-Index: AQHW0kFovO22FxJL0EKRTFPy6V7XUan4HcyA
Date: Tue, 15 Dec 2020 12:52:54 +0000
Message-ID: <49d845f03e5ada5462c130345ac4ba11e14c25c9.camel@intel.com>
References: <20201214174912.174065-1-jose.souza@intel.com>
In-Reply-To: <20201214174912.174065-1-jose.souza@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.253.164]
Content-ID: <3181E65C393D80478B02EFF13B36D1B7@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIwLTEyLTE0IGF0IDA5OjQ5IC0wODAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBNdWNoIG1vcmUgY2xlYXIgdG8gcmVhZCBvbmUgZnVuY3Rpb24gY2FsbCB0aGFu
IGZvdXIgbGluZXMgZG9pbmcgdGhpcw0KPiBjb252ZXJzaW9uLg0KPiANCj4gQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEd3YW4tZ3llb25nIE11biA8Z3dhbi1neWVv
bmcubXVuQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6
YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9y
ZWN0LmMgfCAxNSArKysrKysrKysrKysrKysNCj4gIGluY2x1ZGUvZHJtL2RybV9yZWN0LmggICAg
IHwgIDIgKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9yZWN0LmMNCj4gaW5kZXggMDQ2MGU4NzQ4OTZlLi4yNDM0NTcwNGIzNTMgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcmVjdC5jDQo+IEBAIC0zNzMsMyArMzczLDE4IEBAIHZvaWQgZHJtX3JlY3Rfcm90YXRlX2lu
dihzdHJ1Y3QgZHJtX3JlY3QgKnIsDQo+ICAJfQ0KPiAgfQ0KPiAgRVhQT1JUX1NZTUJPTChkcm1f
cmVjdF9yb3RhdGVfaW52KTsNCj4gKw0KPiArLyoqDQo+ICsgKiBkcm1fcmVjdF9jb252ZXJ0XzE2
XzE2X3RvX3JlZ3VsYXIgLSBDb252ZXJ0IGEgcmVjdCBpbiAxNi4xNiBmaXhlZA0KPiBwb2ludCBm
b3JtDQo+ICsgKiB0byByZWd1bGFyIGZvcm0uDQo+ICsgKiBAaW46IHJlY3QgaW4gMTYuMTYgZml4
ZWQgcG9pbnQgZm9ybQ0KPiArICogQG91dDogcmVjdCB0byBiZSBzdG9yZWQgdGhlIGNvbnZlcnRl
ZCB2YWx1ZQ0KPiArICovDQo+ICt2b2lkIGRybV9yZWN0X2NvbnZlcnRfMTZfMTZfdG9fcmVndWxh
cihzdHJ1Y3QgZHJtX3JlY3QgKmluLCBzdHJ1Y3QNCj4gZHJtX3JlY3QgKm91dCkNCj4gK3sNCj4g
KwlvdXQtPngxID0gaW4tPngxID4+IDE2Ow0KPiArCW91dC0+eTEgPSBpbi0+eTEgPj4gMTY7DQo+
ICsJb3V0LT54MiA9IGluLT54MiA+PiAxNjsNCj4gKwlvdXQtPnkyID0gaW4tPnkyID4+IDE2Ow0K
PiArfQ0KPiArRVhQT1JUX1NZTUJPTChkcm1fcmVjdF9jb252ZXJ0XzE2XzE2X3RvX3JlZ3VsYXIp
Ow0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3JlY3QuaCBiL2luY2x1ZGUvZHJtL2Ry
bV9yZWN0LmgNCj4gaW5kZXggZTdmNGQyNGNkZDAwLi4yZWY4MTgwNDE2Y2QgMTAwNjQ0DQo+IC0t
LSBhL2luY2x1ZGUvZHJtL2RybV9yZWN0LmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3JlY3Qu
aA0KPiBAQCAtMjIzLDUgKzIyMyw3IEBAIHZvaWQgZHJtX3JlY3Rfcm90YXRlKHN0cnVjdCBkcm1f
cmVjdCAqciwNCj4gIHZvaWQgZHJtX3JlY3Rfcm90YXRlX2ludihzdHJ1Y3QgZHJtX3JlY3QgKnIs
DQo+ICAJCQkgaW50IHdpZHRoLCBpbnQgaGVpZ2h0LA0KPiAgCQkJIHVuc2lnbmVkIGludCByb3Rh
dGlvbik7DQo+ICt2b2lkIGRybV9yZWN0X2NvbnZlcnRfMTZfMTZfdG9fcmVndWxhcihzdHJ1Y3Qg
ZHJtX3JlY3QgKmluLA0KPiArCQkJCSAgICAgICBzdHJ1Y3QgZHJtX3JlY3QgKm91dCk7DQo+IA0K
SGksDQppZiBpdCdzIHB1cnBvc2UgaXMganVzdCBjb252ZXJ0aW5nIDE2LjE2IGZwIHRvIGludGVn
ZXIsIGhvdyBhYm91dCB5b3UNCmhhdmUgZnVuY3Rpb24gcHJvdG90eXBlIGxpa2UgdGhpcz8NCmV4
dGVybiBpbmxpbmUgc3RydWN0IGRybV9yZWN0DQpkcm1fcmVjdF9jb252ZXJ0XzE2XzE2X2ZwX3Rv
X2ludGVnZXIoc3RydWN0IGRybV9yZWN0IGluKQ0KDQpBbmQgaWYgdGhlcmUgYXJlIG5vIHVzZSBj
YXNlIG9uIGRybSBjb3JlIG9yIG90aGVyIGRyaXZlcnMgZXhjZXB0IGk5MTUNCmRpc3BsYXkgeWV0
LA0KYmVmb3JlIGFkZGluZyB0aGlzIGZ1bmN0aW9uIHRvIGRybSBjb3JlLCBob3cgYWJvdXQgeW91
IGFkZCB0aGlzDQpmdW5jdGlvbiBjb2RlIHRvIGk5MTUgZmlyc3Q/DQoNCkJyLA0KRy5HLg0KPiAg
I2VuZGlmDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
