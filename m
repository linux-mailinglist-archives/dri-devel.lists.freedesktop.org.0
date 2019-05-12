Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5D61B0B8
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 09:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC97C8957B;
	Mon, 13 May 2019 07:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D87389A8B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 17:46:22 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o4so12735274wra.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 10:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PpFKiSt85cZObJXkqM+4NINsxlg/dnFUO7/fP7CyTZ0=;
 b=aeDCeqf8NwH9soIqygpxLnRHoA5CAavWbc/YpVUDb7TggefSYCVT9XlTn0Ffv6UxkD
 FImS+DqbbQdvDULBtzsiWSyVJ3PDDbzC2DZvtQiUVtHAl6kAunS3B7y/7WBAwveWuXj+
 XHxMmB/Qrmcv2zoBhGGbvbKmIy6EXbcGE7e0g8qFiI15YzzveJZpqQ4eh7tc+VF1XS5x
 DzjEYkF0J4PMZZuC5Q6DIBU0N/RFwlsTPbgA8q/6YNwhY23dlMln7F2ZaDsNeYbspaXw
 M/4ijjxYYSsT4D2af8s0Xw/TDVD79fvhN7GFUw3tLbXShIuD6aH8xgslsCgcR6jbkyp0
 4oKg==
X-Gm-Message-State: APjAAAV2klht4VGRJD4nLM2hhYlviyZAM1VEpthe0RoUQGaT0eaMc0xB
 kq1ZpHw9PdjlsZoVjksqr7GlIEUcgwpUlQ==
X-Google-Smtp-Source: APXvYqyQ4hsYAZCq/NBC97ZKDgZwacx09DQv3e6Ca9hA1rxZqrgnHiF+a99dzDlj9/3v8toWPtdO8A==
X-Received: by 2002:adf:e2c3:: with SMTP id d3mr14927414wrj.189.1557683181084; 
 Sun, 12 May 2019 10:46:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id d14sm9090558wre.78.2019.05.12.10.46.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 May 2019 10:46:20 -0700 (PDT)
From: peron.clem@gmail.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 5/8] arm64: dts: allwinner: Add mali GPU supply for Pine H64
Date: Sun, 12 May 2019 19:46:05 +0200
Message-Id: <20190512174608.10083-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190512174608.10083-1-peron.clem@gmail.com>
References: <20190512174608.10083-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 May 2019 07:04:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PpFKiSt85cZObJXkqM+4NINsxlg/dnFUO7/fP7CyTZ0=;
 b=iMmeY2xPP9Gkz4hrehGXNo2bjZMgTBYhInSPHslK0abKhJynkPsYjC0Q6H1xlqV7ux
 INxX22Cir+VWX1qCXokJ6pP3rd+Upeq2WH/Ioyba0ng+aA3q0dNwJrbCfqJZJrbDdsCq
 BUm9j/kb4b+47ifOlPJIyYuM6/qdfyRQxaJ3PxI8x9jwVBhOoSvF+h9wMbfCKLh404iE
 6DOEaCILT+OL+uDUpfdsmbX+1pXB196Kkq7QUCkoyu0YCa8TDj+XonhZRx9f9yNxPfAL
 M6JI3n5NxNiE9zbvD/UGmmQehA3YDbwjg+wjTNkfj3/69pl2nCwXVA9B9ojgrIoKVEyE
 rQnA==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KCkVuYWJsZSBhbmQg
YWRkIHN1cHBseSB0byB0aGUgTWFsaSBHUFUgbm9kZSBvbiB0aGUKUGluZSBINjQgYm9hcmQuCgpT
aWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgotLS0K
IGFyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1waW5lLWg2NC5kdHMgfCA1
ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LXBpbmUtaDY0LmR0cyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi1waW5lLWg2NC5kdHMKaW5kZXggNDgw
MjkwMmUxMjhmLi5lMTZhOGM2NzM4ZjkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YWxsd2lubmVyL3N1bjUwaS1oNi1waW5lLWg2NC5kdHMKKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9hbGx3aW5uZXIvc3VuNTBpLWg2LXBpbmUtaDY0LmR0cwpAQCAtODUsNiArODUsMTEgQEAKIAlz
dGF0dXMgPSAib2theSI7CiB9OwogCismZ3B1IHsKKwltYWxpLXN1cHBseSA9IDwmcmVnX2RjZGNj
PjsKKwlzdGF0dXMgPSAib2theSI7Cit9OworCiAmaGRtaSB7CiAJc3RhdHVzID0gIm9rYXkiOwog
fTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
