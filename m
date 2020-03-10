Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E39F180C85
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621DD6E911;
	Tue, 10 Mar 2020 23:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F026E1E0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 13:31:54 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t11so15904693wrw.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 06:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i55w1bVxWCBYrNCs6Ap1qrne/WI6lcBozrwzFpA28wU=;
 b=rSe3q9tpfbCKCB6fqEd/+P3YDIX/0/o9UZ16SeK2CJhEziJLQqOMwxnnB5dto3rZq6
 2078mhZ5G2G+iB0a9uv3YFfADnKEp7qkX1G9bZEm5ScJOg1uEp9RNv4Uo0ppQvPbeDJ8
 i2o3QGBjZU4VKzVu7xCbGXcPO1FAuJCHAwaQhxxvZqTRkJs1o2CKaDW1VmuM13cs1AoU
 GMurzUy5LyNzESX6JSjDwsFGPPC+vxSvtCzLAAlEDtDZDC2SDmACb4OyXslHlC4okF+m
 fDmIqNDplUNjmr5fBbWrzbAuodwcWN3F/EXQayeOmitHsIondSte8Hef8X7er14KvB/+
 gTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i55w1bVxWCBYrNCs6Ap1qrne/WI6lcBozrwzFpA28wU=;
 b=NemjH9SHQAg/T7AR6dfTSK5FcCF49N1dwp7Eue4KF4WYgx49fEz32SWX4EWTVUQJAT
 pzl2kHbyysTDpvQl0MibrbNmpz61H0gwsmH2kvepIPTLcxMIXW5p6q6OC4WBVHsgPc6t
 pPs8O3yqhrEljLOYa9qHKlk2mSSy+c/CpKxzlrw2sKNCVfTxHnIYRppYVLpuWr8DTD43
 J5CWYmXfhYm0N/gZilriP06AboXps+TIzOayXTPL+rBCismgdh2FNGBaW25igmJBkH/1
 YJrmHCye9GT/OYjckhRtG9LQo6019xi/pyI5R9PQRJGZePpbQn/q5W68686f9Jj9eH6f
 HrLg==
X-Gm-Message-State: ANhLgQ2x/RNzo9HjYFDKivDmS0KdSG7Ne7/9o+wqEatZwuaH1fXSt7K8
 zHvtXOymIe9dijuLo2+X+1Y=
X-Google-Smtp-Source: ADFU+vvd3P42obAyeG9hj9PVietm9vqXI+l6PWyB/Zxfy3c+r03MXk6MveID056aUPNNr/qIcBrx0g==
X-Received: by 2002:a5d:6a03:: with SMTP id m3mr27915078wru.275.1583847113580; 
 Tue, 10 Mar 2020 06:31:53 -0700 (PDT)
Received: from localhost.localdomain ([197.248.222.210])
 by smtp.googlemail.com with ESMTPSA id o7sm14047141wrx.60.2020.03.10.06.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 06:31:53 -0700 (PDT)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 10/17] drm/vram-helper: make drm_vram_mm_debugfs_init()
 return 0
Date: Tue, 10 Mar 2020 16:31:14 +0300
Message-Id: <20200310133121.27913-11-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310133121.27913-1-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Mar 2020 23:36:13 +0000
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

Since 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
fails and should return void. Therefore, remove its use as the
return value of drm_vram_mm_debugfs_init(), and have the function
return 0 directly.

v2: have drm_vram_mm_debugfs_init() return 0 instead of void to avoid
introducing build issues and build breakage.

References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 92a11bb42365..c8bcc8609650 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1048,14 +1048,12 @@ static const struct drm_info_list drm_vram_mm_debugfs_list[] = {
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
