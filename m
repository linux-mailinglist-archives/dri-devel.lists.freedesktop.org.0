Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0483DCA2D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 18:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BDF6E135;
	Fri, 18 Oct 2019 16:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5806E135;
 Fri, 18 Oct 2019 16:02:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Oct 2019 09:02:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,312,1566889200"; d="scan'208";a="280266661"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga001.jf.intel.com with ESMTP; 18 Oct 2019 09:02:37 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 18 Oct 2019 09:02:37 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 18 Oct 2019 09:02:37 -0700
Received: from bgsmsx154.gar.corp.intel.com (10.224.48.47) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 18 Oct 2019 09:02:36 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.228]) by
 BGSMSX154.gar.corp.intel.com ([169.254.7.237]) with mapi id 14.03.0439.000;
 Fri, 18 Oct 2019 21:32:35 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 3/4] drm/edid: Fix HDMI VIC handling
Thread-Topic: [Intel-gfx] [PATCH 3/4] drm/edid: Fix HDMI VIC handling
Thread-Index: AQHVer7GjB1PV3GIUUi7EFLvz6e01adgpLTw
Date: Fri, 18 Oct 2019 16:02:34 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F822764CF@BGSMSX104.gar.corp.intel.com>
References: <20191004141914.20600-1-ville.syrjala@linux.intel.com>
 <20191004141914.20600-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20191004141914.20600-3-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDYxMjRjMDktNDE0Mi00ZDgyLWI2MzktODdhYzgxMjc2YTJlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibnA0cUlcL1RjT2xwaEZLQUpURVN6dlRvUHUyOVo4M2t3bmV3YVBVSFVtMXR4blwvODFzeEt6NFFpN1wvYVlYYmU5ayJ9
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Wayne Lin <waynelin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEludGVsLWdmeCA8aW50ZWwt
Z2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVmlsbGUgU3ly
amFsYQ0KPlNlbnQ6IEZyaWRheSwgT2N0b2JlciA0LCAyMDE5IDc6NDkgUE0NCj5UbzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnOyBXYXluZSBMaW4gPHdheW5lbGluQGFtZC5jb20+DQo+U3ViamVjdDogW0ludGVsLWdm
eF0gW1BBVENIIDMvNF0gZHJtL2VkaWQ6IEZpeCBIRE1JIFZJQyBoYW5kbGluZw0KPg0KPkZyb206
IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+DQo+RXh0
cmFjdCBkcm1fbW9kZV9oZG1pX3ZpYygpIHRvIGNvcnJlY3RseSBjYWxjdWxhdGUgdGhlIGZpbmFs
IEhETUkgVklDIGZvciB1cy4NCj5DdXJyZW50bHkgdGhpcyBpcyBiZWluZyBkb25lIGEgYml0IGRp
ZmZlcmVudGx5IGJldHdlZW4gdGhlIEFWSSBhbmQgSERNSSBpbmZvZnJhbWVzLg0KPkxldCdzIGdl
dCBib3RoIHRvIGFncmVlIG9uIHRoaXMuDQo+DQo+V2UgbmVlZCB0byBhbGxvdyB0aGUgY2FzZSB3
aGVyZSBhIG1vZGUgaXMgYm90aCAzRCBhbmQgaGFzIGEgSERNSSBWSUMuIEN1cnJlbnRseQ0KPndl
J2xsIGp1c3QgcmVmdXNlIHRvIGdlbmVyYXRlIHRoZSBIRE1JIGluZm9mcmFtZSB3aGVuIHdlIHJl
YWxseSBzaG91bGQgYmUgc2V0dGluZw0KPkhETUkgVklDIHRvIDAgYW5kIGluc3RlYWQgZW5hYmxp
bmcgM0Qgc3RlcmVvIHNpZ25hbGxpbmcuDQo+DQo+SWYgdGhlIHNpbmsgZG9lc24ndCBldmVuIHN1
cHBvcnQgdGhlIEhETUkgaW5mb2ZyYW1lIHdlIHNob3VsZCBub3QgYmUgcGlja2luZyB0aGUNCj5I
RE1JIFZJQyBpbiBmYXZvciBvZiB0aGUgQ0VBIFZJQywgYmVjYXVzZSB0aGVuIHdlJ2xsIGVuZCB1
cCBub3Qgc2VuZGluZyBlaXRoZXIgVklDIGluDQo+dGhlIGVuZC4NCg0KTG9va3MgZ29vZCB0byBt
ZS4NClJldmlld2VkLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0KDQo+
Q2M6IFdheW5lIExpbiA8d2F5bmVsaW5AYW1kLmNvbT4NCj5TaWduZWQtb2ZmLWJ5OiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPi0tLQ0KPiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2VkaWQuYyB8IDM3ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygt
KQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZWRpZC5jIGluZGV4DQo+NDk1YjdmYjRkOWVmLi5jN2Y5ZjdjYTc1YTIgMTAw
NjQ0DQo+LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMNCj4rKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2VkaWQuYw0KPkBAIC01MTYwLDExICs1MTYwLDI1IEBAIGRybV9oZG1pX2luZm9m
cmFtZV9zZXRfaGRyX21ldGFkYXRhKHN0cnVjdA0KPmhkbWlfZHJtX2luZm9mcmFtZSAqZnJhbWUs
ICB9DQo+RVhQT1JUX1NZTUJPTChkcm1faGRtaV9pbmZvZnJhbWVfc2V0X2hkcl9tZXRhZGF0YSk7
DQo+DQo+K3N0YXRpYyB1OCBkcm1fbW9kZV9oZG1pX3ZpYyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubmVjdG9yLA0KPisJCQkgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUp
IHsNCj4rCWJvb2wgaGFzX2hkbWlfaW5mb2ZyYW1lID0gY29ubmVjdG9yID8NCj4rCQljb25uZWN0
b3ItPmRpc3BsYXlfaW5mby5oYXNfaGRtaV9pbmZvZnJhbWUgOiBmYWxzZTsNCj4rDQo+KwlpZiAo
IWhhc19oZG1pX2luZm9mcmFtZSkNCj4rCQlyZXR1cm4gMDsNCj4rDQo+KwkvKiBObyBIRE1JIFZJ
QyB3aGVuIHNpZ25hbGxpbmcgM0QgdmlkZW8gZm9ybWF0ICovDQo+KwlpZiAobW9kZS0+ZmxhZ3Mg
JiBEUk1fTU9ERV9GTEFHXzNEX01BU0spDQo+KwkJcmV0dXJuIDA7DQo+Kw0KPisJcmV0dXJuIGRy
bV9tYXRjaF9oZG1pX21vZGUobW9kZSk7DQo+K30NCj4rDQo+IHN0YXRpYyB1OCBkcm1fbW9kZV9j
ZWFfdmljKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsDQo+IAkJCSAgIGNvbnN0IHN0
cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKSAgew0KPi0JdTggdmVuZG9yX2lmX3ZpYyA9IGRy
bV9tYXRjaF9oZG1pX21vZGUobW9kZSk7DQo+LQlib29sIGlzX3MzZCA9IG1vZGUtPmZsYWdzICYg
RFJNX01PREVfRkxBR18zRF9NQVNLOw0KPiAJdTggdmljOw0KPg0KPiAJLyoNCj5AQCAtNTE3Myw3
ICs1MTg3LDcgQEAgc3RhdGljIHU4IGRybV9tb2RlX2NlYV92aWMoc3RydWN0IGRybV9jb25uZWN0
b3INCj4qY29ubmVjdG9yLA0KPiAJICogVklDIGluIEFWSSBpbmZvZnJhbWVzLiBMZXRzIGNoZWNr
IGlmIHRoaXMgbW9kZSBpcyBwcmVzZW50IGluDQo+IAkgKiBIRE1JIDEuNGIgNEsgbW9kZXMNCj4g
CSAqLw0KPi0JaWYgKGRybV92YWxpZF9oZG1pX3ZpYyh2ZW5kb3JfaWZfdmljKSAmJiAhaXNfczNk
KQ0KPisJaWYgKGRybV9tb2RlX2hkbWlfdmljKGNvbm5lY3RvciwgbW9kZSkpDQo+IAkJcmV0dXJu
IDA7DQo+DQo+IAl2aWMgPSBkcm1fbWF0Y2hfY2VhX21vZGUobW9kZSk7DQo+QEAgLTU0MzMsOCAr
NTQ0Nyw2IEBAIGRybV9oZG1pX3ZlbmRvcl9pbmZvZnJhbWVfZnJvbV9kaXNwbGF5X21vZGUoc3Ry
dWN0DQo+aGRtaV92ZW5kb3JfaW5mb2ZyYW1lICpmcmFtZSwNCj4gCWJvb2wgaGFzX2hkbWlfaW5m
b2ZyYW1lID0gY29ubmVjdG9yID8NCj4gCQljb25uZWN0b3ItPmRpc3BsYXlfaW5mby5oYXNfaGRt
aV9pbmZvZnJhbWUgOiBmYWxzZTsNCj4gCWludCBlcnI7DQo+LQl1MzIgczNkX2ZsYWdzOw0KPi0J
dTggdmljOw0KPg0KPiAJaWYgKCFmcmFtZSB8fCAhbW9kZSkNCj4gCQlyZXR1cm4gLUVJTlZBTDsN
Cj5AQCAtNTQ0Miw4ICs1NDU0LDkgQEAgZHJtX2hkbWlfdmVuZG9yX2luZm9mcmFtZV9mcm9tX2Rp
c3BsYXlfbW9kZShzdHJ1Y3QNCj5oZG1pX3ZlbmRvcl9pbmZvZnJhbWUgKmZyYW1lLA0KPiAJaWYg
KCFoYXNfaGRtaV9pbmZvZnJhbWUpDQo+IAkJcmV0dXJuIC1FSU5WQUw7DQo+DQo+LQl2aWMgPSBk
cm1fbWF0Y2hfaGRtaV9tb2RlKG1vZGUpOw0KPi0JczNkX2ZsYWdzID0gbW9kZS0+ZmxhZ3MgJiBE
Uk1fTU9ERV9GTEFHXzNEX01BU0s7DQo+KwllcnIgPSBoZG1pX3ZlbmRvcl9pbmZvZnJhbWVfaW5p
dChmcmFtZSk7DQo+KwlpZiAoZXJyIDwgMCkNCj4rCQlyZXR1cm4gZXJyOw0KPg0KPiAJLyoNCj4g
CSAqIEV2ZW4gaWYgaXQncyBub3QgYWJzb2x1dGVseSBuZWNlc3NhcnkgdG8gc2VuZCB0aGUgaW5m
b2ZyYW1lIEBAIC01NDU0LDE1DQo+KzU0NjcsNyBAQCBkcm1faGRtaV92ZW5kb3JfaW5mb2ZyYW1l
X2Zyb21fZGlzcGxheV9tb2RlKHN0cnVjdA0KPmhkbWlfdmVuZG9yX2luZm9mcmFtZSAqZnJhbWUs
DQo+IAkgKiBtb2RlIGlmIHRoZSBzb3VyY2Ugc2ltcGx5IHN0b3BzIHNlbmRpbmcgdGhlIGluZm9m
cmFtZSB3aGVuDQo+IAkgKiBpdCB3YW50cyB0byBzd2l0Y2ggZnJvbSAzRCB0byAyRC4NCj4gCSAq
Lw0KPi0NCj4tCWlmICh2aWMgJiYgczNkX2ZsYWdzKQ0KPi0JCXJldHVybiAtRUlOVkFMOw0KPi0N
Cj4tCWVyciA9IGhkbWlfdmVuZG9yX2luZm9mcmFtZV9pbml0KGZyYW1lKTsNCj4tCWlmIChlcnIg
PCAwKQ0KPi0JCXJldHVybiBlcnI7DQo+LQ0KPi0JZnJhbWUtPnZpYyA9IHZpYzsNCj4rCWZyYW1l
LT52aWMgPSBkcm1fbW9kZV9oZG1pX3ZpYyhjb25uZWN0b3IsIG1vZGUpOw0KPiAJZnJhbWUtPnMz
ZF9zdHJ1Y3QgPSBzM2Rfc3RydWN0dXJlX2Zyb21fZGlzcGxheV9tb2RlKG1vZGUpOw0KPg0KPiAJ
cmV0dXJuIDA7DQo+LS0NCj4yLjIxLjANCj4NCj5fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPkludGVsLWdmeCBtYWlsaW5nIGxpc3QNCj5JbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pbnRlbC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
