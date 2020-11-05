Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275902A8173
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1806ED9A;
	Thu,  5 Nov 2020 14:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6306ED94
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:22 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x12so2084333wrm.8
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wbt6Bt9xb+nEOL+sC88FIyMMDCRwxeU6Sb1wX9bISpg=;
 b=Fam3S7jhyYU7Z3NVpeOT6nsSRFnhdHgQmCdaWhPs/Yr784DIvf4lSZhyZHm2kJR56B
 xFeYjjLXHYSZXkqWhyT2ShuGYnKzxLHPnefwdaOp8hMNZV2apCFXYCYmtM2cgs1iwSfU
 /9VZfe69vuzcpbQb11b7TYnFXBRK9Ha/1DN1lG5nS5Tg/bckPfi2G8c4ImLNv6WThk4y
 kiAwvcINQwP5e8wsl/NVsQ1wfRvGCXS77nJZpnFrQuQvrJvGByjSikVklVVtzAl/Pa0a
 jXTSoylLp28E6q1VPfcZ60zbGwaQ4FEK5FQQu2wjmDXStRYgwELevsk7O/w7zazaDndl
 GIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wbt6Bt9xb+nEOL+sC88FIyMMDCRwxeU6Sb1wX9bISpg=;
 b=VHFustvNLt75K1kiHn9eApytCTREUrLcL3WKz/nrag2zQei3Sl6K64Gf1rSJabaGKS
 cu74dQbhjLLMW92cSYxliP6BVjjS8sWKX5Yvv3/cTppcgu+fInfxJhEaUnihHVPWZcOd
 gUZtzoyxH7P+Wlqje4BA3P0HewWLCvarv8hKUwwGqLUAMGZY7x27z5GBNg+pxBnqrZbG
 MLwfsLJIb7CCNZNeAXnpROjFbwTD6USIpDS0Dc2OiM6km0C4xhcn/HR9rjLd0tTsWfJf
 Y+ztEa/ga9adenanedxcXdCW3R93bE1weeElkxbsZEEMY41IpAyo1L8k0VXIHQf589UP
 8iew==
X-Gm-Message-State: AOAM531w84x+VutuN4NCE6xEpO89B2LOKhisXwbNtGYq2XFOak7Tfk/R
 bm4SilLcdt7h2oYObjMZlebkhw==
X-Google-Smtp-Source: ABdhPJyUVy8zvMojF9OfX8R20eVTkRIbuvjv/KNiuhzS4OiNxtWZb4zKr0KnzrRzULj0tbNM0uBdEA==
X-Received: by 2002:a05:6000:8d:: with SMTP id
 m13mr3373575wrx.216.1604587940699; 
 Thu, 05 Nov 2020 06:52:20 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:20 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 05/19] gpu: drm: selftests: test-drm_mm: Mark 'hole_end' as
 always_unused
Date: Thu,  5 Nov 2020 14:45:03 +0000
Message-Id: <20201105144517.1826692-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIG1hY3JvIGRybV9tbV9mb3JfZWFjaF9ob2xlKCkgJ2hvbGVfZW5kJyBpcyBwcm92aWRl
ZCBhcyBhCmNvbnRhaW5lciBmb3IgJ2hvbGVfc3RhcnQgKyBwb3MtPmhvbGVfc2l6ZScsIGJ1dCBp
cyBub3QgdXRpbGlzZWQgaW4KdGhpcyB1c2UtY2FzZS4gIFdlIGNhbm5vdCBzaW1wbHkgZGVsZXRl
IHRoZSB2YXJpYWJsZSwgc28gaGVyZSB3ZSB0ZWxsCnRoZSBjb21waWxlciB0aGF0IHdlJ3JlIGlu
dGVudGlvbmFsbHkgZGlzY2FyZGluZyB0aGUgcmVhZCB2YWx1ZS4KCkZpeGVzIHRoZSBmb2xsb3dp
bmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOgoKIGRyaXZlcnMvZ3B1L2RybS9zZWxmdGVz
dHMvdGVzdC1kcm1fbW0uYzogSW4gZnVuY3Rpb24g4oCYYXNzZXJ0X25vX2hvbGVz4oCZOgogZHJp
dmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9tbS5jOjU3OjE4OiB3YXJuaW5nOiB2YXJp
YWJsZSDigJhob2xlX2VuZOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQoKQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPgpDYzogTmlybW95IERhcyA8bmlybW95LmFpZW1kQGdtYWlsLmNvbT4K
Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpv
bmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3Rz
L3Rlc3QtZHJtX21tLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3Qt
ZHJtX21tLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2VsZnRlc3RzL3Rlc3QtZHJtX21tLmMKaW5kZXgg
OTVlMjEyYTlhNzRkMi4uYjc2OGI1M2M0YWVlMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3NlbGZ0ZXN0cy90ZXN0LWRybV9tbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMv
dGVzdC1kcm1fbW0uYwpAQCAtNTQsNyArNTQsNyBAQCBzdGF0aWMgaW50IGlndF9zYW5pdHljaGVj
ayh2b2lkICppZ25vcmVkKQogc3RhdGljIGJvb2wgYXNzZXJ0X25vX2hvbGVzKGNvbnN0IHN0cnVj
dCBkcm1fbW0gKm1tKQogewogCXN0cnVjdCBkcm1fbW1fbm9kZSAqaG9sZTsKLQl1NjQgaG9sZV9z
dGFydCwgaG9sZV9lbmQ7CisJdTY0IGhvbGVfc3RhcnQsIF9fYWx3YXlzX3VudXNlZCBob2xlX2Vu
ZDsKIAl1bnNpZ25lZCBsb25nIGNvdW50OwogCiAJY291bnQgPSAwOwotLSAKMi4yNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
