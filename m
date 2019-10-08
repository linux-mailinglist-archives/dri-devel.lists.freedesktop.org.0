Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 482D6D0805
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FCF6E908;
	Wed,  9 Oct 2019 07:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id B9C8D6E89D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 20:40:18 +0000 (UTC)
Received: from localhost (p54B3324A.dip0.t-ipconnect.de [84.179.50.74])
 by pokefinder.org (Postfix) with ESMTPSA id 2620B2C07B8;
 Tue,  8 Oct 2019 22:32:06 +0200 (CEST)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND] gpu: drm: bridge: analogix-anx78xx: convert to
 i2c_new_dummy_device
Date: Tue,  8 Oct 2019 22:31:45 +0200
Message-Id: <20191008203145.3159-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW92ZSBmcm9tIHRoZSBkZXByZWNhdGVkIGkyY19uZXdfZHVtbXkoKSB0byBpMmNfbmV3X2R1bW15
X2RldmljZSgpLiBXZQpub3cgZ2V0IGFuIEVSUlBUUiB3aGljaCB3ZSB1c2UgaW4gZXJyb3IgaGFu
ZGxpbmcuCgpTaWduZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5n
aW5lZXJpbmcuY29tPgotLS0KClJlYmFzZWQgdG8gdjUuNC1yYzIgc2luY2UgbGFzdCB0aW1lLiBP
bmUgb2YgdGhlIGxhc3QgdHdvIHVzZXJzIG9mIHRoZQpvbGQgQVBJLCBzbyBwbGVhc2UgYXBwbHkg
c29vbiwgc28gSSBjYW4gcmVtb3ZlIHRoZSBvbGQgaW50ZXJmYWNlLiBPbmx5CmJ1aWxkIHRlc3Rl
ZC4KCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYyB8IDYgKysrLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmMKaW5kZXggM2M3Y2M1YWY3MzVjLi5i
ZTc3NTYyODBlNDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgt
YW54Nzh4eC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5j
CkBAIC0xMzUwLDEwICsxMzUwLDEwIEBAIHN0YXRpYyBpbnQgYW54Nzh4eF9pMmNfcHJvYmUoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCwKIAogCS8qIE1hcCBzbGF2ZSBhZGRyZXNzZXMgb2YgQU5Y
NzgxNCAqLwogCWZvciAoaSA9IDA7IGkgPCBJMkNfTlVNX0FERFJFU1NFUzsgaSsrKSB7Ci0JCWFu
eDc4eHgtPmkyY19kdW1teVtpXSA9IGkyY19uZXdfZHVtbXkoY2xpZW50LT5hZGFwdGVyLAorCQlh
bng3OHh4LT5pMmNfZHVtbXlbaV0gPSBpMmNfbmV3X2R1bW15X2RldmljZShjbGllbnQtPmFkYXB0
ZXIsCiAJCQkJCQlhbng3OHh4X2kyY19hZGRyZXNzZXNbaV0gPj4gMSk7Ci0JCWlmICghYW54Nzh4
eC0+aTJjX2R1bW15W2ldKSB7Ci0JCQllcnIgPSAtRU5PTUVNOworCQlpZiAoSVNfRVJSKGFueDc4
eHgtPmkyY19kdW1teVtpXSkpIHsKKwkJCWVyciA9IFBUUl9FUlIoYW54Nzh4eC0+aTJjX2R1bW15
W2ldKTsKIAkJCURSTV9FUlJPUigiRmFpbGVkIHRvIHJlc2VydmUgSTJDIGJ1cyAlMDJ4XG4iLAog
CQkJCSAgYW54Nzh4eF9pMmNfYWRkcmVzc2VzW2ldKTsKIAkJCWdvdG8gZXJyX3VucmVnaXN0ZXJf
aTJjOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
