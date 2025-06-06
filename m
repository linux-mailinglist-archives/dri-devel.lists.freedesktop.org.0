Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642A5ACFEBA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 11:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692D210EA1D;
	Fri,  6 Jun 2025 09:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pML5cLSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6174410EA26
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 09:04:55 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-450cf0120cdso17869185e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jun 2025 02:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749200694; x=1749805494; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u22QGRwwJcexG344pLAuyEqJQtDbVkBJOvRPUpkYyrs=;
 b=pML5cLShrD5fhZe37+M+EXgKcdMxrmZ5NUZPtJcWqOK6rYYeqV8+pgscoBFXuheCEg
 ZHZJpYFyMYaty1SFDxZ0IpSmUBhTB+lxPeZPWPekShAKLqsbJmi12ge5YYnRrWN3r0l0
 7Z5C7Bqmodin4U0npQ2e/y9FgZMFHN2O3DkWCd42CG9BNf2bdG/VQdZG1AVWdSRExvyr
 C4g/kpwGOXasxAifGFvKk/A7DXg8wgmcLbBJ4Rn2YFjp7BeKlRfTjllsEtHVznrHr0uR
 jTpHqDce7qNmO7RRxZAOzBjCcx6dTq0caqLS7iEnKCW5DsEIelfc9Xks4MD5mToOD3y6
 Sd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749200694; x=1749805494;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u22QGRwwJcexG344pLAuyEqJQtDbVkBJOvRPUpkYyrs=;
 b=dEKDG+QatjWejjmHaUha4/oCMC8bSRMZGJuz5LRPQCXMk6mqdGwt8ChQBX0cbDu2Px
 /sqQ5doe2uec2l1EUhM4xf85LC1yEfbytRYJpQy8xEsMViACwsxeQpdmSUug5JyYvsI3
 E2bjyleADb6gv6/J3kl8HwvlXKPaja74fCWaY0SBEhTNVKPB5cyFo9xwwXHui55Z5IOM
 M3GKHqwtoc2KWLe5jn1cPCNba257IpuaE5uPOBgl1M+ASkSxaj1YN4Jd4Co+Mt6Ut76O
 xXMN7PdY0N5M4lfytM32wOVT+Pz4USv+fd/SIlbGwmDY2gO7RzCXENZnrjLW1WobYMot
 GwZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3EGQ76I7MOQ/RRMfwzntxMTbPq+M51ihwPhqgNVIL9GJAGSwyjVADs4YkDgVKxZhY6rYyLbpncp4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF3zCtljn/ElR4+tDsgZ0tcEGaBoz5jGpD1FupPkI+IkGqhyuV
 zUss0DgUBy84qgEsO4Nd/BHJxqioppAsVPaxfF+4Obe0M9nPnQxQbfHwlsRNJ2lOZ+c=
X-Gm-Gg: ASbGncs0y+fhD8OSq2xPTJDNSMfzjwmxknnDDD7CNuGwfc5co4Am2qk34LFj2tcTNU/
 ua8H4w6QbhpFYtQASMXZoc3WZs6++akEk4zH3D6Zfmdl+r7qLlWHTxZXo6EJVGwqtlvYCPX2vOO
 5ks/H3AKhC23jMlpOK7KfoA0e0P6pOiF0Oahgc8gsnI7n4qx9/GNHC3qO4AVg/MW5zPFY1+g1Go
 Ua7Zd9KZmaoswZ5h1S8Ia3B6V3qKVwWT3pZqIzkeKlytseInCggb3L7kHmt2MR8EPMy+Fhnne0b
 VQAgbqBzmmm1nmpJcNTC+pMpl6v7G47waj/sUOEYzf9Phn96/xUk0+Su
X-Google-Smtp-Source: AGHT+IGH8f3CnE94XpqqdfYVCG9k/7hxNJbSdjv+c/qZQ3TVj4IPHFuU+kXHjf6bXNo01qdvKdGN4w==
X-Received: by 2002:a05:600c:871a:b0:442:cab1:e092 with SMTP id
 5b1f17b1804b1-4520135f5cemr25871865e9.11.1749200693818; 
 Fri, 06 Jun 2025 02:04:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45203e6e424sm17461325e9.0.2025.06.06.02.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 02:04:53 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:04:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Frederic Weisbecker <frederic@kernel.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/selftests: Fix error pointer vs NULL in
 __mock_request_alloc()
Message-ID: <aEKvMfJ63V7i-6xU@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The __mock_request_alloc() implements the smoketest->request_alloc()
function pointer.  It's called from __igt_breadcrumbs_smoketest().
It's supposed to return error pointers, and returning NULL will lead to
a NULL pointer dereference.

Fixes: 52c0fdb25c7c ("drm/i915: Replace global breadcrumbs with per-context interrupt tracking")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/i915/selftests/i915_request.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 88870844b5bd..e349244a5fba 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -290,7 +290,12 @@ struct smoketest {
 static struct i915_request *
 __mock_request_alloc(struct intel_context *ce)
 {
-	return mock_request(ce, 0);
+	struct i915_request *rq;
+
+	rq = mock_request(ce, 0);
+	if (!rq)
+		return ERR_PTR(-ENOMEM);
+	return rq;
 }
 
 static struct i915_request *
-- 
2.47.2

