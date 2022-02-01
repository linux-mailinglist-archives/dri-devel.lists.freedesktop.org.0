Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6AD4A6209
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 18:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B7010E6F3;
	Tue,  1 Feb 2022 17:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1FD10E6F2;
 Tue,  1 Feb 2022 17:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643735621; x=1675271621;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UXVfQdC1LPKLryQ1lXJ59RJrg9zs+fhAVEtWtzHNAgc=;
 b=N0O80erlLZZRudOCa/7rQghkQPju3ZRVHDhAcVjx+I2iOEXTpEWq6MIU
 LrSnkR1BdcUN2t0eZPkIOG4HQqCkobNU5vxXQLauKuAY+nFikz08EtnYY
 4FOCyqk0RTG6IqTegMjB7r/L83eKsVM82IpVSxR8jiNakJ055LPmYh0mf
 IJVxhjYWpcYkCtEBhFsd5tnktnILS54Fp33mq39/cj7OLFGzbcZOsZRvB
 /Ayg/Df+nxgR+ehcSJv3vh42yrj11wb1oj1CC0Kiph/C1VUT1StCRmZR9
 H/8mS7XnKghqRFfLJf6FloBtM5Q0sbQ+7bvezMR699BMgib7BG2EV/5Lj Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="227711598"
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; d="scan'208";a="227711598"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 09:12:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,334,1635231600"; d="scan'208";a="523120580"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga007.jf.intel.com with ESMTP; 01 Feb 2022 09:12:06 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 1 Feb 2022 09:12:06 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 1 Feb 2022 09:12:05 -0800
Received: from orsmsx610.amr.corp.intel.com ([10.22.229.23]) by
 ORSMSX610.amr.corp.intel.com ([10.22.229.23]) with mapi id 15.01.2308.020;
 Tue, 1 Feb 2022 09:12:05 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 1/3] drm: Stop spamming log with drm_cache message
Thread-Topic: [PATCH v3 1/3] drm: Stop spamming log with drm_cache message
Thread-Index: AQHYFsPjggOpQ6RuD0CaVAswb4ojMqx/dsqA
Date: Tue, 1 Feb 2022 17:12:05 +0000
Message-ID: <826ebabfb8a177cc451443763e274c9671a68121.camel@intel.com>
References: <20220131165926.3230642-1-lucas.demarchi@intel.com>
 <20220131165926.3230642-2-lucas.demarchi@intel.com>
In-Reply-To: <20220131165926.3230642-2-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F9BF819EA33A9499F8E125E47918AD0@intel.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTAxLTMxIGF0IDA4OjU5IC0wODAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9ubHkgeDg2IGFuZCBpbiBzb21lIGNhc2VzIFBQQyBoYXZlIHN1cHBvcnQgYWRkZWQgaW4g
ZHJtX2NhY2hlLmMgZm9yIHRoZQ0KPiBjbGZsdXNoIGNsYXNzIG9mIGZ1bmN0aW9ucy4gSG93ZXZl
ciB3YXJuaW5nIG9uY2UgaXMgc3VmZmljaWVudCB0byB0YWludA0KPiB0aGUgbG9nIGluc3RlYWQg
b2Ygc3BhbW1pbmcgaXQgd2l0aCAiQXJjaGl0ZWN0dXJlIGhhcyBubyBkcm1fY2FjaGUuYw0KPiBz
dXBwb3J0IiBldmVyeSBmZXcgbWlsbGlzZWNvbmQuIFN3aXRjaCB0byBXQVJOX09OQ0UoKSBzbyB3
ZSBzdGlsbCBnZXQNCj4gdGhlIGxvZyBtZXNzYWdlLCBidXQgb25seSBvbmNlLCB0b2dldGhlciB3
aXRoIHRoZSB3YXJuaW5nLiBFLmc6DQo+IA0KPiAJLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0t
LS0tLS0tLS0tDQo+IAlBcmNoaXRlY3R1cmUgaGFzIG5vIGRybV9jYWNoZS5jIHN1cHBvcnQNCj4g
CVdBUk5JTkc6IENQVTogODAgUElEOiA4ODggYXQgZHJpdmVycy9ncHUvZHJtL2RybV9jYWNoZS5j
OjEzOSBkcm1fY2xmbHVzaF9zZysweDQwLzB4NTAgW2RybV0NCj4gCS4uLg0KPiANCj4gdjIgKEph
bmkpOiB1c2UgV0FSTl9PTkNFKCkgYW5kIGtlZXAgdGhlIG1lc3NhZ2UgcHJldmlvdXNseSBvbiBw
cl9lcnIoKQ0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6
YUBpbnRlbC5jb20+DQoNCkJ1dCB3aGlsZSBhdCBpdCwgd2h5IG5vdCBhZGQgYSBkcm1fZGV2aWNl
IHBhcmFtZXRlciB0byB0aGlzIGZ1bmN0aW9uIHNvIHdlIGNhbiB1c2UgZHJtX1dBUk5fT05DRSgp
Pw0KQW55d2F5cywgaXQgaXMgYmV0dGVyIHRoYW4gYmVmb3JlLg0KDQo+IA0KPiBDYzogTWFhcnRl
biBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IE1h
eGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4NCj4gQ2M6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4
LmllPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0KPiBTaWduZWQtb2Zm
LWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gLS0tDQo+
IA0KPiB2MzogTm8gY2hhbmdlcyBmcm9tIHByZXZpb3VzIHZlcnNpb24sIGp1c3Qgc3VibWl0dGlu
ZyB0byB0aGUgcmlnaHQNCj4gbWFpbGluZyBsaXN0DQo+IA0KPiAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9jYWNoZS5jIHwgOSArKystLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jYWNoZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jYWNoZS5jDQo+IGluZGV4IGYxOWQ5YWNi
ZTk1OS4uMmMzZmE1Njc3ZjdlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nh
Y2hlLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jYWNoZS5jDQo+IEBAIC0xMTIsOCAr
MTEyLDcgQEAgZHJtX2NsZmx1c2hfcGFnZXMoc3RydWN0IHBhZ2UgKnBhZ2VzW10sIHVuc2lnbmVk
IGxvbmcgbnVtX3BhZ2VzKQ0KPiAgCQlrdW5tYXBfYXRvbWljKHBhZ2VfdmlydHVhbCk7DQo+ICAJ
fQ0KPiAgI2Vsc2UNCj4gLQlwcl9lcnIoIkFyY2hpdGVjdHVyZSBoYXMgbm8gZHJtX2NhY2hlLmMg
c3VwcG9ydFxuIik7DQo+IC0JV0FSTl9PTl9PTkNFKDEpOw0KPiArCVdBUk5fT05DRSgxLCAiQXJj
aGl0ZWN0dXJlIGhhcyBubyBkcm1fY2FjaGUuYyBzdXBwb3J0XG4iKTsNCj4gICNlbmRpZg0KPiAg
fQ0KPiAgRVhQT1JUX1NZTUJPTChkcm1fY2xmbHVzaF9wYWdlcyk7DQo+IEBAIC0xNDMsOCArMTQy
LDcgQEAgZHJtX2NsZmx1c2hfc2coc3RydWN0IHNnX3RhYmxlICpzdCkNCj4gIAlpZiAod2JpbnZk
X29uX2FsbF9jcHVzKCkpDQo+ICAJCXByX2VycigiVGltZWQgb3V0IHdhaXRpbmcgZm9yIGNhY2hl
IGZsdXNoXG4iKTsNCj4gICNlbHNlDQo+IC0JcHJfZXJyKCJBcmNoaXRlY3R1cmUgaGFzIG5vIGRy
bV9jYWNoZS5jIHN1cHBvcnRcbiIpOw0KPiAtCVdBUk5fT05fT05DRSgxKTsNCj4gKwlXQVJOX09O
Q0UoMSwgIkFyY2hpdGVjdHVyZSBoYXMgbm8gZHJtX2NhY2hlLmMgc3VwcG9ydFxuIik7DQo+ICAj
ZW5kaWYNCj4gIH0NCj4gIEVYUE9SVF9TWU1CT0woZHJtX2NsZmx1c2hfc2cpOw0KPiBAQCAtMTc3
LDggKzE3NSw3IEBAIGRybV9jbGZsdXNoX3ZpcnRfcmFuZ2Uodm9pZCAqYWRkciwgdW5zaWduZWQg
bG9uZyBsZW5ndGgpDQo+ICAJaWYgKHdiaW52ZF9vbl9hbGxfY3B1cygpKQ0KPiAgCQlwcl9lcnIo
IlRpbWVkIG91dCB3YWl0aW5nIGZvciBjYWNoZSBmbHVzaFxuIik7DQo+ICAjZWxzZQ0KPiAtCXBy
X2VycigiQXJjaGl0ZWN0dXJlIGhhcyBubyBkcm1fY2FjaGUuYyBzdXBwb3J0XG4iKTsNCj4gLQlX
QVJOX09OX09OQ0UoMSk7DQo+ICsJV0FSTl9PTkNFKDEsICJBcmNoaXRlY3R1cmUgaGFzIG5vIGRy
bV9jYWNoZS5jIHN1cHBvcnRcbiIpOw0KPiAgI2VuZGlmDQo+ICB9DQo+ICBFWFBPUlRfU1lNQk9M
KGRybV9jbGZsdXNoX3ZpcnRfcmFuZ2UpOw0KDQo=
