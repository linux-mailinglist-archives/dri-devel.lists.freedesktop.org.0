Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32C1B792C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 14:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74AD6F757;
	Thu, 19 Sep 2019 12:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FB36F4C3;
 Thu, 19 Sep 2019 12:18:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2019 05:18:30 -0700
X-IronPort-AV: E=Sophos;i="5.64,523,1559545200"; d="scan'208";a="181450577"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Sep 2019 05:18:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Manasi Navare <manasi.d.navare@intel.com>, srinivasan.s@intel.com
Subject: Re: [PATCH] drm/i915/dp: Fix DP MST error after unplugging TypeC cable
In-Reply-To: <20190918175038.GA31062@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1568770783-169735-1-git-send-email-srinivasan.s@intel.com>
 <20190918175038.GA31062@intel.com>
Date: Thu, 19 Sep 2019 15:18:25 +0300
Message-ID: <87impowkby.fsf@intel.com>
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

T24gV2VkLCAxOCBTZXAgMjAxOSwgTWFuYXNpIE5hdmFyZSA8bWFuYXNpLmQubmF2YXJlQGludGVs
LmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBTZXAgMTgsIDIwMTkgYXQgMDc6MDk6NDNBTSArMDUzMCwg
c3Jpbml2YXNhbi5zQGludGVsLmNvbSB3cm90ZToKPj4gRnJvbTogU3Jpbml2YXNhbiBTIDxzcmlu
aXZhc2FuLnNAaW50ZWwuY29tPgo+PiAKPj4gVGhpcyBwYXRjaCBhdm9pZHMgRFAgTVNUIHBheWxv
YWQgZXJyb3IgbWVzc2FnZSBpbiBkbWVzZywgYXMgaXQgaXMgdHJ5aW5nCj4+IHRvIHJlYWQgdGhl
IHBheWxvYWQgZnJvbSB0aGUgZGlzY29ubmVjdGVkIERQIE1TVCBkZXZpY2UuIEFmdGVyIHRoZSB1
bnBsdWcKPj4gdGhlIGNvbm5lY3RvciBzdGF0dXMgaXMgZGlzY29ubmVjdGVkIGFuZCB3ZSBzaG91
bGQgbm90IGJlIGxvb2tpbmcgZm9yIHRoZQo+PiBwYXlsb2FkIGFuZCBoZW5jZSByZW1vdmUgdGhl
IGVycm9yIGFuZCB0aHJvdyB0aGUgd2FybmluZy4KPj4gCj4+IFRoaXMgZGV0YWlscyBjYW4gYmUg
Zm91bmQgaW46Cj4+IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lk
PTExMTYzMgo+Cj4gUGxlYXNlIGFkZCB0aGlzIGxpbmsgYXMgQnVnemlsbGE6Cj4gaHR0cHM6Ly9i
dWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExNjMyIGFmdGVyIHRoZSBTaWdu
IG9mZgo+IHN0YXRlbWVudAoKSVRZTSAqYmVmb3JlKiBTaWduZWQtb2ZmLWJ5LiBCdXQgeWVhaCwg
dXNlIHRoZSBCdWd6aWxsYTogdGFnLCBhbmQgcGxlYXNlCnVzZSBnaXQgbG9nIHRvIHNlZSBwbGVu
dHkgb2YgZXhhbXBsZXMuCgpCUiwKSmFuaS4KCj4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFNyaW5p
dmFzYW4gUyA8c3Jpbml2YXNhbi5zQGludGVsLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwX21zdC5jIHwgNyArKysrKystCj4+ICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcF9tc3QuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMKPj4gaW5kZXggZWVlYjNmOTMzYWE0Li41
YjIyNzhmZGY2NzUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHBfbXN0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kcF9tc3QuYwo+PiBAQCAtMjE1LDcgKzIxNSwxMiBAQCBzdGF0aWMgdm9pZCBpbnRlbF9tc3Rf
ZGlzYWJsZV9kcChzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwKPj4gIAo+PiAgCXJldCA9
IGRybV9kcF91cGRhdGVfcGF5bG9hZF9wYXJ0MSgmaW50ZWxfZHAtPm1zdF9tZ3IpOwo+PiAgCWlm
IChyZXQpIHsKPj4gLQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gdXBkYXRlIHBheWxvYWQgJWRcbiIs
IHJldCk7Cj4+ICsJCWlmICghY29ubmVjdG9yIHx8Cj4+ICsJCSAgICBjb25uZWN0b3ItPmJhc2Uu
c3RhdHVzICE9IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkKSB7Cj4+ICsJCQlEUk1fV0FSTigi
RFAgTVNUIGRpc2Nvbm5lY3RcbiIpOwo+Cj4gTWF5IGJlIGFkZGluZyB0aGlzIGNoZWNrIGJlZm9y
ZSBjYWxsaW5nIGRybV9kcF91cGRhdGVfcGF5bG9hZF9wYXJ0MSgpIGlzIGEgYmV0dGVyIGlkZWE/
Cj4gSWYgdGhlIGNvbm5lY3RvciBpcyBkaXNjb25uZWN0ZWQsIHdoeSB1cGRhdGUgcGF5bG9hZD8K
Pgo+IEphbmksIFZpbGxlLCB0aG91Z2h0cz8KPgo+IFJlZ2FyZHMKPiBNYW5hc2kKPgo+PiArCQl9
IGVsc2Ugewo+PiArCQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gdXBkYXRlIHBheWxvYWQgJWRcbiIs
IHJldCk7Cj4+ICsJCX0KPj4gIAl9Cj4+ICAJaWYgKG9sZF9jcnRjX3N0YXRlLT5oYXNfYXVkaW8p
Cj4+ICAJCWludGVsX2F1ZGlvX2NvZGVjX2Rpc2FibGUoZW5jb2RlciwKPj4gLS0gCj4+IDIuNy40
Cj4+IAoKLS0gCkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
