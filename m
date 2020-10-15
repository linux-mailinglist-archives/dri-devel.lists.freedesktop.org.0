Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5C628EE40
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 10:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203856E0C1;
	Thu, 15 Oct 2020 08:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C75D6E0C1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 08:10:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D227EB20A;
 Thu, 15 Oct 2020 08:10:16 +0000 (UTC)
Date: Thu, 15 Oct 2020 10:10:15 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Xu Wang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] video: fbdev: sh_mobile_lcdcfb: Remove redundant null
 check before clk_prepare_enable/clk_disable_unprepare
Message-ID: <20201015101015.6dbd25ce@linux-uq9g>
In-Reply-To: <20201014085722.26069-1-vulab@iscas.ac.cn>
References: <20201014085722.26069-1-vulab@iscas.ac.cn>
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

T24gV2VkLCAxNCBPY3QgMjAyMCAwODo1NzoyMiArMDAwMCBYdSBXYW5nIDx2dWxhYkBpc2Nhcy5h
Yy5jbj4gd3JvdGU6Cgo+IEJlY2F1c2UgY2xrX3ByZXBhcmVfZW5hYmxlKCkgYW5kIGNsa19kaXNh
YmxlX3VucHJlcGFyZSgpIGFscmVhZHkgY2hlY2tlZAo+IE5VTEwgY2xvY2sgcGFyYW1ldGVyLCBz
byB0aGUgYWRkaXRpb25hbCBjaGVja3MgYXJlIHVubmVjZXNzYXJ5LCBqdXN0Cj4gcmVtb3ZlIHRo
ZW0uCj4gCj4gU2lnbmVkLW9mZi1ieTogWHUgV2FuZyA8dnVsYWJAaXNjYXMuYWMuY24+CgpSZXZp
ZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cgo+IC0tLQo+
ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NoX21vYmlsZV9sY2RjZmIuYyB8IDYgKystLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9iaWxlX2xjZGNmYi5jCj4gYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L3NoX21vYmlsZV9sY2RjZmIuYyBpbmRleCBjMTA0MzQyMGRiZDMuLmMwOTUy
Y2M5NmJkYgo+IDEwMDY0NCAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NoX21vYmlsZV9sY2Rj
ZmIuYwo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9iaWxlX2xjZGNmYi5jCj4gQEAg
LTM0MSw4ICszNDEsNyBAQCBzdGF0aWMgdm9pZCBsY2RjX3dhaXRfYml0KHN0cnVjdCBzaF9tb2Jp
bGVfbGNkY19wcml2Cj4gKnByaXYsIHN0YXRpYyB2b2lkIHNoX21vYmlsZV9sY2RjX2Nsa19vbihz
dHJ1Y3Qgc2hfbW9iaWxlX2xjZGNfcHJpdiAqcHJpdikKPiAgewo+ICAJaWYgKGF0b21pY19pbmNf
YW5kX3Rlc3QoJnByaXYtPmh3X3VzZWNudCkpIHsKPiAtCQlpZiAocHJpdi0+ZG90X2NsaykKPiAt
CQkJY2xrX3ByZXBhcmVfZW5hYmxlKHByaXYtPmRvdF9jbGspOwo+ICsJCWNsa19wcmVwYXJlX2Vu
YWJsZShwcml2LT5kb3RfY2xrKTsKPiAgCQlwbV9ydW50aW1lX2dldF9zeW5jKHByaXYtPmRldik7
Cj4gIAl9Cj4gIH0KPiBAQCAtMzUxLDggKzM1MCw3IEBAIHN0YXRpYyB2b2lkIHNoX21vYmlsZV9s
Y2RjX2Nsa19vZmYoc3RydWN0Cj4gc2hfbW9iaWxlX2xjZGNfcHJpdiAqcHJpdikgewo+ICAJaWYg
KGF0b21pY19zdWJfcmV0dXJuKDEsICZwcml2LT5od191c2VjbnQpID09IC0xKSB7Cj4gIAkJcG1f
cnVudGltZV9wdXQocHJpdi0+ZGV2KTsKPiAtCQlpZiAocHJpdi0+ZG90X2NsaykKPiAtCQkJY2xr
X2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPmRvdF9jbGspOwo+ICsJCWNsa19kaXNhYmxlX3VucHJl
cGFyZShwcml2LT5kb3RfY2xrKTsKPiAgCX0KPiAgfQo+ICAKCgoKLS0gClRob21hcyBaaW1tZXJt
YW5uCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpCkdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
