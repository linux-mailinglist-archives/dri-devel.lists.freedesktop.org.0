Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9A0930BB4
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2024 22:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1033F89264;
	Sun, 14 Jul 2024 20:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="duDCEIXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9493E10E1C9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2024 20:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1720990517;
 bh=l4xsjIr2yWIZHysqAEzUVid0VQrRTtDHb+yw12BZMEA=;
 h=From:To:Cc:Subject:Date:From;
 b=duDCEIXYMlBwWCf8Ry87YZq4udmJPTuQ+8O1DqDCyg7gcD+EfI2PPAgOBEk43cRaE
 xHXzF6vKQFz8juQdphgoC/rgMJREzSQmO7tnVNxt2LDQs89mNj0k5zsgb6A0fCnZNZ
 4KBOfK0vR9bhpWXjb3GtaLf9yYRQuscfMgutIQy4Kk6Uiwwtps+n8JOjOuSE0JCAL1
 l6/FPADPlRD7j1wFBS5GVO6uLKyiD2sBBX8fHWge/6BCTYftZi0nLTWFz1YW5FbVTs
 vCnPezkFtvRuaaeZnJ50+vwZi004LAV4KcyXTVMGJbS9IFt66KlojViRkVOgmvQVhh
 pIHmjmrlkBq/g==
Received: from workpc.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 81EA337804CF;
 Sun, 14 Jul 2024 20:55:16 +0000 (UTC)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: [PATCH v1] drm/virtio: Add DRM capset definition
Date: Sun, 14 Jul 2024 23:55:02 +0300
Message-ID: <20240714205502.3409718-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.45.2
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

Define DRM native context capset in the VirtIO-GPU protocol header.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 include/uapi/linux/virtio_gpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 0e21f3998108..bf2c9cabd207 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -311,6 +311,7 @@ struct virtio_gpu_cmd_submit {
 #define VIRTIO_GPU_CAPSET_VIRGL2 2
 /* 3 is reserved for gfxstream */
 #define VIRTIO_GPU_CAPSET_VENUS 4
+#define VIRTIO_GPU_CAPSET_DRM 6
 
 /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
 struct virtio_gpu_get_capset_info {
-- 
2.45.2

