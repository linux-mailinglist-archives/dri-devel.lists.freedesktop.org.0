Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6962214EA41
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 10:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FEF6FAD5;
	Fri, 31 Jan 2020 09:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425986FAD5;
 Fri, 31 Jan 2020 09:52:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 01:52:15 -0800
X-IronPort-AV: E=Sophos;i="5.70,385,1574150400"; d="scan'208";a="223091848"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.21.8])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 01:52:10 -0800
MIME-Version: 1.0
In-Reply-To: <20200130165721.20342-3-akeem.g.abodunrin@intel.com>
References: <20200130165721.20342-1-akeem.g.abodunrin@intel.com>
 <20200130165721.20342-3-akeem.g.abodunrin@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/gen7: Clear all EU/L3 residual contexts
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: akeem.g.abodunrin@intel.com, chris.p.wilson@intel.com,
 d.scott.phillips@intel.com, daniel.vetter@intel.com, david.c.stewart@intel.com,
 dri-devel@lists.freedesktop.org, francesco.balestrieri@intel.com,
 intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 jon.bloomfield@intel.com, mika.kuoppala@intel.com, omer.aran@intel.com,
 pragyansri.pathi@intel.com, prathap.kumar.valsan@intel.com,
 sudeep.dutt@intel.com, tony.luck@intel.com
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Fri, 31 Jan 2020 11:52:07 +0200
Message-ID: <158046432762.8720.11526385420365501697@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.8.1
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBBa2VlbSBHIEFib2R1bnJpbiAoMjAyMC0wMS0zMCAxODo1NzoyMSkKPiBGcm9tOiBQ
cmF0aGFwIEt1bWFyIFZhbHNhbiA8cHJhdGhhcC5rdW1hci52YWxzYW5AaW50ZWwuY29tPgo+IAo+
IE9uIGdlbjcgYW5kIGdlbjcuNSBkZXZpY2VzLCB0aGVyZSBjb3VsZCBiZSBsZWZ0b3ZlciBkYXRh
IHJlc2lkdWFscyBpbgo+IEVVL0wzIGZyb20gdGhlIHJldGlyaW5nIGNvbnRleHQuIFRoaXMgcGF0
Y2ggaW50cm9kdWNlcyB3b3JrYXJvdW5kIHRvIGNsZWFyCj4gdGhhdCByZXNpZHVhbCBjb250ZXh0
cywgYnkgc3VibWl0dGluZyBhIGJhdGNoIGJ1ZmZlciB3aXRoIGRlZGljYXRlZCBIVwo+IGNvbnRl
eHQgdG8gdGhlIEdQVSB3aXRoIHJpbmcgYWxsb2NhdGlvbiBmb3IgZWFjaCBjb250ZXh0IHN3aXRj
aGluZy4KPiAKPiBUaGlzIHNlY3VyaXR5IG1pdGlnYXRpb24gY2hhbmdlIGRvZXMgbm90IHRyaWdn
ZXIgYW55IHBlcmZvcm1hbmNlCj4gcmVncmVzc2lvbi4gUGVyZm9ybWFuY2UgaXMgb24gcGFyIHdp
dGggY3VycmVudCBtYWlubGluZS9kcm0tdGlwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pa2EgS3Vv
cHBhbGEgPG1pa2Eua3VvcHBhbGFAbGludXguaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBy
YXRoYXAgS3VtYXIgVmFsc2FuIDxwcmF0aGFwLmt1bWFyLnZhbHNhbkBpbnRlbC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogQWtlZW0gRyBBYm9kdW5yaW4gPGFrZWVtLmcuYWJvZHVucmluQGludGVsLmNv
bT4KPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpcy5wLndpbHNvbkBpbnRlbC5jb20+Cj4gQ2M6IEJh
bGVzdHJpZXJpIEZyYW5jZXNjbyA8ZnJhbmNlc2NvLmJhbGVzdHJpZXJpQGludGVsLmNvbT4KPiBD
YzogQmxvb21maWVsZCBKb24gPGpvbi5ibG9vbWZpZWxkQGludGVsLmNvbT4KPiBDYzogRHV0dCBT
dWRlZXAgPHN1ZGVlcC5kdXR0QGludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvZ2VuN19yZW5kZXJjbGVhci5jICAgIHwgNTM1ICsrKysrKysrKysrKysrKysrKwo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9nZW43X3JlbmRlcmNsZWFyLmggICAgfCAgMTUgKwo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9ncHVfY29tbWFuZHMuaCAgfCAgMTcgKy0KPiAg
Li4uL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9yaW5nX3N1Ym1pc3Npb24uYyAgIHwgICAzICstCj4g
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdXRpbHMuaCAgICAgICAgICAgICB8ICAgNSArCj4g
IDYgZmlsZXMgY2hhbmdlZCwgNTcyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9nZW43X3JlbmRlcmNsZWFy
LmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2dlbjdfcmVu
ZGVyY2xlYXIuaAo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmls
ZSBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L01ha2VmaWxlCj4gaW5kZXggM2M4OGQ3ZDhjNzY0Li5m
OTZiYWU2NjRhMDMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvTWFrZWZpbGUK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmlsZQo+IEBAIC03OCw2ICs3OCw3IEBA
IGd0LXkgKz0gXAo+ICAgICAgICAgZ3QvZGVidWdmc19ndC5vIFwKPiAgICAgICAgIGd0L2RlYnVn
ZnNfZ3RfcG0ubyBcCj4gICAgICAgICBndC9nZW42X3BwZ3R0Lm8gXAo+ICsgICAgICAgZ3QvZ2Vu
N19yZW5kZXJjbGVhci5vIFwKPiAgICAgICAgIGd0L2dlbjhfcHBndHQubyBcCj4gICAgICAgICBn
dC9pbnRlbF9icmVhZGNydW1icy5vIFwKPiAgICAgICAgIGd0L2ludGVsX2NvbnRleHQubyBcCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2dlbjdfcmVuZGVyY2xlYXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2dlbjdfcmVuZGVyY2xlYXIuYwo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5hNmY1ZjE2MDJlMzMKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvZ2VuN19yZW5kZXJjbGVhci5jCj4g
QEAgLTAsMCArMSw1MzUgQEAKPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVAo+ICsv
Kgo+ICsgKiBDb3B5cmlnaHQgwqkgMjAxOSBJbnRlbCBDb3Jwb3JhdGlvbgo+ICsgKi8KPiArCj4g
KyNpbmNsdWRlICJnZW43X3JlbmRlcmNsZWFyLmgiCj4gKyNpbmNsdWRlICJpOTE1X2Rydi5oIgo+
ICsjaW5jbHVkZSAiaTkxNV91dGlscy5oIgo+ICsjaW5jbHVkZSAiaW50ZWxfZ3B1X2NvbW1hbmRz
LmgiCj4gKwo+ICsjZGVmaW5lIE1BWF9VUkJfRU5UUklFUyA2NAo+ICsjZGVmaW5lIFNUQVRFX1NJ
WkUgKDQgKiAxMDI0KQo+ICsjZGVmaW5lIEdUM19JTkxJTkVfREFUQV9ERUxBWVMgMHgxRTAwCj4g
KyNkZWZpbmUgYmF0Y2hfYWR2YW5jZShZLCBDUykgR0VNX0JVR19PTigoWSktPmVuZCAhPSAoQ1Mp
KQo+ICsKPiArLyoKPiArICogTWVkaWEgQ0IgS2VybmVsIGZvciBnZW43IGRldmljZXMKPiArICog
VE9ETzogQWRkIGNvbW1lbnRzIHRvIGtlcm5lbCwgaW5kaWNhdGluZyB3aGF0IGVhY2ggYXJyYXkg
b2YgaGV4IGRvZXMgb3IKPiArICogaW5jbHVkZSBoZWFkZXIgZmlsZSwgd2hpY2ggaGFzIGFzc2Vt
Ymx5IHNvdXJjZSBhbmQgc3VwcG9ydCBpbiBpZ3QgdG8gYmUKPiArICogYWJsZSB0byBnZW5lcmF0
ZSBrZXJuZWwgaW4gdGhpcyBzYW1lIGZvcm1hdAo+ICsgKi8KCkhhdmluZyB0aGUgb3JpZ2luYWwg
c291cmNlIGNvZGUgZm9yIHRoZSBrZXJuZWxzIGluIElHVCBpcyB0aGUKYmVzdCB3YXkgdG8gcHJv
Y2VlZC4gVGhlIGtlcm5lbHMgc2hvdWxkIGFsc28gYmUgc3BsaXQgaW50bwpzZXBhcmF0ZSBmaWxl
cyB3aGljaCBjYW4gYmUgZ2VuZXJhdGVkIGZyb20gSUdUIGFuZCBjb3BpZWQKb3ZlciBhcy1pcyBm
b3IgZWFzeSB2ZXJpZmljYXRpb24uCgpSZWdhcmRzLCBKb29uYXMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
