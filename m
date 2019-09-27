Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50583C0D56
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 23:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718F76E282;
	Fri, 27 Sep 2019 21:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19ACB6E282
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2019 21:36:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 14:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,557,1559545200"; d="scan'208";a="273959723"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com) ([10.54.75.49])
 by orsmga001.jf.intel.com with ESMTP; 27 Sep 2019 14:36:51 -0700
Date: Fri, 27 Sep 2019 14:38:25 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 4/4] drm/edid: Make sure the CEA mode arrays have the
 correct amount of modes
Message-ID: <20190927213825.GC10807@intel.com>
References: <20190925135502.24055-1-ville.syrjala@linux.intel.com>
 <20190925135502.24055-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925135502.24055-5-ville.syrjala@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Hans Verkuil <hansverk@cisco.com>, intel-gfc@freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDQ6NTU6MDJQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IFdlIGRlcGVuZCBvbiBhIHNwZWNpZmljIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHRo
ZSBWSUMgbnVtYmVyIGFuZCB0aGUKPiBpbmRleCBpbiB0aGUgQ0VBIG1vZGUgYXJyYXlzLiBBc3Nl
cnQgdGhhdCB0aGUgYXJyYXlzIGhhdmUgdGhlIGV4Y3BlY3RlZAoKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5leHBlY3RlZAo+
IHNpemUgdG8gbWFrZSBzdXJlIHdlJ3ZlIG5vdCBhY2NpZGVudGFsbHkgbGVmdCBob2xlcyBpbiB0
aGVtLgo+IAo+IHYyOiBQaW1wIHRoZSBCVUlMRF9CVUdfT04oKXMKPiAKPiBDYzogSGFucyBWZXJr
dWlsIDxoYW5zdmVya0BjaXNjby5jb20+Cj4gQ2M6IFNoYXNoYW5rIFNoYXJtYSA8c2hhc2hhbmsu
c2hhcm1hQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxl
LnN5cmphbGFAbGludXguaW50ZWwuY29tPgoKV2l0aCB0aGUgdHlwbyBmaXhlZCwKClJldmlld2Vk
LWJ5OiBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwuY29tPgoKTWFuYXNpCgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+IGluZGV4IDAwMDcwMDRkMzIy
MS4uMDZjYWM4ZTJhZmMyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiBAQCAtMzIwOSw2ICszMjA5LDkg
QEAgc3RhdGljIHU4ICpkcm1fZmluZF9jZWFfZXh0ZW5zaW9uKGNvbnN0IHN0cnVjdCBlZGlkICpl
ZGlkKQo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpjZWFfbW9k
ZV9mb3JfdmljKHU4IHZpYykKPiAgewo+ICsJQlVJTERfQlVHX09OKDEgKyBBUlJBWV9TSVpFKGVk
aWRfY2VhX21vZGVzXzEpIC0gMSAhPSAxMjcpOwo+ICsJQlVJTERfQlVHX09OKDE5MyArIEFSUkFZ
X1NJWkUoZWRpZF9jZWFfbW9kZXNfMTkzKSAtIDEgIT0gMjE5KTsKPiArCj4gIAlpZiAodmljID49
IDEgJiYgdmljIDwgMSArIEFSUkFZX1NJWkUoZWRpZF9jZWFfbW9kZXNfMSkpCj4gIAkJcmV0dXJu
ICZlZGlkX2NlYV9tb2Rlc18xW3ZpYyAtIDFdOwo+ICAJaWYgKHZpYyA+PSAxOTMgJiYgdmljIDwg
MTkzICsgQVJSQVlfU0laRShlZGlkX2NlYV9tb2Rlc18xOTMpKQo+IC0tIAo+IDIuMjEuMAo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
