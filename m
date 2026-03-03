Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QP8mKxyfpmlqRwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0DE1EAEFD
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C2E10E66E;
	Tue,  3 Mar 2026 08:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="muDbTdWX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2C910E66E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:43:05 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-389fa0d1040so76325181fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772527384; x=1773132184; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=edep+Evwox4IxBSEQEcIkaZkpzUcbpvh4gwyQ5gLWYA=;
 b=muDbTdWXhk/ULrq5w8qB/C21WRtU1L1+V4kpPVuvg0WBEr6osoHwd8FGs3T9gSJ0OK
 FtPFdduOrztf5F3mT83S7zZDRSP+kCVrV8sY24EaB1ARjeH8QiAa8Hg37asyFP8P1Ng9
 jsMSdb6EqLcf0sl3mxhy0861hr298ceWmUDr5LfsOWqPbPjG43lVcfrtDE4ICwITqqX6
 FrNGGYZ1KqWzLCiYcO+Gg72rDqP/blewq1/mdUS4eKBGSFjRY/kiekmJOnnizbdY91IS
 U5dkz33K+WEmL1dFZWk5IkyJ82T1MIRbu8cHWUxNHYmW/7nDpnFG3OnfFrS528D8PvBD
 1VFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772527384; x=1773132184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=edep+Evwox4IxBSEQEcIkaZkpzUcbpvh4gwyQ5gLWYA=;
 b=hCwtizKaNFspHopBlCZ3uQFJVLINeIHSSOZLNkW+EVDekmyLwC7KYGeUu95PtT/Q9L
 g7SEuYRhMMup6OXxJoDm3dFz7ife47Ay3JZ+w8R/LtjHCRIfdFzQZXcVgcI32pXehTYI
 7MPpzP0vIswLtkDiHWD6bJua1aH5REPuIVMybrwJlaNg67KtpOJyQNGvCDM6dqY8ke3L
 DtzvqcuIBNKMafrp30dAveuQLO5r+NxtQg0a/bUNLeTqu+sHL4cZoh3y+dbufSgtBSOF
 4WhvrEsSxFxIjjIHSHwL4cQjxhBqUC60mvYyXkGScwFJ8gAMKV38YoIBqhLPtl3yTsG4
 AajA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1SO3sbVXajDQhT3TBQDwH54Sq5z21hCmsgKfaDOJvdKrqcUlK37zl6RrcNTCgSHtrowwdrbQ2BAA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPDrJuOA+H8O/72dMIhtNTI0ueaWqAPi9Cc/CVngtLY0jSGSL4
 emqHpN6x9O9v8nd+MNqF4vpZs009rl/eN6wsmR+UuDkp9p03nJXUBhdZ
X-Gm-Gg: ATEYQzyins8OD1vChSiCkg3EhkFasY8iaonVBRv8qZIsspk4V+VePGml/96QhA2PSBx
 1/7YqfIZYglJ59flOawochT6HGTuZSeOrdRGbw5o6Mc2qThnrrrE/AMyvJcInHfgMSOaCG+//M+
 jOLZOpOTnxZAlSWGTY+sU74Nf8t3yCZBt1rSnMNcZxvaKBvrLAI8VcQUOjC60MQDSiM0TR/VEmq
 +Pn056PGE1CUtB+pNIKG7/eDSPZ+wDFV2xTc7yG6dYXJFdHNr18m+EYeUrM1gMRXTucaXnFW8xn
 z3pCW2ftDFLi388NjwMvYRy1gysZBdV4t9aUDctao7hSc+P0ceq4p2sok+XIQnY6+A5FdVS9owA
 APbC2TCVFb9ilidnJ5MXbPqZfp4lrtfzcOkSP9uJFa8sYa2ULE5Z9PtnymxZK8jR7sVinBoCWfg
 HhWHrcaPQUEMEl
X-Received: by 2002:a05:651c:2112:b0:38a:34a:7823 with SMTP id
 38308e7fff4ca-38a034a7c3dmr110038231fa.21.1772527383803; 
 Tue, 03 Mar 2026 00:43:03 -0800 (PST)
Received: from xeon ([188.163.112.72]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389f30227a9sm32599471fa.42.2026.03.03.00.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:43:03 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v7 10/15] staging: media: tegra-video: tegra20: adjust format
 align calculations
Date: Tue,  3 Mar 2026 10:42:33 +0200
Message-ID: <20260303084239.15007-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303084239.15007-1-clamor95@gmail.com>
References: <20260303084239.15007-1-clamor95@gmail.com>
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
X-Rspamd-Queue-Id: 5F0DE1EAEFD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:treding@nvidia.com,m:mperttunen@nvidia.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:skomatineni@nvidia.com,m:luca.ceresoli@bootlin.com,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:hverkuil+cisco@kernel.org,m:clamor95@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:thierryreding@gmail.com,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Expand supported formats structure with data_type and bit_width fields
required for CSI support. Adjust tegra20_fmt_align by factoring out common
bytesperline and sizeimage calculation logic shared by supported planar
and non-planar formats and leaving planar-related correction under a
switch.

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, parallel camera
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 39 ++++++++++-----------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index c8afc6f2adf2..4b218b9fbc26 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -280,18 +280,13 @@ static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int bpp)
 	pix->width  = clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MAX_WIDTH);
 	pix->height = clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MAX_HEIGHT);
 
+	pix->bytesperline = roundup(pix->width, 8) * bpp;
+	pix->sizeimage = pix->bytesperline * pix->height;
+
 	switch (pix->pixelformat) {
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_VYUY:
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_YVYU:
-		pix->bytesperline = roundup(pix->width, 2) * 2;
-		pix->sizeimage = roundup(pix->width, 2) * 2 * pix->height;
-		break;
 	case V4L2_PIX_FMT_YUV420:
 	case V4L2_PIX_FMT_YVU420:
-		pix->bytesperline = roundup(pix->width, 8);
-		pix->sizeimage = roundup(pix->width, 8) * pix->height * 3 / 2;
+		pix->sizeimage = pix->sizeimage * 3 / 2;
 		break;
 	}
 }
@@ -576,20 +571,24 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
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
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 2, UYVY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 2, VYUY),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 2, YUYV),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 2, YVYU),
+	/* YUV420P */
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YUV420),
+	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 1, YVU420),
 };
 
 const struct tegra_vi_soc tegra20_vi_soc = {
-- 
2.51.0

