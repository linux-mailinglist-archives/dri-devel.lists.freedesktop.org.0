Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9C833A97A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 02:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FC789BBE;
	Mon, 15 Mar 2021 01:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5E289BBE;
 Mon, 15 Mar 2021 01:58:05 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id t4so30327914qkp.1;
 Sun, 14 Mar 2021 18:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEq1nIOHRCQkXvtkmDo9v/3Ggs6bIqM/j9NOZW0701k=;
 b=QyGrYx8/LpnaR1V4o6lf3/SZcBVHP++EDzVR3Owqy/86npDEO/9bcpH8DZDb2M2c5+
 4hGA2rQGZ2fNGXV80UJ/iDPjwG78p/eAZ4RDposli0S0n4GXjrXaTJxUC3fMfgojHA1+
 iw41PR9FgXLTsd1vcOVREj2+6NAJVBTE4lRnuscv78bIVx/ph4uDKR312SkcaVE4FThG
 t6pdov9/6GCTPePScJ3rKiXa9d2mWuHl83+g4aRB3BxmEbchtnAiA6cTKdagc861o1ZF
 7jNAtgsGk+4blGLPqDIUYdLNVnKgJCmSNqwjaUEMQnS552yx3mOf4QdzFFl6dpiZvI3I
 D49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aEq1nIOHRCQkXvtkmDo9v/3Ggs6bIqM/j9NOZW0701k=;
 b=ZyHz0WauWPEk2aD397pzEu3D8HsgJWF8I2N0DR8x/84B87XErboZ1zxPHOY5RZ2u1q
 jHdLCQQS2UUfBSlhBhuMl8Dv8jgQAgRm41acX00Dr+GJ9M/kzdiD2XWqpbAIhcfooiCT
 /jJy3J+psdojgOXyySTD7tMhkDpCUEcB9TlPoqphT9dxYRPd0T20HhSJZOlom0GRsE/y
 u52W7q5MlLDPe/5teQeRNXJsP9dW4VGbCTUuYe09lbJPyGLTS6ZXtVj1HljkJk2pleKZ
 zTNs2IQ6QzbHzjfCBXGLRXIsUVsCkDV0jA1v6Cxh3CtnG73TxyZvtQk2ZI4Mt2E72jB8
 mHuw==
X-Gm-Message-State: AOAM531u9DuhYOByW73ELzfIgi6OvBJjQs1eAdFr6EGesY6CC+fnzKNg
 8JQAcWbuzUZ1cp4kusWHyHI=
X-Google-Smtp-Source: ABdhPJwg7PZYKtG8jV8HRZA19cx6JKKvFePrWIHclNm9sk2Y4WwBnAcQWYCGIPYUcI/wfugFhPt8WQ==
X-Received: by 2002:a05:620a:1645:: with SMTP id
 c5mr22321100qko.63.1615773485066; 
 Sun, 14 Mar 2021 18:58:05 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.69])
 by smtp.gmail.com with ESMTPSA id v35sm7516936qtd.56.2021.03.14.18.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 18:58:04 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, evan.quan@amd.com, nirmoy.das@amd.com,
 kevin1.wang@amd.com, Hawking.Zhang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: drm: amd: pm:  Mundane typo fix in the file amdgpu_pm.c
Date: Mon, 15 Mar 2021 07:27:48 +0530
Message-Id: <20210315015748.1380807-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/maxmum/maximum/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 7b6ef05a1d35..7af74d236600 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -3143,7 +3143,7 @@ static ssize_t amdgpu_hwmon_show_mclk_label(struct device *dev,
  *
  * - fan1_min: an minimum value Unit: revolution/min (RPM)
  *
- * - fan1_max: an maxmum value Unit: revolution/max (RPM)
+ * - fan1_max: an maximum value Unit: revolution/max (RPM)
  *
  * - fan1_input: fan speed in RPM
  *
--
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
