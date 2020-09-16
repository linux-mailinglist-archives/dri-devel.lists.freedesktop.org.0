Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2421A26C2FC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 14:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7766A6E15A;
	Wed, 16 Sep 2020 12:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D886E15A;
 Wed, 16 Sep 2020 12:54:38 +0000 (UTC)
IronPort-SDR: oBq2ZYtodw+LTjquQ6UYy3ckz11TP8rBWM2Zat7sIaIjWmPbQ9845HvscoWLiyRjDnttLfTmI/
 m6i78cLQrboA==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="160383983"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; d="scan'208";a="160383983"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 05:54:37 -0700
IronPort-SDR: NDg5kuMWgmS9JMIJ4sg3rpgX4BTxKV1Sk8UKKMUt9/tqABBuuwHE2xMdzMiwiYUUfedwVCyYij
 SO+Z84aVU/FQ==
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; d="scan'208";a="483301216"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.213.73.60])
 ([10.213.73.60])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 05:54:34 -0700
Subject: Re: [PATCH v8 6/8] drm/i915: WA for platforms with double buffered
 adress update enable bit
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200914055633.21109-1-karthik.b.s@intel.com>
 <20200914055633.21109-7-karthik.b.s@intel.com>
 <20200915141909.GM6112@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <b5b317aa-5197-4292-a545-8f69d9552c14@intel.com>
Date: Wed, 16 Sep 2020 18:24:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915141909.GM6112@intel.com>
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

CgpPbiA5LzE1LzIwMjAgNzo0OSBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIE1vbiwg
U2VwIDE0LCAyMDIwIGF0IDExOjI2OjMxQU0gKzA1MzAsIEthcnRoaWsgQiBTIHdyb3RlOgo+PiBJ
biBHZW4gOSBhbmQgR2VuIDEwIHBsYXRmb3JtcywgYXN5bmMgYWRkcmVzcyB1cGRhdGUgZW5hYmxl
IGJpdCBpcwo+PiBkb3VibGUgYnVmZmVyZWQuIER1ZSB0byB0aGlzLCBkdXJpbmcgdGhlIHRyYW5z
aXRpb24gZnJvbSBhc3luYyBmbGlwCj4+IHRvIHN5bmMgZmxpcCB3ZSBoYXZlIHRvIHdhaXQgdW50
aWwgdGhpcyBiaXQgaXMgdXBkYXRlZCBiZWZvcmUgY29udGludWluZwo+PiB3aXRoIHRoZSBub3Jt
YWwgY29tbWl0IGZvciBzeW5jIGZsaXAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEthcnRoaWsgQiBT
IDxrYXJ0aGlrLmIuc0BpbnRlbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFZhbmRpdGEgS3Vsa2Fy
bmkgPHZhbmRpdGEua3Vsa2FybmlAaW50ZWwuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysr
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMKPj4gaW5kZXggYTBjMTdkOTRkYWYz
Li5iN2UyNGRmZjA3NzIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZGlzcGxheS5jCj4+IEBAIC0xNTM2MCw2ICsxNTM2MCw0MiBAQCBzdGF0aWMgdm9pZCBp
bnRlbF9lbmFibGVfY3J0YyhzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwKPj4gICAJ
aW50ZWxfY3J0Y19lbmFibGVfcGlwZV9jcmMoY3J0Yyk7Cj4+ICAgfQo+PiAgIAo+PiArc3RhdGlj
IHZvaWQgc2tsX3RvZ2dsZV9hc3luY19zeW5jKHN0cnVjdCBpbnRlbF9hdG9taWNfc3RhdGUgKnN0
YXRlLAo+IAo+IHNrbF9kaXNhYmxlX2FzeW5jX2ZsaXBfd2EoKSBtYXliZT8KPiAKClRoYW5rcyBm
b3IgdGhlIHJldmlldy4KSSdsbCBjaGFuZ2UgdGhlIG5hbWUuCj4+ICsJCQkJICBzdHJ1Y3QgaW50
ZWxfY3J0YyAqY3J0YywKPj4gKwkJCQkgIHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpuZXdfY3J0
Y19zdGF0ZSkKPj4gK3sKPj4gKwlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0
b19pOTE1KHN0YXRlLT5iYXNlLmRldik7Cj4+ICsJc3RydWN0IGludGVsX3BsYW5lICpwbGFuZTsK
Pj4gKwlzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGUgKm5ld19wbGFuZV9zdGF0ZTsKPj4gKwl1MzIg
dXBkYXRlX21hc2sgPSBuZXdfY3J0Y19zdGF0ZS0+dXBkYXRlX3BsYW5lczsKPj4gKwl1MzIgcGxh
bmVfY3RsLCBzdXJmX2FkZHI7Cj4+ICsJZW51bSBwbGFuZV9pZCBwbGFuZV9pZDsKPj4gKwl1bnNp
Z25lZCBsb25nIGlycWZsYWdzOwo+PiArCWVudW0gcGlwZSBwaXBlOwo+IAo+IE1vc3Qgb2YgdGhl
c2UgdGhpbmdzIGFyZSBvbmx5IG5lZWRlZCB3aXRoaW4gdGhlIGxvb3AsIHNvIHRoYXQncyB3aGVy
ZQo+IHRoZSBkZWNsYXJhdGlvbnMgc2hvdWxkIGJlLgo+IAoKU3VyZSwgSSdsbCBtb3ZlIGl0IGlu
c2lkZSB0aGUgbG9vcC4KPj4gKwlpbnQgaTsKPj4gKwo+PiArCWZvcl9lYWNoX25ld19pbnRlbF9w
bGFuZV9pbl9zdGF0ZShzdGF0ZSwgcGxhbmUsIG5ld19wbGFuZV9zdGF0ZSwgaSkgewo+PiArCQlp
ZiAoY3J0Yy0+cGlwZSAhPSBwbGFuZS0+cGlwZSB8fAo+PiArCQkgICAgISh1cGRhdGVfbWFzayAm
IEJJVChwbGFuZS0+aWQpKSkKPj4gKwkJCWNvbnRpbnVlOwo+PiArCj4+ICsJCXBsYW5lX2lkID0g
cGxhbmUtPmlkOwo+PiArCQlwaXBlID0gcGxhbmUtPnBpcGU7Cj4+ICsKPiAKPiBJJ2QgdGFrZSB0
aGUgbG9jayBoZXJlIHNvIHRoZSBybXcgaXMgZnVsbHkgcHJvdGVjdGVkLgo+IAoKU3VyZSwgSSds
bCBtb3ZlIGl0IGhlcmUuCj4+ICsJCXBsYW5lX2N0bCA9IGludGVsX2RlX3JlYWRfZncoZGV2X3By
aXYsIFBMQU5FX0NUTChwaXBlLCBwbGFuZV9pZCkpOwo+PiArCQlzdXJmX2FkZHIgPSBpbnRlbF9k
ZV9yZWFkX2Z3KGRldl9wcml2LCBQTEFORV9TVVJGKHBpcGUsIHBsYW5lX2lkKSk7Cj4+ICsKPj4g
KwkJcGxhbmVfY3RsICY9IH5QTEFORV9DVExfQVNZTkNfRkxJUDsKPj4gKwo+PiArCQlzcGluX2xv
Y2tfaXJxc2F2ZSgmZGV2X3ByaXYtPnVuY29yZS5sb2NrLCBpcnFmbGFncyk7Cj4+ICsJCWludGVs
X2RlX3dyaXRlX2Z3KGRldl9wcml2LCBQTEFORV9DVEwocGlwZSwgcGxhbmVfaWQpLCBwbGFuZV9j
dGwpOwo+PiArCQlpbnRlbF9kZV93cml0ZV9mdyhkZXZfcHJpdiwgUExBTkVfU1VSRihwaXBlLCBw
bGFuZV9pZCksIHN1cmZfYWRkcik7Cj4+ICsJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRldl9w
cml2LT51bmNvcmUubG9jaywgaXJxZmxhZ3MpOwo+PiArCX0KPj4gKwo+PiArCWludGVsX3dhaXRf
Zm9yX3ZibGFuayhkZXZfcHJpdiwgY3J0Yy0+cGlwZSk7Cj4+ICt9Cj4+ICsKPj4gICBzdGF0aWMg
dm9pZCBpbnRlbF91cGRhdGVfY3J0YyhzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwK
Pj4gICAJCQkgICAgICBzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YykKPj4gICB7Cj4+IEBAIC0xNTM4
Nyw2ICsxNTQyMywxNCBAQCBzdGF0aWMgdm9pZCBpbnRlbF91cGRhdGVfY3J0YyhzdHJ1Y3QgaW50
ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwKPj4gICAJZWxzZQo+PiAgIAkJaW50ZWxfZmJjX2VuYWJs
ZShzdGF0ZSwgY3J0Yyk7Cj4+ICAgCj4+ICsJLyogV0EgZm9yIG9sZGVyIHBsYXRmb3JtcyB3aGVy
ZSBhc3luYyBhZGRyZXNzIHVwZGF0ZSBlbmFibGUgYml0Cj4gCj4gcy9vbGRlci8vCj4gCgpOb3Rl
ZC4KPj4gKwkgKiBpcyBkb3VibGUgYnVmZmVyZWQuCj4gCj4gImlzIGRvdWJsZSBidWZmZXJlZCBh
bmQgb25seSBsYXRjaGVkIGF0IHN0YXJ0IG9mIHZibGFuayIgb3IKPiBzb21ldGhpbmcuIE90aGVy
d2lzZSBvbmUgaXMgbGVmdCB3b25kZXJpbmcgd2hhdCB0aGUgZnVzcyBpcyBhYm91dC4KPiAKClN1
cmUsIEknbGwgdXBkYXRlIHRoaXMuCj4+ICsJICovCj4gCj4gTXVsdGlsaW5lIGNvbW1lbnQgZm9y
bWF0IHNob3VsZCBiZQo+IC8qCj4gICAqIGJsYWgKPiAgICogYmxhaAo+ICAgKi8KPiAKCkknbGwg
Zml4IHRoaXMuCj4+ICsJaWYgKG9sZF9jcnRjX3N0YXRlLT51YXBpLmFzeW5jX2ZsaXAgJiYKPj4g
KwkgICAgIW5ld19jcnRjX3N0YXRlLT51YXBpLmFzeW5jX2ZsaXAgJiYKPj4gKwkgICAgSU5URUxf
R0VOKGRldl9wcml2KSA8PSAxMCAmJiBJTlRFTF9HRU4oZGV2X3ByaXYpID49IDkpCj4gCj4gSVNf
R0VOX1JBTkdFKDksIDEwKSBvciB3aGF0ZXZlciBpdCdzIGNhbGxlZC4KPiAKClN1cmUsIEknbGwg
dXBkYXRlIHRoaXMuCj4gSSBndWVzcyB3ZSBtaWdodCB3YW50IHRvIHB1dCB0aGlzIGNhbGwgaW50
byBpbnRlbF9wcmVfcGxhbmVfdXBkYXRlKCkKPiBzaW5jZSB0aGF0J3Mgd2hlcmUgYWxsIGtpbmRz
IG9mIHNpbWlsYXIgd2FpdF9mb3JfdmJsYW5rIHcvYXMgbGl2ZS4KPiAKClN1cmUsIEknbGwgbW92
ZSB0aGlzIHRvIGludGVsX3ByZV9wbGFuZV91cGRhdGUoKQoKVGhhbmtzLApLYXJ0aGlrLkIuUwo+
PiArCQlza2xfdG9nZ2xlX2FzeW5jX3N5bmMoc3RhdGUsIGNydGMsIG5ld19jcnRjX3N0YXRlKTsK
Pj4gKwo+PiAgIAkvKiBQZXJmb3JtIHZibGFuayBldmFzaW9uIGFyb3VuZCBjb21taXQgb3BlcmF0
aW9uICovCj4+ICAgCWludGVsX3BpcGVfdXBkYXRlX3N0YXJ0KG5ld19jcnRjX3N0YXRlKTsKPj4g
ICAKPj4gLS0gCj4+IDIuMjIuMAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
