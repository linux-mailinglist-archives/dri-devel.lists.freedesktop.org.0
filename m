Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D4B2C5632
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:44:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E786E960;
	Thu, 26 Nov 2020 13:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843346E99E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:44 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m6so2186656wrg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SMoItuxgDP7ogQHGcYXarl4I2+ROLy8sCFsG16Aywwg=;
 b=OhdPMGyIXHI+TAj6MaIkGlRL9xzZ4qWRyHui4ZR+pMaQ/MzD27wZVVBTfPeDNog00z
 NN3tcAMPCRSSI/h4caCGAL300/4COFpkwzh6agGGfqN6hncmMlw7j3PtU1UxqxkVKqBE
 Kx3u4BG3SofRKVYlqmEaqTRm47XrknFaSfZkn154BEgBa3g0vXg3i9GxIwnJtSkCCz/0
 pGce+BNmaLjB3fcPjyUNY78xB8MCxdDrxEoi5L65AvoElMM8WTdbh9XaC/bhHhuDsllP
 K3czuao4DwqdPvDwxO4w9U/WhJUFgfC5xxn/gW6UHrM8Dmb5UvG/rLxaxLiMBCsgc1e8
 uVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SMoItuxgDP7ogQHGcYXarl4I2+ROLy8sCFsG16Aywwg=;
 b=sni8tRWAEGkGgXVB6HI6BRfd4RxUvSW3kkPhfw8jLd0mcvbGbDzQI21hnNyr7WtmFX
 8KlAKQuF8pHY4MSm50SbvYQb4JKNLRrsTQMDoGJo94FGeGapjvE0p/AW33wYxz3uzcYn
 UkA6V08Jp+HVekX7ftA6tWkLHJCUXVjrtuKHyiC05D6AvjxzwvTnNE/yc2jRwAU0ushI
 Ds4TK9419JgO4rJr4SrQGgzRn6OCtvj4qT1lMZmnaq3XDf8C+YOQVH5ZGNy05QdrS2Hz
 LZY0XGi91/5FlRadhC6d7mFEy2teXTVn7sW5SEmFW+TTasU4376sHJ5D0QSr2YDmP98w
 Tq2A==
X-Gm-Message-State: AOAM533QuOpqjkXXVUlifS39xZiQN94ypfZLfVmAmiC3kvhn7BCBGssH
 A2W05B2UOs7EEHl0gtfXjRvulQ==
X-Google-Smtp-Source: ABdhPJxxfxoPWMWdyUpDsvOcaHaUFvY3HIue0Wl7PPH2WdJaCaoaw6b0nF5iFH992zGsvfRMtwCqXw==
X-Received: by 2002:adf:fc01:: with SMTP id i1mr4133125wrr.250.1606398223218; 
 Thu, 26 Nov 2020 05:43:43 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:42 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 40/40] drm/amd/display/dc/basics/vector: Make local function
 'dal_vector_presized_costruct' static
Date: Thu, 26 Nov 2020 13:42:40 +0000
Message-Id: <20201126134240.3214176-41-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9iYXNpY3MvdmVjdG9yLmM6NTU6Njog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhkYWxfdmVjdG9yX3ByZXNpemVk
X2Nvc3RydWN04oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KCkNjOiBIYXJyeSBXZW50bGFuZCA8
aGFycnkud2VudGxhbmRAYW1kLmNvbT4KQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgpD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBh
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9iYXNpY3MvdmVjdG9yLmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmFzaWNzL3ZlY3Rvci5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jhc2ljcy92ZWN0b3IuYwppbmRleCA4ZjkzZDI1
ZjkxZWUyLi43MDZjODAzYzRkM2IwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvYmFzaWNzL3ZlY3Rvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9iYXNpY3MvdmVjdG9yLmMKQEAgLTUyLDcgKzUyLDcgQEAgYm9vbCBkYWxfdmVjdG9yX2Nv
bnN0cnVjdCgKIAlyZXR1cm4gdHJ1ZTsKIH0KIAotYm9vbCBkYWxfdmVjdG9yX3ByZXNpemVkX2Nv
c3RydWN0KAorc3RhdGljIGJvb2wgZGFsX3ZlY3Rvcl9wcmVzaXplZF9jb3N0cnVjdCgKIAlzdHJ1
Y3QgdmVjdG9yICp2ZWN0b3IsCiAJc3RydWN0IGRjX2NvbnRleHQgKmN0eCwKIAl1aW50MzJfdCBj
b3VudCwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
