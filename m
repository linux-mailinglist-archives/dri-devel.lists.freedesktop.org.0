Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B6782C9A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D62A89BD5;
	Tue,  6 Aug 2019 07:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CB36E44C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:41:10 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l2so73025460wmg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 06:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BuuMX+kd4A8dEfG3qDO6RvK4XQjF8g/kyhgS9BKn3r0=;
 b=BYWsS4rUfkTrYyKG4D55F9/Ls3k/HZu1n4dVE/c5PMc4k+IL2pdjsgiXb/X4jtVek5
 EQo3uYc35nEG6JiWfwyriLbbE9gwnJzsGWjwc/os3DGPlBnMoqABiymvDtZG4z1HLXIR
 6Tz5Z940LgHoADk9YRvft4C/QO3qUq4oNXPou/zlW8qxeCX9QjwzZYEdxLKnUzGs5dLp
 IQ72y8I1+UPNlugukv6w1CBNlNuaFe2ZhGax9b0P3k0wdn98FRNAlar0zailx2cLAl6Y
 O3WDqk8BNaM3sriTwzfEuCvIY0UpAsEFwCr1EzySIn3yTEak/bIVCTRScTdXtDzBFhwT
 KQ1A==
X-Gm-Message-State: APjAAAVjnxdxTP0dmpGcMmkBeJdLapA4Qgsqzdd+p8R9gFn4TPfXkTV2
 Mh5tiEgaMhjmwwzoVCTektbKSA==
X-Google-Smtp-Source: APXvYqwVoqHDa33wnfWrybOC8mjRHHCSuKqmhCrAqI5Gxpc/QXp+sgQF1g1sasCcuASz2XJytrrO5g==
X-Received: by 2002:a1c:630a:: with SMTP id x10mr19986559wmb.113.1565012469416; 
 Mon, 05 Aug 2019 06:41:09 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm99040534wrn.11.2019.08.05.06.41.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:41:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/8] drm/bridge: dw-hdmi: set channel count in the infoframes
Date: Mon,  5 Aug 2019 15:40:57 +0200
Message-Id: <20190805134102.24173-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805134102.24173-1-jbrunet@baylibre.com>
References: <20190805134102.24173-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BuuMX+kd4A8dEfG3qDO6RvK4XQjF8g/kyhgS9BKn3r0=;
 b=qJD4gdHbnAzeFnPvKM+8j1gE58vTH+WCsmheK6fZFJnnrjUDw3nFKihaYFnoE5elar
 VG/+rWF3g2A+JcgymCXaFsEXgyJnIDT+hsLYwH+ybejdUeXdVh+RW4+FCuhzOoHzFNhg
 xOrmmMM+mhlrnr8Uw1NRZC6uFoFHjrKT5BQwTbPRiu4nacBAy5VNHoh+jSh40BsBm18T
 6OL8lWqJbAd4NDQsli32/MMIb20OPlIijh/jr1av7S2+rO1NNzTVkNTHRxzTR5WkVK8J
 RuYhO1fRZtrG7pz38v4Jr4FGft+lJR8YOPshh9Z5oJG31mIsgetJj3pEQPHxeyf37eWK
 h4tw==
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2V0IHRoZSBudW1iZXIgb2YgY2hhbm5lbCBpbiB0aGUgaW5mb2ZyYW1lcwoKQ2M6IEpvbmFzIEth
cmxtYW4gPGpvbmFzQGt3aWJvby5zZT4KU2lnbmVkLW9mZi1ieTogSmVyb21lIEJydW5ldCA8amJy
dW5ldEBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9k
dy1oZG1pLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCmluZGV4IGJlNmQ2ODE5YmVmNC4u
YmVkNGJiMDE3YWZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lz
L2R3LWhkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
YwpAQCAtNjYzLDYgKzY2MywxMCBAQCB2b2lkIGR3X2hkbWlfc2V0X2NoYW5uZWxfY291bnQoc3Ry
dWN0IGR3X2hkbWkgKmhkbWksIHVuc2lnbmVkIGludCBjbnQpCiAJaGRtaV9tb2RiKGhkbWksIGxh
eW91dCwgSERNSV9GQ19BVURTQ09ORl9BVURfUEFDS0VUX0xBWU9VVF9NQVNLLAogCQkgIEhETUlf
RkNfQVVEU0NPTkYpOwogCisJLyogU2V0IHRoZSBhdWRpbyBpbmZvZnJhbWVzIGNoYW5uZWwgY291
bnQgKi8KKwloZG1pX21vZGIoaGRtaSwgKGNudCAtIDEpIDw8IEhETUlfRkNfQVVESUNPTkYwX0ND
X09GRlNFVCwKKwkJICBIRE1JX0ZDX0FVRElDT05GMF9DQ19NQVNLLCBIRE1JX0ZDX0FVRElDT05G
MCk7CisKIAltdXRleF91bmxvY2soJmhkbWktPmF1ZGlvX211dGV4KTsKIH0KIEVYUE9SVF9TWU1C
T0xfR1BMKGR3X2hkbWlfc2V0X2NoYW5uZWxfY291bnQpOwotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
