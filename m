Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2ADBB6687
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 16:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBF96F3D1;
	Wed, 18 Sep 2019 14:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245CF6F3D1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 14:57:46 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8IEvf7G030885;
 Wed, 18 Sep 2019 09:57:41 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8IEvfLS003149
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Sep 2019 09:57:41 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 18
 Sep 2019 09:57:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 18 Sep 2019 09:57:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8IEvdlH012783;
 Wed, 18 Sep 2019 09:57:40 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v7 0/5] Add a generic driver for LED-based backlight
Date: Wed, 18 Sep 2019 16:57:25 +0200
Message-ID: <20190918145730.22805-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1568818661;
 bh=YZMQQ9rDqkdsxQjmsPw71m3JOMBZg+cqKmNu/NVV8jw=;
 h=From:To:CC:Subject:Date;
 b=HHQRgiBrlOd3HrxDcN/lDislCD07wT5VqZdN5uW3bCMkC7y/DGgGAeQKs5KbRxTH4
 8dUlqPQlM3/FJLEeiInZkk1XXo6RNaLODKtX7xOTPEJEz93pBGtPGHwAIjdxyohVg/
 6PmNHCKxui18FvXyCrXeihhwaxslA6fzDbdxciJc=
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
 tomi.valkeinen@ti.com, dmurphy@ti.com, jjhiblot@ti.com,
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
a2VkIHRoZSB0aW1lIHRvIHdvcmsgb24gaXQuCgpjaGFuZ2VzIGluIHY3OgotIHJlYmFzZWQgb24g
dG9wIG9mIGxpbnV4LWxlZHMvZm9yLW5leHQKLSBwb3B1bGF0ZSB0aGUgb2Zfbm9kZSBtZW1iZXIg
b2YgdGhlIExFRCBkZXZpY2UgaWYgZndub2RlIGlzIGEgb2Zfbm9kZQogICh0aGlzIGlzIGEgbmV3
IHBhdGNoIGFuZCB0aGUgZmlyc3Qgb2YgdGhlIHNlcmllcykuCi0gZGV2bV9sZWRfZ2V0KCkgd29y
a3Mgb25seSB3aGVuIHRoZSBkZXZpY2UgdHJlZSBpcyB1c2VkLiBBZGQgYSBmZXcgY2hlY2tzCiAg
Zm9yIHRoYXQuICAKCmNoYW5nZXMgaW4gdjY6Ci0gdHJpbSB0aGUgbGlzdCBvZiBpbmNsdWRlZCBo
ZWFkZXJzCi0gcmVtb3ZlIHVzZWxlc3MgZGVmaW5pdGlvbiBvZiBCS0xfRlVMTF9CUklHSFRORVNT
CgpjaGFuZ2VzIGluIHY1OgotIHJlbW92ZWQgTEVEIGJyaWdodG5lc3Mgc2NhbGluZwotIGRpc2Fi
bGUgc3lzZnMgdGhlIGludGVyZmFjZSBvZiB0aGUgTEVEcyB3aGVuIHVzZWQgYnkgdGhlIGJhY2ts
aWdodCBkZXZpY2UKCmNoYW5nZXMgaW4gdjQ6Ci0gZml4IGRldl9lcnIoKSBtZXNzYWdlcyBhbmQg
Y29tbWl0IGxvZ3MgZm9sbG93aW5nIHRoZSBhZHZpY2VzIG9mIFBhdmVsCi0gY29zbWV0aWMgY2hh
bmdlcyAoaW5kZW50cywgZ2V0dGluZyByaWQgb2YgICI/IDEgOiAwIiBpbgogIGxlZF9tYXRjaF9s
ZWRfbm9kZSgpKQoKY2hhbmdlcyBpbiB2MzoKLSBkdCBiaW5kaW5nOiBkb24ndCBsaW1pdCB0aGUg
YnJpZ2h0bmVzcyByYW5nZSB0byAwLTI1NS4gVXNlIHRoZSByYW5nZSBvZgogIHRoZSB1bmRlcmx5
aW5nIExFRHMuIGFzIGEgc2lkZS1lZmZlY3QsIGFsbCBMRURzIG11c3Qgbm93IGhhdmUgdGhlIHNh
bWUKICByYW5nZQotIGRyaXZlcjogQWRhcHQgdG8gZHQgYmluZGluZyB1cGRhdGUuCi0gZHJpdmVy
OiByZXdvcmsgcHJvYmUoKSBmb3IgY2xhcml0eSBhbmQgcmVtb3ZlIHRoZSByZW1haW5pbmcgZ290
by4KCmNoYW5nZXMgaW4gdjI6Ci0gaGFuZGxlIG1vcmUgdGhhbiBvbmUgTEVELgotIGRvbid0IG1h
a2UgdGhlIGJhY2tsaWdodCBkZXZpY2UgYSBjaGlsZCBvZiB0aGUgTEVEIGNvbnRyb2xsZXIuCi0g
bWFrZSBicmlnaHRuZXNzLWxldmVscyBhbmQgZGVmYXVsdC1icmlnaHRuZXNzLWxldmVsIG9wdGlv
bmFsCi0gcmVtb3ZlZCB0aGUgb3B0aW9uIHRvIHVzZSBhIEdQSU8gZW5hYmxlLgotIHJlbW92ZWQg
dGhlIG9wdGlvbiB0byB1c2UgYSByZWd1bGF0b3IuIEl0IHNob3VsZCBiZSBoYW5kbGVkIGJ5IHRo
ZSBMRUQKICBjb3JlCi0gZG9uJ3QgbWFrZSBhbnkgY2hhbmdlIHRvIHRoZSBMRUQgY29yZSAobm90
IG5lZWRlZCBhbnltb3JlKQoKSmVhbi1KYWNxdWVzIEhpYmxvdCAoMyk6CiAgbGVkczogcG9wdWxh
dGUgdGhlIGRldmljZSdzIG9mX25vZGUgd2hlbiBwb3NzaWJsZQogIGxlZHM6IEFkZCBtYW5hZ2Vk
IEFQSSB0byBnZXQgYSBMRUQgZnJvbSBhIGRldmljZSBkcml2ZXIKICBkdC1iaW5kaW5nczogYmFj
a2xpZ2h0OiBBZGQgbGVkLWJhY2tsaWdodCBiaW5kaW5nCgpUb21pIFZhbGtlaW5lbiAoMik6CiAg
bGVkczogQWRkIG9mX2xlZF9nZXQoKSBhbmQgbGVkX3B1dCgpCiAgYmFja2xpZ2h0OiBhZGQgbGVk
LWJhY2tsaWdodCBkcml2ZXIKCiAuLi4vYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2ts
aWdodC50eHQgfCAgMjggKysKIGRyaXZlcnMvbGVkcy9sZWQtY2xhc3MuYyAgICAgICAgICAgICAg
ICAgICAgICB8IDEwNiArKysrKystCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9LY29uZmlnICAg
ICAgICAgICAgICAgfCAgIDcgKwogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvTWFrZWZpbGUgICAg
ICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xlZF9ibC5jICAgICAg
ICAgICAgICB8IDI2MCArKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvbGVkcy5oICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArCiA2IGZpbGVzIGNoYW5nZWQsIDQwNyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0CiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbGVkX2JsLmMKCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
