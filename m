Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B4B2CDFE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 22:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45A310E676;
	Tue, 19 Aug 2025 20:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQ4lk0PG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CA910E67A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JGxHcE023007
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TbQAYOijnA+OwP4fT62BQ14vH/cW4cuE/yCXav6j8bE=; b=NQ4lk0PGxH9zd8rS
 jQMLEIbBuOnP0bMp7r3njdORq03oP3sTV3HCagJVJCbqP7OPz9Vk2GGnWiVxAXw9
 X5RfFksrq0jtW2+PL8/T156XPpdQp4H1t1uWJjVP0j2JFMQO136CABxChaHZjYru
 RlXTZK/9LEr8KeA9setcBZLtpZvWQ9Ueoa673eBekunJg8qUWpdGXNDNOtAoMxGZ
 1Cpb+jSHIpavEW5rmkcxF9DoOyMu1h4RFsVb4zxMx5pDjMqNLaXFk+9OHrrNwcUx
 NnToL0Fq8qU80z5Mwe3FqYeRdd1dCdIe+TLaT1y403w31broLxqqwfGje6OrW1Hk
 EgTaYA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48mca5kmhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70ba7aa11c2so96662176d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755635597; x=1756240397;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TbQAYOijnA+OwP4fT62BQ14vH/cW4cuE/yCXav6j8bE=;
 b=ao+c6z9qeghzAs66R4WgT81LOF9KyDvHWBtQKr6wO3bPyhUB7Q6HdZUx/Ye47N24nj
 wzypoNGD3SnIXKGHT9mDvOiybDRsSLylZwLgkqyHvjTjmHhZiZL6vXS5xDHUskE7cbhe
 1HOhE9sHckinh5lykPcGY0gL7WsIXwjpgdk+79LQ8eJ22AkxcxUOzMP3ZL2IawhPbARY
 w7+7IKlHvuCFDJUJE3pX+AYiuw6AsMObmZ0ZiJUIHUOeRgR59pnVGBjAIRLPY6XsJJCB
 02i66PRe6OQRPk9CQA4n2Md4oWuuvbpDPCcQA5numjFyDGTqzwRkOnOK1pJekHHZLSTZ
 FdKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEwL+76zDduTG67BHMigc/y02zS62xzna/f/41F2YaVQg7IZqJOyvicYdJNj3bVYj6I5FhonJHX3U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8ayjk0Er9Bh0MlXw+g4sQx6oc5YbHz81AvC5+V2Ew6TYUNh2u
 wiwULtlUSi/oCAmNCddJRg69EfkpB7nrt5vkjj6dQlJ0JpRc9PkADCX0Xrcj07UqmDhvoXu0+h8
 cALTfICiuxRpmUpxchydXkwIrIjtypmqAzrxpXjA+U1NZJU1Ayk9Qu0uFXCCe9+XEkblKRb8=
X-Gm-Gg: ASbGnctfD4gj2smbuCKg+dQewvBBjOjeJ9Bw9UcQFKVg9GclTyRCJI/D7wlR0DCvVjq
 EbMaJJ4SlKQFdW2H85zgGUIqIBUmYfdYxOc+nLzVvst/1wRLTAX+hfYbjYi+OC8+XkzE/SXqw/R
 TaufHhnpfiArOC9OuvkKFq+pVVTmP6iR8tKQSls53T8b+ZX4kf1+yU8iNSKXp+Y7QwtM5CmddXT
 H9Mv9UzvfwohH+0XGIls8K1AW7SISCLI+7A/XLbcBWGxuKFPxrTQP5lkRPDxNWC93JvhIRE0H04
 tn11lmK0fi8BOeyHUwEXiX4iVDNyST6viVY9CwoX2deeMuIl2OpuMMR/yObLv9ydHsKyWuC2og+
 GhdCk7pjZgI2m7MkXGMgZM4sfIbbXNbCEEPU0J6a0B2gYclwaTXxU
X-Received: by 2002:a05:6214:5086:b0:709:b691:c9b3 with SMTP id
 6a1803df08f44-70d76fb432bmr3783986d6.21.1755635596495; 
 Tue, 19 Aug 2025 13:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCD6S7de5XOrwmykrvu3dZltJcf+eQjH0NdzU2XfVwlV04v3hGebHiPXpwj+mmyQIUx9Iqew==
X-Received: by 2002:a05:6214:5086:b0:709:b691:c9b3 with SMTP id
 6a1803df08f44-70d76fb432bmr3783376d6.21.1755635595810; 
 Tue, 19 Aug 2025 13:33:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 13:33:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:33:02 +0300
Subject: [PATCH v3 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-8-b48a6af7903b@oss.qualcomm.com>
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
In-Reply-To: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN99dm6iqCmd2YJ7ZHRhkVfYmgs7Ag8kc737G
 sg2F0T336GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTffQAKCRCLPIo+Aiko
 1TZgB/0SmKnqbM0pHSATUnozt7o8QQGkCCESrW2V+DReBipmXfhrvcZS4AJQh24WpEQYL9nol/c
 ebxClJrvV1du0OGYX5iNJzyxgk7XmdDpAqG6QI6xjv23Wp9Mk49FZqWe5f2jqb+DpySqmz5wQvm
 WQQrRRUHvKQqWfz3SQV/PEd2/8R4fTf8t0t4Zd3aBLTwVbp+2YYede7DU6arrfJhv3FSXsH0j73
 DFlDjkj8wseSw79ynmOGSQrLv3XU75F3GfOBSZ6tw/V9uroFRBeDs2C2d8wSENzcp12l35llhYW
 NphipNhW9G2yKJehjLOfbVta9tJt3XVL9mdTv2lg2+L63IFJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=FdU3xI+6 c=1 sm=1 tr=0 ts=68a4df8e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=yAS5wIYi4md-6cvEWsUA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: wXASKAxe5j9qIRzLsh-W9CjC3CyjOvMr
X-Proofpoint-GUID: wXASKAxe5j9qIRzLsh-W9CjC3CyjOvMr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDIwMiBTYWx0ZWRfX2XUEV8ifCs9Q
 v3VH/BE6IEhV6PXJCXtk1bMTAfTJwV0efhrJfZ5M+96Svag28TivdMQEB/K10WeM9RdcL8iC5tz
 lys39tNiELmLo28ORBjiTQIOFSwIjjpPzRSCCrAPvAcrBCeBpcPzRj2qg8gT5SsHY87+XQ63Jhc
 ThV9+r0sD7t1hLAJEx63kmVV2F4a4d9GYQIVrQz2YDEtzU5VLR26pKL7dLU5Yx42lBboxBKvYqg
 zF4sveudbxDXJE+HQlg6wfwnfs0jCmOimOKyCPLb2odI1VCkmNwF2QeYZcJoN+H0z6gvfTyCfRb
 uG0O75II2NhTXq8VD9+DwdsrTHAPsGjF5hpObwMip1UF9YUoW8jbxzkXlw9Z8C3h0A3IFzS3lI+
 i/cs+ko4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180202
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

