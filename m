Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A5B9EE36F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 10:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6A010E202;
	Thu, 12 Dec 2024 09:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hTurWQ+j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B48410E202
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 09:51:01 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-aa689a37dd4so67479066b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 01:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733997059; x=1734601859; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2Lqlqa+yVzadnVCts+R28x1v55t3TnviPyK2Uw1lPbw=;
 b=hTurWQ+jOZaflhYQMMc1e2ZxWBrVt3kQJlTIlep5p38A95S2x7aR8eNsUbc5ck8Tje
 srlSubhoK1iF4xr/SmY9ix1UuBbny7p7VlaE8BeoCrzT/u9CKvMPKUUb/JnSbesgYth/
 44KmvOLfr+6HhjVhYun70aEX08JOM+EbbM8Y5Qd8v679eBJGQvmiwt3SR60+HtGgzTbq
 7MXn3V0tizM4vChO20Zh4o7UPvRl9u/rFe2XP54aVHw/rGIIJPlp+Vr947CnhBEkn/Fq
 IkWxFBNMRLpe3B3KL1ZAqlxNd2aCUwT5JZpG7HVeCyYGk9hM/rVRRpEfUCe2nk7rKsyW
 MbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733997059; x=1734601859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Lqlqa+yVzadnVCts+R28x1v55t3TnviPyK2Uw1lPbw=;
 b=eTWLWjR7qsfrRJhjPLiEiDE3ALBevN8D1lU9m7NC15xhXrMNbfd+ti14jRdnrBSVAi
 rvB1rjPmS2WS04He9uLfP3+ihgGTtrX9c7/CmREnKS0JVPjinwFG0JlGST9hqhezcH72
 UKiM8Pg1Rj7jOD/OCPEjHvhdVFchGp36EJayI4Ja9rNrJWI4krvkZNClESwGgDMflRwU
 8JY27ohUBl10pWLs46/uozC6golJ0M7XhW5qugPn2J7lVFDCMNZS9JklNtcWEKcFPoqx
 vMvZGkYjmsD49gblTI6c9oejal+esqCqA6JKGf9tZGKxR2tWyU7qlGdQaO11p/Vn6UhD
 uVjg==
X-Gm-Message-State: AOJu0Yy0xVqRJODXgHB+cZjsHKI62oKGy2Fx6QmB7TWt3ajRgXcnDLgL
 clnuToEkXVTcn+/Imc3/M6WJA10r8I7X6P6Zs6t4ULjph8eUFCnx
X-Gm-Gg: ASbGncv/RrUdYMYMJfcZ6pJsvfQfhlEKldLyb0QSz/DWioZIF09wYiR6evFPA7Z2Rnq
 6efsikQhmCFkzcDMHXia/oGLtfgWIaqcuJK7h3Jm6ZxA+PE3npDvCjb1CEUDcHBoFDSUkB68jaL
 5ihH2ezO3qEQMUYg/z5nWRhjoQYirhZRwxTXRkT1rw/89jbsb3qB1V04OEFDN3vzin9yg9joGcr
 5oXMVmek/ZtFl92pquwHGnmMmGKnkZ6m4YQvkx2j1aoiE7tQJHWsaUPm0Yymc4zxEg=
X-Google-Smtp-Source: AGHT+IHIXf2ITezkzRXYqhyRdc3NGo7nV9HtTD9QcXe0iHTpQ2fk4AxkW5PqBr9zOQsKQHtffVHoOg==
X-Received: by 2002:a17:906:18b1:b0:aa6:8676:3b3d with SMTP id
 a640c23a62f3a-aa6b11df74bmr563324966b.29.1733997059330; 
 Thu, 12 Dec 2024 01:50:59 -0800 (PST)
Received: from localhost.localdomain ([83.168.79.145])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6701b08c2sm714818766b.124.2024.12.12.01.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 01:50:58 -0800 (PST)
From: Karol Przybylski <karprzy7@gmail.com>
To: karprzy7@gmail.com, laurent.pinchart@ideasonboard.com,
 tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, michal.simek@amd.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCHv2] drm: zynqmp_dp: Fix integer overflow in zynqmp_dp_rate_get()
Date: Thu, 12 Dec 2024 10:50:57 +0100
Message-Id: <20241212095057.1015146-1-karprzy7@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This patch fixes a potential integer overflow in the zynqmp_dp_rate_get()

The issue comes up when the expression
drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000 is evaluated using 32-bit
Now the constant is a compatible 64-bit type.

Resolves coverity issues: CID 1636340 and CID 1635811

Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
Fixes: 28edaacb821c6 ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 25c5dc61e..56a261a40 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -2190,7 +2190,7 @@ static int zynqmp_dp_rate_get(void *data, u64 *val)
 	struct zynqmp_dp *dp = data;
 
 	mutex_lock(&dp->lock);
-	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000;
+	*val = drm_dp_bw_code_to_link_rate(dp->test.bw_code) * 10000ULL;
 	mutex_unlock(&dp->lock);
 	return 0;
 }
-- 
2.34.1

