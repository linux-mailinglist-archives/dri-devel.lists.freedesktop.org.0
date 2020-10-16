Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97006290391
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 12:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFEE6EB29;
	Fri, 16 Oct 2020 10:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2044A6EB29
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 10:56:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD1D7AF2C;
 Fri, 16 Oct 2020 10:56:26 +0000 (UTC)
Date: Fri, 16 Oct 2020 12:56:25 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Xu Wang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] video: fbdev: sh_mobile_lcdcfb: Remove redundant null
 check before clk_prepare_enable/clk_disable_unprepare
Message-ID: <20201016125625.7d2b5bd7@linux-uq9g>
In-Reply-To: <20201015101015.6dbd25ce@linux-uq9g>
References: <20201014085722.26069-1-vulab@iscas.ac.cn>
 <20201015101015.6dbd25ce@linux-uq9g>
Organization: SUSE Software Solutions Germany GmbH
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
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
Cc: linux-fbdev@vger.kernel.org, arnd@arndb.de, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, gustavoars@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxNSBPY3QgMjAyMCAxMDoxMDoxNSArMDIwMCBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4Kd3JvdGU6Cgo+IE9uIFdlZCwgMTQgT2N0IDIwMjAgMDg6NTc6MjIg
KzAwMDAgWHUgV2FuZyA8dnVsYWJAaXNjYXMuYWMuY24+IHdyb3RlOgo+IAo+ID4gQmVjYXVzZSBj
bGtfcHJlcGFyZV9lbmFibGUoKSBhbmQgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgYWxyZWFkeSBj
aGVja2VkCj4gPiBOVUxMIGNsb2NrIHBhcmFtZXRlciwgc28gdGhlIGFkZGl0aW9uYWwgY2hlY2tz
IGFyZSB1bm5lY2Vzc2FyeSwganVzdAo+ID4gcmVtb3ZlIHRoZW0uCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IFh1IFdhbmcgPHZ1bGFiQGlzY2FzLmFjLmNuPgo+IAo+IFJldmlld2VkLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiAKCk1lcmdlZCBpbnRvIGRybS1t
aXNjLW5leHQuIFRoYW5rcyEKCj4gPiAtLS0KPiA+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NoX21v
YmlsZV9sY2RjZmIuYyB8IDYgKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvc2hfbW9iaWxlX2xjZGNmYi5jCj4gPiBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9i
aWxlX2xjZGNmYi5jIGluZGV4IGMxMDQzNDIwZGJkMy4uYzA5NTJjYzk2YmRiCj4gPiAxMDA2NDQg
LS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9zaF9tb2JpbGVfbGNkY2ZiLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9iaWxlX2xjZGNmYi5jCj4gPiBAQCAtMzQxLDggKzM0MSw3
IEBAIHN0YXRpYyB2b2lkIGxjZGNfd2FpdF9iaXQoc3RydWN0IHNoX21vYmlsZV9sY2RjX3ByaXYK
PiA+ICpwcml2LCBzdGF0aWMgdm9pZCBzaF9tb2JpbGVfbGNkY19jbGtfb24oc3RydWN0IHNoX21v
YmlsZV9sY2RjX3ByaXYgKnByaXYpCj4gPiAgewo+ID4gIAlpZiAoYXRvbWljX2luY19hbmRfdGVz
dCgmcHJpdi0+aHdfdXNlY250KSkgewo+ID4gLQkJaWYgKHByaXYtPmRvdF9jbGspCj4gPiAtCQkJ
Y2xrX3ByZXBhcmVfZW5hYmxlKHByaXYtPmRvdF9jbGspOwo+ID4gKwkJY2xrX3ByZXBhcmVfZW5h
YmxlKHByaXYtPmRvdF9jbGspOwo+ID4gIAkJcG1fcnVudGltZV9nZXRfc3luYyhwcml2LT5kZXYp
Owo+ID4gIAl9Cj4gPiAgfQo+ID4gQEAgLTM1MSw4ICszNTAsNyBAQCBzdGF0aWMgdm9pZCBzaF9t
b2JpbGVfbGNkY19jbGtfb2ZmKHN0cnVjdAo+ID4gc2hfbW9iaWxlX2xjZGNfcHJpdiAqcHJpdikg
ewo+ID4gIAlpZiAoYXRvbWljX3N1Yl9yZXR1cm4oMSwgJnByaXYtPmh3X3VzZWNudCkgPT0gLTEp
IHsKPiA+ICAJCXBtX3J1bnRpbWVfcHV0KHByaXYtPmRldik7Cj4gPiAtCQlpZiAocHJpdi0+ZG90
X2NsaykKPiA+IC0JCQljbGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+ZG90X2Nsayk7Cj4gPiAr
CQljbGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+ZG90X2Nsayk7Cj4gPiAgCX0KPiA+ICB9Cj4g
PiAgCj4gCj4gCj4gCgoKCi0tIApUaG9tYXMgWmltbWVybWFubgpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSApNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkKKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQpHZXNj
aMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
