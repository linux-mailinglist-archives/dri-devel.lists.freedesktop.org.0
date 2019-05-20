Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB0E22E6A
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0869B8926A;
	Mon, 20 May 2019 08:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8592189258
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:22:31 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a8so22558873edx.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 01:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yy90SY5/chDu3adwLkHoQhEeL0uOM1NOJmociVMUU4s=;
 b=aepXMg85t+zdVLv/zhLJjtlMR1JETW8UHy2q4D4pqzmzqGx/DXq7XNVvbs3z/TZDT4
 hG0iGjSkLxXDnHtALjZfcuHKXhDt4m5HYjyEmuhbDAbpiaGOeRlRgkeMRUG796tRUxre
 zd8XuWvIUWr7DOB9+57C2L7s2Sgum3IaPno3soFntQ47yHijZzoFsFDx4cKEh5NEDEU3
 F8hKCKj1fltO5NYuazWVYHqWSwxudENKqHs2C4vNbt1+jyXskDHYgnwCdtgc9QNo0k5B
 X86ix7JRNG0MXFr1aGB1Kd4sCGih/aHtj6Y9w8m+RvVqVahch+DIQTDA2AMMiwXLSL99
 SyJw==
X-Gm-Message-State: APjAAAVd5Yd1yuj1dMXBVe7Y4S4FD6GCsnYJYlkxMoEWtCw52RLlqcgc
 ezohFi40oFqqkZutuhXFvN0EzrnNw1U=
X-Google-Smtp-Source: APXvYqxdWi1IjK9CrOPrKCYsIFhwO9cGwKSyfvFscq7wlo2HQm/gpu93fgQpMudhegtDzz3SNq4bcg==
X-Received: by 2002:a50:ad18:: with SMTP id y24mr74100466edc.64.1558340549704; 
 Mon, 20 May 2019 01:22:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 01:22:28 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/33] fbdev/cyber2000: Remove struct display
Date: Mon, 20 May 2019 10:21:49 +0200
Message-Id: <20190520082216.26273-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yy90SY5/chDu3adwLkHoQhEeL0uOM1NOJmociVMUU4s=;
 b=Br4lGjx6AYOmC8birJ2u22FSo+1D2WHdSA9O7P/G/jGX+VR9ZzrMY5zOKWlSMg+Ekk
 U7S4K5dfKQHB99S8s5RnjHdJHlT5nyX5dtAmtsyHAEu9H79HKy9hUb5l02yVlqUVeu2L
 gQtPbGsCys6UMB9HaTvvsi7CVFRsYrnsCEO8I=
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
 Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW50aXJlbHkgdW51c2VkLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBpbnRlbC5jb20+CkNjOiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4K
Q2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwotLS0KIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvY3liZXIyMDAwZmIuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2N5YmVyMjAwMGZiLmMgYi9kcml2
ZXJzL3ZpZGVvL2ZiZGV2L2N5YmVyMjAwMGZiLmMKaW5kZXggOWE1NzUxY2I0ZTE2Li40NTJlZjA3
YjNhMDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY3liZXIyMDAwZmIuYworKysg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2N5YmVyMjAwMGZiLmMKQEAgLTYxLDcgKzYxLDYgQEAKIHN0
cnVjdCBjZmJfaW5mbyB7CiAJc3RydWN0IGZiX2luZm8JCWZiOwogCXN0cnVjdCBkaXNwbGF5X3N3
aXRjaAkqZGlzcHN3OwotCXN0cnVjdCBkaXNwbGF5CQkqZGlzcGxheTsKIAl1bnNpZ25lZCBjaGFy
CQlfX2lvbWVtICpyZWdpb247CiAJdW5zaWduZWQgY2hhcgkJX19pb21lbSAqcmVnczsKIAl1X2lu
dAkJCWlkOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
