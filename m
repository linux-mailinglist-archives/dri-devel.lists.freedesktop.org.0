Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6DCC484C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 09:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5C46E8E7;
	Wed,  2 Oct 2019 07:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from haggis.mythic-beasts.com (haggis.mythic-beasts.com
 [IPv6:2a00:1098:0:86:1000:0:2:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC51B6E554
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 08:04:11 +0000 (UTC)
Received: from [199.195.250.187] (port=57098 helo=hermes.aosc.io)
 by haggis.mythic-beasts.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <icenowy@aosc.io>)
 id 1iFD8i-0004Ki-BO; Tue, 01 Oct 2019 09:04:08 +0100
Received: from localhost (localhost [127.0.0.1]) (Authenticated sender:
 icenowy@aosc.io)
 by hermes.aosc.io (Postfix) with ESMTPSA id B02AC82B00;
 Tue,  1 Oct 2019 08:04:03 +0000 (UTC)
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/3] Revert "drm/sun4i: dsi: Rework a bit the hblk calculation"
Date: Tue,  1 Oct 2019 16:02:53 +0800
Message-Id: <20191001080253.6135-4-icenowy@aosc.io>
In-Reply-To: <20191001080253.6135-1-icenowy@aosc.io>
References: <20191001080253.6135-1-icenowy@aosc.io>
MIME-Version: 1.0
X-BlackCat-Spam-Score: 50
X-Spam-Status: No, score=5.0
X-Mailman-Approved-At: Wed, 02 Oct 2019 07:18:31 +0000
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
Cc: linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCA2MmU3NTExYTRmNGRjZjA3Zjc1Mzg5M2QzNDI0ZGVjZDk0NjZj
OThiLgoKVGhpcyBjb21taXQsIGFsdGhvdWdoIGNsYWltZWQgYXMgYSByZWZhY3RvciwgaW4gZmFj
dCBjaGFuZ2VkIHRoZQpmb3JtdWxhLgoKQnkgZXhwYW5kaW5nIHRoZSBvcmlnaW5hbCBmb3JtdWxh
LCB3ZSBjYW4gZmluZCB0aGF0IHRoZSBjb25zdCAxMCBpcyBub3QKc3Vic3RyYWN0ZWQsIGluc3Rl
YWQgaXQncyBhZGRlZCB0byB0aGUgdmFsdWUgKGJlY2F1c2UgMTAgaXMgbmVnYXRpdmUKd2hlbiBj
YWxjdWxhdGluZyBoc2EsIGFuZCBoc2EgaXRzZWxmIGlzIG5lZ2F0aXZlIHdoZW4gY2FsY3VsYXRp
bmcgaGJsaykuClRoaXMgYnJlYWtzIHRoZSBzaW1pbGFyIHBhdHRlcm4gdG8gb3RoZXIgZm9ybXVs
YXMsIHNvIHJlc3RvcmluZyB0aGUKb3JpZ2luYWwgZm9ybXVsYSBpcyBtb3JlIHByb3Blci4KClNp
Z25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPGljZW5vd3lAYW9zYy5pbz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYyB8IDkgKystLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjZpX21pcGlfZHNpLmMKaW5kZXggMmQzZTgyMmE3NzM5Li5jYjVmZDE5YzBkMGQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCkBAIC01NzcsMTQgKzU3Nyw5IEBAIHN0
YXRpYyB2b2lkIHN1bjZpX2RzaV9zZXR1cF90aW1pbmdzKHN0cnVjdCBzdW42aV9kc2kgKmRzaSwK
IAkJCSAgKG1vZGUtPmhzeW5jX3N0YXJ0IC0gbW9kZS0+aGRpc3BsYXkpICogQnBwIC0gSEZQX1BB
Q0tFVF9PVkVSSEVBRCk7CiAKIAkJLyoKLQkJICogVGhlIGJsYW5raW5nIGlzIHNldCB1c2luZyBh
IHN5bmMgZXZlbnQgKDQgYnl0ZXMpCi0JCSAqIGFuZCBhIGJsYW5raW5nIHBhY2tldCAoNCBieXRl
cyArIHBheWxvYWQgKyAyCi0JCSAqIGJ5dGVzKS4gSXRzIG1pbmltYWwgc2l6ZSBpcyB0aGVyZWZv
cmUgMTAgYnl0ZXMuCisJCSAqIGhibGsgc2VlbXMgdG8gYmUgdGhlIGxpbmUgKyBwb3JjaGVzIGxl
bmd0aC4KIAkJICovCi0jZGVmaW5lIEhCTEtfUEFDS0VUX09WRVJIRUFECTEwCi0JCWhibGsgPSBt
YXgoKHVuc2lnbmVkIGludClIQkxLX1BBQ0tFVF9PVkVSSEVBRCwKLQkJCSAgIChtb2RlLT5odG90
YWwgLSAobW9kZS0+aHN5bmNfZW5kIC0gbW9kZS0+aHN5bmNfc3RhcnQpKSAqIEJwcCAtCi0JCQkg
ICBIQkxLX1BBQ0tFVF9PVkVSSEVBRCk7CisJCWhibGsgPSBtb2RlLT5odG90YWwgKiBCcHAgLSBo
c2E7CiAKIAkJLyoKIAkJICogQW5kIEknbSBub3QgZW50aXJlbHkgc3VyZSB3aGF0IHZibGsgaXMg
YWJvdXQuIFRoZSBkcml2ZXIgaW4KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
