Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD8054CB8A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 16:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDDC10E838;
	Wed, 15 Jun 2022 14:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7C510E80A;
 Wed, 15 Jun 2022 14:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655303987; x=1686839987;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cUXHESLjp2naf6KyJFBftTXGUTSlItEpCKY6AY2SODo=;
 b=Ov+CkeERS3jrCjMmJPVE7wHMPu/3xITSgA+AaG3Cn/GmVcTu58OM4n/Z
 lcqbNwNRUR7nuBgVN6yfD/p4aHsrsxdKS6TEa3QGzpscSdQJKY1Ofa48F
 Cmy8zAiwIYTeiYyUMkj1ujVmiizg6iVGUBiqoPsFEFoLMZThOOIKW+TEJ
 4OSRWJV5w4+/XVoZF3Ojxdv1n9eUQJbxpyFXE9kHfHF+xGqGQLl6rHnOD
 OkdzC4Y/ZBP00lhbPUGpS77xCND/83ewiJ3yLl3J6nZ2CReDAm7blpIqo
 aHwZ+L0YCecnFOIf5/wl1tDVthjZ2MfBnwWWOiKCqSdf3tfjKWSc95Lxx A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="262005535"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="262005535"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 07:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="674532295"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Jun 2022 07:39:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 15 Jun 2022 07:39:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 15 Jun 2022 07:39:30 -0700
Received: from fmsmsx612.amr.corp.intel.com ([10.18.126.92]) by
 fmsmsx612.amr.corp.intel.com ([10.18.126.92]) with mapi id 15.01.2308.027;
 Wed, 15 Jun 2022 07:39:30 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/pvc: Add recommended MMIO setting
Thread-Topic: [PATCH] drm/i915/pvc: Add recommended MMIO setting
Thread-Index: AQHYf0Yn1C+mkLRaWEyTfUp3TqEgyq1RAjsA
Date: Wed, 15 Jun 2022 14:39:30 +0000
Message-ID: <09f427b656f342327e090073c01c73284016e9db.camel@intel.com>
References: <20220613165314.862029-1-matthew.d.roper@intel.com>
In-Reply-To: <20220613165314.862029-1-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D1D8C6AFE7F7ED4D8333A4BCB46DEAB8@intel.com>
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

T24gTW9uLCAyMDIyLTA2LTEzIGF0IDA5OjUzIC0wNzAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBB
cyB3aXRoIHBhc3QgcGxhdGZvcm1zLCB0aGUgYnNwZWMncyBwZXJmb3JtYW5jZSB0dW5pbmcgZ3Vp
ZGUgcHJvdmlkZXMNCj4gcmVjb21tZW5kZWQgTU1JTyBzZXR0aW5ncy4gIEFsdGhvdWdoIG5vdCB0
ZWNobmljYWxseSAid29ya2Fyb3VuZHMiIHdlDQo+IGFwcGx5IHRoZXNlIHRocm91Z2ggdGhlIHdv
cmthcm91bmQgZnJhbWV3b3JrIHRvIGVuc3VyZSB0aGF0IHRoZXkncmUNCj4gcmUtYXBwbGllZCBh
dCB0aGUgcHJvcGVyIHRpbWVzIChlLmcuLCBvbiBlbmdpbmUgcmVzZXRzKSBhbmQgdGhhdCBhbnkN
Cj4gY29uZmxpY3RzIHdpdGggcmVhbCB3b3JrYXJvdW5kcyBhcmUgZmxhZ2dlZC4NCg0KUmV2aWV3
ZWQtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KDQo+
IA0KPiBCc3BlYzogNzIxNjENCj4gU2lnbmVkLW9mZi1ieTogTWF0dCBSb3BlciA8bWF0dGhldy5k
LnJvcGVyQGludGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRl
bF9ndF9yZWdzLmggICAgIHwgNSArKysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50
ZWxfd29ya2Fyb3VuZHMuYyB8IDkgKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9p
bnRlbF9ndF9yZWdzLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ndF9yZWdzLmgN
Cj4gaW5kZXggMjI2NTU3MDE4MDM3Li4wN2VmMTExOTQ3YjggMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X3JlZ3MuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9pbnRlbF9ndF9yZWdzLmgNCj4gQEAgLTk4MSw2ICs5ODEsMTEgQEANCj4gICNk
ZWZpbmUgWEVIUF9MM1NDUVJFRzcJCQkJX01NSU8oMHhiMTg4KQ0KPiAgI2RlZmluZSAgIEJMRU5E
X0ZJTExfQ0FDSElOR19PUFRfRElTCQlSRUdfQklUKDMpDQo+ICANCj4gKyNkZWZpbmUgWEVIUENf
TDNTQ1JVQgkJCQlfTU1JTygweGIxOGMpDQo+ICsjZGVmaW5lICAgU0NSVUJfQ0xfRFdOR1JBREVf
U0hBUkVECQlSRUdfQklUKDEyKQ0KPiArI2RlZmluZSAgIFNDUlVCX1JBVEVfUEVSX0JBTktfTUFT
SwkJUkVHX0dFTk1BU0soMiwgMCkNCj4gKyNkZWZpbmUgICBTQ1JVQl9SQVRFXzRCX1BFUl9DTEsJ
CQlSRUdfRklFTERfUFJFUChTQ1JVQl9SQVRFX1BFUl9CQU5LX01BU0ssIDB4NikNCj4gKw0KPiAg
I2RlZmluZSBMM1NRQ1JFRzFfQ0NTMAkJCQlfTU1JTygweGIyMDApDQo+ICAjZGVmaW5lICAgRkxV
U0hBTExOT05DT0gJCQlSRUdfQklUKDUpDQo+ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L2ludGVsX3dvcmthcm91bmRzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dC9pbnRlbF93b3JrYXJvdW5kcy5jDQo+IGluZGV4IDFlOTgyYWM5MzFkYy4uYzRhZjUxMTQ0MjE2
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF93b3JrYXJvdW5k
cy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX3dvcmthcm91bmRzLmMN
Cj4gQEAgLTI2NzksNiArMjY3OSwxNSBAQCBnZW5lcmFsX3JlbmRlcl9jb21wdXRlX3dhX2luaXQo
c3RydWN0IGludGVsX2VuZ2luZV9jcyAqZW5naW5lLCBzdHJ1Y3QgaTkxNV93YV9saQ0KPiAgew0K
PiAgCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICppOTE1ID0gZW5naW5lLT5pOTE1Ow0KPiAgDQo+
ICsJaWYgKElTX1BPTlRFVkVDQ0hJTyhpOTE1KSkgew0KPiArCQkvKg0KPiArCQkgKiBUaGUgZm9s
bG93aW5nIGlzIG5vdCBhY3R1YWxseSBhICJ3b3JrYXJvdW5kIiBidXQgcmF0aGVyDQo+ICsJCSAq
IGEgcmVjb21tZW5kZWQgdHVuaW5nIHNldHRpbmcgZG9jdW1lbnRlZCBpbiB0aGUgYnNwZWMncw0K
PiArCQkgKiBwZXJmb3JtYW5jZSBndWlkZSBzZWN0aW9uLg0KPiArCQkgKi8NCj4gKwkJd2Ffd3Jp
dGUod2FsLCBYRUhQQ19MM1NDUlVCLCBTQ1JVQl9DTF9EV05HUkFERV9TSEFSRUQgfCBTQ1JVQl9S
QVRFXzRCX1BFUl9DTEspOw0KPiArCX0NCj4gKw0KPiAgCWlmIChJU19YRUhQU0RWKGk5MTUpKSB7
DQo+ICAJCS8qIFdhXzE0MDk5NTQ2MzkgKi8NCj4gIAkJd2FfbWFza2VkX2VuKHdhbCwNCg0K
