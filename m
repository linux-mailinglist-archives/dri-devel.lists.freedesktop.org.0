Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF70198E879
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 04:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC14310E359;
	Thu,  3 Oct 2024 02:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jwntJOoj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE0410E359
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 02:38:19 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2e0a47fda44so44378a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 19:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727923098; x=1728527898; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aBhhnWvJLxAsX91SXPla2wRicBwvXtlUH3afSaFOliI=;
 b=jwntJOojIwPa64G2zbBu5brNtC9uRqCH43JFxz27kAOgjUjTuRrmlGjewZI8i4fdTp
 6uaESlYoWfXU2/RthwjtekVVHMz3AORMoedQfwjLx4RyTYx7o65haSFRjrW8P4Ahia5q
 0wNMNXwEFoeq1ZbavPnKbQ9WRU6aJuVVDD6Yf0oGwVBeuLV2J7MJAuvLHyeahigxkMH1
 5xuzZXr4lIWNQp6TzMKvJeduxVXywViZK5eDnjBqL2yNWOXTDNU5+zWtRM22S6yr+gW5
 o7MZ4TReiqCJtpazpSHKHuL6ybKVkOuqAXjnqvlQ7aTlsii339BIwd4kqONns90178W4
 iYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727923098; x=1728527898;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aBhhnWvJLxAsX91SXPla2wRicBwvXtlUH3afSaFOliI=;
 b=TXfEAyQEMSpGF+/1PiT64k5885/bIdbut3sJ9v1B5dyftFGjTg9A/oCMgT/h2FlfnV
 E7o8WlPrGoLlYcKxubwOVhSMKhzBVJtxwheYkoAgg5UUX9oGe+j4F8NnpEUBTShn4rAH
 WmxSf/gYFOhSsmHuStIt+FusdnYXuWnr9/RvvZarUZhLhfEAL+MdEI8/DKi2Qwida1sn
 HHQhBgE8k73qp9DHp+UhMSOWZla64v5mPjo5/idbpmbT65QFk1tmXDIfO21Wb1d343pb
 9xBw1BoCJL0Ro4NfFV1K2UBwVxMNEW3U/rusrnEQH5UVGRvtL1vzwZAS4mALXehdk55Y
 CqXg==
X-Gm-Message-State: AOJu0YwiL0/fces2KS087PFXbVW2PtBPmOm4sxq0vBDDCot8UkDVQhMk
 +GK8jB16E609hgkSCHsm/sLjW2eYgbW86I08EcX/XYTOAcxpTm4ZzMad0A==
X-Google-Smtp-Source: AGHT+IECIn9zFuwUuZvE2eF0qZ9HXxmehAG2tOfd/jUaogGl9epHv/6wUXiyV7p1rrZaq9sbWkwHfg==
X-Received: by 2002:a17:90a:77c4:b0:2d8:b071:e10e with SMTP id
 98e67ed59e1d1-2e184513f9emr2573480a91.1.1727923098522; 
 Wed, 02 Oct 2024 19:38:18 -0700 (PDT)
Received: from dev.. ([2402:e280:214c:86:3469:2360:12e1:1ea9])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e1bfb16ec4sm282039a91.14.2024.10.02.19.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 19:38:18 -0700 (PDT)
From: R Sundar <prosunofficial@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 R Sundar <prosunofficial@gmail.com>
Subject: [PATCH linux-next] drm: Fix for kernel doc warning
Date: Thu,  3 Oct 2024 08:08:06 +0530
Message-Id: <20241003023806.17537-1-prosunofficial@gmail.com>
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

Added colon in kernel-doc comment to fix the warning.

./include/drm/drm_drv.h:372: warning: Incorrect use of kernel-doc format:          * @fbdev_probe
./include/drm/drm_drv.h:435: warning: Function parameter or struct member 'fbdev_probe' not described in 'drm_driver'

Signed-off-by: R Sundar <prosunofficial@gmail.com>
---
 include/drm/drm_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 36a606af4ba1..1bbbcb8e2d23 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -369,7 +369,7 @@ struct drm_driver {
 			       uint64_t *offset);
 
 	/**
-	 * @fbdev_probe
+	 * @fbdev_probe:
 	 *
 	 * Allocates and initialize the fb_info structure for fbdev emulation.
 	 * Furthermore it also needs to allocate the DRM framebuffer used to
-- 
2.34.1

