Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441C3CE541E
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 18:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BA11133B6;
	Sun, 28 Dec 2025 17:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fCe7uPA3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQZp/HU2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4EE11B07A
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:58 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSBK2jf1937941
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b9ETFH4qFVnd8+4vgMuarPmX3yRsMvDDnuUweRJUeYM=; b=fCe7uPA3Xkqmh1sr
 GK1R8fNjyEDbYn9uNvNzUBt10Mwwm4f85c+JJXolwuUPIOQQ9wOm3beWQ+mWllFz
 ReuyK8p2ew7oCfzP2vXlsqxStD0d2b8tzAuyhNfhdPOPfcirIgHYP1kgFelh20G/
 0+BLd2+5syRlaBKo0mRDyjaF3XlXNF4AE0kSnAolY9bOp+sm3VTFKO3/F9MtdoZa
 lMinfMZmaAcbPKid89XdkcDNOVuFE15xoFJTK78dj35mbMfaVfBPLphbNA0Xvglg
 1lvLpsATW1yMPf7YL2Tcs/ez1RKXEM3Zlk3ZDFaQrEup02/QVVaaomfQswGkkVM9
 vjEGyg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tntpay-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88a3a4af701so232428816d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 09:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766942517; x=1767547317;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=b9ETFH4qFVnd8+4vgMuarPmX3yRsMvDDnuUweRJUeYM=;
 b=RQZp/HU29Y0Ip2qI/dqL+U6+ooHZF44qCKGKN9iczdMq6rL1U4po+LfPV0H5gcWlEw
 AnOn5TT9GnGnhGS/+2maH2m3CZI0eH0ckWj32imf9vkiwR31mEpmwAd33aLP9KV6uT8w
 RwAn6lbPB5LdWUXER2UAfsL0gEXtYc9PHBGOlvzN0zYWeX47c3WVpVaJyUbJ+2W46QLe
 dRCLjEi2wXsTqgy6+RwwrIj4u7uyWbles1XFBttHzB4h9c7qv7yiQLaHOUuMdYp5U1Jf
 59JQhZUVOwVcC4JxOLraQCRXT/ia0/sod/aXvzHgC0okjy9RoGQ86oNBcxGDAtVppFDP
 eUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766942517; x=1767547317;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=b9ETFH4qFVnd8+4vgMuarPmX3yRsMvDDnuUweRJUeYM=;
 b=FIn+VyOEE+I1HHrbq2FeUQ0y8Q2aulrJYiYMLF7bpios+MaU4XvXYRo6bbYGL0dBOY
 tZOifxw8i6dPT1Vbk6YhXmOAL2Kz8QjbGuyEWq7qM5xQBR8YTXSDAokAqgJKigc0y9vG
 gJPiVAflys0/ikX0cul4tv9d/c3zp1u3WGUcMep2PFTE0czXSFImHShi/C+YVcyIrQLS
 tY8F0y7WGAKONWFQeaigqiJgj783jYdNpmoKgCZLx1F+y0bISv2LJEPiCz1KDEKGXUmH
 lltEM6xhLkZh8oANdr/Lk6+PjcaTSkz5+5TaZpChAuPbCoKzr1ItpFE9T0rXv6J20tpn
 wn8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0aczYEZ72gIKkpw2WVTqocK35J4wg1vI0EIAzCqTsa1ibppOwHfRLTKVu8aCcsLwoBieE8MltLks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwijZtJ6VwPkeceT/E+REpKBSnWMpm5NobqUhfitSoyUlhujn1Z
 /og5au4PxDqVvLilZNrBB8Do/PAqXrSmlN0w8rojznajYb3/PwndCcuLp5RtDjhLBcQDaP1YUnw
 TeJNMkp2A9CxADiqFMSI7cIwj+Kmvf0hysskOm6JgptuaB/KEazKozcBuWEhGfMI57v13ICQ=
X-Gm-Gg: AY/fxX7lqJBr+jzWE04Kb6f6GphRfaOcru2dHBzpZqg7pojUNdCJVcwja2vbfZVSBrH
 wnwD+M5W6lXyqUvrBdmAlUAc0nXQLeHvSWWo3485bv8zodDFEUciGzkelPBo2lbB5w65CAQZB1T
 lPLphW59wmo71qiqO1QhyUKotsVYGsn6xK5/MwawDVA1WJcNbmtyqq565Y40fR50mIWI5mD4lJw
 AaGq4aRw/+JfmmokEcUjBgnp1Kbx1idKxaosaqI5mQk5iNcsM8Jb32SHpgTcq67yOuw68pLuu+H
 I5W2oZ44D1s/rx98wcoHat7FGE26Y22ABcMGdN9GdTDT+heiA5z4hfHmanQTYr+Y5eZJ80CXnQK
 CSAE3JGVSdczu7r+1HnqZkZpigtnMYWIMDPUtNLIytZYaFvslhpcG/u3Zw9b1QuDsx65x2ph+NY
 1agzdW4Bl3+Nw0r10hq4CILqE=
X-Received: by 2002:a05:6214:62e:b0:880:4eac:8689 with SMTP id
 6a1803df08f44-8901a046480mr56329746d6.57.1766942516731; 
 Sun, 28 Dec 2025 09:21:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGB8qEu1RTRfneqwLmQfLZtXdWTJwcJICHquzn4/JCVt3C/Ojms0Lzrm+TZNYbI+Vc4LxRkpw==
X-Received: by 2002:a05:6214:62e:b0:880:4eac:8689 with SMTP id
 6a1803df08f44-8901a046480mr56329426d6.57.1766942516229; 
 Sun, 28 Dec 2025 09:21:56 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 09:21:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:40 +0200
Subject: [PATCH v4 8/8] drm: writeback: rename
 drm_writeback_connector_init_with_encoder()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-8-58d28e668901@oss.qualcomm.com>
References: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
In-Reply-To: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
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
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3014;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=90ODFHe66Nfjl7yi87n5IICLXsZ4owytXCS3KVu4EDE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUWcj9BzTRYnVcWpH+HOdUmVZsP41SRvbgNf65
 r1tUWUIDeuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVFnIwAKCRCLPIo+Aiko
 1aRnB/44LaHrh0nL9t+l8Vm6jhnLOGva6JBnRavBIlXxZ9z4WE23lIX3WiEyrT7KyQ8m4e+qphJ
 2shMVOTKNp4d6IxIslu0RPfEZCcVynOUm+haZoWH0fbul6FKjHsfixttxMmhSBgniCaDpLn2Brm
 uf8MWBCmTndEK8JE5W+piAGszU88bTKxCU4YYh/eOFEb+LYAvwddqnzNk+FhaK6TL7s8H2t8cFq
 Sabt4YABaMeoD9UxOrjRnVuHwPET5x8fysxDQxsl/kF3qxqjF0D/Oac/p0bhLm4UPMCacwKdezp
 mnSB6VzLqdlVyoSSju677WRGgUmJZV98vHj3hVcEValfOlVq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=69516735 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=By2WwYRBACVvdXAjiroA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: UulUHGRlfABO7Qnm2m5FdCIoyUD4qI41
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX15TuRegxILqo
 4Q6p2JHNtDTMgUsSsnz+ZBE+Ko8+In47Z1vVNdHAAVoRyTfKYOiUWy9sE58tjTEZ9e8WJP7esYW
 h56xbEZULo6rzwPa8ssfnQYOoZlHyYK7CfNAD0yP90g2Lkb8kZ0sTsaT9buJuSLv/7B29VSDDrM
 YTMS9vQA6UXw2/5zgZ6BTuu0XMNrp8UThxiVLRgSN0TEADN473CI06wUX0rPFQYXcjPqvXmhAfL
 3EimTGuZr54dj7TjYg4A9uVpURFlEg3Os5AciMOe2mvlTK4VfOnmP6Nf3Q68EM3+LlvrbzkbXQ6
 eY0eq65aXvtFvnJLJKm1qhU2Xjg68hE0Ipk/4X5vpIkB7n83TGQ00hphM3UWEAxBoPvdPlEaSec
 U1cVy85rLcsVrroMtfw2c2UX9KXG4ALPPE0oB0czJTQRyMn9LwkfLgRXQfvetb0LbVMV3/Qe8IC
 DkfXT+KReUWqsfEgdlQ==
X-Proofpoint-ORIG-GUID: UulUHGRlfABO7Qnm2m5FdCIoyUD4qI41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280159
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
index 1a01df91b2c5..ec2575c4c21b 100644
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
index 879ca103320c..958466a05e60 100644
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
2.47.3

