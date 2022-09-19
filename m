Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF25A5BD3AA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 19:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7574310E02E;
	Mon, 19 Sep 2022 17:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9525B8825B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 17:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7NsGFKg7Zzx4zTkQ2pzi2k9DjtPnYYJNY5qhCGrS9X4=;
 b=eaQMXR6EvfKIK2M0wSn4HaBNTVf1ME4hpqesfLAjhkkIHySgXcYv0MyKIIK9Ai1x8foWeG
 9XIuVDAwZ0PdAyFs7PX1uU0Z9qrBWb9pKSvxQ3IoZsDR1HCv4fE/EQJw7PUFjxAVieZIeY
 fEfCkfBySRm8rxR5zDBp9LRxw38CcdI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-3-89MooaVwPyuOyNxbqoBe_A-1; Mon, 19 Sep 2022 13:27:28 -0400
X-MC-Unique: 89MooaVwPyuOyNxbqoBe_A-1
Received: by mail-qv1-f69.google.com with SMTP id
 mx9-20020a0562142e0900b004a1ddfe8ee3so202452qvb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 10:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=7NsGFKg7Zzx4zTkQ2pzi2k9DjtPnYYJNY5qhCGrS9X4=;
 b=tAoBWzMCldcbtRlUpsvUp0+BBxc45kgz9kdG2K2T0WebnzFoUv11Jf5q1ul44eQPxR
 CUhpS+vXqIxZqmiAMMJfDl7UhQvIkRNk9oObdDIk5mUIQyb1YDhQB5zi9xk6B6l9Euk9
 E6ttbWEzq9fMLif/V5YiAGUrZopyl+7ncUZbE0pF3mEAQnh8pcFx9o5pkaEjDOVrBV7p
 BUDrQbfsBqdnOWRfoGs3AzKMpMye86so4juacqReo8xa3faktI9ugKFbqN3/sIGbw/kS
 3dlJtDbHdfLqNLyKDDq7VemRnz0fsb2ocx4elIV6Qz+Hjq6YLVimXSl5W3XvpBEF/8Pt
 fLjw==
X-Gm-Message-State: ACrzQf0Kbx7MPtFjCMfEdHQJkOzTDfDKVqp5esB4+2a143Kbnqs/nISH
 AbyZgvLnp+YQwcNo7Iw5Cf2GNi0ir0W8MtqXwi9Nbr/7J+jYD8m0ot1aAuLF/9DrK2JlKuqyPPS
 WdFzfJ6ZJZhb+sRAZo+8m2Nf0014K
X-Received: by 2002:ac8:7d55:0:b0:35c:d884:449b with SMTP id
 h21-20020ac87d55000000b0035cd884449bmr11878606qtb.446.1663608447733; 
 Mon, 19 Sep 2022 10:27:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4i0rlAyGMYCTEgKC4McJT8796QdIatMpbatt/bB5p0sKvwg1QXcySq88dwTcJrMAFNtAKCAQ==
X-Received: by 2002:ac8:7d55:0:b0:35c:d884:449b with SMTP id
 h21-20020ac87d55000000b0035cd884449bmr11878594qtb.446.1663608447532; 
 Mon, 19 Sep 2022 10:27:27 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 w14-20020ac84d0e000000b003436103df40sm10674862qtv.8.2022.09.19.10.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:27:27 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Nevenko.Stupar@amd.com,
 Pavle.Kotarac@amd.com, aric.cyr@amd.com
Subject: [PATCH] drm/amd/display: remove redundant
 CalculateRemoteSurfaceFlipDelay's
Date: Mon, 19 Sep 2022 13:27:20 -0400
Message-Id: <20220919172720.3496405-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are several copies of CalculateRemoteSurfaceFlipDelay.
Reduce to one instance.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 .../dc/dml/dcn20/display_mode_vba_20.c        |  4 +-
 .../dc/dml/dcn20/display_mode_vba_20v2.c      | 40 +------------------
 .../dc/dml/dcn21/display_mode_vba_21.c        | 40 +------------------
 3 files changed, 4 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
index 4ca080950924..8e5d58336bc5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20.c
@@ -158,7 +158,7 @@ double CalculateTWait(
 		double DRAMClockChangeLatency,
 		double UrgentLatency,
 		double SREnterPlusExitTime);
-static double CalculateRemoteSurfaceFlipDelay(
+double CalculateRemoteSurfaceFlipDelay(
 		struct display_mode_lib *mode_lib,
 		double VRatio,
 		double SwathWidth,
@@ -2909,7 +2909,7 @@ double CalculateTWait(
 	}
 }
 
-static double CalculateRemoteSurfaceFlipDelay(
+double CalculateRemoteSurfaceFlipDelay(
 		struct display_mode_lib *mode_lib,
 		double VRatio,
 		double SwathWidth,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
index 2b4dcae4e432..e9ebc81adc71 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_mode_vba_20v2.c
@@ -182,7 +182,7 @@ double CalculateTWait(
 		double DRAMClockChangeLatency,
 		double UrgentLatency,
 		double SREnterPlusExitTime);
-static double CalculateRemoteSurfaceFlipDelay(
+double CalculateRemoteSurfaceFlipDelay(
 		struct display_mode_lib *mode_lib,
 		double VRatio,
 		double SwathWidth,
@@ -2967,44 +2967,6 @@ static void dml20v2_DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
 	}
 }
 
-static double CalculateRemoteSurfaceFlipDelay(
-		struct display_mode_lib *mode_lib,
-		double VRatio,
-		double SwathWidth,
-		double Bpp,
-		double LineTime,
-		double XFCTSlvVupdateOffset,
-		double XFCTSlvVupdateWidth,
-		double XFCTSlvVreadyOffset,
-		double XFCXBUFLatencyTolerance,
-		double XFCFillBWOverhead,
-		double XFCSlvChunkSize,
-		double XFCBusTransportTime,
-		double TCalc,
-		double TWait,
-		double *SrcActiveDrainRate,
-		double *TInitXFill,
-		double *TslvChk)
-{
-	double TSlvSetup, AvgfillRate, result;
-
-	*SrcActiveDrainRate = VRatio * SwathWidth * Bpp / LineTime;
-	TSlvSetup = XFCTSlvVupdateOffset + XFCTSlvVupdateWidth + XFCTSlvVreadyOffset;
-	*TInitXFill = XFCXBUFLatencyTolerance / (1 + XFCFillBWOverhead / 100);
-	AvgfillRate = *SrcActiveDrainRate * (1 + XFCFillBWOverhead / 100);
-	*TslvChk = XFCSlvChunkSize / AvgfillRate;
-	dml_print(
-			"DML::CalculateRemoteSurfaceFlipDelay: SrcActiveDrainRate: %f\n",
-			*SrcActiveDrainRate);
-	dml_print("DML::CalculateRemoteSurfaceFlipDelay: TSlvSetup: %f\n", TSlvSetup);
-	dml_print("DML::CalculateRemoteSurfaceFlipDelay: TInitXFill: %f\n", *TInitXFill);
-	dml_print("DML::CalculateRemoteSurfaceFlipDelay: AvgfillRate: %f\n", AvgfillRate);
-	dml_print("DML::CalculateRemoteSurfaceFlipDelay: TslvChk: %f\n", *TslvChk);
-	result = 2 * XFCBusTransportTime + TSlvSetup + TCalc + TWait + *TslvChk + *TInitXFill; // TODO: This doesn't seem to match programming guide
-	dml_print("DML::CalculateRemoteSurfaceFlipDelay: RemoteSurfaceFlipDelay: %f\n", result);
-	return result;
-}
-
 static void CalculateActiveRowBandwidth(
 		bool GPUVMEnable,
 		enum source_format_class SourcePixelFormat,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
index a3ef3638d979..d94aaf899f9b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -210,7 +210,7 @@ double CalculateTWait(
 		double DRAMClockChangeLatency,
 		double UrgentLatency,
 		double SREnterPlusExitTime);
-static double CalculateRemoteSurfaceFlipDelay(
+double CalculateRemoteSurfaceFlipDelay(
 		struct display_mode_lib *mode_lib,
 		double VRatio,
 		double SwathWidth,
@@ -2980,44 +2980,6 @@ static void DisplayPipeConfiguration(struct display_mode_lib *mode_lib)
 	}
 }
 
-static double CalculateRemoteSurfaceFlipDelay(
-		struct display_mode_lib *mode_lib,
-		double VRatio,
-		double SwathWidth,
-		double Bpp,
-		double LineTime,
-		double XFCTSlvVupdateOffset,
-		double XFCTSlvVupdateWidth,
-		double XFCTSlvVreadyOffset,
-		double XFCXBUFLatencyTolerance,
-		double XFCFillBWOverhead,
-		double XFCSlvChunkSize,
-		double XFCBusTransportTime,
-		double TCalc,
-		double TWait,
-		double *SrcActiveDrainRate,
-		double *TInitXFill,
-		double *TslvChk)
-{
-	double TSlvSetup, AvgfillRate, result;
-
-	*SrcActiveDrainRate = VRatio * SwathWidth * Bpp / LineTime;
-	TSlvSetup = XFCTSlvVupdateOffset + XFCTSlvVupdateWidth + XFCTSlvVreadyOffset;
-	*TInitXFill = XFCXBUFLatencyTolerance / (1 + XFCFillBWOverhead / 100);
-	AvgfillRate = *SrcActiveDrainRate * (1 + XFCFillBWOverhead / 100);
-	*TslvChk = XFCSlvChunkSize / AvgfillRate;
-	dml_print(
-			"DML::CalculateRemoteSurfaceFlipDelay: SrcActiveDrainRate: %f\n",
-			*SrcActiveDrainRate);
-	dml_print("DML::CalculateRemoteSurfaceFlipDelay: TSlvSetup: %f\n", TSlvSetup);
-	dml_print("DML::CalculateRemoteSurfaceFlipDelay: TInitXFill: %f\n", *TInitXFill);
-	dml_print("DML::CalculateRemoteSurfaceFlipDelay: AvgfillRate: %f\n", AvgfillRate);
-	dml_print("DML::CalculateRemoteSurfaceFlipDelay: TslvChk: %f\n", *TslvChk);
-	result = 2 * XFCBusTransportTime + TSlvSetup + TCalc + TWait + *TslvChk + *TInitXFill; // TODO: This doesn't seem to match programming guide
-	dml_print("DML::CalculateRemoteSurfaceFlipDelay: RemoteSurfaceFlipDelay: %f\n", result);
-	return result;
-}
-
 static void CalculateActiveRowBandwidth(
 		bool GPUVMEnable,
 		enum source_format_class SourcePixelFormat,
-- 
2.27.0

