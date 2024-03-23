Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7955887966
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 17:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0D010E49D;
	Sat, 23 Mar 2024 16:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WGzBONoM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647F710E49D
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 16:30:20 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-29f69710cbbso2075781a91.1
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711211419; x=1711816219; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+gNAzOlZksAWrrk/Sn0MY4Ibq+h1gY4sUBMqWqGyMMg=;
 b=WGzBONoMjrltqZ3QbPid/Ce44Plt/80+7RRAOxxIpp2UctloqnTJ/QsHHfjPgkKGP9
 EDtVxnNlNnSJK+VBoztqVDXilXT6Z39OVLi7tz7WeDebCoXkiDm0kzoPKDk4P8u6FhZt
 fRVRQlbDseQmiM0kXOiSo45eLXqEoWOVoP9LLdtal2KJbFfswXTSvO5SMPC2mlQpYxYr
 F5H5E7axyuS2jW1HHVRtOFRzArzjriXU2E4IMK3bBwG0A2xH4iWMrUbFe8B5Uee11ijs
 ptpKMvD44Q2PdnJHZ/SlFtPZPx84klB8djQ9YPKG1tgf1qZcnWeUppYJbLryPEbzN7YG
 ClZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711211419; x=1711816219;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+gNAzOlZksAWrrk/Sn0MY4Ibq+h1gY4sUBMqWqGyMMg=;
 b=HE3UgMI7USNKU006PuyY4JyQ2WaaxcSgb6QAwAPuNgPEMuhDrf1PDwpKWEv2y+A/4j
 rr6X6Y+XOkwIQNRssrqPiN/YHatfW3DJPzCqTojlGg5emb9R3fXQCXhmeG7ipe9lg+un
 cAelrbph/NB8/Vi2UirQ+2mfAA3XsWc319W1+xnHXkzefNefPq/rJ6mK4Yge9zLAmvVs
 66L1mzGApRBj0sYKQbsop6ScP/1eIAHr2bvpVH8CoNxeSwrEIDW8tAUQBVsb7dONkTJZ
 HCQYQb5TrB6VIGrJuPnhxjqU0EFLVE6QWDa7+rHwqctLkIm6jeXnldaPic53qxiQmRii
 fjug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYTdU52mcX8DazZmCtY+AtyKgdvXxELCujZz/a6ipMXZwRhTG5MhcHZEqPa2+R/hDmXTSzCjvD2s3bcV5FC++HLxWox9ayKFkD1g0bTUin
X-Gm-Message-State: AOJu0Yzwatgl+F/DUiwEXvxFymvyNHtEzQQU+2JtNm6o40J2KvQOJfPT
 qHT+aTYEwpVd03WwWoLSh5/nOicorAm3l9EhjSb0aMdKJYQ4yrL6
X-Google-Smtp-Source: AGHT+IHY/kpeHfsUu5DENuSNIPbMTQ4vvhND/e4pVt6OYw2ZnQmNlXiz2hcdANGxYrwIMKN9d4YuxA==
X-Received: by 2002:a17:90a:778c:b0:29b:fb23:863e with SMTP id
 v12-20020a17090a778c00b0029bfb23863emr3009742pjk.17.1711211419567; 
 Sat, 23 Mar 2024 09:30:19 -0700 (PDT)
Received: from amogh-desk-mint.Dlink ([119.82.122.244])
 by smtp.gmail.com with ESMTPSA id
 si14-20020a17090b528e00b002a05c42476csm322228pjb.10.2024.03.23.09.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Mar 2024 09:30:19 -0700 (PDT)
From: Amogh Cheluvaraj <amogh.linux.kernel.dev@gmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net,
 javier.carrasco.cruz@gmail.com, skhan@linuxfoundation.org
Cc: Amogh Cheluvaraj <amogh.linux.kernel.dev@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Fix duplicate C declaration warnings
Date: Sat, 23 Mar 2024 22:00:09 +0530
Message-ID: <20240323163012.23263-1-amogh.linux.kernel.dev@gmail.com>
X-Mailer: git-send-email 2.44.0
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

Fix duplicate C declaration warnings at
Documentation/gpu/drm-kms.rst that was found by
compiling htmldocs

/home/amogh/Linux_Kernel_Workspace/linux-next/Documentation/gpu/drm-
kms:360: ./drivers/gpu/drm/drm_fourcc.c:344: WARNING: Duplicate C
declaration, also defined at gpu/drm-kms:39.
Declaration is '.. c:function:: const struct drm_format_info *
drm_format_info (u32 format)'.
/home/amogh/Linux_Kernel_Workspace/linux-next/Documentation/gpu/drm-
kms:461: ./drivers/gpu/drm/drm_modeset_lock.c:392: WARNING: Duplicate C
declaration, also defined at gpu/drm-kms:49.
Declaration is '.. c:function:: int drm_modeset_lock (struct
drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'.

Signed-off-by: Amogh Cheluvaraj <amogh.linux.kernel.dev@gmail.com>
---

changes in v2
- add warnings found after compilation
- fix grammar in commit description

---
 Documentation/gpu/drm-kms.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 13d3627d8bc0..a4145f391e43 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -357,9 +357,6 @@ Format Functions Reference
 .. kernel-doc:: include/drm/drm_fourcc.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
-   :export:
-
 .. _kms_dumb_buffer_objects:
 
 Dumb Buffer Objects
@@ -458,9 +455,6 @@ KMS Locking
 .. kernel-doc:: include/drm/drm_modeset_lock.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
-   :export:
-
 KMS Properties
 ==============
 
-- 
2.44.0

