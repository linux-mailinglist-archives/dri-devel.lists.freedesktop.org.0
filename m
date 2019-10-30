Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A32E9829
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245B16E8CF;
	Wed, 30 Oct 2019 08:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093B96E8CF;
 Wed, 30 Oct 2019 08:28:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Oct 2019 01:28:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,246,1569308400"; d="scan'208";a="190211095"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga007.jf.intel.com with ESMTP; 30 Oct 2019 01:28:57 -0700
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 30 Oct 2019 01:28:57 -0700
Received: from bgsmsx154.gar.corp.intel.com (10.224.48.47) by
 fmsmsx117.amr.corp.intel.com (10.18.116.17) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 30 Oct 2019 01:28:57 -0700
Received: from BGSMSX108.gar.corp.intel.com ([169.254.8.18]) by
 BGSMSX154.gar.corp.intel.com ([169.254.7.237]) with mapi id 14.03.0439.000;
 Wed, 30 Oct 2019 13:58:54 +0530
From: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/5] drm/dsi: add missing DSI data types
Thread-Topic: [PATCH v2 2/5] drm/dsi: add missing DSI data types
Thread-Index: AQHVjaCJKtx982JS5EiSfSV8UmNHfKdy3G3w
Date: Wed, 30 Oct 2019 08:28:53 +0000
Message-ID: <57510F3E2013164E925CD03ED7512A3B8098FE72@BGSMSX108.gar.corp.intel.com>
References: <20191028150047.22048-1-jani.nikula@intel.com>
 <20191028150047.22048-2-jani.nikula@intel.com>
In-Reply-To: <20191028150047.22048-2-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTg1ZmY4N2QtNTU5ZC00ZDFjLTlkNmItMjhkM2FmMGU4ODllIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJVNmN3dGdcL0d0c2RWMEtYK0VLSXYrdFlZWFBrbDdtUUczSlhSb0pKXC9nWHNyd0xEbTh5M3ZOV05YNUs2XC9CZ0NyIn0=
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbmkgTmlrdWxhIDxqYW5pLm5p
a3VsYUBpbnRlbC5jb20+Cj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDI4LCAyMDE5IDg6MzEgUE0K
PiBUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVsLmNvbT47
Cj4gS3Vsa2FybmksIFZhbmRpdGEgPHZhbmRpdGEua3Vsa2FybmlAaW50ZWwuY29tPgo+IFN1Ympl
Y3Q6IFtQQVRDSCB2MiAyLzVdIGRybS9kc2k6IGFkZCBtaXNzaW5nIERTSSBkYXRhIHR5cGVzCj4g
Cj4gQWRkIGV4ZWN1dGUgcXVldWUgYW5kIGNvbXByZXNzZWQgcGl4ZWwgc3RyZWFtIHBhY2tldCBk
YXRhIHR5cGVzIGZvcgo+IGNvbXBsZXRlbmVzcy4KPiAKPiBDYzogVmFuZGl0YSBLdWxrYXJuaSA8
dmFuZGl0YS5rdWxrYXJuaUBpbnRlbC5jb20+CgpMb29rcyBnb29kIHRvIG1lLgpSZXZpZXdlZC1i
eTogVmFuZGl0YSBLdWxrYXJuaSA8dmFuZGl0YS5rdWxrYXJuaUBpbnRlbC5jb20+Cgo+IFNpZ25l
ZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kc2kuYyB8IDIgKysKPiAgaW5jbHVkZS92aWRlby9taXBp
X2Rpc3BsYXkuaCAgIHwgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZHNpLmMKPiBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fbWlwaV9kc2kuYyBpbmRleCBmMjM3ZDgwODI4YzMuLjNmMzNmMDI1NzFm
ZAo+IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kc2kuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kc2kuYwo+IEBAIC0zODgsNiArMzg4LDcgQEAgYm9v
bCBtaXBpX2RzaV9wYWNrZXRfZm9ybWF0X2lzX3Nob3J0KHU4IHR5cGUpCj4gIAljYXNlIE1JUElf
RFNJX0RDU19TSE9SVF9XUklURToKPiAgCWNhc2UgTUlQSV9EU0lfRENTX1NIT1JUX1dSSVRFX1BB
UkFNOgo+ICAJY2FzZSBNSVBJX0RTSV9EQ1NfUkVBRDoKPiArCWNhc2UgTUlQSV9EU0lfRVhFQ1VU
RV9RVUVVRToKPiAgCWNhc2UgTUlQSV9EU0lfU0VUX01BWElNVU1fUkVUVVJOX1BBQ0tFVF9TSVpF
Ogo+ICAJCXJldHVybiB0cnVlOwo+ICAJfQo+IEBAIC00MTEsNiArNDEyLDcgQEAgYm9vbCBtaXBp
X2RzaV9wYWNrZXRfZm9ybWF0X2lzX2xvbmcodTggdHlwZSkKPiAgCWNhc2UgTUlQSV9EU0lfR0VO
RVJJQ19MT05HX1dSSVRFOgo+ICAJY2FzZSBNSVBJX0RTSV9EQ1NfTE9OR19XUklURToKPiAgCWNh
c2UgTUlQSV9EU0lfUElDVFVSRV9QQVJBTUVURVJfU0VUOgo+ICsJY2FzZSBNSVBJX0RTSV9DT01Q
UkVTU0VEX1BJWEVMX1NUUkVBTToKPiAgCWNhc2UgTUlQSV9EU0lfTE9PU0VMWV9QQUNLRURfUElY
RUxfU1RSRUFNX1lDQkNSMjA6Cj4gIAljYXNlIE1JUElfRFNJX1BBQ0tFRF9QSVhFTF9TVFJFQU1f
WUNCQ1IyNDoKPiAgCWNhc2UgTUlQSV9EU0lfUEFDS0VEX1BJWEVMX1NUUkVBTV9ZQ0JDUjE2Ogo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL3ZpZGVvL21pcGlfZGlzcGxheS5oIGIvaW5jbHVkZS92aWRl
by9taXBpX2Rpc3BsYXkuaAo+IGluZGV4IDc5ZmQ3MWNmNDkzNC4uNmI2MzkwZGZhMjAzIDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvdmlkZW8vbWlwaV9kaXNwbGF5LmgKPiArKysgYi9pbmNsdWRlL3Zp
ZGVvL21pcGlfZGlzcGxheS5oCj4gQEAgLTM3LDYgKzM3LDcgQEAgZW51bSB7Cj4gIAlNSVBJX0RT
SV9EQ1NfU0hPUlRfV1JJVEVfUEFSQU0JCQk9IDB4MTUsCj4gCj4gIAlNSVBJX0RTSV9EQ1NfUkVB
RAkJCQk9IDB4MDYsCj4gKwlNSVBJX0RTSV9FWEVDVVRFX1FVRVVFCQkJCT0gMHgxNiwKPiAKPiAg
CU1JUElfRFNJX1NFVF9NQVhJTVVNX1JFVFVSTl9QQUNLRVRfU0laRQkJPQo+IDB4MzcsCj4gCj4g
QEAgLTQ2LDYgKzQ3LDcgQEAgZW51bSB7Cj4gIAlNSVBJX0RTSV9EQ1NfTE9OR19XUklURQkJCQk9
IDB4MzksCj4gCj4gIAlNSVBJX0RTSV9QSUNUVVJFX1BBUkFNRVRFUl9TRVQJCQk9IDB4MGEsCj4g
KwlNSVBJX0RTSV9DT01QUkVTU0VEX1BJWEVMX1NUUkVBTQkJPSAweDBiLAo+IAo+ICAJTUlQSV9E
U0lfTE9PU0VMWV9QQUNLRURfUElYRUxfU1RSRUFNX1lDQkNSMjAJPSAweDBjLAo+ICAJTUlQSV9E
U0lfUEFDS0VEX1BJWEVMX1NUUkVBTV9ZQ0JDUjI0CQk9IDB4MWMsCj4gLS0KPiAyLjIwLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
