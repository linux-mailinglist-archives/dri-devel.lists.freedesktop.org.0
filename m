Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90375109234
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 17:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC5F6E174;
	Mon, 25 Nov 2019 16:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBA26E170;
 Mon, 25 Nov 2019 16:52:22 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Nov 2019 08:52:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,242,1571727600"; d="scan'208";a="408367336"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2019 08:52:20 -0800
Date: Mon, 25 Nov 2019 08:40:57 -0800
From: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [RFC 03/13] drm/i915/svm: Runtime (RT) allocator
 support
Message-ID: <20191125164057.GH14488@nvishwa1-DESK.sc.intel.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-4-niranjana.vishwanathapura@intel.com>
 <157467597709.2314.3239893018411484277@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157467597709.2314.3239893018411484277@skylake-alporthouse-com>
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
Cc: intel-gfx@lists.freedesktop.org, sanjay.k.kumar@intel.com,
 dri-devel@lists.freedesktop.org, dave.hansen@intel.com, jglisse@redhat.com,
 jgg@mellanox.com, daniel.vetter@intel.com, dan.j.williams@intel.com,
 ira.weiny@intel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDk6NTk6MzdBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+UXVvdGluZyBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhICgyMDE5LTExLTIyIDIwOjU3
OjI0KQo+PiBTaGFyZWQgVmlydHVhbCBNZW1vcnkgKFNWTSkgcnVudGltZSBhbGxvY2F0b3Igc3Vw
cG9ydCBhbGxvd3MKPj4gYmluZGluZyBhIHNoYXJlZCB2aXJ0dWFsIGFkZHJlc3MgdG8gYSBidWZm
ZXIgb2JqZWN0IChCTykgaW4gdGhlCj4+IGRldmljZSBwYWdlIHRhYmxlIHRocm91Z2ggYW4gaW9j
dGwgY2FsbC4KPgo+VGhlIGlvY3RsIHRob3VnaCBpcyBub3Qgc3ZtIHNwZWNpZmljLCBpdCBpcyB0
byBkbyB3aXRoICJidWxrIHJlc2lkZW5jeSIKPmFuZCBjYW4gYmUgdXNlZCB0byByZWR1Y2UgZXhl
Y2J1ZiB0cmFmZmljIHRvIHByb3ZpZGUgdmlydHVhbCBhZGRyZXNzCj5sYXlvdXQgY29udHJvbHMg
dG8gZS5nLiBWdWxrYW4gY2xpZW50cy4KPgo+STkxNV9WTV9CSU5EIHsKPgl1aW50MzJfdCB2bV9p
ZDsKPglpbnQzMl90IGZkOyAvKiBvciAtMSBmb3IgYW5vbiwgb3IgYnVmIGRlcGVuZGluZyBvbiBm
bGFncyAqLwo+CXVpbnQ2NF90IGZsYWdzOwo+CXVpbnQ2NF90IG9mZnNldDsgLyogb2Zmc2V0IGlu
Zm8gZmQgW3BhZ2UgYWxpZ25lZF0gKi8KPgl1aW50NjRfdCBsZW5ndGg7IC8qIHBhZ2UgYWxpZ25l
ZCAqLwo+CXVpbnQ2NF90IGlvdmE7IC8qIHBhZ2UgYWxpZ25lZCAqLwo+CXVpbnQ2NF90IGV4dGVu
c2lvbnM7Cj59OyAvKiB3aGVyZSBwYWdlIGFsaWduZWQgaXMgYWN0dWFsbHkgbW9yZSBJOTE1X0dU
VF9QQUdFX0FMSUdOTUVOVCAqLwo+Cj5hcyBJIHJlY2FsbC4gSSBhbHNvIHJlY2FsbCBpdCBiZWlu
ZyBwYXJ0IG9mIGEgZnV0dXJlIGNvbW1hbmQgc3RyZWFtCj5pbnRlcmZhY2UgdG8gcmVkdWNlIGlv
Y3RscywgYnV0IHRoYXQgaXMgYW5vdGhlciBzdG9yeS4KClRoYW5rcyBDaHJpcy4KSSB3aWxsIGNo
YW5nZSBJOTE1X0JJTkQgdG8gSTkxNV9WTV9CSU5ELgpDdXJyZW50bHksIGl0IGlzIG9ubHkgYWRk
cmVzc2luZyBiaW5kaW5nIFNWTSBzeXN0ZW0gKGJ1ZmZlcikgYW5kIHJ1bnRpbWUgKEJPcykKYWxs
b2NhdGlvbnMuIEJ1dCBpdCBjYW4gYmUgZXhwYW5kZWQgZm9yIG90aGVyIGJpbmRpbmdzLiBJIGhh
dmUgJ3R5cGUnIGZpZWxkCmluc3RlYWQgb2YgJ2ZkJyBhbmQgJ2V4dGVuc2lvbnMnICYgJ2lvdicg
Y2FuIGJlIGFkZGVkIGxhdGVyIGlmIHJlcXVpcmVkLgpJcyB0aGF0IE9LPwoKPi1DaHJpcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
