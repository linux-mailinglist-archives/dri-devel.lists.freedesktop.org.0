Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BED12ADF5F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A104289BDB;
	Tue, 10 Nov 2020 19:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9578F89BE8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:21 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w24so4331015wmi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ToBBreDHzaPMHuGxgWs2PDlm690Qx/WYYnHDqhADX+E=;
 b=scT86LXlhwD/DGSbfeKqxrvBZQbUfExTEwqwwRUosV9TeiTlMaBH/+fiuQk7cwD1HG
 NQhIz85g6rfkkDEVxoHAm0VjR/WaNbxZi3M2QSb9BAjqckjkOR3fgvY/dSvULx6sTGOs
 8Y3EVQg2T1B1gYfsHlhsiyxoVsaEqZm57YEldw87P7kssVR6nNYY6jw5zxZ3MsrnHpN4
 rXRXNn6hEOWRrg5OOWPspraA76rLCQXC19a/bVYTFw+cKXqSE9k1Do3I9rcO7sUVTrkR
 /DinK+Qgi0KZfaVkPhLkKWtGVDswYtdOp6bK0cDnrpYgOXmfbY0UrzMdkxOEbI7tTFLP
 jUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ToBBreDHzaPMHuGxgWs2PDlm690Qx/WYYnHDqhADX+E=;
 b=MHkPpFc0gjN8Hr4HURLyNiea4VPp9e5glG/s1sUuEFHiZfvWx96VODphkwHJHvx7pt
 Abur58nkTm4UMIDzK3CaYxUR+CSojccUuJvHj7QNct1YoMNGGPydxJsUF/WwglLFBmVa
 yOzAX8/AVd5jMUk8NoBs66t2sLcDTBkainI7BkwuVoZp3miz8X1Yp42gY4tJsSXN+dXa
 hXYIc2NR3Q/HhkW+JCTunnYU44FpBo67FuWXRU4+II71G6pdiqWUY/lLkFEJTSW6qiZp
 nrz1ViQeZ7JT6aL1YIieV1Rs9joHq7XnyOrjImLvxDr6/BvbYRQkPzBGx2ryPnO/1j1r
 PbGA==
X-Gm-Message-State: AOAM530vzsxFUddXbkZvFn8NyF4tPhLUrO+quqIx/FagyeGfEyhrGoQv
 VE2Kv6So1d6gjwO02pwQ0E9l5Q==
X-Google-Smtp-Source: ABdhPJz2igbyZB5EVCWg9R4fz+S8+6prWa4uSVqzlzHX9F+8xc7URJs5tf1K9kCZx4X1EVBqd+tcuA==
X-Received: by 2002:a1c:3103:: with SMTP id x3mr705693wmx.107.1605036680213;
 Tue, 10 Nov 2020 11:31:20 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:19 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/30] drm/radeon/ni: Demote vague attempt at function header
 doc
Date: Tue, 10 Nov 2020 19:30:45 +0000
Message-Id: <20201110193112.988999-4-lee.jones@linaro.org>
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
CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmM6MjY3OTogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIG1lbWJlciAncmluZycgbm90IGRlc2NyaWJlZCBpbiAnY2F5bWFuX3ZtX2ZsdXNo
JwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9uaS5jOjI2Nzk6IHdhcm5pbmc6IEZ1bmN0aW9uIHBh
cmFtZXRlciBvciBtZW1iZXIgJ3ZtX2lkJyBub3QgZGVzY3JpYmVkIGluICdjYXltYW5fdm1fZmx1
c2gnCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmM6MjY3OTogd2FybmluZzogRnVuY3Rpb24g
cGFyYW1ldGVyIG9yIG1lbWJlciAncGRfYWRkcicgbm90IGRlc2NyaWJlZCBpbiAnY2F5bWFuX3Zt
X2ZsdXNoJwoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmMgfCA0ICstLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL25pLmMK
aW5kZXggNTNhNGQ1YzEwOTc5NC4uMTJkZDA4MjA2OTY0OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9uaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vbmkuYwpAQCAt
MjY2OCwxMSArMjY2OCw5IEBAIHZvaWQgY2F5bWFuX3ZtX2RlY29kZV9mYXVsdChzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldiwKIAkgICAgICAgYmxvY2ssIG1jX2lkKTsKIH0KIAotLyoqCisvKgog
ICogY2F5bWFuX3ZtX2ZsdXNoIC0gdm0gZmx1c2ggdXNpbmcgdGhlIENQCiAgKgotICogQHJkZXY6
IHJhZGVvbl9kZXZpY2UgcG9pbnRlcgotICoKICAqIFVwZGF0ZSB0aGUgcGFnZSB0YWJsZSBiYXNl
IGFuZCBmbHVzaCB0aGUgVk0gVExCCiAgKiB1c2luZyB0aGUgQ1AgKGNheW1hbi1zaSkuCiAgKi8K
LS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
