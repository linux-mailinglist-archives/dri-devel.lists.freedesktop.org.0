Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F699AA0BA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 13:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0D66E05F;
	Thu,  5 Sep 2019 11:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8176E05F;
 Thu,  5 Sep 2019 11:00:21 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Sep 2019 04:00:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; d="scan'208";a="173905257"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 05 Sep 2019 04:00:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 05 Sep 2019 14:00:17 +0300
Date: Thu, 5 Sep 2019 14:00:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Subject: Re: [PATCH 02/19] drm/atomic-helper: Make crtc helper funcs optional
Message-ID: <20190905110017.GG7482@intel.com>
References: <20190708125325.16576-1-ville.syrjala@linux.intel.com>
 <20190708125325.16576-3-ville.syrjala@linux.intel.com>
 <c6a71b0cc71d4be43e2e650a95ec2e7259e7e61c.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6a71b0cc71d4be43e2e650a95ec2e7259e7e61c.camel@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMDUsIDIwMTkgYXQgMDY6Mzg6MzBBTSArMDAwMCwgTGlzb3Zza2l5LCBTdGFu
aXNsYXYgd3JvdGU6Cj4gT24gTW9uLCAyMDE5LTA3LTA4IGF0IDE1OjUzICswMzAwLCBWaWxsZSBT
eXJqYWxhIHdyb3RlOgo+ID4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KPiA+IAo+ID4gQWxsb3cgZHJpdmVycyB0byBjYWxsIGRybV9hdG9taWNf
aGVscGVyX2NoZWNrX21vZGVzZXQoKSB3aXRob3V0Cj4gPiBoYXZpbmcgdGhlIGNydGMgaGVscGVy
IGZ1bmNzIHNwZWNpZmllZC4gaTkxNSBkb2Vzbid0IG5lZWQgdGhvc2UKPiA+IGFueW1vcmUuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxw
ZXIuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hl
bHBlci5jCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCj4gPiBpbmRl
eCBhYTE2ZWExN2ZmOWIuLmZiMmNlNjkyYWU1YiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0
b21pY19oZWxwZXIuYwo+ID4gQEAgLTQ4MSw3ICs0ODEsNyBAQCBtb2RlX2ZpeHVwKHN0cnVjdCBk
cm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKPiA+ICAJCQljb250aW51ZTsKPiA+ICAKPiA+ICAJCWZ1
bmNzID0gY3J0Yy0+aGVscGVyX3ByaXZhdGU7Cj4gPiAtCQlpZiAoIWZ1bmNzLT5tb2RlX2ZpeHVw
KQo+ID4gKwkJaWYgKCFmdW5jcyB8fCAhZnVuY3MtPm1vZGVfZml4dXApCj4gPiAgCQkJY29udGlu
dWU7Cj4gPiAgCj4gPiAgCQlyZXQgPSBmdW5jcy0+bW9kZV9maXh1cChjcnRjLCAmbmV3X2NydGNf
c3RhdGUtPm1vZGUsCj4gCj4gQnV0IGl0IHN0aWxsIHdvbid0IGFsbG93IHRvIGNhbGwgYW55dGhp
bmcgZnJvbSBoZXJlLCBpZiBubyBmdW5jcyBvciBubwo+IG1vZGVfZml4dXAgaXMgc3BlY2lmaWVk
LiBBbnl3YXkgc2VlbXMgdG8gYmUgYSBnb29kIGlkZWEgdG8gY2hlY2sgYm90aAo+IGZ1bmNzIG9y
IGZ1bmNzLT5tb2RlX2ZpeHVwIGJlaW5nIE5VTEwsIGp1c3QgZG9uJ3QgZ2V0IHRoZSBjb21taXQK
PiBtZXNzYWdlIGEgYml0IDopCgpOVUxMLT5tb2RlX2ZpeHVwIHdpbGwgb29wcy4KCi0tIApWaWxs
ZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
