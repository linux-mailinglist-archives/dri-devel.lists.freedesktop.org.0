Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514C7AEC2B7
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 00:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB8910EA2D;
	Fri, 27 Jun 2025 22:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LbDkRELh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAAC910E31B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 07:17:45 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-749068b9b63so1319083b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 00:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751008665; x=1751613465; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5XgMUClXF3KatALn7b4tRRqk6odMfDui0ubzVB6tzUM=;
 b=LbDkRELhxZABHb5ofkOYRhpu918x51uCUOAYVVo63TeBSus9+BKVVVJH6XUdrSQVT5
 IfBpUdjXXNMhCELwkU4wCgr1poz8hf6mW3ap3htZ6rwcRMeC4vFpNoZY8DA0FTWrWDQ5
 PfaSMkZIW4aDKEQRpfEFfY7uGeplWMCwYNKCkb+wbZEsy/StHLqyqeuWce9nNB3x1RTQ
 JSLl0loS8BwllwFqjmgzRh2n5UFicmrD/u18AAISCjJOmvA7F9IjDHoNbAcE2XbLq1Xm
 w87TcnMVP5VW2vwev/eIISwqyIVxTCrzf8ty7y+siUxtRQF2lCNYAG4DJu7q7Ge+7unL
 IlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751008665; x=1751613465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5XgMUClXF3KatALn7b4tRRqk6odMfDui0ubzVB6tzUM=;
 b=oUvY8xHnxz+Xb6L4ENpfVRu5gXHz41uvmWpY4Ih42bsb7TpITDomLRqRykDl98DtPT
 m059tk7ZchlTij0WHiAlyw1WKCUC7+Z0hKjd/KmQB0aL0z+7vIuC6l0LfGNPbN1Ibr5r
 HDt5J86tyb8FNLsKYZrzhYN89LWyvdaUebjGfRVx0X5j/Mbalh+8P47f/UXKdOfTyFlR
 Br+P5Olm73VTdICGAbV7EPi/pcm2NHvrinyPKYsEMGijpLTVoI2HnzLf27/CfCvVZ1N+
 t5g7cXgQQwHO2/7lqDmTgLp8KJsS6X6epNNgND9O1t5P2OTHNJINZOOzXXyebsOHadrm
 rbpg==
X-Gm-Message-State: AOJu0Yxn64zVqoR8c48pV+iwAvnN3Gqj9ZL95UNEVjNVHsu8nK7GPAgL
 J1API1M3SlVA1fZXqD50T6hxoU/zGz0NHEkBz6ldbAGd547urke8qFcd
X-Gm-Gg: ASbGncvqszStm3MEy64td7Vqc3mZT7oRDP3yhAbvzTnLwTvJnxiCBeeaWsugsJ0cKRm
 ypMGAK2hSGRKpeXQ+d7Irldp07McpllCxuxRFMu55hYSJpZSBYh4jb1/5WYxQ08Mlkj3ahhRFaN
 eNT+kv8CER6he9ydSmxNOig97hKcfW2jH4VLGxsdMQEcPo1yDH3QjGwIna13B+0dg92Wm0MixI5
 JLYjO7WpKYrQwVCLb4YsepJeAiypZX6K6gG/sggdXzgntuSHGYkVBMT79W2uSaxhL3UkrPBF/DV
 n70kMn5d+706Hrz+gfw3J4bawk9ME+79m7kzkbeIWnGHwmY/ddvkDW0xBcmhZdIgqVc2seAHO5C
 OIGVCrNA=
X-Google-Smtp-Source: AGHT+IEnlgGJKz4hRMQnHG4OUHuPzELReZvtgZ7r6T+KaQ6GH7+zzfmWiDvo5odncMVXtilKmndjbw==
X-Received: by 2002:a05:6a00:c8f:b0:748:fd94:e62a with SMTP id
 d2e1a72fcca58-74af6e51ea9mr2804852b3a.1.1751008665275; 
 Fri, 27 Jun 2025 00:17:45 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c408:a02c:2fc6:2cad:e985:b61d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af54099besm1558667b3a.9.2025.06.27.00.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 00:17:44 -0700 (PDT)
From: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kevinpaul468@gmail.com
Subject: [PATCH] workaround for Sphinx false positive preventing index
Date: Fri, 27 Jun 2025 12:46:28 +0530
Message-Id: <20250627071628.30258-1-kevinpaul468@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 Jun 2025 22:43:17 +0000
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

Functions drm_format_info, drm_modeset_lock, drm_ioctl_flags are not being
indexed in the documentation because there are structs with the same name 
and sphinx is only indexing one of them, Added them to namespaces as a
workaround for suppressing the warnings and indexing the functions



Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
---
 Documentation/gpu/drm-kms.rst  | 2 ++
 Documentation/gpu/drm-uapi.rst | 1 +
 2 files changed, 3 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index abfe220764e1..da865ba1c014 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -357,6 +357,7 @@ Format Functions Reference
 .. kernel-doc:: include/drm/drm_fourcc.h
    :internal:
 
+.. c:namespace:: gpu_drm_fourcc
 .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
    :export:
 
@@ -473,6 +474,7 @@ KMS Locking
 .. kernel-doc:: include/drm/drm_modeset_lock.h
    :internal:
 
+.. c:namespace:: gpu_drm_modeset_lock
 .. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
    :export:
 
diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 69f72e71a96e..37a2bc461326 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -554,6 +554,7 @@ DRM specific patterns. Note that ENOTTY has the slightly unintuitive meaning of
 .. kernel-doc:: include/drm/drm_ioctl.h
    :internal:
 
+.. c:namespace:: gpu_drm
 .. kernel-doc:: drivers/gpu/drm/drm_ioctl.c
    :export:
 
-- 
2.39.5

