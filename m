Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E64C3B6945
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 21:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019B06E53E;
	Mon, 28 Jun 2021 19:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AA76E530;
 Mon, 28 Jun 2021 19:45:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="195317685"
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; d="scan'208";a="195317685"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 12:45:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,306,1616482800"; d="scan'208";a="625365889"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by orsmga005.jf.intel.com with ESMTP; 28 Jun 2021 12:45:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 28 Jun 2021 20:45:36 +0100
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Mon, 28 Jun 2021 12:45:35 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 5/5] drm/i915/gem: Migrate to system at dma-buf map time
Thread-Topic: [PATCH v3 5/5] drm/i915/gem: Migrate to system at dma-buf map
 time
Thread-Index: AQHXbCx36/GmF/OVvU20CWs56Y27lqspyOOw
Date: Mon, 28 Jun 2021 19:45:35 +0000
Message-ID: <1e17b84df802428197e348afa460cdb7@intel.com>
References: <20210628144626.76126-1-thomas.hellstrom@linux.intel.com>
 <20210628144626.76126-6-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210628144626.76126-6-thomas.hellstrom@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.0.76
x-originating-ip: [10.1.200.100]
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPlRob21hcyBIZWxs
c3Ryw7ZtDQo+U2VudDogTW9uZGF5LCBKdW5lIDI4LCAyMDIxIDEwOjQ2IEFNDQo+VG86IGludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcNCj5DYzogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwu
Y29tPjsgQXVsZCwgTWF0dGhldw0KPjxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPlN1YmplY3Q6
IFtQQVRDSCB2MyA1LzVdIGRybS9pOTE1L2dlbTogTWlncmF0ZSB0byBzeXN0ZW0gYXQgZG1hLWJ1
ZiBtYXANCj50aW1lDQo+DQo+VW50aWwgd2Ugc3VwcG9ydCBwMnAgZG1hIG9yIGFzIGEgY29tcGxl
bWVudCB0byB0aGF0LCBtaWdyYXRlIGRhdGENCj50byBzeXN0ZW0gbWVtb3J5IGF0IGRtYS1idWYg
bWFwIHRpbWUgaWYgcG9zc2libGUuDQo+DQo+djI6DQo+LSBSZWJhc2Ugb24gZHluYW1pYyBleHBv
cnRlci4gVXBkYXRlIHRoZSBpZ3RfZG1hYnVmX2ltcG9ydF9zYW1lX2RyaXZlcg0KPiAgc2VsZnRl
c3QgdG8gbWlncmF0ZSBpZiB3ZSBhcmUgTE1FTSBjYXBhYmxlLg0KPg0KPlNpZ25lZC1vZmYtYnk6
IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4t
LS0NCj4gZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jICAgICAgICAg
ICB8IDcgKysrKysrLQ0KPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVf
Z2VtX2RtYWJ1Zi5jIHwgNCArKystDQo+IDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
ZW0vaTkxNV9nZW1fZG1hYnVmLmMNCj5iL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dl
bV9kbWFidWYuYw0KPmluZGV4IDFkMWVlYjE2N2QyOC4uNTIwN2FhM2FmMDA5IDEwMDY0NA0KPi0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFidWYuYw0KPisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFidWYuYw0KPkBAIC0yOSw3ICsyOSwx
MiBAQCBzdGF0aWMgc3RydWN0IHNnX3RhYmxlICppOTE1X2dlbV9tYXBfZG1hX2J1ZihzdHJ1Y3QN
Cj5kbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaG1lDQo+DQo+IAlhc3NlcnRfb2JqZWN0X2hlbGQo
b2JqKTsNCj4NCj4tCXJldCA9IGk5MTVfZ2VtX29iamVjdF9waW5fcGFnZXMob2JqKTsNCj4rCWlm
ICghaTkxNV9nZW1fb2JqZWN0X2Nhbl9taWdyYXRlKG9iaiwgSU5URUxfUkVHSU9OX1NNRU0pKQ0K
PisJCXJldHVybiBFUlJfUFRSKC1FT1BOT1RTVVBQKTsNCj4rDQo+KwlyZXQgPSBpOTE1X2dlbV9v
YmplY3RfbWlncmF0ZShvYmosIE5VTEwsIElOVEVMX1JFR0lPTl9TTUVNKTsNCj4rCWlmICghcmV0
KQ0KPisJCXJldCA9IGk5MTVfZ2VtX29iamVjdF9waW5fcGFnZXMob2JqKTsNCj4gCWlmIChyZXQp
DQo+IAkJZ290byBlcnI7DQoNCldpdGggdGhlIGNhdmVhdHMgb2YgdGhlIHByZXZpb3VzIHBhdGNo
ZXMgdGhpcyBsb29rcyBnb29kLg0KDQpSZXZpZXdlZC1ieTogTWljaGFlbCBKLiBSdWhsIDxtaWNo
YWVsLmoucnVobEBpbnRlbC5jb20+DQoNCk1pa2UNCg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX2RtYWJ1Zi5jDQo+Yi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX2RtYWJ1Zi5jDQo+aW5kZXggMjQ3MzVk
NmMxMmEyLi5iNjI3OGRiYTk4ZDAgMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9kbWFidWYuYw0KPisrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2dlbS9zZWxmdGVzdHMvaTkxNV9nZW1fZG1hYnVmLmMNCj5AQCAtOTQsNyArOTQsOSBAQCBz
dGF0aWMgaW50IGlndF9kbWFidWZfaW1wb3J0X3NhbWVfZHJpdmVyKHZvaWQgKmFyZykNCj4gCWlu
dCBlcnI7DQo+DQo+IAlmb3JjZV9kaWZmZXJlbnRfZGV2aWNlcyA9IHRydWU7DQo+LQlvYmogPSBp
OTE1X2dlbV9vYmplY3RfY3JlYXRlX3NobWVtKGk5MTUsIFBBR0VfU0laRSk7DQo+KwlvYmogPSBp
OTE1X2dlbV9vYmplY3RfY3JlYXRlX2xtZW0oaTkxNSwgUEFHRV9TSVpFLCAwKTsNCj4rCWlmIChJ
U19FUlIob2JqKSkNCj4rCQlvYmogPSBpOTE1X2dlbV9vYmplY3RfY3JlYXRlX3NobWVtKGk5MTUs
IFBBR0VfU0laRSk7DQo+IAlpZiAoSVNfRVJSKG9iaikpDQo+IAkJZ290byBvdXRfcmV0Ow0KPg0K
Pi0tDQo+Mi4zMS4xDQoNCg==
