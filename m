Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 741E9B46F53
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 15:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF53810E38B;
	Sat,  6 Sep 2025 13:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VKi/hlEP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C0E10E388
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 13:54:29 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-55f69cf4b77so3196962e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Sep 2025 06:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757166868; x=1757771668; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rZW7dqJgZ0dYH2mdRsFDOcRUdcwAD8iUPPbmwcwKHGg=;
 b=VKi/hlEP+WshgT62KN8NvJWwCtK6FrHrFDn7Y/4dBlnrHXnGX5/3liVJ3O88Imu0L4
 DSxS7q4HJ5NeRhqoxIOyn+56Zm1hl48wbdKv0nJVLezUOUrZSGbdN39PidAkVTQwIrFR
 LtQfKM9zy/ptXzNLor+aDPRF49fUXfaeqXhjSKrP3xS5051GFt7juArepedH9iz3pliN
 Nye0cDQ4ofbU9I+Q44IILqs7tL5P959HOK1oaqa3hWUYNQS3FUNV/Xq6NYyZicT8l65K
 xxy+8Dsc1RE3m6wT1wMByrTbUxSlhcTk3K78mbHnV9psv9KINFaOSVxA//9lFrr+ru8z
 TUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757166868; x=1757771668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rZW7dqJgZ0dYH2mdRsFDOcRUdcwAD8iUPPbmwcwKHGg=;
 b=JIZDI6aOOihbKrtma9ndWEWFcVxNPLGGbSAJO/4GTsXsQPdYdnwc0hb57lw1lLwq+j
 afAoo85L2cpe9FYw/hM+H79s7Kel56Q6zvCU5RreJ0EocJ17GJdyCZ9Wh2ct8sNjL038
 tAw7J5PovsV9v1yGeaaZZiq9SOBn/zFCD5a0Eam9Wotn+UflwBtF0UqYUNGwiQHoroAE
 g9PROZhcA7NGXjPdVUD+D1dPSSGHmUoPhT6fx7m8nH2sWEv+jh+5xEZHnjS2ZXqZSp3R
 Kpw7yxzm6aeWUP2ReTNTdVEY24GU6X7LPYyfMy0TPmbbUDkcJObjjg3dlmgkoqntuZCN
 Ko2Q==
X-Gm-Message-State: AOJu0Yx70TqyUAJMpykwieLlukUYqrgkp9ePlfgU5wOkdHCJc70WO3ox
 k6vinmfvaRAeq6sXPf8ngcmyjyxibVis3Wwf//0W+wlAQ2iGLZpjXGCH
X-Gm-Gg: ASbGnctjJRaruS4bqJJO1AKv7CJ70R1zxuHa0VwDxe7QHco/mVOQPi6SxXVP5jG45lP
 d8zckW1WVgdiAk0nEN6PXzK8ERqdBrauY0dIvZfi94ebdfGoS/5lt3Hg+DxbAYD9OCJsqxkKLFM
 T1VWaOtbTKj+iQBhAUCTgjEE6KKFXor6RUFB1PTYMoUPVzAajfzCzcvhbrrob3b4C0gc18YNBg2
 UbFZW3vs2xO6rv9/J48jPuTZn/QBJheYmgO0O2O/g271oCWpWS/prjIZzIzrzZnzdFhRg+wFCp0
 Fy7hHbY0wufRNyEbGSWN8uELs0nszdnVc4SpDoRV01KkzjVOqEd1SNDidpeXBfFx6xhAmixOLVS
 COORuzjOy6WNFKWXnPw1tO3DF
X-Google-Smtp-Source: AGHT+IG+CJZ7iseF3kv/Cj6ge1e/cUIXjhaB91wzpTVojIxeSMhx9A3nDfwz+NAjq7cRrEt97mJS1A==
X-Received: by 2002:a05:6512:3ca1:b0:55f:4a34:e333 with SMTP id
 2adb3069b0e04-56261bc58ddmr636666e87.33.1757166867511; 
 Sat, 06 Sep 2025 06:54:27 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Sep 2025 06:54:27 -0700 (PDT)
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
Subject: [PATCH v2 16/23] staging: media: tegra-video: tegra20: simplify
 format align calculations
Date: Sat,  6 Sep 2025 16:53:37 +0300
Message-ID: <20250906135345.241229-17-clamor95@gmail.com>
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

Simplify format align calculations by slightly modifying supported formats
structure.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 41 ++++++++-------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 6e0b3b728623..781c4e8ec856 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
 	pix->width  = clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MAX_WIDTH);
 	pix->height = clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MAX_HEIGHT);
 
-	switch (pix->pixelformat) {
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_VYUY:
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_YVYU:
-		pix->bytesperline = roundup(pix->width, 2) * 2;
-		pix->sizeimage = roundup(pix->width, 2) * 2 * pix->height;
-		break;
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_YVU420:
-		pix->bytesperline = roundup(pix->width, 8);
-		pix->sizeimage = roundup(pix->width, 8) * pix->height * 3 / 2;
-		break;
-	}
+	pix->bytesperline = DIV_ROUND_UP(pix->width * bpp, 8);
+	pix->sizeimage = pix->bytesperline * pix->height;
 }
 
 /*
@@ -576,20 +564,23 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
 	.vi_stop_streaming = tegra20_vi_stop_streaming,
 };
 
-#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)	\
-{							\
-	.code    = MEDIA_BUS_FMT_##MBUS_CODE,		\
-	.bpp     = BPP,					\
-	.fourcc  = V4L2_PIX_FMT_##FOURCC,		\
+#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC)	\
+{									\
+	.img_dt		= TEGRA_IMAGE_DT_##DATA_TYPE,			\
+	.bit_width	= BIT_WIDTH,					\
+	.code		= MEDIA_BUS_FMT_##MBUS_CODE,			\
+	.bpp		= BPP,						\
+	.fourcc		= V4L2_PIX_FMT_##FOURCC,			\
 }
 
 static const struct tegra_video_format tegra20_video_formats[] = {
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
-	TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
-	TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
-	TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
-	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
+	/* YUV422 */
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
-- 
2.48.1

