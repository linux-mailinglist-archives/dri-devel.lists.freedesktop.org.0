Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9436FFC8C4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 15:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08726EA7A;
	Thu, 14 Nov 2019 14:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C0A6EA7A;
 Thu, 14 Nov 2019 14:21:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 06:21:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="203075806"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga008.fm.intel.com with ESMTP; 14 Nov 2019 06:21:21 -0800
Received: from bgsmsx154.gar.corp.intel.com (10.224.48.47) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 14 Nov 2019 06:21:21 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.80]) by
 BGSMSX154.gar.corp.intel.com ([169.254.7.122]) with mapi id 14.03.0439.000;
 Thu, 14 Nov 2019 19:51:17 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 5/5] drm/i915: Drop redundant aspec ratio
 prop value initialization
Thread-Topic: [Intel-gfx] [PATCH 5/5] drm/i915: Drop redundant aspec ratio
 prop value initialization
Thread-Index: AQHVJ3Q7MjnS/85KrEeMf+OlMT1zUqeLnlrA
Date: Thu, 14 Nov 2019 14:21:17 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F822BAE10@BGSMSX104.gar.corp.intel.com>
References: <20190620142639.17518-1-ville.syrjala@linux.intel.com>
 <20190620142639.17518-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20190620142639.17518-6-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZGViODdmYzAtNmNjZS00NWQ0LWE1OGMtMTg1ZjFmYTFhMzUwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiV3U4UEE2Z3k3NDFxMGl6ZXBFQ2FtaTRCclBJcmFtM1Yrc3VPZWZHQmdBWnljYlM5NktTWXoxNDE0TXdpRyt4ZiJ9
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

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEludGVsLWdmeCA8aW50ZWwt
Z2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVmlsbGUgU3ly
amFsYQ0KPlNlbnQ6IFRodXJzZGF5LCBKdW5lIDIwLCAyMDE5IDc6NTcgUE0NCj5UbzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+DQo+U3ViamVjdDogW0lu
dGVsLWdmeF0gW1BBVENIIDUvNV0gZHJtL2k5MTU6IERyb3AgcmVkdW5kYW50IGFzcGVjIHJhdGlv
IHByb3AgdmFsdWUNCj5pbml0aWFsaXphdGlvbg0KPg0KPkZyb206IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+DQo+SERNSV9QSUNUVVJFX0FTUEVDVF9O
T05FIGlzIHplcm8gYW5kIHRoZSBjb25uZWN0b3Igc3RhdGUgaXMga3phbGxvYygpJ2Qgc28gbm8N
Cj5uZWVkIHRvIGluaXRpYWxpemUgY29ubl9zdGF0ZS0+cGljdHVyZV9hc3BlY3RfcmF0aW8gd2l0
aCBpdC4NCg0KTG9va3MgZ29vZCB0byBtZS4NClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1h
LnNoYW5rYXJAaW50ZWwuY29tPg0KDQo+Q2M6IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0
LmVkdT4NCj5TaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPg0KPi0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2hkbWkuYyB8IDEgLQ0KPmRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc2R2by5j
IHwgMSAtDQo+IDIgZmlsZXMgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCj4NCj5kaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMNCj5iL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jDQo+aW5kZXggNmE0NjUwYjQ0YWM2Li5m
OTVmM2RiNWVjYjggMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9oZG1pLmMNCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hk
bWkuYw0KPkBAIC0yODA5LDcgKzI4MDksNiBAQCBpbnRlbF9oZG1pX2FkZF9wcm9wZXJ0aWVzKHN0
cnVjdCBpbnRlbF9oZG1pICppbnRlbF9oZG1pLA0KPnN0cnVjdCBkcm1fY29ubmVjdG9yICpjDQo+
IAkJaW50ZWxfYXR0YWNoX2NvbG9yc3BhY2VfcHJvcGVydHkoY29ubmVjdG9yKTsNCj4NCj4gCWRy
bV9jb25uZWN0b3JfYXR0YWNoX2NvbnRlbnRfdHlwZV9wcm9wZXJ0eShjb25uZWN0b3IpOw0KPi0J
Y29ubmVjdG9yLT5zdGF0ZS0+cGljdHVyZV9hc3BlY3RfcmF0aW8gPSBIRE1JX1BJQ1RVUkVfQVNQ
RUNUX05PTkU7DQo+DQo+IAlpZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSAxMCB8fCBJU19HRU1J
TklMQUtFKGRldl9wcml2KSkNCj4gCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmY29ubmVj
dG9yLT5iYXNlLA0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX3Nkdm8uYw0KPmIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zZHZvLmMN
Cj5pbmRleCA1Y2I2MTk2MTMxNTcuLmM0NzFmY2NlNTlmOCAxMDA2NDQNCj4tLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nkdm8uYw0KPisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfc2R2by5jDQo+QEAgLTI2MjQsNyArMjYyNCw2IEBAIGludGVs
X3Nkdm9fYWRkX2hkbWlfcHJvcGVydGllcyhzdHJ1Y3QgaW50ZWxfc2R2bw0KPippbnRlbF9zZHZv
LA0KPiAJCWludGVsX2F0dGFjaF9icm9hZGNhc3RfcmdiX3Byb3BlcnR5KCZjb25uZWN0b3ItPmJh
c2UuYmFzZSk7DQo+IAl9DQo+IAlpbnRlbF9hdHRhY2hfYXNwZWN0X3JhdGlvX3Byb3BlcnR5KCZj
b25uZWN0b3ItPmJhc2UuYmFzZSk7DQo+LQljb25uZWN0b3ItPmJhc2UuYmFzZS5zdGF0ZS0+cGlj
dHVyZV9hc3BlY3RfcmF0aW8gPQ0KPkhETUlfUElDVFVSRV9BU1BFQ1RfTk9ORTsNCj4gfQ0KPg0K
PiBzdGF0aWMgc3RydWN0IGludGVsX3Nkdm9fY29ubmVjdG9yICppbnRlbF9zZHZvX2Nvbm5lY3Rv
cl9hbGxvYyh2b2lkKQ0KPi0tDQo+Mi4yMS4wDQo+DQo+X19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj5JbnRlbC1nZnggbWFpbGluZyBsaXN0DQo+SW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
