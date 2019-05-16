Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C22B20035
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 09:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D1D89309;
	Thu, 16 May 2019 07:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCB189308;
 Thu, 16 May 2019 07:25:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 May 2019 00:25:20 -0700
X-ExtLoop1: 1
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga003.jf.intel.com with ESMTP; 16 May 2019 00:25:20 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 16 May 2019 00:25:19 -0700
Received: from bgsmsx103.gar.corp.intel.com (10.223.4.130) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 16 May 2019 00:25:19 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.115]) by
 BGSMSX103.gar.corp.intel.com ([169.254.4.85]) with mapi id 14.03.0415.000;
 Thu, 16 May 2019 12:55:16 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [v10 03/12] drm: Parse HDR metadata info from EDID
Thread-Topic: [v10 03/12] drm: Parse HDR metadata info from EDID
Thread-Index: AQHVCnfTPhRxjrEqCky12RklOXLbAqZsOcqAgAEiMoA=
Date: Thu, 16 May 2019 07:25:15 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F8202AD2B@BGSMSX104.gar.corp.intel.com>
References: <1557855394-12214-1-git-send-email-uma.shankar@intel.com>
 <1557855394-12214-4-git-send-email-uma.shankar@intel.com>
 <20190515193617.GI24299@intel.com>
In-Reply-To: <20190515193617.GI24299@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTdmZTZiZjMtODQxYS00ODJkLWI4OGItOWU1ZWIxNGIxYWUyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiYjUxZW8zR2hiQ0JzMjlVVnNoRTZoNVR3TGtGWHVOMCtUMXdjekx2SGFSc0loVDZDQW5wSWxOWEs2UGZlOGw2QiJ9
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
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
Cc: "dcastagna@chromium.org" <dcastagna@chromium.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPkZyb206IFZpbGxlIFN5cmrDpGzDpCBbbWFp
bHRvOnZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tXQo+U2VudDogVGh1cnNkYXksIE1heSAx
NiwgMjAxOSAxOjA2IEFNCj5UbzogU2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+
Cj5DYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsKPm1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbTsgU2hhcm1h
LCBTaGFzaGFuawo+PHNoYXNoYW5rLnNoYXJtYUBpbnRlbC5jb20+OyBlbWlsLmwudmVsaWtvdkBn
bWFpbC5jb207IGJyaWFuLnN0YXJrZXlAYXJtLmNvbTsKPmRjYXN0YWduYUBjaHJvbWl1bS5vcmc7
IHNlYW5wYXVsQGNocm9taXVtLm9yZzsgUm9wZXIsIE1hdHRoZXcgRAo+PG1hdHRoZXcuZC5yb3Bl
ckBpbnRlbC5jb20+OyBqb25hc0Brd2lib28uc2UKPlN1YmplY3Q6IFJlOiBbdjEwIDAzLzEyXSBk
cm06IFBhcnNlIEhEUiBtZXRhZGF0YSBpbmZvIGZyb20gRURJRAo+Cj5PbiBUdWUsIE1heSAxNCwg
MjAxOSBhdCAxMTowNjoyNVBNICswNTMwLCBVbWEgU2hhbmthciB3cm90ZToKPj4gSERSIG1ldGFk
YXRhIGJsb2NrIGlzIGludHJvZHVjZWQgaW4gQ0VBLTg2MS4zIHNwZWMuCj4+IFBhcnNpbmcgdGhl
IHNhbWUgdG8gZ2V0IHRoZSBwYW5lbCdzIEhEUiBtZXRhZGF0YS4KPj4KPj4gdjI6IFJlYmFzZSBh
bmQgYWRkZWQgVmlsbGUncyBQT0MgY2hhbmdlcyB0byB0aGUgcGF0Y2guCj4+Cj4+IHYzOiBObyBD
aGFuZ2UKPj4KPj4gdjQ6IEFkZHJlc3NlZCBTaGFzaGFuaydzIHJldmlldyBjb21tZW50cwo+Pgo+
PiB2NTogQWRkcmVzc2VkIFNoYXNoYW5rJ3MgY29tbWVudCBhbmQgYWRkZWQgaGlzIFJCLgo+Pgo+
PiB2NjogQWRkcmVzc2VkIEpvbmFzIEthcmxtYW4gcmV2aWV3IGNvbW1lbnRzLgo+Pgo+PiB2Nzog
QWRyZXNzZWQgVmlsbGUncyByZXZpZXcgY29tbWVudHMgYW5kIGZpeGVkIHRoZSBpc3N1ZSB3aXRo
IGxlbmd0aAo+PiBoYW5kbGluZy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVt
YS5zaGFua2FyQGludGVsLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IFNoYXNoYW5rIFNoYXJtYSA8c2hh
c2hhbmsuc2hhcm1hQGludGVsLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYyB8IDQ5Cj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5j
Cj4+IGluZGV4IDg1MmJkZDguLjJlMGI1YmUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4+IEBAIC0y
ODUyLDYgKzI4NTIsNyBAQCBzdGF0aWMgaW50IGRybV9jdnRfbW9kZXMoc3RydWN0IGRybV9jb25u
ZWN0b3IKPipjb25uZWN0b3IsCj4+ICAjZGVmaW5lIFZJREVPX0JMT0NLICAgICAweDAyCj4+ICAj
ZGVmaW5lIFZFTkRPUl9CTE9DSyAgICAweDAzCj4+ICAjZGVmaW5lIFNQRUFLRVJfQkxPQ0sJMHgw
NAo+PiArI2RlZmluZSBIRFJfU1RBVElDX01FVEFEQVRBX0JMT0NLCTB4Ngo+PiAgI2RlZmluZSBV
U0VfRVhURU5ERURfVEFHIDB4MDcKPj4gICNkZWZpbmUgRVhUX1ZJREVPX0NBUEFCSUxJVFlfQkxP
Q0sgMHgwMAo+PiAgI2RlZmluZSBFWFRfVklERU9fREFUQV9CTE9DS180MjAJMHgwRQo+PiBAQCAt
MzgzNCw2ICszODM1LDUyIEBAIHN0YXRpYyB2b2lkIGZpeHVwX2RldGFpbGVkX2NlYV9tb2RlX2Ns
b2NrKHN0cnVjdAo+ZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKPj4gIAltb2RlLT5jbG9jayA9IGNs
b2NrOwo+PiAgfQo+Pgo+PiArc3RhdGljIGJvb2wgY2VhX2RiX2lzX2hkbWlfaGRyX21ldGFkYXRh
X2Jsb2NrKGNvbnN0IHU4ICpkYikgewo+PiArCWlmIChjZWFfZGJfdGFnKGRiKSAhPSBVU0VfRVhU
RU5ERURfVEFHKQo+PiArCQlyZXR1cm4gZmFsc2U7Cj4+ICsKPj4gKwlpZiAoZGJbMV0gIT0gSERS
X1NUQVRJQ19NRVRBREFUQV9CTE9DSykKPj4gKwkJcmV0dXJuIGZhbHNlOwo+PiArCj4+ICsJcmV0
dXJuIHRydWU7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB1aW50OF90IGVvdGZfc3VwcG9ydGVkKGNv
bnN0IHU4ICplZGlkX2V4dCkgewo+PiArCXJldHVybiBlZGlkX2V4dFsyXSAmCj4+ICsJCShCSVQo
SERNSV9FT1RGX1RSQURJVElPTkFMX0dBTU1BX1NEUikgfAo+PiArCQkgQklUKEhETUlfRU9URl9U
UkFESVRJT05BTF9HQU1NQV9IRFIpIHwKPj4gKwkJIEJJVChIRE1JX0VPVEZfU01QVEVfU1QyMDg0
KSk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB1aW50OF90IGhkcl9tZXRhZGF0YV90eXBlKGNvbnN0
IHU4ICplZGlkX2V4dCkgewo+PiArCXJldHVybiBlZGlkX2V4dFszXSAmCj4+ICsJCUJJVChIRE1J
X1NUQVRJQ19NRVRBREFUQV9UWVBFMSk7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkCj4+ICtk
cm1fcGFyc2VfaGRyX21ldGFkYXRhX2Jsb2NrKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IsIGNvbnN0Cj4+ICt1OCAqZGIpIHsKPj4gKwl1MTYgbGVuOwo+PiArCj4+ICsJbGVuID0gY2Vh
X2RiX3BheWxvYWRfbGVuKGRiKTsKPj4gKwlpZiAobGVuID49IDMpIHsKPgo+SSBiZWxpZXZlIGlu
IG90aGVyIGNhc2VzIHdlJ3ZlIHB1dCB0aGUgbGVuZ3RoIGNoZWNrIGZvciB0aGUgbWFuZGF0b3J5
IGJ5dGVzIGludG8gdGhlCj5jZWFfZGJfaXNfZm9vKCkgZnVuY3Rpb24uIFdvdWxkIGJlIGdvb2Qg
dG8gZm9sbG93IHRoZSBwYXRoIGxhaWQgb3V0IGJ5IGV4aXN0aW5nIGNvZGUKPmhlcmUgdG9vLgoK
T2sgZ290IGl0LiBXaWxsIHVwZGF0ZSB0aGlzLgoKPj4gKwkJY29ubmVjdG9yLT5oZHJfc2lua19t
ZXRhZGF0YS5oZG1pX3R5cGUxLmVvdGYgPQo+PiArCQkJCQkJZW90Zl9zdXBwb3J0ZWQoZGIpOwo+
PiArCQljb25uZWN0b3ItPmhkcl9zaW5rX21ldGFkYXRhLmhkbWlfdHlwZTEubWV0YWRhdGFfdHlw
ZSA9Cj4+ICsJCQkJCQloZHJfbWV0YWRhdGFfdHlwZShkYik7Cj4+ICsJfQo+PiArCj4+ICsJaWYg
KGxlbiA+PSA0KQo+PiArCQljb25uZWN0b3ItPmhkcl9zaW5rX21ldGFkYXRhLmhkbWlfdHlwZTEu
bWF4X2NsbCA9IGRiWzRdOwo+PiArCWlmIChsZW4gPj0gNSkKPj4gKwkJY29ubmVjdG9yLT5oZHJf
c2lua19tZXRhZGF0YS5oZG1pX3R5cGUxLm1heF9mYWxsID0gZGJbNV07Cj4+ICsJaWYgKGxlbiA+
PSA2KQo+PiArCQljb25uZWN0b3ItPmhkcl9zaW5rX21ldGFkYXRhLmhkbWlfdHlwZTEubWluX2Ns
bCA9IGRiWzZdOyB9Cj4+ICsKPj4gIHN0YXRpYyB2b2lkCj4+ICBkcm1fcGFyc2VfaGRtaV92c2Ri
X2F1ZGlvKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGNvbnN0IHU4Cj4+ICpkYikg
IHsgQEAgLTQ0NjEsNiArNDUwOCw4IEBAIHN0YXRpYyB2b2lkIGRybV9wYXJzZV9jZWFfZXh0KHN0
cnVjdAo+PiBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4+ICAJCQlkcm1fcGFyc2VfeTQyMGNt
ZGJfYml0bWFwKGNvbm5lY3RvciwgZGIpOwo+PiAgCQlpZiAoY2VhX2RiX2lzX3ZjZGIoZGIpKQo+
PiAgCQkJZHJtX3BhcnNlX3ZjZGIoY29ubmVjdG9yLCBkYik7Cj4+ICsJCWlmIChjZWFfZGJfaXNf
aGRtaV9oZHJfbWV0YWRhdGFfYmxvY2soZGIpKQo+PiArCQkJZHJtX3BhcnNlX2hkcl9tZXRhZGF0
YV9ibG9jayhjb25uZWN0b3IsIGRiKTsKPj4gIAl9Cj4+ICB9Cj4+Cj4+IC0tCj4+IDEuOS4xCj4K
Pi0tCj5WaWxsZSBTeXJqw6Rsw6QKPkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
