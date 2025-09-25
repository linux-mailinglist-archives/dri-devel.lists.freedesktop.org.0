Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BA5BA0336
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2808710E972;
	Thu, 25 Sep 2025 15:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g3Y62nvZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94B710E966
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:17:44 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5821dec0408so1527627e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758813463; x=1759418263; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ZXZmlZKQJ1aPtpUTlxHAzlWRVtS0Gs7ufNiTCTx4VY=;
 b=g3Y62nvZBjBXZsVb4JZ3qrwh8n7/XjZ/fEuguBME168vWZK9EZ6jtWOBpjejlJGman
 5NvnZnvKqS4PKzdW5wp1a3UD72Mi3IYuq1EA4aU4/PgpLn/7LmvbXUmw+D33eKH1T/FX
 wHZPI1pJzwJ3VK6vl4aDZ0o5crOlLBulGc48iZfO7RX25ih83kIQ6tPmbG1dwiJdGA7A
 Bnxgx+JUd/mMRfvz9gfsihy9Hx7Wpj9NHv2a11AEJCT3uc8QVeD4dkdr3XHGywOrSpKf
 sLAeOumkndvwCHJK358Gk6t1tuoUXGMH0HJ2DhoFhcv90fcUhCuP/AmjFhNLCCWysqXx
 35hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813463; x=1759418263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ZXZmlZKQJ1aPtpUTlxHAzlWRVtS0Gs7ufNiTCTx4VY=;
 b=KQO7SXF8bbQcoEup7KP6oA8Xv9OiYBbofDJI/aZPJvzPsgQnA8M49ABGC9Xgkx42Qx
 0CdfNQ/aVBBTc4jKscfLaWpu1iNrCrJvha1FSzmv0DRzOO1TRccUZuNXKoEMbi0S+U+/
 AmfmRYG/VOKy7YaQQE5mq2cpjwlg3SCOomPvpy49WWYO5v/QoCCPXdF7/gFdopIBqDJ7
 7ROvbGTYV2TCaIohf/dqEH1V5Cxzrp7W1Demc08q75mwmS1J5cFXNAcKQ/7E94ngin/M
 JtU+yY8fFXzGauitseyxgssEMfbtDv4n6X2TbE3Sk8z/G+MpOSYkLG33Wk7Fbuwbbyd4
 Qbew==
X-Gm-Message-State: AOJu0YwgkbeedR+KB7xPF8Y2LnNnEB5mkLtax3qm4FDqx7xIPyIbdh1N
 u6uXE6kkOok1DNP8CIY0jh16K8IOZXn80hKyW49EfFrWLHSSWbU1MRO2
X-Gm-Gg: ASbGncsgLIQHsyN8xSd1PvEcC+OtwBpDVIMCxal01jEZ/wkmUVzUAh5LjNIT66YC/BT
 Qb20piSo1Ax6b2v+TSmS8QTptE8mgNQuXSRYltc2Tow1ZtKNMqZt54zBxgHD8sSPQL6AqApeF0k
 vRD0lgHJPJVcMG4JUeF+8CZGfr/7UypgrlSvmg+8XrKmJRWCiYkboLf54cf+/vsSDLXfXplilIt
 1/t/ceSjBScHOmK4ILWgdubRGVq3u9gUr8XD9vGIHwqheRgkMF6Qj0w3eOmhUcap3fOTmVIRkRZ
 zQjZA5R88FX/VSgvj10K4ODVyHsI9kqyIyfKAQIdbx0R3mK9cOX1Mj/qlyADr7rZot+KXLHqjaH
 BlArUE80NBfVKiQ==
X-Google-Smtp-Source: AGHT+IHh633dY6ANYLtUMjcEgpVN49ihUsWBfhvNeTS7Nab+3jt+y+Q8NjTjMoMebUywrhkNyXOgrg==
X-Received: by 2002:ac2:4e04:0:b0:57c:830c:2f97 with SMTP id
 2adb3069b0e04-582d3e826d8mr1196972e87.50.1758813462959; 
 Thu, 25 Sep 2025 08:17:42 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 08:17:42 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v3 18/22] staging: media: tegra-video: tegra20: expand format
 support with RAW8/10 and YUV422 1X16
Date: Thu, 25 Sep 2025 18:16:44 +0300
Message-ID: <20250925151648.79510-19-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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

Add support for Bayer formats (RAW8 and RAW10) and YUV42x 1X16 versions of
existing YUV42x 2X8.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 75 ++++++++++++++++++++-
 1 file changed, 72 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 43f545e6c45b..fba90cafb9be 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -187,6 +187,18 @@ static void tegra20_vi_get_input_formats(struct tegra_vi_channel *chan,
 	case MEDIA_BUS_FMT_YVYU8_2X8:
 		(*yuv_input_format) = VI_INPUT_YUV_INPUT_FORMAT_YVYU;
 		break;
+	/* RAW8 */
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	/* RAW10 */
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		(*main_input_format) = VI_INPUT_INPUT_FORMAT_BAYER;
+		break;
 	}
 }
 
@@ -221,6 +233,18 @@ static void tegra20_vi_get_output_formats(struct tegra_vi_channel *chan,
 	case V4L2_PIX_FMT_YVU420:
 		(*main_output_format) = VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR;
 		break;
+	/* RAW8 */
+	case V4L2_PIX_FMT_SBGGR8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SRGGB8:
+	/* RAW10 */
+	case V4L2_PIX_FMT_SBGGR10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SRGGB10:
+		(*main_output_format) = VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT;
+		break;
 	}
 }
 
@@ -302,6 +326,16 @@ static void tegra20_channel_queue_setup(struct tegra_vi_channel *chan)
 	case V4L2_PIX_FMT_VYUY:
 	case V4L2_PIX_FMT_YUYV:
 	case V4L2_PIX_FMT_YVYU:
+	/* RAW8 */
+	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SBGGR8:
+	/* RAW10 */
+	case V4L2_PIX_FMT_SRGGB10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SBGGR10:
 		if (chan->vflip)
 			chan->start_offset += stride * (height - 1);
 		if (chan->hflip)
@@ -367,6 +401,19 @@ static void tegra20_channel_vi_buffer_setup(struct tegra_vi_channel *chan,
 		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  base);
 		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), base + chan->start_offset);
 		break;
+	/* RAW8 */
+	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_SGRBG8:
+	case V4L2_PIX_FMT_SGBRG8:
+	case V4L2_PIX_FMT_SBGGR8:
+	/* RAW10 */
+	case V4L2_PIX_FMT_SRGGB10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SBGGR10:
+		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_2),  base);
+		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2), base + chan->start_offset);
+		break;
 	}
 }
 
@@ -448,12 +495,15 @@ static int tegra20_chan_capture_kthread_start(void *data)
 static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
 {
 	u32 output_fourcc = chan->format.pixelformat;
+	u32 data_type = chan->fmtinfo->img_dt;
 	int width  = chan->format.width;
 	int height = chan->format.height;
 	int stride_l = chan->format.bytesperline;
 	int stride_c = (output_fourcc == V4L2_PIX_FMT_YUV420 ||
 			output_fourcc == V4L2_PIX_FMT_YVU420) ? 1 : 0;
-	enum tegra_vi_out output_channel = TEGRA_VI_OUT_1;
+	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
+					    data_type == TEGRA_IMAGE_DT_RAW10) ?
+					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
 	int main_output_format;
 	int yuv_output_format;
 
@@ -580,8 +630,25 @@ static const struct tegra_video_format tegra20_video_formats[] = {
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 16, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 16, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 16, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 16, YVYU),
+	/* YUV420P */
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
 	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 12, YUV420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 12, YVU420),
+	/* RAW 8 */
+	TEGRA20_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 16, SRGGB8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 16, SGRBG8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SGBRG8_1X8, 16, SGBRG8),
+	TEGRA20_VIDEO_FMT(RAW8, 8, SBGGR8_1X8, 16, SBGGR8),
+	/* RAW 10 */
+	TEGRA20_VIDEO_FMT(RAW10, 10, SRGGB10_1X10, 16, SRGGB10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SGRBG10_1X10, 16, SGRBG10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SGBRG10_1X10, 16, SGBRG10),
+	TEGRA20_VIDEO_FMT(RAW10, 10, SBGGR10_1X10, 16, SBGGR10),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
@@ -608,10 +675,12 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_chan)
 {
 	struct tegra_vi_channel *vi_chan = v4l2_get_subdev_hostdata(&vip_chan->subdev);
+	u32 data_type = vi_chan->fmtinfo->img_dt;
 	int width  = vi_chan->format.width;
 	int height = vi_chan->format.height;
-	enum tegra_vi_out output_channel = TEGRA_VI_OUT_1;
-
+	enum tegra_vi_out output_channel = (data_type == TEGRA_IMAGE_DT_RAW8 ||
+					    data_type == TEGRA_IMAGE_DT_RAW10) ?
+					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
 	unsigned int main_input_format;
 	unsigned int yuv_input_format;
 
-- 
2.48.1

