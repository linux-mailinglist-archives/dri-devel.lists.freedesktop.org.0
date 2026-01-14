Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A71EDD1F0E4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 14:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD4110E112;
	Wed, 14 Jan 2026 13:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="EjAJ4/Hh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com
 [203.205.221.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A87710E112
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 13:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1768397053; bh=zfYuIj3UC21qzJpd33IIEElTo1lBdYgm+xg7jiWR1j8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EjAJ4/HhGnFyTu9+1UkTzusNY664Ec9R+DmGaY3p7IP9BB0v4gH6ixjUokG9pxdX0
 UCZAdxC4V08JtMELAep8Qag47UtxgZ4vUlpcSaPLo1Rq6MSDi8YcETL6mltcERuGB/
 X9FzPJP7EfOMenGGOg0MIApxX4GQchkR5fbgPf4Q=
Received: from kali ([111.19.37.221])
 by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
 id 5AE29C5F; Wed, 14 Jan 2026 21:22:46 +0800
X-QQ-mid: xmsmtpt1768396966tncpnvehq
Message-ID: <tencent_D12AA2DEDE6F359E1AF59405242FB7A5FD05@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+DWrZtK1FC+sYfFY2/jPKOuuOi5+djarC8W8P9khYL99lNHzMCw
 f2uGvopiytaYQ34r+8iYUv/j8VapzpL/F8JbVHAEQwCvzeex8omQdyU9nLIBjZ7yLSZbgdq3aPaM
 AwVKWWIEaTc+a3eUAmP375xSxNrcaXAanMfIpFbsLS3wh6AmFzY9tT7Hm+N1bdQPgUeIRc7An4oB
 u1mB8BklR6pMWZAAXgau9QUKJIApTFHAOQdVrzmc+1oiUx61ZV2fQ3kw8Qn/W+8AvOuFeM0NOEZi
 FYk30uiVf4gmp3VM6BStHqFf0p/8l8fnw4eN7JfaJRNeqBmLMsaCp4lOoy7oM4ayHm1OXN3fgiee
 LVfAOz9crbpNNYctGSn0PbacOqZ+6tXhnVP+7Hzk5FefWVy/zuUVcbbqvRAOrcsD8Txm0oAdr2w/
 PwN1FIzoVN87MIxT7idKAt+XWYP9PH/7WiBQDc89ZVtjegKaYuHRJz22V8lPHBzBv8ox629zGSIR
 6JHUhOgieJXHHIn8WSySJ72DcvaDc3XkhIpvjxK3lkS1hBhGkqaVZitfRUbZumhPFxTxBe+eViPz
 Xk7VhWiE8vCu1Pn0eqrEFErkn88/ojLTKooq3CRye/jZwvxolgPpwGR7Wy60nQ7QJ1902YNUJ5Ye
 hYNzncj+gMJ1L7LE3106lXyFSItOQ501mjFGgyNDwZrQ+048HKtHHGrHbV6fXrElIHI5Js4xEzwS
 i6rKxVJMG3UaWAjjtMX7Ti12C24SwEwX1Q+Oxn9r2fvmczHM8RGVGnbqZBtu/beQ8Huqq3wcLoEb
 5Nnp+eUm5GLdDtwDSeSskMSNqDTp+6m1lWYsL1Lga0Gs/ccIU97mAUJ0e8qhTG2QweJkvwrFiiy1
 TKNM8Ul35rPy/tTugIzRDca/ld2UNY+kNYmujMHoPIzWmPS9MmjrqhQH8ZJw2LBAbhnpdE8e9/h9
 ///Zz8iI2fKNVZ8XtDph10w2+ZJjosly05SILKP0zPsW4sRCkrNNfy3olKyBqgA9rAPASWx8pQYd
 jKk0dyPqzuWX2Cc9I5Cii6WCMNsvXt9Ig855LD3g==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Xiao Kan <814091656@qq.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: w@1wt.eu, security@kernel.org, kanxiao666@gmail.com, xiao.kan@samsung.com,
 Xiao Kan <814091656@qq.com>
Subject: [PATCH v3] drm: Account property blob allocations to memcg
Date: Wed, 14 Jan 2026 08:22:26 -0500
X-OQ-MSGID: <20260114132226.13275-1-814091656@qq.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113-kickass-sensible-basilisk-66d487@houat>
References: <20260113-kickass-sensible-basilisk-66d487@houat>
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

Mark the property blob data allocation with GFP_KERNEL_ACCOUNT so that the memory
is properly charged to the caller's memcg. This ensures existing cgroup
memory limits apply and prevents uncontrolled kernel memory growth without
introducing additional policy or per-file limits.

Signed-off-by: Xiao Kan <814091656@qq.com>
Signed-off-by: Xiao Kan <xiao.kan@samsung.com>
---
 drivers/gpu/drm/drm_property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
index 596272149..3c88b5fbd 100755
--- a/drivers/gpu/drm/drm_property.c
+++ b/drivers/gpu/drm/drm_property.c
@@ -562,7 +562,7 @@ drm_property_create_blob(struct drm_device *dev, size_t length,
 	if (!length || length > INT_MAX - sizeof(struct drm_property_blob))
 		return ERR_PTR(-EINVAL);
 
-	blob = kvzalloc(sizeof(struct drm_property_blob)+length, GFP_KERNEL);
+	blob = kvzalloc(sizeof(struct drm_property_blob) + length, GFP_KERNEL_ACCOUNT);
 	if (!blob)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.51.0

