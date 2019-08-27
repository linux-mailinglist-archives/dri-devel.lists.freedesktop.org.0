Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A80E29E1B6
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 10:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFFE890BB;
	Tue, 27 Aug 2019 08:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE3088F58
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 08:14:34 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g67so2004880wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 01:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rf+Fb/D78w3i+4TzbVehqskNNypv9unv9HAaSJpdWso=;
 b=tFwu7r8IcOEALSTOzmtU03tt3tYM0hLvuUHG+5ICU5WdQJ2l3f7GxZjj4z5TOhJvzl
 tqB8MjHQOaN8HuIIt1IRQ/K+7nKL7UdsuJfj6DPrQtANB6SOMai8iXoJ7HtW2PRfJ9KL
 R+K7vjcX+IlYdj4JdiyrCnvQQsERlrietU4uY+RR54LVhM7zMkQ33h0iuj7riVaFUpYT
 m5iwvKdfTXg34RVQlTZFF1ksSwnOsUg2tRi8/P3O3Y6oxfKQ0FNKukcozizFHeL6LG1Y
 wn7oOPMm5MKaUE6Utt7hPUXX6AZiH4dtbb49GrYYhI2IzVhb99Se0iRtXxSddG3KsuPW
 SONA==
X-Gm-Message-State: APjAAAVFJnAEqQVmnIb2ciw0RPtwXkx/cMGiLnrCP/mHkxcqdy7l0LV1
 wjEwQL58jkHVu6tAV6g+d+3Bzw==
X-Google-Smtp-Source: APXvYqzcST9C+Gwl8FfR3pGgo1a/ClAEBtAiPLNyZuPithhFN+DiiyD1q11WoQix3UFPCREYue4UNw==
X-Received: by 2002:a7b:cf11:: with SMTP id l17mr26068073wmg.158.1566893672720; 
 Tue, 27 Aug 2019 01:14:32 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f18sm11911792wrx.85.2019.08.27.01.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 01:14:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH RFC v2 5/8] drm/bridge: dw-hdmi: allow ycbcr420 modes for >=
 0x200a
Date: Tue, 27 Aug 2019 10:14:22 +0200
Message-Id: <20190827081425.15011-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827081425.15011-1-narmstrong@baylibre.com>
References: <20190827081425.15011-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rf+Fb/D78w3i+4TzbVehqskNNypv9unv9HAaSJpdWso=;
 b=zvmHQrGrjBcBUwpMSCUNi+a3SsH9bq0JxEVQOK2M1WTophp7K27yBvua8SlTjR97dG
 H76O2lQXPtJ05fdxZE83rOAWcCAWejxNKSZl0WP58qnWYTNqZGqU7qCLz7lwzjJTzF/T
 y7ya6fU2g/k8KDTPviATtF06/s3SkeUjaHrMLNmvQUXj/cHId5awbMeUIQ99/auC23u5
 ppt77F0MrskDvGO5EC7yAD23nU49wSX7E/wF6EoTPvhpDncRjwnpmxisNUf0JoUpd4tB
 CdytHWJVU0KrnNo29sSCEwqd9VWFVQAEErfRyE3ApYfUQ9o1bLnMoKt2d0NEqkkU7S3v
 lLqQ==
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
cmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCmluZGV4IDAwYWFjYWQ1MWUyOS4uMDQ4NDA5YWYxM2Qy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAtMzAzMSw2
ICszMDMxLDEyIEBAIF9fZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
LAogCWhkbWktPmJyaWRnZS5vZl9ub2RlID0gcGRldi0+ZGV2Lm9mX25vZGU7CiAjZW5kaWYKIAor
CWlmIChoZG1pLT52ZXJzaW9uID49IDB4MjAwYSkKKwkJaGRtaS0+Y29ubmVjdG9yLnljYmNyXzQy
MF9hbGxvd2VkID0KKwkJCWhkbWktPnBsYXRfZGF0YS0+eWNiY3JfNDIwX2FsbG93ZWQ7CisJZWxz
ZQorCQloZG1pLT5jb25uZWN0b3IueWNiY3JfNDIwX2FsbG93ZWQgPSBmYWxzZTsKKwogCW1lbXNl
dCgmcGRldmluZm8sIDAsIHNpemVvZihwZGV2aW5mbykpOwogCXBkZXZpbmZvLnBhcmVudCA9IGRl
djsKIAlwZGV2aW5mby5pZCA9IFBMQVRGT1JNX0RFVklEX0FVVE87CmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oIGIvaW5jbHVkZS9kcm0vYnJpZGdlL2R3X2hkbWkuaApp
bmRleCBjZjUyOGMyODk4NTcuLjI1YTg4NDUyM2I0NSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0v
YnJpZGdlL2R3X2hkbWkuaAorKysgYi9pbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oCkBAIC0x
MjYsNiArMTI2LDcgQEAgc3RydWN0IGR3X2hkbWlfcGxhdF9kYXRhIHsKIAkJCQkJICAgY29uc3Qg
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOwogCXVuc2lnbmVkIGxvbmcgaW5wdXRfYnVz
X2Zvcm1hdDsKIAl1bnNpZ25lZCBsb25nIGlucHV0X2J1c19lbmNvZGluZzsKKwlib29sIHljYmNy
XzQyMF9hbGxvd2VkOwogCiAJLyogVmVuZG9yIFBIWSBzdXBwb3J0ICovCiAJY29uc3Qgc3RydWN0
IGR3X2hkbWlfcGh5X29wcyAqcGh5X29wczsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
