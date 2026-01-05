Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEE2CF49C5
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 17:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC00B10E488;
	Mon,  5 Jan 2026 16:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="FMXjzPUq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com
 [203.205.221.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5518910E488
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 16:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1767629752; bh=s38KkU17Ay5HnTLCoKtpVpV8tXUo9BCyqLzRuXklMps=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=FMXjzPUqDeOvYEtDjHyeQKb4bon+7bBTwSRvGOMnStfrcY0Sit38Q4DABnsb+9xp3
 BOxtRPSAob1FbDY/TT+XGgQ8ZOgxQsWQ3nOvNhweDSlGjfAUE0nvcOHOh59AxRELx4
 1nYAwYAYvZjGGtvbXWzmV5dF8T+7VIWH7EBhV1pI=
Received: from kali ([111.19.95.200])
 by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
 id 39A2F44C; Tue, 06 Jan 2026 00:14:26 +0800
X-QQ-mid: xmsmtpt1767629666t2mdzv8og
Message-ID: <tencent_817B74448A3DED2A1535F6290308666E4206@qq.com>
X-QQ-XMAILINFO: Mfa2ogpi8We7lVPqvDLzthZllHetaOlV/jC2mvPZ6yPOAxvOmySIZBcvxmD4QM
 J/cD43pjcuQqmG2afp3OJNWYJehbbVA4d6BzBWlXbFN4EkagUhuyaJrsT1YiA45Nc3La/hrHnyo6
 FrKAPi/74yLkOeT+udSShijCrkouu0BUe35NPoKUDkfPB6qgO/d+FloLv1x+fsECtgSDjs2cOGS4
 wHdOkC4QaGuvrU4od54j4QxaXSOyOrx5B4aks6+AYwfIFUs0yoB81igoxE8woK86VvK5JkwqRJ8J
 auchNvaTJwHJ0JAopzteBLWQDOSxZ/QnOMQILIi/Ot10tGQMufGH6s/qZKYB+BPMvKGUBzOR6ya/
 IvMPk9zWgxcLogkpB3IhySRqtukGgSZ7i9dSI3fGFpo9Hhd0WXGst37ND1J54ZotyRWx+7SPYGKF
 3BMYpGzGKo177GCsSE4hIU0Zyk7yYc6vcY5EOlavJyIFX4csmoUlv3ZjV4Ggxl6mEWFb6rDYK/Vl
 BvSE7K8DfIc8J19b0v+s9fZ9A+UjLotkT73v+TvrQGliqRHb9yiYOlJyUCgtLtEyqm3WRIOAUUbU
 kXzMgCRU3djBRjk+yJfYoogkLyjIGRiJAfKw1MCyvD9CmHNV1G0HTH7+EfOnB5uBCwbIZKuAgIC/
 7njRpGbZsT+fP2yf57sKAm1xVB2Tc44O0Ws1Hhip4/4GrVnzLB7tvCtPe3aUdwLdMQh5bO6TQmxb
 wWnhr2Pd+fVJiEseWQ/gXV3Djx15P9Jm/93/IU59Thakosr9idBByy5LpQIMF08+H/qLNUUliBK/
 wDR4TK1zTKbkvumqKKEhfxfD0U2cx54dTSaJ4FnqHzwCPL6qOQaO9glGteFqeXjYrB+a8M7apBYX
 OCM+hT6UhmV/oHEiN0rekztPp7WUl8ZXZFapd2pCmH7Us2FM8LnwV3yzonatOYP/Oog4kF0LZ3jB
 bPqWnI80pjREi01x2irrCLwtNo+z0S2ITIXx95tsejm5IQVkf6xMt47zh8jEGo7yfycMO4jV/fw3
 QfahJEfu35rSPWpxlybOu10aqaqRgs3/AHsHcfisWQ+pELSLsYvZhV+Yybo18=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Xiao Kan <814091656@qq.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: w@1wt.eu, security@kernel.org, kanxiao666@gmail.com, xiao.kan@samsung.com,
 Xiao Kan <814091656@qq.com>
Subject: [PATCH v2] drm: Account property blob allocations to memcg
Date: Mon,  5 Jan 2026 11:14:13 -0500
X-OQ-MSGID: <20260105161413.6468-1-814091656@qq.com>
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
  - Account blob data allocations to memcg via GFP_KERNEL_ACCOUNT instead.

Signed-off-by: Xiao Kan <814091656@qq.com>
Signed-off-by: Xiao Kan <xiao.kan@samsung.com>
---
 drivers/gpu/drm/drm_property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 596272149..a34758712 100755
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -562,7 +562,7 @@ drm_property_create_blob(struct drm_device *dev, size_t length,
 	if (!length || length > INT_MAX - sizeof(struct drm_property_blob))
 		return ERR_PTR(-EINVAL);
 
-	blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
+	blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL_ACCOUNT);
 	if (!blob)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.51.0

