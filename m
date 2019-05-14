Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E031CCDC
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 18:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BDC89291;
	Tue, 14 May 2019 16:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666F989291;
 Tue, 14 May 2019 16:22:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 09:22:05 -0700
X-ExtLoop1: 1
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga008.jf.intel.com with ESMTP; 14 May 2019 09:22:05 -0700
Received: from BGSMSX108.gar.corp.intel.com (10.223.4.192) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Tue, 14 May 2019 09:22:03 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.115]) by
 BGSMSX108.gar.corp.intel.com ([169.254.8.94]) with mapi id 14.03.0415.000;
 Tue, 14 May 2019 21:52:02 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: RE: [v9 10/13] drm/i915: Set Infoframe for non modeset case for HDR
Thread-Topic: [v9 10/13] drm/i915: Set Infoframe for non modeset case for HDR
Thread-Index: AQHVBcmiffswJY9gI0SisSKqtj2b56ZpH4IAgAG24vA=
Date: Tue, 14 May 2019 16:22:01 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F82025AF0@BGSMSX104.gar.corp.intel.com>
References: <1557340733-9629-1-git-send-email-uma.shankar@intel.com>
 <1557340733-9629-11-git-send-email-uma.shankar@intel.com>
 <20190513193956.GU24299@intel.com>
In-Reply-To: <20190513193956.GU24299@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiY2ZiNzZmZWYtYTViZC00MDgxLThkMDMtMmU3YmNmMzFiMWJiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUGdlZEhEemdRdEpOTTh3cHpwRERHa0pcL0dGXC9La0M2WDdNVk5QYkFtOERGeGhGRkdmRCsxNkxlY1ZoQitsWTdVIn0=
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
 "seanpaul@chromium.org" <seanpaul@chromium.org>, "Syrjala,
 Ville" <ville.syrjala@intel.com>, "Lankhorst,
 Maarten" <maarten.lankhorst@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPkZyb206IFZpbGxlIFN5cmrDpGzDpCBbbWFp
bHRvOnZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tXQo+U2VudDogVHVlc2RheSwgTWF5IDE0
LCAyMDE5IDE6MTAgQU0KPlRvOiBTaGFua2FyLCBVbWEgPHVtYS5zaGFua2FyQGludGVsLmNvbT4K
PkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOwo+ZGNhc3RhZ25hQGNocm9taXVtLm9yZzsgam9uYXNAa3dpYm9vLnNlOyBl
bWlsLmwudmVsaWtvdkBnbWFpbC5jb207Cj5zZWFucGF1bEBjaHJvbWl1bS5vcmc7IFN5cmphbGEs
IFZpbGxlIDx2aWxsZS5zeXJqYWxhQGludGVsLmNvbT47IExhbmtob3JzdCwgTWFhcnRlbgo+PG1h
YXJ0ZW4ubGFua2hvcnN0QGludGVsLmNvbT4KPlN1YmplY3Q6IFJlOiBbdjkgMTAvMTNdIGRybS9p
OTE1OiBTZXQgSW5mb2ZyYW1lIGZvciBub24gbW9kZXNldCBjYXNlIGZvciBIRFIKPgo+T24gVGh1
LCBNYXkgMDksIDIwMTkgYXQgMTI6MDg6NTBBTSArMDUzMCwgVW1hIFNoYW5rYXIgd3JvdGU6Cj4+
IEhEUiBtZXRhZGF0YSByZXF1aXJlcyBhIGluZm9mcmFtZSB0byBiZSBzZXQuIER1ZSB0byBmYXN0
c2V0LCBmdWxsCj4+IG1vZGVzZXQgaXMgbm90IHBlcmZvcm1lZCBoZW5jZSBhZGRpbmcgaXQgdG8g
dXBkYXRlX3BpcGUgdG8gaGFuZGxlCj4+IHRoYXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFVtYSBT
aGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+Cj4+IFJldmlld2VkLWJ5OiBTaGFzaGFuayBT
aGFybWEgPHNoYXNoYW5rLnNoYXJtYUBpbnRlbC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaW50ZWxfZGRpLmMgIHwgMTMgKysrKysrKysrKysrKwo+PiBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9pbnRlbF9oZG1pLmMgfCAgNyArKysrKy0tCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDE4
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pbnRlbF9kZGkuYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X2RkaS5jCj4+IGluZGV4IGNkNTI3N2QuLmQzNzUyNmIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2ludGVsX2RkaS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2lu
dGVsX2RkaS5jCj4+IEBAIC0zNTU5LDYgKzM1NTksMTAgQEAgc3RhdGljIHZvaWQgaW50ZWxfZGRp
X3VwZGF0ZV9waXBlKHN0cnVjdCBpbnRlbF9lbmNvZGVyCj4qZW5jb2RlciwKPj4gIAkJCQkgIGNv
bnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLAo+PiAgCQkJCSAgY29uc3Qg
c3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUpICB7Cj4+ICsJc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9faTkxNShlbmNvZGVyLT5iYXNlLmRldik7Cj4+
ICsJc3RydWN0IGludGVsX2RpZ2l0YWxfcG9ydCAqaW50ZWxfZGlnX3BvcnQgPQo+PiArCQkJZW5j
X3RvX2RpZ19wb3J0KCZlbmNvZGVyLT5iYXNlKTsKPj4gKwo+PiAgCWlmICghaW50ZWxfY3J0Y19o
YXNfdHlwZShjcnRjX3N0YXRlLCBJTlRFTF9PVVRQVVRfSERNSSkpCj4+ICAJCWludGVsX2RkaV91
cGRhdGVfcGlwZV9kcChlbmNvZGVyLCBjcnRjX3N0YXRlLCBjb25uX3N0YXRlKTsKPj4KPj4gQEAg
LTM1NjgsNiArMzU3MiwxNSBAQCBzdGF0aWMgdm9pZCBpbnRlbF9kZGlfdXBkYXRlX3BpcGUoc3Ry
dWN0IGludGVsX2VuY29kZXIKPiplbmNvZGVyLAo+PiAgCWVsc2UgaWYgKGNvbm5fc3RhdGUtPmNv
bnRlbnRfcHJvdGVjdGlvbiA9PQo+PiAgCQkgRFJNX01PREVfQ09OVEVOVF9QUk9URUNUSU9OX1VO
REVTSVJFRCkKPj4gIAkJaW50ZWxfaGRjcF9kaXNhYmxlKHRvX2ludGVsX2Nvbm5lY3Rvcihjb25u
X3N0YXRlLT5jb25uZWN0b3IpKTsKPj4gKwo+PiArCS8qIFNldCB0aGUgaW5mb2ZyYW1lIGZvciBO
T04gbW9kZXNldCBjYXNlcyBhcyB3ZWxsICovCj4+ICsJaWYgKGludGVsX2NydGNfaGFzX3R5cGUo
Y3J0Y19zdGF0ZSwgSU5URUxfT1VUUFVUX0hETUkpKSB7Cj4+ICsJCWlmICgoSU5URUxfR0VOKGRl
dl9wcml2KSA+PSAxMCB8fCBJU19HRU1JTklMQUtFKGRldl9wcml2KSkgJiYKPj4gKwkJICAgIGNv
bm5fc3RhdGUtPmhkcl9tZXRhZGF0YV9jaGFuZ2VkKQo+PiArCQkJaW50ZWxfZGlnX3BvcnQtPnNl
dF9pbmZvZnJhbWVzKGVuY29kZXIsCj4+ICsJCQkJCQkgICAgICAgY3J0Y19zdGF0ZS0+aGFzX2lu
Zm9mcmFtZSwKPj4gKwkJCQkJCSAgICAgICBjcnRjX3N0YXRlLCBjb25uX3N0YXRlKTsKPj4gKwl9
Cj4KPlN0aWxsIG5hay4KCk9rLCB3aWxsIGRyb3AgdGhpcyBmcm9tIHRoaXMgc2VyaWVzIGFuZCB0
YWtlIHRoaXMgdXAgbGF0ZXIuCgo+PiAgfQo+Pgo+PiAgc3RhdGljIHZvaWQgaW50ZWxfZGRpX3Nl
dF9maWFfbGFuZV9jb3VudChzdHJ1Y3QgaW50ZWxfZW5jb2Rlcgo+PiAqZW5jb2RlciwgZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkbWkuYwo+PiBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2ludGVsX2hkbWkuYwo+PiBpbmRleCBkYjljODJiLi5lNTU5YTk0MCAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfaGRtaS5jCj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkbWkuYwo+PiBAQCAtMTIwNCw4ICsxMjA0LDExIEBAIHN0
YXRpYyB2b2lkIGhzd19zZXRfaW5mb2ZyYW1lcyhzdHJ1Y3QgaW50ZWxfZW5jb2Rlcgo+KmVuY29k
ZXIsCj4+ICAJaTkxNV9yZWdfdCByZWcgPSBIU1dfVFZJREVPX0RJUF9DVEwoY3J0Y19zdGF0ZS0+
Y3B1X3RyYW5zY29kZXIpOwo+PiAgCXUzMiB2YWwgPSBJOTE1X1JFQUQocmVnKTsKPj4KPj4gLQlh
c3NlcnRfaGRtaV90cmFuc2NvZGVyX2Z1bmNfZGlzYWJsZWQoZGV2X3ByaXYsCj4+IC0JCQkJCSAg
ICAgY3J0Y19zdGF0ZS0+Y3B1X3RyYW5zY29kZXIpOwo+PiArCS8qIERSTSBJbmZvZnJhbWUgY2Fu
IGJlIHNlbmQgd2l0aCB0cmFuc2NvZGVyIGVuYWJsZWQgKi8KPj4gKwlpZiAoISgoSU5URUxfR0VO
KGRldl9wcml2KSA+PSAxMCB8fCBJU19HRU1JTklMQUtFKGRldl9wcml2KSkgJiYKPj4gKwkgICAg
ICBjb25uX3N0YXRlLT5oZHJfbWV0YWRhdGFfY2hhbmdlZCkpCj4+ICsJCWFzc2VydF9oZG1pX3Ry
YW5zY29kZXJfZnVuY19kaXNhYmxlZChkZXZfcHJpdiwKPj4gKwkJCQkJCSAgICAgY3J0Y19zdGF0
ZS0+Y3B1X3RyYW5zY29kZXIpOwo+Pgo+PiAgCXZhbCAmPSB+KFZJREVPX0RJUF9FTkFCTEVfVlND
X0hTVyB8IFZJREVPX0RJUF9FTkFCTEVfQVZJX0hTVyB8Cj4+ICAJCSBWSURFT19ESVBfRU5BQkxF
X0dDUF9IU1cgfCBWSURFT19ESVBfRU5BQkxFX1ZTX0hTVyB8Cj4+IC0tCj4+IDEuOS4xCj4+Cj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+
Cj4tLQo+VmlsbGUgU3lyasOkbMOkCj5JbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
