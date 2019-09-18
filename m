Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F44B69DA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 19:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234BF6F635;
	Wed, 18 Sep 2019 17:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0986F62A;
 Wed, 18 Sep 2019 17:48:56 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Sep 2019 10:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,521,1559545200"; d="scan'208";a="199120549"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com) ([10.54.75.49])
 by orsmga002.jf.intel.com with ESMTP; 18 Sep 2019 10:48:55 -0700
Date: Wed, 18 Sep 2019 10:50:39 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: srinivasan.s@intel.com
Subject: Re: [PATCH] drm/i915/dp: Fix DP MST error after unplugging TypeC cable
Message-ID: <20190918175038.GA31062@intel.com>
References: <1568770783-169735-1-git-send-email-srinivasan.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568770783-169735-1-git-send-email-srinivasan.s@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDc6MDk6NDNBTSArMDUzMCwgc3Jpbml2YXNhbi5zQGlu
dGVsLmNvbSB3cm90ZToKPiBGcm9tOiBTcmluaXZhc2FuIFMgPHNyaW5pdmFzYW4uc0BpbnRlbC5j
b20+Cj4gCj4gVGhpcyBwYXRjaCBhdm9pZHMgRFAgTVNUIHBheWxvYWQgZXJyb3IgbWVzc2FnZSBp
biBkbWVzZywgYXMgaXQgaXMgdHJ5aW5nCj4gdG8gcmVhZCB0aGUgcGF5bG9hZCBmcm9tIHRoZSBk
aXNjb25uZWN0ZWQgRFAgTVNUIGRldmljZS4gQWZ0ZXIgdGhlIHVucGx1Zwo+IHRoZSBjb25uZWN0
b3Igc3RhdHVzIGlzIGRpc2Nvbm5lY3RlZCBhbmQgd2Ugc2hvdWxkIG5vdCBiZSBsb29raW5nIGZv
ciB0aGUKPiBwYXlsb2FkIGFuZCBoZW5jZSByZW1vdmUgdGhlIGVycm9yIGFuZCB0aHJvdyB0aGUg
d2FybmluZy4KPiAKPiBUaGlzIGRldGFpbHMgY2FuIGJlIGZvdW5kIGluOgo+IGh0dHBzOi8vYnVn
cy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTExMTYzMgoKUGxlYXNlIGFkZCB0aGlz
IGxpbmsgYXMgQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcu
Y2dpP2lkPTExMTYzMiBhZnRlciB0aGUgU2lnbiBvZmYKc3RhdGVtZW50Cgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFNyaW5pdmFzYW4gUyA8c3Jpbml2YXNhbi5zQGludGVsLmNvbT4KPiAtLS0KPiAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyB8IDcgKysrKysrLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jCj4gaW5kZXggZWVlYjNmOTMz
YWE0Li41YjIyNzhmZGY2NzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kcF9tc3QuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHBfbXN0LmMKPiBAQCAtMjE1LDcgKzIxNSwxMiBAQCBzdGF0aWMgdm9pZCBpbnRlbF9t
c3RfZGlzYWJsZV9kcChzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwKPiAgCj4gIAlyZXQg
PSBkcm1fZHBfdXBkYXRlX3BheWxvYWRfcGFydDEoJmludGVsX2RwLT5tc3RfbWdyKTsKPiAgCWlm
IChyZXQpIHsKPiAtCQlEUk1fRVJST1IoImZhaWxlZCB0byB1cGRhdGUgcGF5bG9hZCAlZFxuIiwg
cmV0KTsKPiArCQlpZiAoIWNvbm5lY3RvciB8fAo+ICsJCSAgICBjb25uZWN0b3ItPmJhc2Uuc3Rh
dHVzICE9IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkKSB7Cj4gKwkJCURSTV9XQVJOKCJEUCBN
U1QgZGlzY29ubmVjdFxuIik7CgpNYXkgYmUgYWRkaW5nIHRoaXMgY2hlY2sgYmVmb3JlIGNhbGxp
bmcgZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCkgaXMgYSBiZXR0ZXIgaWRlYT8KSWYgdGhl
IGNvbm5lY3RvciBpcyBkaXNjb25uZWN0ZWQsIHdoeSB1cGRhdGUgcGF5bG9hZD8KCkphbmksIFZp
bGxlLCB0aG91Z2h0cz8KClJlZ2FyZHMKTWFuYXNpCgo+ICsJCX0gZWxzZSB7Cj4gKwkJCURSTV9F
UlJPUigiZmFpbGVkIHRvIHVwZGF0ZSBwYXlsb2FkICVkXG4iLCByZXQpOwo+ICsJCX0KPiAgCX0K
PiAgCWlmIChvbGRfY3J0Y19zdGF0ZS0+aGFzX2F1ZGlvKQo+ICAJCWludGVsX2F1ZGlvX2NvZGVj
X2Rpc2FibGUoZW5jb2RlciwKPiAtLSAKPiAyLjcuNAo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
