Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5102D163EDF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1216EB26;
	Wed, 19 Feb 2020 08:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFBF6EA56
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 17:29:08 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id q9so3607682wmj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 09:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QKHpAHwQO0ZJNB1lrvAWzx1AGPBc49IojeZLdlNmXVA=;
 b=u9um02XzQH1NC/AWZlnP0B2eL8HnanaORyx0WuuW4GOlOuuI9t55KV26Fr67Cih48y
 1FphTc4b+rqeHwGn21O1HiPsN6DJc+cO3vf3vl/cSnJyyrk/n37cBVVZXX+ZmbkG/Kl2
 PNsa7UaJse1lGqNVhmxkCByyEtbOomYxZ138Frp8mbMwdkJzTPHCA58U/bkzzAf6bUry
 9nDhH1cVa+fExqcL7UDNaCtsCsnx6gGUdcr/M9w/XI8IA/fAzRZDL+bgS1shSZkH+14L
 i5uRZaxGI8CAcpbSFvJWqE1irvKrPvS21uXYZPmLvybR/rNTv9RhYx9fmCkpos2oK+IC
 RjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QKHpAHwQO0ZJNB1lrvAWzx1AGPBc49IojeZLdlNmXVA=;
 b=Z68hxpvcF2ryQztAZ6zTp59sIdvFahgokcR/jtRci9jHLGyJoxTDG3qOK0qK4lvlF5
 mc170eUt3nBD5irCH8C3FeAGlbzNEkqBoJgBzc1+hNOn1K+Lqz//yYmsfUJRDcIuAp9T
 QRwUYAUmUiLtMa2BhgiM9PlSRF9cIrwZSFR7DU7ClQivLztbiIZPnWBdKNGaDjgJtRlo
 Ony/VRifn//5iJnRAI/vYt3XDJzgRApji+QBfT5JynGYFusuNnVhhYXAFRtIpIxUsBiJ
 flvTLMvqkWDf9qwbADA4iYSa6doveLLsCRxegpMFWo1VvYgJcphRTHaptX0OY2kPF9JB
 sxnw==
X-Gm-Message-State: APjAAAUuei6vNYKtPid5tljUVzOI+KKUt9ToZNmqCV3yqU0pguFdx3V6
 ZwkoGOJJRkBWoTF61SMDN/g=
X-Google-Smtp-Source: APXvYqwlLVc9vTdSjRtRyYwlcbrlOH7LvyED2+7ucGHibiIydghiVg8qYqdOGPDXj/JvzKz60NJXjQ==
X-Received: by 2002:a1c:b08a:: with SMTP id z132mr4421044wme.73.1582046946804; 
 Tue, 18 Feb 2020 09:29:06 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id t13sm6998757wrw.19.2020.02.18.09.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 09:29:05 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/vram-helper: make drm_vram_mm_debugfs_init return 0
Date: Tue, 18 Feb 2020 20:28:20 +0300
Message-Id: <20200218172821.18378-9-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218172821.18378-1-wambui.karugax@gmail.com>
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As drm_debugfs_create_files() should return 0, remove its use as the
return value of drm_vram_mm_debugfs_init(), and have the function return
0 directly.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 92a11bb42365..77b36a2286f9 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1043,19 +1043,16 @@ static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
  * @minor: drm minor device.
  *
  * Returns:
- * 0 on success, or
- * a negative error code otherwise.
+ * 0
  */
 int drm_vram_mm_debugfs_init(struct drm_minor *minor)
 {
-	int ret = 0;
-
 #if defined(CONFIG_DEBUG_FS)
-	ret = drm_debugfs_create_files(drm_vram_mm_debugfs_list,
-				       ARRAY_SIZE(drm_vram_mm_debugfs_list),
-				       minor->debugfs_root, minor);
+	drm_debugfs_create_files(drm_vram_mm_debugfs_list,
+				 ARRAY_SIZE(drm_vram_mm_debugfs_list),
+				 minor->debugfs_root, minor);
 #endif
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
 
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
