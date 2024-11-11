Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5629C3A68
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 10:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A9F10E43B;
	Mon, 11 Nov 2024 09:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LERJ32NG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C25A10E43B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 09:06:16 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a9a850270e2so799716466b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 01:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731315974; x=1731920774; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=apRs0DAdhKBkD9Qp2XtvGYAHxYv4VCBNiG5LEbw4AZU=;
 b=LERJ32NG2dbYAzoShAIZBcFBEquTt8/aCiTQsa5fKETrH2b6HlgnMKE5WwZABuZ9me
 qHbJvSEwiWbVW6XD/Qo/gbo4sfNPREKrRBj6rqz1x/jMquXo+af1LM2X+G6PPeoI7VGK
 aUXHsmROH06FsZMOT+gjn3mA42QYzOQ+r8jbTderR757ZIYETRpegqeH9b3NtT3JXHpH
 6mwwrp7gb3ZkI8dJJB8bTO1D9Gei0a5Ohn8FqVlswJpDUuR6nsQqDjVCjzCDdePQbcbM
 u2FVHVpYKiLTi1y/oa1hp1uqQHa5SKhI5Rn+wyBtDhWewU1OlrpblaJCMeoyurxMXOFE
 /fyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731315974; x=1731920774;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=apRs0DAdhKBkD9Qp2XtvGYAHxYv4VCBNiG5LEbw4AZU=;
 b=ZTSawRN1ZUCOq8ifa2G+1rDyJ5TtNx9+VUtZcIDOxqV/7SXzAm+AXficZc0TMeAyyv
 WqowEEXYEMNMPRKVCXbNFUo0DbMm3KLVLV8IQNBund3OHQ34NXqJ4pSIoN5pYcmRsALH
 UO2XgkO/4GmejN+IXGa6pxt5L+Gj9ocyWlqZWZpq2pvAngC2QUaYYiG9oeFxktclGz2c
 T1C/UbYbIfCaqOJ7YwBIqrnFD4uXKVHiSdgZoWW+P35sDMy06Ex5xsrljD73mECv0xLJ
 EGUenGaTrlL+Pjw51Wz0iapvZKmIkNfmyAV/ZfKI5uNZQWdsmySKiOQLL5t4217qjyxM
 3bLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhmiOQY0t1Va/FvFDtY/Q0TxSml9cZrhEiKSFpSFs9OA0PH6NNfqkDM9AdVqnnc3V80hAf/k9SHBk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJIGisi1TiXjAgu4J4cj9qGUUAbUdmGH1I+XDou6pPP+zAlC8y
 b7mPTpv9a24U5+l/R5NQNASkQIWgv80fpA51xP3ntokUVVWw3zRyxDjPyx9QfhE=
X-Google-Smtp-Source: AGHT+IG01DvV4fVYHey4p2gLJdP8gIwgetBzZShx8jJbLbuJv9DbED9jmrm294gcWaav324B9xGGuw==
X-Received: by 2002:a17:907:c15:b0:a99:8a0e:8710 with SMTP id
 a640c23a62f3a-a9eefee6682mr1056624666b.14.1731315974411; 
 Mon, 11 Nov 2024 01:06:14 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4b82csm579023566b.67.2024.11.11.01.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 01:06:14 -0800 (PST)
Date: Mon, 11 Nov 2024 12:06:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm: zynqmp_dp: Unlock on error in
 zynqmp_dp_bridge_atomic_enable()
Message-ID: <b4042bd9-c943-4738-a2e1-8647259137c6@stanley.mountain>
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

We added some locking to this function, but accidentally forgot to unlock
if zynqmp_dp_mode_configure() failed.  Use a guard lock to fix it.

Fixes: a7d5eeaa57d7 ("drm: zynqmp_dp: Add locking")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 25c5dc61ee88..0bea908b281e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1537,7 +1537,7 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	pm_runtime_get_sync(dp->dev);
 
-	mutex_lock(&dp->lock);
+	guard(mutex)(&dp->lock);
 	zynqmp_dp_disp_enable(dp, old_bridge_state);
 
 	/*
@@ -1598,7 +1598,6 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	zynqmp_dp_write(dp, ZYNQMP_DP_SOFTWARE_RESET,
 			ZYNQMP_DP_SOFTWARE_RESET_ALL);
 	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 1);
-	mutex_unlock(&dp->lock);
 }
 
 static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
-- 
2.45.2

