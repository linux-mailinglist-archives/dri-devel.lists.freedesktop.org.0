Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 701C0179EE
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 15:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1099C8991C;
	Wed,  8 May 2019 13:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5FE89919;
 Wed,  8 May 2019 13:07:30 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id j1so6426184qkk.12;
 Wed, 08 May 2019 06:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PB0UQqZL2l81e8KBphbHsFIt1aSxB71MYNy4uU0+TBs=;
 b=lLBSqHwxJi99CQSU9lCTvQJuuGNgDHDUzWp+WgpbrmkQMY7BgfkwjGh0959IWZ0c3r
 K5s4svpUQ6e0Q2gMwOrAGueslfbICrhV4rRCydCdOPqGQhGfEbknG6k8BlMGsH1ALTW8
 6PDsFZXQHEb3e5dhq3SgjvO0Yr/CaHq3CT6t49zakFiAb8GkkTVKUvnp8/4cap7jHGbP
 P47H+5/I5glCWNdFByzg4axPxGhhuqa8NE1lyVQgGZGkDx3UXVAZVHMccS/HO+fOP/6M
 lFMjTIZ9uNFHRjezOL8LluQ99g6YT1W78J8hrdvlYyqghReIQTNVQtMAVxs0QgaJJW34
 u+7Q==
X-Gm-Message-State: APjAAAXdveeh/jdX40dDGs8i/wm/WcVeZv3KyST8vUFZcoWpg50h8pbs
 jwXxFcqtmRN8aMr2rDzf14TwwMY6k80=
X-Google-Smtp-Source: APXvYqwdNnENVaxCQS/UfbH5uDsAC1Cpc98U/DY8M3zrGBK2M8tRp+nc6/EGVHJZB5x+wEqALkCAtg==
X-Received: by 2002:a37:40d2:: with SMTP id n201mr29155323qka.83.1557320849170; 
 Wed, 08 May 2019 06:07:29 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:6268:7a0b:50be:cebc])
 by smtp.gmail.com with ESMTPSA id g206sm9021192qkb.75.2019.05.08.06.07.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 06:07:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/a6xx: No zap shader is not an error
Date: Wed,  8 May 2019 06:06:52 -0700
Message-Id: <20190508130726.27557-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PB0UQqZL2l81e8KBphbHsFIt1aSxB71MYNy4uU0+TBs=;
 b=cFSVhlXBBuje5m5yG1SvlpxPFYTkUqhuABFFnM8Vap7s0cUik1oEGWP9QprZQO/4N5
 3hIN3RGR1yVlwPky/QSUD9Q7ZHA7b8BPqbuwQvTvsuw+p7GFIWmRIGuTrLFcyGjlvCOg
 cbWGC5thnbw+vzjdfs7WW6Sj1cjDOdFDkunmt2TPMNxOLKDTVHUxJ/iRJYv0nW/aaLjF
 AYVX1MhiuDZ6p133n04G6zR0Afc9LSBf7Nef7XBmhWgSQRpg2F9EHnDIBa6k1YMz0tn/
 1HQZ/EKTF2NKd3MPu/SxDC20Ay19kLnrmtwSsiYQ0G43B4kFJIwdmASlfCUHw1X3ESYy
 KG0A==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKRGVwZW5kaW5nIG9uIHBs
YXRmb3JtIGZpcm13YXJlLCBhIHphcCBzaGFkZXIgbWF5IG5vdCBiZSByZXF1aXJlZCB0byB0YWtl
CnRoZSBHUFUgb3V0IG9mIHNlY3VyZSBtb2RlIG9uIGJvb3QsIGluIHdoaWNoIGNhc2Ugd2UgY2Fu
IGp1c3Qgd3JpdGUKUkJCTV9TRUNWSURfVFJVU1RfQ05UTCBkaXJlY3RseS4gIFdoaWNoIHdlICpt
b3N0bHkqIGhhbmRsZWQsIGJ1dCBtaXNzZWQKY2xlYXJpbmcgJ3JldCcgcmVzdWx0aW5nIHRoYXQg
aHdfaW5pdCgpIHJldHVybmVkIGFuIGVycm9yIG9uIHRoZXNlCmRldmljZXMuCgpGaXhlczogYWJj
Y2I5ZmUzMjY3IGRybS9tc20vYTZ4eDogQWRkIHphcCBzaGFkZXIgbG9hZApTaWduZWQtb2ZmLWJ5
OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L21zbS9hZHJlbm8vYTZ4eF9ncHUuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMKaW5kZXggZWMyNDUwOGI5ZDY4
Li5lNzRkY2U0NzQyNTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2
eHhfZ3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYwpAQCAt
NTI3LDYgKzUyNyw3IEBAIHN0YXRpYyBpbnQgYTZ4eF9od19pbml0KHN0cnVjdCBtc21fZ3B1ICpn
cHUpCiAJCWRldl93YXJuX29uY2UoZ3B1LT5kZXYtPmRldiwKIAkJCSJaYXAgc2hhZGVyIG5vdCBl
bmFibGVkIC0gdXNpbmcgU0VDVklEX1RSVVNUX0NOVEwgaW5zdGVhZFxuIik7CiAJCWdwdV93cml0
ZShncHUsIFJFR19BNlhYX1JCQk1fU0VDVklEX1RSVVNUX0NOVEwsIDB4MCk7CisJCXJldCA9IDA7
CiAJfQogCiBvdXQ6Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
