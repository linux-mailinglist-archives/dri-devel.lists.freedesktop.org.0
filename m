Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D07E436924C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 14:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0366EB8F;
	Fri, 23 Apr 2021 12:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032C96EB8B;
 Fri, 23 Apr 2021 12:41:28 +0000 (UTC)
IronPort-SDR: 5OBNtVXUlNTAsAuo5p+lnsY0B9jhEHvbk2q/Y8o2DMDiafWKH+rVfoco2wdOYoSi2fi7F2svFr
 0uLtwybMM2Sw==
X-IronPort-AV: E=McAfee;i="6200,9189,9962"; a="175546117"
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; d="scan'208";a="175546117"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 05:41:28 -0700
IronPort-SDR: QPHLW8jG5xCo83/70ShTBOMYCGWqTGw2QkEAqFlaekBZ1w5gwgawbZM/mw7M8sIz0e302n+OVA
 0polxrY4qHEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,245,1613462400"; d="scan'208";a="386380029"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 23 Apr 2021 05:41:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 23 Apr 2021 15:41:23 +0300
Date: Fri, 23 Apr 2021 15:41:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v2] drm/i915: Invoke BXT _DSM to enable MUX on HP
 Workstation laptops
Message-ID: <YILAc6EhoWWhENq8@intel.com>
References: <20210423044700.247359-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423044700.247359-1-kai.heng.feng@canonical.com>
X-Patchwork-Hint: comment
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMjMsIDIwMjEgYXQgMTI6NDY6NTRQTSArMDgwMCwgS2FpLUhlbmcgRmVuZyB3
cm90ZToKPiBPbiBIUCBGdXJ5IEc3IFdvcmtzdGF0aW9ucywgZ3JhcGhpY3Mgb3V0cHV0IGlzIHJl
LXJvdXRlZCBmcm9tIEludGVsIEdGWAo+IHRvIGRpc2NyZXRlIEdGWCBhZnRlciBTMy4gVGhpcyBp
cyBub3QgZGVzaXJhYmxlLCBiZWNhdXNlIHVzZXJzcGFjZSB3aWxsCj4gdHJlYXQgY29ubmVjdGVk
IGRpc3BsYXkgYXMgYSBuZXcgb25lLCBsb3NpbmcgZGlzcGxheSBzZXR0aW5ncy4KPiAKPiBUaGUg
ZXhwZWN0ZWQgYmVoYXZpb3IgaXMgdG8gbGV0IGRpc2NyZXRlIEdGWCBkcml2ZXMgYWxsIGV4dGVy
bmFsCj4gZGlzcGxheXMuCj4gCj4gVGhlIHBsYXRmb3JtIGluIHF1ZXN0aW9uIHVzZXMgQUNQSSBt
ZXRob2QgXF9TQi5QQ0kwLkhHTUUgdG8gZW5hYmxlIE1VWC4KPiBUaGUgbWV0aG9kIGlzIGluc2lk
ZSB0aGUgQlhUIF9EU00sIHNvIGFkZCB0aGUgX0RTTSBhbmQgY2FsbCBpdAo+IGFjY29yZGluZ2x5
Lgo+IAo+IEkgYWxzbyB0ZXN0ZWQgc29tZSBNVVgtbGVzcyBhbmQgaUdQVSBvbmx5IGxhcHRvcHMg
d2l0aCB0aGUgQlhUIF9EU00sIG5vCj4gcmVncmVzc2lvbiB3YXMgZm91bmQuCj4gCj4gdjI6Cj4g
IC0gRm9yd2FyZCBkZWNsYXJlIHN0cnVjdCBwY2lfZGV2Lgo+IAo+IENsb3NlczogaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pbnRlbC8tL2lzc3Vlcy8zMTEzCj4gUmVmZXJlbmNl
czogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvaW50ZWwtZ2Z4LzE0NjAwNDA3MzItMzE0MTctNC1n
aXQtc2VuZC1lbWFpbC1hbmltZXNoLm1hbm5hQGludGVsLmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBL
YWktSGVuZyBGZW5nIDxrYWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWNwaS5jIHwgMTcgKysrKysrKysrKysrKysr
KysKPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hY3BpLmggfCAgMyArKysK
PiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuYyAgICAgICAgICAgfCAgNSArKysrKwo+
ICAzIGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hY3BpLmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2FjcGkuYwo+IGluZGV4IDgzM2QwYzFiZTRmMS4uYzdiNTdjMjJk
Y2UzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWNw
aS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hY3BpLmMKPiBA
QCAtMTQsMTEgKzE0LDE2IEBACj4gIAo+ICAjZGVmaW5lIElOVEVMX0RTTV9SRVZJU0lPTl9JRCAx
IC8qIEZvciBDYWxwZWxsYSBhbnl3YXkuLi4gKi8KPiAgI2RlZmluZSBJTlRFTF9EU01fRk5fUExB
VEZPUk1fTVVYX0lORk8gMSAvKiBObyBhcmdzICovCj4gKyNkZWZpbmUgSU5URUxfRFNNX0ZOX1BM
QVRGT1JNX0JYVF9NVVhfSU5GTyAwIC8qIE5vIGFyZ3MgKi8KPiAgCj4gIHN0YXRpYyBjb25zdCBn
dWlkX3QgaW50ZWxfZHNtX2d1aWQgPQo+ICAJR1VJRF9JTklUKDB4N2VkODczZDMsIDB4YzJkMCwg
MHg0ZTRmLAo+ICAJCSAgMHhhOCwgMHg1NCwgMHgwZiwgMHgxMywgMHgxNywgMHhiMCwgMHgxYywg
MHgyYyk7Cj4gIAo+ICtzdGF0aWMgY29uc3QgZ3VpZF90IGludGVsX2J4dF9kc21fZ3VpZCA9Cj4g
KwlHVUlEX0lOSVQoMHgzZTViNDFjNiwgMHhlYjFkLCAweDQyNjAsCj4gKwkJICAweDlkLCAweDE1
LCAweGM3LCAweDFmLCAweGJhLCAweGRhLCAweGU0LCAweDE0KTsKPiArCgpJIHRoaW5rIHRoaXMg
ZHNtIGlzIGp1c3Qgc3VwcG9zZWQgdG8gYmUgbW9yZSBvciBsZXNzIGFuCmFsdGVybmF0aXZlIHRv
IHRoZSBvcHJlZ2lvbiBTQ0kgc3R1ZmYuIFdoeSB0aGVyZSBhcmUgdHdvCndheXMgdG8gZG8gdGhl
IHNhbWUgdGhpbmdzIEkgaGF2ZSBubyBpZGVhLiBUaGUgb3ByZWdpb24Kc3BlYyBkb2VzIG5vdCB0
ZWxsIHVzIHN1Y2ggbXVuZGFuZSBkZXRhaWxzLgoKSXQncyBhbHNvIG5vdCBkb2N1bWVudGVkIHRv
IGRvIGFueXRoaW5nIGV4Y2VwdCBsaXN0IHRoZQpzdXBwb3J0ZWQgZnVuY3Rpb25zOgoiR2V0IEJJ
T1MgRGF0YSBGdW5jdGlvbnMgU3VwcG9ydGVkIOKAnEZ1bmN0aW9uICMwIgogVGhpcyBmdW5jdGlv
biBjYW4gYmUgY2FsbGVkIHRvIGRpc2NvdmVyIHdoaWNoIOKAnF9EU03igJ0gRnVuY3Rpb25zIGFy
ZQogc3VwcG9ydGVkLiBJdCBtYXkgb25seSByZXR1cm4gc3VjY2VzcyBpZiB0aGUgcmV0dXJuIHZh
bHVlIGFjY3VyYXRlbHkKIGxpc3RzIHN1cHBvcnRlZCBGdW5jdGlvbnMuIgoKQnV0IHdoYXQgeW91
J3JlIGFwcGFyZW50bHkgc2F5aW5nIGlzIHRoYXQgY2FsbGluZyB0aGlzIGNoYW5nZXMKdGhlIGJl
aGF2aW91ciBvZiB0aGUgc3lzdGVtIHNvbWVob3c/IFRoYXQgaXMgdHJvdWJsaW5nLgoKLS0gClZp
bGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
