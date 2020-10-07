Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E680285E6D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 13:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB25A6E8C5;
	Wed,  7 Oct 2020 11:46:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EC66E8C4
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 11:46:48 +0000 (UTC)
IronPort-SDR: X9DqDF8vm0Yi6u481SV766Jcu6rXoUJrGIf1A485dQhywz5TbY9s/HReFOKpAWEQ81ubn7sKmr
 pAtG0Hn6AKoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9766"; a="162288416"
X-IronPort-AV: E=Sophos;i="5.77,346,1596524400"; d="scan'208";a="162288416"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2020 04:46:48 -0700
IronPort-SDR: YvTsNtfwmD4NTZq1oa+wTyiufNWqrPGNgjGNePlgqCvAT94YHBAZ024TadjOcC75G3NiOU37ur
 8Tyrj9FXG8aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,346,1596524400"; d="scan'208";a="518787836"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga005.fm.intel.com with ESMTP; 07 Oct 2020 04:46:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 7 Oct 2020 04:46:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 7 Oct 2020 04:46:47 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.1713.004;
 Wed, 7 Oct 2020 04:46:47 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ray.huang@amd.com" <ray.huang@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: RE: [PATCH 2/8] drm/ttm: move ttm_set_memory.h out of include
Thread-Topic: [PATCH 2/8] drm/ttm: move ttm_set_memory.h out of include
Thread-Index: AQHWl+X9S1sboxMX5EusD6vmOwKPeamJIHHwgAMtlwD//8ByIA==
Date: Wed, 7 Oct 2020 11:46:47 +0000
Message-ID: <df616a2ec450404b8b3a5aee02353de0@intel.com>
References: <20201001112817.20967-1-christian.koenig@amd.com>
 <20201001112817.20967-2-christian.koenig@amd.com>
 <43090043dbd54c13ab48abd81baea49e@intel.com>
 <7c9f8939-55bb-e93d-0ab8-36dbb0c211f1@gmail.com>
In-Reply-To: <7c9f8939-55bb-e93d-0ab8-36dbb0c211f1@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2tv
ZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+DQo+U2VudDogV2VkbmVzZGF5LCBPY3RvYmVy
IDcsIDIwMjAgNDozMSBBTQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGlu
dGVsLmNvbT47IGRyaS0NCj5kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IHJheS5odWFuZ0Bh
bWQuY29tOyBhaXJsaWVkQGdtYWlsLmNvbTsNCj5kYW5pZWxAZmZ3bGwuY2gNCj5TdWJqZWN0OiBS
ZTogW1BBVENIIDIvOF0gZHJtL3R0bTogbW92ZSB0dG1fc2V0X21lbW9yeS5oIG91dCBvZiBpbmNs
dWRlDQo+DQo+QW0gMDUuMTAuMjAgdW0gMTc6MDEgc2NocmllYiBSdWhsLCBNaWNoYWVsIEo6DQo+
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1k
ZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+Pj4gQ2hy
aXN0aWFuIEvDtm5pZw0KPj4+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDEsIDIwMjAgNzoyOCBB
TQ0KPj4+IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyByYXkuaHVhbmdAYW1k
LmNvbTsNCj4+PiBhaXJsaWVkQGdtYWlsLmNvbTsgZGFuaWVsQGZmd2xsLmNoDQo+Pj4gU3ViamVj
dDogW1BBVENIIDIvOF0gZHJtL3R0bTogbW92ZSB0dG1fc2V0X21lbW9yeS5oIG91dCBvZiBpbmNs
dWRlDQo+Pj4NCj4+PiBUaGlzIGlzIG5vdCBzb21ldGhpbmcgZHJpdmVycyBzaG91bGQgdXNlLg0K
Pj4gSXQncyBub3Q/DQo+DQo+VGhvc2UgYXJlIGhlbHBlciBmdW5jdGlvbnMgd2hpY2ggYXJlIHVz
ZWQgYnkgdGhlIHR3byBkaWZmZXJlbnQgcGFnZQ0KPnBvb2xzIHRvIGNoYW5nZSB0aGUgZ2xvYmFs
IG1hcHBpbmcgb2YgcGFnZXMgb24geDg2Lg0KPg0KPj4gSSBhbSBub3QgcmVhbGx5IHN1cmUgd2hh
dCB5b3UgYXJlIGRvaW5nIGhlcmUuDQo+DQo+TWFraW5nIHN1cmUgdGhhdCBubyBkcml2ZXIgdGhp
bmdzIHRoYXQgaXQgc2hvdWxkIHRvdWNoIHRoZSBDUFUgY2FjaGluZw0KPmF0dHJpYnV0ZXMgbWFu
dWFsbHkgOikNCg0KR290IGl0LiAgU28gc2hvdWxkIHlvdSBtb3ZlIHRoZSBoZWFkZXIgdG8gdGhl
IGRyaXZlcnMvZ3B1L2RybS90dG0gPw0KDQpSZXZpZXdlZC1ieTogTWljaGFlbCBKLiBSdWhsIDxt
aWNoYWVsLmoucnVobEBpbnRlbC5jb20+DQoNCk1pa2UNCg0KPkNocmlzdGlhbi4NCj4NCj4+DQo+
PiBNDQo+Pg0KPj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+DQo+Pj4gLS0tDQo+Pj4gZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
cGFnZV9hbGxvYy5jICAgICAgICAgICAgICB8IDMgKystDQo+Pj4gZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fcGFnZV9hbGxvY19kbWEuYyAgICAgICAgICB8IDMgKystDQo+Pj4ge2luY2x1ZGUgPT4g
ZHJpdmVycy9ncHV9L2RybS90dG0vdHRtX3NldF9tZW1vcnkuaCB8IDANCj4+PiAzIGZpbGVzIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+PiByZW5hbWUge2luY2x1
ZGUgPT4gZHJpdmVycy9ncHV9L2RybS90dG0vdHRtX3NldF9tZW1vcnkuaCAoMTAwJSkNCj4+Pg0K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmMNCj4+
PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2MuYw0KPj4+IGluZGV4IDE0NjYw
ZjcyM2Y3MS4uOTEyYzMwZGNjOWRiIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX3BhZ2VfYWxsb2MuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bh
Z2VfYWxsb2MuYw0KPj4+IEBAIC00Nyw3ICs0Nyw4IEBADQo+Pj4NCj4+PiAjaW5jbHVkZSA8ZHJt
L3R0bS90dG1fYm9fZHJpdmVyLmg+DQo+Pj4gI2luY2x1ZGUgPGRybS90dG0vdHRtX3BhZ2VfYWxs
b2MuaD4NCj4+PiAtI2luY2x1ZGUgPGRybS90dG0vdHRtX3NldF9tZW1vcnkuaD4NCj4+PiArDQo+
Pj4gKyNpbmNsdWRlICJ0dG1fc2V0X21lbW9yeS5oIg0KPj4+DQo+Pj4gI2RlZmluZSBOVU1fUEFH
RVNfVE9fQUxMT0MJCShQQUdFX1NJWkUvc2l6ZW9mKHN0cnVjdCBwYWdlDQo+Pj4gKikpDQo+Pj4g
I2RlZmluZSBTTUFMTF9BTExPQ0FUSU9OCQkxNg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9wYWdlX2FsbG9jX2RtYS5jDQo+Pj4gaW5kZXggNWUyZGYxMTY4NWU3Li4xMDQ1YTVjMjZl
ZTMgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvY19k
bWEuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMN
Cj4+PiBAQCAtNDksNyArNDksOCBAQA0KPj4+ICNpbmNsdWRlIDxsaW51eC9rdGhyZWFkLmg+DQo+
Pj4gI2luY2x1ZGUgPGRybS90dG0vdHRtX2JvX2RyaXZlci5oPg0KPj4+ICNpbmNsdWRlIDxkcm0v
dHRtL3R0bV9wYWdlX2FsbG9jLmg+DQo+Pj4gLSNpbmNsdWRlIDxkcm0vdHRtL3R0bV9zZXRfbWVt
b3J5Lmg+DQo+Pj4gKw0KPj4+ICsjaW5jbHVkZSAidHRtX3NldF9tZW1vcnkuaCINCj4+Pg0KPj4+
ICNkZWZpbmUgTlVNX1BBR0VTX1RPX0FMTE9DCQkoUEFHRV9TSVpFL3NpemVvZihzdHJ1Y3QgcGFn
ZQ0KPj4+ICopKQ0KPj4+ICNkZWZpbmUgU01BTExfQUxMT0NBVElPTgkJNA0KPj4+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX3NldF9tZW1vcnkuaA0KPj4+IGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fc2V0X21lbW9yeS5oDQo+Pj4gc2ltaWxhcml0eSBpbmRleCAxMDAlDQo+Pj4g
cmVuYW1lIGZyb20gaW5jbHVkZS9kcm0vdHRtL3R0bV9zZXRfbWVtb3J5LmgNCj4+PiByZW5hbWUg
dG8gZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fc2V0X21lbW9yeS5oDQo+Pj4gLS0NCj4+PiAyLjE3
LjENCj4+Pg0KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KPj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
