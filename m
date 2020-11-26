Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0ED2C5617
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFA96E962;
	Thu, 26 Nov 2020 13:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1B36E957
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:03 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a186so2199184wme.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gri5Q1ZsHo+JoBxGfrJZZW9SZIInF5/xkJvef28TzCQ=;
 b=fqPPgyNW5YpmOSE71xHIKuvM+xg9IUILLUjRvO1hWX8/333x8W4QT67NPv+C8bozIy
 tFMqF9icDS0zvyTYZgWA/m1fP0mCA7OTmHoUE2MDnIiXC9C3s2c+eDGlVzXLXwjGsVe+
 IDFwppI5i0UFrRo0NZjZ70MKdLrBCl7IB8cqFEMoqacGdKqEUpy4PeNmvBdiVrp/5mXA
 AyPY1L3++JBVT/rTM+8v2z9lupnMBLt5Y+1T1592dGIa4JCSyREVc8Nf1t1JHL7NPbfL
 8xYftyKeq7YlGfWS2xkpEPVttx7SNLBqIcMnMACyPyTAB1kpH27piWLOWJ+DylNcrA9Q
 K0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gri5Q1ZsHo+JoBxGfrJZZW9SZIInF5/xkJvef28TzCQ=;
 b=psG2Tmr2caFwwt8EtougfdyYRSNjK3aJV9W1b7InTbVD/CLrFBozT8eAN7yyVmKrWN
 cMV7WgM0URHDWgd2dmoy3fNcIuW14JXYeYafTGpoy18ZO/JMXAIOMx5Z3AaH3PUWptCt
 Y9WlRCexU9O9MyEUvgZoX/kdpMqISID2QGLV931smrL8fBpMMPCnSYRRlGFUMwGAu8ch
 rkVEhaPGm9o2f7q53l2usbCan77xZouoTgp2Rno63Pk4dXNpgkzgNav6522nS/HliYSh
 /CuqVJlms3UNAIQBjN49xh4PsCg3ZfJ+cBLA0HSIQEijIsenyiBXyNRKbvV7sI+E/o7T
 zOfw==
X-Gm-Message-State: AOAM532ApYgfla8/Yx5ZsRpDpRm6tBBEecC3q7ENdqlgDSkrpKYx7WAn
 KaCOJMtyZzt5nACJszzT2Y0nOw==
X-Google-Smtp-Source: ABdhPJxpsMWiO7wJ6aWp2ZBnURciNFJyzaYsTRXTQCiK/i14aN+DP5ZoGSNsIGmzdHfSZtoU5ZxP3g==
X-Received: by 2002:a7b:c1ce:: with SMTP id a14mr3493478wmj.169.1606398177946; 
 Thu, 26 Nov 2020 05:42:57 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:42:57 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/40] drm/amd/pm/powerplay/hwmgr/hwmgr: Move
 'smu8_init_function_pointers()' prototype to shared header
Date: Thu, 26 Nov 2020 13:42:09 +0000
Message-Id: <20201126134240.3214176-10-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgpDYzogRXZh
biBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2lu
Yy9od21nci5oICAgICAgICAgICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2Vy
cGxheS9od21nci9od21nci5jIHwgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMv
aHdtZ3IuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2h3bWdyLmgKaW5kZXggMWJiMzc5
NDk4YTEyMS4uMGUyMmNiYTNjZTNhNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
bS9pbmMvaHdtZ3IuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9od21nci5oCkBA
IC04MjgsNSArODI4LDYgQEAgaW50IGh3bWdyX2hhbmRsZV90YXNrKHN0cnVjdCBwcF9od21nciAq
aHdtZ3IsCiAKICNkZWZpbmUgUEhNX0VOVElSRV9SRUdJU1RFUl9NQVNLIDB4RkZGRkZGRkZVCiAK
K2ludCBzbXU4X2luaXRfZnVuY3Rpb25fcG9pbnRlcnMoc3RydWN0IHBwX2h3bWdyICpod21ncik7
CiAKICNlbmRpZiAvKiBfSFdNR1JfSF8gKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG0vcG93ZXJwbGF5L2h3bWdyL2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bv
d2VycGxheS9od21nci9od21nci5jCmluZGV4IDczOWUyMTVlYzhiN2YuLmVjMTdhM2U2M2VhMDIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL2h3bWdy
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvaHdtZ3IvaHdtZ3IuYwpA
QCAtNDcsNyArNDcsNiBAQCBleHRlcm4gY29uc3Qgc3RydWN0IHBwX3NtdW1ncl9mdW5jIHNtdTEw
X3NtdV9mdW5jczsKIGV4dGVybiBjb25zdCBzdHJ1Y3QgcHBfc211bWdyX2Z1bmMgdmVnYTIwX3Nt
dV9mdW5jczsKIAogZXh0ZXJuIGludCBzbXU3X2luaXRfZnVuY3Rpb25fcG9pbnRlcnMoc3RydWN0
IHBwX2h3bWdyICpod21ncik7Ci1leHRlcm4gaW50IHNtdThfaW5pdF9mdW5jdGlvbl9wb2ludGVy
cyhzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKTsKIGV4dGVybiBpbnQgdmVnYTEwX2h3bWdyX2luaXQo
c3RydWN0IHBwX2h3bWdyICpod21ncik7CiBleHRlcm4gaW50IHZlZ2ExMl9od21ncl9pbml0KHN0
cnVjdCBwcF9od21nciAqaHdtZ3IpOwogZXh0ZXJuIGludCB2ZWdhMjBfaHdtZ3JfaW5pdChzdHJ1
Y3QgcHBfaHdtZ3IgKmh3bWdyKTsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
