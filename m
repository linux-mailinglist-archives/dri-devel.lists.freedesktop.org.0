Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5606CE2B87
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 09:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599406E11F;
	Thu, 24 Oct 2019 07:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912196E11F;
 Thu, 24 Oct 2019 07:56:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 00:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; d="scan'208";a="202227395"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 24 Oct 2019 00:56:33 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 24 Oct 2019 00:56:33 -0700
Received: from bgsmsx105.gar.corp.intel.com (10.223.43.197) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 24 Oct 2019 00:56:33 -0700
Received: from BGSMSX108.gar.corp.intel.com ([169.254.8.18]) by
 BGSMSX105.gar.corp.intel.com ([169.254.3.227]) with mapi id 14.03.0439.000;
 Thu, 24 Oct 2019 13:26:29 +0530
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/5] drm/dsi: clean up DSI data type definitions
Thread-Topic: [PATCH 1/5] drm/dsi: clean up DSI data type definitions
Thread-Index: AQHViMDfY76r98SAFEmCUUJ/gkP70KdpbiJw
Date: Thu, 24 Oct 2019 07:56:29 +0000
Message-ID: <57510F3E2013164E925CD03ED7512A3B80987BFD@BGSMSX108.gar.corp.intel.com>
References: <cover.1571738674.git.jani.nikula@intel.com>
 <38b424fbba95e8b518efc754e56afdf4ac694124.1571738674.git.jani.nikula@intel.com>
In-Reply-To: <38b424fbba95e8b518efc754e56afdf4ac694124.1571738674.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzg4MTc2MmMtZWI4YS00MDMxLWFkMDMtMzQ5ZGM1OGIwZDgzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJjdTJrWk9CTytZNU5UeWFUdUZPSGZyZllPWVdtUzBEcTJsMlhUZkxLXC9YeDBENGlmVzVMWXZwblNPeFVDVTFDTyJ9
x-ctpclassification: CTP_NT
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9va3MgZ29vZCB0byBtZS4KUmV2aWV3ZWQtYnk6IFZhbmRpdGEgS3Vsa2FybmkgPHZhbmRpdGEu
a3Vsa2FybmlAaW50ZWwuY29tPgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206
IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4gU2VudDogVHVlc2RheSwgT2N0
b2JlciAyMiwgMjAxOSAzOjQwIFBNCj4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTmlrdWxhLCBKYW5pIDxq
YW5pLm5pa3VsYUBpbnRlbC5jb20+Owo+IEt1bGthcm5pLCBWYW5kaXRhIDx2YW5kaXRhLmt1bGth
cm5pQGludGVsLmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggMS81XSBkcm0vZHNpOiBjbGVhbiB1cCBE
U0kgZGF0YSB0eXBlIGRlZmluaXRpb25zCj4gCj4gUmVuYW1lIHBpY3R1cmUgcGFyYW1ldGVyIHNl
dCAoaXQncyBhIGxvbmcgcGFja2V0LCBub3QgYSBsb25nIHdyaXRlKSBhbmQKPiBjb21wcmVzc2lv
biBtb2RlIChpdCdzIG5vdCBhIERDUyBjb21tYW5kKSBlbnVtZXJhdGlvbnMgYWNjb3JkaW5nIHRv
IHRoZQo+IERTSSBzcGVjaWZpY2F0aW9uLiBPcmRlciB0aGUgdHlwZXMgYWNjb3JkaW5nIHRvIHRo
ZSBzcGVjLiBVc2UgdGFicyBpbnN0ZWFkIG9mCj4gc3BhY2VzIGZvciBpbmRlbnRhdGlvbi4gVXNl
IGFsbCBsb3dlciBjYXNlIGZvciBoZXguCj4gCj4gQ2M6IFZhbmRpdGEgS3Vsa2FybmkgPHZhbmRp
dGEua3Vsa2FybmlAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5p
Lm5pa3VsYUBpbnRlbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kc2ku
YyB8ICA0ICsrLS0KPiAgaW5jbHVkZS92aWRlby9taXBpX2Rpc3BsYXkuaCAgIHwgMTAgKysrKyst
LS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RzaS5jCj4gYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX21pcGlfZHNpLmMgaW5kZXggYmQyNDk4YmJkNzRhLi5mMjM3ZDgwODI4
YzMKPiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZHNpLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZHNpLmMKPiBAQCAtMzczLDYgKzM3Myw3IEBAIGJv
b2wgbWlwaV9kc2lfcGFja2V0X2Zvcm1hdF9pc19zaG9ydCh1OCB0eXBlKQo+ICAJY2FzZSBNSVBJ
X0RTSV9WX1NZTkNfRU5EOgo+ICAJY2FzZSBNSVBJX0RTSV9IX1NZTkNfU1RBUlQ6Cj4gIAljYXNl
IE1JUElfRFNJX0hfU1lOQ19FTkQ6Cj4gKwljYXNlIE1JUElfRFNJX0NPTVBSRVNTSU9OX01PREU6
Cj4gIAljYXNlIE1JUElfRFNJX0VORF9PRl9UUkFOU01JU1NJT046Cj4gIAljYXNlIE1JUElfRFNJ
X0NPTE9SX01PREVfT0ZGOgo+ICAJY2FzZSBNSVBJX0RTSV9DT0xPUl9NT0RFX09OOgo+IEBAIC0z
ODcsNyArMzg4LDYgQEAgYm9vbCBtaXBpX2RzaV9wYWNrZXRfZm9ybWF0X2lzX3Nob3J0KHU4IHR5
cGUpCj4gIAljYXNlIE1JUElfRFNJX0RDU19TSE9SVF9XUklURToKPiAgCWNhc2UgTUlQSV9EU0lf
RENTX1NIT1JUX1dSSVRFX1BBUkFNOgo+ICAJY2FzZSBNSVBJX0RTSV9EQ1NfUkVBRDoKPiAtCWNh
c2UgTUlQSV9EU0lfRENTX0NPTVBSRVNTSU9OX01PREU6Cj4gIAljYXNlIE1JUElfRFNJX1NFVF9N
QVhJTVVNX1JFVFVSTl9QQUNLRVRfU0laRToKPiAgCQlyZXR1cm4gdHJ1ZTsKPiAgCX0KPiBAQCAt
NDA2LDExICs0MDYsMTEgQEAKPiBFWFBPUlRfU1lNQk9MKG1pcGlfZHNpX3BhY2tldF9mb3JtYXRf
aXNfc2hvcnQpOwo+ICBib29sIG1pcGlfZHNpX3BhY2tldF9mb3JtYXRfaXNfbG9uZyh1OCB0eXBl
KSAgewo+ICAJc3dpdGNoICh0eXBlKSB7Cj4gLQljYXNlIE1JUElfRFNJX1BQU19MT05HX1dSSVRF
Ogo+ICAJY2FzZSBNSVBJX0RTSV9OVUxMX1BBQ0tFVDoKPiAgCWNhc2UgTUlQSV9EU0lfQkxBTktJ
TkdfUEFDS0VUOgo+ICAJY2FzZSBNSVBJX0RTSV9HRU5FUklDX0xPTkdfV1JJVEU6Cj4gIAljYXNl
IE1JUElfRFNJX0RDU19MT05HX1dSSVRFOgo+ICsJY2FzZSBNSVBJX0RTSV9QSUNUVVJFX1BBUkFN
RVRFUl9TRVQ6Cj4gIAljYXNlIE1JUElfRFNJX0xPT1NFTFlfUEFDS0VEX1BJWEVMX1NUUkVBTV9Z
Q0JDUjIwOgo+ICAJY2FzZSBNSVBJX0RTSV9QQUNLRURfUElYRUxfU1RSRUFNX1lDQkNSMjQ6Cj4g
IAljYXNlIE1JUElfRFNJX1BBQ0tFRF9QSVhFTF9TVFJFQU1fWUNCQ1IxNjoKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS92aWRlby9taXBpX2Rpc3BsYXkuaCBiL2luY2x1ZGUvdmlkZW8vbWlwaV9kaXNw
bGF5LmgKPiBpbmRleCBjYmE1N2E2NzhkYWYuLjc5ZmQ3MWNmNDkzNCAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL3ZpZGVvL21pcGlfZGlzcGxheS5oCj4gKysrIGIvaW5jbHVkZS92aWRlby9taXBpX2Rp
c3BsYXkuaAo+IEBAIC0xNyw2ICsxNyw5IEBAIGVudW0gewo+ICAJTUlQSV9EU0lfSF9TWU5DX1NU
QVJUCQkJCT0gMHgyMSwKPiAgCU1JUElfRFNJX0hfU1lOQ19FTkQJCQkJPSAweDMxLAo+IAo+ICsJ
TUlQSV9EU0lfQ09NUFJFU1NJT05fTU9ERQkJCT0gMHgwNywKPiArCU1JUElfRFNJX0VORF9PRl9U
UkFOU01JU1NJT04JCQk9IDB4MDgsCj4gKwo+ICAJTUlQSV9EU0lfQ09MT1JfTU9ERV9PRkYJCQkJ
PSAweDAyLAo+ICAJTUlQSV9EU0lfQ09MT1JfTU9ERV9PTgkJCQk9IDB4MTIsCj4gIAlNSVBJX0RT
SV9TSFVURE9XTl9QRVJJUEhFUkFMCQkJPSAweDIyLAo+IEBAIC0zNSwxOCArMzgsMTUgQEAgZW51
bSB7Cj4gCj4gIAlNSVBJX0RTSV9EQ1NfUkVBRAkJCQk9IDB4MDYsCj4gCj4gLQlNSVBJX0RTSV9E
Q1NfQ09NUFJFU1NJT05fTU9ERSAgICAgICAgICAgICAgICAgICA9IDB4MDcsCj4gLQlNSVBJX0RT
SV9QUFNfTE9OR19XUklURSAgICAgICAgICAgICAgICAgICAgICAgICA9IDB4MEEsCj4gLQo+ICAJ
TUlQSV9EU0lfU0VUX01BWElNVU1fUkVUVVJOX1BBQ0tFVF9TSVpFCQk9Cj4gMHgzNywKPiAKPiAt
CU1JUElfRFNJX0VORF9PRl9UUkFOU01JU1NJT04JCQk9IDB4MDgsCj4gLQo+ICAJTUlQSV9EU0lf
TlVMTF9QQUNLRVQJCQkJPSAweDA5LAo+ICAJTUlQSV9EU0lfQkxBTktJTkdfUEFDS0VUCQkJPSAw
eDE5LAo+ICAJTUlQSV9EU0lfR0VORVJJQ19MT05HX1dSSVRFCQkJPSAweDI5LAo+ICAJTUlQSV9E
U0lfRENTX0xPTkdfV1JJVEUJCQkJPSAweDM5LAo+IAo+ICsJTUlQSV9EU0lfUElDVFVSRV9QQVJB
TUVURVJfU0VUCQkJPSAweDBhLAo+ICsKPiAgCU1JUElfRFNJX0xPT1NFTFlfUEFDS0VEX1BJWEVM
X1NUUkVBTV9ZQ0JDUjIwCT0gMHgwYywKPiAgCU1JUElfRFNJX1BBQ0tFRF9QSVhFTF9TVFJFQU1f
WUNCQ1IyNAkJPSAweDFjLAo+ICAJTUlQSV9EU0lfUEFDS0VEX1BJWEVMX1NUUkVBTV9ZQ0JDUjE2
CQk9IDB4MmMsCj4gLS0KPiAyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
