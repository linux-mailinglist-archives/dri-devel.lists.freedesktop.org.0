Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7745728EE36
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 10:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B54F6EC3F;
	Thu, 15 Oct 2020 08:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315AF6EC3F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 08:08:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DED40AE85;
 Thu, 15 Oct 2020 08:08:28 +0000 (UTC)
Date: Thu, 15 Oct 2020 10:08:27 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Xu Wang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] omapfb/dss: Remove redundant null check before
 clk_prepare_enable/clk_disable_unprepare
Message-ID: <20201015100827.1115fa9b@linux-uq9g>
In-Reply-To: <20201014084920.25813-1-vulab@iscas.ac.cn>
References: <20201014084920.25813-1-vulab@iscas.ac.cn>
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

T24gV2VkLCAxNCBPY3QgMjAyMCAwODo0OToyMCArMDAwMCBYdSBXYW5nIDx2dWxhYkBpc2Nhcy5h
Yy5jbj4gd3JvdGU6Cgo+IEJlY2F1c2UgY2xrX3ByZXBhcmVfZW5hYmxlKCkgYW5kIGNsa19kaXNh
YmxlX3VucHJlcGFyZSgpIGFscmVhZHkgY2hlY2tlZAo+IE5VTEwgY2xvY2sgcGFyYW1ldGVyLCBz
byB0aGUgYWRkaXRpb25hbCBjaGVja3MgYXJlIHVubmVjZXNzYXJ5LCBqdXN0Cj4gcmVtb3ZlIHRo
ZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogWHUgV2FuZyA8dnVsYWJAaXNjYXMuYWMuY24+CgpSZXZp
ZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cgo+IC0tLQo+
ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9kc3MvdmVuYy5jIHwgNiArKy0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZHNzL3ZlbmMuYwo+
IGIvZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvZHNzL3ZlbmMuYyBpbmRleAo+IDBi
MGFkMjBhZmQ2My4uODg5NWZiODQ5M2Q4IDEwMDY0NCAtLS0KPiBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvb21hcDIvb21hcGZiL2Rzcy92ZW5jLmMgKysrCj4gYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29t
YXAyL29tYXBmYi9kc3MvdmVuYy5jIEBAIC04OTAsOCArODkwLDcgQEAgc3RhdGljCj4gaW50IHZl
bmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpIAo+ICBzdGF0aWMgaW50IHZl
bmNfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgewo+IC0JaWYgKHZlbmMu
dHZfZGFjX2NsaykKPiAtCQljbGtfZGlzYWJsZV91bnByZXBhcmUodmVuYy50dl9kYWNfY2xrKTsK
PiArCWNsa19kaXNhYmxlX3VucHJlcGFyZSh2ZW5jLnR2X2RhY19jbGspOwo+ICAKPiAgCWRpc3Bj
X3J1bnRpbWVfcHV0KCk7Cj4gIAo+IEBAIC05MDYsOCArOTA1LDcgQEAgc3RhdGljIGludCB2ZW5j
X3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCWlmIChyIDwgMCkKPiAgCQly
ZXR1cm4gcjsKPiAgCj4gLQlpZiAodmVuYy50dl9kYWNfY2xrKQo+IC0JCWNsa19wcmVwYXJlX2Vu
YWJsZSh2ZW5jLnR2X2RhY19jbGspOwo+ICsJY2xrX3ByZXBhcmVfZW5hYmxlKHZlbmMudHZfZGFj
X2Nsayk7Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gIH0KCgoKLS0gClRob21hcyBaaW1tZXJtYW5uCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpCkdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
