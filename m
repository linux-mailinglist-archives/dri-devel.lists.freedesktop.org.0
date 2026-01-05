Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC648CF473D
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 16:40:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B616710E428;
	Mon,  5 Jan 2026 15:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="X8LNy2fl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com
 [162.62.57.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D050A10E45F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 15:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1767627646; bh=YO+VnHMZ7XqygvjbowzYR0/1fxdZiUSZO6dZBsYDf38=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=X8LNy2flViG49axl6Jsz/ScJZaj/Stn5IQAdEQGt5PqhCtkX60FlaNzY3yv3Lii0B
 Vidn9Wlt7OwID82y1iuErPyVT5NZ+d2U3OcyXqmK70sycGWatRrCLCcPeofBfBwxcM
 ZNeW5rEQWCwS2A8qe8wuMrk3LW+PsiqyYP18mF1M=
Received: from kali ([111.19.95.200])
 by newxmesmtplogicsvrszc41-0.qq.com (NewEsmtp) with SMTP
 id A2A84EF4; Mon, 05 Jan 2026 23:40:42 +0800
X-QQ-mid: xmsmtpt1767627642tj6w9zihd
Message-ID: <tencent_A689560FA81D4E35410A7279DB1922CCEC09@qq.com>
X-QQ-XMAILINFO: Nx5J06Esz7r7iWxsSJakIrwmX6l3kZZEwaoasDdajtnkeRRvSKpuDoQXmXvhF7
 Efj8mLzQBC2K+D/iRaJre01wyl4HilyS7xb8cEIo5CWCXVI9Gc66TtW19Tiw1ZBIH+CKkr7PF6jH
 Ky8+H6opyN0C8wYcE0ZJpC75K6JqraHhmTaeoBtYoLJ1y1kh8K4wYbZp4rZf+qc+t+kFpOH0fSNe
 JVbSaaZ1sfm7JWV6YoBFZTPrJDZCSwzZuPV+g7601mWbRXygvSCIee14VwrFvj2uidzb+L2GqENu
 SxvCfr/Upr8zHU1GMFipZchkaoOTKVO8BjIyBTtWa6qYFowPO++O1j4Nj9kqzUMxZmscMj07zWtV
 03jFOpFp+Xk3seIL7jCi92U1Jq2AhPtLKLXf3hVXVDNlLmQjan+DMMfLF0hpYUx+2i9VODrnaHYP
 s+ybKv9NiU22rF75L4/DHXdTAeIg1D0cu2RJKZaBLjfmH14PuaKR5Y2DvzdY50GJmqvGrdZWxryE
 +uT8zC6xKadlnb+f2QAXsLZ+gdRTnUwuGoFilO493sblJryxAYZAfC3yCi2jtbk8uv8qIT/Rf87K
 RfXCrqJmz77tml8trvFIJLt9C6ruSHQuVw8BUy54qtASvPcbMfs24RbhHuNKcyq2tVKSE7WZ5TzZ
 jieOscuAKVuqi+abQQXfgOjvbS/pjX4tElgqq8RKxLB77qbJl+YYHptiMSegYuickKXW/c/pwFOb
 lfbjUXJt/zszUJkU5GFigeVmND6NLDdLKnhOLdi/PX+gxST7oq6VdWdC237bP+AVaINYSzda2p3M
 xQ+ReUXyxozDNOBAujsDwAwSbQIPAv1TehrjEqTPpLGGgbLGTYV6kM59F5ihuwNo26G3mfgW8ypA
 Nc1B+lfggER/I9WgG1W9gIaPi26vT0feU2dyvTR1OMTiGl5AfVUIDsAlf6fut1/nSW6HM/kh9IOr
 PH68VQvcQUMubcbd1UgJedgMwJlefaM/8G8GrbbX++QuJIokMxS5+K4LJnh/VFacC6K8qrL6Ia7m
 C69fK6dfuTFSU6DcpIHLNGyCJ/1la3ygXQBAF8bQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Xiao Kan <814091656@qq.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: w@1wt.eu, security@kernel.org, kanxiao666@gmail.com, xiao.kan@samsung.com,
 Xiao Kan <814091656@qq.com>
Subject: [PATCH v2] drm: Account property blob allocations to memcg
Date: Mon,  5 Jan 2026 10:40:20 -0500
X-OQ-MSGID: <20260105154020.32717-1-814091656@qq.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105-abiding-aloof-locust-dcadac@houat>
References: <20260105-abiding-aloof-locust-dcadac@houat>
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

DRM_IOCTL_MODE_CREATEPROPBLOB allows userspace to allocate arbitrary-sized
property blobs backed by kernel memory.

Currently, the blob data allocation is not accounted to the allocating
process's memory cgroup, allowing unprivileged users to trigger unbounded
kernel memory consumption and potentially cause system-wide OOM.

Mark the property blob data allocation with GFP_ACCOUNT so that the memory
is properly charged to the caller's memcg. This ensures existing cgroup
memory limits apply and prevents uncontrolled kernel memory growth without
introducing additional policy or per-file limits.

Changes since v1:
  - Drop the per-drm_file blob count limit.
  - Account blob data allocations to memcg via GFP_ACCOUNT instead.

Signed-off-by: Xiao Kan <814091656@qq.com>
Signed-off-by: Xiao Kan <xiao.kan@samsung.com>
---
 drivers/gpu/drm/drm_property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 596272149..c5c91b88f 100755
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -562,7 +562,7 @@ drm_property_create_blob(struct drm_device *dev, size_t length,
 	if (!length || length > INT_MAX - sizeof(struct drm_property_blob))
 		return ERR_PTR(-EINVAL);
 
-	blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
+	blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL | GFP_ACCOUNT);
 	if (!blob)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.51.0

