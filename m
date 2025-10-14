Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254EEBD88EF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 11:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC89510E0BF;
	Tue, 14 Oct 2025 09:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H0GOMysY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E6F610E0BF
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:49:43 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id
 d2e1a72fcca58-780fc3b181aso3016992b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 02:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760435383; x=1761040183; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hLJMAroOuEjEfmiC8wuRqME2tmvcm6bRHXY9lq4lfzg=;
 b=H0GOMysYhl3X9TQAbwAktmTOtfK1lLCeGVeetAGca1Fo86rNxs/E3v1mbSgxSEJGtg
 12B5cIK4p7TqCs/xgioFOBtMK0pArmZysEF4lnDJ9TwnvHVbI8pcZhXWCIhD3adkNeQi
 AeBumJ+m26GhvWYhWwMlDR7nkqICu8tZHx1EUxPU0Tl1LR//J1TStu7NoE1hI0NolcJE
 KZgeQrtiLfATox93ZDeLIkTnHMsCUHO26ozCTCfSVK57mBsA74MYUt9KBh4+baUW7GwV
 c1zd0mj2aRjqz+xBuiT5D+irAwczVXw9NeJvpFO25xGQubxBacCgNrDoXOWD/3tw2yel
 MhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760435383; x=1761040183;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hLJMAroOuEjEfmiC8wuRqME2tmvcm6bRHXY9lq4lfzg=;
 b=iPq2oFxPe0K2WG8NbGsfMzmMw4Xi7MNMPUgy18d2Dtd1YuztETeow+NvcCCnGg3LSD
 ZITUg2lTE+YOHs9dpJ6vF6ZgqhEUBcucbWLvC4fR1OmulupFs58dR0K/WiCNi5NNx/Ra
 Tde2nfSnDatW1OePRt+t4uFq2dcO58NFXReFefNRDkm1y7Z2PNXuS8FTRXedWtZnmJ4o
 bNbGcJgUZ0T5aueWCMcONqkyNdhKU4T/Xw0L5z1LRn1mUKsryhpo/t22ZsE+AEgxbb2M
 TZhCID7Zi9MSVMAJh9Zl+9VNoDJsAl6NgQ8TR8PuyyeKa7KKzNbLyskLkuGuxX2ICntc
 PDXQ==
X-Gm-Message-State: AOJu0Ywogk+/btk6yq/sXBbvixeMD56z4tXuK/ZjjBwTumMoSW9Cym83
 qGJVU/SZkU7eADsg54YSCoy52RVmjxu0X8hdwtCEUkL+IRUClOH8Zsr6
X-Gm-Gg: ASbGnctEsh2lTbkHiUQT/53e5QiuYDBX8CV3RQEy/GR9ywVxRb9PHTbTRl9d4KjhkWK
 ESuUnun4j9irKSsiEzTCyi8B3rhW5pD/AAIyjb7fM/CSe9eAsgZfpeTLkcJvWRdx84BizdX5tH/
 7Zw/KmCdIJmuZX/xlfXvTc1RaKDk0tSz7A85h5q0+CT9N6GjGziD4lG9nrn74mLN+Yd3vtU+kQr
 ym7OupJFB1lR4JKVU/Fvl0iLvvv5W/HmdKb7NHsSPmiaTgC4AtExl64TyIsr08Yl4c04bpBHc+d
 TcZsn8YbaUqi/DWles0Dvgce652VGAFDx1A+Bj6FAooCjc4Ty6KqopXydpCpz5OU68pyAHicTJJ
 uLJIBAaT8G9g5pkbrQhJwjdZA/xyRILPNV2XFJEbGlsp4Qljm
X-Google-Smtp-Source: AGHT+IFnYsS5ZcTdUSC0sy8S/l3Mte/pJHbg/gCPohDJTseErwus40m+az1L8i+R6KD3mKSJoMA8Aw==
X-Received: by 2002:a05:6a21:3288:b0:249:d3d:a50b with SMTP id
 adf61e73a8af0-32da8462f15mr31236051637.59.1760435382798; 
 Tue, 14 Oct 2025 02:49:42 -0700 (PDT)
Received: from VM-0-14-ubuntu.. ([43.134.26.72])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b678df66ab0sm11465258a12.35.2025.10.14.02.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 02:49:42 -0700 (PDT)
From: Junjie Cao <caojunjie650@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Junjie Cao <caojunjie650@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Jun Nie <jun.nie@linaro.org>
Subject: [PATCH] drm/mipi-dsi: Add dsc_slice_per_pkt field to mipi_dsi_device
Date: Tue, 14 Oct 2025 17:49:34 +0800
Message-ID: <20251014094934.322834-1-caojunjie650@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Some DSI panels require multiple DSC slices to be transmitted within
a single DSC packet. The DSI host will only correctly program its
registers and avoid display corruption if the dsc_slice_per_pkt
parameter is provided.

Since dsc_slice_per_pkt is not part of the VESA DSC standard, it should
not be added to struct drm_dsc_config. Instead, introduce a new field
in struct mipi_dsi_device so that panel drivers can specify the required
number of slices per packet, and DSI host drivers can retrieve it
accordingly.

Originally, this change was part of a single patch that also included
the DSI host modification. This patch splits out the mipi_dsi_device
changes. The corresponding DSI host patch for Qualcomm MSM, along with
a panel driver that makes use of this field, will be submitted
separately.

Co-developed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
---
 include/drm/drm_mipi_dsi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 3aba7b380..a6357e8c2 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -180,6 +180,7 @@ struct mipi_dsi_device_info {
  * be set to the real limits of the hardware, zero is only accepted for
  * legacy drivers
  * @dsc: panel/bridge DSC pps payload to be sent
+ * @dsc_slice_per_pkt: number of DSC slices to be sent in a single packet
  */
 struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
@@ -194,6 +195,7 @@ struct mipi_dsi_device {
 	unsigned long hs_rate;
 	unsigned long lp_rate;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 };
 
 /**
-- 
2.51.0

