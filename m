Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEF4866810
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 03:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CF610E5E7;
	Mon, 26 Feb 2024 02:12:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dMs/+aEL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D07110E5E0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:12:00 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-512ab55fde6so3114538e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 18:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708913518; x=1709518318; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=8BQy2O07iLsz6YZD2mgMW04keWh7UGAAqvrOVUTq8dQ=;
 b=dMs/+aELH0ZqaqGq4o8UttVgktOh67sFMJTG2FLaxP8McDoKPjHzOMW8xNfo6vvoEG
 nspp2USrO14B218AfqH60d+5gF1rX/A/kptbbZ6SweeE0zzV3wjv19mOVnKdI4m+t7Gn
 psjJoUjD9v8Qm/InKiS9Bk9cTxyBcZzqFJ5Dj9w+Tydocuv9XyO1BU0ioc0QvBX0zYaA
 +8isBG5hv2rz/2xxdmA8gi7VifnvpUx0ghLFwJW2DH7YifBrP3+qsyiKled9uB3uY/j0
 bI2srPliowSO2LGhoxfYX3hDjFaGRkOquQTANolz533xxgpX2NRGNqXKDHt+BEaG5wdi
 XsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708913518; x=1709518318;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8BQy2O07iLsz6YZD2mgMW04keWh7UGAAqvrOVUTq8dQ=;
 b=G6Hs+M+sN/mstC6eDCy2gRwwp4FXUHCxG0PrxbgJd2OjSePzFPuckkDO4vqJp5yWRl
 FDuCumBsPVm8sAIDPi8YuJo779SoLATZBkKUkDdzllmQZfJFqqnFQSTS4KR/xH1kd2xB
 i/rXWtd4xevPvPcSnHys2HAVuH8VFNFysull7ogy5bjUhWoS0thvXLv62nujmCEEzAXb
 PgMmuZWu5+w7FW0dIpcN53FnqVPXX3BUkfSOcyXuA9pzlNED4PBawtQUFbOeUkXUFDiO
 me7es0/9iU6CRmkOomkhkT4PAMUCsXM/mVuowhKg9cnsN/S1BkO6LXQEjnUCtkJYq8en
 ZqnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/oKhbGs0FwkWoMcAxHIX5WCis9q3fgL/KHF3tEHLWTS1r5cC+MXvdQYJBfXmHI4v79fgD/gESv91of7AX9lPVPHxUzRJOaMosJvIKKKsY
X-Gm-Message-State: AOJu0Yz8jMvbRrq4vV/HnpogR6BBqrot0JeqQiDLMCiGm8mhx45PkF2c
 3IjoMIXcxPIyT2GRtveudpcoMKpKKoUhh2CHU9hOTtbDfghaZZbU+e8NrB/L09Q=
X-Google-Smtp-Source: AGHT+IFawCODV1VCo7L3g3kioC9sZjOP6VRMdcF82Hh6gpNDYc7414/pT2EB4GCKsNR83qdVOVTKPA==
X-Received: by 2002:a19:f710:0:b0:512:bd51:a0ea with SMTP id
 z16-20020a19f710000000b00512bd51a0eamr3244161lfe.9.1708913518339; 
 Sun, 25 Feb 2024 18:11:58 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 18:11:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:48 +0200
Subject: [PATCH RFC 12/12] drm/msm: sync shipped headers database
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-12-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=53863;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=iXYEC/Hu6Y70avkJJ58r9RdgX7w7yDEljwl8/py31iU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NixABQWRMHA8JtweG4OeWyRCJU2wpqtR/DL
 YWTcoAqntWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYgAKCRCLPIo+Aiko
 1WZhB/kBSw6NMypVQA68SysBsrOKUmgADxdGXXApTRJiWOAzhA2HQXC1dHXJjITSRq+qNWgPqq6
 4Z/rXxV8mwLlOGGeUE79yTJxyYcxi/5Sj5g3kE/SjjXWn3rZ5rFW7SWugRVAk/8YGYjD0Lr6gbS
 RsLE/htkqf3x8O3mjRaRRKm+9HqDrOLGoDcE4lMiHYj77g+NOVQoB3tQO1v0Q0HKtnSe3r5NDec
 eaXg6nAFPHVygkKwOJIvnlFJNHpvYSKXp/qBelj+3ip2/sJtbYdYRadnNI4XVbkyPBsOrdx9YVg
 R5QoQdKz/igEwHGHKvGFRuhJVQVv9kC6o650c/jWPClIdwq5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/registers/dsi.xml.h_shipped    |  38 ++++---
 .../drm/msm/registers/dsi_phy_10nm.xml.h_shipped   |  37 ++++---
 .../drm/msm/registers/dsi_phy_14nm.xml.h_shipped   |  37 ++++---
 .../drm/msm/registers/dsi_phy_20nm.xml.h_shipped   |  37 ++++---
 .../drm/msm/registers/dsi_phy_28nm.xml.h_shipped   |  37 ++++---
 .../msm/registers/dsi_phy_28nm_8960.xml.h_shipped  |  37 ++++---
 .../drm/msm/registers/dsi_phy_7nm.xml.h_shipped    |  37 ++++---
 drivers/gpu/drm/msm/registers/hdmi.xml.h_shipped   | 111 +++++++++++++++++----
 drivers/gpu/drm/msm/registers/mdp4.xml.h_shipped   |  37 ++++---
 drivers/gpu/drm/msm/registers/mdp5.xml.h_shipped   |  39 ++++----
 .../gpu/drm/msm/registers/mdp_common.xml.h_shipped |  45 +++++----
 drivers/gpu/drm/msm/registers/sfpb.xml.h_shipped   |  35 +++----
 12 files changed, 284 insertions(+), 243 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/dsi.xml.h_shipped b/drivers/gpu/drm/msm/registers/dsi.xml.h_shipped
index 2a7d980e12c3..d02fefe0d7ad 100644
--- a/drivers/gpu/drm/msm/registers/dsi.xml.h_shipped
+++ b/drivers/gpu/drm/msm/registers/dsi.xml.h_shipped
@@ -8,26 +8,23 @@ http://github.com/freedreno/envytools/
 git clone https://github.com/freedreno/envytools.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
+- msm.xml                 (    802 bytes, from 2024-02-26 02:06:53)
+- freedreno_copyright.xml (   1572 bytes, from 2024-02-26 02:05:48)
+- mdp4.xml                (  20908 bytes, from 2024-02-26 02:05:48)
+- mdp_common.xml          (   3056 bytes, from 2024-02-26 02:05:48)
+- mdp5.xml                (  37457 bytes, from 2024-02-26 02:05:48)
+- dsi.xml                 (  18864 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm_8960.xml   (   4935 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm.xml        (   7004 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_20nm.xml        (   3712 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_14nm.xml        (   5381 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_10nm.xml        (   4499 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_7nm.xml         (  11007 bytes, from 2024-02-26 02:05:48)
+- sfpb.xml                (    602 bytes, from 2024-02-26 02:05:48)
+- hdmi.xml                (  44030 bytes, from 2024-02-26 02:05:48)
+- edp.xml                 (  10416 bytes, from 2024-02-26 02:05:48)
+
+Copyright (C) 2013-2024 by the following authors:
 - Rob Clark <robdclark@gmail.com> (robclark)
 - Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
 
@@ -231,6 +228,7 @@ static inline uint32_t DSI_VID_CFG0_TRAFFIC_MODE(enum dsi_traffic_mode val)
 #define DSI_VID_CFG0_HSA_POWER_STOP				0x00010000
 #define DSI_VID_CFG0_HBP_POWER_STOP				0x00100000
 #define DSI_VID_CFG0_HFP_POWER_STOP				0x01000000
+#define DSI_VID_CFG0_DATABUS_WIDEN				0x02000000
 #define DSI_VID_CFG0_PULSE_MODE_HSA_HE				0x10000000
 
 #define REG_DSI_VID_CFG1					0x0000001c
diff --git a/drivers/gpu/drm/msm/registers/dsi_phy_10nm.xml.h_shipped b/drivers/gpu/drm/msm/registers/dsi_phy_10nm.xml.h_shipped
index a2ae8777e59e..9f44c08ea817 100644
--- a/drivers/gpu/drm/msm/registers/dsi_phy_10nm.xml.h_shipped
+++ b/drivers/gpu/drm/msm/registers/dsi_phy_10nm.xml.h_shipped
@@ -8,26 +8,23 @@ http://github.com/freedreno/envytools/
 git clone https://github.com/freedreno/envytools.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
+- msm.xml                 (    802 bytes, from 2024-02-26 02:06:53)
+- freedreno_copyright.xml (   1572 bytes, from 2024-02-26 02:05:48)
+- mdp4.xml                (  20908 bytes, from 2024-02-26 02:05:48)
+- mdp_common.xml          (   3056 bytes, from 2024-02-26 02:05:48)
+- mdp5.xml                (  37457 bytes, from 2024-02-26 02:05:48)
+- dsi.xml                 (  18864 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm_8960.xml   (   4935 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm.xml        (   7004 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_20nm.xml        (   3712 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_14nm.xml        (   5381 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_10nm.xml        (   4499 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_7nm.xml         (  11007 bytes, from 2024-02-26 02:05:48)
+- sfpb.xml                (    602 bytes, from 2024-02-26 02:05:48)
+- hdmi.xml                (  44030 bytes, from 2024-02-26 02:05:48)
+- edp.xml                 (  10416 bytes, from 2024-02-26 02:05:48)
+
+Copyright (C) 2013-2024 by the following authors:
 - Rob Clark <robdclark@gmail.com> (robclark)
 - Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
 
diff --git a/drivers/gpu/drm/msm/registers/dsi_phy_14nm.xml.h_shipped b/drivers/gpu/drm/msm/registers/dsi_phy_14nm.xml.h_shipped
index 24e2fdc0cde1..815358cba482 100644
--- a/drivers/gpu/drm/msm/registers/dsi_phy_14nm.xml.h_shipped
+++ b/drivers/gpu/drm/msm/registers/dsi_phy_14nm.xml.h_shipped
@@ -8,26 +8,23 @@ http://github.com/freedreno/envytools/
 git clone https://github.com/freedreno/envytools.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
+- msm.xml                 (    802 bytes, from 2024-02-26 02:06:53)
+- freedreno_copyright.xml (   1572 bytes, from 2024-02-26 02:05:48)
+- mdp4.xml                (  20908 bytes, from 2024-02-26 02:05:48)
+- mdp_common.xml          (   3056 bytes, from 2024-02-26 02:05:48)
+- mdp5.xml                (  37457 bytes, from 2024-02-26 02:05:48)
+- dsi.xml                 (  18864 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm_8960.xml   (   4935 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm.xml        (   7004 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_20nm.xml        (   3712 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_14nm.xml        (   5381 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_10nm.xml        (   4499 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_7nm.xml         (  11007 bytes, from 2024-02-26 02:05:48)
+- sfpb.xml                (    602 bytes, from 2024-02-26 02:05:48)
+- hdmi.xml                (  44030 bytes, from 2024-02-26 02:05:48)
+- edp.xml                 (  10416 bytes, from 2024-02-26 02:05:48)
+
+Copyright (C) 2013-2024 by the following authors:
 - Rob Clark <robdclark@gmail.com> (robclark)
 - Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
 
diff --git a/drivers/gpu/drm/msm/registers/dsi_phy_20nm.xml.h_shipped b/drivers/gpu/drm/msm/registers/dsi_phy_20nm.xml.h_shipped
index 6352541f37e9..40e69010a326 100644
--- a/drivers/gpu/drm/msm/registers/dsi_phy_20nm.xml.h_shipped
+++ b/drivers/gpu/drm/msm/registers/dsi_phy_20nm.xml.h_shipped
@@ -8,26 +8,23 @@ http://github.com/freedreno/envytools/
 git clone https://github.com/freedreno/envytools.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
+- msm.xml                 (    802 bytes, from 2024-02-26 02:06:53)
+- freedreno_copyright.xml (   1572 bytes, from 2024-02-26 02:05:48)
+- mdp4.xml                (  20908 bytes, from 2024-02-26 02:05:48)
+- mdp_common.xml          (   3056 bytes, from 2024-02-26 02:05:48)
+- mdp5.xml                (  37457 bytes, from 2024-02-26 02:05:48)
+- dsi.xml                 (  18864 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm_8960.xml   (   4935 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm.xml        (   7004 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_20nm.xml        (   3712 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_14nm.xml        (   5381 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_10nm.xml        (   4499 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_7nm.xml         (  11007 bytes, from 2024-02-26 02:05:48)
+- sfpb.xml                (    602 bytes, from 2024-02-26 02:05:48)
+- hdmi.xml                (  44030 bytes, from 2024-02-26 02:05:48)
+- edp.xml                 (  10416 bytes, from 2024-02-26 02:05:48)
+
+Copyright (C) 2013-2024 by the following authors:
 - Rob Clark <robdclark@gmail.com> (robclark)
 - Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
 
diff --git a/drivers/gpu/drm/msm/registers/dsi_phy_28nm.xml.h_shipped b/drivers/gpu/drm/msm/registers/dsi_phy_28nm.xml.h_shipped
index 178bd4fd7893..2094565ccea9 100644
--- a/drivers/gpu/drm/msm/registers/dsi_phy_28nm.xml.h_shipped
+++ b/drivers/gpu/drm/msm/registers/dsi_phy_28nm.xml.h_shipped
@@ -8,26 +8,23 @@ http://github.com/freedreno/envytools/
 git clone https://github.com/freedreno/envytools.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
+- msm.xml                 (    802 bytes, from 2024-02-26 02:06:53)
+- freedreno_copyright.xml (   1572 bytes, from 2024-02-26 02:05:48)
+- mdp4.xml                (  20908 bytes, from 2024-02-26 02:05:48)
+- mdp_common.xml          (   3056 bytes, from 2024-02-26 02:05:48)
+- mdp5.xml                (  37457 bytes, from 2024-02-26 02:05:48)
+- dsi.xml                 (  18864 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm_8960.xml   (   4935 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm.xml        (   7004 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_20nm.xml        (   3712 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_14nm.xml        (   5381 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_10nm.xml        (   4499 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_7nm.xml         (  11007 bytes, from 2024-02-26 02:05:48)
+- sfpb.xml                (    602 bytes, from 2024-02-26 02:05:48)
+- hdmi.xml                (  44030 bytes, from 2024-02-26 02:05:48)
+- edp.xml                 (  10416 bytes, from 2024-02-26 02:05:48)
+
+Copyright (C) 2013-2024 by the following authors:
 - Rob Clark <robdclark@gmail.com> (robclark)
 - Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
 
diff --git a/drivers/gpu/drm/msm/registers/dsi_phy_28nm_8960.xml.h_shipped b/drivers/gpu/drm/msm/registers/dsi_phy_28nm_8960.xml.h_shipped
index 5f900bb53519..88840ef51547 100644
--- a/drivers/gpu/drm/msm/registers/dsi_phy_28nm_8960.xml.h_shipped
+++ b/drivers/gpu/drm/msm/registers/dsi_phy_28nm_8960.xml.h_shipped
@@ -8,26 +8,23 @@ http://github.com/freedreno/envytools/
 git clone https://github.com/freedreno/envytools.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
+- msm.xml                 (    802 bytes, from 2024-02-26 02:06:53)
+- freedreno_copyright.xml (   1572 bytes, from 2024-02-26 02:05:48)
+- mdp4.xml                (  20908 bytes, from 2024-02-26 02:05:48)
+- mdp_common.xml          (   3056 bytes, from 2024-02-26 02:05:48)
+- mdp5.xml                (  37457 bytes, from 2024-02-26 02:05:48)
+- dsi.xml                 (  18864 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm_8960.xml   (   4935 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm.xml        (   7004 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_20nm.xml        (   3712 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_14nm.xml        (   5381 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_10nm.xml        (   4499 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_7nm.xml         (  11007 bytes, from 2024-02-26 02:05:48)
+- sfpb.xml                (    602 bytes, from 2024-02-26 02:05:48)
+- hdmi.xml                (  44030 bytes, from 2024-02-26 02:05:48)
+- edp.xml                 (  10416 bytes, from 2024-02-26 02:05:48)
+
+Copyright (C) 2013-2024 by the following authors:
 - Rob Clark <robdclark@gmail.com> (robclark)
 - Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
 
diff --git a/drivers/gpu/drm/msm/registers/dsi_phy_7nm.xml.h_shipped b/drivers/gpu/drm/msm/registers/dsi_phy_7nm.xml.h_shipped
index 584cbd0205ef..c1de09a23842 100644
--- a/drivers/gpu/drm/msm/registers/dsi_phy_7nm.xml.h_shipped
+++ b/drivers/gpu/drm/msm/registers/dsi_phy_7nm.xml.h_shipped
@@ -8,26 +8,23 @@ http://github.com/freedreno/envytools/
 git clone https://github.com/freedreno/envytools.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
+- msm.xml                 (    802 bytes, from 2024-02-26 02:06:53)
+- freedreno_copyright.xml (   1572 bytes, from 2024-02-26 02:05:48)
+- mdp4.xml                (  20908 bytes, from 2024-02-26 02:05:48)
+- mdp_common.xml          (   3056 bytes, from 2024-02-26 02:05:48)
+- mdp5.xml                (  37457 bytes, from 2024-02-26 02:05:48)
+- dsi.xml                 (  18864 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm_8960.xml   (   4935 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm.xml        (   7004 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_20nm.xml        (   3712 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_14nm.xml        (   5381 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_10nm.xml        (   4499 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_7nm.xml         (  11007 bytes, from 2024-02-26 02:05:48)
+- sfpb.xml                (    602 bytes, from 2024-02-26 02:05:48)
+- hdmi.xml                (  44030 bytes, from 2024-02-26 02:05:48)
+- edp.xml                 (  10416 bytes, from 2024-02-26 02:05:48)
+
+Copyright (C) 2013-2024 by the following authors:
 - Rob Clark <robdclark@gmail.com> (robclark)
 - Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
 
diff --git a/drivers/gpu/drm/msm/registers/hdmi.xml.h_shipped b/drivers/gpu/drm/msm/registers/hdmi.xml.h_shipped
index 973b460486a5..e69962a522a3 100644
--- a/drivers/gpu/drm/msm/registers/hdmi.xml.h_shipped
+++ b/drivers/gpu/drm/msm/registers/hdmi.xml.h_shipped
@@ -8,26 +8,23 @@ http://github.com/freedreno/envytools/
 git clone https://github.com/freedreno/envytools.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
+- msm.xml                 (    802 bytes, from 2024-02-26 02:06:53)
+- freedreno_copyright.xml (   1572 bytes, from 2024-02-26 02:05:48)
+- mdp4.xml                (  20908 bytes, from 2024-02-26 02:05:48)
+- mdp_common.xml          (   3056 bytes, from 2024-02-26 02:05:48)
+- mdp5.xml                (  37457 bytes, from 2024-02-26 02:05:48)
+- dsi.xml                 (  18864 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm_8960.xml   (   4935 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm.xml        (   7004 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_20nm.xml        (   3712 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_14nm.xml        (   5381 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_10nm.xml        (   4499 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_7nm.xml         (  11007 bytes, from 2024-02-26 02:05:48)
+- sfpb.xml                (    602 bytes, from 2024-02-26 02:05:48)
+- hdmi.xml                (  44030 bytes, from 2024-02-26 02:05:48)
+- edp.xml                 (  10416 bytes, from 2024-02-26 02:05:48)
+
+Copyright (C) 2013-2024 by the following authors:
 - Rob Clark <robdclark@gmail.com> (robclark)
 - Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
 
@@ -76,6 +73,13 @@ enum hdmi_acr_cts {
 	ACR_48 = 3,
 };
 
+enum hdmi_cec_tx_status {
+	CEC_TX_OK = 0,
+	CEC_TX_NACK = 1,
+	CEC_TX_ARB_LOSS = 2,
+	CEC_TX_MAX_RETRIES = 3,
+};
+
 #define REG_HDMI_CTRL						0x00000000
 #define HDMI_CTRL_ENABLE					0x00000001
 #define HDMI_CTRL_HDMI						0x00000002
@@ -476,22 +480,87 @@ static inline uint32_t HDMI_DDC_REF_REFTIMER(uint32_t val)
 #define REG_HDMI_HDCP_SW_LOWER_AKSV				0x00000288
 
 #define REG_HDMI_CEC_CTRL					0x0000028c
+#define HDMI_CEC_CTRL_ENABLE					0x00000001
+#define HDMI_CEC_CTRL_SEND_TRIGGER				0x00000002
+#define HDMI_CEC_CTRL_FRAME_SIZE__MASK				0x000001f0
+#define HDMI_CEC_CTRL_FRAME_SIZE__SHIFT				4
+static inline uint32_t HDMI_CEC_CTRL_FRAME_SIZE(uint32_t val)
+{
+	return ((val) << HDMI_CEC_CTRL_FRAME_SIZE__SHIFT) & HDMI_CEC_CTRL_FRAME_SIZE__MASK;
+}
+#define HDMI_CEC_CTRL_LINE_OE					0x00000200
 
 #define REG_HDMI_CEC_WR_DATA					0x00000290
+#define HDMI_CEC_WR_DATA_BROADCAST				0x00000001
+#define HDMI_CEC_WR_DATA_DATA__MASK				0x0000ff00
+#define HDMI_CEC_WR_DATA_DATA__SHIFT				8
+static inline uint32_t HDMI_CEC_WR_DATA_DATA(uint32_t val)
+{
+	return ((val) << HDMI_CEC_WR_DATA_DATA__SHIFT) & HDMI_CEC_WR_DATA_DATA__MASK;
+}
 
-#define REG_HDMI_CEC_CEC_RETRANSMIT				0x00000294
+#define REG_HDMI_CEC_RETRANSMIT					0x00000294
+#define HDMI_CEC_RETRANSMIT_ENABLE				0x00000001
+#define HDMI_CEC_RETRANSMIT_COUNT__MASK				0x000000fe
+#define HDMI_CEC_RETRANSMIT_COUNT__SHIFT			1
+static inline uint32_t HDMI_CEC_RETRANSMIT_COUNT(uint32_t val)
+{
+	return ((val) << HDMI_CEC_RETRANSMIT_COUNT__SHIFT) & HDMI_CEC_RETRANSMIT_COUNT__MASK;
+}
 
 #define REG_HDMI_CEC_STATUS					0x00000298
+#define HDMI_CEC_STATUS_BUSY					0x00000001
+#define HDMI_CEC_STATUS_TX_FRAME_DONE				0x00000008
+#define HDMI_CEC_STATUS_TX_STATUS__MASK				0x000000f0
+#define HDMI_CEC_STATUS_TX_STATUS__SHIFT			4
+static inline uint32_t HDMI_CEC_STATUS_TX_STATUS(enum hdmi_cec_tx_status val)
+{
+	return ((val) << HDMI_CEC_STATUS_TX_STATUS__SHIFT) & HDMI_CEC_STATUS_TX_STATUS__MASK;
+}
 
 #define REG_HDMI_CEC_INT					0x0000029c
+#define HDMI_CEC_INT_TX_DONE					0x00000001
+#define HDMI_CEC_INT_TX_DONE_MASK				0x00000002
+#define HDMI_CEC_INT_TX_ERROR					0x00000004
+#define HDMI_CEC_INT_TX_ERROR_MASK				0x00000008
+#define HDMI_CEC_INT_MONITOR					0x00000010
+#define HDMI_CEC_INT_MONITOR_MASK				0x00000020
+#define HDMI_CEC_INT_RX_DONE					0x00000040
+#define HDMI_CEC_INT_RX_DONE_MASK				0x00000080
 
 #define REG_HDMI_CEC_ADDR					0x000002a0
 
 #define REG_HDMI_CEC_TIME					0x000002a4
+#define HDMI_CEC_TIME_ENABLE					0x00000001
+#define HDMI_CEC_TIME_SIGNAL_FREE_TIME__MASK			0x0000ff80
+#define HDMI_CEC_TIME_SIGNAL_FREE_TIME__SHIFT			7
+static inline uint32_t HDMI_CEC_TIME_SIGNAL_FREE_TIME(uint32_t val)
+{
+	return ((val) << HDMI_CEC_TIME_SIGNAL_FREE_TIME__SHIFT) & HDMI_CEC_TIME_SIGNAL_FREE_TIME__MASK;
+}
 
 #define REG_HDMI_CEC_REFTIMER					0x000002a8
+#define HDMI_CEC_REFTIMER_REFTIMER__MASK			0x0000ffff
+#define HDMI_CEC_REFTIMER_REFTIMER__SHIFT			0
+static inline uint32_t HDMI_CEC_REFTIMER_REFTIMER(uint32_t val)
+{
+	return ((val) << HDMI_CEC_REFTIMER_REFTIMER__SHIFT) & HDMI_CEC_REFTIMER_REFTIMER__MASK;
+}
+#define HDMI_CEC_REFTIMER_ENABLE				0x00010000
 
 #define REG_HDMI_CEC_RD_DATA					0x000002ac
+#define HDMI_CEC_RD_DATA_DATA__MASK				0x000000ff
+#define HDMI_CEC_RD_DATA_DATA__SHIFT				0
+static inline uint32_t HDMI_CEC_RD_DATA_DATA(uint32_t val)
+{
+	return ((val) << HDMI_CEC_RD_DATA_DATA__SHIFT) & HDMI_CEC_RD_DATA_DATA__MASK;
+}
+#define HDMI_CEC_RD_DATA_SIZE__MASK				0x00001f00
+#define HDMI_CEC_RD_DATA_SIZE__SHIFT				8
+static inline uint32_t HDMI_CEC_RD_DATA_SIZE(uint32_t val)
+{
+	return ((val) << HDMI_CEC_RD_DATA_SIZE__SHIFT) & HDMI_CEC_RD_DATA_SIZE__MASK;
+}
 
 #define REG_HDMI_CEC_RD_FILTER					0x000002b0
 
diff --git a/drivers/gpu/drm/msm/registers/mdp4.xml.h_shipped b/drivers/gpu/drm/msm/registers/mdp4.xml.h_shipped
index cc8fde450884..3b00b63e1d5a 100644
--- a/drivers/gpu/drm/msm/registers/mdp4.xml.h_shipped
+++ b/drivers/gpu/drm/msm/registers/mdp4.xml.h_shipped
@@ -8,26 +8,23 @@ http://github.com/freedreno/envytools/
 git clone https://github.com/freedreno/envytools.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
+- msm.xml                 (    802 bytes, from 2024-02-26 02:06:53)
+- freedreno_copyright.xml (   1572 bytes, from 2024-02-26 02:05:48)
+- mdp4.xml                (  20908 bytes, from 2024-02-26 02:05:48)
+- mdp_common.xml          (   3056 bytes, from 2024-02-26 02:05:48)
+- mdp5.xml                (  37457 bytes, from 2024-02-26 02:05:48)
+- dsi.xml                 (  18864 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm_8960.xml   (   4935 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm.xml        (   7004 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_20nm.xml        (   3712 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_14nm.xml        (   5381 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_10nm.xml        (   4499 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_7nm.xml         (  11007 bytes, from 2024-02-26 02:05:48)
+- sfpb.xml                (    602 bytes, from 2024-02-26 02:05:48)
+- hdmi.xml                (  44030 bytes, from 2024-02-26 02:05:48)
+- edp.xml                 (  10416 bytes, from 2024-02-26 02:05:48)
+
+Copyright (C) 2013-2024 by the following authors:
 - Rob Clark <robdclark@gmail.com> (robclark)
 - Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
 
diff --git a/drivers/gpu/drm/msm/registers/mdp5.xml.h_shipped b/drivers/gpu/drm/msm/registers/mdp5.xml.h_shipped
index 270e11c904bd..ef5b63962e6a 100644
--- a/drivers/gpu/drm/msm/registers/mdp5.xml.h_shipped
+++ b/drivers/gpu/drm/msm/registers/mdp5.xml.h_shipped
@@ -8,26 +8,23 @@ http://github.com/freedreno/envytools/
 git clone https://github.com/freedreno/envytools.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
+- msm.xml                 (    802 bytes, from 2024-02-26 02:06:53)
+- freedreno_copyright.xml (   1572 bytes, from 2024-02-26 02:05:48)
+- mdp4.xml                (  20908 bytes, from 2024-02-26 02:05:48)
+- mdp_common.xml          (   3056 bytes, from 2024-02-26 02:05:48)
+- mdp5.xml                (  37457 bytes, from 2024-02-26 02:05:48)
+- dsi.xml                 (  18864 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm_8960.xml   (   4935 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm.xml        (   7004 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_20nm.xml        (   3712 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_14nm.xml        (   5381 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_10nm.xml        (   4499 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_7nm.xml         (  11007 bytes, from 2024-02-26 02:05:48)
+- sfpb.xml                (    602 bytes, from 2024-02-26 02:05:48)
+- hdmi.xml                (  44030 bytes, from 2024-02-26 02:05:48)
+- edp.xml                 (  10416 bytes, from 2024-02-26 02:05:48)
+
+Copyright (C) 2013-2024 by the following authors:
 - Rob Clark <robdclark@gmail.com> (robclark)
 - Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
 
@@ -1402,13 +1399,11 @@ static inline uint32_t REG_MDP5_PP_FBC_LOSSY_MODE(uint32_t i0) { return 0x000000
 static inline uint32_t __offset_WB(uint32_t idx)
 {
 	switch (idx) {
-#if 0  /* TEMPORARY until patch that adds wb.base[] is merged */
 		case 0: return (mdp5_cfg->wb.base[0]);
 		case 1: return (mdp5_cfg->wb.base[1]);
 		case 2: return (mdp5_cfg->wb.base[2]);
 		case 3: return (mdp5_cfg->wb.base[3]);
 		case 4: return (mdp5_cfg->wb.base[4]);
-#endif
 		default: return INVALID_IDX(idx);
 	}
 }
diff --git a/drivers/gpu/drm/msm/registers/mdp_common.xml.h_shipped b/drivers/gpu/drm/msm/registers/mdp_common.xml.h_shipped
index 4dd8d7db2862..4540d88bf219 100644
--- a/drivers/gpu/drm/msm/registers/mdp_common.xml.h_shipped
+++ b/drivers/gpu/drm/msm/registers/mdp_common.xml.h_shipped
@@ -8,26 +8,23 @@ http://github.com/freedreno/envytools/
 git clone https://github.com/freedreno/envytools.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
-
-Copyright (C) 2013-2022 by the following authors:
+- msm.xml                 (    802 bytes, from 2024-02-26 02:06:53)
+- freedreno_copyright.xml (   1572 bytes, from 2024-02-26 02:05:48)
+- mdp4.xml                (  20908 bytes, from 2024-02-26 02:05:48)
+- mdp_common.xml          (   3056 bytes, from 2024-02-26 02:05:48)
+- mdp5.xml                (  37457 bytes, from 2024-02-26 02:05:48)
+- dsi.xml                 (  18864 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm_8960.xml   (   4935 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm.xml        (   7004 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_20nm.xml        (   3712 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_14nm.xml        (   5381 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_10nm.xml        (   4499 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_7nm.xml         (  11007 bytes, from 2024-02-26 02:05:48)
+- sfpb.xml                (    602 bytes, from 2024-02-26 02:05:48)
+- hdmi.xml                (  44030 bytes, from 2024-02-26 02:05:48)
+- edp.xml                 (  10416 bytes, from 2024-02-26 02:05:48)
+
+Copyright (C) 2013-2024 by the following authors:
 - Rob Clark <robdclark@gmail.com> (robclark)
 - Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
 
@@ -94,7 +91,7 @@ enum mdp_component_type {
 };
 
 enum mdp_bpc {
-	BPC1 = 0,
+	BPC4 = 0,
 	BPC5 = 1,
 	BPC6 = 2,
 	BPC8 = 3,
@@ -107,5 +104,11 @@ enum mdp_bpc_alpha {
 	BPC8A = 3,
 };
 
+enum mdp_fetch_mode {
+	MDP_FETCH_LINEAR = 0,
+	MDP_FETCH_TILE = 1,
+	MDP_FETCH_UBWC = 2,
+};
+
 
 #endif /* MDP_COMMON_XML */
diff --git a/drivers/gpu/drm/msm/registers/sfpb.xml.h_shipped b/drivers/gpu/drm/msm/registers/sfpb.xml.h_shipped
index 344a1a1620cd..0dd784b276c5 100644
--- a/drivers/gpu/drm/msm/registers/sfpb.xml.h_shipped
+++ b/drivers/gpu/drm/msm/registers/sfpb.xml.h_shipped
@@ -8,26 +8,23 @@ http://github.com/freedreno/envytools/
 git clone https://github.com/freedreno/envytools.git
 
 The rules-ng-ng source files this header was generated from are:
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/msm.xml                   (    944 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml   (   1572 bytes, from 2022-07-23 20:21:46)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp4.xml              (  20912 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp_common.xml        (   2849 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/mdp/mdp5.xml              (  37461 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi.xml               (  18746 bytes, from 2022-04-28 17:29:36)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_v2.xml        (   3236 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm_8960.xml (   4935 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_28nm.xml      (   7004 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_20nm.xml      (   3712 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_14nm.xml      (   5381 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_10nm.xml      (   4499 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/dsi_phy_7nm.xml       (  11007 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/sfpb.xml              (    602 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/dsi/mmss_cc.xml           (   1686 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/qfprom.xml           (    600 bytes, from 2022-03-08 17:40:42)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/hdmi/hdmi.xml             (  42350 bytes, from 2022-09-20 17:45:56)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/edp/edp.xml               (  10416 bytes, from 2022-03-08 17:40:42)
+- msm.xml                 (    802 bytes, from 2024-02-26 02:06:53)
+- freedreno_copyright.xml (   1572 bytes, from 2024-02-26 02:05:48)
+- mdp4.xml                (  20908 bytes, from 2024-02-26 02:05:48)
+- mdp_common.xml          (   3056 bytes, from 2024-02-26 02:05:48)
+- mdp5.xml                (  37457 bytes, from 2024-02-26 02:05:48)
+- dsi.xml                 (  18864 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm_8960.xml   (   4935 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_28nm.xml        (   7004 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_20nm.xml        (   3712 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_14nm.xml        (   5381 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_10nm.xml        (   4499 bytes, from 2024-02-26 02:05:48)
+- dsi_phy_7nm.xml         (  11007 bytes, from 2024-02-26 02:05:48)
+- sfpb.xml                (    602 bytes, from 2024-02-26 02:05:48)
+- hdmi.xml                (  44030 bytes, from 2024-02-26 02:05:48)
+- edp.xml                 (  10416 bytes, from 2024-02-26 02:05:48)
 
-Copyright (C) 2013-2022 by the following authors:
+Copyright (C) 2013-2024 by the following authors:
 - Rob Clark <robdclark@gmail.com> (robclark)
 - Ilia Mirkin <imirkin@alum.mit.edu> (imirkin)
 

-- 
2.39.2

