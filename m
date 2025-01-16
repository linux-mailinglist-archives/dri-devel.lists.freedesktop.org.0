Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339FAA14B69
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 09:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D54010EAA3;
	Fri, 17 Jan 2025 08:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bF2rdaqw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF8C10E227;
 Thu, 16 Jan 2025 19:37:02 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2164b662090so24851505ad.1; 
 Thu, 16 Jan 2025 11:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737056162; x=1737660962; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G4wAbBZBj0+zOetxiX42LWCqugc0wnUTNgzvXQ7kF3w=;
 b=bF2rdaqwXApmso2K1kCe2FQYaaq8aYDzydZvhAfZO7Xn4nMF0orxxsTHqCb9ix6KHy
 GQeh/jCBYi3VoaJZzcBoISTfSIRVUpSqWpXZfgL16q1gKGkLGGa0JVibRUGxRpRpVgJX
 MBC+GFB8RVL7qkx/pdSEzrjUkS3Iiw/H5dM3FJbEL0w8rtRcu/o/HrsBcRmeScxv+7JP
 YD4dtJyoXwPRK2MhvV62j5iGhfR0dF2ktObmHTxm25AWjsw7CXVHX3AVhvv0AXd0mpJf
 8qJe/0VzAnZsM40ComrXA5GeYhGxkfb2MTGMl+GsGmzeS+uXfcLm4uKuICXx3oS2iND+
 yaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737056162; x=1737660962;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G4wAbBZBj0+zOetxiX42LWCqugc0wnUTNgzvXQ7kF3w=;
 b=N3pbxZ016PWFO088EnyuZwTPuZzmlRwg5aOPBc+iLI+HZ2Q5azcK8q68fRxgP9DbKA
 pP61AztoCYX+6zrI0xEwkzJ6Qx8/bptJgP3CKiZQkaZSBROXscdToX/P/P6Ov5am5AMZ
 yd2Lxq9oQf699jajKf82zApO/MnJTJWz5g+Mx+CVSe3wzY8D3bvFDPaJBRR6Cvahxazs
 sB4hxJJA0YPcC7RywJxw8uh/OC3z7GqSp/J5YAmZrVjUdsM7XP+c+KGiewf+3eEpE9Xk
 Ud6DBzOY4IRGZIxhNPIT7SqUt4348xLjVGJqdhzgTRjKwsjruB12KvUV4P74RKuUFQUN
 jdWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+lgh75NAQuwBqRSI7nH6SAGhQPRPPva/qu1xFu9MQz077ZRh9uPD5bGq1hLZES5/Exos1Mlcqnbg=@lists.freedesktop.org,
 AJvYcCWuv1R63tqElhhSzX6wXY1et5L9gd5T/MVFz/qHGWJQi/h6l4P2ydTkfX54uz4qBBmPjRLnWrpCOBHn@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnjZD2hCgXfy7S+DwF8xrimyv3riKPegsHw5d+EBKoh4607hQ8
 53cKggg65qKqzgeZ00zvk7AZUPgq4qM5X2V80P9R4EZ+7OtscNfS
X-Gm-Gg: ASbGncv+vyhbZJooYad9aVklHBwxfMU4WgtEKQWiMUijrqtwi3l8iIFFlVycwIQs/Oi
 O6cIXdCJbl1MO8wF0dZjBHadHcJDcjvzGfYV6CcGNpn45p67IS9PdgBHr5NvZ6RarlABAniqAtZ
 Oe6NtvPgy6LsVjWPj3aB49EjH8qsYQIQxFRYPlBvWb4U6WUNQp0wlIxtnD8pXpHxWZCjtgsiY1n
 IpXCbc0QzAGW0B95+xYS92H2qR+YB/kwuiVf1w5q9Ev+3VOyeSTLw==
X-Google-Smtp-Source: AGHT+IHOks7Ljvfrn/txdOGnk7iIRaBRwVXW8ePCTztJtOA5ASCttWU7RdhY4xhczGSz52UqQcsNDw==
X-Received: by 2002:a17:90b:248b:b0:2f6:dcc9:38e0 with SMTP id
 98e67ed59e1d1-2f6dcc93935mr33225257a91.0.1737056162343; 
 Thu, 16 Jan 2025 11:36:02 -0800 (PST)
Received: from s2lab02.. ([114.70.9.226]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f72c1511b2sm3993897a91.3.2025.01.16.11.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 11:36:02 -0800 (PST)
From: Ingyu Jang <ingyujang25@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Ingyu Jang <ingyujang25@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/gt: Handle INTEL_WAKEREF_DEF return value in
 gen8_ggtt_bind_get_ce
Date: Fri, 17 Jan 2025 04:35:28 +0900
Message-Id: <20250116193528.2297487-1-ingyujang25@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 17 Jan 2025 08:46:14 +0000
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

The function 'gen8_ggtt_bind_get_ce' previously did not handle the case
where 'intel_gt_pm_get_if_awake()' returns 'INTEL_WAKEREF_DEF'.
This value is returned when the 'intel_ref_tracker_alloc()' call within
'intel_gt_pm_get_if_awake()' fails to allocate due
to memory pressure or other constraints.

'intel_ref_tracker_alloc()' uses 'ref_tracker_alloc()' with the
'GFP_NOWAIT' flag, which can return 'NULL' if allocation fails.
In this case, the function explicitly returns 'INTEL_WAKEREF_DEF'.

This patch adds a check for 'INTEL_WAKEREF_DEF' in
'gen8_ggtt_bind_get_ce' to ensure that such errors are properly handled.
If 'INTEL_WAKEREF_DEF' is returned, the function returns 'NULL' .

Signed-off-by: Ingyu Jang <ingyujang25@gmail.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index d60a6ca0cae5..8d22d8f2243d 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -311,7 +311,7 @@ static struct intel_context *gen8_ggtt_bind_get_ce(struct i915_ggtt *ggtt, intel
 	 * doing rpm_resume().
 	 */
 	*wakeref = intel_gt_pm_get_if_awake(gt);
-	if (!*wakeref)
+	if (!*wakeref || *wakeref == INTEL_WAKEREF_DEF)
 		return NULL;
 
 	intel_engine_pm_get(ce->engine);
-- 
2.34.1

