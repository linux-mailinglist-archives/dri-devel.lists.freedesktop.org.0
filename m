Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D625A3A3A0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 18:08:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B735310E117;
	Tue, 18 Feb 2025 17:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mcN/rXSn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE6F10E117
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 17:08:32 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so38958175e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739898511; x=1740503311; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=46U11AO6xb80BamoNjm5kPpbkH0qTV1KcPGiHji9h2E=;
 b=mcN/rXSnlrGwTuJbLMURTBVLrMJdWW981t6o92DPLSwwCsR6b3r3B/K+FxsUPdavo1
 bHTShPjryaCgtM4GfFlPybzZ6LaQU3QjfN8Ujniy5AnAhLPdRzflmdu8h7sfC+IoSTDe
 vvdhcug709g57wVIPhiL9b0HAqqge7K16ElMRwiZ5/7Iwecjthe5KdDKxOJwlEAab2XB
 VgUBpm9fiNaexcM58hfz4AERa63YADaZviR6+wZp828l8haAONawg1W073kKKRe1NlqG
 zvbdybiNMuxNhXZ0xXExHt+pKeHiXv5lkWWNm66dkkIeIX49oyF4Ho5+d7JH7GlOHmOP
 WMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739898511; x=1740503311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=46U11AO6xb80BamoNjm5kPpbkH0qTV1KcPGiHji9h2E=;
 b=N9pmaTohMq6LgnGtAexotTfofBwo/LxyKBn1UkV7BYqdWb9r/hnC9PbiD921nBoLzs
 lHqFG/VjCDdXsvby/wtxz4jII3PHuRx72Tabt1ppnWSfovu8fpZuDI7yAR9/dkrUkkHU
 iokImQEDe6vIVdHmdZoNqfkvpp5owtcQPW85yC7ID2J1dUMlKewx8V6pqb316bUL0Tg1
 TgPu3uduhbU5M6jXXC9s5vQsC49GAEtJ5U0tTDhjq1lHk6R2a2PoOx9NSlS6fZxy87NN
 190evahWItf/JWYyKSo/sYuw7ycJl5PsFB4g22nYD2C+g3z7qvv7f0YCUt/BpjcdOEP2
 sm8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxJ2ZvFZU/RfcGEOofREYOIJbWjb6xPXlp1OzDtVjW2MEdHNE5fusalNVJe8HbxPMHy0mQNeRN6BE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1qXymxR0vvL0oadRtpssoYgL+H/8pkqFhmyKbvVBLJ0aPctsj
 Zl+Cb9q9N1ImAeF+1QQKI9dTdDu7JWGV/qCeGCv9zC/foGwxGlcB
X-Gm-Gg: ASbGncteSqwvcDkznpy1YnRXR61nVywDj48k7NsShoVbihyh3JnMX4r+QqasUu9X6AE
 hkFsUDaPZmMpoHz2RUzn5kVDgrWmn+Mq6SCYZ648hM64j4q4f2jgA1BuQIZMXpWT+TNxOaz0kYZ
 ijnrYspcpRj+wg5G0/zJdd9RJf+UWpmfetwDFSEgIzxqi3AMabPcem8Xma5nFGAIO3Q9hPeZfhp
 SG0fB/DCr9lXwqOseCnl0YnzrKHGHhRw/XRIlX5BPLbI1gw9qVESkOvseynZJ6zbGqgxZqCq/hA
 uQU5KV6+PUdye4Ffwg==
X-Google-Smtp-Source: AGHT+IFj0qB2qfVbC3n33K9GAWHWIFhdo1khdlRmgJtnZwIcOGa13vHbilTat8DaM/+qL3Ncs9+1aw==
X-Received: by 2002:a05:600c:3107:b0:439:9828:c447 with SMTP id
 5b1f17b1804b1-4399828c60emr17222845e9.17.1739898511415; 
 Tue, 18 Feb 2025 09:08:31 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439941bd54bsm24680135e9.11.2025.02.18.09.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 09:08:31 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 15/16] drm/vkms: Allow to configure the default device creation
Date: Tue, 18 Feb 2025 18:08:07 +0100
Message-ID: <20250218170808.9507-16-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218170808.9507-1-jose.exposito89@gmail.com>
References: <20250218170808.9507-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a new module param to allow to create or not the default VKMS
instance. Useful when combined with configfs to avoid having additional
VKMS instances.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 5bcfbcb6c0c5..b4ed19c97576 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -50,6 +50,10 @@ static bool enable_overlay;
 module_param_named(enable_overlay, enable_overlay, bool, 0444);
 MODULE_PARM_DESC(enable_overlay, "Enable/Disable overlay support");
 
+static bool create_default_dev = true;
+module_param_named(create_default_dev, create_default_dev, bool, 0444);
+MODULE_PARM_DESC(create_default_dev, "Create or not the default VKMS device");
+
 DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
 
 static void vkms_atomic_commit_tail(struct drm_atomic_state *old_state)
@@ -219,6 +223,9 @@ static int __init vkms_init(void)
 	if (ret)
 		return ret;
 
+	if (!create_default_dev)
+		return 0;
+
 	config = vkms_config_default_create(enable_cursor, enable_writeback, enable_overlay);
 	if (IS_ERR(config))
 		return PTR_ERR(config);
-- 
2.48.1

