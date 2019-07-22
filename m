Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1131B71294
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A396E02D;
	Tue, 23 Jul 2019 07:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FB489E0E
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 19:15:09 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id j26so27051044vsn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 12:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4BuuPSvhQT5H67c4iK7jqEFJDfyC/RcpCWzQsK/Bagw=;
 b=CkHFFnJ+ApQ4pi6J6Aobc+HoUFqBAgf9bBH0xACQLkjx9R8DN7abqIemTpblm48CyN
 +hakToWijuKcGRgNnOV2dnN17Ho2cL1pD0WQ5c/Se64pemOvPhSL7c+hW+KoU1XAXEQi
 hzAm++b0KwmkVao9+TZxef50ZFzTT8SlEkaOze3VIx5rXCJ6fCM1jyIDsVsi32GZj5tk
 x0DnZEpnngTRC8QoTWHfWQklGzOQClM5wfX+2xE+ubFcxqREupfeQ9EI5sps3RzWlTHb
 Kc6UgilbJBlXgqfMaKjGjhhS8xakHSEbe6akQPAoJTqA2uKb4wijWiDD2nyX03aN0kPk
 szfA==
X-Gm-Message-State: APjAAAVme5i2D/LLfJn4Nn0qsfBKc7Kwhwuy5zhpiNwmyURQfMPurEwJ
 q5Z6IZQsVvlE0EHDxnbY3p1Zog==
X-Google-Smtp-Source: APXvYqxZlIpTi88Fqz4ibqiGDTpWCCB7h63uPWTKFXZaJF1FeJSDC0tq9HX1ZRxP8buTUrL2OdsQrA==
X-Received: by 2002:a67:d46:: with SMTP id 67mr44695015vsn.181.1563822909007; 
 Mon, 22 Jul 2019 12:15:09 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id 4sm7433056vsx.11.2019.07.22.12.15.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 12:15:08 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: daniel@ffwll.ch
Subject: [PATCH] drm: silence variable 'conn' set but not used
Date: Mon, 22 Jul 2019 15:14:46 -0400
Message-Id: <1563822886-13570-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=4BuuPSvhQT5H67c4iK7jqEFJDfyC/RcpCWzQsK/Bagw=;
 b=YEW6P3hOXzy+0zgf6FOEyZJgqFbPIbY+8dVXkWPS/LmqA3Ulr6DM8mLczZleAqHxPt
 wI19rxN1CrY8o4DLllYJitWKTki8rbqyOJKYgGlVKlF3faV0WYzoNIXw4/pCgfh1WY0m
 /9WGxd8Q7RpFCAgMQHd6hCBy7gT4tfVf4v97vc5+s+BPu84M/E4VfLjON4Nnq6TgYwdS
 VozpLWc4YxcSstY2DUFEcf3FCSIvIj61UQSvLSvP/UfvmWljL/M8j6a2H3F+6hyiHckq
 sPtt+oEoU/xgniNh+9bAROKrnl1wf+Lz3pHdT0vO2xDuLoHOXKqH9XLFBjribJFs/ws3
 9Kfg==
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
Cc: maxime.ripard@bootlin.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, Qian Cai <cai@lca.pw>,
 sean@poorly.run
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICJzdHJ1Y3QgZHJtX2Nvbm5lY3RvciIgaXRlcmF0aW9uIGN1cnNvciBmcm9tCiJmb3JfZWFj
aF9uZXdfY29ubmVjdG9yX2luX3N0YXRlIiBpcyBuZXZlciB1c2VkIGluIGF0b21pY19yZW1vdmVf
ZmIoKQp3aGljaCBnZW5lcmF0ZXMgYSBjb21waWxhdGlvbiB3YXJuaW5nLAoKZHJpdmVycy9ncHUv
ZHJtL2RybV9mcmFtZWJ1ZmZlci5jOiBJbiBmdW5jdGlvbiAnYXRvbWljX3JlbW92ZV9mYic6CmRy
aXZlcnMvZ3B1L2RybS9kcm1fZnJhbWVidWZmZXIuYzo4Mzg6MjQ6IHdhcm5pbmc6IHZhcmlhYmxl
ICdjb25uJyBzZXQKYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKU2ls
ZW5jZSBpdCBieSBtYXJraW5nICJjb25uIiBfX21heWJlX3VudXNlZC4KClNpZ25lZC1vZmYtYnk6
IFFpYW4gQ2FpIDxjYWlAbGNhLnB3PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZnJhbWVidWZm
ZXIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZnJhbWVidWZmZXIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZnJhbWVidWZmZXIuYwppbmRleCAwYjcyNDY4ZTgxMzEuLjU3NTY0MzE4
Y2VlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mcmFtZWJ1ZmZlci5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZnJhbWVidWZmZXIuYwpAQCAtODM1LDcgKzgzNSw3IEBAIHN0
YXRpYyBpbnQgYXRvbWljX3JlbW92ZV9mYihzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYikKIAlz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gZmItPmRldjsKIAlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0
ZSAqc3RhdGU7CiAJc3RydWN0IGRybV9wbGFuZSAqcGxhbmU7Ci0Jc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm47CisJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm4gX19tYXliZV91bnVzZWQ7CiAJ
c3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGU7CiAJaW50IGksIHJldDsKIAl1
bnNpZ25lZCBwbGFuZV9tYXNrOwotLSAKMS44LjMuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
