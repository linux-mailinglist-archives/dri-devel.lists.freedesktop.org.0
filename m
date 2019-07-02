Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06915D26D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 17:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A4A89E50;
	Tue,  2 Jul 2019 15:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6084D89E50
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 15:09:59 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E4CB9283DB4;
 Tue,  2 Jul 2019 16:09:56 +0100 (BST)
Date: Tue, 2 Jul 2019 17:09:54 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] drm: connector: remove bogus NULL check
Message-ID: <20190702170954.4594bb21@collabora.com>
In-Reply-To: <20190628103925.2686249-1-arnd@arndb.de>
References: <20190628103925.2686249-1-arnd@arndb.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>,
 Uma Shankar <uma.shankar@intel.com>, Sean Paul <sean@poorly.run>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyOCBKdW4gMjAxOSAxMjozOTowNSArMDIwMApBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPiB3cm90ZToKCj4gbW9kZS0+bmFtZSBpcyBhIGNoYXJhY3RlciBhcnJheSBpbiBhIHN0
cnVjdHVyZSwgY2hlY2tpbmcgaXQncwo+IGFkZHJlc3MgaXMgcG9pbnRsZXNzIGFuZCBjYXVzZXMg
YSB3YXJuaW5nIHdpdGggc29tZSBjb21waWxlcnM6Cj4gCj4gZHJpdmVycy9ncHUvZHJtL2RybV9j
b25uZWN0b3IuYzoxNDQ6MTU6IGVycm9yOiBhZGRyZXNzIG9mIGFycmF5ICdtb2RlLT5uYW1lJyB3
aWxsIGFsd2F5cyBldmFsdWF0ZSB0byAndHJ1ZScKPiAgICAgICBbLVdlcnJvciwtV3BvaW50ZXIt
Ym9vbC1jb252ZXJzaW9uXQo+ICAgICAgICAgICAgICAgICAgICAgICBtb2RlLT5uYW1lID8gbW9k
ZS0+bmFtZSA6ICIiLAo+ICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5efn5+IH4KPiBpbmNs
dWRlL2RybS9kcm1fcHJpbnQuaDozNjY6Mjk6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFjcm8gJ0RS
TV9ERUJVR19LTVMnCj4gICAgICAgICBkcm1fZGJnKERSTV9VVF9LTVMsIGZtdCwgIyNfX1ZBX0FS
R1NfXykKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+Cj4g
Cj4gUmVtb3ZlIHRoZSBjaGVjayBoZXJlLgo+IAo+IEZpeGVzOiAzYWVlYjEzZDg5OTYgKCJkcm0v
bW9kZXM6IFN1cHBvcnQgbW9kZXMgbmFtZXMgb24gdGhlIGNvbW1hbmQgbGluZSIpCj4gU2lnbmVk
LW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KClF1ZXVlZCB0byBkcm0tbWlz
Yy1uZXh0LWZpeGVzLgoKVGhhbmtzLAoKQm9yaXMKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9k
cm1fY29ubmVjdG9yLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5l
Y3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYwo+IGluZGV4IDNhZmVkNTY3
Nzk0Ni4uYjNmMmNmN2VhZTljIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29u
bmVjdG9yLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCj4gQEAgLTE0
MSw3ICsxNDEsNyBAQCBzdGF0aWMgdm9pZCBkcm1fY29ubmVjdG9yX2dldF9jbWRsaW5lX21vZGUo
c3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiAgCj4gIAlEUk1fREVCVUdfS01TKCJj
bWRsaW5lIG1vZGUgZm9yIGNvbm5lY3RvciAlcyAlcyAlZHglZEAlZEh6JXMlcyVzXG4iLAo+ICAJ
CSAgICAgIGNvbm5lY3Rvci0+bmFtZSwKPiAtCQkgICAgICBtb2RlLT5uYW1lID8gbW9kZS0+bmFt
ZSA6ICIiLAo+ICsJCSAgICAgIG1vZGUtPm5hbWUsCj4gIAkJICAgICAgbW9kZS0+eHJlcywgbW9k
ZS0+eXJlcywKPiAgCQkgICAgICBtb2RlLT5yZWZyZXNoX3NwZWNpZmllZCA/IG1vZGUtPnJlZnJl
c2ggOiA2MCwKPiAgCQkgICAgICBtb2RlLT5yYiA/ICIgcmVkdWNlZCBibGFua2luZyIgOiAiIiwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
