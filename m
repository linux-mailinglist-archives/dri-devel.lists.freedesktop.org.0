Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A56FD0A2C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 10:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AE4894A7;
	Wed,  9 Oct 2019 08:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4491C88F0A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 08:51:45 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x998pdU5016790;
 Wed, 9 Oct 2019 03:51:39 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x998pdxZ043360
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Oct 2019 03:51:39 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 03:51:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 03:51:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x998pcYp094169;
 Wed, 9 Oct 2019 03:51:39 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v10 0/6] Add a generic driver for LED-based backlight
Date: Wed, 9 Oct 2019 10:51:21 +0200
Message-ID: <20191009085127.22843-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570611099;
 bh=2z8YgTtODIlrawxiMLn2c8ZI7bBATmOhOqscoBx++x8=;
 h=From:To:CC:Subject:Date;
 b=D60ko1orhIerWI00abYbJIBXI+8nWD2vdDsV3LyyZqhHcfBBXKxuEqUc+Nqip+3M/
 599PsfYopNqStfkLh33B3Cs1bGtkm0xqsRCdpzyYrVwU0S2p3hdmlvtTEi0E/tVLW2
 uBWx0RQsxJ9O8PvUsDtOWpO/qAZbt+sPL1udPw4w=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tomi.valkeinen@ti.com, dmurphy@ti.com, Jean-Jacques Hiblot <jjhiblot@ti.com>,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYWltcyB0byBhZGQgYSBsZWQtYmFja2xpZ2h0IGRyaXZlciwgc2ltaWxhciB0
byBwd20tYmFja2xpZ2h0LApidXQgdXNpbmcgYSBMRUQgY2xhc3MgZGV2aWNlIHVuZGVybmVhdGgu
CgpBIGZldyB5ZWFycyBhZ28gKDIwMTUpLCBUb21pIFZhbGtlaW5lbiBwb3N0ZWQgYSBzZXJpZXMg
aW1wbGVtZW50aW5nIGEKYmFja2xpZ2h0IGRyaXZlciBvbiB0b3Agb2YgYSBMRUQgZGV2aWNlOgpo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzcyOTM5OTEvCmh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcGF0Y2gvNzI5NDAwMS8KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wYXRjaC83MjkzOTgxLwoKVGhlIGRpc2N1c3Npb24gc3RvcHBlZCBiZWNhdXNlIFRvbWkgbGFj
a2VkIHRoZSB0aW1lIHRvIHdvcmsgb24gaXQuCgpjaGFuZ2VzIGluIHYxMDoKLSBQcm92aWRlIGEg
WUFNTCBzY2hlbWEgaW5zdGVhZCBvZiB0ZXh0IGZpbGUgZm9yIHRoZSBkb2N1bWVudGF0aW9uIG9m
IHRoZQogIExFRCBiYWNrbGlnaHQgZGV2aWNlLXRyZWUgYmluZGluZ3MuCi0gQWRkIGEgc2hvcnQg
ZGVzY3JpcHRpb24gb2YgaG93IHRoZSBMRUQgcHJvcGVydGllcyBzaG91bGQgYmUgbmFtZWQgaW4K
ICB0aGUgY29tbW9uIExFRCBiaW5kaW5nIGRvY3VtZW50YXRpb24uIChuZXcgcGF0Y2gpCi0gcmVu
YW1lIHByb3BlcnR5ICJkZWZhdWx0LWJyaWdodG5lc3MtbGV2ZWwiIGFzICJkZWZhdWx0LWJyaWdo
dG5lc3MiLAogIGZvbGxvd2luZyB0aGUgbWFqb3JpdHkgaGVyZS4KCmNoYW5nZXMgaW4gdjk6Ci0g
bGV0IHRvX29mX25vZGUoKSBjaGVjayBpZiB0aGUgZndub2RlIGlzIGFjdHVhbGx5IGEgb2Zfbm9k
ZQotIGFkZCBzb21lIGNoZWNrcyBpbiBvZl9sZWRfZ2V0KCkKLSBsZXQgZGV2X29mX25vZGUoKSBk
byB0aGUgY2hlY2sgYWJvdXQgT0YgYXZhaWxhYmlsdHkKLSByZWZhY3RvciBsZWRfYmxfcHJvYmUo
KSB0byByZWdpc3RlciBhIGNsZWFudXAgZnVuY3Rpb24gd2l0aAogIGRldm1fYWRkX2FjdGlvbl9v
cl9yZXNldCgpLiBUaGlzIHNpbXBsaWZpZXMgdGhlIGVycm9yIGhhbmRsaW5nICh3aGljaAogIHdh
cyBub3QgMTAwJSBkb25lIGluIHY3KSBhbmQgYWxsb3dzIHRvIGdldCByaWQgb2YgbGVkX2JsX3Jl
bW92ZSgpCgpjaGFuZ2VzIGluIHY4OgotIHVzZSBjbGFzc19maW5kX2RldmljZV9ieV9vZl9ub2Rl
KCkgaW5zdGVhZCBvZiBjbGFzc19maW5kX2RldmljZSgpCi0gcmVuYW1lZCBkZXZtX2xlZF9nZXQo
KSBhcyBkZXZtX29mX2xlZF9nZXQoKQoKY2hhbmdlcyBpbiB2NzoKLSByZWJhc2VkIG9uIHRvcCBv
ZiBsaW51eC1sZWRzL2Zvci1uZXh0Ci0gcG9wdWxhdGUgdGhlIG9mX25vZGUgbWVtYmVyIG9mIHRo
ZSBMRUQgZGV2aWNlIGlmIGZ3bm9kZSBpcyBhIG9mX25vZGUKICAodGhpcyBpcyBhIG5ldyBwYXRj
aCBhbmQgdGhlIGZpcnN0IG9mIHRoZSBzZXJpZXMpLgotIGRldm1fbGVkX2dldCgpIHdvcmtzIG9u
bHkgd2hlbiB0aGUgZGV2aWNlIHRyZWUgaXMgdXNlZC4gQWRkIGEgZmV3IGNoZWNrcwogIGZvciB0
aGF0LiAgCgpjaGFuZ2VzIGluIHY2OgotIHRyaW0gdGhlIGxpc3Qgb2YgaW5jbHVkZWQgaGVhZGVy
cwotIHJlbW92ZSB1c2VsZXNzIGRlZmluaXRpb24gb2YgQktMX0ZVTExfQlJJR0hUTkVTUwoKY2hh
bmdlcyBpbiB2NToKLSByZW1vdmVkIExFRCBicmlnaHRuZXNzIHNjYWxpbmcKLSBkaXNhYmxlIHN5
c2ZzIHRoZSBpbnRlcmZhY2Ugb2YgdGhlIExFRHMgd2hlbiB1c2VkIGJ5IHRoZSBiYWNrbGlnaHQg
ZGV2aWNlCgpjaGFuZ2VzIGluIHY0OgotIGZpeCBkZXZfZXJyKCkgbWVzc2FnZXMgYW5kIGNvbW1p
dCBsb2dzIGZvbGxvd2luZyB0aGUgYWR2aWNlcyBvZiBQYXZlbAotIGNvc21ldGljIGNoYW5nZXMg
KGluZGVudHMsIGdldHRpbmcgcmlkIG9mICAiPyAxIDogMCIgaW4KICBsZWRfbWF0Y2hfbGVkX25v
ZGUoKSkKCmNoYW5nZXMgaW4gdjM6Ci0gZHQgYmluZGluZzogZG9uJ3QgbGltaXQgdGhlIGJyaWdo
dG5lc3MgcmFuZ2UgdG8gMC0yNTUuIFVzZSB0aGUgcmFuZ2Ugb2YKICB0aGUgdW5kZXJseWluZyBM
RURzLiBhcyBhIHNpZGUtZWZmZWN0LCBhbGwgTEVEcyBtdXN0IG5vdyBoYXZlIHRoZSBzYW1lCiAg
cmFuZ2UKLSBkcml2ZXI6IEFkYXB0IHRvIGR0IGJpbmRpbmcgdXBkYXRlLgotIGRyaXZlcjogcmV3
b3JrIHByb2JlKCkgZm9yIGNsYXJpdHkgYW5kIHJlbW92ZSB0aGUgcmVtYWluaW5nIGdvdG8uCgpj
aGFuZ2VzIGluIHYyOgotIGhhbmRsZSBtb3JlIHRoYW4gb25lIExFRC4KLSBkb24ndCBtYWtlIHRo
ZSBiYWNrbGlnaHQgZGV2aWNlIGEgY2hpbGQgb2YgdGhlIExFRCBjb250cm9sbGVyLgotIG1ha2Ug
YnJpZ2h0bmVzcy1sZXZlbHMgYW5kIGRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbCBvcHRpb25hbAot
IHJlbW92ZWQgdGhlIG9wdGlvbiB0byB1c2UgYSBHUElPIGVuYWJsZS4KLSByZW1vdmVkIHRoZSBv
cHRpb24gdG8gdXNlIGEgcmVndWxhdG9yLiBJdCBzaG91bGQgYmUgaGFuZGxlZCBieSB0aGUgTEVE
CiAgY29yZQotIGRvbid0IG1ha2UgYW55IGNoYW5nZSB0byB0aGUgTEVEIGNvcmUgKG5vdCBuZWVk
ZWQgYW55bW9yZSkKCkplYW4tSmFjcXVlcyBIaWJsb3QgKDQpOgogIGxlZHM6IHBvcHVsYXRlIHRo
ZSBkZXZpY2UncyBvZl9ub2RlCiAgbGVkczogQWRkIG1hbmFnZWQgQVBJIHRvIGdldCBhIExFRCBm
cm9tIGEgZGV2aWNlIGRyaXZlcgogIGR0cy1iaW5kaW5nczogbGVkczogRG9jdW1lbnQgdGhlIG5h
bWluZyByZXF1aXJlbWVudCBmb3IgTEVEIHByb3BlcnRpZXMKICBkdC1iaW5kaW5nczogYmFja2xp
Z2h0OiBBZGQgbGVkLWJhY2tsaWdodCBiaW5kaW5nCgpUb21pIFZhbGtlaW5lbiAoMik6CiAgbGVk
czogQWRkIG9mX2xlZF9nZXQoKSBhbmQgbGVkX3B1dCgpCiAgYmFja2xpZ2h0OiBhZGQgbGVkLWJh
Y2tsaWdodCBkcml2ZXIKCiAuLi4vbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC55YW1sICAg
ICAgICAgfCAgNTUgKysrKwogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9jb21tb24udHh0
ICAgICAgIHwgIDIwICstCiBkcml2ZXJzL2xlZHMvbGVkLWNsYXNzLmMgICAgICAgICAgICAgICAg
ICAgICAgfCAxMDMgKysrKysrLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvS2NvbmZpZyAgICAg
ICAgICAgICAgIHwgICA3ICsKIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L01ha2VmaWxlICAgICAg
ICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sZWRfYmwuYyAgICAgICAg
ICAgICAgfCAyNTggKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2xpbnV4L2xlZHMuaCAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwogNyBmaWxlcyBjaGFuZ2VkLCA0NDYgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC55YW1sCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGVkX2JsLmMKCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
