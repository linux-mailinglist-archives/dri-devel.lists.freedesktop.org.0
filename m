Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A24315D247
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 07:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064546E447;
	Fri, 14 Feb 2020 06:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C016E444;
 Fri, 14 Feb 2020 06:35:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2020 22:35:51 -0800
X-IronPort-AV: E=Sophos;i="5.70,439,1574150400"; d="scan'208";a="227499154"
Received: from ablank-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.39.179])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2020 22:35:48 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <natechancellor@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915: Cast remain to unsigned long in eb_relocate_vma
In-Reply-To: <20200214054706.33870-1-natechancellor@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200214054706.33870-1-natechancellor@gmail.com>
Date: Fri, 14 Feb 2020 08:36:15 +0200
Message-ID: <87v9o965gg.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxMyBGZWIgMjAyMCwgTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9yQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gQSByZWNlbnQgY29tbWl0IGluIGNsYW5nIGFkZGVkIC1XdGF1dG9s
b2dpY2FsLWNvbXBhcmUgdG8gLVdhbGwsIHdoaWNoIGlzCj4gZW5hYmxlZCBmb3IgaTkxNSBhZnRl
ciAtV3RhdXRvbG9naWNhbC1jb21wYXJlIGlzIGRpc2FibGVkIGZvciB0aGUgcmVzdAo+IG9mIHRo
ZSBrZXJuZWwgc28gd2Ugc2VlIHRoZSBmb2xsb3dpbmcgd2FybmluZyBvbiB4ODZfNjQ6Cj4KPiAg
Li4vZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYzoxNDMzOjIy
OiB3YXJuaW5nOgo+ICByZXN1bHQgb2YgY29tcGFyaXNvbiBvZiBjb25zdGFudCA1NzY0NjA3NTIz
MDM0MjM0ODcgd2l0aCBleHByZXNzaW9uIG9mCj4gIHR5cGUgJ3Vuc2lnbmVkIGludCcgaXMgYWx3
YXlzIGZhbHNlCj4gIFstV3RhdXRvbG9naWNhbC1jb25zdGFudC1vdXQtb2YtcmFuZ2UtY29tcGFy
ZV0KPiAgICAgICAgICBpZiAodW5saWtlbHkocmVtYWluID4gTl9SRUxPQyhVTE9OR19NQVgpKSkK
PiAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gIC4u
L2luY2x1ZGUvbGludXgvY29tcGlsZXIuaDo3ODo0Mjogbm90ZTogZXhwYW5kZWQgZnJvbSBtYWNy
byAndW5saWtlbHknCj4gICMgZGVmaW5lIHVubGlrZWx5KHgpICAgIF9fYnVpbHRpbl9leHBlY3Qo
ISEoeCksIDApCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBe
Cj4gIDEgd2FybmluZyBnZW5lcmF0ZWQuCj4KPiBJdCBpcyBub3Qgd3JvbmcgaW4gdGhlIGNhc2Ug
d2hlcmUgVUxPTkdfTUFYID4gVUlOVF9NQVggYnV0IGl0IGRvZXMgbm90Cj4gYWNjb3VudCBmb3Ig
dGhlIGNhc2Ugd2hlcmUgdGhpcyBmaWxlIGlzIGJ1aWx0IGZvciAzMi1iaXQgeDg2LCB3aGVyZQo+
IFVMT05HX01BWCA9PSBVSU5UX01BWCBhbmQgdGhpcyBjaGVjayBpcyBzdGlsbCByZWxldmFudC4K
Pgo+IENhc3QgcmVtYWluIHRvIHVuc2lnbmVkIGxvbmcsIHdoaWNoIGtlZXBzIHRoZSBnZW5lcmF0
ZWQgY29kZSB0aGUgc2FtZQo+ICh2ZXJpZmllZCB3aXRoIGNsYW5nLTExIG9uIHg4Nl82NCBhbmQg
R0NDIDkuMi4wIG9uIHg4NiBhbmQgeDg2XzY0KSBhbmQKPiB0aGUgd2FybmluZyBpcyBzaWxlbmNl
ZCBzbyB3ZSBjYW4gY2F0Y2ggbW9yZSBwb3RlbnRpYWwgaXNzdWVzIGluIHRoZQo+IGZ1dHVyZS4K
Pgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGludXgvaXNzdWVz
Lzc3OAo+IFN1Z2dlc3RlZC1ieTogTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4K
PiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxsb3JAZ21haWwu
Y29tPgoKV29ya3MgZm9yIG1lIGFzIGEgd29ya2Fyb3VuZCwKClJldmlld2VkLWJ5OiBKYW5pIE5p
a3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgoKCj4gLS0tCj4KPiBSb3VuZCAzIDopCj4KPiBQ
cmV2aW91cyB0aHJlYWRzL3BhdGNoZXM6Cj4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMTkxMTIzMTk1MzIxLjQxMzA1LTEtbmF0ZWNoYW5jZWxsb3JAZ21haWwuY29tLwo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDAyMTEwNTA4MDguMjk0NjMtMS1uYXRlY2hhbmNl
bGxvckBnbWFpbC5jb20vCj4KPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4
ZWNidWZmZXIuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVf
Z2VtX2V4ZWNidWZmZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVj
YnVmZmVyLmMKPiBpbmRleCA2MGM5ODRlMTBjNGEuLjQ3ZjRkOGFiMjgxZSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYwo+IEBAIC0xNDMw
LDcgKzE0MzAsNyBAQCBzdGF0aWMgaW50IGViX3JlbG9jYXRlX3ZtYShzdHJ1Y3QgaTkxNV9leGVj
YnVmZmVyICplYiwgc3RydWN0IGk5MTVfdm1hICp2bWEpCj4gIAo+ICAJdXJlbG9jcyA9IHU2NF90
b191c2VyX3B0cihlbnRyeS0+cmVsb2NzX3B0cik7Cj4gIAlyZW1haW4gPSBlbnRyeS0+cmVsb2Nh
dGlvbl9jb3VudDsKPiAtCWlmICh1bmxpa2VseShyZW1haW4gPiBOX1JFTE9DKFVMT05HX01BWCkp
KQo+ICsJaWYgKHVubGlrZWx5KCh1bnNpZ25lZCBsb25nKXJlbWFpbiA+IE5fUkVMT0MoVUxPTkdf
TUFYKSkpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAo+ICAJLyoKCi0tIApKYW5pIE5pa3VsYSwg
SW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
