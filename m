Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E84BC71262
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B422E89016;
	Tue, 23 Jul 2019 07:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id DB88B89CF5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 17:26:10 +0000 (UTC)
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
 by pokefinder.org (Postfix) with ESMTPSA id 275FB4A1494;
 Mon, 22 Jul 2019 19:26:10 +0200 (CEST)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 1/1] gpu: drm: bridge: analogix-anx78xx: convert to
 i2c_new_dummy_device
Date: Mon, 22 Jul 2019 19:26:09 +0200
Message-Id: <20190722172609.3731-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722172609.3731-1-wsa+renesas@sang-engineering.com>
References: <20190722172609.3731-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW92ZSBmcm9tIGkyY19uZXdfZHVtbXkoKSB0byBpMmNfbmV3X2R1bW15X2RldmljZSgpLCBzbyB3
ZSBub3cgZ2V0IGFuCkVSUlBUUiB3aGljaCB3ZSB1c2UgaW4gZXJyb3IgaGFuZGxpbmcuCgpTaWdu
ZWQtb2ZmLWJ5OiBXb2xmcmFtIFNhbmcgPHdzYStyZW5lc2FzQHNhbmctZW5naW5lZXJpbmcuY29t
PgotLS0KCkdlbmVyYXRlZCB3aXRoIGNvY2NpbmVsbGUuIEJ1aWxkIHRlc3RlZCBieSBtZSBhbmQg
YnVpbGRib3QuIE5vdCB0ZXN0ZWQgb24gSFcuCgogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC1hbng3OHh4LmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fu
YWxvZ2l4LWFueDc4eHguYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4
eC5jCmluZGV4IDNjN2NjNWFmNzM1Yy4uYmU3NzU2MjgwZTQxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguYwpAQCAtMTM1MCwxMCArMTM1MCwxMCBAQCBzdGF0aWMg
aW50IGFueDc4eHhfaTJjX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsCiAKIAkvKiBN
YXAgc2xhdmUgYWRkcmVzc2VzIG9mIEFOWDc4MTQgKi8KIAlmb3IgKGkgPSAwOyBpIDwgSTJDX05V
TV9BRERSRVNTRVM7IGkrKykgewotCQlhbng3OHh4LT5pMmNfZHVtbXlbaV0gPSBpMmNfbmV3X2R1
bW15KGNsaWVudC0+YWRhcHRlciwKKwkJYW54Nzh4eC0+aTJjX2R1bW15W2ldID0gaTJjX25ld19k
dW1teV9kZXZpY2UoY2xpZW50LT5hZGFwdGVyLAogCQkJCQkJYW54Nzh4eF9pMmNfYWRkcmVzc2Vz
W2ldID4+IDEpOwotCQlpZiAoIWFueDc4eHgtPmkyY19kdW1teVtpXSkgewotCQkJZXJyID0gLUVO
T01FTTsKKwkJaWYgKElTX0VSUihhbng3OHh4LT5pMmNfZHVtbXlbaV0pKSB7CisJCQllcnIgPSBQ
VFJfRVJSKGFueDc4eHgtPmkyY19kdW1teVtpXSk7CiAJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBy
ZXNlcnZlIEkyQyBidXMgJTAyeFxuIiwKIAkJCQkgIGFueDc4eHhfaTJjX2FkZHJlc3Nlc1tpXSk7
CiAJCQlnb3RvIGVycl91bnJlZ2lzdGVyX2kyYzsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
