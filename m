Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 468B1CAF407
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 09:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8486E10E49D;
	Tue,  9 Dec 2025 08:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nd6JIE83";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598A210E47C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 04:19:16 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7bb710d1d1dso8211672b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Dec 2025 20:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765253956; x=1765858756; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uL3PBPq7RkNTAScaowDd6fA2ENpQo9+KapbIhKmLuW4=;
 b=Nd6JIE83xMsCywYPvRflpavZHzBsKfhtv4/0uP4T9u0UM/+lIuITKS39FLPtyN5x/t
 Ey9pzdvRLRAvfZMqRydCBPCxue9UR3D7L84JK5ubIHkP9b5256MZiJXMPcA2VG0J197e
 /m0l+Z1BffUqMTR3Nh/YzjRMMnbaIBPAWqkUErr7Uff4QU7BKqKMfg2sJ6o4H6euwPKW
 9btUDqaYlsMAfw2jq/sZotdcDcjj2VmudAgvQxinPRoGITNTEAU3Oq7HIWxFvU7GCLlt
 M+xKIxuibQm5A8U1dvukaUYiOkhPbAPbAVoDkVxJNf4yZAUvGdekV41fwQlAtUBGQ2gC
 k4Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765253956; x=1765858756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uL3PBPq7RkNTAScaowDd6fA2ENpQo9+KapbIhKmLuW4=;
 b=qzRW7fhuvWSiWjZJzK+Mn1IJgYIBuiCT3ohdWfKJdo2Z9zXxxLfAF8o7mRWr6QSgIe
 /IkusYGzl9IIaC1L3cuLR9XVsJO2TJBVgJDApZzGiY9lcFlYk/1bTGc8fFVqcbmz4Kn4
 knwBE2BD5ZkI6M138g//fnNz6dxTl6WnJ6en4MKKvnqLciZ2liYcSn32NaR6dpPO+UJW
 xY2W2JHzgWMxzbx4j5XJvDPMrEdI5MGCP6+iE7x/HqXJSBps/bf9BKPg4wScOPLRxgws
 vP+eQDoB3blqeTlfpjVTCBLDskUX2qjU/orexnQmnNoaILzL+KR76ftPyx48X8Z20A3q
 dDpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWKeandZQBdTIvOKu+7pNvljtlR8Te/zOCU1CoGPIdxbSwI49R/wwAz5wtZ141Al6CtcsSRzqnulM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEwbdfndiNAncTm6NLt7nHNPLgRq29M9wX//gFzAwpUNcxOgJL
 7bFHI/6ypnhPLqJsQ9nfbgt/6xTjCWA2XIhTJSyPegMUifc56RCLa20S
X-Gm-Gg: ASbGnctippcN15yc8iaL9ZrAfdog9mj6aXWMMTIiEDaJdZWs79A3smRnQOqeVq6PJE3
 R5ZEUUHbyo34glWK+TMCoxykl0ZJZ84Y3Rbv1j6QYdS6xGiPU8VRv5YuELbPnWzZv5WoWCLskEL
 vrGS2/qtMd0dTXyYTewOUbxhFhxG6itQ1i7UDV5YE9q2vXiSmpDa9pFiea+q7eEnOVu2uFyqwVm
 oi0LTc95PkMz6AVuzVLhF/W+r5qF8uv1jCaYXdzwhfU5cXAlPqDr125yrydolP0PFHiFiJR62xR
 19sl3jV3gFdEe3yq3HECtVBGUuavfDo4j6vhtFWkxbsI2L1iCYk36B0KMKg9D7tGTWSpdRHHODF
 wN5uLbcOHw9ys4MXgewqr6hRGBaiEBZGegMBRouqSySOs+n+RBj7Za+cUkJgQXOSD+JvtHaJjAm
 kAxbveXVZk0oSgS+I+Mpc=
X-Google-Smtp-Source: AGHT+IFA6g7T48LQbI3hczCmaUs0oEUcK8BRWG8fK0e1FDdILvB3K+H1Zd36jdCvFsWkAUtViDHF7Q==
X-Received: by 2002:a05:6a00:3d4f:b0:7e8:450c:618e with SMTP id
 d2e1a72fcca58-7e8c6da9f94mr8854188b3a.37.1765253955703; 
 Mon, 08 Dec 2025 20:19:15 -0800 (PST)
Received: from LilGuy ([2409:40c2:1049:337c:5ab7:d5cc:37be:2a0d])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7e2af09446asm14491276b3a.58.2025.12.08.20.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 20:19:15 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org (open list:INTEL DRM XE DRIVER (Lunar Lake and
 newer)), dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Subject: [PATCH] drm/xe: Fix documentation heading levels in xe_guc_pc.c
Date: Tue,  9 Dec 2025 09:48:36 +0000
Message-ID: <20251209094836.18589-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Dec 2025 08:11:41 +0000
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

Sphinx reports htmldocs warnings:

  Documentation/gpu/xe/xe_firmware:31: ./drivers/gpu/drm/xe/xe_guc_pc.c:76: ERROR: A level 2 section cannot be used here.
  Documentation/gpu/xe/xe_firmware:31: ./drivers/gpu/drm/xe/xe_guc_pc.c:87: ERROR: A level 2 section cannot be used here.

The xe_guc_pc.c documentation is included inside xe_firmware.rst.
The headers in the C file currently use '=' underlines, which conflict with
the parent document's section levels.

Fix this by demoting "Frequency management" and "Render-C States" headers
from '=' to '-' to correctly nest them as subsections.

Build environment: Python 3.13.7 Sphinx 8.2.3 docutils 0.22.3

Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 951a49fb1d3e..a114f0d8592c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -76,7 +76,7 @@
  * exposes a programming interface to the host for the control of SLPC.
  *
  * Frequency management:
- * =====================
+ * ---------------------
  *
  * Xe driver enables SLPC with all of its defaults features and frequency
  * selection, which varies per platform.
@@ -87,7 +87,7 @@
  * for any workload.
  *
  * Render-C States:
- * ================
+ * ----------------
  *
  * Render-C states is also a GuC PC feature that is now enabled in Xe for
  * all platforms.

base-commit: cfd4039213e7b5a828c5b78e1b5235cac91af53d
-- 
2.52.0

