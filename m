Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8842B0D34
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C5D6E3C4;
	Thu, 12 Nov 2020 19:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 858B86E3AE
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:24 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c9so6181808wml.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3dpuU5BsT173A/3X/IKJ/RVPURrpJEnyWKPfCisq40U=;
 b=P90TJGWFxXWKZTP2scYCOfsqY/wKKa1+4kmWdDdolBtQxz0OR7Cfzjww0kbTQK2sc0
 i/KmQ4x3Jjf7hxdCJ3q13Y20iRA6ny8Q7mDh56qfaOxSaJFUWgbO9uJAj+S0XyphglZy
 DdBOPZhizxJ8aLSKYE3zJRVnQd0q5UsQOsgDhBkLImip3LKE+ulUHyhF1doGJLW+fmh9
 4vf8a14EaZ+W7Z4+Ja0XXbTq+ZEz/kqs3jO/mDp1S8LdLLfmUsCh64+05tmYXC8HtGZZ
 6MRCTA/pKLDAP9iWxdL03koe+A1DgD9h1sogY76kYlQkXW6oh1ZXKG0kHiw75wamAA0f
 xpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3dpuU5BsT173A/3X/IKJ/RVPURrpJEnyWKPfCisq40U=;
 b=KPc+2GKa1qWwpC97e16TgHUhcnI06G5ZzoA9vD5ODOIbBbgvsxolKHkUU6DcrREkgY
 tJKJShmTHa8QAdTKloyhk45GvvvolQQC2wsG+24z0bllgmn90GSIoop2MKlbC78wvoxf
 tDEsAFddFaDwliATE+uJes+0+6w+G56Q0m0bKeDmjQq1TTR+r/d90Mq5/RgEmjbHvDj+
 TUsbgMj8P5gTT/kFTGtXMdPqNmJf7FuoI3Re+4l7pg5+ZuTLhwOqsbDRk+MQ+59QGVO4
 aOkYbnusx8JRVyb2VCh6+xhrbBhsNu6YC7cseec7qBxtQgWZw59eZYi82WPMtdpaU6AI
 rhmw==
X-Gm-Message-State: AOAM531ijNJjLytTN4iB3/quvRb8S6WDdbzTdZdOdN5ICpMHYE/ByL4X
 9kbXobjzuGtsLc44vbvmYGntmw==
X-Google-Smtp-Source: ABdhPJxyTyXOcBnokU+FKrwvxeEWpZyZ9iz/opvwSBv4Gzg0U520Kpk6FVNjh+PeLg1jlpD6FHvNxg==
X-Received: by 2002:a7b:cc84:: with SMTP id p4mr1108394wma.86.1605207681995;
 Thu, 12 Nov 2020 11:01:21 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 18/30] drm/vc4/vc4_v3d: Demote non-conformant kernel-doc
 headers
Date: Thu, 12 Nov 2020 19:00:27 +0000
Message-Id: <20201112190039.2785914-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vc4/vc4_v3d.c:131: warning: Function parameter or member 'vc4' not described in 'vc4_v3d_pm_get'
 drivers/gpu/drm/vc4/vc4_v3d.c:231: warning: Function parameter or member 'vc4' not described in 'bin_bo_alloc'

Cc: Eric Anholt <eric@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vc4/vc4_v3d.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 65d0dac69b0bc..73d63d72575b0 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -122,7 +122,7 @@ static int vc4_v3d_debugfs_ident(struct seq_file *m, void *unused)
 	return 0;
 }
 
-/**
+/*
  * Wraps pm_runtime_get_sync() in a refcount, so that we can reliably
  * get the pm_runtime refcount to 0 in vc4_reset().
  */
@@ -205,7 +205,7 @@ int vc4_v3d_get_bin_slot(struct vc4_dev *vc4)
 	return -ENOMEM;
 }
 
-/**
+/*
  * bin_bo_alloc() - allocates the memory that will be used for
  * tile binning.
  *
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
