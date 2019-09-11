Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 434C5B077B
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836396E130;
	Thu, 12 Sep 2019 04:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4816A6E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 19:25:20 +0000 (UTC)
Received: from localhost.localdomain
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA3BC33A;
 Wed, 11 Sep 2019 21:25:17 +0200 (CEST)
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm: rcar-du: Add r8a77980 support
Date: Wed, 11 Sep 2019 20:25:01 +0100
Message-Id: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1568229918;
 bh=2zHvimOjrWy5RxcEvOUcnkpkQp9SWOPtz0B4fYTv0aI=;
 h=From:To:Cc:Subject:Date:From;
 b=gFhfY6Pq333rek0/ggUALqlewfGTA3+vF7deVusSv8Pel1bfaBfkIdBkb9VdIPEnb
 jO9BjWbIcxMpAE2AsvrjjMG2dCmuT1dSAN/HPpa6XNGfsIUO2tJXPKl25yzsoo6tX7
 yFYQ5vF4V8Q1e4G9+hQ7neo+x5aNNc6NGLO9vhYY=
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
Cc: David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGRpcmVjdCBzdXBwb3J0IGZvciB0aGUgcjhhNzc5ODAgKFYzSCkuCgpUaGUgVjNIIHNoYXJl
cyBhIGNvbW1vbiwgY29tcGF0aWJsZSBjb25maWd1cmF0aW9uIHdpdGggdGhlIHI4YTc3OTcwCihW
M00pIHNvIHRoYXQgZGV2aWNlIGluZm8gc3RydWN0dXJlIGlzIHJldXNlZC4KClNpZ25lZC1vZmYt
Ynk6IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYyB8IDYgKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMKaW5kZXggZDEwMDNkMzFjZmFmLi5mYzViMDk0OWRh
ZjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYwpAQCAtMzc0LDcgKzM3NCwx
MCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJjYXJfZHVfZGV2aWNlX2luZm8gcmNhcl9kdV9yOGE3
Nzk3MF9pbmZvID0gewogCQkgIHwgUkNBUl9EVV9GRUFUVVJFX1RWTV9TWU5DLAogCS5jaGFubmVs
c19tYXNrID0gQklUKDApLAogCS5yb3V0ZXMgPSB7Ci0JCS8qIFI4QTc3OTcwIGhhcyBvbmUgUkdC
IG91dHB1dCBhbmQgb25lIExWRFMgb3V0cHV0LiAqLworCQkvKgorCQkgKiBSOEE3Nzk3MCBhbmQg
UjhBNzc5ODAgaGF2ZSBvbmUgUkdCIG91dHB1dCBhbmQgb25lIExWRFMKKwkJICogb3V0cHV0Lgor
CQkgKi8KIAkJW1JDQVJfRFVfT1VUUFVUX0RQQUQwXSA9IHsKIAkJCS5wb3NzaWJsZV9jcnRjcyA9
IEJJVCgwKSwKIAkJCS5wb3J0ID0gMCwKQEAgLTQzMiw2ICs0MzUsNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCByY2FyX2R1X29mX3RhYmxlW10gPSB7CiAJeyAuY29tcGF0aWJs
ZSA9ICJyZW5lc2FzLGR1LXI4YTc3OTYiLCAuZGF0YSA9ICZyY2FyX2R1X3I4YTc3OTZfaW5mbyB9
LAogCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxkdS1yOGE3Nzk2NSIsIC5kYXRhID0gJnJjYXJf
ZHVfcjhhNzc5NjVfaW5mbyB9LAogCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxkdS1yOGE3Nzk3
MCIsIC5kYXRhID0gJnJjYXJfZHVfcjhhNzc5NzBfaW5mbyB9LAorCXsgLmNvbXBhdGlibGUgPSAi
cmVuZXNhcyxkdS1yOGE3Nzk4MCIsIC5kYXRhID0gJnJjYXJfZHVfcjhhNzc5NzBfaW5mbyB9LAog
CXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxkdS1yOGE3Nzk5MCIsIC5kYXRhID0gJnJjYXJfZHVf
cjhhNzc5OXhfaW5mbyB9LAogCXsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxkdS1yOGE3Nzk5NSIs
IC5kYXRhID0gJnJjYXJfZHVfcjhhNzc5OXhfaW5mbyB9LAogCXsgfQotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
