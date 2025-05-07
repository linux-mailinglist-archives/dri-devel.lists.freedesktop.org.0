Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D024BAAECEF
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E491F10E8B5;
	Wed,  7 May 2025 20:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mf8SLFP6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4487D10E8A6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:38 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-7302a769534so142902a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649357; x=1747254157; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9sbHd8gUlvuYnzn7gA8PnML99Gdixf1hIAz0N6qS0P4=;
 b=mf8SLFP6EeEzFwRJwEqONXKDzCN65OixDkcte+JOlR4r4MuCPDbV40t6rl2wgxUt32
 piDpKFp8h7v8QjoOgvbMbj7RxJn5wrePEu64fO+PGsjGFGiUi8cMjzvEIZCBL+r8yyLF
 Gq9FbXlj8sJLRcvqvtPgKR3wfohozoIyNnOMS2XwVROOa45mhAsDIXyYxh1ArUs/+Jlx
 QfAxvFFcYBwKbLlQCU0e+teEeqqoxAYmwmEyElBq+xM8EQj8gnB6rAI4PXqySHvKAgaq
 WxodrEHZsycuVRseIiBV4qWcSHbzDE9lr3hnZopMm3Wwlv+3yQK9dTSuqNGZIvIIq6NA
 Is7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649357; x=1747254157;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9sbHd8gUlvuYnzn7gA8PnML99Gdixf1hIAz0N6qS0P4=;
 b=m27h252FCt2fpxcgogrJkl5cs1DaIvePbrhnJeegu/QR9KEqqt1lnT/7TYmICqDqo6
 y1MJHcBbpp+cEPyjXiT5Jp8c+PzpHPwNSzD5lrHLogxoErKoELfg1BfXF85Xxi/WolpQ
 Fh9iBoZ7iHlYUWdC0Plq9enqc8mmT5aAGHvdGpvH8IYrjlve1JkifVa/qNy/ukS/EVme
 prb21q9rWPp6zMMOUT2Ecfa3pp0xNNoOpgz6aI6Lb0p4HChZT03ebglm+2iwnxAmBR1X
 G7i+RbU3g4q3wILMdSu5hE9VUYLhGP++wyKZlaG0OTeWp76LCV1aX+rZJ0coAgSd+M21
 4HnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeZ/Ke2fjhsvf3Dz0sK8iXZNn2sm50CmEjDixUpformpZmRFvyelqjy5w18kgXdHEXfPZUFtAZr90=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGyf2FHLULVQcyQ5N15f8quzmooata0MQpdfDxd0SbsHRGOG/E
 ZrD0Yy46K3aUrpgcyMrYb3UN20q3RQ4PSbobo+xLdij8rq4MhiUD
X-Gm-Gg: ASbGncvwTDNGJf/xB6fo8i1axZ5xCZSVMaYBvpf/7F32keHG2j+yMoH30KwBvJpAUa0
 aqBRT+gPG5ccUsVqPyPbn12fQrKEChTVwSFtDA+gkwlgRvaieo5ejXE1V06ttMutsB9EnlI9bh9
 3mqfzhI3xBhWYcayLqgbIjrlSZdCL/PS0vOgN1k6YPBmBiC9SozA/d+G9nDfFR26o5fWKENTYSE
 ejteyirRkV2Tehove3tyU3ZsSWRLJiKKy39y9fYx2ZbVlb3ZN6pKmYzgreoQLz65/y/PG5M4+Mz
 LBwkgPAtaUlmt/o72TEA6KMEIpex5zdTFRl9OP9nZti5/TkE0pePFXreTbNP
X-Google-Smtp-Source: AGHT+IGe5N0nyCvS6qJkMbvSVFVtMjpTu1pefglJ9Uyewgv0lTh7SnRx1w9QVAtXhBd2yib+n33BeA==
X-Received: by 2002:a05:6830:368d:b0:72b:9506:8db1 with SMTP id
 46e09a7af769-73210a6952cmr3059070a34.4.1746649357459; 
 Wed, 07 May 2025 13:22:37 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:37 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 13/24] drm: sun4i: de33: mixer: add mixer configuration for
 the H616
Date: Wed,  7 May 2025 15:19:32 -0500
Message-ID: <20250507201943.330111-14-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The H616 (and related SoC packages sharing the same die) carry the new
DE33 display engine.

Add the mixer configuration and a compatible string for the H616 to the
mixer.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
Changelog v7..v8:
- Separate DE33 support and H616 enablement in the mixer.
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 0d4695132dae..f774b693634d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -799,6 +799,17 @@ static const struct sun8i_mixer_cfg sun50i_h6_mixer0_cfg = {
 	.vi_num		= 1,
 };
 
+static const struct sun8i_mixer_cfg sun50i_h616_mixer0_cfg = {
+	.ccsc		= CCSC_MIXER0_LAYOUT,
+	.de_type	= sun8i_mixer_de33,
+	.mod_rate	= 600000000,
+	.scaler_mask	= 0xf,
+	.scanline_yuv	= 4096,
+	.ui_num		= 3,
+	.vi_num		= 1,
+	.map		= {0, 6, 7, 8},
+};
+
 static const struct of_device_id sun8i_mixer_of_table[] = {
 	{
 		.compatible = "allwinner,sun8i-a83t-de2-mixer-0",
@@ -844,6 +855,10 @@ static const struct of_device_id sun8i_mixer_of_table[] = {
 		.compatible = "allwinner,sun50i-h6-de3-mixer-0",
 		.data = &sun50i_h6_mixer0_cfg,
 	},
+	{
+		.compatible = "allwinner,sun50i-h616-de33-mixer-0",
+		.data = &sun50i_h616_mixer0_cfg,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun8i_mixer_of_table);
-- 
2.43.0

