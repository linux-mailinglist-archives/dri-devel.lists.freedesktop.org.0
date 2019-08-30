Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FF6A320A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE9189143;
	Fri, 30 Aug 2019 08:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F95389143;
 Fri, 30 Aug 2019 08:21:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Aug 2019 01:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,446,1559545200"; d="scan'208";a="210841524"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga002.fm.intel.com with ESMTP; 30 Aug 2019 01:21:25 -0700
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 30 Aug 2019 01:21:25 -0700
Received: from bgsmsx153.gar.corp.intel.com (10.224.23.4) by
 fmsmsx110.amr.corp.intel.com (10.18.116.10) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 30 Aug 2019 01:21:25 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.178]) by
 BGSMSX153.gar.corp.intel.com ([169.254.2.178]) with mapi id 14.03.0439.000;
 Fri, 30 Aug 2019 13:51:21 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "C, Ramalingam" <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v12 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Thread-Topic: [PATCH v12 0/6] drm/i915: Enable HDCP 1.4 and 2.2 on Gen12+
Thread-Index: AQHVXb+tVuGrR22RKEGL7/0YyJPHU6cTW+aw
Date: Fri, 30 Aug 2019 08:21:20 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F821D52FA@BGSMSX104.gar.corp.intel.com>
References: <20190828164216.405-1-ramalingam.c@intel.com>
In-Reply-To: <20190828164216.405-1-ramalingam.c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiY2YzNDZhM2ItODRkNC00ODQzLTkxZDItZmRjMmVkZDhiODFiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSDhZV0V3Ujk4K0FIdnZcL2N5UDN1Zyt3Mmdld3ZrK21KSXljaUVHcEI4VkVvNWRNVlJERTVzV0djd1RDd2NBQk0ifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Winkler,
 Tomas" <tomas.winkler@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IGRyaS1kZXZlbCA8ZHJpLWRl
dmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgUmFtYWxpbmdh
bQ0KPkMNCj5TZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAyOCwgMjAxOSAxMDoxMiBQTQ0KPlRvOiBp
bnRlbC1nZnggPGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBkcmktZGV2ZWwgPGRy
aS0NCj5kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+DQo+Q2M6IE5pa3VsYSwgSmFuaSA8amFu
aS5uaWt1bGFAaW50ZWwuY29tPjsgV2lua2xlciwgVG9tYXMgPHRvbWFzLndpbmtsZXJAaW50ZWwu
Y29tPg0KPlN1YmplY3Q6IFtQQVRDSCB2MTIgMC82XSBkcm0vaTkxNTogRW5hYmxlIEhEQ1AgMS40
IGFuZCAyLjIgb24gR2VuMTIrDQo+DQo+RW5hYmxpbmcgdGhlIEhEQ1AxLjQgYW5kIDIuMiBvbiBU
R0wgYnkgc3VwcG9ydGluZyB0aGUgSFcgYmxvY2sgbW92ZW1lbnQgZnJvbQ0KPkRESSBpbnRvIHRy
YW5zY29kZXIuDQo+DQo+djEyOg0KPiAgci1iIGFuZCBhY2sgYXJlIGNvbGxlY3RlZC4NCj4gIGZl
dyByZXZpZXcgY29tbWVudHMgYXJlIGFkZHJlc3NlZC4NCg0KV2l0aCB0aGUgQWNrcyBmcm9tIFRv
bWFzIGFuZCBKYW5pIE4sIGFuZCBSQiBmcm9tIFNoYXNoYW5rLg0KUHVzaGVkIHRoZSBzZXJpZXMg
dG8gZGlucS4gVGhhbmtzIGZvciB0aGUgcGF0Y2hlcyBhbmQgdGhlIHJldmlld3MuDQoNClJlZ2Fy
ZHMsDQpVbWEgU2hhbmthcg0KDQo+UmFtYWxpbmdhbSBDICg2KToNCj4gIGRybS9pOTE1OiBtZWlf
aGRjcDogSTkxNSBzZW5kcyBkZGkgaW5kZXggYXMgcGVyIE1FIEZXDQo+ICBkcm06IE1vdmUgcG9y
dCBkZWZpbml0aW9uIGJhY2sgdG8gaTkxNSBoZWFkZXINCj4gIGRybTogRXh0ZW5kIEk5MTUgbWVp
IGludGVyZmFjZSBmb3IgdHJhbnNjb2RlciBpbmZvDQo+ICBtaXNjL21laS9oZGNwOiBGaWxsIHRy
YW5zY29kZXIgaW5kZXggaW4gcG9ydCBpbmZvDQo+ICBkcm0vaTkxNS9oZGNwOiB1cGRhdGUgY3Vy
cmVudCB0cmFuc2NvZGVyIGludG8gaW50ZWxfaGRjcA0KPiAgZHJtL2k5MTUvaGRjcDogRW5hYmxl
IEhEQ1AgMS40IGFuZCAyLjIgb24gR2VuMTIrDQo+DQo+IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfYmlvcy5oICAgICB8ICAgMyArLQ0KPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2Rpc3BsYXkuaCAgfCAgMjAgKy0NCj4gLi4uL2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheV90eXBlcy5oICAgIHwgICA3ICsNCj4gZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcC5jICAgICAgIHwgICAzICsNCj4gZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9kcC5oICAgICAgIHwgICAxICsNCj4gZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9oZGNwLmMgICAgIHwgMjE0ICsrKysrKysrKysrKystLS0tLQ0KPiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkY3AuaCAgICAgfCAgIDQgKw0KPiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyAgICAgfCAgMTMgKy0NCj4gZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmggICAgIHwgICAxICsNCj4gZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9ob3RwbHVnLmggIHwgICAxICsNCj4gZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zZHZvLmggICAgIHwgICAxICsNCj4gZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCAgICAgICAgICAgICAgIHwgMTI0ICsrKysrKysr
Ky0NCj4gZHJpdmVycy9taXNjL21laS9oZGNwL21laV9oZGNwLmMgICAgICAgICAgICAgIHwgIDQ1
ICsrLS0NCj4gZHJpdmVycy9taXNjL21laS9oZGNwL21laV9oZGNwLmggICAgICAgICAgICAgIHwg
IDE3ICstDQo+IGluY2x1ZGUvZHJtL2k5MTVfZHJtLmggICAgICAgICAgICAgICAgICAgICAgICB8
ICAxOCAtLQ0KPiBpbmNsdWRlL2RybS9pOTE1X21laV9oZGNwX2ludGVyZmFjZS5oICAgICAgICAg
fCAgNDIgKysrLQ0KPiAxNiBmaWxlcyBjaGFuZ2VkLCAzODkgaW5zZXJ0aW9ucygrKSwgMTI1IGRl
bGV0aW9ucygtKQ0KPg0KPi0tDQo+Mi4yMC4xDQo+DQo+X19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj5kcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+ZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
