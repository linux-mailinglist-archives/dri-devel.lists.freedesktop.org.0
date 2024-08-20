Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781FB957F13
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 09:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDF310E4D0;
	Tue, 20 Aug 2024 07:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=vignesh.raman@collabora.com header.b="WIvgmHa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4081210E4D0;
 Tue, 20 Aug 2024 07:09:05 +0000 (UTC)
Delivered-To: daniels@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724137742; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Wsf//7UlKFeMXs5mrlbsA3f7Sm4SWFQ4OhMWchFGrGlXmj8gyuwFrLdduALbIjd5yxD/zZ3xWd4GtW5mnphQOV52asjwadd4hDidbod+cjlJ19uEUG9xkh5AwjmM7VJomKofTpUJPPt7uQMy4sR5pRHv5V0wI5vzUBomskToNRU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724137742;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0sUDtqU8UXz2+A95knZ7ryFsZBRjCwmhZ1uQAm5xJYI=; 
 b=ey+YqA/aEMyzbL8PrY058CoHw8u3SY9WK2lKKy6B+4+NvOcwr0DHW7DwOqQ25z2R9z6ipQbtVKN6IhGP4vAaPNgiYPiYXQPYoIQmYzCYIH35iciLlKRgcbaU6HO+J0s6srUj8P6mOb6DJRIolVgRJ8bBE1R4AHI7lxbpXFhTuYU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=vignesh.raman@collabora.com;
 dmarc=pass header.from=<vignesh.raman@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724137742; 
 s=zohomail; d=collabora.com; i=vignesh.raman@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=0sUDtqU8UXz2+A95knZ7ryFsZBRjCwmhZ1uQAm5xJYI=;
 b=WIvgmHa3eQbPb3a7PFmqg1lZ2yCyvmY6UKsmiivIyQWAx3BGMcQN2zw+HO/so6H0
 m9pD1V6TJJCZTdFNaufvpephnLfyMBltYY2V4cQsnEurCyc6aiM9qoIDdprUYPLn5Fy
 5My6pDr8Isr9zkWPj0ZfqFCewFT+1t8ZfTb20OzE=
Received: by mx.zohomail.com with SMTPS id 172413774108257.39914871221299;
 Tue, 20 Aug 2024 00:09:01 -0700 (PDT)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/ci: increase timeout for all jobs
Date: Tue, 20 Aug 2024 12:38:16 +0530
Message-ID: <20240820070818.1124403-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Set the timeout of all drm-ci jobs to 1h30m since
some jobs takes more than 1 hour to complete.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index b6f428cdaf94..09d8447840e9 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -10,6 +10,7 @@
 .lava-test:
   extends:
     - .test-rules
+  timeout: "1h30m"
   script:
     # Note: Build dir (and thus install) may be dirty due to GIT_STRATEGY
     - rm -rf install
@@ -71,6 +72,7 @@
     - .baremetal-test-arm64
     - .use-debian/baremetal_arm64_test
     - .test-rules
+  timeout: "1h30m"
   variables:
     FDO_CI_CONCURRENT: 10
     HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
@@ -215,7 +217,6 @@ panfrost:rk3399:
   extends:
     - .lava-igt:x86_64
   stage: i915
-  timeout: "1h30m"
   variables:
     DRIVER_NAME: i915
     DTB: ""
@@ -414,6 +415,7 @@ panfrost:g12b:
 
 virtio_gpu:none:
   stage: software-driver
+  timeout: "1h30m"
   variables:
     CROSVM_GALLIUM_DRIVER: llvmpipe
     DRIVER_NAME: virtio_gpu
@@ -436,6 +438,7 @@ virtio_gpu:none:
 
 vkms:none:
   stage: software-driver
+  timeout: "1h30m"
   variables:
     DRIVER_NAME: vkms
     GPU_VERSION: none
-- 
2.43.0

