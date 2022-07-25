Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF7C5803E6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 20:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C648AC15E7;
	Mon, 25 Jul 2022 18:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0951C15ED;
 Mon, 25 Jul 2022 18:18:51 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id s204so14459051oif.5;
 Mon, 25 Jul 2022 11:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TQraKRTwranfua7QFRgcXvvnBZubuSnmpInT6C6BiTs=;
 b=lJBLleC/MSm8LzkLYV2TFqVj17DZr991BpjRXmIa+izgTEjUAp9YOpnt3Xf8+xdAlr
 XNcmnXcHLilfFftYcQgQkSNs5Vffc3jg3GIhKZ6HmBn3Fp/BgmVbLjAR+L5t5aLUTkpr
 /+yQ5p5RvLFyU2/kdDN0dSwX4ER5xLhe3FWE4udNphySk0kHUIWEasTQroA0W4vo6ubD
 GlZXK1wHXUtZ/EWBlqvc/uLyh8nIyesv3SxWBIFsVO5Iil0qraDmXBBZQVYPMGz7sszY
 cszVwDEoyjr78VBEWrkwMjAQkLtBhMO55ERJfsy3Tuy579+s72tyJ8Dtd/9RYlSslq1q
 kVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TQraKRTwranfua7QFRgcXvvnBZubuSnmpInT6C6BiTs=;
 b=ExbT2rZ8I3H9AzRnDsq9h6R2xz/TFtz2d0bLqLieSrDL8qaQPUqu8iucqH7cso7vGm
 ixKy1HH6CwGxPNvyJjZpfzMW3j/V18B3zBWz7p+85kEEwYxOPxroIIPyMIpIlFSxyGW1
 UyYw04sqPbLvr140aHvYwCSQR/ljmsrK7I6yX9KkxFKYcQkGcRFNzfEE/gTo0QLqbZ0Q
 MI8h6SWnGpwrCd0A+vDO+Orl/Jo4IwmKuDMGiHeELsZ5jJt8I5R6/PrXc7H+WBSzSQlF
 kfMqyTv5yemC7jHqohCv1T2yMXMUQG2rbDdadlxUoakRJZxkOplZWaJNkw6oIV3nXyOi
 gXrA==
X-Gm-Message-State: AJIora/4Q6jET4hk+Pxvlji9m3twrfwvWwwTMQyPBaMbODmzIVvifFtZ
 u+1ZVV9Mg40811EYZmLC96A=
X-Google-Smtp-Source: AGRyM1t/JIwxEKJ3eL15RARypEuL6HM72lc2k52SQPSuMWI1RceloJpl+n7nsnxiriqT2oDP/wMpqQ==
X-Received: by 2002:a05:6808:1a0b:b0:33a:72c6:c96e with SMTP id
 bk11-20020a0568081a0b00b0033a72c6c96emr13157252oib.176.1658773130913; 
 Mon, 25 Jul 2022 11:18:50 -0700 (PDT)
Received: from fedora.. ([2804:14c:bbe3:4370:95da:f07f:e927:6958])
 by smtp.gmail.com with ESMTPSA id
 m42-20020a056870562a00b0010db1a8d931sm5358484oao.28.2022.07.25.11.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 11:18:50 -0700 (PDT)
From: Magali Lemes <magalilemes00@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/2] drm/amd/display: change variables type
Date: Mon, 25 Jul 2022 15:15:58 -0300
Message-Id: <20220725181559.250030-1-magalilemes00@gmail.com>
X-Mailer: git-send-email 2.37.1
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
Cc: siqueirajordao@riseup.net, Magali Lemes <magalilemes00@gmail.com>,
 tales.aparecida@gmail.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org, isabbasso@riseup.net, andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As "dcn3_15_soc" and "dcn3_16_soc" are of type "struct
_vcs_dpi_soc_bounding_box_st", change their types accordingly.

Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h | 2 +-
 drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
index 39929fa67a51..45276317c057 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn315/dcn315_resource.h
@@ -32,7 +32,7 @@
 	container_of(pool, struct dcn315_resource_pool, base)
 
 extern struct _vcs_dpi_ip_params_st dcn3_15_ip;
-extern struct _vcs_dpi_ip_params_st dcn3_15_soc;
+extern struct _vcs_dpi_soc_bounding_box_st dcn3_15_soc;
 
 struct dcn315_resource_pool {
 	struct resource_pool base;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
index 0dc5a6c13ae7..d2234aac5449 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
@@ -32,7 +32,7 @@
 	container_of(pool, struct dcn316_resource_pool, base)
 
 extern struct _vcs_dpi_ip_params_st dcn3_16_ip;
-extern struct _vcs_dpi_ip_params_st dcn3_16_soc;
+extern struct _vcs_dpi_soc_bounding_box_st dcn3_16_soc;
 
 struct dcn316_resource_pool {
 	struct resource_pool base;
-- 
2.37.1

