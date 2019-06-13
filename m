Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 221494375D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 16:50:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ED0899A7;
	Thu, 13 Jun 2019 14:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C298999E;
 Thu, 13 Jun 2019 14:50:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 07:50:45 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2019 07:50:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] i915: no need to check return value of debugfs_create
 functions
In-Reply-To: <20190613133356.GA6634@kroah.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190613133356.GA6634@kroah.com>
Date: Thu, 13 Jun 2019 17:53:41 +0300
Message-ID: <87h88twn7u.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMyBKdW4gMjAxOSwgR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz4gd3JvdGU6Cj4gV2hlbiBjYWxsaW5nIGRlYnVnZnMgZnVuY3Rpb25zLCB0aGVy
ZSBpcyBubyBuZWVkIHRvIGV2ZXIgY2hlY2sgdGhlCj4gcmV0dXJuIHZhbHVlLiAgVGhlIGZ1bmN0
aW9uIGNhbiB3b3JrIG9yIG5vdCwgYnV0IHRoZSBjb2RlIGxvZ2ljIHNob3VsZAo+IG5ldmVyIGRv
IHNvbWV0aGluZyBkaWZmZXJlbnQgYmFzZWQgb24gdGhpcy4KPgo+IENjOiBKYW5pIE5pa3VsYSA8
amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPgo+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25h
cy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52
aXZpQGludGVsLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IGludGVsLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+CgpUaGFua3MsIGxvb2tzIGdvb2QsIGJ1dCBmb3Igc29tZSByZWFzb24gdGhpcyB3YXMgbm90
IHBpY2tlZCB1cCBieSBvdXIKQ0kuIEkgcmVzZW50IGl0IHdpdGggaG9wZXMgd2UnbGwgZ2V0IHNv
bWUgdGVzdCByZXN1bHRzIHRvby4KCkJSLApKYW5pLgoKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfZGVidWdmcy5jIHwgMjAgKysrKysrKy0tLS0tLS0tLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X2RlYnVnZnMuYwo+IGluZGV4IDU4MjNmZmIxNzgyMS4uYmQ1Y2Y4ZWMyNTRkIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kZWJ1Z2ZzLmMKPiBAQCAtNDY0OCwyMyArNDY0OCwx
NyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGk5MTVfZGVidWdmc19maWxlcyB7Cj4gIGludCBpOTE1
X2RlYnVnZnNfcmVnaXN0ZXIoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQo+ICB7
Cj4gIAlzdHJ1Y3QgZHJtX21pbm9yICptaW5vciA9IGRldl9wcml2LT5kcm0ucHJpbWFyeTsKPiAt
CXN0cnVjdCBkZW50cnkgKmVudDsKPiAgCWludCBpOwo+ICAKPiAtCWVudCA9IGRlYnVnZnNfY3Jl
YXRlX2ZpbGUoImk5MTVfZm9yY2V3YWtlX3VzZXIiLCBTX0lSVVNSLAo+IC0JCQkJICBtaW5vci0+
ZGVidWdmc19yb290LCB0b19pOTE1KG1pbm9yLT5kZXYpLAo+IC0JCQkJICAmaTkxNV9mb3JjZXdh
a2VfZm9wcyk7Cj4gLQlpZiAoIWVudCkKPiAtCQlyZXR1cm4gLUVOT01FTTsKPiArCWRlYnVnZnNf
Y3JlYXRlX2ZpbGUoImk5MTVfZm9yY2V3YWtlX3VzZXIiLCBTX0lSVVNSLCBtaW5vci0+ZGVidWdm
c19yb290LAo+ICsJCQkgICAgdG9faTkxNShtaW5vci0+ZGV2KSwgJmk5MTVfZm9yY2V3YWtlX2Zv
cHMpOwo+ICAKPiAgCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGk5MTVfZGVidWdmc19maWxl
cyk7IGkrKykgewo+IC0JCWVudCA9IGRlYnVnZnNfY3JlYXRlX2ZpbGUoaTkxNV9kZWJ1Z2ZzX2Zp
bGVzW2ldLm5hbWUsCj4gLQkJCQkJICBTX0lSVUdPIHwgU19JV1VTUiwKPiAtCQkJCQkgIG1pbm9y
LT5kZWJ1Z2ZzX3Jvb3QsCj4gLQkJCQkJICB0b19pOTE1KG1pbm9yLT5kZXYpLAo+IC0JCQkJCSAg
aTkxNV9kZWJ1Z2ZzX2ZpbGVzW2ldLmZvcHMpOwo+IC0JCWlmICghZW50KQo+IC0JCQlyZXR1cm4g
LUVOT01FTTsKPiArCQlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKGk5MTVfZGVidWdmc19maWxlc1tpXS5u
YW1lLAo+ICsJCQkJICAgIFNfSVJVR08gfCBTX0lXVVNSLAo+ICsJCQkJICAgIG1pbm9yLT5kZWJ1
Z2ZzX3Jvb3QsCj4gKwkJCQkgICAgdG9faTkxNShtaW5vci0+ZGV2KSwKPiArCQkJCSAgICBpOTE1
X2RlYnVnZnNfZmlsZXNbaV0uZm9wcyk7Cj4gIAl9Cj4gIAo+ICAJcmV0dXJuIGRybV9kZWJ1Z2Zz
X2NyZWF0ZV9maWxlcyhpOTE1X2RlYnVnZnNfbGlzdCwKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwg
T3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
