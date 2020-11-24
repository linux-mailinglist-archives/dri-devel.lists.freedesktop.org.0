Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9A12C30F7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876436E5D4;
	Tue, 24 Nov 2020 19:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096546E591
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:49 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u12so23613662wrt.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZfvfRQ7PcXeWjD8kLGjroSyeWiIdkNR2GVd+kakULXA=;
 b=GyUSflYAhp72ymYdK/TLzXTC6jnA3PL8lz6LGThanbH/oCVxl6fYwFpyukGz69I60t
 DezilZrVxmnNrP9s53T07U8j1EadxyiUhAUlmdVbaHS1roFKfuYZvXrTgtBUdcbcMUgB
 6OJnw+uSvL/4ILJOe8BZfP/YE/UnULd86LklD5mgfYSI5ngdwFDBE28hJwm0ClZJC71o
 xpc00paWjoWJ4v/4dfrZpXnfHsrko2HQFsaV84ZIOx8CMMvauYY4PrQYZww9jyfQfZVv
 qCEwhcqAARpGqb1kLIJoNDW2udIUS/DiqrH4EV/xt/8Sn0f3d2s2igUUP3ofNYBfv0CY
 B1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZfvfRQ7PcXeWjD8kLGjroSyeWiIdkNR2GVd+kakULXA=;
 b=YZq5UGw8xTUyE3F1zLUHEAX3X5B5AlF666pb4zhbMbQ6oCiS+MhTlweGo9PpFGe/YL
 1ungUa7YORtXV2EWUyCHnOjpHp4J7IJHE/Il9tsbtg2834FG/y9fKf3m5UtksYsQoZXz
 e/ClF3aEr1dSN2R5TsHLHpXYAHRyafRsDlmBs/+c5AKOUNEu8jhSr20irs5aTrmmzSIa
 WITeP34fsAet/gxRzA0nWcg4g/4RS9AezrgvLMHcRurOYu3SzMH8D4jxjgw68FCDZxht
 EtuZ76B0rEzpsUFEdZpcWaQTFyYP0ZbOa67McBQED9uu7HCf3tU7Sx1Gypn5k1wQAlD/
 QP0w==
X-Gm-Message-State: AOAM532VIPyy7y4Ee17LWGXqjMsYrdS6bK5tuCXp8lB51PxBRPjfaLkr
 ay9O0wj8zn60uO4TrenDj4SrOg==
X-Google-Smtp-Source: ABdhPJyJjV23yZdohN2gtkIsTOcuofWR2WSH8duGcXFhvLfLZcGvGem4By7WDfHpInOfxrtBJiKFMg==
X-Received: by 2002:adf:f9c4:: with SMTP id w4mr124603wrr.64.1606247087673;
 Tue, 24 Nov 2020 11:44:47 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:47 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 39/40] drm/amd/pm/powerplay/smumgr/fiji_smumgr: Remove unused
 variable 'result'
Date: Tue, 24 Nov 2020 19:38:23 +0000
Message-Id: <20201124193824.1118741-40-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124193824.1118741-1-lee.jones@linaro.org>
References: <20201124193824.1118741-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1nci5j
OiBJbiBmdW5jdGlvbiDigJhmaWppX3BvcHVsYXRlX3NtY19ib290X2xldmVs4oCZOgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1nci5j
OjE2MDM6Njogd2FybmluZzogdmFyaWFibGUg4oCYcmVzdWx04oCZIHNldCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1k
LmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJD
aHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNo
PgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KLS0tCiAuLi4vZ3B1L2RybS9hbWQvcG0vcG93ZXJwbGF5L3NtdW1nci9maWppX3NtdW1n
ci5jICAgfCAxMyArKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vcG93
ZXJwbGF5L3NtdW1nci9maWppX3NtdW1nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dl
cnBsYXkvc211bWdyL2Zpamlfc211bWdyLmMKaW5kZXggZmVmOWQzOTA2ZmNjZC4uZmVhMDA4Y2Mx
ZjI1NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211bWdy
L2Zpamlfc211bWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9wb3dlcnBsYXkvc211
bWdyL2Zpamlfc211bWdyLmMKQEAgLTE2MDAsMjAgKzE2MDAsMTkgQEAgc3RhdGljIGludCBmaWpp
X3BvcHVsYXRlX3NtY191dmRfbGV2ZWwoc3RydWN0IHBwX2h3bWdyICpod21nciwKIHN0YXRpYyBp
bnQgZmlqaV9wb3B1bGF0ZV9zbWNfYm9vdF9sZXZlbChzdHJ1Y3QgcHBfaHdtZ3IgKmh3bWdyLAog
CQlzdHJ1Y3QgU01VNzNfRGlzY3JldGVfRHBtVGFibGUgKnRhYmxlKQogewotCWludCByZXN1bHQg
PSAwOwogCXN0cnVjdCBzbXU3X2h3bWdyICpkYXRhID0gKHN0cnVjdCBzbXU3X2h3bWdyICopKGh3
bWdyLT5iYWNrZW5kKTsKIAogCXRhYmxlLT5HcmFwaGljc0Jvb3RMZXZlbCA9IDA7CiAJdGFibGUt
Pk1lbW9yeUJvb3RMZXZlbCA9IDA7CiAKIAkvKiBmaW5kIGJvb3QgbGV2ZWwgZnJvbSBkcG0gdGFi
bGUgKi8KLQlyZXN1bHQgPSBwaG1fZmluZF9ib290X2xldmVsKCYoZGF0YS0+ZHBtX3RhYmxlLnNj
bGtfdGFibGUpLAotCQkJZGF0YS0+dmJpb3NfYm9vdF9zdGF0ZS5zY2xrX2Jvb3R1cF92YWx1ZSwK
LQkJCSh1aW50MzJfdCAqKSYodGFibGUtPkdyYXBoaWNzQm9vdExldmVsKSk7CisJcGhtX2ZpbmRf
Ym9vdF9sZXZlbCgmKGRhdGEtPmRwbV90YWJsZS5zY2xrX3RhYmxlKSwKKwkJCSAgICBkYXRhLT52
Ymlvc19ib290X3N0YXRlLnNjbGtfYm9vdHVwX3ZhbHVlLAorCQkJICAgICh1aW50MzJfdCAqKSYo
dGFibGUtPkdyYXBoaWNzQm9vdExldmVsKSk7CiAKLQlyZXN1bHQgPSBwaG1fZmluZF9ib290X2xl
dmVsKCYoZGF0YS0+ZHBtX3RhYmxlLm1jbGtfdGFibGUpLAotCQkJZGF0YS0+dmJpb3NfYm9vdF9z
dGF0ZS5tY2xrX2Jvb3R1cF92YWx1ZSwKLQkJCSh1aW50MzJfdCAqKSYodGFibGUtPk1lbW9yeUJv
b3RMZXZlbCkpOworCXBobV9maW5kX2Jvb3RfbGV2ZWwoJihkYXRhLT5kcG1fdGFibGUubWNsa190
YWJsZSksCisJCQkgICAgZGF0YS0+dmJpb3NfYm9vdF9zdGF0ZS5tY2xrX2Jvb3R1cF92YWx1ZSwK
KwkJCSAgICAodWludDMyX3QgKikmKHRhYmxlLT5NZW1vcnlCb290TGV2ZWwpKTsKIAogCXRhYmxl
LT5Cb290VmRkYyAgPSBkYXRhLT52Ymlvc19ib290X3N0YXRlLnZkZGNfYm9vdHVwX3ZhbHVlICoK
IAkJCVZPTFRBR0VfU0NBTEU7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
