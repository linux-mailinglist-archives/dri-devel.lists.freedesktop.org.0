Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91109DAF4B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 23:47:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC0510EBF5;
	Wed, 27 Nov 2024 22:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hqKk7Ks6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CF910E1A1;
 Wed, 27 Nov 2024 20:10:47 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4668486df76so1324581cf.3; 
 Wed, 27 Nov 2024 12:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732738246; x=1733343046; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mblefla9njkVPYJmF7+4lumH+f/65iphlvMfUcC2UiM=;
 b=hqKk7Ks6oU1kQQVsyn7OnEFcSGa1QbUI61zAoIusLOjBbHx7Z+EOtF7fW9xkH9DR9G
 KMY/K/CFuuvTAjWS/BJHoWlldBd8HY88eLFPIIXPqxv1+hs14bwbXU+WCgxYp9roso3m
 T8WJIMLq/WGSSENEzR7YhSqvgUUCva40gv+hp1nGCMV8PcbH1InCt9ci9kMM2Szu0HJv
 qu4enUT2VEvOv9BA+JBeIw9cc1Dt8zeYxjs9IIzbi9uB5tI0cEMvjJsnJ+umsFwT5Pzt
 5cQEU69d3jza60nRSpTihq4uIXPaPxn7cHQ7Vytsq9qQBE82OZZO8gGMmj9Wcnmi8AWx
 lSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732738246; x=1733343046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mblefla9njkVPYJmF7+4lumH+f/65iphlvMfUcC2UiM=;
 b=pfVNZWHLcCzAiU6Ln81piKvNTvsBxFiAI3fI0QbyFNV7pelhFl6M0jNxyEyURHmyvb
 pQACe/H0XtnEU7hJHSoLyIe9GZiFfFe0AGf1+fBKj3OxwZ8fxipvkc+PMVQZ6R85D18K
 yv4snQjdkrUIpmRpGBo9Sq2NgEIPrwZJTkxQJ8jNyi91RhVEST8pqWKPVcpN1tlcEk7V
 +9IHFEDkaNZcMkjTTDXGq/oYLchz92Jp7NIwu3hw9QLrb6q7mUqsH12mKJq0DmHZnJO/
 BFxkgcQpquTyuMbb7WnHweNQMYiEQ+3VDd5P31N2idKmxULK020Pkx7i5OOMyV1qEkrA
 3fXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs9dwtbbXLHTP6OXRf8cWtLa/kZMFydgy2ZzP9Tc1pUBIrodRZH7Mtw9SjR8njibBlKYIhq4vybWg=@lists.freedesktop.org,
 AJvYcCXN8Uj1QTaAMZ1yO2fQ5rQYUULqLgxbdViV785g9A3/Y6mOtUqt5m0/dlU2o6ib2gZPlrjQjfowGi+k@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx61mF8/q3tXREjZYpCpvRAg9D9cIO8GbM7YD5WIGwzKzsSz2iF
 akEuQ/N5ibkPwLFPbuJLl7ZEzP57kEywERCTKxHJCEZym8G2MXE5
X-Gm-Gg: ASbGncuVKkXu+XxfkE1XSKnkZ8LYPrYjvWrBmftkbNiFfIhlX3qqHM7r03Abob00XoW
 rUQR+hA7oajVwcvRZ466UX4vcAV6/Nj0xY9uFe4sY6QYA1sxodXkHxbEiLgiOmGisMbzdC70QNN
 VgrUjTBwmsMoZyr2ciB1QfBF9tYEoyCmlK9Izc5CALXGXiVq94vs/l7vxZD2FET1Al7zDPKvZTW
 R3Y01mRLpdn7rur7dFv17sxbOeCkleGPcCre8Bz+bMnky2feJ2uDZ7cC8aety1ZT0NMspVC
X-Google-Smtp-Source: AGHT+IGXO3DPEwrzdtMEulE3VhY7JlQ+MgBKS5s1oo9cMdxXkiSfRsPCWUfk8wMsJreCYQsvHzy5tQ==
X-Received: by 2002:ac8:5987:0:b0:461:9d9:15c2 with SMTP id
 d75a77b69052e-466b3554a2amr73534731cf.1.1732738246079; 
 Wed, 27 Nov 2024 12:10:46 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b679c8d982sm138536285a.14.2024.11.27.12.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 12:10:45 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: nirmoy.das@linux.intel.com
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, chris@chris-wilson.co.uk, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@outlook.com>, stable@vger.kernel.org,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH RESEND v2] drm/i915: Fix memory leak by correcting cache
 object name in error handler
Date: Wed, 27 Nov 2024 20:10:42 +0000
Message-Id: <20241127201042.29620-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 27 Nov 2024 22:47:27 +0000
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

From: Jiasheng Jiang <jiashengjiangcool@outlook.com>

Replace "slab_priorities" with "slab_dependencies" in the error handler
to avoid memory leak.

Fixes: 32eb6bcfdda9 ("drm/i915: Make request allocation caches global")
Cc: <stable@vger.kernel.org> # v5.2+
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@outlook.com>
---
Changelog:

v1 -> v2:

1. Alter the subject.
---
 drivers/gpu/drm/i915/i915_scheduler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_scheduler.c b/drivers/gpu/drm/i915/i915_scheduler.c
index 762127dd56c5..70a854557e6e 100644
--- a/drivers/gpu/drm/i915/i915_scheduler.c
+++ b/drivers/gpu/drm/i915/i915_scheduler.c
@@ -506,6 +506,6 @@ int __init i915_scheduler_module_init(void)
 	return 0;
 
 err_priorities:
-	kmem_cache_destroy(slab_priorities);
+	kmem_cache_destroy(slab_dependencies);
 	return -ENOMEM;
 }
-- 
2.25.1

