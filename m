Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A236E22E63
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B9C89259;
	Mon, 20 May 2019 08:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D9D89247
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:22:30 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w37so22552140edw.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 01:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4UC6980ATt6g2nqFDn2Bpgan2GTqp4ZZAGnr3VO2LjI=;
 b=ShFXqs5Pmem8DMxZmaWBUiJMTaqo0bRoiibSfwN2m3H/LwnbkQBfLWv2cXYob0YYZG
 jo8mbWAmCDmllZ4+GtDIsmXY0LsqGh64tKhapxqu+vXjXMyRzJb94sf9BDKm+mvtqQZA
 6AdTNknN8Vhn0Miz21C86ulFdzCAG3G506COJqFZtISjd1nKT9iJhCR0xY8yEs2lgefr
 iYDRrmvXi8X0A8OfCQcO7BqSaRQyWoboHGtD9n/OA0eUipkb8ZnyV8rXAQn4+nWRzGZt
 ccn0gXvMQaURR9oqDswSSsnem+tlyuyZR7yQTU1fa02WG6SBxkM9Xazf6enC3BfWOc/b
 k+1g==
X-Gm-Message-State: APjAAAU0jaoCZCjzVnHUWSCXJeta6cNHvZjLJcuEnSSnhV+uvz4PO0dv
 z2KIQeRmS6+sIens10rb8K+h/+J5Zn4=
X-Google-Smtp-Source: APXvYqzDLu9/GndEePgiMrQ6/ujxXJCreTf5PlH4FgvtQmGS1mXtvAIi9EhfVpK0KKXgJ8vPKQxX3Q==
X-Received: by 2002:a17:906:b741:: with SMTP id
 fx1mr5110659ejb.45.1558340548318; 
 Mon, 20 May 2019 01:22:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 01:22:27 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/33] fbdev/sa1100fb: Remove dead code
Date: Mon, 20 May 2019 10:21:48 +0200
Message-Id: <20190520082216.26273-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4UC6980ATt6g2nqFDn2Bpgan2GTqp4ZZAGnr3VO2LjI=;
 b=dAezrIqrBzbowSUT4bmjJHvFuoRDUot4TIt1DhCg1IdwLfIZ3foHIhAdtsVYqWZwkH
 LtfD6E9Lp7CdA0Ph5XoRHNGw3IYX/hRpt6SrjJ0o0ikqzT8aSMWH8VLcAZjH2VdaA0DA
 +zsohuUeum3CLs9yqrlxm9Bd+Anxdag2Obl88=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW90aXZhdGVkIGJlY2F1c2UgaXQgY29udGFpbnMgYSBzdHJ1Y3QgZGlzcGxheSwgd2hpY2ggaXMg
YSBmYmNvbgppbnRlcm5hbCBkYXRhIHN0cnVjdHVyZSB0aGF0IEkgd2FudCB0byByZW5hbWUuIEl0
IHNlZW1zIHRvIGhhdmUgYmVlbgpmb3JtZXJseSB1c2VkIGluIGRyaXZlcnMsIGJ1dCB0aGF0J3Mg
dmVyeSBsb25nIHRpbWUgYWdvLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBpbnRlbC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvc2ExMTAwZmIuYyB8IDI1IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NhMTEwMGZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L3NhMTEwMGZiLmMKaW5kZXggMTVhZTUwMDYzMjk2Li5mN2Y4ZGVlMDQ0YjEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvc2ExMTAwZmIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L3NhMTEwMGZiLmMKQEAgLTk3NCwzNSArOTc0LDEwIEBAIHN0YXRpYyB2b2lkIHNhMTEwMGZiX3Rh
c2soc3RydWN0IHdvcmtfc3RydWN0ICp3KQogICovCiBzdGF0aWMgdW5zaWduZWQgaW50IHNhMTEw
MGZiX21pbl9kbWFfcGVyaW9kKHN0cnVjdCBzYTExMDBmYl9pbmZvICpmYmkpCiB7Ci0jaWYgMAot
CXVuc2lnbmVkIGludCBtaW5fcGVyaW9kID0gKHVuc2lnbmVkIGludCktMTsKLQlpbnQgaTsKLQot
CWZvciAoaSA9IDA7IGkgPCBNQVhfTlJfQ09OU09MRVM7IGkrKykgewotCQlzdHJ1Y3QgZGlzcGxh
eSAqZGlzcCA9ICZmYl9kaXNwbGF5W2ldOwotCQl1bnNpZ25lZCBpbnQgcGVyaW9kOwotCi0JCS8q
Ci0JCSAqIERvIHdlIG93biB0aGlzIGRpc3BsYXk/Ci0JCSAqLwotCQlpZiAoZGlzcC0+ZmJfaW5m
byAhPSAmZmJpLT5mYikKLQkJCWNvbnRpbnVlOwotCi0JCS8qCi0JCSAqIE9rLCBjYWxjdWxhdGUg
aXRzIERNQSBwZXJpb2QKLQkJICovCi0JCXBlcmlvZCA9IHNhMTEwMGZiX2Rpc3BsYXlfZG1hX3Bl
cmlvZCgmZGlzcC0+dmFyKTsKLQkJaWYgKHBlcmlvZCA8IG1pbl9wZXJpb2QpCi0JCQltaW5fcGVy
aW9kID0gcGVyaW9kOwotCX0KLQotCXJldHVybiBtaW5fcGVyaW9kOwotI2Vsc2UKIAkvKgogCSAq
IEZJWE1FOiB3ZSBuZWVkIHRvIHZlcmlmeSBfYWxsXyBjb25zb2xlcy4KIAkgKi8KIAlyZXR1cm4g
c2ExMTAwZmJfZGlzcGxheV9kbWFfcGVyaW9kKCZmYmktPmZiLnZhcik7Ci0jZW5kaWYKIH0KIAog
LyoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
