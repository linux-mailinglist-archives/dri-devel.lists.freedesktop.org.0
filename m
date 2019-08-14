Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F22338D608
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 16:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B566E1F3;
	Wed, 14 Aug 2019 14:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD67A6E1F3;
 Wed, 14 Aug 2019 14:30:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Aug 2019 07:30:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,385,1559545200"; d="scan'208";a="170797757"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga008.jf.intel.com with ESMTP; 14 Aug 2019 07:30:05 -0700
Received: from BGSMSX107.gar.corp.intel.com (10.223.4.191) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 14 Aug 2019 07:30:05 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.178]) by
 BGSMSX107.gar.corp.intel.com ([169.254.9.251]) with mapi id 14.03.0439.000;
 Wed, 14 Aug 2019 19:59:57 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Subject: RE: [v7,01/16] drm: Add Enhanced Gamma LUT precision structure
Thread-Topic: [v7,01/16] drm: Add Enhanced Gamma LUT precision structure
Thread-Index: AQHVUbtbU4pYZmanZkWsVIWmYdke/qb6takg
Date: Wed, 14 Aug 2019 14:29:57 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F821C2AEA@BGSMSX104.gar.corp.intel.com>
References: <1553804174-2651-2-git-send-email-uma.shankar@intel.com>
 <20190813094134.GA26945@jamwan02-TSP300>
In-Reply-To: <20190813094134.GA26945@jamwan02-TSP300>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjhhOTk2YWQtMmVkNi00MTcyLWI5ZGEtYjg5Mzc5MDI5YWQ1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZ0k3WmpSV1RBOHU4Nys5eE81ajBqVjhWdDFOUGtIalpMa0Q5NEpyYUlSbDZVMDQ3Q3U0OEZvMmN0ZXJsNnQzeSJ9
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
Cc: "Syrjala, Ville" <ville.syrjala@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>, "Lankhorst, Maarten" <maarten.lankhorst@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPkZyb206IGphbWVzIHFpYW4gd2FuZyAoQXJt
IFRlY2hub2xvZ3kgQ2hpbmEpIFttYWlsdG86amFtZXMucWlhbi53YW5nQGFybS5jb21dCj5TZW50
OiBUdWVzZGF5LCBBdWd1c3QgMTMsIDIwMTkgMzoxMiBQTQo+VG86IFNoYW5rYXIsIFVtYSA8dW1h
LnNoYW5rYXJAaW50ZWwuY29tPgo+Q2M6IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFN5cmphbGEsIFZpbGxlCj48dmlsbGUu
c3lyamFsYUBpbnRlbC5jb20+OyBlbWlsLmwudmVsaWtvdkBnbWFpbC5jb207IExhbmtob3JzdCwg
TWFhcnRlbgo+PG1hYXJ0ZW4ubGFua2hvcnN0QGludGVsLmNvbT47IG5kIDxuZEBhcm0uY29tPgo+
U3ViamVjdDogUmU6IFt2NywwMS8xNl0gZHJtOiBBZGQgRW5oYW5jZWQgR2FtbWEgTFVUIHByZWNp
c2lvbiBzdHJ1Y3R1cmUKPgo+T24gRnJpLCBNYXIgMjksIDIwMTkgYXQgMDE6NDU6NTlBTSArMDUz
MCwgVW1hIFNoYW5rYXIgd3JvdGU6Cj4+IEV4aXN0aW5nIExVVCBwcmVjaXNpb24gc3RydWN0dXJl
IGlzIGhhdmluZyBvbmx5IDE2IGJpdCBwcmVjaXNpb24uIFRoaXMKPj4gaXMgbm90IGVub3VnaCBm
b3IgdXBjb21pbmcgZW5oYW5jZWQgaGFyZHdhcmVzIGFuZCBhZHZhbmNlIHVzZWNhc2VzCj4+IGxp
a2UgSERSIHByb2Nlc3NpbmcuIEhlbmNlIGFkZGVkIGEgbmV3IHN0cnVjdHVyZSB3aXRoIDMyIGJp
dCBwcmVjaXNpb24KPj4gdmFsdWVzLiBBbHNvIGFkZGVkIHRoZSBjb2RlLCBmb3IgZXh0cmFjdGlu
ZyB0aGUgc2FtZSBmcm9tIHZhbHVlcwo+PiBwYXNzZWQgZnJvbSB1c2Vyc3BhY2UuCj4+Cj4+IHY0
OiBSZWJhc2UKPj4KPj4gdjU6IFJlbG9jYXRlZCB0aGUgaGVscGVyIGZ1bmN0aW9uIHRvIGRybV9j
b2xvcl9tZ210LmMuIERlY2xhcmVkIHRoZQo+PiBzYW1lIGluIGEgaGVhZGVyIGZpbGUgKEFsZXhh
bmRydSBHaGVvcmdoZSkKPj4KPj4gdjY6IEVuaGFuY2VkIGdhbW1hIGx1dCBzdHJ1Y3R1cmUgdG8g
dGFrZSBVMzIuMzIgZm9ybWF0IGFzIGlucHV0Lgo+PiBUaGlzIGlzIG5lZWRlZCBmb3IgSERSIHVz
ZWNhc2Ugd2hpY2ggcmVxdWlyZSBoaWdoZXIgcHJlY2lzaW9uLgo+Pgo+PiB2NzogQWRkcmVzc2Vk
IE1hYXJ0ZW4ncyByZXZpZXcgY29tbWVudHMgYW5kIGZpeGVkIHRoZSBjYWxjdWxhdGlvbi4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4KPj4g
UmV2aWV3ZWQtYnk6IEFsZXhhbmRydSBHaGVvcmdoZSA8YWxleGFuZHJ1LWNvc21pbi5naGVvcmdo
ZUBhcm0uY29tPgo+Cj5IaSBVbWEKPgo+V2hlbiBjYW4gd2UgbWVyZ2UgdGhlc2UgcGxhbmUgY29s
b3ItbWdtdCBzdXBwb3J0IGludG8gdXBzdHJlYW0gPwo+b3IgY2FuIHdlIG1lcmdlIHRoZSBEUk0t
Q09SRSBwYXJ0IHBhdGNoZXMgZmlyc3RseT8KCkhpIEphbWVzLApJIHdpbGwgcmVmcmVzaCB0aGlz
IHNlcmllcyBieSBlYXJseSBuZXh0IHdlZWsuIFdlIHdpbGwgdHJ5IHRvIHByaW9yaXRpemUgdGhp
cyBkZXZlbG9wbWVudCBhbmQgc3BlZWQKdXAgd2l0aCBtZXJnZS4KClJlZ2FyZHMsClVtYSBTaGFu
a2FyCgo+dGhhbmtzCj5qYW1lcwo+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL2RybV9jb2xv
cl9tZ210LmMgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+PiAgaW5jbHVkZS9kcm0vZHJtX2Nv
bG9yX21nbXQuaCAgICAgfCAgMSArCj4+ICBpbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmggICAg
ICB8IDE1ICsrKysrKysrKysrKysrKwo+PiAgMyBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25z
KCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYwo+
PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCj4+IGluZGV4IGQ1ZDM0ZDAuLjc5
ZmY4NzQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCj4+IEBAIC0xMjgsNiArMTI4
LDI2IEBAIHVpbnQzMl90IGRybV9jb2xvcl9sdXRfZXh0cmFjdCh1aW50MzJfdAo+PiB1c2VyX2lu
cHV0LCB1aW50MzJfdCBiaXRfcHJlY2lzaW9uKSAgfQo+PiBFWFBPUlRfU1lNQk9MKGRybV9jb2xv
cl9sdXRfZXh0cmFjdCk7Cj4+Cj4+ICsvKgo+PiArICogQWRkZWQgdG8gYWNjb21tb2RhdGUgZW5o
YW5jZWQgTFVUIHByZWNpc2lvbi4KPj4gKyAqIE1heCBMVVQgcHJlY2lzaW9uIGlzIDMyIGJpdHMu
Cj4+ICsgKi8KPj4gK3U2NCBkcm1fY29sb3JfbHV0X2V4dHJhY3RfZXh0KHU2NCB1c2VyX2lucHV0
LCB1MzIgYml0X3ByZWNpc2lvbikgewo+PiArCXU2NCB2YWwgPSB1c2VyX2lucHV0ICYgMHhmZmZm
ZmZmZjsKPj4gKwl1MzIgbWF4ID0gMHhmZmZmZmZmZiA+PiAoMzIgLSBiaXRfcHJlY2lzaW9uKTsK
Pj4gKwo+PiArCS8qIFJvdW5kIG9ubHkgaWYgd2UncmUgbm90IHVzaW5nIGZ1bGwgcHJlY2lzaW9u
LiAqLwo+PiArCWlmIChiaXRfcHJlY2lzaW9uIDwgMzIpIHsKPj4gKwkJdmFsICs9IDFVTCA8PCAo
MzIgLSBiaXRfcHJlY2lzaW9uIC0gMSk7Cj4+ICsJCXZhbCA+Pj0gMzIgLSBiaXRfcHJlY2lzaW9u
Owo+PiArCX0KPj4gKwo+PiArCXJldHVybiAoKHVzZXJfaW5wdXQgJiAweGZmZmZmZmZmMDAwMDAw
MDApIHwKPj4gKwkJY2xhbXBfdmFsKHZhbCwgMCwgbWF4KSk7Cj4+ICt9Cj4+ICtFWFBPUlRfU1lN
Qk9MKGRybV9jb2xvcl9sdXRfZXh0cmFjdF9leHQpOwo+PiArCj4+ICAvKioKPj4gICAqIGRybV9j
cnRjX2VuYWJsZV9jb2xvcl9tZ210IC0gZW5hYmxlIGNvbG9yIG1hbmFnZW1lbnQgcHJvcGVydGll
cwo+PiAgICogQGNydGM6IERSTSBDUlRDCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
Y29sb3JfbWdtdC5oCj4+IGIvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaCBpbmRleCBkMWM2
NjJkLi5jOWQyNzQ2IDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5o
Cj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKPj4gQEAgLTMwLDYgKzMwLDcg
QEAKPj4gIHN0cnVjdCBkcm1fcGxhbmU7Cj4+Cj4+ICB1aW50MzJfdCBkcm1fY29sb3JfbHV0X2V4
dHJhY3QodWludDMyX3QgdXNlcl9pbnB1dCwgdWludDMyX3QKPj4gYml0X3ByZWNpc2lvbik7Cj4+
ICt1NjQgZHJtX2NvbG9yX2x1dF9leHRyYWN0X2V4dCh1NjQgdXNlcl9pbnB1dCwgdTMyIGJpdF9w
cmVjaXNpb24pOwo+Pgo+PiAgdm9pZCBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdChzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMsCj4+ICAJCQkJdWludCBkZWdhbW1hX2x1dF9zaXplLAo+PiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oIGIvaW5jbHVkZS91YXBpL2RybS9kcm1f
bW9kZS5oCj4+IGluZGV4IDA5ZDcyOTYuLmNhODE0MTAgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUv
dWFwaS9kcm0vZHJtX21vZGUuaAo+PiArKysgYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9tb2RlLmgK
Pj4gQEAgLTYyOSw2ICs2MjksMjEgQEAgc3RydWN0IGRybV9jb2xvcl9sdXQgewo+PiAgCV9fdTE2
IHJlc2VydmVkOwo+PiAgfTsKPj4KPj4gKy8qCj4+ICsgKiBDcmVhdGluZyA2NCBiaXQgcGFsZXR0
ZSBlbnRyaWVzIGZvciBiZXR0ZXIgZGF0YQo+PiArICogcHJlY2lzaW9uLiBUaGlzIHdpbGwgYmUg
cmVxdWlyZWQgZm9yIEhEUiBhbmQKPj4gKyAqIHNpbWlsYXIgY29sb3IgcHJvY2Vzc2luZyB1c2Vj
YXNlcy4KPj4gKyAqLwo+PiArc3RydWN0IGRybV9jb2xvcl9sdXRfZXh0IHsKPj4gKwkvKgo+PiAr
CSAqIERhdGEgaXMgVTMyLjMyIGZpeGVkIHBvaW50IGZvcm1hdC4KPj4gKwkgKi8KPj4gKwlfX3U2
NCByZWQ7Cj4+ICsJX191NjQgZ3JlZW47Cj4+ICsJX191NjQgYmx1ZTsKPj4gKwlfX3U2NCByZXNl
cnZlZDsKPj4gK307Cj4+ICsKPj4gICNkZWZpbmUgRFJNX01PREVfUEFHRV9GTElQX0VWRU5UIDB4
MDEgICNkZWZpbmUKPj4gRFJNX01PREVfUEFHRV9GTElQX0FTWU5DIDB4MDIgICNkZWZpbmUKPj4g
RFJNX01PREVfUEFHRV9GTElQX1RBUkdFVF9BQlNPTFVURSAweDQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
