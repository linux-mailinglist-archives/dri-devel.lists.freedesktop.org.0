Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AC8C99D3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 10:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE0C6E903;
	Thu,  3 Oct 2019 08:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8786E889
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 08:28:27 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x938SGt5086185;
 Thu, 3 Oct 2019 03:28:16 -0500
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x938SG2q094622
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Oct 2019 03:28:16 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 03:28:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 03:28:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x938SE6N082784;
 Thu, 3 Oct 2019 03:28:15 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v8 0/5] Add a generic driver for LED-based backlight
Date: Thu, 3 Oct 2019 10:28:07 +0200
Message-ID: <20191003082812.28491-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570091296;
 bh=ZEHDwWZtjItO4loUVl/4DVTQMNSpL7iyeLeaFKV6yBI=;
 h=From:To:CC:Subject:Date;
 b=F9r1mbIEv5nYVhtMXq/tihqyGZ223AwTPNqczkOtK87jYm8rOOwIcmZO4a7Vw6R2N
 h+n5OFLt8B2hQR+Ms5qCJ6VU2XHHWGcIyX9350Xer0AK1vPdCnFDYUGBJpREX01me6
 VDMDVnp3MLcVfXyhxGMAPtMrbLUB1V26hTZkSVNs=
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
a2VkIHRoZSB0aW1lIHRvIHdvcmsgb24gaXQuCgpjaGFuZ2VzIGluIHY4OgotIHVzZSBjbGFzc19m
aW5kX2RldmljZV9ieV9vZl9ub2RlKCkgaW5zdGVhZCBvZiBjbGFzc19maW5kX2RldmljZSgpCi0g
cmVuYW1lZCBkZXZtX2xlZF9nZXQoKSBhcyBkZXZtX29mX2xlZF9nZXQoKQoKY2hhbmdlcyBpbiB2
NzoKLSByZWJhc2VkIG9uIHRvcCBvZiBsaW51eC1sZWRzL2Zvci1uZXh0Ci0gcG9wdWxhdGUgdGhl
IG9mX25vZGUgbWVtYmVyIG9mIHRoZSBMRUQgZGV2aWNlIGlmIGZ3bm9kZSBpcyBhIG9mX25vZGUK
ICAodGhpcyBpcyBhIG5ldyBwYXRjaCBhbmQgdGhlIGZpcnN0IG9mIHRoZSBzZXJpZXMpLgotIGRl
dm1fbGVkX2dldCgpIHdvcmtzIG9ubHkgd2hlbiB0aGUgZGV2aWNlIHRyZWUgaXMgdXNlZC4gQWRk
IGEgZmV3IGNoZWNrcwogIGZvciB0aGF0LiAgCgpjaGFuZ2VzIGluIHY2OgotIHRyaW0gdGhlIGxp
c3Qgb2YgaW5jbHVkZWQgaGVhZGVycwotIHJlbW92ZSB1c2VsZXNzIGRlZmluaXRpb24gb2YgQktM
X0ZVTExfQlJJR0hUTkVTUwoKY2hhbmdlcyBpbiB2NToKLSByZW1vdmVkIExFRCBicmlnaHRuZXNz
IHNjYWxpbmcKLSBkaXNhYmxlIHN5c2ZzIHRoZSBpbnRlcmZhY2Ugb2YgdGhlIExFRHMgd2hlbiB1
c2VkIGJ5IHRoZSBiYWNrbGlnaHQgZGV2aWNlCgpjaGFuZ2VzIGluIHY0OgotIGZpeCBkZXZfZXJy
KCkgbWVzc2FnZXMgYW5kIGNvbW1pdCBsb2dzIGZvbGxvd2luZyB0aGUgYWR2aWNlcyBvZiBQYXZl
bAotIGNvc21ldGljIGNoYW5nZXMgKGluZGVudHMsIGdldHRpbmcgcmlkIG9mICAiPyAxIDogMCIg
aW4KICBsZWRfbWF0Y2hfbGVkX25vZGUoKSkKCmNoYW5nZXMgaW4gdjM6Ci0gZHQgYmluZGluZzog
ZG9uJ3QgbGltaXQgdGhlIGJyaWdodG5lc3MgcmFuZ2UgdG8gMC0yNTUuIFVzZSB0aGUgcmFuZ2Ug
b2YKICB0aGUgdW5kZXJseWluZyBMRURzLiBhcyBhIHNpZGUtZWZmZWN0LCBhbGwgTEVEcyBtdXN0
IG5vdyBoYXZlIHRoZSBzYW1lCiAgcmFuZ2UKLSBkcml2ZXI6IEFkYXB0IHRvIGR0IGJpbmRpbmcg
dXBkYXRlLgotIGRyaXZlcjogcmV3b3JrIHByb2JlKCkgZm9yIGNsYXJpdHkgYW5kIHJlbW92ZSB0
aGUgcmVtYWluaW5nIGdvdG8uCgpjaGFuZ2VzIGluIHYyOgotIGhhbmRsZSBtb3JlIHRoYW4gb25l
IExFRC4KLSBkb24ndCBtYWtlIHRoZSBiYWNrbGlnaHQgZGV2aWNlIGEgY2hpbGQgb2YgdGhlIExF
RCBjb250cm9sbGVyLgotIG1ha2UgYnJpZ2h0bmVzcy1sZXZlbHMgYW5kIGRlZmF1bHQtYnJpZ2h0
bmVzcy1sZXZlbCBvcHRpb25hbAotIHJlbW92ZWQgdGhlIG9wdGlvbiB0byB1c2UgYSBHUElPIGVu
YWJsZS4KLSByZW1vdmVkIHRoZSBvcHRpb24gdG8gdXNlIGEgcmVndWxhdG9yLiBJdCBzaG91bGQg
YmUgaGFuZGxlZCBieSB0aGUgTEVECiAgY29yZQotIGRvbid0IG1ha2UgYW55IGNoYW5nZSB0byB0
aGUgTEVEIGNvcmUgKG5vdCBuZWVkZWQgYW55bW9yZSkKCkplYW4tSmFjcXVlcyBIaWJsb3QgKDMp
OgogIGxlZHM6IHBvcHVsYXRlIHRoZSBkZXZpY2UncyBvZl9ub2RlIHdoZW4gcG9zc2libGUKICBs
ZWRzOiBBZGQgbWFuYWdlZCBBUEkgdG8gZ2V0IGEgTEVEIGZyb20gYSBkZXZpY2UgZHJpdmVyCiAg
ZHQtYmluZGluZ3M6IGJhY2tsaWdodDogQWRkIGxlZC1iYWNrbGlnaHQgYmluZGluZwoKVG9taSBW
YWxrZWluZW4gKDIpOgogIGxlZHM6IEFkZCBvZl9sZWRfZ2V0KCkgYW5kIGxlZF9wdXQoKQogIGJh
Y2tsaWdodDogYWRkIGxlZC1iYWNrbGlnaHQgZHJpdmVyCgogLi4uL2JpbmRpbmdzL2xlZHMvYmFj
a2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0IHwgIDI4ICsrCiBkcml2ZXJzL2xlZHMvbGVkLWNsYXNz
LmMgICAgICAgICAgICAgICAgICAgICAgfCAgOTggKysrKysrLQogZHJpdmVycy92aWRlby9iYWNr
bGlnaHQvS2NvbmZpZyAgICAgICAgICAgICAgIHwgICA3ICsKIGRyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L01ha2VmaWxlICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9sZWRfYmwuYyAgICAgICAgICAgICAgfCAyNjAgKysrKysrKysrKysrKysrKysrCiBpbmNsdWRl
L2xpbnV4L2xlZHMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwogNiBmaWxlcyBj
aGFuZ2VkLCAzOTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQt
YmFja2xpZ2h0LnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0
L2xlZF9ibC5jCgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
