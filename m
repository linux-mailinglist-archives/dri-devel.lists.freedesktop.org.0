Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F73610C5E0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 10:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AEB8921C;
	Thu, 28 Nov 2019 09:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7656E03E;
 Thu, 28 Nov 2019 09:22:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 01:22:29 -0800
X-IronPort-AV: E=Sophos;i="5.69,253,1571727600"; d="scan'208";a="203380662"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Nov 2019 01:22:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 13/13] samples: vfio-mdev: constify fb ops
In-Reply-To: <20191127182940.GM406127@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1574871797.git.jani.nikula@intel.com>
 <fc8342eef9fcd2f55c86fcd78f7df52f7c76fa87.1574871797.git.jani.nikula@intel.com>
 <20191127182940.GM406127@phenom.ffwll.local>
Date: Thu, 28 Nov 2019 11:22:23 +0200
Message-ID: <87d0dcnynk.fsf@intel.com>
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
Cc: kvm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyNyBOb3YgMjAxOSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90
ZToKPiBPbiBXZWQsIE5vdiAyNywgMjAxOSBhdCAwNjozMjowOVBNICswMjAwLCBKYW5pIE5pa3Vs
YSB3cm90ZToKPj4gTm93IHRoYXQgdGhlIGZib3BzIG1lbWJlciBvZiBzdHJ1Y3QgZmJfaW5mbyBp
cyBjb25zdCwgd2UgY2FuIHN0YXIgbWFraW5nCj4+IHRoZSBvcHMgY29uc3QgYXMgd2VsbC4KPj4g
Cj4+IENjOiBLaXJ0aSBXYW5raGVkZSA8a3dhbmtoZWRlQG52aWRpYS5jb20+Cj4+IENjOiBrdm1A
dmdlci5rZXJuZWwub3JnCj4+IFNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3Vs
YUBpbnRlbC5jb20+Cj4KPiBZb3UndmUgbWlzc2VkIGF0IGxlYXN0IGRyaXZlcnMvc3RhZ2luZy9m
YnRmdCBpbiB5b3VyIHNlYXJjaC4gSSBndWVzcyB5b3UKPiBuZWVkIHRvIGRvIGEgZnVsbCBtYWtl
IGFsbHllc2NvbmZpZyBvbiB4ODYvYXJtIGFuZCBhcm02NCAodGhlIGxhdHRlcgo+IGJlY2F1c2Ug
c29tZSBzdHVwaWQgZHJpdmVycyBvbmx5IGNvbXBpbGUgdGhlcmUsIG5vdCBvbiBhcm0sIGRvbid0
IGFzaykuCj4gU3RpbGwgbWlzc2VzIGEgcGlsZSBvZiBtaXBzL3BwYyBvbmx5IHN0dWZmIGFuZCBt
YXliZSB0aGUgc3BhcmNzIGFuZAo+IGFscGhhcywgYnV0IHNob3VsZCBiZSBnb29kIGVub3VnaC4K
CmZidGZ0IGR5bmFtaWNhbGx5IGFsbG9jYXRlcyB0aGUgZmJvcHMsIGZvciB3aGF0ZXZlciByZWFz
b24uIFRoZXJlIHdlcmUKb3RoZXJzIGxpa2UgdGhhdCB0b28uIFNvbWUgb2YgdGhlIGRyaXZlcnMg
bW9kaWZ5IHRoZSBmYm9wcyBydW50aW1lIHRvCmNob29zZSBkaWZmZXJlbnQgaG9va3MgZm9yIGRp
ZmZlcmVudCBjb25maWd1cmF0aW9ucy4gQ2FuJ3QgY2hhbmdlIHRoZW0KYWxsIGFueXdheS4KCkZh
Y2lsaXRhdGluZyBtYWtpbmcgdGhlIGZib3BzIGNvbnN0IGlzIG9uZSB0aGluZyAocGF0Y2hlcyAx
LTgpLCBidXQgSSdtCm5vdCByZWFsbHkgc3VyZSBJIHdhbnQgdG8gc2lnbiB1cCBmb3IgZXhoYXVz
dGl2ZWx5IG1vdmluZyBmYm9wcyB0bwpyb2RhdGEgb24gYW55dGhpbmcgYmV5b25kIGRyaXZlcnMv
Z3B1L2RybS4gSXQncyBub3QgbGlrZSBJIGxlYXZlIHN0dWZmCmJyb2tlbi4gQmVzaWRlcyBJIGFt
IHRyeWluZyB0byBjb3ZlciBhbGwgdGhlIGxvdyBoYW5naW5nIGZydWl0IHdoZXJlIEkKY2FuIHNp
bXBseSBhZGQgdGhlICJjb25zdCIgYW5kIGJlIGRvbmUgd2l0aCBpdC4KCkJSLApKYW5pLgoKPgo+
IFdpdGggdGhhdCBkb25lLCBvbiB0aGUgcmVtYWluaW5nIHBhdGNoZXM6Cj4KPiBSZXZpZXdlZC1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPgo+PiAtLS0KPj4gIHNh
bXBsZXMvdmZpby1tZGV2L21kcHktZmIuYyB8IDIgKy0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL3NhbXBsZXMvdmZp
by1tZGV2L21kcHktZmIuYyBiL3NhbXBsZXMvdmZpby1tZGV2L21kcHktZmIuYwo+PiBpbmRleCAy
NzE5YmIyNTk2NTMuLjIxZGJmNjNkNmU0MSAxMDA2NDQKPj4gLS0tIGEvc2FtcGxlcy92ZmlvLW1k
ZXYvbWRweS1mYi5jCj4+ICsrKyBiL3NhbXBsZXMvdmZpby1tZGV2L21kcHktZmIuYwo+PiBAQCAt
ODYsNyArODYsNyBAQCBzdGF0aWMgdm9pZCBtZHB5X2ZiX2Rlc3Ryb3koc3RydWN0IGZiX2luZm8g
KmluZm8pCj4+ICAJCWlvdW5tYXAoaW5mby0+c2NyZWVuX2Jhc2UpOwo+PiAgfQo+PiAgCj4+IC1z
dGF0aWMgc3RydWN0IGZiX29wcyBtZHB5X2ZiX29wcyA9IHsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgZmJfb3BzIG1kcHlfZmJfb3BzID0gewo+PiAgCS5vd25lcgkJPSBUSElTX01PRFVMRSwKPj4g
IAkuZmJfZGVzdHJveQk9IG1kcHlfZmJfZGVzdHJveSwKPj4gIAkuZmJfc2V0Y29scmVnCT0gbWRw
eV9mYl9zZXRjb2xyZWcsCj4+IC0tIAo+PiAyLjIwLjEKPj4gCj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKLS0gCkphbmkgTmlrdWxhLCBJ
bnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
