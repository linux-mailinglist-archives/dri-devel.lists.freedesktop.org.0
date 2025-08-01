Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3075B182D3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 15:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C68610E86C;
	Fri,  1 Aug 2025 13:51:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eXVQ9LVF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7023A10E876
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 13:51:31 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5719CKkc020313
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 13:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /+B92RCJ6sUHTgOKCSTnvICSpksHijR6GnMpjqqV4BE=; b=eXVQ9LVFhvEmF8lP
 p9sioUtRWNt9qlqVfwKTdPd1dZALSuCSCvuZW72ZEejYAPH5sWUFPxZdU4BkUHY6
 R/8s63SNsGc607WfI7Cd2xNxJYTgezciEz7y1mc6Ne+7LgSYkC59/ssXEcgOShbc
 kRZKCH/4jd4WbuTIdT4Gy0mFisGvULyws82hWZ2gWBevfGFN7msYcdVI1ZS9EMUU
 /Z/L70BgzcNyrTIsgpte9+9Do3S/Xvewaot3JKueUJjFszQxfsCwoUHbQ468TZB1
 dvk90tLfShZfp5ruHToipUTTXme5/zz/XdnyGXhwvVVj3A7Pwxwp3YC34lf0pdVm
 4/xV/g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1auw45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 13:51:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e68bc0408bso100593485a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 06:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754056290; x=1754661090;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/+B92RCJ6sUHTgOKCSTnvICSpksHijR6GnMpjqqV4BE=;
 b=wU6l4sl314PnWHAOtOq388m2dCwnE7JtaCpDpdjR15zWguBhg3D+0eLMk1/joRZOSm
 RHVt5fCnaggOskpAdthhXaZvrrYtMHS4mA6yxPWRqAPT5l6F2N/ARAP36PVt8BkQ+GR4
 +NOy67HP2INPHaFaZk/7ApRvws4IcrWVKcsc28EHAJXzgAudnW5WuqZy+R0hwo+Q3G0d
 aDqXJOr9Q7kbCGGyX8C/HNaLixRue0EW4Ggae4QhqyaXjniXKn1oazPE3H+6IHe/pypG
 ouYDYpVxo4akyiChDIElEN19Il+EDuDDlTE4v2/h1xnbywqKF6kNcBtKkLL0wWp8rXUh
 Gxgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlsVQqris3u4TqYPZpVFx93ae5WMehU8iSsg6GxzejRMHa1uXMWQ/X09cOSfLoV0B6Zp/Vja9yoXQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVRyHomHyGlT/9tQKUQ5kX4oHamfaayKBXjVGClKkyGg6HLImy
 L7FsJgnk+lAjEs3vrFpwTeOgGvTpE/cpZdm9YeT3xqlc50NvnaRJTbh85LP0WDoKrWsArzPQz9S
 gZqcA2WkYGFannVAp2+C3F8XcNz4CuMv3QVhjOqIOU3im1dwj6z7sXYaCK1eRgxuueXxaa3k=
X-Gm-Gg: ASbGncuXfzc9EUPe+l6lwA5gR0ADWtXXg3dP0//Lxz2n4cX3iyBOEqGl/r1hMJyR3Z0
 /td6lUDcWySoGRuuLJXOlYx8ZUFuB6oukaeBbQrzu+cnjRdMVA5rE1sGddUZnGhQAUCt3lRibU5
 gpULKM7pdjJg5qq3J6vevIh5lezqYuOFyJPZdJ3edQg3UIP+kNBaTJo+26ThbbiEIDe4coigGJE
 7oIkYe7rZqfoTcWwyP9hZcLB0H9ciStwd/UpMD9ECca+CCsJh/UhX1Bct8P9iL2wogDL2xb/nhI
 KMmK7dxI1ftbr+wVnVsYBFwzeLjqsqv8S6qdJjZAtB0xCwV2Daqe47uqD4G8VocNeqpkY1qzcsF
 Clf9HAZjHYDJn0zv3lyjCV0ZDkOHW5VB4a+grJF4b8itRCA9yMGqH
X-Received: by 2002:a05:622a:a20a:b0:4af:c21:41b1 with SMTP id
 d75a77b69052e-4af0c214570mr6065261cf.55.1754056289654; 
 Fri, 01 Aug 2025 06:51:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbygvQYA6zDq+LhVmG3CR/4GN/47/XqDWnOK52WBf4RbtBM6/jIq15Eol7L7jNRSofKyA/8A==
X-Received: by 2002:a05:622a:a20a:b0:4af:c21:41b1 with SMTP id
 d75a77b69052e-4af0c214570mr6064831cf.55.1754056289082; 
 Fri, 01 Aug 2025 06:51:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 06:51:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:16 +0300
Subject: [PATCH 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-8-824646042f7d@oss.qualcomm.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
In-Reply-To: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3016;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pqburrqLe4QINUtvUHnD5bh/z2B1X5GNCfeW27TyBDU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0bPsZDobW4vfKRTTQ7I9IreLqleOCt7nltN8yGzxgf5O
 5s8egU6GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRC/rs/4z+eBz0TL8iMp9x
 23dr/dQ1Qe+samT3Pm8yl4y0nTyTneN5y1e1HP+LUzWNVyv+fP3yw47Ygqk7Ou8KBvubXv/Z+ml
 v6wkr1itul793iittLc1Tu/GGfXu7OrvKnYlPZldYVMr+u7XGR1zk4Kdk5R3r3i04My1iUb1tpe
 al6ZesUs2YWnZ913bV2Ht0+8fsj2yFrhqx1Yq7uRgU6hb8DGpoC7ygm9C57ENL87bC+itts3SfT
 V7+Qe5sIteVwprDjHtjy//v3cXwTWnjW530O8VerTGKwX8P9fW/3xkWmH/WUDaWM25a/fba0ozp
 +QyFjHOYhBljH9fvkjvlXJ7d6jF3q9kRH6/lpiqmoY+4AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Ny-ZLnLGgt0mkUXcpyMkwx7hIpK9JetR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX5ZOiwqxXUB+w
 1V0edq7+npFeBoCKRbHe53TQudXNdw/1SxbWfG/kQf2x/JcU4f0t77gA5YxCmJXMCIJAoqhtdr3
 KkGigWdLVRRMwfOvfOM4InJWI1gmWUZDiPfmJqZgEw35fRYN8ErFws9HK9uIvy/uh9IA4xMnLgl
 iqStzmQuPBNgQo2bZUtuGHXGRqTqvbtQs+OEOwiGyyZKQiYFzPniVS2LSf2BeD3EDsVvbKW80tG
 P89JR2uR/mqrzgb2KbOyh+rmsN/MBYGCoHYNOKJ84UWmWzfvTCQ0YED8MlXUNHR5iPWu/VQyn5O
 Pk/yb+Y2YMYddBI/u13h9NJ5EcyuytP1hAxEfpuemLlzZ2zb15AhG/kjfZ2YR+Jxaq+2a8FtaNP
 vCtphxECECIa35P7ccl/VoOc41RJt6bGqwyZkcBAMtGj1Cpq7+Ete+Tka9n5p+O1un9CA4Nn
X-Proofpoint-GUID: Ny-ZLnLGgt0mkUXcpyMkwx7hIpK9JetR
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688cc662 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=By2WwYRBACVvdXAjiroA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010105
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
2.39.5

