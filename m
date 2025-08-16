Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F93B28EF8
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 17:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5602D10E39C;
	Sat, 16 Aug 2025 15:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EvINhH8F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F7410E39C
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:56 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G4ervd008852
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TbQAYOijnA+OwP4fT62BQ14vH/cW4cuE/yCXav6j8bE=; b=EvINhH8F0hgbF8KM
 5qk0gSsN+3bHotJ0bJ5hK3CMF8K0NLv7uptGLSKcto7vUYnGwAKmSQgBvWRUJ530
 zrn7TwACfuYdmzEHkRLcUKQkQWBmB5Ep2aAl9+Oy9nuJ/AatZtTcYu/ViiCwtxuR
 PYwDNh37DiJU5wsPg5xKCQ7Cyn+xnya8NCqciVIcKofiLTChW33HqTHmqeWshUTh
 VlQlQnZpBKWwnIAs/UmQs/Dj427ekhyYyki8cFirsYcHxjcCzzJar9yzhbrT3BFh
 HPaXdgh9AxeBzDJQWhVa0mq6VM+NCE2XHj5eBZA6SqNBbu5i1U2Q5t8PKdjUYc/D
 FW0sAg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjc7rt0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a9289280dso61135436d6.2
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 08:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755357594; x=1755962394;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TbQAYOijnA+OwP4fT62BQ14vH/cW4cuE/yCXav6j8bE=;
 b=FZqOLMB8ICwa94URxpYmLX2kU39Jr14rjzN5KiNzEozWiUHCdUNBPZYBMionzzxg3n
 JWXvu/tRxrPCzRdKvlG/NRWbtueFjntrIxo7ts1IRiishnnCtMK1V4ZOMXee3cJexPpZ
 71umQRm+K4cI63SeIGG94U9YV6Uc4uiYuvcexldiK9YIV3q9TK198+7cDr8n4YO5ECcZ
 z1GalS5emYQuYh/+5bqXufQPkWVKOn91E49NPSE+I8MlpqcDnGLnNZefRRJt1P3Q5o2B
 yPZZOjzHasqYHsFfg7lS3WaG+PiU0snWVDae/O8P9KeJR8cyUpN59PxhTUm76Vynv474
 hoQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW4UIk6mOYlXdRI03RctSFQ8hhzQiFmufz7A+ibVOxJqJcaAy/J9s/IkFW7ZUauuo99CpHe9hkVqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyataZcuaL0j6CSFD94IgKTCki5ga6Z96YTY+9Vp4v8zO51Wvjf
 vwp7qaySoqrR5lw/2GrYD4F7VYZrVacabMirJWp5OFeq2kVrtdYcQvxDEnRG3XUMaJ08fjBisXY
 +21V9KMiEJ4wH0YD1Iflih4Epw5Ex346v5IvdGvMa/hgTLOlPKmLOMBp4AW7fV0bMXRP/GdY=
X-Gm-Gg: ASbGncuG+j4frLQqWRgs1SrWYoZcCURGcB5M0qV6vOM3xp1EJcaANAn3LK89MMYr5Ey
 AnWOaLlDrCtjO9jMp5rqePf9b8jqerKgZvNhY0vFGZcbV4nu1dQdHvvARL7ueDpazrMxThRLrfC
 aPjAef+nXNC5+6LbmlW8PiKgb1su7whoCVMcFOiFoqU58rpa1pYErqAP2ZlCxau+qndjthcN+47
 h3zuiipFloFDNVFIwfeoeDyXF+Svm6aqmXd56mVq5d8IpLn4uoFAnpv406rl5EtT2+48KQzSh11
 b/2c9f3CGmFOfkEd7Si9Ko6LEG9F0TArGDb+IZdQnAcj3uGc4kwsaHYjGYqO7O11i4dzpS2XI6y
 9RLOuF8e0zPuKM9zcegdYRx8cmqXhTvJX/w5QHe1/svXejKAtkmCC
X-Received: by 2002:a05:6214:ac7:b0:709:b92d:e84 with SMTP id
 6a1803df08f44-70ba7ae80c1mr81199496d6.16.1755357594456; 
 Sat, 16 Aug 2025 08:19:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHhdLfF+QII0ufvMc+c1Td2k4+GoblWcwEEncKFspxyk5vAWtgqLRyB8GatC2wFnN2BRckcQ==
X-Received: by 2002:a05:6214:ac7:b0:709:b92d:e84 with SMTP id
 6a1803df08f44-70ba7ae80c1mr81199036d6.16.1755357593955; 
 Sat, 16 Aug 2025 08:19:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 08:19:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 18:19:42 +0300
Subject: [PATCH v2 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-wb-drop-encoder-v2-8-f951de04f4f9@oss.qualcomm.com>
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3126;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AaZVjuS1W7Ukw+8AzT9N6e3I54ede+nAI+GfJJ8GCnM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooKGJYpPrdEi6HVTifOyYs/TwBkaE/wZcLttBb
 dHmFyn9qPuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKChiQAKCRCLPIo+Aiko
 1TpWB/9pVqcOdq3X6uUsOd6BlW9YVLDGMvNAlGtBquoyjHsI9eErZLJKu29rJ6TztxyiQ7q0i08
 jhfNJ0QGtJnijOlndgpf3L5upqul+kGrj0NtrEGWUc/DMB313lePVT/6AJ8Fn66/y5F0U2K2YJh
 sYeO5+KMWvj9ZGirQtyaJLtDZ7j1P8NgMByPHWub7osZupbOECo9VtFnKoFtsTWB4xtp0xLRgpY
 fyrmP1520fajz+ht3NawHqe1d20Hr4uhoGwn/W+joxOzUYs40p5yAbDA40ZbsclFKknpadmDD8u
 bvigSvNbXvi1tsVzPhQYUP5PmRjL/8RPxzLmdvUFBcq5talE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX4N1/v2N7V8Ct
 2YRWt/FRKieBCuUaiYOjwSSOh3kZFulU5Mt4dcpcMa2U+Bg49EcWvhz6l0Bk5wMSt0Pyfx6uprA
 ATDwDcU4mcHR2IWhSNwPZwFGpT33d6DfDXKj6HYTIffQ0c/LrdvFossZ9IevE8U8gvQ6E1jSfYQ
 eBFEDeoj8PYWEcYW9hn0G2xFUXRs0iKNVGm5A9wYkR4E4XW/W5gAHrjpnLzIfDlKNwl+zexwIuV
 ZC/cr6UzdKSFA2cAw+Mb6YAk0EpDseuS8kOp34q3qpcGPv85wDe3ZrvuTaJESC4wI84YBp09VMg
 cnNOyJIb61I6nlRLpBpjy+T0+JlA/e+klgS/dTbaq5+ROt7Fq6xpsbm7ApzYj8Ab6WDOeRO5Kzy
 eJLf3qC2
X-Authority-Analysis: v=2.4 cv=c4mrQQ9l c=1 sm=1 tr=0 ts=68a0a19b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=yAS5wIYi4md-6cvEWsUA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: WMeCg9Qd6NVMTB2-4zxilBJlg999hlPK
X-Proofpoint-ORIG-GUID: WMeCg9Qd6NVMTB2-4zxilBJlg999hlPK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160033
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

Rename drm_writeback_connector_init_with_encoder() to
drm_writeback_connector_init() and adapt its interface to follow
drmm_writeback_connector_init().

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 14 +++++++-------
 include/drm/drm_writeback.h     | 10 +++++-----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 1a01df91b2c5868e158d489b782f4c57c61a272c..ec2575c4c21b7449707b0595322e2202a0cf9865 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -235,7 +235,7 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
 }
 
 /**
- * drm_writeback_connector_init_with_encoder - Initialize a writeback connector with
+ * drm_writeback_connector_init - Initialize a writeback connector with
  * a custom encoder
  *
  * @dev: DRM device
@@ -263,11 +263,11 @@ static int __drm_writeback_connector_init(struct drm_device *dev,
  *
  * Returns: 0 on success, or a negative error code
  */
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-					      struct drm_writeback_connector *wb_connector,
-					      struct drm_encoder *enc,
-					      const struct drm_connector_funcs *con_funcs,
-					      const u32 *formats, int n_formats)
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats)
 {
 	struct drm_connector *connector = &wb_connector->base;
 	int ret;
@@ -284,7 +284,7 @@ int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
+EXPORT_SYMBOL(drm_writeback_connector_init);
 
 /**
  * drm_writeback_connector_cleanup - Cleanup the writeback connector
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index 879ca103320cc225ffb3687419088361315535fc..958466a05e604b387722610fc11f9e841316d21b 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -137,11 +137,11 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
-				struct drm_writeback_connector *wb_connector,
-				struct drm_encoder *enc,
-				const struct drm_connector_funcs *con_funcs, const u32 *formats,
-				int n_formats);
+int drm_writeback_connector_init(struct drm_device *dev,
+				 struct drm_writeback_connector *wb_connector,
+				 const struct drm_connector_funcs *con_funcs,
+				 struct drm_encoder *enc,
+				 const u32 *formats, int n_formats);
 
 int drmm_writeback_connector_init(struct drm_device *dev,
 				  struct drm_writeback_connector *wb_connector,

-- 
2.47.2

