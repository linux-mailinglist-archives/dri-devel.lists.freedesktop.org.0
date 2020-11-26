Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6FE2C5623
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 14:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132486E97E;
	Thu, 26 Nov 2020 13:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2FF6E96F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:24 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x22so2181630wmc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4u/cyGzH+u9QQSq+abd2+vyaNq4rk53k+eLSNkiBjf0=;
 b=ALUCxbMFgNl6Y+EGHLaMLveA4sRcf9yCJbgqBxya1G860rH7lp/E4PAVEFWm3w5icv
 9G24r0Oq157EV/uUl3o8/Lxg/+i3kM1QXvSGpEkwSr2dNxQDTLMenKc0UCsAzx+wQh2C
 EksXweKKsnY37CHf/m+bXwaoBiak2cE5b4nkMfVCuHQhcPinfwjMspCz/z2wLWfXt4+3
 Gifj73DXGNlj/XJseSfcCL9KjCYva6s6+/gsp2FnrpLQ303wLU7jTLG60GVLQ/EZKVD+
 5GBSJPY4QXHLwNNk5SJYvQk1jS/Z9KPf+uA7JutzXP3S1EXjYV2Mfmcc7K3PVDo+Vipg
 iLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4u/cyGzH+u9QQSq+abd2+vyaNq4rk53k+eLSNkiBjf0=;
 b=nI3ctyqLojV5m3s7FymsMiv+kqdsFUl4rUVTsENuJ4Oq4T3PbSvXz/+FxsfbI0EXFa
 er/7h9OUUCzk53A0lC2Zjx+MKq2mv4eYlcKzP7bHezZr27X2R9KfKUTO2F1nukQI0M1W
 5JJJ+lAIVbwZjp7KGP4JewYyqr42HwN9FHZ+cYcQ3xHwIbkwWSe+7CwwbDflq3Wbrh/J
 dVIwL2U08GXT15mtZWm63ixU1g7P8536G/AIIRLTHYBHuxeQVAWAjEO2UvtRSFRoQmpp
 S70V5X5BaBSkY6phv69iDgI8iE4/kunjpEpbVBBMr19bjP+wKqvhseLioBuQmLlF6GdO
 pd5g==
X-Gm-Message-State: AOAM530AS4XAQXxyq2FY6Sg18RjFLXDsquu1oEbpUA4Q2fqWqTVLKf3Y
 FpDR7Bq6qOwhsUh5D7TKtXdzUA==
X-Google-Smtp-Source: ABdhPJyW57/UeqmUPAfhyPljCPknm7hrzUdaluG5uYdqwUv6eoo92u8Px9GFloGreOGNcCSIHK3DTg==
X-Received: by 2002:a7b:cc95:: with SMTP id p21mr3486592wma.92.1606398202703; 
 Thu, 26 Nov 2020 05:43:22 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 25/40] drm/amd/pm/powerplay/hwmgr/pp_psm: Remove unused
 variable 'result'
Date: Thu, 26 Nov 2020 13:42:25 +0000
Message-Id: <20201126134240.3214176-26-lee.jones@linaro.org>
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

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L2h3bWdyL3BwX3BzbS5jOiBJbiBm
dW5jdGlvbiDigJhwc21faW5pdF9wb3dlcl9zdGF0ZV90YWJsZeKAmToKIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL3BtL3Bvd2VycGxheS9od21nci9wcF9wc20uYzozMTo2OiB3YXJuaW5n
OiB2YXJpYWJsZSDigJhyZXN1bHTigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNl
dC12YXJpYWJsZV0KCkNjOiBFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQuY29tPgpDYzogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWci
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGlu
dXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpT
aWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3BwX3BzbS5jIHwgMyArLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL3Bvd2VycGxheS9od21nci9wcF9wc20uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L2h3bWdyL3BwX3BzbS5jCmluZGV4IDMxYTMyYTc5Y2Zj
MjAuLjMyOGU4N2Y2YzliY2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93
ZXJwbGF5L2h3bWdyL3BwX3BzbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93ZXJw
bGF5L2h3bWdyL3BwX3BzbS5jCkBAIC0yOCw3ICsyOCw2IEBACiAKIGludCBwc21faW5pdF9wb3dl
cl9zdGF0ZV90YWJsZShzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyKQogewotCWludCByZXN1bHQ7CiAJ
dW5zaWduZWQgaW50IGk7CiAJdW5zaWduZWQgaW50IHRhYmxlX2VudHJpZXM7CiAJc3RydWN0IHBw
X3Bvd2VyX3N0YXRlICpzdGF0ZTsKQEAgLTczLDcgKzcyLDcgQEAgaW50IHBzbV9pbml0X3Bvd2Vy
X3N0YXRlX3RhYmxlKHN0cnVjdCBwcF9od21nciAqaHdtZ3IpCiAJc3RhdGUgPSBod21nci0+cHM7
CiAKIAlmb3IgKGkgPSAwOyBpIDwgdGFibGVfZW50cmllczsgaSsrKSB7Ci0JCXJlc3VsdCA9IGh3
bWdyLT5od21ncl9mdW5jLT5nZXRfcHBfdGFibGVfZW50cnkoaHdtZ3IsIGksIHN0YXRlKTsKKwkJ
aHdtZ3ItPmh3bWdyX2Z1bmMtPmdldF9wcF90YWJsZV9lbnRyeShod21nciwgaSwgc3RhdGUpOwog
CiAJCWlmIChzdGF0ZS0+Y2xhc3NpZmljYXRpb24uZmxhZ3MgJiBQUF9TdGF0ZUNsYXNzaWZpY2F0
aW9uRmxhZ19Cb290KSB7CiAJCQlod21nci0+Ym9vdF9wcyA9IHN0YXRlOwotLSAKMi4yNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
