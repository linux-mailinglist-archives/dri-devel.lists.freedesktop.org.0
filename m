Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0713680B75C
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 00:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F50D10E0E4;
	Sat,  9 Dec 2023 23:05:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4CB10E0E4;
 Sat,  9 Dec 2023 23:05:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33338c47134so3082954f8f.1; 
 Sat, 09 Dec 2023 15:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702163143; x=1702767943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=duSDdrXx/MdhBGHNkwvfOFuexJ4Lp5LgT0yaxlsN+gg=;
 b=M8m0GDhGzcc1fZ90LdqEMGJUeoub/feMvyLqctXsWgoA6yaHcHaU+vy3KLPzMwF3ua
 vntjTxaNmRZ7g2YaWw6FrhQEsoWzO7lQ7SQrhDbUtEb3F7lnQeZLHslNUeDezaksEQXm
 C4hOQAyGl9NTErRmLjhzic/M7XXDqhEa1eBnCY+XSFD41Sl5b+l+OXFMtju0ikfXtLYl
 EPTLedCMZi+KTKFknL5m32ZN+A9v3gA01cMKc/C09/+9YSF4kUyiYNKQaJgiXFdMcCWO
 kgJBic+MSe4eb+znTufuoSe1GBh24NcBEZon56gd9F/cuCfOyT/12viEcDrQibcWSEDh
 WADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702163143; x=1702767943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=duSDdrXx/MdhBGHNkwvfOFuexJ4Lp5LgT0yaxlsN+gg=;
 b=MQ/KdF6yfS1pjz+rX6QcWFmywu7m++Xc1cFT76mPyCO7gEi+xGVgaG8z/xyLR5YLKA
 ToH8/oATxHapUNKIcvSRh4VxY7tnozGbe4wPU2FHgNW9G1gJUHT4OoyL4aCvtjIvXhd6
 wmAqMqrRmlDAIK+h7dFZnK8q+e2PvYZDCqDmSfUWvCXiFx9qJWNbTd8MJxVYiDkLoEj5
 eAHv8YwzsFVgkOXCWCitP+eD5ORqBWPsPya9+cJY+KytaV1TfIJocm0/se16LA7VTkco
 4lnFCknu7Uio8wUvvPKQ0RbRAg/17lmyBsv5RhsMDeagQ3Gv5zUp6Gm9rk+L6piUmsey
 uYsQ==
X-Gm-Message-State: AOJu0Yx52wmYtBB9IyJ7aXZdfxnjbiYBOMazKWOq4sxBzQ9XprCAtht8
 KGXswCpik5VII8H+1CqPsVs=
X-Google-Smtp-Source: AGHT+IH8a4E5LwfBo47ptLRB1AvoIqmDkcI8a0+kqSSKA8Oi9xC6xo+U9mqjIOpVPgmdOvHFGVKh7A==
X-Received: by 2002:a5d:5301:0:b0:333:2fd2:6f5b with SMTP id
 e1-20020a5d5301000000b003332fd26f5bmr969350wrv.101.1702163142765; 
 Sat, 09 Dec 2023 15:05:42 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 w14-20020a5d608e000000b003333c2c313bsm5171210wrt.100.2023.12.09.15.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 15:05:42 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH][next] drm/i915/selftests: Fix spelling mistake "initialiased"
 -> "initialised"
Date: Sat,  9 Dec 2023 23:05:41 +0000
Message-Id: <20231209230541.4055786-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in a pr_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index e57f9390076c..d684a70f2c04 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -504,7 +504,7 @@ static int igt_dmabuf_export_vmap(void *arg)
 	}
 
 	if (memchr_inv(ptr, 0, dmabuf->size)) {
-		pr_err("Exported object not initialiased to zero!\n");
+		pr_err("Exported object not initialised to zero!\n");
 		err = -EINVAL;
 		goto out;
 	}
-- 
2.39.2

