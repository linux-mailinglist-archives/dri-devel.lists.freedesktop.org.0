Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111312C30F9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 20:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D5B6E5C8;
	Tue, 24 Nov 2020 19:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91796E53C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 19:44:17 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e7so6012526wrv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 11:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oqd4hAPXVQ3fy/lIhgm4S39do0C9n+Zmijh2vXrOwng=;
 b=OpNqFhKNSt+HIPPv/t65OGpW81kQdUziPNC7wzPn6N1uU+n91qp0/9HKjWKZYETyfc
 V5knlydZZ/sO9q6WaVzrlt4IywSYDcY1EnPjyk0ilr9JYGPi8KVLtsiBuUIfrHLDgmzY
 TJHVghNbiCNVrZHFz7pg29bfo13wGjJyfLfrf12gpLu9Btn+LKxA0hPsCakSHb8mbKWy
 9Mtn0PpQe3CoqS2o61k1dzAF0MtLjRTjXkBzQVOcc8PglXU2Pwe5U3/u/VKe8Hhgrl4o
 Rvgz7tuOCLl8Lxy+GkfzfSuyRwLmZ+Vrzw21iIvVkL2T6Cc5U2PqX73FisBNlz4iA5l8
 1o3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oqd4hAPXVQ3fy/lIhgm4S39do0C9n+Zmijh2vXrOwng=;
 b=GkTf1RqK0SQzrlX5bv9nDtizI8m7D4/wZZkTBfIyofTGU2q9FWylP9YG/c4Sa9FMRz
 KG5AA8lB4/1/yWlkMgvjin0YmrNtuJGpbFniHllxKiE2kQim0dehuqrLvXFXy2aBgvbJ
 V+motY6najCnPJK4/XXAtqTaw23RkbSpDy4UD3gzc6cuKPupCeNSiaSCRCtD0YnvUEcN
 WPM6YANwZRBTTUtup0KZecxKX2O3jIoARPty2wnmL8sIjhwxOOka5DUGkCRzJkY8VfFe
 A2nBZfIZtq9MOrPV7eewVr/wxv6GsWuObP/9YUgkMcjBzEyGggaIZxY7xRlavjwFaVIl
 +ciA==
X-Gm-Message-State: AOAM532NkbuoYBUydP709PMq8VHZshmCOAMSxt9bM5cwUBT+b6Q08eYI
 5FyntMXkAkLhtxNKALpRJItC6A==
X-Google-Smtp-Source: ABdhPJwku9UPnqBk6ZnYV6+qVhkZ9W9TpjwXx4rfs7TBedVlnAzDXNW94dPSR58L2x2Eey/ASl1Ogg==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr83754wrr.1.1606247056420;
 Tue, 24 Nov 2020 11:44:16 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id d134sm200511wmd.8.2020.11.24.11.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:44:15 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/40] drm/amd/amdgpu/gfx_v9_0: Make called-by-reference only
 function static
Date: Tue, 24 Nov 2020 19:37:58 +0000
Message-Id: <20201124193824.1118741-15-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYzoyOTk4OjY6IHdhcm5pbmc6IG5vIHByZXZp
b3VzIHByb3RvdHlwZSBmb3Ig4oCYZ2Z4X3Y5XzBfcmxjX3N0b3DigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgpDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4KQ2M6IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlz
dHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwppbmRleCA4YTZjMDUwY2I2Y2FmLi5lYWU4MWZjNDEyNTU2
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKQEAgLTI5OTUsNyArMjk5NSw3
IEBAIHN0YXRpYyB2b2lkIGdmeF92OV8wX2luaXRfcGcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJfQogfQogCi12b2lkIGdmeF92OV8wX3JsY19zdG9wKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQorc3RhdGljIHZvaWQgZ2Z4X3Y5XzBfcmxjX3N0b3Aoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpCiB7CiAJV1JFRzMyX0ZJRUxEMTUoR0MsIDAsIFJMQ19DTlRMLCBSTENfRU5BQkxF
X0YzMiwgMCk7CiAJZ2Z4X3Y5XzBfZW5hYmxlX2d1aV9pZGxlX2ludGVycnVwdChhZGV2LCBmYWxz
ZSk7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
