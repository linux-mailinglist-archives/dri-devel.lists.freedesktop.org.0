Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E012A9F75
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 22:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACAD6EB38;
	Fri,  6 Nov 2020 21:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C616F6EB25
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 21:50:04 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 23so1771690wmg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 13:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=socaU7um35iwEdYbuZIG6DpwnbxHw+sI5ykPEkbUzts=;
 b=u2YdzXP+cI8hNzxPMwK6P2NcmDOFEzfBJQ1EpULD/0QTAzDAFswU3D9HeqnrXDaHgs
 Oy1MEtKUiI0ihnz/ecIt2Zgh/i8gi71GIO72wLjJAI/LL7YwzoMcf0+q+tmjnKo6QcuJ
 +Pey6urIMQgILLkxbg12Gxzk65TaqpK+n5BAvblzKUfHnkTnovij7Oz3MZsQst54SD4J
 nN9l+QaZBIpPJG2iHMDHMANkmJHJXM/PXJq3dYk1iUFhneAtRGIYLAUkr2iWoOZDT5V0
 /pv6XxQ+ZFkcmR/MEtxE2C/os+HjFieodE3x8YaO2IXZw4PxzJnvCd0D5EwooPWjpxl5
 FXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=socaU7um35iwEdYbuZIG6DpwnbxHw+sI5ykPEkbUzts=;
 b=sgBkDvqx2yDds+KjxCqLYcAdgpH4yGp0rnYW/hLf1vAHtZCrJvOWzCBPSwful1LFVI
 JIWTw49sdIi5q/gq95RBDLA61n8YTHtRc13VQqG01N/8WBqIlHmuo6218toKMHgLVEjB
 r7XaZhBH3qbl9IpP0XpYsEGpuB+/jOV3ng8LVwzvWshHxTqrjfzfnAhEdetPC9nAnV20
 mf8w5jdbQYTwnM3hOixrnC+2GcaDIsoqxJ/bxjg8ijK4geNBA7AW9jdvfW8MgkN3sqGF
 Nxigp27vcJPlSn2z0k9E2U++NH7Nd7YviOSGUR014leEEoUyCI6HUftZQkbgKl7fyx3C
 +xgA==
X-Gm-Message-State: AOAM531TA1sPqkV8Bf6SkLxYS6hI5t+KiAhMorFkHAgdcgp4klwSCS6b
 C+z1SZFqfLhQiYT5IoauDh36Yg==
X-Google-Smtp-Source: ABdhPJxf2Mvms/vp2uquszu6id9VkQjR791be6+7w0PjmFHlbmzZeAI2kpvTw7QIRDdYtY7cmrQZ9w==
X-Received: by 2002:a05:600c:210a:: with SMTP id
 u10mr1644995wml.98.1604699403507; 
 Fri, 06 Nov 2020 13:50:03 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id t199sm3981084wmt.46.2020.11.06.13.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:50:02 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/19] drm/omapdrm/omap_gem: Fix misnamed and missing
 parameter descriptions
Date: Fri,  6 Nov 2020 21:49:38 +0000
Message-Id: <20201106214949.2042120-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106214949.2042120-1-lee.jones@linaro.org>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Rob Clark <rob.clark@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYzo1OTM6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFt
ZXRlciBvciBtZW1iZXIgJ2ZpbGUnIG5vdCBkZXNjcmliZWQgaW4gJ29tYXBfZ2VtX2R1bWJfY3Jl
YXRlJwogZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYzo1OTM6IHdhcm5pbmc6IEV4
Y2VzcyBmdW5jdGlvbiBwYXJhbWV0ZXIgJ2RybV9maWxlJyBkZXNjcmlwdGlvbiBpbiAnb21hcF9n
ZW1fZHVtYl9jcmVhdGUnCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jOjYxOTog
d2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnb2Zmc2V0JyBub3QgZGVzY3Jp
YmVkIGluICdvbWFwX2dlbV9kdW1iX21hcF9vZmZzZXQnCgpDYzogVG9taSBWYWxrZWluZW4gPHRv
bWkudmFsa2VpbmVuQHRpLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IFN1bWl0IFNlbXdhbCA8c3Vt
aXQuc2Vtd2FsQGxpbmFyby5vcmc+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4KQ2M6IFJvYiBDbGFyayA8cm9iLmNsYXJrQGxpbmFyby5vcmc+CkNjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5l
bC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL29tYXBfZ2VtLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBf
Z2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2dlbS5jCmluZGV4IGQ4ZTA5Nzky
NzkzYWIuLjBlNWFkZmFhZTY0NTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L29tYXBfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwpAQCAt
NTgwLDcgKzU4MCw3IEBAIGludCBvbWFwX2dlbV9tbWFwX29iaihzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3QgKm9iaiwKIAogLyoqCiAgKiBvbWFwX2dlbV9kdW1iX2NyZWF0ZQktCWNyZWF0ZSBhIGR1bWIg
YnVmZmVyCi0gKiBAZHJtX2ZpbGU6IG91ciBjbGllbnQgZmlsZQorICogQGZpbGU6IG91ciBjbGll
bnQgZmlsZQogICogQGRldjogb3VyIGRldmljZQogICogQGFyZ3M6IHRoZSByZXF1ZXN0ZWQgYXJn
dW1lbnRzIGNvcGllZCBmcm9tIHVzZXJzcGFjZQogICoKQEAgLTYxMCw2ICs2MTAsNyBAQCBpbnQg
b21hcF9nZW1fZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlLCBzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAogICogQGZpbGU6IG91ciBkcm0gY2xpZW50IGZpbGUKICAqIEBkZXY6IGRybSBk
ZXZpY2UKICAqIEBoYW5kbGU6IEdFTSBoYW5kbGUgdG8gdGhlIG9iamVjdCAoZnJvbSBkdW1iX2Ny
ZWF0ZSkKKyAqIEBvZmZzZXQ6IG1lbW9yeSBtYXAgb2Zmc2V0IHBsYWNlaG9sZGVyCiAgKgogICog
RG8gdGhlIG5lY2Vzc2FyeSBzZXR1cCB0byBhbGxvdyB0aGUgbWFwcGluZyBvZiB0aGUgZnJhbWUg
YnVmZmVyCiAgKiBpbnRvIHVzZXIgbWVtb3J5LiBXZSBkb24ndCBoYXZlIHRvIGRvIG11Y2ggaGVy
ZSBhdCB0aGUgbW9tZW50LgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
