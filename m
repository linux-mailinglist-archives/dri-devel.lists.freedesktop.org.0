Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F83A04F2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 16:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF4189CC9;
	Wed, 28 Aug 2019 14:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D67689CA2;
 Wed, 28 Aug 2019 14:27:29 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 07:27:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; d="scan'208";a="192607938"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 28 Aug 2019 07:27:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 28 Aug 2019 17:27:25 +0300
Date: Wed, 28 Aug 2019 17:27:25 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Oleg Vasilev <oleg.vasilev@intel.com>
Subject: Re: [PATCH v3 4/7] drm/i915: utilize subconnector property for DP
Message-ID: <20190828142725.GC7482@intel.com>
References: <20190826132216.2823-1-oleg.vasilev@intel.com>
 <20190826132216.2823-5-oleg.vasilev@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190826132216.2823-5-oleg.vasilev@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMDQ6MjI6MTNQTSArMDMwMCwgT2xlZyBWYXNpbGV2IHdy
b3RlOgo+IFNpbmNlIERQLXNwZWNpZmljIGluZm9ybWF0aW9uIGlzIHN0b3JlZCBpbiBkcml2ZXIn
cyBzdHJ1Y3R1cmVzLCBldmVyeQo+IGRyaXZlciBuZWVkcyB0byBpbXBsZW1lbnQgc3ViY29ubmVj
dG9yIHByb3BlcnR5IGJ5IGl0c2VsZi4KPiAKPiB2MjogdXBkYXRlcyB0byBtYXRjaCBwcmV2aW91
cyBjb21taXQgY2hhbmdlcwo+IAo+IFJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVs
aWtvdkBjb2xsYWJvcmEuY29tPgo+IFRlc3RlZC1ieTogT2xlZyBWYXNpbGV2IDxvbGVnLnZhc2ls
ZXZAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE9sZWcgVmFzaWxldiA8b2xlZy52YXNpbGV2
QGludGVsLmNvbT4KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KPiBDYzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgfCA2ICsrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZHAuYwo+IGluZGV4IDZkYTZhNDg1OWYwNi4uOWM5N2VjZTgwM2ViIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+IEBAIC01NDM0LDYgKzU0MzQs
MTAgQEAgaW50ZWxfZHBfZGV0ZWN0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCj4g
IAlpZiAoc3RhdHVzICE9IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkICYmICFpbnRlbF9kcC0+
aXNfbXN0KQo+ICAJCWludGVsX2RwX3Vuc2V0X2VkaWQoaW50ZWxfZHApOwo+ICAKPiArCWRybV9k
cF9zZXRfc3ViY29ubmVjdG9yX3Byb3BlcnR5KGNvbm5lY3RvciwKPiArCQkJCQkgc3RhdHVzLAo+
ICsJCQkJCSBpbnRlbF9kcC0+ZHBjZCwKPiArCQkJCQkgaW50ZWxfZHAtPmRvd25zdHJlYW1fcG9y
dHMpOwo+ICAJcmV0dXJuIHN0YXR1czsKPiAgfQo+ICAKPiBAQCAtNjMzMiw2ICs2MzM2LDggQEAg
aW50ZWxfZHBfYWRkX3Byb3BlcnRpZXMoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwgc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3QKPiAgCXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZf
cHJpdiA9IHRvX2k5MTUoY29ubmVjdG9yLT5kZXYpOwo+ICAJZW51bSBwb3J0IHBvcnQgPSBkcF90
b19kaWdfcG9ydChpbnRlbF9kcCktPmJhc2UucG9ydDsKPiAgCj4gKwlkcm1fbW9kZV9hZGRfZHBf
c3ViY29ubmVjdG9yX3Byb3BlcnR5KGNvbm5lY3Rvcik7CgpNYXliZSBza2lwIHRoaXMgZm9yIGVE
UD8KCj4gKwo+ICAJaWYgKCFJU19HNFgoZGV2X3ByaXYpICYmIHBvcnQgIT0gUE9SVF9BKQo+ICAJ
CWludGVsX2F0dGFjaF9mb3JjZV9hdWRpb19wcm9wZXJ0eShjb25uZWN0b3IpOwo+ICAKPiAtLSAK
PiAyLjIzLjAKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
