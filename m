Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A53B1169FF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FDE6E391;
	Mon,  9 Dec 2019 09:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767516E0D7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 05:09:03 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id k20so5276237pls.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2019 21:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3DXJ363+5xl2j1sX57ViRMxkOHfXjAx7yBh65KBs7ig=;
 b=n1o1ILU6WHguu+MjgCgG04VGAjCOFkeGQVhYSEpNKCw3M60vQGxwuiDMCf/rp9jpvI
 7xxk65Q138MEzFQoVnb89C99me1sTs/4eXBScNGgpzXInOuH7q+8ApfyqDbuEdxEQVoB
 WqdHc3DrqKmhNO4AOfXpKAUS1A5TtiIn29q4cXHr3+WHl8XyYAtXdnSTe2xn8/R2kISA
 xfoFuGXHAk+C1hMMkmBCHVsown5GKCt8aGriyGQDnq2Anu1JanK4bzXsB3mqfuV3wKSy
 en4vceP8AlaQM2arIOg27GOrxfgAUWhg0Dr0buTukfT7OopYuU0dy3nf/Pp9V1V7H0le
 zbuw==
X-Gm-Message-State: APjAAAXiqdPuqLPdem+2MbkX4si8lL+15c5mFUNUvIH8CJ745dAfLtih
 WmIaI+esTQtZuh2Uva8rIyXD56F4vVw=
X-Google-Smtp-Source: APXvYqzDp9QuVREtu7B4v0No/Yw+NgfbfvOPW4JKEGtuUyYRp07XFr4wWIb/z+eod004W0fwCJrFpg==
X-Received: by 2002:a17:90a:2188:: with SMTP id
 q8mr30061625pjc.47.1575868142620; 
 Sun, 08 Dec 2019 21:09:02 -0800 (PST)
Received: from localhost.localdomain (c-67-165-113-11.hsd1.wa.comcast.net.
 [67.165.113.11])
 by smtp.gmail.com with ESMTPSA id k15sm25752119pfg.37.2019.12.08.21.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2019 21:09:01 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] tc358767 test mode
Date: Sun,  8 Dec 2019 21:08:55 -0800
Message-Id: <20191209050857.31624-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3DXJ363+5xl2j1sX57ViRMxkOHfXjAx7yBh65KBs7ig=;
 b=Hg1qWTXro0aY3M/28qvCS4/SGnYd6+V8hCdu/fDuLOGUNjGoSJzXX3tDQaeFAcjrAG
 xlptcKXuTbDCkWEtxcaULgeB+sSqicfWMdTWsyEr2MkyxFIvhhXxzAFnl5rFYJfMOVyf
 dIIcqZKlyS2/+bCudDkUAr7/zuU1xCeImimG5Yu4JdrQs6++4jSbmgoNcEqbQNgF5g8n
 mBTQU0wbHw62z7R2HN2BQokegftX6VKpK/7uG7w2B740+xsoaUbMK1PO2Nzy3rx4/q05
 hThr6xbg1McIBUxdphO/mq5eZnylZTxpxKLzjgDA5qJ0AH/8LPLFJl3ykPDWsYh4MxL7
 EFig==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RXZlcnlvbmU6CgpUaGlzIHNlcmllcyBpcyBhIGNvdXBsZSBvZiBwYXRjaGVzIGV4cG9zaW5nIFRl
c3RDdGwgcmVnaXN0ZXIgb2YKdGMzNTg3NjcsIHdoaWNoIGNhbiBiZSBwcmV0dHkgaGFuZHkgd2hl
biB0cm91Ymxlc2hvb3RpbmcgbGluayBwcm9ibGVtcy4KCkNoYW5nZXMgc2luY2UgW3YyXToKCiAg
ICAtIFNlcmllcyByZWJhc2VkIG9uIDUuNCBrZXJuZWwKCkNoYW5nZXMgc2luY2UgW3YxXToKCiAg
ICAtIERlYnVnZnMgbW92ZWQgaW50byBhIHN0YW5kYWxvbmUgZGlyZWN0b3J5IGFuZCBpcyBub3cg
Y3JlYXRlZCBhcwogICAgICBhIHBhcnQgb2YgcHJvYmUoKQoKICAgIC0gQWRkZWQgdHN0Y3RsX2xv
Y2sgdG8gZW5zdXJlIG11dHVhbCBleGNsdXNpb24gb2YgdHN0Y3RsIGNvZGUgYW5kCiAgICAgIGJy
aWRnZSdzIGVuYWJsZS9kaXNhYmxlIG1ldGhvZHMKCiAgICAtIHRjX3RzdGN0bF9zZXQoKSBjaGFu
Z2VkIHRvIGZ1bmN0aW9uIG9ubHkgaWYgYnJpZGdlIHdhcyBwcmV2aW9zbHkKICAgICAgZW5hYmxl
ZAoKICAgIC0gQWRkZWQgY29tbWVudCBleHBsYWluaW5nIGRhdGEgZm9ybWF0IGV4cGVjdGVkIGJ5
ICJ0c3RjdGwiCgogICAgLSBEZWJ1Z2ZzIHBlcm1pc3Npb24gY2hhbmdlZCB0byByZWZsZWN0IHdy
aXRlLW9ubHkgbmF0dXJlIG9mIHRoaXMKICAgICAgZmVhdHVyZQoKICAgIC0gT3JpZ2luYWwgY29t
bWl0IHNwbGl0IGludG8gdHdvCgogICAgLSBNaW5vciBmb3JtYXR0aW5nIGNoYW5nZXMKClRoYW5r
cywKQW5kcmV5IFNtaXJub3YKClt2MV0gbG9yZS5rZXJuZWwub3JnL3IvMjAxOTA4MjYxODI1MjQu
NTA2NC0xLWFuZHJldy5zbWlybm92QGdtYWlsLmNvbQpbdjJdIGxvcmUua2VybmVsLm9yZy9yLzIw
MTkwOTEyMDEzNzQwLjU2MzgtMS1hbmRyZXcuc21pcm5vdkBnbWFpbC5jb20KCkFuZHJleSBTbWly
bm92ICgyKToKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogSW50cm9kdWNlIF9fdGNfYnJpZGdlX2Vu
YWJsZS9kaXNhYmxlKCkKICBkcm0vYnJpZGdlOiB0YzM1ODc2NzogRXhwb3NlIHRlc3QgbW9kZSBm
dW5jdGlvbmFsaXR5IHZpYSBkZWJ1Z2ZzCgogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
Ny5jIHwgMTg0ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDE0OCBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
