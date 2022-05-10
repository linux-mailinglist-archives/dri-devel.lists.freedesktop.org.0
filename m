Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 815EB5224AD
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 21:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CF010E512;
	Tue, 10 May 2022 19:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D826710E512;
 Tue, 10 May 2022 19:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652210561; x=1683746561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pQdKDTEjGXmf6hdFcjwbhsir5urGQxtkv9GKg/9z9+Y=;
 b=JgB3XsqRVQTJbC8mCCWG3OR5xtTR6Fq7z5u+ie0FUy85SpUTHS5j11Ri
 hyHTcII0Ag5DF8lC95nVcule7NJe/hOmkkDXzy5cMeECiYKpHOOwmr7AC
 3/Q86DBS3wu7lM+h23BkRBDnLtpLJHsblIGXIbuCiZr3BqI7d+O3Nqm7i
 Y/IqA2YtdwEbobbUrk/tytG3C910tEOMQvTtsmMsT9sh6Pe7wAvRt8nxV
 WtG8iP4xsgT0xj2cP5btxTYg5U6jpwcx44EoayAYOuM5ox2MSWZ68uSgs
 ib9u61FjpAKJoCOVFH1rfNOIgDvp9NbXr6AId7dun0GIu/nmUhw21mUPb g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="269618528"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="269618528"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 12:22:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="738862426"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga005.jf.intel.com with ESMTP; 10 May 2022 12:22:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 12:22:40 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2308.027;
 Tue, 10 May 2022 12:22:40 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: Re: [PATCH v3 1/3] drm/print: Add drm_debug_once* macros
Thread-Topic: [PATCH v3 1/3] drm/print: Add drm_debug_once* macros
Thread-Index: AQHYZJx094v7H4rrakmNNx9mT1+UXK0Y8r+A
Date: Tue, 10 May 2022 19:22:40 +0000
Message-ID: <3d3eae1863184230930258ac818ab0565fddeb11.camel@intel.com>
References: <20220510183313.1046628-1-jouni.hogander@intel.com>
 <20220510183313.1046628-2-jouni.hogander@intel.com>
In-Reply-To: <20220510183313.1046628-2-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <04C500C0BBCDE04EB9E9FA8516922B3D@intel.com>
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
Cc: "markpearson@lenovo.com" <markpearson@lenovo.com>, "Kahola,
 Mika" <mika.kahola@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTA1LTEwIGF0IDIxOjMzICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
DQo+IEFkZCBkcm1fZGVidWdfb25jZSogbWFjcm9zIHRvIGFsbG93IHByaW50aW5nIG91dCBvbmUg
dGltZSBkZWJ1Zw0KPiBtZXNzYWdlcyB3aGljaCBjYW4gYmUgc3RpbGwgY29udHJvbGxlZCB2aWEg
ZHJtLmRlYnVnIHBhcmFtZXRlci4NCg0KUmV2aWV3ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291
emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQo+IA0KPiBDYzogSm9zw6kgUm9iZXJ0byBkZSBT
b3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+IENjOiBNaWthIEthaG9sYSA8bWlrYS5rYWhv
bGFAaW50ZWwuY29tPg0KPiBDYzogTWFyayBQZWFyc29uIDxtYXJrcGVhcnNvbkBsZW5vdm8uY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVs
LmNvbT4NCj4gLS0tDQo+ICBpbmNsdWRlL2RybS9kcm1fcHJpbnQuaCB8IDI5ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9wcmludC5oIGIvaW5jbHVkZS9kcm0v
ZHJtX3ByaW50LmgNCj4gaW5kZXggMjJmYWJkZWVkMjk3Li5lMzM5ZjQ3ZWViNmQgMTAwNjQ0DQo+
IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9wcmludC5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9w
cmludC5oDQo+IEBAIC00NzYsNiArNDc2LDM1IEBAIHZvaWQgZHJtX2Rldl9kYmcoY29uc3Qgc3Ry
dWN0IGRldmljZSAqZGV2LCBlbnVtIGRybV9kZWJ1Z19jYXRlZ29yeSBjYXRlZ29yeSwNCj4gICNk
ZWZpbmUgZHJtX2RiZ19kcm1yZXMoZHJtLCBmbXQsIC4uLikJCQkJCVwNCj4gIAlkcm1fZGV2X2Ri
ZygoZHJtKSA/IChkcm0pLT5kZXYgOiBOVUxMLCBEUk1fVVRfRFJNUkVTLCBmbXQsICMjX19WQV9B
UkdTX18pDQo+ICANCj4gKyNkZWZpbmUgZHJtX2Rldl9kYmdfb25jZShkZXYsIGNhdCwgZm10LCAu
Li4pCQkJXA0KPiArKHsJCQkJCQkJCVwNCj4gKwlzdGF0aWMgYm9vbCBfX3ByaW50X29uY2UgX19y
ZWFkX21vc3RseTsJCQlcDQo+ICsJaWYgKCFfX3ByaW50X29uY2UpIHsJCQkJCVwNCj4gKwkJX19w
cmludF9vbmNlID0gdHJ1ZTsJCQkJXA0KPiArCQlkcm1fZGV2X2RiZyhkZXYsIGNhdCwgZm10LCAj
I19fVkFfQVJHU19fKTsJXA0KPiArCX0JCQkJCQkJXA0KPiArfSkNCj4gKw0KPiArI2RlZmluZSBk
cm1fZGJnX29uY2VfY29yZShkcm0sIGZtdCwgLi4uKQkJCQkJXA0KPiArCWRybV9kZXZfZGJnX29u
Y2UoKGRybSkgPyAoZHJtKS0+ZGV2IDogTlVMTCwgRFJNX1VUX0NPUkUsIGZtdCwgIyNfX1ZBX0FS
R1NfXykNCj4gKyNkZWZpbmUgZHJtX2RiZ19vbmNlKGRybSwgZm10LCAuLi4pCQkJCQkJXA0KPiAr
CWRybV9kZXZfZGJnX29uY2UoKGRybSkgPyAoZHJtKS0+ZGV2IDogTlVMTCwgRFJNX1VUX0RSSVZF
UiwgZm10LCAjI19fVkFfQVJHU19fKQ0KPiArI2RlZmluZSBkcm1fZGJnX29uY2Vfa21zKGRybSwg
Zm10LCAuLi4pCQkJCQlcDQo+ICsJZHJtX2Rldl9kYmdfb25jZSgoZHJtKSA/IChkcm0pLT5kZXYg
OiBOVUxMLCBEUk1fVVRfS01TLCBmbXQsICMjX19WQV9BUkdTX18pDQo+ICsjZGVmaW5lIGRybV9k
Ymdfb25jZV9wcmltZShkcm0sIGZtdCwgLi4uKQkJCQkJXA0KPiArCWRybV9kZXZfZGJnX29uY2Uo
KGRybSkgPyAoZHJtKS0+ZGV2IDogTlVMTCwgRFJNX1VUX1BSSU1FLCBmbXQsICMjX19WQV9BUkdT
X18pDQo+ICsjZGVmaW5lIGRybV9kYmdfb25jZV9hdG9taWMoZHJtLCBmbXQsIC4uLikJCQkJCVwN
Cj4gKwlkcm1fZGV2X2RiZ19vbmNlKChkcm0pID8gKGRybSktPmRldiA6IE5VTEwsIERSTV9VVF9B
VE9NSUMsIGZtdCwgIyNfX1ZBX0FSR1NfXykNCj4gKyNkZWZpbmUgZHJtX2RiZ19vbmNlX3ZibChk
cm0sIGZtdCwgLi4uKQkJCQkJXA0KPiArCWRybV9kZXZfZGJnX29uY2UoKGRybSkgPyAoZHJtKS0+
ZGV2IDogTlVMTCwgRFJNX1VUX1ZCTCwgZm10LCAjI19fVkFfQVJHU19fKQ0KPiArI2RlZmluZSBk
cm1fZGJnX29uY2Vfc3RhdGUoZHJtLCBmbXQsIC4uLikJCQkJCVwNCj4gKwlkcm1fZGV2X2RiZ19v
bmNlKChkcm0pID8gKGRybSktPmRldiA6IE5VTEwsIERSTV9VVF9TVEFURSwgZm10LCAjI19fVkFf
QVJHU19fKQ0KPiArI2RlZmluZSBkcm1fZGJnX29uY2VfbGVhc2UoZHJtLCBmbXQsIC4uLikJCQkJ
CVwNCj4gKwlkcm1fZGV2X2RiZ19vbmNlKChkcm0pID8gKGRybSktPmRldiA6IE5VTEwsIERSTV9V
VF9MRUFTRSwgZm10LCAjI19fVkFfQVJHU19fKQ0KPiArI2RlZmluZSBkcm1fZGJnX29uY2VfZHAo
ZHJtLCBmbXQsIC4uLikJCQkJCVwNCj4gKwlkcm1fZGV2X2RiZ19vbmNlKChkcm0pID8gKGRybSkt
PmRldiA6IE5VTEwsIERSTV9VVF9EUCwgZm10LCAjI19fVkFfQVJHU19fKQ0KPiArI2RlZmluZSBk
cm1fZGJnX29uY2VfZHJtcmVzKGRybSwgZm10LCAuLi4pCQkJCQlcDQo+ICsJZHJtX2Rldl9kYmdf
b25jZSgoZHJtKSA/IChkcm0pLT5kZXYgOiBOVUxMLCBEUk1fVVRfRFJNUkVTLCBmbXQsICMjX19W
QV9BUkdTX18pDQo+ICANCj4gIC8qDQo+ICAgKiBwcmludGsgYmFzZWQgbG9nZ2luZw0KDQo=
