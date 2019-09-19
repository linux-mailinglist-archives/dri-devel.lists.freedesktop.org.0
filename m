Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CFAB8105
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 20:47:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC95C6F7FE;
	Thu, 19 Sep 2019 18:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FD26F7FE;
 Thu, 19 Sep 2019 18:47:55 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2019 11:47:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,524,1559545200"; d="scan'208";a="181568169"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 19 Sep 2019 11:47:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 19 Sep 2019 21:47:49 +0300
Date: Thu, 19 Sep 2019 21:47:49 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Subject: Re: [PATCH 02/19] drm/atomic-helper: Make crtc helper funcs optional
Message-ID: <20190919184749.GW1208@intel.com>
References: <20190708125325.16576-1-ville.syrjala@linux.intel.com>
 <20190708125325.16576-3-ville.syrjala@linux.intel.com>
 <2d3861a00c99bb3aca18897b7cbfadd3930b843a.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d3861a00c99bb3aca18897b7cbfadd3930b843a.camel@intel.com>
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

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDE6NDI6MDlQTSArMDAwMCwgTGlzb3Zza2l5LCBTdGFu
aXNsYXYgd3JvdGU6Cj4gT24gTW9uLCAyMDE5LTA3LTA4IGF0IDE1OjUzICswMzAwLCBWaWxsZSBT
eXJqYWxhIHdyb3RlOgo+ID4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KPiA+IAo+ID4gQWxsb3cgZHJpdmVycyB0byBjYWxsIGRybV9hdG9taWNf
aGVscGVyX2NoZWNrX21vZGVzZXQoKSB3aXRob3V0Cj4gPiBoYXZpbmcgdGhlIGNydGMgaGVscGVy
IGZ1bmNzIHNwZWNpZmllZC4gaTkxNSBkb2Vzbid0IG5lZWQgdGhvc2UKPiA+IGFueW1vcmUuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxw
ZXIuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBSZXZpZXdlZC1ieTogU3RhbmlzbGF2IExpc292c2tpeSA8c3RhbmlzbGF2Lmxp
c292c2tpeUBpbnRlbC5jb20+CgoxLTIgcHVzaGVkIHRvIGRybS1taXNjLW5leHQuIFRoZSByZXN0
IHNoYWxsIHdhaXQgdW50aWwgdGhvc2UgdHdvCm1ha2UgdGhlIHJvdW5kdHJpcCBiYWNrIHRvIGRp
bnEuCgpUaGFua3MgZm9yIHRoZSByZXZpZXdzLgoKPiAKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fYXRvbWljX2hlbHBlci5jCj4gPiBpbmRleCBhYTE2ZWExN2ZmOWIuLmZiMmNlNjkyYWU1YiAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYwo+ID4gQEAgLTQ4MSw3ICs0
ODEsNyBAQCBtb2RlX2ZpeHVwKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkKPiA+ICAJ
CQljb250aW51ZTsKPiA+ICAKPiA+ICAJCWZ1bmNzID0gY3J0Yy0+aGVscGVyX3ByaXZhdGU7Cj4g
PiAtCQlpZiAoIWZ1bmNzLT5tb2RlX2ZpeHVwKQo+ID4gKwkJaWYgKCFmdW5jcyB8fCAhZnVuY3Mt
Pm1vZGVfZml4dXApCj4gPiAgCQkJY29udGludWU7Cj4gPiAgCj4gPiAgCQlyZXQgPSBmdW5jcy0+
bW9kZV9maXh1cChjcnRjLCAmbmV3X2NydGNfc3RhdGUtPm1vZGUsCgotLSAKVmlsbGUgU3lyasOk
bMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
