Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F08FC8B8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 15:19:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810796EA79;
	Thu, 14 Nov 2019 14:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E7A6EA03;
 Thu, 14 Nov 2019 14:19:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 06:19:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="235683474"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga002.fm.intel.com with ESMTP; 14 Nov 2019 06:19:31 -0800
Received: from bgsmsx106.gar.corp.intel.com (10.223.43.196) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 14 Nov 2019 06:19:30 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.80]) by
 BGSMSX106.gar.corp.intel.com ([169.254.1.134]) with mapi id 14.03.0439.000;
 Thu, 14 Nov 2019 19:49:28 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 4/5] drm/i915: Do not override mode's aspect ratio with
 the prop value NONE
Thread-Topic: [PATCH 4/5] drm/i915: Do not override mode's aspect ratio with
 the prop value NONE
Thread-Index: AQHVJ3Q+aFVpTE0VfU+2j87Mj8VQX6eLnURQ
Date: Thu, 14 Nov 2019 14:19:28 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F822BADE4@BGSMSX104.gar.corp.intel.com>
References: <20190620142639.17518-1-ville.syrjala@linux.intel.com>
 <20190620142639.17518-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20190620142639.17518-5-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzUxNDZiMGEtYzU5Ny00MWE5LTg2ZGItYjVkODNiYmI0MTc1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZ3RweUIzYTFjWW5SK1lGZHI4XC8yS2h0bGkrSFBGWG1JZHM2RTkyNEorb2dBNEc0T1VDZUpVUk4rUDZjRURYZngifQ==
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IGRyaS1kZXZlbCA8ZHJpLWRl
dmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVmlsbGUgU3ly
amFsYQ0KPlNlbnQ6IFRodXJzZGF5LCBKdW5lIDIwLCAyMDE5IDc6NTcgUE0NCj5UbzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+U3ViamVjdDogW1BBVENIIDQvNV0gZHJtL2k5MTU6IERvIG5vdCBvdmVycmlkZSBt
b2RlJ3MgYXNwZWN0IHJhdGlvIHdpdGggdGhlIHByb3ANCj52YWx1ZSBOT05FDQo+DQo+RnJvbTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4NCj5IRE1J
X1BJQ1RVUkVfQVNQRUNUX05PTkUgbWVhbnMgIkF1dG9tYXRpYyIgc28gd2hlbiB0aGUgdXNlciBo
YXMgdGhhdA0KPnNlbGVjdGVkIHdlIHNob3VsZCBrZWVwIHdoYXRldmVyIGFzcGVjdCByYXRpbyB0
aGUgbW9kZSBhbHJlYWR5IGhhcy4NCj4NCj5BbHNvIG5vIHBvaW50IGluIGNoZWNraW5nIGZvciBj
b25uZWN0b3ItPmlzX2hkbWkgaW4gdGhlIFNEVk8gY29kZSBzaW5jZSB3ZSBvbmx5DQo+YXR0YWNo
IHRoZSBwcm9wZXJ0eSB0byBIRE1JIGNvbm5lY3RvcnMuDQoNCkxvb2tzIGdvb2QgdG8gbWUuDQpS
ZXZpZXdlZC1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCg0KPkNjOiBJ
bGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+DQo+U2lnbmVkLW9mZi1ieTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4tLS0NCj4gZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgfCA1ICsrKy0tDQo+ZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zZHZvLmMgfCA2ICsrKy0tLQ0KPiAyIGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4NCj5kaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMNCj5iL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jDQo+aW5kZXggMGViZWM2OWJiYmZjLi42YTQ2
NTBiNDRhYzYgMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9oZG1pLmMNCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWku
Yw0KPkBAIC0yMzk0LDggKzIzOTQsOSBAQCBpbnQgaW50ZWxfaGRtaV9jb21wdXRlX2NvbmZpZyhz
dHJ1Y3QgaW50ZWxfZW5jb2Rlcg0KPiplbmNvZGVyLA0KPiAJCXJldHVybiAtRUlOVkFMOw0KPiAJ
fQ0KPg0KPi0JLyogU2V0IHVzZXIgc2VsZWN0ZWQgUEFSIHRvIGluY29taW5nIG1vZGUncyBtZW1i
ZXIgKi8NCj4tCWFkanVzdGVkX21vZGUtPnBpY3R1cmVfYXNwZWN0X3JhdGlvID0gY29ubl9zdGF0
ZS0+cGljdHVyZV9hc3BlY3RfcmF0aW87DQo+KwlpZiAoY29ubl9zdGF0ZS0+cGljdHVyZV9hc3Bl
Y3RfcmF0aW8pDQo+KwkJYWRqdXN0ZWRfbW9kZS0+cGljdHVyZV9hc3BlY3RfcmF0aW8gPQ0KPisJ
CQljb25uX3N0YXRlLT5waWN0dXJlX2FzcGVjdF9yYXRpbzsNCj4NCj4gCXBpcGVfY29uZmlnLT5s
YW5lX2NvdW50ID0gNDsNCj4NCj5kaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9zZHZvLmMNCj5iL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
c2R2by5jDQo+aW5kZXggY2VkYTAzZTVhM2Q0Li41Y2I2MTk2MTMxNTcgMTAwNjQ0DQo+LS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zZHZvLmMNCj4rKysgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nkdm8uYw0KPkBAIC0xMzIxLDkgKzEzMjEsOSBA
QCBzdGF0aWMgaW50IGludGVsX3Nkdm9fY29tcHV0ZV9jb25maWcoc3RydWN0IGludGVsX2VuY29k
ZXINCj4qZW5jb2RlciwNCj4gCWlmIChJU19UVihpbnRlbF9zZHZvX2Nvbm5lY3RvcikpDQo+IAkJ
aTl4eF9hZGp1c3Rfc2R2b190dl9jbG9jayhwaXBlX2NvbmZpZyk7DQo+DQo+LQkvKiBTZXQgdXNl
ciBzZWxlY3RlZCBQQVIgdG8gaW5jb21pbmcgbW9kZSdzIG1lbWJlciAqLw0KPi0JaWYgKGludGVs
X3Nkdm9fY29ubmVjdG9yLT5pc19oZG1pKQ0KPi0JCWFkanVzdGVkX21vZGUtPnBpY3R1cmVfYXNw
ZWN0X3JhdGlvID0gY29ubl9zdGF0ZS0NCj4+cGljdHVyZV9hc3BlY3RfcmF0aW87DQo+KwlpZiAo
Y29ubl9zdGF0ZS0+cGljdHVyZV9hc3BlY3RfcmF0aW8pDQo+KwkJYWRqdXN0ZWRfbW9kZS0+cGlj
dHVyZV9hc3BlY3RfcmF0aW8gPQ0KPisJCQljb25uX3N0YXRlLT5waWN0dXJlX2FzcGVjdF9yYXRp
bzsNCj4NCj4gCWlmICghaW50ZWxfc2R2b19jb21wdXRlX2F2aV9pbmZvZnJhbWUoaW50ZWxfc2R2
bywNCj4gCQkJCQkgICAgICBwaXBlX2NvbmZpZywgY29ubl9zdGF0ZSkpIHsNCj4tLQ0KPjIuMjEu
MA0KPg0KPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
ZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KPmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj5odHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
