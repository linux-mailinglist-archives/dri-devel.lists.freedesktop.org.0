Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E421B75EBEB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 08:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8836D10E114;
	Mon, 24 Jul 2023 06:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF8410E114
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 06:47:52 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4R8W1x23mczBRx4X
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 14:47:49 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1690181269; x=1692773270; bh=V/9DmpLtmUUaiETTyRFvOPxW8qA
 GVoJSukp/k1cY2Hw=; b=voVzjYGH3O90bDaWFPswYf28H7S3AWGgPlsNzANk1RS
 NRw3g5C9wayCnAycqK0iswBzwGc8wtsMbZ1ZyYzWs7qGjjZDPE3t2I3+XLzvwrTn
 uF33LYzJh4sV/keqRK/BFqabrxIxYlfxBdEeWsDqrL12ki6iFoUAJnTjrON6RUjU
 O2mwK6vqbPUEKm4JiUJdeC5Tvwxk+1qf4G6sneNw95G7zHCwEvLWnjUShZwOPhg4
 Ve6qrNjb5zOjSd2NJwYfKtOjiDfOEIbf9Yhc0ABESkw7Kb3pPOxk97TTCc6V9vwT
 lQhzCmvgP/P2WD1bEitybexmt7AJusnV0yjaluS8geA==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Pc5kp5UFh6U0 for <dri-devel@lists.freedesktop.org>;
 Mon, 24 Jul 2023 14:47:49 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4R8W1w6X6ZzBRx4V;
 Mon, 24 Jul 2023 14:47:48 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 24 Jul 2023 14:47:48 +0800
From: sunran001@208suo.com
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm: "foo * bar" should be "foo *bar"
In-Reply-To: <20230724064641.8418-1-xujianghui@cdjrlc.com>
References: <20230724064641.8418-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <bbd3901a77d4f32040673a94a42626ef@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/drm_legacy.h | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_legacy.h b/drivers/gpu/drm/drm_legacy.h
index 70c9dba114a6..f098a48cbdf4 100644
--- a/drivers/gpu/drm/drm_legacy.h
+++ b/drivers/gpu/drm/drm_legacy.h
@@ -231,7 +231,7 @@ static inline int drm_legacy_dma_setup(struct 
drm_device *dev)
  #endif

  void drm_legacy_free_buffer(struct drm_device *dev,
-			    struct drm_buf * buf);
+			    struct drm_buf *buf);
  #if IS_ENABLED(CONFIG_DRM_LEGACY)
  void drm_legacy_reclaim_buffers(struct drm_device *dev,
  				struct drm_file *filp);
@@ -253,12 +253,12 @@ int drm_legacy_sg_free(struct drm_device *dev, 
void *data,
  void drm_legacy_init_members(struct drm_device *dev);
  void drm_legacy_destroy_members(struct drm_device *dev);
  void drm_legacy_dev_reinit(struct drm_device *dev);
-int drm_legacy_setup(struct drm_device * dev);
+int drm_legacy_setup(struct drm_device *dev);
  #else
  static inline void drm_legacy_init_members(struct drm_device *dev) {}
  static inline void drm_legacy_destroy_members(struct drm_device *dev) 
{}
  static inline void drm_legacy_dev_reinit(struct drm_device *dev) {}
-static inline int drm_legacy_setup(struct drm_device * dev) { return 0; 
}
+static inline int drm_legacy_setup(struct drm_device *dev) { return 0; 
}
  #endif

  #if IS_ENABLED(CONFIG_DRM_LEGACY)
