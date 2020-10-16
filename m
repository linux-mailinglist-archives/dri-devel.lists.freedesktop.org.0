Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9353629023D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 11:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4656EA90;
	Fri, 16 Oct 2020 09:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5116EA90
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 09:53:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A87CACF1;
 Fri, 16 Oct 2020 09:53:34 +0000 (UTC)
Date: Fri, 16 Oct 2020 11:53:31 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Xu Wang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] omapfb/dss: Remove redundant null check before
 clk_prepare_enable/clk_disable_unprepare
Message-ID: <20201016115331.0dd4341e@linux-uq9g>
In-Reply-To: <20201015100827.1115fa9b@linux-uq9g>
References: <20201014084920.25813-1-vulab@iscas.ac.cn>
 <20201015100827.1115fa9b@linux-uq9g>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, pakki001@umn.edu, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAxNSBPY3QgMjAyMCAxMDowODoyNyArMDIwMCBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4Kd3JvdGU6Cgo+IE9uIFdlZCwgMTQgT2N0IDIwMjAgMDg6NDk6MjAg
KzAwMDAgWHUgV2FuZyA8dnVsYWJAaXNjYXMuYWMuY24+IHdyb3RlOgo+IAo+ID4gQmVjYXVzZSBj
bGtfcHJlcGFyZV9lbmFibGUoKSBhbmQgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgYWxyZWFkeSBj
aGVja2VkCj4gPiBOVUxMIGNsb2NrIHBhcmFtZXRlciwgc28gdGhlIGFkZGl0aW9uYWwgY2hlY2tz
IGFyZSB1bm5lY2Vzc2FyeSwganVzdAo+ID4gcmVtb3ZlIHRoZW0uCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IFh1IFdhbmcgPHZ1bGFiQGlzY2FzLmFjLmNuPgo+IAo+IFJldmlld2VkLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiAKCk1lcmdlZCBpbnRvIGRybS1t
aXNjLW5leHQuIFRoYW5rcyEKCj4gPiAtLS0KPiA+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAy
L29tYXBmYi9kc3MvdmVuYy5jIHwgNiArKy0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92
aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZHNzL3ZlbmMuYwo+ID4gYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L29tYXAyL29tYXBmYi9kc3MvdmVuYy5jIGluZGV4Cj4gPiAwYjBhZDIwYWZkNjMuLjg4OTVm
Yjg0OTNkOCAxMDA2NDQgLS0tCj4gPiBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZi
L2Rzcy92ZW5jLmMgKysrCj4gPiBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL2Rz
cy92ZW5jLmMgQEAgLTg5MCw4ICs4OTAsNyBAQCBzdGF0aWMKPiA+IGludCB2ZW5jX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KSAKPiA+ICBzdGF0aWMgaW50IHZlbmNfcnVudGlt
ZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICB7Cj4gPiAtCWlmICh2ZW5jLnR2X2Rh
Y19jbGspCj4gPiAtCQljbGtfZGlzYWJsZV91bnByZXBhcmUodmVuYy50dl9kYWNfY2xrKTsKPiA+
ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHZlbmMudHZfZGFjX2Nsayk7Cj4gPiAgCj4gPiAgCWRp
c3BjX3J1bnRpbWVfcHV0KCk7Cj4gPiAgCj4gPiBAQCAtOTA2LDggKzkwNSw3IEBAIHN0YXRpYyBp
bnQgdmVuY19ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiAgCWlmIChyIDwg
MCkKPiA+ICAJCXJldHVybiByOwo+ID4gIAo+ID4gLQlpZiAodmVuYy50dl9kYWNfY2xrKQo+ID4g
LQkJY2xrX3ByZXBhcmVfZW5hYmxlKHZlbmMudHZfZGFjX2Nsayk7Cj4gPiArCWNsa19wcmVwYXJl
X2VuYWJsZSh2ZW5jLnR2X2RhY19jbGspOwo+ID4gIAo+ID4gIAlyZXR1cm4gMDsKPiA+ICB9Cj4g
Cj4gCj4gCgoKCi0tIApUaG9tYXMgWmltbWVybWFubgpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSApNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkKKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQpHZXNjaMOkZnRz
ZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
