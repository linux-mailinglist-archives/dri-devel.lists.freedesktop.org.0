Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E84A68F6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 14:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9183089320;
	Tue,  3 Sep 2019 12:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D54889320
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 12:51:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 05:51:44 -0700
X-IronPort-AV: E=Sophos;i="5.64,463,1559545200"; d="scan'208";a="173194693"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 05:51:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, Maxime
 Ripard <mripard@kernel.org>
Subject: Re: [PATCH 3/4] drm/modes: Introduce a whitelist for the named modes
In-Reply-To: <5597537.Wd4mHnyQvH@jernej-laptop>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190827115850.25731-1-mripard@kernel.org>
 <20190827115850.25731-3-mripard@kernel.org>
 <5597537.Wd4mHnyQvH@jernej-laptop>
Date: Tue, 03 Sep 2019 15:51:38 +0300
Message-ID: <87k1ap4k6d.fsf@intel.com>
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
Cc: thomas.graichen@googlemail.com, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyOSBBdWcgMjAxOSwgSmVybmVqIMWga3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFp
bC5jb20+IHdyb3RlOgo+IEhpIQo+Cj4gRG5lIHRvcmVrLCAyNy4gYXZndXN0IDIwMTkgb2IgMTM6
NTg6NDkgQ0VTVCBqZSBNYXhpbWUgUmlwYXJkIG5hcGlzYWwoYSk6Cj4+IEZyb206IE1heGltZSBS
aXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4+IAo+PiBUaGUgbmFtZWQgbW9kZXMg
c3VwcG9ydCBoYXMgaW50cm9kdWNlZCBhIG51bWJlciBvZiBnbGl0Y2hlcyB0aGF0IHdlcmUgaW4K
Pj4gcGFydCBkdWUgdG8gdGhlIGZhY3QgdGhhdCB0aGUgcGFyc2VyIHdpbGwgdGFrZSBhbnkgc3Ry
aW5nIGFzIGEgbmFtZWQgbW9kZS4KPj4gCj4+IFNpbmNlIHdlIHNob3VsZG4ndCBoYXZlIGEgbG90
IG9mIG9wdGlvbnMgdGhlcmUgKGFuZCB0aGV5IHNob3VsZCBiZSBwcmV0dHkKPj4gc3RhbmRhcmQp
LCBsZXQncyBpbnRyb2R1Y2UgYSB3aGl0ZWxpc3Qgb2YgdGhlIGF2YWlsYWJsZSBuYW1lZCBtb2Rl
cyBzbyB0aGF0Cj4+IHRoZSBrZXJuZWwgY2FuIGRpZmZlcmVudGlhdGUgYmV0d2VlbiBhIHBvb3Js
eSBmb3JtZWQgY29tbWFuZCBsaW5lIGFuZCBhCj4+IG5hbWVkIG1vZGUuCj4+IAo+PiBTaWduZWQt
b2ZmLWJ5OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+PiAtLS0K
Pj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyB8IDIwICsrKysrKysrKysrKysrKysrKysr
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQo+PiAKPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMu
Ywo+PiBpbmRleCBlYTdlNmM4YzgzMTguLjk4ODc5N2Q4MDgwYSAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9k
ZXMuYwo+PiBAQCAtMTY3Nyw2ICsxNjc3LDIyIEBAIHN0YXRpYyBpbnQgZHJtX21vZGVfcGFyc2Vf
Y21kbGluZV9vcHRpb25zKGNoYXIgKnN0ciwKPj4gc2l6ZV90IGxlbiwgcmV0dXJuIDA7Cj4+ICB9
Cj4+IAo+PiArY29uc3QgY2hhciAqZHJtX25hbWVkX21vZGVzX3doaXRlbGlzdFtdID0gewo+PiAr
CSJOVFNDIiwKPj4gKwkiUEFMIiwKPj4gK307Cj4KPiBUaGF0IGFycmF5IHNob3VsZCBiZSBzdGF0
aWMuIFdpdGggdGhhdCBmaXhlZDoKCkFuZCBhZGQgbW9yZSBjb25zdCBmb3IgZ29vZCBtZWFzdXJl
OgoKc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBkcm1fbmFtZWRfbW9kZXNfd2hpdGVsaXN0W10g
PSB7CgpCUiwKSmFuaS4KCj4KPiBSZXZpZXdlZC1ieTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5z
a3JhYmVjQHNpb2wubmV0Pgo+Cj4gQmVzdCByZWdhcmRzLAo+IEplcm5lago+Cj4+ICsKPj4gK3N0
YXRpYyBib29sIGRybV9uYW1lZF9tb2RlX2lzX2luX3doaXRlbGlzdChjb25zdCBjaGFyICptb2Rl
LCB1bnNpZ25lZCBpbnQKPj4gc2l6ZSkgK3sKPj4gKwlpbnQgaTsKPj4gKwo+PiArCWZvciAoaSA9
IDA7IGkgPCBBUlJBWV9TSVpFKGRybV9uYW1lZF9tb2Rlc193aGl0ZWxpc3QpOyBpKyspCj4+ICsJ
CWlmICghc3RybmNtcChtb2RlLCBkcm1fbmFtZWRfbW9kZXNfd2hpdGVsaXN0W2ldLCBzaXplKSkK
Pj4gKwkJCXJldHVybiB0cnVlOwo+PiArCj4+ICsJcmV0dXJuIGZhbHNlOwo+PiArfQo+PiArCj4+
ICAvKioKPj4gICAqIGRybV9tb2RlX3BhcnNlX2NvbW1hbmRfbGluZV9mb3JfY29ubmVjdG9yIC0g
cGFyc2UgY29tbWFuZCBsaW5lIG1vZGVsaW5lCj4+IGZvciBjb25uZWN0b3IgKiBAbW9kZV9vcHRp
b246IG9wdGlvbmFsIHBlciBjb25uZWN0b3IgbW9kZSBvcHRpb24KPj4gQEAgLTE3OTQsNiArMTgx
MCwxMCBAQCBib29sIGRybV9tb2RlX3BhcnNlX2NvbW1hbmRfbGluZV9mb3JfY29ubmVjdG9yKGNv
bnN0Cj4+IGNoYXIgKm1vZGVfb3B0aW9uLCBpZiAobmFtZWRfbW9kZSkgewo+PiAgCQlpZiAobW9k
ZV9lbmQgKyAxID4gRFJNX0RJU1BMQVlfTU9ERV9MRU4pCj4+ICAJCQlyZXR1cm4gZmFsc2U7Cj4+
ICsKPj4gKwkJaWYgKCFkcm1fbmFtZWRfbW9kZV9pc19pbl93aGl0ZWxpc3QobmFtZSwgbW9kZV9l
bmQpKQo+PiArCQkJcmV0dXJuIGZhbHNlOwo+PiArCj4+ICAJCXN0cnNjcHkobW9kZS0+bmFtZSwg
bmFtZSwgbW9kZV9lbmQgKyAxKTsKPj4gIAl9IGVsc2Ugewo+PiAgCQlyZXQgPSBkcm1fbW9kZV9w
YXJzZV9jbWRsaW5lX3Jlc19tb2RlKG5hbWUsIG1vZGVfZW5kLAo+Cj4KPgo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKSmFuaSBOaWt1
bGEsIEludGVsIE9wZW4gU291cmNlIEdyYXBoaWNzIENlbnRlcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
