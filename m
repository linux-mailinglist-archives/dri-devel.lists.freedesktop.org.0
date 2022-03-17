Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF034DC7B5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 14:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA53F10EBA3;
	Thu, 17 Mar 2022 13:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F71A10EBA3;
 Thu, 17 Mar 2022 13:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647524158; x=1679060158;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rFtbd+86MBi0ATaI743gB34T6zhzEPs+Vq4yiEM5zWA=;
 b=ST1uBmDrfb8l2ATe2g+K5zxVWkfa9cT989dzzXN8lpbtSa6EEsjqADY4
 qjwMJpn73UifRgfTNI7iisYD0K6ZkjSUcIpbS9BJ1iGrjRo4kSfo+lUP0
 2Dh2r0gyejTCeXbuaMZ0pVoYf0A9k+IDxqN/e23t8HsPnOUD62zeHtT4K
 dOfJs2iI0nqYUyM1NQVbcqAVXVFj51LE1yY118qGHna+zIHdWiH1I06Co
 Y5oIpt9J3SifP5PI016VlELtlp758Zsi8MFvgD+rVkA8bvrqP16y9pY03
 zINUbWy55SNBECtn+PN13Xlh0zfVcoTwAD/at6CH/LdIPowK5x3vJgRjq w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="320080755"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="320080755"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 06:35:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="635363310"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Mar 2022 06:35:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 06:35:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 17 Mar 2022 06:35:56 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2308.021;
 Thu, 17 Mar 2022 06:35:56 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] drm/i915: Fix renamed struct field
Thread-Topic: [PATCH 1/2] drm/i915: Fix renamed struct field
Thread-Index: AQHYOZADi4Uu7LQTMUSl9dz9MuSIyqzECmeA
Date: Thu, 17 Mar 2022 13:35:56 +0000
Message-ID: <6bddce5310966cd57f78ff7650bc57421ff9d460.camel@intel.com>
References: <20220316234538.434357-1-lucas.demarchi@intel.com>
In-Reply-To: <20220316234538.434357-1-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CFCF64D94E5244C8288643BA039F0CF@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIyLTAzLTE2IGF0IDE2OjQ1IC0wNzAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IEVhcmxpZXIgdmVyc2lvbnMgb2YgY29tbWl0IGE1YjdlZjI3ZGE2MCAoImRybS9pOTE1OiBB
ZGQgc3RydWN0IHRvIGhvbGQNCj4gSVAgdmVyc2lvbiIpIG5hbWVkICJ2ZXIiIGFzICJhcmNoIiBh
bmQgdGhlbiB3aGVuIGl0IHdhcyByZW5hbWVkIGl0DQo+IG1pc3NlZCB0aGUgcmVuYW1lIG9uIE1F
RElBX1ZFUl9GVUxMKCkgc2luY2UgaXQgaXQncyBjdXJyZW50bHkgbm90IHVzZWQuDQoNClJldmll
d2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0K
PiANCj4gRml4ZXM6IGE1YjdlZjI3ZGE2MCAoImRybS9pOTE1OiBBZGQgc3RydWN0IHRvIGhvbGQg
SVAgdmVyc2lvbiIpDQo+IENjOiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGlu
dGVsLmNvbT4NCj4gQ2M6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIERlIE1hcmNoaSA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmggfCAyICstDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9kcnYuaA0KPiBpbmRleCAyNmRmNTYxYTRlOTQuLjc0NThiMTA3YTFkNiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaA0KPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oDQo+IEBAIC05MjIsNyArOTIyLDcgQEAgc3RhdGlj
IGlubGluZSBzdHJ1Y3QgaW50ZWxfZ3QgKnRvX2d0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpp
OTE1KQ0KPiAgCShHUkFQSElDU19WRVIoaTkxNSkgPj0gKGZyb20pICYmIEdSQVBISUNTX1ZFUihp
OTE1KSA8PSAodW50aWwpKQ0KPiAgDQo+ICAjZGVmaW5lIE1FRElBX1ZFUihpOTE1KQkJCShJTlRF
TF9JTkZPKGk5MTUpLT5tZWRpYS52ZXIpDQo+IC0jZGVmaW5lIE1FRElBX1ZFUl9GVUxMKGk5MTUp
CQlJUF9WRVIoSU5URUxfSU5GTyhpOTE1KS0+bWVkaWEuYXJjaCwgXA0KPiArI2RlZmluZSBNRURJ
QV9WRVJfRlVMTChpOTE1KQkJSVBfVkVSKElOVEVMX0lORk8oaTkxNSktPm1lZGlhLnZlciwgXA0K
PiAgCQkJCQkgICAgICAgSU5URUxfSU5GTyhpOTE1KS0+bWVkaWEucmVsKQ0KPiAgI2RlZmluZSBJ
U19NRURJQV9WRVIoaTkxNSwgZnJvbSwgdW50aWwpIFwNCj4gIAkoTUVESUFfVkVSKGk5MTUpID49
IChmcm9tKSAmJiBNRURJQV9WRVIoaTkxNSkgPD0gKHVudGlsKSkNCg0K
