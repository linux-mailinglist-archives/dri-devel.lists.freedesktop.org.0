Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 767FA3B4723
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 18:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EDC6EE0E;
	Fri, 25 Jun 2021 16:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB67C6EE0E;
 Fri, 25 Jun 2021 16:02:49 +0000 (UTC)
IronPort-SDR: A6dgrtwS7WHT7VRcbHRi8+r8rzuB7YUlNTUYVkVk9UtOWNkzdgAPsGQV7xsLzkfBOsr2D0x0tg
 OhIAh7yTbE+w==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="293331510"
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="293331510"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 09:02:44 -0700
IronPort-SDR: j4LT6+lpOClgJ+CU5rxj/FBJe3uSvlTrj+J5bDzsGqp42LNmv/tguWb/6J+2YB8bTHUalnuCUN
 Mwnj6nNwAHrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="407424897"
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7])
 by orsmga003.jf.intel.com with ESMTP; 25 Jun 2021 09:02:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Fri, 25 Jun 2021 17:02:41 +0100
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Fri, 25 Jun 2021 09:02:40 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 4/4] drm/i915/gem: Migrate to system at dma-buf map time
Thread-Topic: [PATCH 4/4] drm/i915/gem: Migrate to system at dma-buf map time
Thread-Index: AQHXaSc1dzuN1f3cQESNhHfcl61w5ask2Prg
Date: Fri, 25 Jun 2021 16:02:40 +0000
Message-ID: <5304ae661abb43a0816a485db9d3bbb5@intel.com>
References: <20210624183110.22582-1-thomas.hellstrom@linux.intel.com>
 <20210624183110.22582-5-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210624183110.22582-5-thomas.hellstrom@linux.intel.com>
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
c3Ryw7ZtDQo+U2VudDogVGh1cnNkYXksIEp1bmUgMjQsIDIwMjEgMjozMSBQTQ0KPlRvOiBpbnRl
bC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+Q2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVs
LmNvbT47IEF1bGQsIE1hdHRoZXcNCj48bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj5TdWJqZWN0
OiBbUEFUQ0ggNC80XSBkcm0vaTkxNS9nZW06IE1pZ3JhdGUgdG8gc3lzdGVtIGF0IGRtYS1idWYg
bWFwIHRpbWUNCj4NCj5VbnRpbCB3ZSBzdXBwb3J0IHAycCBkbWEgb3IgYXMgYSBjb21wbGVtZW50
IHRvIHRoYXQsIG1pZ3JhdGUgZGF0YQ0KPnRvIHN5c3RlbSBtZW1vcnkgYXQgZG1hLWJ1ZiBtYXAg
dGltZSBpZiBwb3NzaWJsZS4NCj4NCj5TaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8
dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+LS0tDQo+IGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbV9kbWFidWYuYyB8IDkgKysrKysrKystDQo+IDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj5kaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RtYWJ1Zi5jDQo+Yi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9nZW0vaTkxNV9nZW1fZG1hYnVmLmMNCj5pbmRleCA2MTZjM2EyZjFiYWYuLmE1MmY4
ODViYzA5YSAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1f
ZG1hYnVmLmMNCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG1hYnVm
LmMNCj5AQCAtMjUsNyArMjUsMTQgQEAgc3RhdGljIHN0cnVjdCBzZ190YWJsZSAqaTkxNV9nZW1f
bWFwX2RtYV9idWYoc3RydWN0DQo+ZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2htZQ0KPiAJc3Ry
dWN0IHNjYXR0ZXJsaXN0ICpzcmMsICpkc3Q7DQo+IAlpbnQgcmV0LCBpOw0KPg0KPi0JcmV0ID0g
aTkxNV9nZW1fb2JqZWN0X3Bpbl9wYWdlc191bmxvY2tlZChvYmopOw0KPisJcmV0ID0gaTkxNV9n
ZW1fb2JqZWN0X2xvY2tfaW50ZXJydXB0aWJsZShvYmosIE5VTEwpOw0KDQpIbW0sIEkgYmVsaWV2
ZSBpbiBtb3N0IGNhc2VzIHRoYXQgdGhlIGNhbGxlciBzaG91bGQgYmUgaG9sZGluZyB0aGUNCmxv
Y2sgKG9iamVjdCBkbWEtcmVzdikgb24gdGhpcyBvYmplY3QgYWxyZWFkeS4NCg0KSSBrbm93IGZv
ciB0aGUgZHluYW1pYyB2ZXJzaW9uIG9mIGRtYS1idWYsIHRoZXJlIGlzIGEgY2hlY2sgdG8gbWFr
ZQ0Kc3VyZSB0aGF0IHRoZSBsb2NrIGlzIGhlbGQgd2hlbiBjYWxsZWQuDQoNCkkgdGhpbmsgeW91
IHdpbGwgcnVuIGludG8gc29tZSBpc3N1ZXMgaWYgeW91IHRyeSB0byBnZXQgaXQgaGVyZSBhcyB3
ZWxsLg0KDQpNaWtlDQoNCj4rCWlmIChyZXQpDQo+KwkJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4r
DQo+KwlyZXQgPSBpOTE1X2dlbV9vYmplY3RfbWlncmF0ZShvYmosIE5VTEwsIElOVEVMX1JFR0lP
Tl9TTUVNKTsNCj4rCWlmICghcmV0KQ0KPisJCXJldCA9IGk5MTVfZ2VtX29iamVjdF9waW5fcGFn
ZXMob2JqKTsNCj4rCWk5MTVfZ2VtX29iamVjdF91bmxvY2sob2JqKTsNCj4gCWlmIChyZXQpDQo+
IAkJZ290byBlcnI7DQo+DQo+LS0NCj4yLjMxLjENCg0K
