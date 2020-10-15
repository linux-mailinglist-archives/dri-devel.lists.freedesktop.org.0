Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C542828EE27
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 10:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9886EC3E;
	Thu, 15 Oct 2020 08:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED356EC3E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 08:06:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 03440AF84;
 Thu, 15 Oct 2020 08:05:59 +0000 (UTC)
Date: Thu, 15 Oct 2020 10:05:57 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Xu Wang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] au1100fb: Remove NULL pointer check before
 clk_enable/disable
Message-ID: <20201015100557.402f831f@linux-uq9g>
In-Reply-To: <20201014082137.23320-1-vulab@iscas.ac.cn>
References: <20201014082137.23320-1-vulab@iscas.ac.cn>
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
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIFdlZCwgMTQgT2N0IDIwMjAgMDg6MjE6MzcgKzAwMDAgWHUgV2FuZyA8dnVsYWJAaXNj
YXMuYWMuY24+IHdyb3RlOgoKPiBCZWNhdXNlIGNsa19lbmFibGUsIGNsa19kaXNhYmxlLCBjbGtf
cHJlcGFyZSwgYW5kIGNsa191bnByZXBhcmUgYWxyZWFkeQo+IGNoZWNrZWQgTlVMTCBjbG9jayBw
YXJhbWV0ZXIsIHNvIHRoZSBhZGRpdGlvbmFsIGNoZWNrcyBhcmUgdW5uZWNlc3NhcnksCj4ganVz
dCByZW1vdmUgdGhlbS4KCkFsbCBjbGtfKigpIGZ1bmN0aW9ucyBzZWVtIHRvIGhhbmRsZSBOVUxM
IHBvaW50ZXJzIGdyYWNlZnVsbHksIHNvIHlvdSBjYW4KYWxzbyByZW1vdmUgdGhlc2UgY2hlY2tz
IGZyb20gdGhlIGRyaXZlcidzIF9wcm9iZSBhbmQgX3JlbW92ZSBmdW5jdGlvbnMuCgpCZXN0IHJl
Z2FyZHMKVGhvbWFzCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFh1IFdhbmcgPHZ1bGFiQGlzY2FzLmFj
LmNuPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2F1MTEwMGZiLmMgfCA2ICsrLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F1MTEwMGZiLmMgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2F1MTEwMGZiLmMKPiBpbmRleCAzN2E2NTEyZmVkYTAuLjM2NTlkZmJiODFjMSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2F1MTEwMGZiLmMKPiArKysgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L2F1MTEwMGZiLmMKPiBAQCAtNTYwLDggKzU2MCw3IEBAIGludCBhdTExMDBm
Yl9kcnZfc3VzcGVuZChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYsCj4gcG1fbWVzc2FnZV90
IHN0YXRlKSAvKiBCbGFuayB0aGUgTENEICovCj4gIAlhdTExMDBmYl9mYl9ibGFuayhWRVNBX1BP
V0VSRE9XTiwgJmZiZGV2LT5pbmZvKTsKPiAgCj4gLQlpZiAoZmJkZXYtPmxjZGNsaykKPiAtCQlj
bGtfZGlzYWJsZShmYmRldi0+bGNkY2xrKTsKPiArCWNsa19kaXNhYmxlKGZiZGV2LT5sY2RjbGsp
Owo+ICAKPiAgCW1lbWNweSgmZmJyZWdzLCBmYmRldi0+cmVncywgc2l6ZW9mKHN0cnVjdCBhdTEx
MDBmYl9yZWdzKSk7Cj4gIAo+IEBAIC01NzcsOCArNTc2LDcgQEAgaW50IGF1MTEwMGZiX2Rydl9y
ZXN1bWUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2KQo+ICAKPiAgCW1lbWNweShmYmRldi0+
cmVncywgJmZicmVncywgc2l6ZW9mKHN0cnVjdCBhdTExMDBmYl9yZWdzKSk7Cj4gIAo+IC0JaWYg
KGZiZGV2LT5sY2RjbGspCj4gLQkJY2xrX2VuYWJsZShmYmRldi0+bGNkY2xrKTsKPiArCWNsa19l
bmFibGUoZmJkZXYtPmxjZGNsayk7Cj4gIAo+ICAJLyogVW5ibGFuayB0aGUgTENEICovCj4gIAlh
dTExMDBmYl9mYl9ibGFuayhWRVNBX05PX0JMQU5LSU5HLCAmZmJkZXYtPmluZm8pOwoKCgotLSAK
VGhvbWFzIFppbW1lcm1hbm4KR3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykKR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4
IEltZW5kw7ZyZmZlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
