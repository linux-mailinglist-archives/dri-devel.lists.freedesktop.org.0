Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C50F8AB1B2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 17:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C19610E816;
	Fri, 19 Apr 2024 15:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K4CB5LzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEEB10E816
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 15:23:20 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6ed04c91c46so2087742b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 08:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713540199; x=1714144999; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=INx2PSoC80punQbd7jMF0869fDvIdi67uwkmtDA3+5E=;
 b=K4CB5LzENWUBYOyrNr5rFp3SuonMsVPC+0V2XXUfs1+OmneX+V8rZ1yjGhEIXHl1Dz
 EX1YNB9Lluo0praReAgC38LYS9gkDLnmlknM/VCyjCGli6QoTacVpArEmEc2axM/kjij
 UpYxc8qmTHOfTsyfUYDGpZ6Q0YbJCzD+t1p3+s2eqPAxR3nGz4jAsx5AaidGSGDVz86F
 J1N4TjmVjzO5xURBQNvB22ngxG53sUK8tCtvk3shpOJgtlsC7xwxiJT2ATydotgHr//R
 AeKRIjbLN/U9njXCcV2V4xl4kiBKWsis1CogMKfkJhUOflbhtSTApK+wk+8+tmAYEjcJ
 RJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713540199; x=1714144999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=INx2PSoC80punQbd7jMF0869fDvIdi67uwkmtDA3+5E=;
 b=U+DAVY87FdgnI3eOslxkJzyZ44dQMbzm5yBDdz0IRNOZFQIs4WnXtgrjCVLkVq04Zq
 08ETPy2iWWnhp6p6hhs6muYGVA7b4KqXWswdPqLVE6T0kK6Kt3a5beGCDdYU5XiWuYHP
 waUFP0X3S2jXBi4orxZYNm82ytp5IkOPGZP+OYWbHASRQrW/FHyfwaVmagoEChQzEKRf
 ajcR1Z1lZhhrDD5UX60tI+FqT3hzock2bhEj6vFIHRO/iWLvWp+oA29DiDGFNPH/9LyO
 BLw66/TVTeZapSDrLMwVMiDn7nDfE04xhdALh6+VhMak8rpYoX7RfZEiSiOnzRcTNnJn
 XM7g==
X-Gm-Message-State: AOJu0YxCr2fdo3lQp9edYm13tVS7HkXYbu6WVPGaFCfrXpZ4nf4F5Xla
 aRRPwrO4CCJAkiSe4KF4JJQVur5Qezjr7Z9ERGw/3yB/wXKlkKp9
X-Google-Smtp-Source: AGHT+IGDRJOmEWJobRQpk5TnSzXpKTEgICaYfQ2jmDxPFG4qoZuXuS3icvGufHpIFmT4dog+HvWLfw==
X-Received: by 2002:a05:6a20:7287:b0:1a9:7f1b:e3f7 with SMTP id
 o7-20020a056a20728700b001a97f1be3f7mr2884556pzk.50.1713540199574; 
 Fri, 19 Apr 2024 08:23:19 -0700 (PDT)
Received: from kernel.. ([2402:e280:214c:86:c4a9:af77:5f5:9531])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a17090a3f1700b002a55198259fsm6412036pjc.0.2024.04.19.08.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 08:23:19 -0700 (PDT)
From: sundar <prosunofficial@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sundar <prosunofficial@gmail.com>
Subject: [PATCH] Fix for kernel doc warning [linux-next]
Date: Fri, 19 Apr 2024 20:53:07 +0530
Message-Id: <20240419152307.13099-1-prosunofficial@gmail.com>
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

Fixed the kernel doc warning due to typo error in field name.

./include/drm/drm_mode_config.h:973: warning: Function parameter or struct member 'size_hints_property' not described in 'drm_mode_config'
./include/drm/drm_mode_config.h:973: warning: Excess struct member 'size_hints_propertty' description in 'drm_mode_config'

Signed-off-by: sundar <prosunofficial@gmail.com>
---
 include/drm/drm_mode_config.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 06d7777a881f..8de3c9a5f61b 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -953,7 +953,7 @@ struct drm_mode_config {
 	struct drm_property *modifiers_property;
 
 	/**
-	 * @size_hints_propertty: Plane SIZE_HINTS property.
+	 * @size_hints_property: Plane SIZE_HINTS property.
 	 */
 	struct drm_property *size_hints_property;
 
-- 
2.34.1

