Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD54418B0B2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 10:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2976E9D0;
	Thu, 19 Mar 2020 09:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0B86E9CD;
 Thu, 19 Mar 2020 09:59:43 +0000 (UTC)
IronPort-SDR: yuiH3bbZ5uPq0ipLsjjjZoIRwjSJpOmiU9r/jaHheKPovSCh8fuRblChvAkyBNW5Zd4VIG+Hr0
 GC1Mwfe7LhEg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 02:59:42 -0700
IronPort-SDR: gOgp6Be8DFLtRCL/Gzc9PXtfaCY68nSjLOvRCi2kku1cqJVd9lFR8bfDbF1VDrpFmrOwtRnrRP
 6K1y4sX/VSmg==
X-IronPort-AV: E=Sophos;i="5.70,571,1574150400"; d="scan'208";a="418289063"
Received: from jnavarro-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.249.32.36])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 02:59:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/dp: DRM DP helper for reading Ignore MSA from DPCD
In-Reply-To: <20200318063517.3844-1-manasi.d.navare@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200318063517.3844-1-manasi.d.navare@intel.com>
Date: Thu, 19 Mar 2020 11:59:38 +0200
Message-ID: <871rpoekc5.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxNyBNYXIgMjAyMCwgTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVs
LmNvbT4gd3JvdGU6Cj4gRFAgc2luayBkZXZpY2Ugc2V0cyB0aGUgSWdub3JlIE1TQSBiaXQgaW4g
aXRzCj4gRFBfRE9XTlNUUkVBTV9QT1JUX0NPVU5UIHJlZ2lzdGVyIHRvIGluZGljYXRlIGl0cyBh
YmlsaXR5IHRvCj4gaWdub3JlIHRoZSBNU0EgdmlkZW8gdGltaW5nIHBhcmFtYXRlcnMgYW5kIGl0
cyBhYmlsaXR5IHRvIHN1cHBvcnQKPiBzZWFtbGVzcyB2aWRlbyB0aW1pbmcgY2hhbmdlIG92ZXIg
YSByYW5nZSBvZiB0aW1pbmcgZXhwb3NlZCBieQo+IERpc3BsYXlJRCBhbmQgRURJRC4KPiBUaGlz
IGlzIHJlcXVpcmVkIGZvciB0aGUgc2luayB0byBpbmRpY2F0ZSB0aGF0IGl0IGlzIEFkYXB0aXZl
IHN5bmMKPiBjYXBhYmxlLgo+Cj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5p
bnRlbC5jb20+Cj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRl
bC5jb20+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+IENj
OiBOaWNob2xhcyBLYXpsYXVza2FzIDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVsLmNvbT4KPiAt
LS0KPiAgaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIHwgOCArKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gaW5kZXggYzYxMTll
NGMxNjlhLi5jY2Q2ZTJlOTg4YjkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hl
bHBlci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gQEAgLTEzMTUsNiAr
MTMxNSwxNCBAQCBkcm1fZHBfYWx0ZXJuYXRlX3NjcmFtYmxlcl9yZXNldF9jYXAoY29uc3QgdTgg
ZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0pCj4gIAkJCURQX0FMVEVSTkFURV9TQ1JBTUJMRVJf
UkVTRVRfQ0FQOwo+ICB9Cj4gIAo+ICsvKiBJZ25vcmUgTVNBIHRpbWluZyBmb3IgQWRhcHRpdmUg
U3luYyBzdXBwb3J0IG9uIERQIDEuNCAqLwo+ICtzdGF0aWMgaW5saW5lIGJvb2wKPiArZHJtX2Rw
X3NpbmtfaXNfY2FwYWJsZV93aXRob3V0X3RpbWluZ19tc2EoY29uc3QgdTggZHBjZFtEUF9SRUNF
SVZFUl9DQVBfU0laRV0pCgpGcm9tIHRoZSBkZXBhcnRtZW50IG9mIG5pdHBpY2tzLCBpZiB5b3Ug
cmVhZCB0aGUgbmFtZSBvZiB0aGUgZnVuY3Rpb24KYWxvdWQsIHdoYXQgZG9lcyBpdCBhY3R1YWxs
eSBtZWFuPwoKSXMgc2luayBjYXBhYmxlIG9mICp3aGF0Kj8KCkJSLApKYW5pLgoKCj4gK3sKPiAr
CXJldHVybiBkcGNkW0RQX0RPV05fU1RSRUFNX1BPUlRfQ09VTlRdICYKPiArCQlEUF9NU0FfVElN
SU5HX1BBUl9JR05PUkVEOwo+ICt9Cj4gKwo+ICAvKgo+ICAgKiBEaXNwbGF5UG9ydCBBVVggY2hh
bm5lbAo+ICAgKi8KCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3Mg
Q2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
