Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D17272182
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 12:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586D76E25E;
	Mon, 21 Sep 2020 10:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EB66E25C;
 Mon, 21 Sep 2020 10:53:59 +0000 (UTC)
IronPort-SDR: NLgbciwp3p4PCgUw7ULtZ1zz1ldsmZ0OSxFiDb8Ju+8BTwN5+OOYeevVSGy5EB0p8WKlOImenA
 REE8bkbzdKpQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="148101242"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="148101242"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 03:53:58 -0700
IronPort-SDR: Blin7AkxlmcrlNjcPzHYtBDX2RmkYKT21fic57+z2UfEI/kM3iZOgd6Kk5Iry9ou4w+38kHOZv
 YoYFcS4Ei0Mg==
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="485393072"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.252.173.129])
 ([10.252.173.129])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 03:53:55 -0700
Subject: Re: [PATCH v9 6/8] drm/i915: WA for platforms with double buffered
 address update enable bit
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200916150824.15749-1-karthik.b.s@intel.com>
 <20200916150824.15749-7-karthik.b.s@intel.com>
 <20200918115436.GK6112@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <002fe1d2-257f-76cc-66f6-bf9b06dea7df@intel.com>
Date: Mon, 21 Sep 2020 16:23:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200918115436.GK6112@intel.com>
Content-Language: en-US
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 dri-devel@lists.freedesktop.org, nicholas.kazlauskas@amd.com,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA5LzE4LzIwMjAgNToyNCBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIFdlZCwg
U2VwIDE2LCAyMDIwIGF0IDA4OjM4OjIyUE0gKzA1MzAsIEthcnRoaWsgQiBTIHdyb3RlOgo+PiBJ
biBHZW4gOSBhbmQgR2VuIDEwIHBsYXRmb3JtcywgYXN5bmMgYWRkcmVzcyB1cGRhdGUgZW5hYmxl
IGJpdCBpcwo+PiBkb3VibGUgYnVmZmVyZWQuIER1ZSB0byB0aGlzLCBkdXJpbmcgdGhlIHRyYW5z
aXRpb24gZnJvbSBhc3luYyBmbGlwCj4+IHRvIHN5bmMgZmxpcCB3ZSBoYXZlIHRvIHdhaXQgdW50
aWwgdGhpcyBiaXQgaXMgdXBkYXRlZCBiZWZvcmUgY29udGludWluZwo+PiB3aXRoIHRoZSBub3Jt
YWwgY29tbWl0IGZvciBzeW5jIGZsaXAuCj4+Cj4+IHY5OiAtUmVuYW1lIHNrbF90b2dnbGVfYXN5
bmNfc3luYygpIHRvIHNrbF9kaXNhYmxlX2FzeW5jX2ZsaXBfd2EoKS4gKFZpbGxlKQo+PiAgICAg
IC1QbGFjZSB0aGUgZGVjbGFyYXRpb25zIGFwcHJvcHJpYXRlbHkgYXMgcGVyIG5lZWQuIChWaWxs
ZSkKPj4gICAgICAtVGFrZSB0aGUgbG9jayBiZWZvcmUgdGhlIHJlZyByZWFkLiAoVmlsbGUpCj4+
ICAgICAgLUZpeCBjb21tZW50IGFuZCBmb3JtYXR0aW5nLiAoVmlsbGUpCj4+ICAgICAgLVVzZSBJ
U19HRU5fUkFOR0UoKSBmb3IgZ2VuIGNoZWNrLiAoVmlsbGUpCj4+ICAgICAgLU1vdmUgc2tsX2Rp
c2FibGVfYXN5bmNfZmxpcF93YSgpIHRvIGludGVsX3ByZV9wbGFuZV91cGRhdGUoKS4gKFZpbGxl
KQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBLYXJ0aGlrIEIgUyA8a2FydGhpay5iLnNAaW50ZWwuY29t
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBWYW5kaXRhIEt1bGthcm5pIDx2YW5kaXRhLmt1bGthcm5pQGlu
dGVsLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxh
QGxpbnV4LmludGVsLmNvbT4KClRoYW5rcyBmb3IgdGhlIFJCLgoKVGhhbmtzLApLYXJ0aGlrLkIu
Uwo+IAo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3Bs
YXkuYyB8IDQ2ICsrKysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQ2IGlu
c2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5LmMKPj4gaW5kZXggMGYwYmNiYjAwYzdmLi42ZjZlZGM1ODFlMTQgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCj4+IEBAIC02NTYy
LDYgKzY1NjIsNDMgQEAgc3RhdGljIHZvaWQgaW50ZWxfcG9zdF9wbGFuZV91cGRhdGUoc3RydWN0
IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsCj4+ICAgCQlpY2xfd2Ffc2NhbGVyY2xrZ2F0aW5n
KGRldl9wcml2LCBwaXBlLCBmYWxzZSk7Cj4+ICAgfQo+PiAgIAo+PiArc3RhdGljIHZvaWQgc2ts
X2Rpc2FibGVfYXN5bmNfZmxpcF93YShzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwK
Pj4gKwkJCQkgICAgICBzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YywKPj4gKwkJCQkgICAgICBjb25z
dCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGUpCj4+ICt7Cj4+ICsJc3Ry
dWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9faTkxNShzdGF0ZS0+YmFzZS5kZXYp
Owo+PiArCXN0cnVjdCBpbnRlbF9wbGFuZSAqcGxhbmU7Cj4+ICsJc3RydWN0IGludGVsX3BsYW5l
X3N0YXRlICpuZXdfcGxhbmVfc3RhdGU7Cj4+ICsJaW50IGk7Cj4+ICsKPj4gKwlmb3JfZWFjaF9u
ZXdfaW50ZWxfcGxhbmVfaW5fc3RhdGUoc3RhdGUsIHBsYW5lLCBuZXdfcGxhbmVfc3RhdGUsIGkp
IHsKPj4gKwkJdTMyIHVwZGF0ZV9tYXNrID0gbmV3X2NydGNfc3RhdGUtPnVwZGF0ZV9wbGFuZXM7
Cj4+ICsJCXUzMiBwbGFuZV9jdGwsIHN1cmZfYWRkcjsKPj4gKwkJZW51bSBwbGFuZV9pZCBwbGFu
ZV9pZDsKPj4gKwkJdW5zaWduZWQgbG9uZyBpcnFmbGFnczsKPj4gKwkJZW51bSBwaXBlIHBpcGU7
Cj4+ICsKPj4gKwkJaWYgKGNydGMtPnBpcGUgIT0gcGxhbmUtPnBpcGUgfHwKPj4gKwkJICAgICEo
dXBkYXRlX21hc2sgJiBCSVQocGxhbmUtPmlkKSkpCj4+ICsJCQljb250aW51ZTsKPj4gKwo+PiAr
CQlwbGFuZV9pZCA9IHBsYW5lLT5pZDsKPj4gKwkJcGlwZSA9IHBsYW5lLT5waXBlOwo+PiArCj4+
ICsJCXNwaW5fbG9ja19pcnFzYXZlKCZkZXZfcHJpdi0+dW5jb3JlLmxvY2ssIGlycWZsYWdzKTsK
Pj4gKwkJcGxhbmVfY3RsID0gaW50ZWxfZGVfcmVhZF9mdyhkZXZfcHJpdiwgUExBTkVfQ1RMKHBp
cGUsIHBsYW5lX2lkKSk7Cj4+ICsJCXN1cmZfYWRkciA9IGludGVsX2RlX3JlYWRfZncoZGV2X3By
aXYsIFBMQU5FX1NVUkYocGlwZSwgcGxhbmVfaWQpKTsKPj4gKwo+PiArCQlwbGFuZV9jdGwgJj0g
flBMQU5FX0NUTF9BU1lOQ19GTElQOwo+PiArCj4+ICsJCWludGVsX2RlX3dyaXRlX2Z3KGRldl9w
cml2LCBQTEFORV9DVEwocGlwZSwgcGxhbmVfaWQpLCBwbGFuZV9jdGwpOwo+PiArCQlpbnRlbF9k
ZV93cml0ZV9mdyhkZXZfcHJpdiwgUExBTkVfU1VSRihwaXBlLCBwbGFuZV9pZCksIHN1cmZfYWRk
cik7Cj4+ICsJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRldl9wcml2LT51bmNvcmUubG9jaywg
aXJxZmxhZ3MpOwo+PiArCX0KPj4gKwo+PiArCWludGVsX3dhaXRfZm9yX3ZibGFuayhkZXZfcHJp
diwgY3J0Yy0+cGlwZSk7Cj4+ICt9Cj4+ICsKPj4gICBzdGF0aWMgdm9pZCBpbnRlbF9wcmVfcGxh
bmVfdXBkYXRlKHN0cnVjdCBpbnRlbF9hdG9taWNfc3RhdGUgKnN0YXRlLAo+PiAgIAkJCQkgICBz
dHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YykKPj4gICB7Cj4+IEBAIC02NjQ3LDYgKzY2ODQsMTUgQEAg
c3RhdGljIHZvaWQgaW50ZWxfcHJlX3BsYW5lX3VwZGF0ZShzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0
YXRlICpzdGF0ZSwKPj4gICAJICovCj4+ICAgCWlmIChJU19HRU4oZGV2X3ByaXYsIDIpICYmIHBs
YW5lc19kaXNhYmxpbmcob2xkX2NydGNfc3RhdGUsIG5ld19jcnRjX3N0YXRlKSkKPj4gICAJCWlu
dGVsX3NldF9jcHVfZmlmb191bmRlcnJ1bl9yZXBvcnRpbmcoZGV2X3ByaXYsIHBpcGUsIGZhbHNl
KTsKPj4gKwo+PiArCS8qCj4+ICsJICogV0EgZm9yIHBsYXRmb3JtcyB3aGVyZSBhc3luYyBhZGRy
ZXNzIHVwZGF0ZSBlbmFibGUgYml0Cj4+ICsJICogaXMgZG91YmxlIGJ1ZmZlcmVkIGFuZCBvbmx5
IGxhdGNoZWQgYXQgc3RhcnQgb2YgdmJsYW5rLgo+PiArCSAqLwo+PiArCWlmIChvbGRfY3J0Y19z
dGF0ZS0+dWFwaS5hc3luY19mbGlwICYmCj4+ICsJICAgICFuZXdfY3J0Y19zdGF0ZS0+dWFwaS5h
c3luY19mbGlwICYmCj4+ICsJICAgIElTX0dFTl9SQU5HRShkZXZfcHJpdiwgOSwgMTApKQo+PiAr
CQlza2xfZGlzYWJsZV9hc3luY19mbGlwX3dhKHN0YXRlLCBjcnRjLCBuZXdfY3J0Y19zdGF0ZSk7
Cj4+ICAgfQo+PiAgIAo+PiAgIHN0YXRpYyB2b2lkIGludGVsX2NydGNfZGlzYWJsZV9wbGFuZXMo
c3RydWN0IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUsCj4+IC0tIAo+PiAyLjIyLjAKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
