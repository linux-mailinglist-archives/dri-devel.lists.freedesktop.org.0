Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C0110AD95
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 11:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C0D6E503;
	Wed, 27 Nov 2019 10:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4636E503
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 10:29:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 02:29:17 -0800
X-IronPort-AV: E=Sophos;i="5.69,249,1571727600"; d="scan'208";a="199142767"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 02:29:13 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: allen <allen.chen@ite.com.tw>
Subject: Re: [PATCH] drm/edid: fixup EDID 1.3 and 1.4 judge reduced-blanking
 timings logic
In-Reply-To: <1574761572-26585-1-git-send-email-allen.chen@ite.com.tw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1574761572-26585-1-git-send-email-allen.chen@ite.com.tw>
Date: Wed, 27 Nov 2019 12:29:11 +0200
Message-ID: <87pnhdobns.fsf@intel.com>
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
Cc: Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Allen Chen <allen.chen@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Pi-Hsun Shih <pihsun@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyNiBOb3YgMjAxOSwgYWxsZW4gPGFsbGVuLmNoZW5AaXRlLmNvbS50dz4gd3JvdGU6
Cj4gQWNjb3JkaW5nIHRvIFZFU0EgRU5IQU5DRUQgRVhURU5ERUQgRElTUExBWSBJREVOVElGSUNB
VElPTiBEQVRBIFNUQU5EQVJECj4gKERlZmluZXMgRURJRCBTdHJ1Y3R1cmUgVmVyc2lvbiAxLCBS
ZXZpc2lvbiA0KSBwYWdlOiAzOQo+IEhvdyB0byBkZXRlcm1pbmUgd2hldGhlciB0aGUgbW9uaXRv
ciBzdXBwb3J0IFJCIHRpbWluZyBvciBub3Q/Cj4gRURJRCAxLjQKPiBGaXJzdDogIHJlYWQgZGV0
YWlsZWQgdGltaW5nIGRlc2NyaXB0b3IgYW5kIG1ha2Ugc3VyZSBieXRlIDAgPSAweDAwLAo+IAli
eXRlIDEgPSAweDAwLCBieXRlIDIgPSAweDAwIGFuZCBieXRlIDMgPSAweEZECj4gU2Vjb25kOiBy
ZWFkIEVESUQgYml0IDAgaW4gZmVhdHVyZSBzdXBwb3J0IGJ5dGUgYXQgYWRkcmVzcyAxOGggPSAx
Cj4gCWFuZCBkZXRhaWxlZCB0aW1pbmcgZGVzY3JpcHRvciBieXRlIDEwID0gMHgwNAo+IFRoaXJk
OiAgaWYgRURJRCBiaXQgMCBpbiBmZWF0dXJlIHN1cHBvcnQgYnl0ZSA9IDEgJiYKPiAJZGV0YWls
ZWQgdGltaW5nIGRlc2NyaXB0b3IgYnl0ZSAxMCA9IDB4MDQKPiAJdGhlbiB3ZSBjYW4gY2hlY2sg
Ynl0ZSAxNSwgaWYgYml0IDQgaW4gYnl0ZSAxNSA9IDEgaXMgc3VwcG9ydCBSQgo+ICAgICAgICAg
aWYgRURJRCBiaXQgMCBpbiBmZWF0dXJlIHN1cHBvcnQgYnl0ZSAhPSAxIHx8Cj4gCWRldGFpbGVk
IHRpbWluZyBkZXNjcmlwdG9yIGJ5dGUgMTAgIT0gMHgwNCwKPiAJdGhlbiBieXRlIDE1IGNhbiBu
b3QgYmUgdXNlZAo+Cj4gVGhlIGxpbnV4IGNvZGUgaXNfcmIgZnVuY3Rpb24gbm90IGZvbGxvdyB0
aGUgVkVTQSdzIHJ1bGUKPgo+IFNpZ25lZC1vZmYtYnk6IEFsbGVuIENoZW4gPGFsbGVuLmNoZW5A
aXRlLmNvbS50dz4KPiBSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgMzYgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiBpbmRleCBmNTkyNmJmLi5lMTFl
NTg1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiBAQCAtOTMsNiArOTMsMTIgQEAgc3RydWN0IGRldGFp
bGVkX21vZGVfY2xvc3VyZSB7Cj4gIAlpbnQgbW9kZXM7Cj4gIH07Cj4gIAo+ICtzdHJ1Y3QgZWRp
ZF9zdXBwb3J0X3JiX2Nsb3N1cmUgewo+ICsJc3RydWN0IGVkaWQgKmVkaWQ7Cj4gKwlib29sIHZh
bGlkX3N1cHBvcnRfcmI7Cj4gKwlib29sIHN1cHBvcnRfcmI7Cj4gK307Cj4gKwo+ICAjZGVmaW5l
IExFVkVMX0RNVAkwCj4gICNkZWZpbmUgTEVWRUxfR1RGCTEKPiAgI2RlZmluZSBMRVZFTF9HVEYy
CTIKPiBAQCAtMjAxNywyMyArMjAyMyw0MSBAQCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqZHJt
X21vZGVfZmluZF9kbXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgCX0KPiAgfQo+ICAKPiAr
c3RhdGljIGJvb2wKPiAraXNfZGlzcGxheV9kZXNjcmlwdG9yKGNvbnN0IHU4ICpyLCB1OCB0YWcp
Cj4gK3sKPiArCXJldHVybiAoIXJbMF0gJiYgIXJbMV0gJiYgIXJbMl0gJiYgclszXSA9PSB0YWcp
ID8gdHJ1ZSA6IGZhbHNlOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZAo+ICBpc19yYihzdHJ1Y3Qg
ZGV0YWlsZWRfdGltaW5nICp0LCB2b2lkICpkYXRhKQo+ICB7Cj4gIAl1OCAqciA9ICh1OCAqKXQ7
Cj4gLQlpZiAoclszXSA9PSBFRElEX0RFVEFJTF9NT05JVE9SX1JBTkdFKQo+IC0JCWlmIChyWzE1
XSAmIDB4MTApCj4gLQkJCSooYm9vbCAqKWRhdGEgPSB0cnVlOwo+ICsJc3RydWN0IGVkaWRfc3Vw
cG9ydF9yYl9jbG9zdXJlICpjbG9zdXJlID0gZGF0YTsKPiArCXN0cnVjdCBlZGlkICplZGlkID0g
Y2xvc3VyZS0+ZWRpZDsKPiArCj4gKwlpZiAoaXNfZGlzcGxheV9kZXNjcmlwdG9yKHIsIEVESURf
REVUQUlMX01PTklUT1JfUkFOR0UpKSB7Cj4gKwkJaWYgKGVkaWQtPmZlYXR1cmVzICYgQklUKDAp
ICYmIHJbMTBdID09IEJJVCgyKSkgewo+ICsJCQljbG9zdXJlLT52YWxpZF9zdXBwb3J0X3JiID0g
dHJ1ZTsKPiArCQkJY2xvc3VyZS0+c3VwcG9ydF9yYiA9IChyWzE1XSAmIDB4MTApID8gdHJ1ZSA6
IGZhbHNlOwo+ICsJCX0KPiArCX0KPiAgfQo+ICAKPiAgLyogRURJRCAxLjQgZGVmaW5lcyB0aGlz
IGV4cGxpY2l0bHkuICBGb3IgRURJRCAxLjMsIHdlIGd1ZXNzLCBiYWRseS4gKi8KPiAgc3RhdGlj
IGJvb2wKPiAgZHJtX21vbml0b3Jfc3VwcG9ydHNfcmIoc3RydWN0IGVkaWQgKmVkaWQpCj4gIHsK
PiArCXN0cnVjdCBlZGlkX3N1cHBvcnRfcmJfY2xvc3VyZSBjbG9zdXJlID0gewo+ICsJCS5lZGlk
ID0gZWRpZCwKPiArCQkudmFsaWRfc3VwcG9ydF9yYiA9IGZhbHNlLAo+ICsJCS5zdXBwb3J0X3Ji
ID0gZmFsc2UsCj4gKwl9Owo+ICsKPiAgCWlmIChlZGlkLT5yZXZpc2lvbiA+PSA0KSB7Cj4gLQkJ
Ym9vbCByZXQgPSBmYWxzZTsKPiAtCQlkcm1fZm9yX2VhY2hfZGV0YWlsZWRfYmxvY2soKHU4ICop
ZWRpZCwgaXNfcmIsICZyZXQpOwo+IC0JCXJldHVybiByZXQ7Cj4gKwkJZHJtX2Zvcl9lYWNoX2Rl
dGFpbGVkX2Jsb2NrKCh1OCAqKWVkaWQsIGlzX3JiLCAmY2xvc3VyZSk7Cj4gKwkJaWYgKGNsb3N1
cmUudmFsaWRfc3VwcG9ydF9yYikKPiArCQkJcmV0dXJuIGNsb3N1cmUuc3VwcG9ydF9yYjsKCkFy
ZSB5b3UgcGxhbm5pbmcgb24gZXh0ZW5kaW5nIHRoZSBjbG9zdXJlIHVzZSBzb21laG93PwoKSSBk
aWQgbm90IGxvb2sgdXAgdGhlIHNwZWMsIGJ1dCBwdXJlbHkgb24gdGhlIGNvZGUgY2hhbmdlcyBh
bG9uZSwgeW91CmNvdWxkIGp1c3QgbW92ZSB0aGUgZWRpZC0+ZmVhdHVyZXMgYml0IGNoZWNrIGF0
IHRoaXMgbGV2ZWwsIGFuZCBub3QgcGFzcwppdCBkb3duLCBhbmQgbm90aGluZyB3b3VsZCBjaGFu
Z2UuIEkuZS4gZG9uJ3QgaXRlcmF0ZSB0aGUgRURJRCBhdCBhbGwgaWYKdGhlIGJpdCBpcyBub3Qg
c2V0LgoKWW91IGFsc28gZG9uJ3QgYWN0dWFsbHkgdXNlIHRoZSBkaXN0aW5jdGlvbiBiZXR3ZWVu
IHZhbGlkX3N1cHBvcnRfcmIKdnMuIHN1cHBvcnRfcmIgZm9yIGFueXRoaW5nLCBzbyB0aGUgY2xv
c3VyZSBqdXN0IGFkZHMgY29kZS4KCkJSLApKYW5pLgoKCj4gIAl9Cj4gIAo+ICAJcmV0dXJuICgo
ZWRpZC0+aW5wdXQgJiBEUk1fRURJRF9JTlBVVF9ESUdJVEFMKSAhPSAwKTsKCi0tIApKYW5pIE5p
a3VsYSwgSW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
