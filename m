Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A5ACA02B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 16:16:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3899B6E9F2;
	Thu,  3 Oct 2019 14:16:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6AB6E9F0;
 Thu,  3 Oct 2019 14:16:09 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 07:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,252,1566889200"; d="scan'208";a="205629137"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 03 Oct 2019 07:16:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2019 17:16:05 +0300
Date: Thu, 3 Oct 2019 17:16:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Sharma, Shashank" <shashank.sharma@intel.com>
Subject: Re: [PATCH v3 3/4] drm/edid: Throw away the dummy VIC 0 cea mode
Message-ID: <20191003141605.GK1208@intel.com>
References: <20190925135502.24055-1-ville.syrjala@linux.intel.com>
 <20190925135502.24055-4-ville.syrjala@linux.intel.com>
 <3cad3f33-e402-1e44-6221-9de6a8324f3e@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3cad3f33-e402-1e44-6221-9de6a8324f3e@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Hans Verkuil <hansverk@cisco.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDE6NTk6NDJQTSArMDUzMCwgU2hhcm1hLCBTaGFzaGFu
ayB3cm90ZToKPiAKPiBPbiA5LzI1LzIwMTkgNzoyNSBQTSwgVmlsbGUgU3lyamFsYSB3cm90ZToK
PiA+IEZyb206IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+
Cj4gPgo+ID4gTm93IHRoYXQgdGhlIGNlYSBtb2RlIGhhbmRsaW5nIGlzIG5vdCAxMDAlIHRpZWQg
dG8gdGhlIHNpbmdsZQo+ID4gYXJyYXkgdGhlIGR1bW15IFZJQyAwIG1vZGUgaXMgcHJldHR5IG11
Y2ggcG9pbnRsZXMuIFRocm93IGl0Cj4gPiBvdXQuCj4gPgo+ID4gQ2M6IEhhbnMgVmVya3VpbCA8
aGFuc3ZlcmtAY2lzY28uY29tPgo+ID4gQ2M6IFNoYXNoYW5rIFNoYXJtYSA8c2hhc2hhbmsuc2hh
cm1hQGludGVsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9lZGlkLmMgfCAxNCArKysrKy0tLS0tLS0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gPiBpbmRleCA5
ZjY5OTYzMjNlZmEuLjAwMDcwMDRkMzIyMSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZC5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+ID4gQEAg
LTcwOSwxMSArNzA5LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaW5pbW9kZSBleHRyYV9tb2Rl
c1tdID0gewo+ID4gICAvKgo+ID4gICAgKiBGcm9tIENFQS9DVEEtODYxIHNwZWMuCj4gPiAgICAq
Cj4gPiAtICogSW5kZXggd2l0aCBWSUMuCj4gPiArICogSW5kZXggd2l0aCBWSUMtMS4KPiAKPiBE
byB3ZSB3YW50IHRvIHJlYWxseSBkbyB0aGlzID8gVGlsbCBub3csIGR1ZSB0byBkdW1teSBWSUMs
IGluZGV4aW5nIHdhcyAKPiBwcmV0dHkgZGlyZWN0IGFzIHBlciBWSUMsIHdoaWNoIHdhcyBtYWtp
bmcgdGhlIGNvZGUgZWFzeSB0byByZWFkIGFuZCAKPiB1bmRlcnN0YW5kLiBJIHdvdWxkIHN0aWxs
IHRoaW5rIHRoYXQga2VlcGluZyB0aGUgZHVtbXkgVklDIGFuZCBhZGp1c3RpbmcgCj4gdGhlIHNp
emUgb2YgY2VhX21vZGVzXzBbXSBpbiB0aGUgc2l6ZSBmdW5jdGlvbiwgd291bGQgYmUgc29tZXRo
aW5nIAo+IG5lYXRlciB0byBkbywgZG8geW91IHRoaW5rIHNvID8KCkkgZG9uJ3Qgc2VlIHRoZSBw
b2ludCBvZiB3YXN0aW5nIHRoYXQgc3BhY2UuIFRoZSBhY2Nlc3MgaXMgbm93IGZ1bGx5CmFic3Ry
YWNlZCBzbyB5b3UgKm5ldmVyKiBpbmRleCB0aGlzIGRpcmVjdGx5LgoKPiAKPiAtIFNoYXNoYW5r
Cj4gCj4gPiAgICAqLwo+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBl
ZGlkX2NlYV9tb2Rlc18wW10gPSB7Cj4gPiAtCS8qIDAgLSBkdW1teSwgVklDcyBzdGFydCBhdCAx
ICovCj4gPiAtCXsgfSwKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
ZWRpZF9jZWFfbW9kZXNfMVtdID0gewo+ID4gICAJLyogMSAtIDY0MHg0ODBANjBIeiA0OjMgKi8K
PiA+ICAgCXsgRFJNX01PREUoIjY0MHg0ODAiLCBEUk1fTU9ERV9UWVBFX0RSSVZFUiwgMjUxNzUs
IDY0MCwgNjU2LAo+ID4gICAJCSAgIDc1MiwgODAwLCAwLCA0ODAsIDQ5MCwgNDkyLCA1MjUsIDAs
Cj4gPiBAQCAtMzIxMSwxMCArMzIwOSw4IEBAIHN0YXRpYyB1OCAqZHJtX2ZpbmRfY2VhX2V4dGVu
c2lvbihjb25zdCBzdHJ1Y3QgZWRpZCAqZWRpZCkKPiA+ICAgCj4gPiAgIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqY2VhX21vZGVfZm9yX3ZpYyh1OCB2aWMpCj4gPiAgIHsK
PiA+IC0JaWYgKCF2aWMpCj4gPiAtCQlyZXR1cm4gTlVMTDsKPiA+IC0JaWYgKHZpYyA8IEFSUkFZ
X1NJWkUoZWRpZF9jZWFfbW9kZXNfMCkpCj4gPiAtCQlyZXR1cm4gJmVkaWRfY2VhX21vZGVzXzBb
dmljXTsKPiA+ICsJaWYgKHZpYyA+PSAxICYmIHZpYyA8IDEgKyBBUlJBWV9TSVpFKGVkaWRfY2Vh
X21vZGVzXzEpKQo+ID4gKwkJcmV0dXJuICZlZGlkX2NlYV9tb2Rlc18xW3ZpYyAtIDFdOwo+ID4g
ICAJaWYgKHZpYyA+PSAxOTMgJiYgdmljIDwgMTkzICsgQVJSQVlfU0laRShlZGlkX2NlYV9tb2Rl
c18xOTMpKQo+ID4gICAJCXJldHVybiAmZWRpZF9jZWFfbW9kZXNfMTkzW3ZpYyAtIDE5M107Cj4g
PiAgIAlyZXR1cm4gTlVMTDsKPiA+IEBAIC0zMjI3LDcgKzMyMjMsNyBAQCBzdGF0aWMgdTggY2Vh
X251bV92aWNzKHZvaWQpCj4gPiAgIAo+ID4gICBzdGF0aWMgdTggY2VhX25leHRfdmljKHU4IHZp
YykKPiA+ICAgewo+ID4gLQlpZiAoKyt2aWMgPT0gQVJSQVlfU0laRShlZGlkX2NlYV9tb2Rlc18w
KSkKPiA+ICsJaWYgKCsrdmljID09IDEgKyBBUlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzEpKQo+
ID4gICAJCXZpYyA9IDE5MzsKPiA+ICAgCXJldHVybiB2aWM7Cj4gPiAgIH0KCi0tIApWaWxsZSBT
eXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
