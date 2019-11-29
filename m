Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1A810D440
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 11:36:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E296E8CF;
	Fri, 29 Nov 2019 10:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EAF6E8CF;
 Fri, 29 Nov 2019 10:35:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:35:53 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="212284321"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:35:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH v2 12/14] media: constify fb ops across all
 drivers
In-Reply-To: <9cfc1a171d12a52dfbd5508d737681f2d89d21df.1575022735.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1575022735.git.jani.nikula@intel.com>
 <9cfc1a171d12a52dfbd5508d737681f2d89d21df.1575022735.git.jani.nikula@intel.com>
Date: Fri, 29 Nov 2019 12:35:44 +0200
Message-ID: <87h82nkm0v.fsf@intel.com>
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
Cc: Andy Walls <awalls@md.metrocast.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 ivtv-devel@ivtvdriver.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyOSBOb3YgMjAxOSwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4g
d3JvdGU6Cj4gTm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBpcyBj
b25zdCwgd2UgY2FuIHN0YXJ0Cj4gbWFraW5nIHRoZSBvcHMgY29uc3QgYXMgd2VsbC4KPgo+IFJl
bW92ZSB0aGUgcmVkdW5kYW50IGZib3BzIGFzc2lnbm1lbnRzIHdoaWxlIGF0IGl0Lgo+Cj4gdjI6
Cj4gLSBhY3R1YWxseSBhZGQgY29uc3QgaW4gdml2aWQKPiAtIGZpeCB0eXBvIChDaHJpc3RvcGhl
IGRlIERpbmVjaGluKQo+Cj4gQ2M6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWxAeHM0YWxsLm5sPgo+
IENjOiBBbmR5IFdhbGxzIDxhd2FsbHNAbWQubWV0cm9jYXN0Lm5ldD4KPiBDYzogbGludXgtbWVk
aWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGl2dHYtZGV2ZWxAaXZ0dmRyaXZlci5vcmcKPiBSZXZp
ZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBTaWduZWQt
b2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgo+Cj4gZml4dXAtdG8t
bWVkaWEKClJlYmFzZSBhcnRlZmFjdCwgdG8gYmUgcmVtb3ZlZCBiZWZvcmUgYXBwbHlpbmcuLi4K
CkJSLApKYW5pLgoKPiAtLS0KPiAgZHJpdmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2ZmIuYyAgICAg
ICAgICB8IDMgKy0tCj4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdml2aWQvdml2aWQtb3NkLmMg
fCAzICstLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHZmYi5jIGIvZHJp
dmVycy9tZWRpYS9wY2kvaXZ0di9pdnR2ZmIuYwo+IGluZGV4IDk1YTU2Y2NlOWI2NS4uZjI5MjJi
NTU0YjA5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGNpL2l2dHYvaXZ0dmZiLmMKPiAr
KysgYi9kcml2ZXJzL21lZGlhL3BjaS9pdnR2L2l2dHZmYi5jCj4gQEAgLTkyNSw3ICs5MjUsNyBA
QCBzdGF0aWMgaW50IGl2dHZmYl9ibGFuayhpbnQgYmxhbmtfbW9kZSwgc3RydWN0IGZiX2luZm8g
KmluZm8pCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiAtc3RhdGljIHN0cnVjdCBmYl9vcHMgaXZ0
dmZiX29wcyA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBmYl9vcHMgaXZ0dmZiX29wcyA9IHsK
PiAgCS5vd25lciA9IFRISVNfTU9EVUxFLAo+ICAJLmZiX3dyaXRlICAgICAgID0gaXZ0dmZiX3dy
aXRlLAo+ICAJLmZiX2NoZWNrX3ZhciAgID0gaXZ0dmZiX2NoZWNrX3ZhciwKPiBAQCAtMTA0OSw3
ICsxMDQ5LDYgQEAgc3RhdGljIGludCBpdnR2ZmJfaW5pdF92aWRtb2RlKHN0cnVjdCBpdnR2ICpp
dHYpCj4gIAo+ICAJb2ktPml2dHZmYl9pbmZvLm5vZGUgPSAtMTsKPiAgCW9pLT5pdnR2ZmJfaW5m
by5mbGFncyA9IEZCSU5GT19GTEFHX0RFRkFVTFQ7Cj4gLQlvaS0+aXZ0dmZiX2luZm8uZmJvcHMg
PSAmaXZ0dmZiX29wczsKPiAgCW9pLT5pdnR2ZmJfaW5mby5wYXIgPSBpdHY7Cj4gIAlvaS0+aXZ0
dmZiX2luZm8udmFyID0gb2ktPml2dHZmYl9kZWZpbmVkOwo+ICAJb2ktPml2dHZmYl9pbmZvLmZp
eCA9IG9pLT5pdnR2ZmJfZml4Owo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L3ZpdmlkL3ZpdmlkLW9zZC5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92aXZpZC92aXZpZC1v
c2QuYwo+IGluZGV4IGYyZTc4OWJkZjRhNi4uZmJhZWM4YWNjMTYxIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vdml2aWQvdml2aWQtb3NkLmMKPiArKysgYi9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL3ZpdmlkL3ZpdmlkLW9zZC5jCj4gQEAgLTI0NCw3ICsyNDQsNyBAQCBzdGF0
aWMgaW50IHZpdmlkX2ZiX2JsYW5rKGludCBibGFua19tb2RlLCBzdHJ1Y3QgZmJfaW5mbyAqaW5m
bykKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+IC1zdGF0aWMgc3RydWN0IGZiX29wcyB2aXZpZF9m
Yl9vcHMgPSB7Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmJfb3BzIHZpdmlkX2ZiX29wcyA9IHsK
PiAgCS5vd25lciA9IFRISVNfTU9EVUxFLAo+ICAJLmZiX2NoZWNrX3ZhciAgID0gdml2aWRfZmJf
Y2hlY2tfdmFyLAo+ICAJLmZiX3NldF9wYXIgICAgID0gdml2aWRfZmJfc2V0X3BhciwKPiBAQCAt
MzExLDcgKzMxMSw2IEBAIHN0YXRpYyBpbnQgdml2aWRfZmJfaW5pdF92aWRtb2RlKHN0cnVjdCB2
aXZpZF9kZXYgKmRldikKPiAgCj4gIAlkZXYtPmZiX2luZm8ubm9kZSA9IC0xOwo+ICAJZGV2LT5m
Yl9pbmZvLmZsYWdzID0gRkJJTkZPX0ZMQUdfREVGQVVMVDsKPiAtCWRldi0+ZmJfaW5mby5mYm9w
cyA9ICZ2aXZpZF9mYl9vcHM7Cj4gIAlkZXYtPmZiX2luZm8ucGFyID0gZGV2Owo+ICAJZGV2LT5m
Yl9pbmZvLnZhciA9IGRldi0+ZmJfZGVmaW5lZDsKPiAgCWRldi0+ZmJfaW5mby5maXggPSBkZXYt
PmZiX2ZpeDsKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2Vu
dGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
