Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D13BA2ADF65
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:31:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F1889BF5;
	Tue, 10 Nov 2020 19:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590AA89BF0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:25 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s13so4299909wmh.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xcbh8O+/omHL2VrpacAkpBtVFmAXD+djrz0urDPaJVQ=;
 b=kLlPJRNgN1F9oKbujE00llAPCqrZ6ps66Ok/S6/KvHh1EKNq12UMi2auweIku5QZ+d
 kHgomKu/9dundePmvfQOGcT3iLzJpwwonRbLSzxLYarevW+J9jAwUduNxg5s+KKMBtIs
 zcB01rcJI9EQSfNlkP7Kz+lx5eGQyi7U35uMuSzgK4juZGPgYBVkN083Z3gQ4bksEj83
 MgScucPUFTtvTp6/SqtM/6ITyUMzS7vQsX78dK9WlKYUcs3TF+DG0c8eZ7hrua/sAJo9
 VGaE8FoAHbQc0tOPZbBtQxjA+q4Z91crPXwSM7Sol4f4JqTBUOx6t7l+5es/l4561Q/S
 pWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xcbh8O+/omHL2VrpacAkpBtVFmAXD+djrz0urDPaJVQ=;
 b=oTpqRfEdOi/3P1S55uKkcdDLpHBJUGnkVV1m9eL2KuA/iqmM/Pj5krWLu7SDYqx9ZK
 s2DPyYoKVERU+5Ak66CiyOlr9OExK12BLA5xh29UZR3yqQS3qPDCgI9XvqroxyFNSOzy
 3+tG18Qd8yjPzrHb/OLwdQ+CfnWmbtVYwXBHRvl4WkmkvjmKLa9h/Kota3qF/LR1PCOb
 PF3CzjxD1f4h4R9A/Spq2AWjo8UvqXBqZXk5W09VJ506kLKfyQ88tjtRp88c+8iNWrPr
 kIKVHJoR5RuzuWVk58mJMetstHiTlNG2hOL4IFAoe9k+Q12mA/e2CQdtxr1GxoJgRaAK
 rgCw==
X-Gm-Message-State: AOAM531ytNj5s4JbqBjw72bPK0G05kL6lBt0Vjfkf6NPX9CBUPzHbaz0
 SmjUTRP9NJ4vJyYeG3A0vmmQPw==
X-Google-Smtp-Source: ABdhPJySXqkInVonwaPMkRY18+5DoFvbk2WPycPngEhk3/UG/GnAcOrJjZVRxfz5s/HZF8WgP6SU7A==
X-Received: by 2002:a1c:964d:: with SMTP id y74mr669038wmd.129.1605036683897; 
 Tue, 10 Nov 2020 11:31:23 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:23 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/30] drm/radeon/trinity_dpm: Remove some defined but never
 used arrays
Date: Tue, 10 Nov 2020 19:30:48 +0000
Message-Id: <20201110193112.988999-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi90cmluaXR5X2RwbS5jOjE0NjoxODogd2FybmluZzog4oCYdHJpbml0
eV9zeXNsc19kZWZhdWx04oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12
YXJpYWJsZT1dCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3RyaW5pdHlfZHBtLmM6MTMxOjE4OiB3
YXJuaW5nOiDigJh0cmluaXR5X21nY2dfc2hsc19kaXNhYmxl4oCZIGRlZmluZWQgYnV0IG5vdCB1
c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Ry
aW5pdHlfZHBtLmM6MTIwOjE4OiB3YXJuaW5nOiDigJh0cmluaXR5X21nY2dfc2hsc19lbmFibGXi
gJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KCkNjOiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvD
tm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi90cmluaXR5X2RwbS5jIHwgNDQgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQ0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vdHJpbml0eV9kcG0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vdHJpbml0eV9kcG0uYwppbmRleCA0ZDkzYjg0YWE3Mzk3Li5lMDA1YzE4YWFjMDBl
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3RyaW5pdHlfZHBtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi90cmluaXR5X2RwbS5jCkBAIC0xMTYsNTUgKzExNiwxMSBA
QCBzdGF0aWMgY29uc3QgdTMyIHRyaW5pdHlfbWdjZ19zaGxzX2RlZmF1bHRbXSA9CiAJMHgwMDAw
OTIyMCwgMHgwMDA5MDAwOCwgMHhmZmZmZmZmZiwKIAkweDAwMDA5Mjk0LCAweDAwMDAwMDAwLCAw
eGZmZmZmZmZmCiB9OwotCi1zdGF0aWMgY29uc3QgdTMyIHRyaW5pdHlfbWdjZ19zaGxzX2VuYWJs
ZVtdID0KLXsKLQkvKiBSZWdpc3RlciwgVmFsdWUsIE1hc2sgKi8KLQkweDAwMDA4MDJjLCAweGMw
MDAwMDAwLCAweGZmZmZmZmZmLAotCTB4MDAwMDA4ZjgsIDB4MDAwMDAwMDAsIDB4ZmZmZmZmZmYs
Ci0JMHgwMDAwMDhmYywgMHgwMDAwMDAwMCwgMHgwMDAxMzNGRiwKLQkweDAwMDAwOGY4LCAweDAw
MDAwMDAxLCAweGZmZmZmZmZmLAotCTB4MDAwMDA4ZmMsIDB4MDAwMDAwMDAsIDB4RTAwQjAzRkMs
Ci0JMHgwMDAwOTE1MCwgMHg5Njk0NDIwMCwgMHhmZmZmZmZmZgotfTsKLQotc3RhdGljIGNvbnN0
IHUzMiB0cmluaXR5X21nY2dfc2hsc19kaXNhYmxlW10gPQotewotCS8qIFJlZ2lzdGVyLCBWYWx1
ZSwgTWFzayAqLwotCTB4MDAwMDgwMmMsIDB4YzAwMDAwMDAsIDB4ZmZmZmZmZmYsCi0JMHgwMDAw
OTE1MCwgMHgwMDYwMDAwMCwgMHhmZmZmZmZmZiwKLQkweDAwMDAwOGY4LCAweDAwMDAwMDAwLCAw
eGZmZmZmZmZmLAotCTB4MDAwMDA4ZmMsIDB4ZmZmZmZmZmYsIDB4MDAwMTMzRkYsCi0JMHgwMDAw
MDhmOCwgMHgwMDAwMDAwMSwgMHhmZmZmZmZmZiwKLQkweDAwMDAwOGZjLCAweGZmZmZmZmZmLCAw
eEUwMEIwM0ZDCi19OwogI2VuZGlmCiAKICNpZm5kZWYgVFJJTklUWV9TWVNMU19TRVFVRU5DRQog
I2RlZmluZSBUUklOSVRZX1NZU0xTX1NFUVVFTkNFICAxMDAKIAotc3RhdGljIGNvbnN0IHUzMiB0
cmluaXR5X3N5c2xzX2RlZmF1bHRbXSA9Ci17Ci0JLyogUmVnaXN0ZXIsIFZhbHVlLCBNYXNrICov
Ci0JMHgwMDAwNTVlOCwgMHgwMDAwMDAwMCwgMHhmZmZmZmZmZiwKLQkweDAwMDBkMGJjLCAweDAw
MDAwMDAwLCAweGZmZmZmZmZmLAotCTB4MDAwMGQ4YmMsIDB4MDAwMDAwMDAsIDB4ZmZmZmZmZmYs
Ci0JMHgwMDAwMTVjMCwgMHgwMDBjMTQwMSwgMHhmZmZmZmZmZiwKLQkweDAwMDAyNjRjLCAweDAw
MGMwNDAwLCAweGZmZmZmZmZmLAotCTB4MDAwMDI2NDgsIDB4MDAwYzA0MDAsIDB4ZmZmZmZmZmYs
Ci0JMHgwMDAwMjY1MCwgMHgwMDBjMDQwMCwgMHhmZmZmZmZmZiwKLQkweDAwMDAyMGI4LCAweDAw
MGMwNDAwLCAweGZmZmZmZmZmLAotCTB4MDAwMDIwYmMsIDB4MDAwYzA0MDAsIDB4ZmZmZmZmZmYs
Ci0JMHgwMDAwMjBjMCwgMHgwMDBjMGM4MCwgMHhmZmZmZmZmZiwKLQkweDAwMDBmNGEwLCAweDAw
MDAwMGMwLCAweGZmZmZmZmZmLAotCTB4MDAwMGY0YTQsIDB4MDA2ODBmZmYsIDB4ZmZmZmZmZmYs
Ci0JMHgwMDAwMmY1MCwgMHgwMDAwMDQwNCwgMHhmZmZmZmZmZiwKLQkweDAwMDAwNGM4LCAweDAw
MDAwMDAxLCAweGZmZmZmZmZmLAotCTB4MDAwMDY0MWMsIDB4MDAwMDAwMDAsIDB4ZmZmZmZmZmYs
Ci0JMHgwMDAwMGM3YywgMHgwMDAwMDAwMCwgMHhmZmZmZmZmZiwKLQkweDAwMDA2ZGZjLCAweDAw
MDAwMDAwLCAweGZmZmZmZmZmCi19OwotCiBzdGF0aWMgY29uc3QgdTMyIHRyaW5pdHlfc3lzbHNf
ZGlzYWJsZVtdID0KIHsKIAkvKiBSZWdpc3RlciwgVmFsdWUsIE1hc2sgKi8KLS0gCjIuMjUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
