Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 739E92B4D29
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40756E049;
	Mon, 16 Nov 2020 17:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E681289F3B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:09 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l1so19618899wrb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=brKpubI9m6t0/lslbRm7JoHNATZX8LOe9ERcjH2dq1I=;
 b=d2v+UQdDsneXlTN6mpwGtQa1JII7loaPK7FtyMdxwBh94nR+RMRJ2sdDSYWiWA4Gdi
 Fsfex/7l3c1d762P+eJfgiwtQweyGf+VyN6BqpR170YJE1cYPNRrZ2c4aQsXcc4rPdZJ
 otnuSbCzU3hogR5xqxla71Y0DxcVOGr3gnwv3HURcr7LQCg51B+f6/qNZ//m5TOu71hA
 gR9IG8kLM7fkPhoX4mWRd0t02ouUlxB7dBZQQN1h8Sc4P4hwG3Px8zuCPyOsPqB5Pz2m
 lsqp/V2hrnhwY7hSpbuRGaQ44N+AU0CUgjVfNQhR9LEgD9IWQYmyikJu0q16dQ81tnF+
 pGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=brKpubI9m6t0/lslbRm7JoHNATZX8LOe9ERcjH2dq1I=;
 b=uQQkElbQB3xxcrZRCB3ndFenmmawkfNkKJ2IS6Rrg8sowIkAQS7yzITXEiMrj4t1Dy
 fgU51S9YSa7W/y6Rmo00dmh94gauBoRTX5fXFvbkxZGsLzeqSlv1H84B7zO4FnnpXRum
 lkE7I+SSc+yhxwrXtWtpv4k3wxUc1vMGfGbOQbHkN9NCUtTiu5Rjn0AxOelj0kkIYN5A
 KJBnR2SEZV35/ngUx3kDMmH7Jze4OUoxrWPWHOMUULLmJjDKgch8pPV+jMvQooVeT1TO
 gEJnmOJkxuziSqyulN8RmBZVmrz8U3JM8iXHVRY/wgY6Jp7S6xE7kDf7bBZarvF4dbzD
 68+w==
X-Gm-Message-State: AOAM5335RjmZMn5VN1NKYC0feRIZTbin2G5difxslugXKffHOWN7kXkb
 OH7qRJqjr9tGYKQ0DCdH4z+LKg==
X-Google-Smtp-Source: ABdhPJyHYdBcdf6dmzu+ALix2+ZPddVQAxDPKulZ23x4FWjXmT0ZNsPvLa6uH2tvTXV3+CtTi1fmzA==
X-Received: by 2002:a5d:4612:: with SMTP id t18mr20435374wrq.401.1605548228653; 
 Mon, 16 Nov 2020 09:37:08 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:08 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/43] drm/radeon/radeon_kms: Fix misnaming of
 'radeon_info_ioctl's dev param
Date: Mon, 16 Nov 2020 17:36:21 +0000
Message-Id: <20201116173700.1830487-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173700.1830487-1-lee.jones@linaro.org>
References: <20201116173700.1830487-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmM6MjI2OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJh
bWV0ZXIgb3IgbWVtYmVyICdkZXYnIG5vdCBkZXNjcmliZWQgaW4gJ3JhZGVvbl9pbmZvX2lvY3Rs
JwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmM6MjI2OiB3YXJuaW5nOiBFeGNl
c3MgZnVuY3Rpb24gcGFyYW1ldGVyICdyZGV2JyBkZXNjcmlwdGlvbiBpbiAncmFkZW9uX2luZm9f
aW9jdGwnCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzog
IkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ttcy5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9rbXMuYwppbmRleCAwMDE5NDBiY2E5MGE2Li41MGNlZTQ4ODBiYjQ2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9rbXMuYwpAQCAtMjE0LDcgKzIxNCw3IEBAIHN0YXRp
YyB2b2lkIHJhZGVvbl9zZXRfZmlscF9yaWdodHMoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIC8q
KgogICogcmFkZW9uX2luZm9faW9jdGwgLSBhbnN3ZXIgYSBkZXZpY2Ugc3BlY2lmaWMgcmVxdWVz
dC4KICAqCi0gKiBAcmRldjogcmFkZW9uIGRldmljZSBwb2ludGVyCisgKiBAZGV2OiBkcm0gZGV2
aWNlIHBvaW50ZXIKICAqIEBkYXRhOiByZXF1ZXN0IG9iamVjdAogICogQGZpbHA6IGRybSBmaWxw
CiAgKgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
