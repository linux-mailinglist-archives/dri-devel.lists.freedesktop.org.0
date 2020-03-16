Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C56186461
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 06:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF5C6E342;
	Mon, 16 Mar 2020 05:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774F36E33F;
 Mon, 16 Mar 2020 05:19:50 +0000 (UTC)
IronPort-SDR: jRJqP6l1EH3h+lPV9M+9Ypm9ShOlSJi7M2tO5JcECnCTExStG/WxoamRnC3/JWbvxtKIBjLqz9
 t3M5rHmOM9Ag==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2020 22:19:48 -0700
IronPort-SDR: q1n9tkYcwl3dmRfpzLEnrtrM/w7ZxZ8hKMCPQzSviIu4RrpaasASWnQw1BU54xpolds4cIrbAg
 fR/C2EnQrcUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,559,1574150400"; d="scan'208";a="445005293"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga006.fm.intel.com with ESMTP; 15 Mar 2020 22:19:50 -0700
Received: from fmsmsx121.amr.corp.intel.com (10.18.125.36) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 15 Mar 2020 22:19:49 -0700
Received: from bgsmsx103.gar.corp.intel.com (10.223.4.130) by
 fmsmsx121.amr.corp.intel.com (10.18.125.36) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 15 Mar 2020 22:19:49 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.111]) by
 BGSMSX103.gar.corp.intel.com ([169.254.4.56]) with mapi id 14.03.0439.000;
 Mon, 16 Mar 2020 10:49:48 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v6 14/18] drm/i915: Fix enabled infoframe
 states of lspcon
Thread-Topic: [Intel-gfx] [PATCH v6 14/18] drm/i915: Fix enabled infoframe
 states of lspcon
Thread-Index: AQHV4DUeq0uMjAGbiUimutqVHkTcQahK5HVw
Date: Mon, 16 Mar 2020 05:19:47 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F82432511@BGSMSX104.gar.corp.intel.com>
References: <20200210171021.109684-1-gwan-gyeong.mun@intel.com>
 <20200210171021.109684-15-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200210171021.109684-15-gwan-gyeong.mun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBHd2FuLQ0K
PiBneWVvbmcgTXVuDQo+IFNlbnQ6IE1vbmRheSwgRmVicnVhcnkgMTAsIDIwMjAgMTA6NDAgUE0N
Cj4gVG86IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGxpbnV4LWZiZGV2
QHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJq
ZWN0OiBbSW50ZWwtZ2Z4XSBbUEFUQ0ggdjYgMTQvMThdIGRybS9pOTE1OiBGaXggZW5hYmxlZCBp
bmZvZnJhbWUgc3RhdGVzIG9mDQo+IGxzcGNvbg0KPiANCj4gQ29tcGFyZWQgdG8gaW1wbGVtZW50
YXRpb24gb2YgRFAgYW5kIEhETUkncyBlbmNvZGVyLT5pbmZvZnJhbWVzX2VuYWJsZWQsIHRoZQ0K
PiBsc3Bjb24ncyBpbXBsZW1lbnRhdGlvbiByZXR1cm5zIGl0cyBhY3RpdmUgc3RhdGUuICh3ZSBl
eHBlY3QgZW5hYmxlZCBpbmZvZnJhbWUNCj4gc3RhdGVzIG9mIEhXLikgSXQgbGVhZHMgdG8gcGlw
ZSBzdGF0ZSBtaXNtYXRjaCBlcnJvciB3aGVuIGRkaV9nZXRfY29uZmlnIGlzIGNhbGxlZC4NCj4g
DQo+IEJlY2F1c2UgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgbHNwY29uIGlzIG5vdCBy
ZWFkeSB0byBzdXBwb3J0IHJlYWRvdXQNCj4gaW5mb2ZyYW1lcywgd2UgbmVlZCB0byByZXR1cm4g
MCBoZXJlLg0KPiANCj4gSW4gb3JkZXIgdG8gc3VwcG9ydCByZWFkb3V0IHRvIGxzcGNvbiwgd2Ug
bmVlZCB0byBpbXBsZW1lbnQgcmVhZF9pbmZvZnJhbWUgYW5kDQo+IGluZm9mcmFtZXNfZW5hYmxl
ZC4gQW5kIHNldF9pbmZvZnJhbWVzIGFsc28gaGF2ZSB0byBzZXQgYW4gYXBwcm9wcmlhdGUgYml0
IG9uDQo+IGNydGNfc3RhdGUtPmluZm9mcmFtZXMuZW5hYmxlDQoNCkxvb2tzIGdvb2QgdG8gbWUu
DQpSZXZpZXdlZC1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCg0KPiBD
YzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHNwY29uLmMgfCAy
ICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2xzcGNv
bi5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sc3Bjb24uYw0KPiBp
bmRleCBkODA3YzU2NDhjODcuLjZmZjdiMjI2ZjBhMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sc3Bjb24uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2xzcGNvbi5jDQo+IEBAIC01MjIsNyArNTIyLDcgQEAgdTMy
IGxzcGNvbl9pbmZvZnJhbWVzX2VuYWJsZWQoc3RydWN0IGludGVsX2VuY29kZXINCj4gKmVuY29k
ZXIsDQo+ICAJCQkgICAgICBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqcGlwZV9jb25m
aWcpICB7DQo+ICAJLyogRklYTUUgYWN0dWFsbHkgcmVhZCB0aGlzIGZyb20gdGhlIGh3ICovDQo+
IC0JcmV0dXJuIGVuY190b19pbnRlbF9sc3Bjb24oZW5jb2RlciktPmFjdGl2ZTsNCj4gKwlyZXR1
cm4gMDsNCj4gIH0NCj4gDQo+ICB2b2lkIGxzcGNvbl9yZXN1bWUoc3RydWN0IGludGVsX2xzcGNv
biAqbHNwY29uKQ0KPiAtLQ0KPiAyLjI1LjANCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQo+IEludGVsLWdmeCBtYWlsaW5nIGxpc3QNCj4gSW50
ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
