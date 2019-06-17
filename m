Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1763F482FA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 14:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F0F8921D;
	Mon, 17 Jun 2019 12:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B0A8921D;
 Mon, 17 Jun 2019 12:50:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 05:50:58 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2019 05:50:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: Re: [RESEND FOR CI] i915: no need to check return value of
 debugfs_create functions
In-Reply-To: <20190613145229.21389-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190613145229.21389-1-jani.nikula@intel.com>
Date: Mon, 17 Jun 2019 15:53:52 +0300
Message-ID: <871rzsv0db.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMyBKdW4gMjAxOSwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4g
d3JvdGU6Cj4gRnJvbTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4KPgo+IFdoZW4gY2FsbGluZyBkZWJ1Z2ZzIGZ1bmN0aW9ucywgdGhlcmUgaXMgbm8gbmVl
ZCB0byBldmVyIGNoZWNrIHRoZQo+IHJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29y
ayBvciBub3QsIGJ1dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKPiBuZXZlciBkbyBzb21ldGhpbmcg
ZGlmZmVyZW50IGJhc2VkIG9uIHRoaXMuCj4KPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxh
QGxpbnV4LmludGVsLmNvbT4KPiBDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5A
bGludXguaW50ZWwuY29tPgo+IENjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5j
b20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5
OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IFNpZ25l
ZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+CgpBbmQgcHVzaGVk
IHRvIGRybS1pbnRlbC1uZXh0LXF1ZXVlZCwgdGhhbmtzIGZvciB0aGUgcGF0Y2guCgpCUiwKSmFu
aS4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jIHwgMjAgKysr
KysrKy0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTMg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9k
ZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMuYwo+IGluZGV4IDMy
Mzg2MzUwNDExMS4uNDEzODZjODZlYTY1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZGVidWdmcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kZWJ1
Z2ZzLmMKPiBAQCAtNDQ0MiwyMyArNDQ0MiwxNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGk5MTVf
ZGVidWdmc19maWxlcyB7Cj4gIGludCBpOTE1X2RlYnVnZnNfcmVnaXN0ZXIoc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmRldl9wcml2KQo+ICB7Cj4gIAlzdHJ1Y3QgZHJtX21pbm9yICptaW5vciA9
IGRldl9wcml2LT5kcm0ucHJpbWFyeTsKPiAtCXN0cnVjdCBkZW50cnkgKmVudDsKPiAgCWludCBp
Owo+ICAKPiAtCWVudCA9IGRlYnVnZnNfY3JlYXRlX2ZpbGUoImk5MTVfZm9yY2V3YWtlX3VzZXIi
LCBTX0lSVVNSLAo+IC0JCQkJICBtaW5vci0+ZGVidWdmc19yb290LCB0b19pOTE1KG1pbm9yLT5k
ZXYpLAo+IC0JCQkJICAmaTkxNV9mb3JjZXdha2VfZm9wcyk7Cj4gLQlpZiAoIWVudCkKPiAtCQly
ZXR1cm4gLUVOT01FTTsKPiArCWRlYnVnZnNfY3JlYXRlX2ZpbGUoImk5MTVfZm9yY2V3YWtlX3Vz
ZXIiLCBTX0lSVVNSLCBtaW5vci0+ZGVidWdmc19yb290LAo+ICsJCQkgICAgdG9faTkxNShtaW5v
ci0+ZGV2KSwgJmk5MTVfZm9yY2V3YWtlX2ZvcHMpOwo+ICAKPiAgCWZvciAoaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKGk5MTVfZGVidWdmc19maWxlcyk7IGkrKykgewo+IC0JCWVudCA9IGRlYnVnZnNf
Y3JlYXRlX2ZpbGUoaTkxNV9kZWJ1Z2ZzX2ZpbGVzW2ldLm5hbWUsCj4gLQkJCQkJICBTX0lSVUdP
IHwgU19JV1VTUiwKPiAtCQkJCQkgIG1pbm9yLT5kZWJ1Z2ZzX3Jvb3QsCj4gLQkJCQkJICB0b19p
OTE1KG1pbm9yLT5kZXYpLAo+IC0JCQkJCSAgaTkxNV9kZWJ1Z2ZzX2ZpbGVzW2ldLmZvcHMpOwo+
IC0JCWlmICghZW50KQo+IC0JCQlyZXR1cm4gLUVOT01FTTsKPiArCQlkZWJ1Z2ZzX2NyZWF0ZV9m
aWxlKGk5MTVfZGVidWdmc19maWxlc1tpXS5uYW1lLAo+ICsJCQkJICAgIFNfSVJVR08gfCBTX0lX
VVNSLAo+ICsJCQkJICAgIG1pbm9yLT5kZWJ1Z2ZzX3Jvb3QsCj4gKwkJCQkgICAgdG9faTkxNSht
aW5vci0+ZGV2KSwKPiArCQkJCSAgICBpOTE1X2RlYnVnZnNfZmlsZXNbaV0uZm9wcyk7Cj4gIAl9
Cj4gIAo+ICAJcmV0dXJuIGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcyhpOTE1X2RlYnVnZnNfbGlz
dCwKCi0tIApKYW5pIE5pa3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
