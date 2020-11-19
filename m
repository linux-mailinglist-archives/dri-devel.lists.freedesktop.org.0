Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3DE2B8947
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 02:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F53489FD4;
	Thu, 19 Nov 2020 01:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37E289FD1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 01:08:15 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id w4so2641501pgg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 17:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RtP9Z/a6k591s0xJ+tIM9GI8+9vDDzTmaUr2O3GHnLg=;
 b=SepqZCevI0hJA+FCmGjNnm7F0YloFodCXmyHJz9wwdDgInabW2BmgDeIoGgkvvqyli
 VbV8ycMpgZHo6vKS3JQVfsXaZHEW0pdBkbelc8jbFbARpJHrCznGIOwRKK+DIgaRyvnn
 BxyJ5DkW8cGH9yTITdYjuieJ+GYuPm/5QU85M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RtP9Z/a6k591s0xJ+tIM9GI8+9vDDzTmaUr2O3GHnLg=;
 b=FxRFz5ukAM5DQUk/U7SBnQpkhFDsMDKpGSGEdpjgLHkr7liU0DDyS7C7fWMkp8SjnX
 GfICRroVLehZsbBGco1Sr9RYHAbdjaXmGqgMfcMiGSfMcB/BVNKxoVj4imb1p3IUXyyU
 PeIuqjVziMk2HLeHF+bscTqUAG70Vsi+KxkC3nm0tHBb4B6vVN5Sv1R136u6uIHC76mU
 b9z1rOalEJseylKTaa/AHxcHNxrTzbFL/n1cDWs2SiLNirtA8KtqvBOF3O6uEu8kAR7d
 01aaNRJgoq4lNLCj1jx0sD4KxHvufT247tV2uF1Gg/tZpUsVrsWcFpptwUatfkXKLSO5
 qWCA==
X-Gm-Message-State: AOAM5300jLK4zYobZus5y8yV13jNeXQ40bwDMBO8Oqceuyu0zRsw9pTe
 1LW9nPiqbvPicsHUo7KcKAHf4totuEbU6g==
X-Google-Smtp-Source: ABdhPJz92gJXSMl5buhUTs8U5WGZeRC+wMjZ8oYQ6HLqi7lpbqlKy1jfGiPWvE+2pUJPMeWtS8plHg==
X-Received: by 2002:a63:171b:: with SMTP id x27mr11099060pgl.70.1605748095127; 
 Wed, 18 Nov 2020 17:08:15 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m8sm24188574pgg.1.2020.11.18.17.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 17:08:14 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] virtio-gpu api: Add a comment on
 VIRTIO_GPU_SHM_ID_HOST_VISIBLE
Date: Wed, 18 Nov 2020 17:08:07 -0800
Message-Id: <20201119010809.528-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201119010809.528-1-gurchetansingh@chromium.org>
References: <20201119010809.528-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>

This provides a description of how the kernel driver uses the
shmid to determine capabilities.

Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
---
 include/uapi/linux/virtio_gpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 0ec6b610402c..97523a95781d 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -115,6 +115,10 @@ enum virtio_gpu_ctrl_type {
 
 enum virtio_gpu_shm_id {
 	VIRTIO_GPU_SHM_ID_UNDEFINED = 0,
+	/*
+	 * VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB
+	 * VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB
+	 */
 	VIRTIO_GPU_SHM_ID_HOST_VISIBLE = 1
 };
 
-- 
2.29.2.299.gdc1121823c-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
