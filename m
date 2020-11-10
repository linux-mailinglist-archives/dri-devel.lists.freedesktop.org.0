Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7F12ADF81
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:32:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5410589C6A;
	Tue, 10 Nov 2020 19:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47FE989C28
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:51 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l1so9605965wrb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vvESdKcgA/L+8nfzHIhJWgogEA2sv/augj021aQ6Bjc=;
 b=ZJw8ND/9bYHNBVXDmU7GEhDFPjuFQlU5+Kc7N6oNwR9ygFDK9h6108LYish92o3sF/
 9g/r9hgfo91h9+hm6363YzrOl6p7qDErHiA41H2m/SyEkFBIK1eKvQpRgYJ+PMOa3sc4
 cdV6C3R1MYOBMBoVWp5kuuVLyYMJAJaY7SZZPHrfzPPIWkia89ujnAdqCTK4SsUUqAgu
 ZEbs4WX1DiUH5nLcYf15NZRwanNF/NQCDt5HTmkWETCiTwwlnRWVRlhHZsJnb+vDopha
 jJJ8xIGlSLXcCgmuSRPC9e+9DvRgY4Y9vy1xLqk/bA4KjtMtC3+nHdawMzpnAPhx1QdJ
 C/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vvESdKcgA/L+8nfzHIhJWgogEA2sv/augj021aQ6Bjc=;
 b=AgMLXorVEZhAKQW5paMHAwCMIiwSwkZZ8Ly26/dUp9egS4x4Krub3DWprC1HUZ5Iwe
 JRWJXy+uDBR0a8E9t3FZzPhvxp+nd0yHdx23F1c+n4a7bYhqWC2p+kqX2imTKBAtypVB
 1L0vqyfX2W3s2C5G5Ap3qPtCSIAW/eRs8xFXOkNLivFygfwDXh/Y8p9Mjdq9/LXwowgI
 oqHUDp0TeovzfCge2g61WF7fMtWnZOntqds/Wi7dqv0CVZnRh+9iKOAfk1xZ2LrWuKR/
 URuJLZavElwJMfCUcsNeC12zFi5c218LRmf/TVa/+IM+8swfy4Y4arpJGNBO42Ulcrdi
 psSg==
X-Gm-Message-State: AOAM532TlpXeDFU4uqZF2cnNuxjNISAHc82uy6Q0LNKgtCoh3j86OhfJ
 iQhf7Hv0/+GFTdQIbbft3tbIcyLq7TtglKln
X-Google-Smtp-Source: ABdhPJyvnNToifCwCcItVV2Yat9wLKHzh5OkA8Rn5RJraDJliZGDbS0ptMaJMV9PQvGxFZjcejgTTw==
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr14030198wrg.366.1605036709871; 
 Tue, 10 Nov 2020 11:31:49 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:49 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 27/30] drm/radeon/ni: Remove set but unused variable
 'mc_shared_chmap'
Date: Tue, 10 Nov 2020 19:31:09 +0000
Message-Id: <20201110193112.988999-28-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9uaS5jOiBJbiBmdW5jdGlvbiDigJhjYXltYW5fZ3B1X2luaXTigJk6
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmM6ODgwOjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKA
mG1jX3NoYXJlZF9jaG1hcOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmMgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9uaS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9uaS5j
CmluZGV4IDEyZGQwODIwNjk2NDkuLjFjOTAzMGE0NjMxYjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vbmkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmMKQEAg
LTg3Nyw3ICs4NzcsNyBAQCBpbnQgdG5fZ2V0X3RlbXAoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJk
ZXYpCiBzdGF0aWMgdm9pZCBjYXltYW5fZ3B1X2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJk
ZXYpCiB7CiAJdTMyIGdiX2FkZHJfY29uZmlnID0gMDsKLQl1MzIgbWNfc2hhcmVkX2NobWFwLCBt
Y19hcmJfcmFtY2ZnOworCXUzMiBtY19hcmJfcmFtY2ZnOwogCXUzMiBjZ3RzX3RjY19kaXNhYmxl
OwogCXUzMiBzeF9kZWJ1Z18xOwogCXUzMiBzbXhfZGNfY3RsMDsKQEAgLTEwMDIsNyArMTAwMiw3
IEBAIHN0YXRpYyB2b2lkIGNheW1hbl9ncHVfaW5pdChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRl
dikKIAogCWV2ZXJncmVlbl9maXhfcGNpX21heF9yZWFkX3JlcV9zaXplKHJkZXYpOwogCi0JbWNf
c2hhcmVkX2NobWFwID0gUlJFRzMyKE1DX1NIQVJFRF9DSE1BUCk7CisJUlJFRzMyKE1DX1NIQVJF
RF9DSE1BUCk7CiAJbWNfYXJiX3JhbWNmZyA9IFJSRUczMihNQ19BUkJfUkFNQ0ZHKTsKIAogCXRt
cCA9IChtY19hcmJfcmFtY2ZnICYgTk9PRkNPTFNfTUFTSykgPj4gTk9PRkNPTFNfU0hJRlQ7Ci0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
