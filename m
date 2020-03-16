Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0FC186464
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 06:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D9F6E343;
	Mon, 16 Mar 2020 05:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60566E343;
 Mon, 16 Mar 2020 05:22:17 +0000 (UTC)
IronPort-SDR: x9J+tAxuvwiN3P90vdMVL1eZIaCeaDpehabYK6GMbMZ5Oy2heoXJ06jYU5/QMLO7u7mQZEVr4L
 xPTzkO1at9Qg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2020 22:22:17 -0700
IronPort-SDR: tEyrsaNx0F2E7ZbO2boV22KxjU+CaFMwE8GCl4TBGX36hIE9nNPZvVvo/vdrSAbJ88SfLCP4us
 uaUuZJhlh34A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,559,1574150400"; d="scan'208";a="235925500"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga007.fm.intel.com with ESMTP; 15 Mar 2020 22:22:16 -0700
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 15 Mar 2020 22:22:16 -0700
Received: from BGSMSX108.gar.corp.intel.com (10.223.4.192) by
 FMSMSX154.amr.corp.intel.com (10.18.116.70) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 15 Mar 2020 22:22:16 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.111]) by
 BGSMSX108.gar.corp.intel.com ([169.254.8.19]) with mapi id 14.03.0439.000;
 Mon, 16 Mar 2020 10:52:14 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v7 14/18] drm/i915: Fix enabled infoframe states of lspcon
Thread-Topic: [PATCH v7 14/18] drm/i915: Fix enabled infoframe states of lspcon
Thread-Index: AQHV4K+SNQgKwy4q80yYmCHsG0sbn6hK5DCA
Date: Mon, 16 Mar 2020 05:22:13 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F82432537@BGSMSX104.gar.corp.intel.com>
References: <20200211074657.231405-1-gwan-gyeong.mun@intel.com>
 <20200211074657.231405-15-gwan-gyeong.mun@intel.com>
In-Reply-To: <20200211074657.231405-15-gwan-gyeong.mun@intel.com>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBHd2FuLQ0K
PiBneWVvbmcgTXVuDQo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDExLCAyMDIwIDE6MTcgUE0N
Cj4gVG86IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGxpbnV4LWZiZGV2
QHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJq
ZWN0OiBbUEFUQ0ggdjcgMTQvMThdIGRybS9pOTE1OiBGaXggZW5hYmxlZCBpbmZvZnJhbWUgc3Rh
dGVzIG9mIGxzcGNvbg0KPiANCj4gQ29tcGFyZWQgdG8gaW1wbGVtZW50YXRpb24gb2YgRFAgYW5k
IEhETUkncyBlbmNvZGVyLT5pbmZvZnJhbWVzX2VuYWJsZWQsIHRoZQ0KPiBsc3Bjb24ncyBpbXBs
ZW1lbnRhdGlvbiByZXR1cm5zIGl0cyBhY3RpdmUgc3RhdGUuICh3ZSBleHBlY3QgZW5hYmxlZCBp
bmZvZnJhbWUNCj4gc3RhdGVzIG9mIEhXLikgSXQgbGVhZHMgdG8gcGlwZSBzdGF0ZSBtaXNtYXRj
aCBlcnJvciB3aGVuIGRkaV9nZXRfY29uZmlnIGlzIGNhbGxlZC4NCj4gDQo+IEJlY2F1c2UgdGhl
IGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgbHNwY29uIGlzIG5vdCByZWFkeSB0byBzdXBwb3J0
IHJlYWRvdXQNCj4gaW5mb2ZyYW1lcywgd2UgbmVlZCB0byByZXR1cm4gMCBoZXJlLg0KPiANCj4g
SW4gb3JkZXIgdG8gc3VwcG9ydCByZWFkb3V0IHRvIGxzcGNvbiwgd2UgbmVlZCB0byBpbXBsZW1l
bnQgcmVhZF9pbmZvZnJhbWUgYW5kDQo+IGluZm9mcmFtZXNfZW5hYmxlZC4gQW5kIHNldF9pbmZv
ZnJhbWVzIGFsc28gaGF2ZSB0byBzZXQgYW4gYXBwcm9wcmlhdGUgYml0IG9uDQo+IGNydGNfc3Rh
dGUtPmluZm9mcmFtZXMuZW5hYmxlDQoNCkxvb2tzIGdvb2QuDQpSZXZpZXdlZC1ieTogVW1hIFNo
YW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCg0KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogR3dhbi1neWVv
bmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHNwY29uLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2xzcGNvbi5jDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9sc3Bjb24uYw0KPiBpbmRleCBkODA3YzU2NDhjODcuLjZm
ZjdiMjI2ZjBhMSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9sc3Bjb24uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2xzcGNvbi5jDQo+IEBAIC01MjIsNyArNTIyLDcgQEAgdTMyIGxzcGNvbl9pbmZvZnJhbWVzX2Vu
YWJsZWQoc3RydWN0IGludGVsX2VuY29kZXINCj4gKmVuY29kZXIsDQo+ICAJCQkgICAgICBjb25z
dCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqcGlwZV9jb25maWcpICB7DQo+ICAJLyogRklYTUUg
YWN0dWFsbHkgcmVhZCB0aGlzIGZyb20gdGhlIGh3ICovDQo+IC0JcmV0dXJuIGVuY190b19pbnRl
bF9sc3Bjb24oZW5jb2RlciktPmFjdGl2ZTsNCj4gKwlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+ICB2
b2lkIGxzcGNvbl9yZXN1bWUoc3RydWN0IGludGVsX2xzcGNvbiAqbHNwY29uKQ0KPiAtLQ0KPiAy
LjI1LjANCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
