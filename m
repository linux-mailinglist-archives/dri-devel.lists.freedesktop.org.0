Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E2F15CE91
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 00:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002706E424;
	Thu, 13 Feb 2020 23:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 025626E34D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 23:18:19 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id r67so3044665pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 15:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=73/dS5yYBUIlhAx2JNLByQ5Z37ExvWD/9c6Z4fbAvbs=;
 b=JHRcfe2xQ5iGCsMjyooYusI8N3OcijLJf3Dx+9AU8ZQu0j0ui/eZSa+pLy02BOxci6
 IGcB6Omi3y5M85G7I2s8Ua6TMMuLmELDKt54/KPYga3TfBN9OH6n4Brr8u172Nu5p9hT
 J986Prj0CCtC9f3PhOzYm5VFObLdUSjKyhbuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=73/dS5yYBUIlhAx2JNLByQ5Z37ExvWD/9c6Z4fbAvbs=;
 b=DhAA80UjBXikF5HDicU0swZ3Xl2Zx1CT0xgONtjYASKyq/7ux+kvftTLun9CWIDnqg
 pH1/G/h7kR3xR9syDWXU6q/6H/S7VoguxJ5oMewXWoWaicAscyqAGrTCZFysfNPTNa4E
 zrUbjnd96tNV25h1W/zSS76aTKxPRu5WM8YCUCXt4mqkGqfvHIgTOuydKfmrDlyqsdFm
 F76o6SZY87ilZm5CeaVCUSfuQfMm4HmbnFox1ejeUqanxZTedllJGpxYcgLOMXJXU47o
 B243inxs/lEZQGxi6zAtCkHyECePMU8yqLdE63xYOlu/jv74Dgcd5Rta6g6saRiRSr1Z
 TSEw==
X-Gm-Message-State: APjAAAUd1tR2j5DI4vTXuV4pFhqLNXnEbatVcN2DVem36WcrFrfV9kKK
 An5cfbyLVYS1eMue4wWyvUIoIFLApNw=
X-Google-Smtp-Source: APXvYqwiWuYGidfZYxtb4M9C5/+HaA/bP+2EDX7gwW7TZwrp4Lml2Pe3Vrap2Ozhwy0Qmvp8zsrLjg==
X-Received: by 2002:a17:902:74cc:: with SMTP id
 f12mr312671plt.192.1581635896282; 
 Thu, 13 Feb 2020 15:18:16 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id w17sm4253495pfi.56.2020.02.13.15.18.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Feb 2020 15:18:14 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/5] *** Delay context create cmd ***
Date: Thu, 13 Feb 2020 15:18:00 -0800
Message-Id: <20200213231805.622-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's delay enqueuing the context creation command until the first 3D
ioctl, as we add more context types.  This series is based on kraxel's
"[PATCH v3 0/4] drm/virtio: rework batching" patches.

Gurchetan Singh (5):
  drm/virtio: use consistent names for drm_files
  drm/virtio: factor out context create hyercall
  drm/virtio: track whether or not a context has been initiated
  drm/virtio: enqueue virtio_gpu_create_context after the first 3D ioctl
  drm/virtio: add virtio_gpu_context_type

 drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 55 +++++++++++++++++++++-----
 drivers/gpu/drm/virtio/virtgpu_kms.c   | 25 +++---------
 3 files changed, 52 insertions(+), 29 deletions(-)

-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
