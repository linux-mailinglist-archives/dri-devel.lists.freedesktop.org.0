Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1180CDBBA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 08:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D567B6E453;
	Mon,  7 Oct 2019 06:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF756E453
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 06:05:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Oct 2019 23:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,265,1566889200"; d="scan'208";a="199435025"
Received: from pgsmsx113.gar.corp.intel.com ([10.108.55.202])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Oct 2019 23:05:04 -0700
Received: from pgsmsx109.gar.corp.intel.com (10.221.44.109) by
 pgsmsx113.gar.corp.intel.com (10.108.55.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 7 Oct 2019 14:01:57 +0800
Received: from pgsmsx111.gar.corp.intel.com ([169.254.2.128]) by
 PGSMSX109.gar.corp.intel.com ([169.254.14.150]) with mapi id 14.03.0439.000;
 Mon, 7 Oct 2019 14:01:57 +0800
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: drm/edid: Select DMT timing if EDID's display feature not
 support GTF
Thread-Topic: drm/edid: Select DMT timing if EDID's display feature not
 support GTF
Thread-Index: AdV80+0l7BD3n8CnTdanRvz3FJmGuA==
Date: Mon, 7 Oct 2019 06:01:56 +0000
Message-ID: <D42A2A322A1FCA4089E30E9A9BA36AC65D6A9E0E@PGSMSX111.gar.corp.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTAxOWI4MDYtZTRjNi00MWFjLWI4MzUtYTRmN2U4OWVjOTkzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibUxzTGJWQXRVNkMzRzhyWnhFWDFaN0VSM0FEWk1aM3dvUys2cXltY0xmbnlrcWFWalhRSGpheVdZTURaOXBTZiJ9
x-ctpclassification: CTP_NT
x-originating-ip: [172.30.20.206]
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
Reply-To: "20190806113021.6586-1-shawn.c.lee@intel.com"
 <20190806113021.6586-1-shawn.c.lee@intel.com>
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Chiou,
 Cooper" <cooper.chiou@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTksIDIwMTksIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPk9uIFR1ZSwgQXVn
IDA2LCAyMDE5IGF0IDA3OjMwOjIxUE0gKzA4MDAsIExlZSBTaGF3biBDIHdyb3RlOgo+PiBSZWZl
ciB0byBFRElEIDEuMyBzcGVjLCBkaXNwbGF5IEZFQVRVUkUgKGJ5dGUgMThoKSBiaXQgIzAgc2Fp
ZAo+PiAiSWYgdGhpcyBiaXQgaXMgc2V0IHRvIDEsIHRoZSBkaXNwbGF5IHN1cHBvcnRzIHRpbWlu
Z3MgYmFzZWQgb24gdGhlCj4+IEdURiBzdGFuZGFyZCB1c2luZyBkZWZhdWx0IEdURiBwYXJhbWV0
ZXIgdmFsdWVzIi4KPj4gCj4+IEFuZCBFRElEIDEuNCBzcGVjIHNob3dzICJJZiBiaXQgMCBpcyBz
ZXQgdG8gMCwgdGhlbiB0aGUgZGlzcGxheQo+PiBpcyBub25jb250aW51b3VzIGZyZXF1ZW5jeSAo
bXVsdGktbW9kZSkgYW5kIGlzIG9ubHkgc3BlY2lmaWVkIHRvIGFjY2VwdAo+PiB0aGUgdmlkZW8g
dGltaW5nIGZvcm1hdHMgdGhhdCBhcmUgbGlzdGVkIGluIEJBU0UgRURJRCBhbmQgY2VydGFpbgo+
PiBFWFRFTlNJT04gQmxvY2tzLgo+PiAKPj4gV2hlbiBkaXNwbGF5IGZlYXR1cmUgZGlkIG5vdCBz
dXBwb3J0IENWVCBvciBHRlQyIGFuZCBtb25pdG9yJ3MgRURJRCB2ZXJzaW9uCj4+IGdyZWF0ZXIg
dGhhbiBvciBlcXVhbCB0byAiMS4yIi4gRFJNIGRyaXZlciB3b3VsZCBzZWxlY3QgR1RGIGFzIGRl
ZmF1bHQKPj4gZm9yIHN0YW5kYXJkIHRpbWluZyBjYWxjdWxhdGlvbi4gSXQgbWF5IGdlbmVyYXRl
ZCBzb21lIHZpZGVvIHRpbWluZwo+PiB0aGF0IGNhbid0IGRpc3BsYXkgcHJvcGVybHkgYnkgZXh0
ZXJuYWwgbW9uaXRvci4KPj4gCj4+IEZvciBleGFtcGxlLiBXaGVuIGRyaXZlciByZXRyaWV2ZWQg
IjB4RDEgMHhGQyIgKEZIRCwgMTIwSHopIGFuZAo+PiAiMHhEMSAweEU4IiAoRkhELCAxMDBIeikg
ZnJvbSAiU3RhbmRhcmQgVGltaW5ncyIuIEdURiBmb3JtdWxhCj4+IHdvdWxkIGdlbmVyYXRlIHZp
ZGVvIHRpbWluZyBsaWtlIGJlbG93LiBJdCBhbHJlYWR5IG92ZXIgbW9uaXRvcidzCj4+IHNwZWMg
dG8gY2F1c2UgYmxhY2sgc2NyZWVuIGlzc3VlLgo+PiAiMTkyMHgxMDgwIiAxMjAgMzY4ODgxIDE5
MjAgMjA3MiAyMjg4IDI2NTYgMTA4MCAxMDgxIDEwODQgMTE1NyAweDAgMHg2Cj4+ICIxOTIweDEw
ODAiIDEwMCAzMDE5OTIgMTkyMCAyMDcyIDIyODAgMjY0MCAxMDgwIDEwODEgMTA4NCAxMTQ0IDB4
MCAweDYKPj4gCj4+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+PiBD
YzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4K
Pj4gQ2M6IEFkYW0gSmFja3NvbiA8YWpheEByZWRoYXQuY29tPgo+PiBDYzogQ29vcGVyIENoaW91
IDxjb29wZXIuY2hpb3VAaW50ZWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBMZWUgU2hhd24gQyA8
c2hhd24uYy5sZWVAaW50ZWwuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRp
ZC5jIHwgNCArKystCj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+PiBpbmRleCA4MmE0Y2VlZDNmY2YuLmY2YTNkMmQ5
OTNjNyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPj4gQEAgLTIwODksNyArMjA4OSw5IEBAIHN0YXRp
YyBpbnQgc3RhbmRhcmRfdGltaW5nX2xldmVsKHN0cnVjdCBlZGlkICplZGlkKQo+PiAgCQkJcmV0
dXJuIExFVkVMX0NWVDsKPj4gIAkJaWYgKGRybV9ndGYyX2hicmVhayhlZGlkKSkKPj4gIAkJCXJl
dHVybiBMRVZFTF9HVEYyOwo+PiAtCQlyZXR1cm4gTEVWRUxfR1RGOwo+PiArCQlpZiAoZWRpZC0+
cmV2aXNpb24gPT0gMyAmJiAoZWRpZC0+ZmVhdHVyZXMgJiBEUk1fRURJRF9GRUFUVVJFX0RFRkFV
TFRfR1RGKSkKPj4gKwkJCXJldHVybiBMRVZFTF9HVEY7Cj4KPldoaWxlIHRoZSBvbGRlc3QgRURJ
RCBzcGVjIEkgaGF2ZSBpcyAxLjMsIHNvdXJjZXMgb24gdGhlIGludGVyd2Vicwo+c3VnZ2VzdCB0
aGF0IG9sZGVyIHJldmlzaW9ucyBhbHJlYWR5IGhhZCB0aGUgImRlZmF1bHQgR1RGIiBmbGFnIGhl
cmUuCj5TbyBJIHRoaW5rIHdlIGNhbiBvbWl0IHRoZSByZXZpc2lvbiBjaGVjay4KPgoKSSdtIHNv
cnJ5IEkgbWlzcyB0aGlzIGNvbW1lbnQgYW5kIGFscmVhZHkgcHVzaCBwYXRoYyB2Mi4gVGhhbmtz
IQoKPj4gKwo+PiAgCX0KPj4gIAlyZXR1cm4gTEVWRUxfRE1UOwo+PiAgfQo+PiAtLSAKPj4gMi4x
Ny4xCj4+IAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
