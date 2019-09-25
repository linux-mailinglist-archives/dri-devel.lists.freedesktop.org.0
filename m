Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAABBDDA9
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 14:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A348991A;
	Wed, 25 Sep 2019 12:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251B58991A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 12:04:02 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1iD61V-0006Wm-KQ; Wed, 25 Sep 2019 12:03:57 +0000
From: Colin King <colin.king@canonical.com>
To: Stefan Mavrodiev <stefan@olimex.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: clean up indentation issue
Date: Wed, 25 Sep 2019 13:03:57 +0100
Message-Id: <20190925120357.10408-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClRoZXJlIGlz
IGEgY29udGludWUgc3RhdGVtZW50IHRoYXQgaXMgaW5kZW50ZWQgb25lIGxldmVsIHRvbyBkZWVw
bHksCnJlbW92ZSB0aGUgZXh0cmFuZW91cyB0YWIuCgpTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4g
S2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1vbGltZXgtbGNkLW9saW51eGluby5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLW9saW1leC1sY2Qtb2xpbnV4aW5vLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtb2xpbWV4LWxjZC1vbGludXhpbm8uYwppbmRleCAyYmFlMWRiM2ZmMzQuLjdkZDY3
MjYyYTJlZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW9saW1leC1s
Y2Qtb2xpbnV4aW5vLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLW9saW1leC1s
Y2Qtb2xpbnV4aW5vLmMKQEAgLTE2MSw3ICsxNjEsNyBAQCBzdGF0aWMgaW50IGxjZF9vbGludXhp
bm9fZ2V0X21vZGVzKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogCQkJCWxjZF9tb2RlLT5oYWN0
aXZlLAogCQkJCWxjZF9tb2RlLT52YWN0aXZlLAogCQkJCWxjZF9tb2RlLT5yZWZyZXNoKTsKLQkJ
CQljb250aW51ZTsKKwkJCWNvbnRpbnVlOwogCQl9CiAKIAkJbW9kZS0+Y2xvY2sgPSBsY2RfbW9k
ZS0+cGl4ZWxjbG9jazsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
