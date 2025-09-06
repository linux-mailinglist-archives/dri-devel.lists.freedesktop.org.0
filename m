Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7B5B46F3A
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A4910E37C;
	Sat,  6 Sep 2025 13:54:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bquzdIOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC1310E37E
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:16 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-55f6507bd53so3063179e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166855; x=1757771655; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
 b=bquzdIOzM5jOty8V/lOsdVxrmlAmg/OntBcLSYfZiC8hixo4oPLUdc8oUcZe/9mudt
 NL7Kmxl1i4b0Qw3hL93CrwuJaLRJY1bbhAJTHYJ9bgo8z7LpN5rt9CRkucrTw0tAX+Pl
 h+QWfCX1m+uwVAoafNezrwi0IV16cKQBcjdI2p9y94MCKYeDbBW1AMBjZ7E5R4a/jPZl
 CQVhwOhh8uZfOo88u8RPXCp/USlrRwa7+zsahuFBHsyk5CHtQBW1u+X+F9FgA//RyVf0
 P1PsNHRKhjEtJaydJ/3xXyJEgDtpgJqaGxR1evBdtRuP3UNXf4tEzLwM/VGkMCwPqKzM
 8HMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166855; x=1757771655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PboKxjSSvW6h8IWsKUFqt3oWZleCNVGyc+XkVJL1pxE=;
 b=ccE6kWfGggs/9/wyJuI8hBT/F0udG5J3e3H5gvv0xlCvP3CnHttXj9ka2YVK7yAwS0
 9h5fV5xoZPGkczaZsD21GmIzrrFsKGRKCirmin0TZmWJz7oH/MZenoNWfrqdaE1mbmqv
 7N5tws4pUGhlws32lNGmpRpZzc3PJS0svsfvVcyPJFJQu0dCvBWTjgQVMWPVwnLjLXP2
 mNl7WPAfAoxCgmAltD4Fn60GR4pr/HjvjuT1fRk+U1D8EZuGLh2tARAHgSyrHe/xRO/0
 IAqkGaKTnLARYwSCobStb0AtyS9aplwfegA3uR6NCl+aBmSIPV/Z8R3JIJUE4zn9N25G
 5Wtw==
X-Gm-Message-State: AOJu0YyLRUFKmprywDWuGbfVe2t+9hw80mnJk+0c+UHJyPQTSrGQUv0S
 lFL1Roy3vawrvGxr3k/6E7+Y7ATbAPqPk6VUx/kIx1CXW/9UOzYv/3Ux
X-Gm-Gg: ASbGncvfww3oN1yHBEem5ufIqCfASxn878MOOJ7Am0FOHb9GCT39rATZlT1vdG4XUZ8
 PwQNgidwN6vLhbMD4k3Kr8lEIwarwESFwCC5v4IWiSKBDlmSftL+o/viFusDn4iMOJxohSKEe1J
 cn7NWGpe4YLFJUYpOxeN/Judfk1eAXyvRXEL0cLYI9FWTXr0UJUGdHJvZEhmVxFgm5YEc0Fsub2
 RGmqDVW2lthl9Snc3HltLg5T68JzojmyGYzTkFc6DwimSNPbamMJwIT7/B3Mw560nfgjmbDDhno
 RGePGvqlM+07tNCSIAxQ/C2gJEe7KU9OA5DMDjE2oVgDtFa5c1NOUQEsXHt2k6MVQpvq5hDtmNW
 e7clj1lQOqsKN6A==
X-Google-Smtp-Source: AGHT+IFJ1CwuflLWYrmyiSyRWTAzKVjGXj+OEC/CNxiHekgIHk2zT4rRYD0MencyqeeFU/tqUUarsQ==
X-Received: by 2002:a05:6512:128a:b0:561:9635:5b1a with SMTP id
 2adb3069b0e04-5626275d86emr572346e87.36.1757166854707; 
 Sat, 06 Sep 2025 06:54:14 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v2 08/23] staging: media: tegra-video: csi: move CSI helpers
 to header
Date: Sat,  6 Sep 2025 16:53:29 +0300
Message-ID: <20250906135345.241229-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
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

Move CSI helpers into the header for easier access from SoC-specific video
driver parts.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/csi.c | 11 -----------
 drivers/staging/media/tegra-video/csi.h | 10 ++++++++++
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/media/tegra-video/csi.c
index 604185c00a1a..74c92db1032f 100644
--- a/drivers/staging/media/tegra-video/csi.c
+++ b/drivers/staging/media/tegra-video/csi.c
@@ -20,17 +20,6 @@
 
 #define MHZ			1000000
 
-static inline struct tegra_csi *
-host1x_client_to_csi(struct host1x_client *client)
-{
-	return container_of(client, struct tegra_csi, client);
-}
-
-static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
-{
-	return container_of(subdev, struct tegra_csi_channel, subdev);
-}
-
 /*
  * CSI is a separate subdevice which has 6 source pads to generate
  * test pattern. CSI subdevice pad ops are used only for TPG and
diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/media/tegra-video/csi.h
index 3e6e5ee1bb1e..3ed2dbc73ce9 100644
--- a/drivers/staging/media/tegra-video/csi.h
+++ b/drivers/staging/media/tegra-video/csi.h
@@ -151,6 +151,16 @@ struct tegra_csi {
 	struct list_head csi_chans;
 };
 
+static inline struct tegra_csi *host1x_client_to_csi(struct host1x_client *client)
+{
+	return container_of(client, struct tegra_csi, client);
+}
+
+static inline struct tegra_csi_channel *to_csi_chan(struct v4l2_subdev *subdev)
+{
+	return container_of(subdev, struct tegra_csi_channel, subdev);
+}
+
 void tegra_csi_error_recover(struct v4l2_subdev *subdev);
 void tegra_csi_calc_settle_time(struct tegra_csi_channel *csi_chan,
 				u8 csi_port_num,
-- 
2.48.1

