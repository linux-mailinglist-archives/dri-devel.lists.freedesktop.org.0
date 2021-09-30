Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2982241D11D
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 03:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B906EB2F;
	Thu, 30 Sep 2021 01:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C716EB1A;
 Thu, 30 Sep 2021 01:44:41 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id s20so5582102ioa.4;
 Wed, 29 Sep 2021 18:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sSTf0Q/LqQFqSVoi1ntGqPxKXQXY5qANDX1ffBRmmsM=;
 b=c4yT+CLntdEApsVzbtbC2+/1txS45LvbG1+GK/cWy2fNCvoCC4B0CTAFHPHYDHRYhj
 Hk2OK4IewfhhhcHz9StQFwVs6WHxBLxuGNj6DlEVW7Vif2P9zxVJyevS21QuLkPkJ+LQ
 CqQ/ml4bq50TCEJFB/FHPU0VLXB4qauHEEmO8ET8wZ+4uUEYYDDtaBR34KF0hnrFR9zD
 SNspkOC9Y7zm6lvKkxGWHW80ptraXCWySWRTwM+NBaM2SEzO9e7rwuRo6ZlT7R1wvN8J
 Sfp/ZbOdowH2EROCSxA3sIwoWklYZApgw97r9Q5HpkWBM/QD9VOhvPIqJSVVR1u0/sGa
 pzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sSTf0Q/LqQFqSVoi1ntGqPxKXQXY5qANDX1ffBRmmsM=;
 b=fCgJrFvnWE5rg03iuW6R9ngprM2tzWxbuxv+VFI92DJxK/7UBYZ5ftVvTuxCwyswOS
 T53iVizjCqdnEGveWzc2fpJIJ5JAbN09IyBHPaxd7InjYx0Qz+JOkZdlQJ53aGcM8NNd
 pNw7vrZfw/DuAOqERLHnLOYxrOIBrfCOGWZ6rS4r+8/NC/mGuJ6TGJdqmhcxqWNKIDpH
 R+MJmiYEOSi8Nz25Mgr+HyLNcTQ6NKl7S3gmSkNrvzPuuIsjvMG5+8r6sQ3a+STYdszU
 hl6bc8zMywAP3gka9jXM3qNC/cJt5Owo5DUgs/Sgm+iOLkTF0akVS3IbfNRB9o7oFuvD
 2Obw==
X-Gm-Message-State: AOAM531D2Ca+VyzdsWSaZmCAjSnkRhM9wupV8x0d+NFhBtIQsc4C4Luq
 IaVOK2TThm+s6zI2VK9XFbl7EWSaBFs=
X-Google-Smtp-Source: ABdhPJxGKBw3SidegsW+vS8vep9U/RF9MmSFOlfQ5DQkw9xbqbqeKT+6Op3uwvvnvmkXmfUo9xSTBw==
X-Received: by 2002:a02:964c:: with SMTP id c70mr2457000jai.85.1632966280278; 
 Wed, 29 Sep 2021 18:44:40 -0700 (PDT)
Received: from samwise.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id h23sm1155414ila.32.2021.09.29.18.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 18:44:39 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 1/4] drm: fix doc grammar error
Date: Wed, 29 Sep 2021 19:44:24 -0600
Message-Id: <20210930014427.14239-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930014427.14239-1-jim.cromie@gmail.com>
References: <20210930014427.14239-1-jim.cromie@gmail.com>
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

no code changes, good for rc

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 0cd95953cdf5..4b29261c4537 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -486,7 +486,7 @@ void *__devm_drm_dev_alloc(struct device *parent,
  * @type: the type of the struct which contains struct &drm_device
  * @member: the name of the &drm_device within @type.
  *
- * This allocates and initialize a new DRM device. No device registration is done.
+ * This allocates and initializes a new DRM device. No device registration is done.
  * Call drm_dev_register() to advertice the device to user space and register it
  * with other core subsystems. This should be done last in the device
  * initialization sequence to make sure userspace can't access an inconsistent
-- 
2.31.1

