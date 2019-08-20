Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7894E959E6
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 10:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F46F6E7A1;
	Tue, 20 Aug 2019 08:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFF96E795
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 08:41:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id d16so1870200wme.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7lLrSRS8pvD415Y7pil0oxXPvn0IdPhB7KI2Ad+RFYU=;
 b=uCLI90TobfEc6qlSAyLt2DKHehojqjkDSxO8gYD2hUsdyX1U7oyVPRvLcbu6px29m5
 2lklWCbUbMH1CuYYBypmNRaP0S0F0d9jR9lKpEWi5MmwkRnNYX3xX6+NlhCVISh41/3C
 3uTw9Kj12JAz1MrFQk5Iyezkyg6iMDR4H2I3KMqBR8ZmD36sserbA8s9gkUdcQbqSi5D
 O0d2PzSj6j7SwHLz2c+yBEpFnHUz7ogvekCFqYQ8bIZ0Sj8QLUlSBTLE7ZV6g0ql39hw
 N63mct0fn5izehVGJtLFQzdoM6fbZmlk+uIQpURLCPYcPHi+Z8kvXVCs+W5LdM4niGNc
 GIaQ==
X-Gm-Message-State: APjAAAXFgIx1PBFSvFYAzpfeqFJZeoXxscoVOttWiyuVkmeIEtJuPAyO
 jnnc5CQhfLWSdUxWUxPzkJXVOA==
X-Google-Smtp-Source: APXvYqwiHM21/zJHepoK/A0Ag59YPDuYQqEc20EqsPCkhW8DLHYUGWxrHv5h2btYx8v7YOae1PMtsQ==
X-Received: by 2002:a1c:760b:: with SMTP id r11mr557337wmc.41.1566290481158;
 Tue, 20 Aug 2019 01:41:21 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:20 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 07/11] drm/bridge: dw-hdmi: allow ycbcr420 modes for >= 0x200a
Date: Tue, 20 Aug 2019 10:41:05 +0200
Message-Id: <20190820084109.24616-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7lLrSRS8pvD415Y7pil0oxXPvn0IdPhB7KI2Ad+RFYU=;
 b=GdPfWrKshjNkikUSOYnn/MNowhVUPN//wLj9zC1QBalNX4iF1bDDWiGqlPTEFAjPFd
 6JdydSpSg78Ti3PB2/ndGZ8DzoNKJBprGfM+rRSOa5MlafV3yAcFw+zzVU72YvRFN9ZU
 AhwLMPGytbUritZbatAUwNNe1w/MfGVdWSEOq+1RPKIodRQKVwudCjOUNEQYPe0UuCpN
 xmY3+xUv52zUZ4WZo1Y71DCr22UbIIofmkKxlwYm+AizZIxl4+fvYeozM58PlPIUVT74
 M/uo58NK618BYuWSbelEvHQRS2wnGKQIaq9w71HbLuQUrejt37RXGrX2XnMob6rGo1Lb
 7QTQ==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoZSBEVy1IRE1JIENvbnRyb2xsZXIgc3VwcG9ydHMgdGhlIEhETUkyLjAgbW9kZXMsIGVu
YWJsZSBzdXBwb3J0CmZvciB0aGVzZSBtb2RlcyBpbiB0aGUgY29ubmVjdG9yIGlmIHRoZSBwbGF0
Zm9ybSBzdXBwb3J0cyB0aGVtLgpXZSBsaW1pdCB0aGVzZSBtb2RlcyB0byBEVy1IRE1JIElQIHZl
cnNpb24gPj0gMHgyMDBhIHdoaWNoCmFyZSBkZXNpZ25lZCB0byBzdXBwb3J0IEhETUkyLjAgZGlz
cGxheSBtb2Rlcy4KClNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJh
eWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWku
YyB8IDYgKysrKysrCiBpbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oICAgICAgICAgICAgICB8
IDEgKwogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCmluZGV4IDMxNjgyM2FiZGQwMC4uY2I1NjBiMjMxZDc0
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAtMjc5Myw2
ICsyNzkzLDEyIEBAIF9fZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
LAogCWhkbWktPmJyaWRnZS5vZl9ub2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7CiAjZW5kaWYKIAor
CWlmIChoZG1pLT52ZXJzaW9uID49IDB4MjAwYSkKKwkJaGRtaS0+Y29ubmVjdG9yLnljYmNyXzQy
MF9hbGxvd2VkID0KKwkJCWhkbWktPnBsYXRfZGF0YS0+eWNiY3JfNDIwX2FsbG93ZWQ7CisJZWxz
ZQorCQloZG1pLT5jb25uZWN0b3IueWNiY3JfNDIwX2FsbG93ZWQgPSBmYWxzZTsKKwogCW1lbXNl
dCgmcGRldmluZm8sIDAsIHNpemVvZihwZGV2aW5mbykpOwogCXBkZXZpbmZvLnBhcmVudCA9IGRl
djsKIAlwZGV2aW5mby5pZCA9IFBMQVRGT1JNX0RFVklEX0FVVE87CmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oIGIvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaApp
bmRleCBjNDAyMzY0YWVjMGQuLjA0ZTYzZWQyOTQxNyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0v
YnJpZGdlL2R3X2hkbWkuaAorKysgYi9pbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oCkBAIC0x
MjYsNiArMTI2LDcgQEAgc3RydWN0IGR3X2hkbWlfcGxhdF9kYXRhIHsKIAkJCQkJICAgY29uc3Qg
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOwogCXVuc2lnbmVkIGxvbmcgaW5wdXRfYnVz
X2Zvcm1hdDsKIAl1bnNpZ25lZCBsb25nIGlucHV0X2J1c19lbmNvZGluZzsKKwlib29sIHljYmNy
XzQyMF9hbGxvd2VkOwogCiAJLyogVmVuZG9yIFBIWSBzdXBwb3J0ICovCiAJY29uc3Qgc3RydWN0
IGR3X2hkbWlfcGh5X29wcyAqcGh5X29wczsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
