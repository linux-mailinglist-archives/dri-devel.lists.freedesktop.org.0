Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 141E22C0422
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 12:20:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A86F89F41;
	Mon, 23 Nov 2020 11:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE3589DC1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:53 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s13so16853565wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+mJp/ZJF2fFOdQnMH+2RLRCl5LAsiRJ8lK5Mp9M3IrA=;
 b=pGRSDl6ZZ6iHS5KUMMUVMTZNqFR7SFiatCJxWyjgYvflweYqP5nen0rwMFWz3zWAUP
 F9vD3BXT96by7P/QzeyM+zO1ABElGZng++/2COnRLJpPOo85dbY8EMGmtVXcElg8CA9T
 BcAcJfYFvZTsDq8wEh6RLmGsyKcCngpWt/oaOQhCeD1GwlY++9cTPjKGF+z63ceefWDa
 OiXnGDIjLZ1YbjSACRPQhuW/gcKkHhXmVucUmc2b/J9bECm5myRUcHiOh1WtcLGMqxxV
 r2lQ6ssplWP6uF8VZfZScTZ7urI2Hozk/TR1Lbszu529iDtfIhE0/YTmlkhv7T3cnYTQ
 Zjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+mJp/ZJF2fFOdQnMH+2RLRCl5LAsiRJ8lK5Mp9M3IrA=;
 b=Gl03+AEaHtsyhqxGThIOSbfTuZrGOqg1XZqqqPqwnO4jliRgvk+iwbiOtGbbS2vEz1
 tNhmX2ikN3l9BYTDFk8BZSx4C0CqFq89cWI3hqa9iobsjBpPzU8ui4ZhMe/Wts56ot64
 S+xJNNSdirb0d6Nqe+CURCikFCE1gUQU2BHRbLgipdy7XCr36epFFXOGrsnpVRuS4H6p
 JicyWebL7elkUcns4iUwdvmhqfAbzkFVzqpUHTV2e8Imqp7eSns4uJnx3zBJskQkpMgr
 czJg4QOQRBLwwlU6HOFOafCzVrEbV1xz5Fg3OvEwuEHmtlw4i/Cacu8MkD4vgj2hMn9f
 9vaw==
X-Gm-Message-State: AOAM5312tYdhmDLtnStc8MMWIyJiSc1Tu+Bwgwy5tt8Jnqtv7JAht70x
 uY41y/F66GYU9e67F2kA6i78/Q==
X-Google-Smtp-Source: ABdhPJx9N0T7kD5rTXkjFAUKmVJ6haqyTW8x9cxW/A4t95quKeeGUp0vIN2Hq7Ju8oF0FGdNdWSusw==
X-Received: by 2002:a1c:98cd:: with SMTP id a196mr23581122wme.42.1606130391783; 
 Mon, 23 Nov 2020 03:19:51 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:51 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 23/40] drm/amd/include/vega20_ip_offset: Mark top-level
 IP_BASE definition as __maybe_unused
Date: Mon, 23 Nov 2020 11:19:02 +0000
Message-Id: <20201123111919.233376-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92ZWdhMjBf
cmVnX2luaXQuYzoyNzoKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2luY2x1ZGUvdmVn
YTIwX2lwX29mZnNldC5oOjE1NDoyOTogd2FybmluZzog4oCYWERNQV9CQVNF4oCZIGRlZmluZWQg
YnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT0KIDE1NCB8IHN0YXRpYyBjb25z
dCBzdHJ1Y3QgSVBfQkFTRSBYRE1BX0JBU0UgPXsgeyB7IHsgMHgwMDAwMzQwMCwgMCwgMCwgMCwg
MCwgMCB9IH0sCiB8IF5+fn5+fn5+fgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vaW5j
bHVkZS92ZWdhMjBfaXBfb2Zmc2V0Lmg6NjM6Mjk6IHdhcm5pbmc6IOKAmEZVU0VfQkFTReKAmSBk
ZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFibGU9XQogNjMgfCBzdGF0
aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgRlVTRV9CQVNFID17IHsgeyB7IDB4MDAwMTc0MDAsIDAs
IDAsIDAsIDAsIDAgfSB9LAogfCBefn5+fn5+fn4KCkZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtl
cm5lbCBidWlsZCB3YXJuaW5nKHMpOgoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVz
IDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUv
dmVnYTIwX2lwX29mZnNldC5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRl
L3ZlZ2EyMF9pcF9vZmZzZXQuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS92ZWdhMjBf
aXBfb2Zmc2V0LmgKaW5kZXggMmEyYTljYzhiZWRiNi4uMWRlYjY4ZjNkMzM0MSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL3ZlZ2EyMF9pcF9vZmZzZXQuaAorKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvdmVnYTIwX2lwX29mZnNldC5oCkBAIC0zMyw3ICsz
Myw3IEBAIHN0cnVjdCBJUF9CQVNFX0lOU1RBTkNFCiBzdHJ1Y3QgSVBfQkFTRQogewogICAgIHN0
cnVjdCBJUF9CQVNFX0lOU1RBTkNFIGluc3RhbmNlW01BWF9JTlNUQU5DRV07Ci19OworfSBfX21h
eWJlX3VudXNlZDsKIAogCiBzdGF0aWMgY29uc3Qgc3RydWN0IElQX0JBU0UgQVRIVUJfQkFTRSAg
ICAgICAgICAgID17IHsgeyB7IDB4MDAwMDBDMjAsIDAsIDAsIDAsIDAsIDAgfSB9LAotLSAKMi4y
NS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
