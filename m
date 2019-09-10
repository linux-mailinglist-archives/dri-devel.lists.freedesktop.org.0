Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3540CAEB7D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 15:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188396E0A5;
	Tue, 10 Sep 2019 13:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1436E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 13:27:42 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ADRa78024999;
 Tue, 10 Sep 2019 08:27:36 -0500
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8ADRaoj083874
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Sep 2019 08:27:36 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 10
 Sep 2019 08:27:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 10 Sep 2019 08:27:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ADRZXj013274;
 Tue, 10 Sep 2019 08:27:36 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v6 0/4] Add a generic driver for LED-based backlight
Date: Tue, 10 Sep 2019 15:27:30 +0200
Message-ID: <20190910132734.9544-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1568122056;
 bh=/0jZHmi9qmUF7dODahVIMEyVRRcKL7zZCDXcL7hMf4I=;
 h=From:To:CC:Subject:Date;
 b=eXcKlrV5u591W/A6EQ87dGFxtGiY4lFyASNy7/6kr0I+AKFUtuw0xBeLGYKixU7ob
 qbotB5hd2IjvXwuLiU5I/ZZxzLzR5awYEanWQZWT2tH8VhntZK2JG/f1IIj1p1VaTh
 k0ctN1opwEEYIm0FbK8UHf1kWENan3qsnNvN+5q4=
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
a2VkIHRoZSB0aW1lIHRvIHdvcmsgb24gaXQuCgpjaGFuZ2VzIGluIHY2OgotIHRyaW0gdGhlIGxp
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
aGUgTEVEIGNvcmUgKG5vdCBuZWVkZWQgYW55bW9yZSkKCgpKZWFuLUphY3F1ZXMgSGlibG90ICgy
KToKICBsZWRzOiBBZGQgbWFuYWdlZCBBUEkgdG8gZ2V0IGEgTEVEIGZyb20gYSBkZXZpY2UgZHJp
dmVyCiAgZHQtYmluZGluZ3M6IGJhY2tsaWdodDogQWRkIGxlZC1iYWNrbGlnaHQgYmluZGluZwoK
VG9taSBWYWxrZWluZW4gKDIpOgogIGxlZHM6IEFkZCBvZl9sZWRfZ2V0KCkgYW5kIGxlZF9wdXQo
KQogIGJhY2tsaWdodDogYWRkIGxlZC1iYWNrbGlnaHQgZHJpdmVyCgogLi4uL2JpbmRpbmdzL2xl
ZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0IHwgIDI4ICsrCiBkcml2ZXJzL2xlZHMvbGVk
LWNsYXNzLmMgICAgICAgICAgICAgICAgICAgICAgfCAgOTIgKysrKysrKwogZHJpdmVycy92aWRl
by9iYWNrbGlnaHQvS2NvbmZpZyAgICAgICAgICAgICAgIHwgICA3ICsKIGRyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L01ha2VmaWxlICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9sZWRfYmwuYyAgICAgICAgICAgICAgfCAyNjAgKysrKysrKysrKysrKysrKysrCiBp
bmNsdWRlL2xpbnV4L2xlZHMuaCAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwogNiBm
aWxlcyBjaGFuZ2VkLCAzOTQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0
LnR4dAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xlZF9ibC5j
CgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
